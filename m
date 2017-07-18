Received: by 10.25.44.15 with SMTP id s15csp5241546lfs;
        Mon, 17 Jul 2017 17:07:39 -0700 (PDT)
X-Received: by 10.55.50.208 with SMTP id y199mr151914qky.174.1500336459809;
        Mon, 17 Jul 2017 17:07:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500336459; cv=none;
        d=google.com; s=arc-20160816;
        b=0R9XSNCnSxh+l+28yZGFRRGOaIEXL/kwsavS19VY9rlMHZaEjsJfUhJNcxqKtvXI9T
         4o++ip9ZKOpuKeTKN5AIxwU+LpBXAos7Jgr/Lx5i8kTa3ds894Wb+vscKWOqxocHoIK6
         rrryir3dOvH+P1indjq0vfht+6WF02JjvoPfoCG8bn9zQ2d/xAmM2udxKOZY9RKvX4eU
         4App3I7Cf2nWYaAlv/fCXfx1bVp9Fpc4xOYIeaptxXSbzES5GukFylyamvZT1nlLNmi1
         Sh4rQ0DGwMkn1byfrOnUIIFdIQY0o18FQ10gNTiRiTNB407txFeHjLS4Bpz6nQPfQhHR
         Y+/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=SUN0CnYBqGwwfXaglaYqP9qILM04ISGkorhIO0yv3eQ=;
        b=G2rrl4XFcex/kAaYR8PHLfLr4R10EGgIvoRNH3LlycH38HOD4XwXCOzFtBx85Fy3aw
         Kib/OpbdDuB9LOAKV2+q4wH90LbIyGo+36dvf0ot8S6mJLCfEngeANhY9tBsTgvv/69f
         dG/VOICYpPSEPNuVOoOn6pTzN+4nfrB4hMnewWAlt8Zt7yyUIWg0AI5jOmSqFp1O5DMP
         561beyOuaTzpZWNZXrZ2KPRF/p8Gws3iR+U4pFBcm7bZVbXpcQHGgl8M5a3Ps1bzxK1O
         7l9XxPXd3vcKjPMKNKnGbKjfggWhc+tv4IRi+1h2T9GR/Ke9FD7ztBVHTVIUE4VWr1PG
         N2Ww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@braap.org header.b=HjpMwZna;
       dkim=pass header.i=@messagingengine.com header.b=rbExidzO;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.25 as permitted sender) smtp.mailfrom=cota@braap.org
Return-Path: <cota@braap.org>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com. [66.111.4.25])
        by mx.google.com with ESMTPS id s189si571490qkf.201.2017.07.17.17.07.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jul 2017 17:07:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of cota@braap.org designates 66.111.4.25 as permitted sender) client-ip=66.111.4.25;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@braap.org header.b=HjpMwZna;
       dkim=pass header.i=@messagingengine.com header.b=rbExidzO;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.25 as permitted sender) smtp.mailfrom=cota@braap.org
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 6B9DB20892;
	Mon, 17 Jul 2017 20:07:39 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
  by compute4.internal (MEProxy); Mon, 17 Jul 2017 20:07:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=SUN0CnYBqGwwfXa
	glaYqP9qILM04ISGkorhIO0yv3eQ=; b=HjpMwZnaLg+Gyv4CrP4q/ro5yhvwd6Z
	/XTBpZ67FhBFUb2iv0TydpqbUL5aIQEdNU2LqfhS4h33eGoAhWAx75TVovlIqWGH
	Bx3pOjTeXpl5HeU9XoRL60VZIe8lFCMmPMPo6Lm5b2Q229EnuPDTNdToCWPehcKZ
	AVib8agYvSWQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=
	fm1; bh=SUN0CnYBqGwwfXaglaYqP9qILM04ISGkorhIO0yv3eQ=; b=rbExidzO
	S+6YbLxfBaX2K+kqxX3UGmCzqiE0rQ5TtWCDWpeqFY6tW5ozpMpwiCgjcx/ryxgA
	zZLSATeR9UXfIslfMeAHbn5p+SZZGxL+/YNDoLdDvTVlqYgKkW9vdPGIbFkGflZd
	dEj0t5mb0Gkfr1ogh6IY7aHV+TcUGqKac7Qvg2z4RpOYSpIlZELl5F1Y1QjJ12zT
	TLXmVEy+6s+ud8uZC4vpMMl0BxK/Z6qJ4ip6+Sku8IeAwovVv79LBS+SUFX++csw
	Mk/xO8sX43F92sZJ47+ObU9rppoEmATPVQddXN4cLJ+4ngOQOixJrcgwPkwB6se+
	MWU5BGJzBBs8Ow==
X-ME-Sender: <xms:S1FtWZwu_9GsH4aap8t_mtMAko5BzZY26iZI-AzhKfpxLAHtHuhKSw>
X-Sasl-enc: aNSUkuYrYu9PzKREgWJpCZ2ZHcAL7+lDLYVlRsNTu/Uv 1500336459
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 249527E21B;
	Mon, 17 Jul 2017 20:07:39 -0400 (EDT)
Date: Mon, 17 Jul 2017 20:07:38 -0400
From: "Emilio G. Cota" <cota@braap.org>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: peter.maydell@linaro.org, rth@twiddle.net, qemu-devel@nongnu.org,
	"open list:ARM" <qemu-arm@nongnu.org>
Subject: Re: [PATCH v3 2/6] target/arm/translate: make DISAS_UPDATE match
 declared semantics
Message-ID: <20170718000738.GC30851@flamenco>
References: <20170711175937.23140-1-alex.bennee@linaro.org>
 <20170711175937.23140-3-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20170711175937.23140-3-alex.bennee@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-TUID: aqdC4mPF9JqT

On Tue, Jul 11, 2017 at 18:59:33 +0100, Alex Bennée wrote:
> DISAS_UPDATE should be used when the wider CPU state other than just
> the PC has been updated and we should therefor exit the TCG runtime

s/therefor/therefore/

> and return to the main execution loop rather assuming DISAS_JUMP would

Rather *than* assuming ?

> do that.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Richard Henderson <rth@twiddle.net>

Reviewed-by: Emilio G. Cota <cota@braap.org>

		E.
