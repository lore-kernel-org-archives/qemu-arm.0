Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp246885wrq;
        Tue, 5 Jun 2018 11:05:49 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLsgD9kTsikSKHk7qMoYrRQJCsA5Vw8s7ek4eiMGq1FLO+a3AwM9qAPNvv2uxo8DhWmLIVZ
X-Received: by 2002:a37:21de:: with SMTP id f91-v6mr23885041qki.395.1528221949343;
        Tue, 05 Jun 2018 11:05:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528221949; cv=none;
        d=google.com; s=arc-20160816;
        b=na+6LHGC0cEmrhEhllyO8KzxBPP0ed/RYY3z4RBYkCigLKknhsOTz3IvtCoFkave+4
         B0qbl2yhXadhmMhAMMK8lbNBlNgPAjb6TH6yllul/4bj5DzfHd5KsnV9bhoYV8aNHcsW
         rK6aOQsYzre0E3FgA0FObwklwff9CiMcDd8CRMK6zK+1gwCFFMC/PntlO5Ak8WVWEW+R
         krx+hoqru8/ZKCqdjJ09UmFkk4/3/36giOHzqgKrEj4gmG0N7UOAJqVZcbgfc7Xu4h19
         pxXHZcbGfwBihibZVrw/z/r4twORXcuLvErmxCjG/suI2UKPSYNDre1m2+ZYp5yl2kL9
         Hipg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=sVFW5fwaBeT7RSVXqs+2VGIVzYeP/OxeQd7f3JpcZVc=;
        b=lzz1QI30qXbEERQr9S8uJhpyCd5J95aRVaJ8fjihqsXUw5sKvUCmsrcDmucV6m2qhu
         XVrmcTFCprs8B3UtHwCgzSkXbaLDYIwKdDUt/iXhVj7UrxnVUcTwbp92xQJhiS99/GUy
         xtEUMlYdLlHBOcLG+L0y4pDset0584JPhOXgTCWyY9xM7rlhvbIPm/8Dzk6Y0lNFeu9W
         47uD5K6oGgRvIrkZOPOUCDz5WlT5iWfO9mC4KeP3/pzrudgDtf0XWvYz0cM00vcwgAQ5
         ipTuFCyrcw87wsXTDY2VeakEsrsIz/anO0Asv9x2MjTGR2nXADi7IZRWoKeIpFHdEAbz
         Ha0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OntOownt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y125-v6si5922821qka.194.2018.06.05.11.05.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Jun 2018 11:05:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OntOownt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48365 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fQGL6-0005fS-SF
	for alex.bennee@linaro.org; Tue, 05 Jun 2018 14:05:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57982)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fQGKx-0005df-Ko
	for qemu-arm@nongnu.org; Tue, 05 Jun 2018 14:05:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fQGKv-00071O-Sv
	for qemu-arm@nongnu.org; Tue, 05 Jun 2018 14:05:39 -0400
Received: from mail-ot0-x22b.google.com ([2607:f8b0:4003:c0f::22b]:44958)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fQGKv-00070K-OB
	for qemu-arm@nongnu.org; Tue, 05 Jun 2018 14:05:37 -0400
Received: by mail-ot0-x22b.google.com with SMTP id w13-v6so3908536ote.11
	for <qemu-arm@nongnu.org>; Tue, 05 Jun 2018 11:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=sVFW5fwaBeT7RSVXqs+2VGIVzYeP/OxeQd7f3JpcZVc=;
	b=OntOownt0rsKXllDJjJJoJTyZHEjLsK2sXzxpUoOoeCiKvsFd9W+DCVlRMvgn6peU1
	5FchUNNGJFEib1F27JpkJBws4siIsyru9YkkDfzKUc2nS8K/h3lhnClwFedRGJFpI1qK
	FH3AAxbErwDs479ObsSjEsqjaP8qGW+HTMyz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sVFW5fwaBeT7RSVXqs+2VGIVzYeP/OxeQd7f3JpcZVc=;
	b=HoMl5WHr0CXszNwpeaAqYNpJMmr6qSaN0751hbH8nH45XEZhEryyEA9QHofwk1BIc1
	cWujtoJSzfX9lyUSWvo6xxSzeAze269tI+d1uZCa+ZYLwUUyR6q1lJb3rGlXePVCtWvG
	EG9nHAINuljVX2GNSOZ69FqIEJiZignPMdH+PAIfUEz2s/x5orM0GwVzpXJM/kvtCyYM
	dWhGNZ3fsTleN1ZvrC7/0Wv4o51pC9241hLZgb74vMHsuayiY0SJwpHl5nc1HXabb5TV
	TgOY+rhw2AXHr/v2CswKqr+UgIywZtv8Rw5guFbQjUxdRaOfntn/K1khil320FufSrIZ
	JRuQ==
X-Gm-Message-State: APt69E3pOjXOs3D5cLbrWewmekEgt/NIyQDyuYyVo3wK9Fyl1r9xTD1V
	yc5CiY95hYADnr+JLl0ib+VzfHjZWp1mMe/ayZQzlA==
X-Received: by 2002:a9d:34db:: with SMTP id
	t27-v6mr15941496otd.316.1528221937026; 
	Tue, 05 Jun 2018 11:05:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP;
	Tue, 5 Jun 2018 11:05:16 -0700 (PDT)
In-Reply-To: <20180530180120.13355-17-richard.henderson@linaro.org>
References: <20180530180120.13355-1-richard.henderson@linaro.org>
	<20180530180120.13355-17-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 5 Jun 2018 19:05:16 +0100
Message-ID: <CAFEAcA-O7DuYhFgMAY41BLQUs18+BECJ4D=hKfhgVdLUf-Ub+g@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::22b
Subject: Re: [Qemu-arm] [PATCH v3b 16/18] target/arm: Implement FDUP/DUP
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ris+yYBfUBXN

On 30 May 2018 at 19:01, Richard Henderson <richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-sve.c | 37 +++++++++++++++++++++++++++++++++++++
>  target/arm/sve.decode      |  8 ++++++++
>  2 files changed, 45 insertions(+)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
