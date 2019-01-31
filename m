Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp7422238wrt;
        Thu, 31 Jan 2019 15:05:11 -0800 (PST)
X-Google-Smtp-Source: AHgI3IbKGEa4hE79MyI1HDVHDIwIijbmrsPo1ayP9tMxwORUBoOFajkL1uP+uxrQ7BztWhbBys9a
X-Received: by 2002:a25:4188:: with SMTP id o130mr19868295yba.1.1548975911019;
        Thu, 31 Jan 2019 15:05:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548975911; cv=none;
        d=google.com; s=arc-20160816;
        b=1JLm4xPkykHbztimsLC/XPj4nmtRDwmw2tQksowSzMgSmX10zzaXHpq42YHZepgiZG
         pjIm0Sf/Ulpmvk2uvRfDaOeSju7QhU6K0FmEL9p0yTqjqgFQhi5922XZuJ3Y8BRpz1z2
         7ZWCxAJTqXI+LA7JhxJmIaWErxciw46hZ2Ar+H32XRT2m1DEoOvolc2F+EPJIdP+JCzB
         NJF9YzeKqk9+OkS1pwphmQlB1w6H1mvZg9jbGdsq4G7bJfhWj7XxErtMu9AFNYHyWsgM
         5tlIIQNnwNSmHQphWuajFqKm0QRiPNH/wxbzhEHnsZgG514/5/zP7Ioymzf0u1Bt76kp
         dJIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=NaObhYPHmqHyh/IgSnekfiauE0a1yvxBC3FNM2tKHxQ=;
        b=XurLCKIh0BvUGhA4U4llYaTFOmpVpDzNWjLSaSogqAuPa/VKZi4wGtFBdT/CxK+wGC
         YUlevjUyMpO6J4ChiMJw461eJuMnxMaVp3O7IknYe2wPupZvrJJ2dxFIXYvHDy0wjXrR
         3ippqqtqvhp0NYpeGJvgjFuXshJkEDSzeGhPF5JRkjPmhxSutW5uBFtFayyBj9DhnmkB
         4IIknhaBNJAwC5zewb/jjJ5LqUKFfeecwha/3OcDX0G7KBnaGLuKpvKB1AIKLhGyMryD
         f2eIVZb5xytbosgAOn7z6o2qKvqE0RVvxFb3VGa/zolGbnnN5BRvESamjA+AAubJvd9t
         SZLA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="e/uDyA+d";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 14si3488863ybc.97.2019.01.31.15.05.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 31 Jan 2019 15:05:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="e/uDyA+d";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:34195 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gpLOM-0001zc-UI
	for alex.bennee@linaro.org; Thu, 31 Jan 2019 18:05:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34510)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gpLO6-0001xl-1r
	for qemu-arm@nongnu.org; Thu, 31 Jan 2019 18:04:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gpLO4-0001pK-Tg
	for qemu-arm@nongnu.org; Thu, 31 Jan 2019 18:04:49 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:46547)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gpLO4-0001oZ-E6
	for qemu-arm@nongnu.org; Thu, 31 Jan 2019 18:04:48 -0500
Received: by mail-pl1-x636.google.com with SMTP id t13so2148064ply.13
	for <qemu-arm@nongnu.org>; Thu, 31 Jan 2019 15:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=NaObhYPHmqHyh/IgSnekfiauE0a1yvxBC3FNM2tKHxQ=;
	b=e/uDyA+dw5VeWiW0WTPx6QcZW4L1gwSNMvtEWa6c1NVscI1BfdRG8ZhogJ+Lg/WenL
	MXRmR72UbdL8Pt6gQxbsWUIy/1lHhZ2xxDxzG7tZQLlwVHiYOBzYqBmDq6mHzthYIc9+
	OriSfgfb5KrakNQEGI+Rt9fYp8/CrLDJdCtlo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=NaObhYPHmqHyh/IgSnekfiauE0a1yvxBC3FNM2tKHxQ=;
	b=uWxOhRKXnfPXcvkGnOMcnV8lawkny3BMQn+I1ZrpDjrBiwZjzBNkYi4zsbW/FyZ73V
	myAToCle50ADJP19Qt+zZChWItmQs0752sL7vbaHgpTVUp6ceydZbp6iaXztffUp4GtS
	Mhg9P14BlqjJtNwSUhX3zvWa7ohMSYxuNR+N8HMS6bzHrAa0Grc0kZbvOu72HstTpd++
	DfiCm5dSmGln2LPsRse1MQUFFEO3DE8N1BjMa+GK9AKn14GVDGMVwTmN2aBlzY5sfEQt
	kfDmm5pPEEKOzOvT+8xg7eVXUDFqjHJrCYbinfebH6iyUddhk5m35wg5vwWXkFVd/G8C
	7k1g==
X-Gm-Message-State: AJcUukcs3AfWf8Yu4XGErLwPwCkY1UAZt9D/0uKSKOXy6jbHsncrCoe9
	yUvcOQAWv3jA6743jqc/zPTYUQ==
X-Received: by 2002:a17:902:7402:: with SMTP id
	g2mr35781739pll.198.1548975886748; 
	Thu, 31 Jan 2019 15:04:46 -0800 (PST)
Received: from cloudburst.twiddle.net (97-126-115-157.tukw.qwest.net.
	[97.126.115.157]) by smtp.gmail.com with ESMTPSA id
	f64sm25362970pfh.0.2019.01.31.15.04.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 31 Jan 2019 15:04:45 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190131130700.28392-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <a3d50ef7-9777-b647-2e11-8f9229ca6022@linaro.org>
Date: Thu, 31 Jan 2019 15:04:44 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190131130700.28392-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::636
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] target/arm: Make FPSCR/FPCR
 trapped-exception bits RAZ/WI
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
Cc: Martin Husemann <martin@netbsd.org>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XCHGxriDw5HU

On 1/31/19 5:07 AM, Peter Maydell wrote:
> The {IOE, DZE, OFE, UFE, IXE, IDE} bits in the FPSCR/FPCR are for
> enabling trapped IEEE floating point exceptions (where IEEE exception
> conditions cause a CPU exception rather than updating the FPSR status
> bits). QEMU doesn't implement this (and nor does the hardware we're
> modelling), but for implementations which don't implement trapped
> exception handling these control bits are supposed to be RAZ/WI.
> This allows guest code to test for whether the feature is present
> by trying to write to the bit and checking whether it sticks.
> 
> QEMU is incorrectly making these bits read as written. Make them
> RAZ/WI as the architecture requires.
> 
> In particular this was causing problems for the NetBSD automatic
> test suite.
> 
> Reported-by: Martin Husemann <martin@netbsd.org>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Martin: this is a different fix to the one I suggested you test,
> because I realized we need to make these bits RAZ/WI in the aarch32
> FPSCR as well as the aarch64 FPCR, but it should have the same effect.
> 
> General note: the difference between "RAZ/WI" and "RES0" is a bit
> subtle (see the Arm ARM glossary), but the main distinction is that
> RES0 bits can often be implemented as reads-as-written whilst
> RAZ/WI bits never can.
> ---
>  target/arm/cpu.h    | 6 ++++++
>  target/arm/helper.c | 6 ++++++
>  2 files changed, 12 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
