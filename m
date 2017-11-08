Received: by 10.223.150.237 with SMTP id u100csp1111085wrb;
        Wed, 8 Nov 2017 02:34:35 -0800 (PST)
X-Google-Smtp-Source: ABhQp+RMR8xL3xBwJdD5vqCWbZh2EmU0kFGfSRFZVn3OR495mjADUgcIREtL4rlKhhI1TQGKizQb
X-Received: by 10.202.6.193 with SMTP id 184mr2165oig.403.1510137275311;
        Wed, 08 Nov 2017 02:34:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510137275; cv=none;
        d=google.com; s=arc-20160816;
        b=cecDMZ+kl4AfwUyFNcj+bF7eb/gcl+Vskv+9zDaSlrIqu3WjWv+pND9ChFohmDWQ02
         ofXhW8+4DTfGIseg0Y9hrRRwfG57L7ae4ADDQO6qvg2p35O3HJ2RN+RC+YFK0YGf4lPc
         6TS40BzXGvcluyI3zBhaajZ+v/MtpFCTaYTzUZDvEEX3CYQZI+3Hp9rlXVB6xiqnAlp3
         nHp09M54CXyldQXHnwZ7qDIzUSom9knxSq0Qw1/HAjAegx9HX2RTrwhBQ7opL6aAmqAT
         KOn+SMdRlP0EcNN91o2x361KesIor9jwZNMEZUF12nBUfKpNxS72UbeZgBqdKXBYd5Cc
         TqWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:arc-authentication-results;
        bh=UlVCZ7reGoA/faP8Jtw+Iz6o5RU6bvAlY8BjDWfwmNU=;
        b=o0rQKWsEWGYVCWUPZK/o2IwDLGuSS0Z9Xo4Dwhd4E0Gy+rfHXKexG34JYtZp1OYkwY
         40tDccChiQ2PHHSraaLHKn1IAM0R+I7aO9ukPgTYRU5vs9bOLkgEhZN7KXJvu6/MshQx
         NbJGedU1AJXKczIHazSwPEBUFLWOmjooJjXVrZaopqAuXb9SoBrEisb8z3DbizZu0kwu
         +dZf+v2diQRumODd6qJYWx77yqaQLfd+DLDY0iqu98dLqo391dCilNGLuQ0YnnqHOzZ7
         XHGQ7yjqqL0y3CB7zAZrnW+YoLnt9W6uFKLdnXU1KIcgAO/eLHKw26oRW0HjkBvi6zmf
         +YMA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of dave.martin@arm.com designates 217.140.101.70 as permitted sender) smtp.mailfrom=Dave.Martin@arm.com
Return-Path: <Dave.Martin@arm.com>
Received: from foss.arm.com (foss.arm.com. [217.140.101.70])
        by mx.google.com with ESMTP id n188si1764645oig.337.2017.11.08.02.34.35;
        Wed, 08 Nov 2017 02:34:35 -0800 (PST)
Received-SPF: pass (google.com: domain of dave.martin@arm.com designates 217.140.101.70 as permitted sender) client-ip=217.140.101.70;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of dave.martin@arm.com designates 217.140.101.70 as permitted sender) smtp.mailfrom=Dave.Martin@arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BEE2414;
	Wed,  8 Nov 2017 02:34:34 -0800 (PST)
Received: from e103592.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.72.51.249])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D1A0A3F3DF;
	Wed,  8 Nov 2017 02:34:33 -0800 (PST)
Date: Wed, 8 Nov 2017 10:34:24 +0000
From: Dave Martin <Dave.Martin@arm.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Subject: Re: [RISU PATCH 06/10] configure: support CPPFLAGS
Message-ID: <20171108103416.GA8971@e103592.cambridge.arm.com>
References: <20171107150558.22131-1-alex.bennee@linaro.org>
 <20171107150558.22131-7-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20171107150558.22131-7-alex.bennee@linaro.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TUID: TTNYciRENQXK

On Tue, Nov 07, 2017 at 03:05:54PM +0000, Alex Bennée wrote:
> Useful for accessing API's that are still brewing, e.g:
> 
>   CROSS_PREFIX=aarch64-linux-gnu- \
>     CPPFLAGS=-I/home/alex/lsrc/qemu/risu.git/sve-headers/include \
>     ../configure
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  README    | 6 ++++++
>  configure | 1 +
>  2 files changed, 7 insertions(+)
> 
> diff --git a/README b/README
> index 9946e6e..fbe408d 100644
> --- a/README
> +++ b/README
> @@ -26,6 +26,12 @@ Most useful is
>     need this if you're not building on the target system
>     (Example: CROSS_PREFIX=arm-linux-gnueabihf- )
>  
> +Another useful flag is
> + CPPFLAGS= which specified pre-processor flags, usually -I statements
> +   for specifying extra include paths. Use this is you need something

s/is/if/

> +   from new kernel headers not installed on your system.
> +   (Example: CPPFLAGS=-I/path/to/sve-kernel-headers/include)
> +

You should probably point out that the path should refer to headers
installed by running 'make headers_install' in the Linux source.  This
means we really test the uapi headers properly, and I don't get spurious
bug reports about bad headers ;)

[...]

Cheers
---Dave
