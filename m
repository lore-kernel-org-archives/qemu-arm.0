Received: by 10.223.150.237 with SMTP id u100csp1145001wrb;
        Wed, 8 Nov 2017 03:12:20 -0800 (PST)
X-Google-Smtp-Source: ABhQp+QtbueOQr+BCEpZDgiUK500zij5IT5I5Hhvx1Mg5KJeMoPta3fit0OXH2M0ApAmGJNAGLAU
X-Received: by 10.202.188.214 with SMTP id m205mr72537oif.96.1510139539938;
        Wed, 08 Nov 2017 03:12:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510139539; cv=none;
        d=google.com; s=arc-20160816;
        b=imAxiZKHsj8DwVTl3/HL58FWcYbTproe38+tsxUlH7U2Q4zcHekRRjkYu8RHurxzZo
         4orD5/Y7Ux6YX/KyZi0WK0lSpLUv+AxB2xzyhbYFNhVqia8/Dv42cyIpL5lnHDvtJFz/
         cV2f5dT1/wZY5t9ZED1YX+5DREUJ8PXyAVe35WjesZ9K1UKHxBa/FGP7HGFiNHR4O4ao
         7JWvzHkCWkHfa9h3ZZIhLkzybwVBlh1ZAWhaQhDnbJc1wz7qxufWuXSzkhJlxCRoS0T+
         nnYsoEzq5GG4ysBBEd5G3yioqhH3BKLIGBixvS0w6Wz2mpVhGGnuxHr+J5mOrJto+FZq
         TbVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:arc-authentication-results;
        bh=9hQRmh0sypcC28K2fJMclX0f30NqDaw+1jMkZLjq2LQ=;
        b=lBHh8Tf4WXVzUPgl6YoFfbU4AuZjKZ5Ndjp3w20S9f3RpjFpje/uw0gmPwgikDK74g
         iaXzaqcQKSWruoPomDWDLmTjDxlTbwGLgctVXOKWJ8ry8YELzdBUBwbyJ1Ty/MXE6bHq
         XiB3hDAHl24UBJrzy/bIfcTgl3kGDyDh2EVGe8QbEbhxoO0qQgYnwko0tAqQSTF/7C+C
         jW1Zv7gu+8VeFeCMMoTzLeDvAXC32pXEcnAo7lKNWWeRcWpS0xzOuNk1hk6hAX66y9jy
         ef2kax7k8QE2eJFj6XsvZp4nRB6jwN7EpdtASi6p5+9EQdtyFMAPi64g2mxPiI9itZvm
         SrZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of dave.martin@arm.com designates 217.140.101.70 as permitted sender) smtp.mailfrom=Dave.Martin@arm.com
Return-Path: <Dave.Martin@arm.com>
Received: from foss.arm.com (foss.arm.com. [217.140.101.70])
        by mx.google.com with ESMTP id k62si1244966otk.128.2017.11.08.03.12.19;
        Wed, 08 Nov 2017 03:12:19 -0800 (PST)
Received-SPF: pass (google.com: domain of dave.martin@arm.com designates 217.140.101.70 as permitted sender) client-ip=217.140.101.70;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of dave.martin@arm.com designates 217.140.101.70 as permitted sender) smtp.mailfrom=Dave.Martin@arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 03C7514;
	Wed,  8 Nov 2017 03:12:19 -0800 (PST)
Received: from e103592.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.72.51.249])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1769F3F3DF;
	Wed,  8 Nov 2017 03:12:17 -0800 (PST)
Date: Wed, 8 Nov 2017 11:12:15 +0000
From: Dave Martin <Dave.Martin@arm.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Subject: Re: [RISU PATCH 00/10] Initial support for SVE
Message-ID: <20171108111215.GE8971@e103592.cambridge.arm.com>
References: <20171107150558.22131-1-alex.bennee@linaro.org>
 <20171108103630.GB8971@e103592.cambridge.arm.com>
 <87mv3xqbig.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87mv3xqbig.fsf@linaro.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TUID: WPWQIZOPospp

On Wed, Nov 08, 2017 at 11:02:15AM +0000, Alex Bennée wrote:
> 
> Dave Martin <Dave.Martin@arm.com> writes:
> 
> > On Tue, Nov 07, 2017 at 03:05:48PM +0000, Alex Bennée wrote:
> >> Hi,
> >>
> >> These patches apply on-top of the last clean-up series:
> >>
> >>   Subject: [RISU PATCH 0/7] Add @Group support and some aarch64.risu cleanups
> >>   Date: Tue, 31 Oct 2017 14:54:37 +0000
> >>   Message-Id: <20171031145444.13766-1-alex.bennee@linaro.org>
> >>
> >> This series adds support for SVE to RISU. Most of the initial patches
> >> are plumbing changes to better support arch specific option flags
> >> (cleaning up a TODO in the process). I also needed to ensure configure
> >> actually honoured CPPFLAGS so it could be passed yet to be released
> >> headers.
> >
> > Should there be a getauxval(AT_HWCAP) & HWCAP_SVE check in this series
> > somewhere?
> >
> > I don't know enough about how RISU is structured to know whether/where
> > this is needed.
> 
> That would be a saner runtime check to do but it's a balance as RISU is
> a fairly specialist tool which kind of assumes people know what they are
> doing.
> 
> The current check is on SVE_MAGIC in the header files which does mean a
> binary compiled on an SVE headered system is now carrying about a much
> larger register dump even when run without the --test-sve flag.
> 
> Whether it makes sense to be more flexible is a call I'll leave up to
> Peter.

Fair enough.  If there is anywhere useful to put it, it would serve as
a useful example -- but as you point out, this is not a typical piece
of userspace software...

Cheers
---Dave
