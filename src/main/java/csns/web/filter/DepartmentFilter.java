/*
 * This file is part of the CSNetwork Services (CSNS) project.
 * 
 * Copyright 2012, Chengyu Sun (csun@calstatela.edu).
 * 
 * CSNS is free software: you can redistribute it and/or modify it under the
 * terms of the GNU Affero General Public License as published by the Free
 * Software Foundation, either version 3 of the License, or (at your option)
 * any later version.
 * 
 * CSNS is distributed in the hope that it will be useful, but WITHOUT ANY
 * WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Affero General Public License for
 * more details.
 * 
 * You should have received a copy of the GNU Affero General Public License
 * along with CSNS. If not, see http://www.gnu.org/licenses/agpl.html.
 */
package csns.web.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;
import org.springframework.web.util.WebUtils;

@Component
public class DepartmentFilter extends OncePerRequestFilter {

    @Override
    protected void doFilterInternal( HttpServletRequest request,
        HttpServletResponse response, FilterChain filterChain )
        throws ServletException, IOException
    {
        String contextPath = request.getContextPath();
        String path = request.getRequestURI().substring( contextPath.length() );
        logger.debug( path );

        if( path.startsWith( "/department/" ) )
        {
            int beginIndex = "/department/".length();
            int endIndex = path.indexOf( "/", beginIndex );
            String dept = path.substring( beginIndex, endIndex );
            request.setAttribute( "dept", dept );
            logger.debug( "dept=" + dept );
        }
        else
        {
            Cookie cookie = WebUtils.getCookie( request, "default-dept" );
            if( cookie != null )
            {
                request.setAttribute( "dept", cookie.getValue() );
                logger.debug( "default-dept=" + cookie.getValue() );
            }
        }

        filterChain.doFilter( request, response );
    }

}
