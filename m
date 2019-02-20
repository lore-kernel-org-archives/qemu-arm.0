Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp4852216wrx;
        Wed, 20 Feb 2019 10:29:20 -0800 (PST)
X-Google-Smtp-Source: AHgI3IY1TLKktJab7YUwLqfh9zLsFIwzomlMuvNoDeBOc2pzwHcNF46w+UDdeGbYW/+fpXKBwiNs
X-Received: by 2002:a25:b988:: with SMTP id r8mr29502008ybg.464.1550687360636;
        Wed, 20 Feb 2019 10:29:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550687360; cv=none;
        d=google.com; s=arc-20160816;
        b=F9HR+mdgv299pnYEbG1ebj9vWF9LMP/FTTutqRz3uO60+5Z/5PGg8QntmkUzCtVnhU
         gCIdGXEu/e4eE1ge75V1TNZ18uPLCwNEOWlHwPshiXdfFSz9vIWCwNyyRzjLXbbKpaDL
         ft12nRgJANKJBNbpbjhnMYVH+6MHl9EDG4kU+JhdkLJDD5oHcviRc0NZQdT497zhzbdO
         jZbdvIgjva6TYEO94p5zzWg4aGbyBabeICp/+RdIZZakGM+35bimSUhX6zw2dooxx+xK
         72XhWu+xAvPQCu3l5WIhyMt+/hJswHckQYF4J4WXQvcGHjuqEjGYxgPgJJrU7qnjpFQ6
         NzjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=m5MuTvDaJGUDP+YKQWiviqUgHTlgM2VcvlDVnk+owow=;
        b=fduiqq3W6whMLUUP10pAdgPQDxwfTuFbwLi9OYdyePgjifc5RfKkTofDSIhlFFFeIG
         UajPHqgsqt1hiAkKHI5QzAxxfosGjmIbGi86ovOE62zxlphnn7H4JD4ZFTItcfSx6k2A
         F5K+go6eLNUE4+2aRWtJGnRps+pjg4KqNZrfv9fY2Zv/BuOa2r5+0yBA6gq0NsfadsPF
         l+mV9qmUNOqmO9dcTjcrUfmvPw5VJdoKiJqRyOO9kMiMQv/2nzUxH8H63Vw5NyKHuLmR
         wcpPNy/ooiOG3kC3nOGvu1klOogliqBtgbqUkfpzGor5WFnLneHdfSAG7l6wDb2yVpLg
         W2Eg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AA38MitZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j70si11247974ywb.235.2019.02.20.10.29.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Feb 2019 10:29:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AA38MitZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:45456 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gwWcR-0003uU-HE
	for alex.bennee@linaro.org; Wed, 20 Feb 2019 13:29:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36315)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gwWcC-0003so-TF
	for qemu-arm@nongnu.org; Wed, 20 Feb 2019 13:29:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gwWcB-0002TH-7N
	for qemu-arm@nongnu.org; Wed, 20 Feb 2019 13:29:04 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:39902)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gwWcB-0002S3-1h
	for qemu-arm@nongnu.org; Wed, 20 Feb 2019 13:29:03 -0500
Received: by mail-pg1-x529.google.com with SMTP id r11so12278118pgp.6
	for <qemu-arm@nongnu.org>; Wed, 20 Feb 2019 10:29:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=m5MuTvDaJGUDP+YKQWiviqUgHTlgM2VcvlDVnk+owow=;
	b=AA38MitZ6nhEj74yCN0szle54ZSsTgWc+cQ32UofoGor7SsVcsgIOgdhdkwouOOJTQ
	Qob8XW/m1RcTpDiirP3dEBuv5Ii1L28wteQvce7EQ7gWsE7IyWUeEkt+klnfF9q6mA/J
	WfHYQVxVb0X1gYUPXEqSQp06s7TyAQQaRw3lVkn1s3fqFnqP06gCvVY4tb0bGZ4VDzRM
	ccDB4pu2amdHwkA56If3d6kYUq4zL8YowNpbyoqozgwlMcyRvxRB/UparvIo0tF4F2K1
	3g9oSOnG1g7e/SUikKNTt+/JBlc2YKhFmWhTyWklJuConzI/eq6g1VUv7BexrjRNWIS8
	hAIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=m5MuTvDaJGUDP+YKQWiviqUgHTlgM2VcvlDVnk+owow=;
	b=mmQtWu6gREUR8asMUJ7s8yFXnGwku2gBhH+9tVQaDcKlZ6lmjE2yYEx40SvdKUmNMr
	ee9+75glQoETFm+XBDpq3PE54Q8dnGC2AM4/g4iBY/HeMoGHk7pIUby9ccczym3sMeWy
	sALzdVoJtXv/RyiJgumTYpuJiMMM2y1p1kZPoe8XA17PczCHzf4Qky4ELxYJmpBhRusG
	eCrTzo4RtEtt6rRyCxASeZynnGzS2acQCFdoSAmA2EU2ECbJo+UqJcScKECxNMWvrG7e
	DREmN/ppBEKzuISexfV5/BKK3KAxEefReej1Pj6dmC5CnWyTKrxj0mmO8i0eIQjOb6Pd
	0DHw==
X-Gm-Message-State: AHQUAuaywjRw/PO9TMzXa4dQiezkzpwKlCVx1PYHXWxvDmk280vuCIMg
	5VLXn+Q6nQUaMjI+pBMryjV7PQ==
X-Received: by 2002:a65:5301:: with SMTP id m1mr29303290pgq.90.1550687340210; 
	Wed, 20 Feb 2019 10:29:00 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82]) by smtp.gmail.com with ESMTPSA id
	y66sm36591857pfy.66.2019.02.20.10.28.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Feb 2019 10:28:59 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190219125808.25174-1-peter.maydell@linaro.org>
	<20190219125808.25174-8-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <fe9a6375-56be-89e8-0f6c-1d2227cf1211@linaro.org>
Date: Wed, 20 Feb 2019 10:28:57 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190219125808.25174-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::529
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 7/8] hw/arm/iotkit-sysctl:
 Implement CPUWAIT and INITSVTOR*
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FEnuhycwzU9w

On 2/19/19 4:58 AM, Peter Maydell wrote:
> The CPUWAIT register acts as a sort of power-control: if a bit
> in it is 1 then the CPU will have been forced into waiting
> when the system was reset (which in QEMU we model as the
> CPU starting powered off). Writing a 0 to the register will
> allow the CPU to boot (for QEMU, we model this as powering
> it on). Note that writing 0 to the register does not power
> off a CPU.
> 
> For this to work correctly we need to also honour the
> INITSVTOR* registers, which let the guest control where the
> CPU will load its SP and PC from when it comes out of reset.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/misc/iotkit-sysctl.c | 41 +++++++++++++++++++++++++++++++++++++----
>  1 file changed, 37 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
