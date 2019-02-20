Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp4847011wrx;
        Wed, 20 Feb 2019 10:22:51 -0800 (PST)
X-Google-Smtp-Source: AHgI3IbO2KLK/GHfOYa1SUNJxu0C5jhFzxgmjSs/P7Fo4/2vn6Qg1rF2yMOtwykf8zr5KyXYEZUK
X-Received: by 2002:a5b:9cd:: with SMTP id y13mr19215656ybq.197.1550686971820;
        Wed, 20 Feb 2019 10:22:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550686971; cv=none;
        d=google.com; s=arc-20160816;
        b=QDWcb9D2Eya+R+6WUE+VwcIkqAySWAxWJKocBaMPCp1IoKT6Xz501153bpkw3HQ8qP
         A+9VnwaOlbmGtEEP3DtkY2+OlVdI5xMltU7xUpCpVEy40pz9ehr06wQF8eccMyVkPbUp
         aNqdxYgEol3G0gZmpAdukLD6jOkccVSw7WFxMaW54zrs39EXa4qRuxIGsc60DM2WN2ST
         qY3VGw12Lf8Rneh+iwIfyQFczx4of1IPhxqj5GP6fcIe6fdzighHLnnWVJngLM2tM7zu
         YbA6igJtNT9c6a5P5YlJafXMDDCfvsrZED9Lu+3UYa35qQcLU0k+O1kV7z+40RRqR//o
         OKmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=VkwFK3onGyFTWHTj7q4FMm4WOH/SlkMYOTx+n7ePkpo=;
        b=XsmBcNSJpvoIP5pfEtSiH1s8Y7jroh2GqvsmzKLyfGWE0BLHJ9tVAMADcechTVeF7z
         eescb4sBOOuhuusECdm2vHvW9HyDPnKg/odos2ANOJIeJIkMtz3iijGPJevbmL7dfwQy
         FtbOir0afYiF0ekS7S3bO+Sr2HkuHtY5SMw7QhepqOMTyACPjutNhigHQ67T5dtCavI9
         al/y2gWSW0ZcOeaeiCoQGVgBwck1prd1d6+H9becq4LXAh3pUjt9icSdY4zEBZnSvHTb
         c55HTFpcswmhEnfFT7V0QBgRPChUoc7MZWlG0oboZ0PiT2pzpK4u7kZ10XJOY+obDxS5
         4sLA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="oYxM/U4T";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b8si11541483ybk.291.2019.02.20.10.22.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Feb 2019 10:22:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="oYxM/U4T";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:45308 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gwWWB-0007Yj-A4
	for alex.bennee@linaro.org; Wed, 20 Feb 2019 13:22:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34378)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gwWVw-0007XG-2j
	for qemu-arm@nongnu.org; Wed, 20 Feb 2019 13:22:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gwWVs-0008Mv-9a
	for qemu-arm@nongnu.org; Wed, 20 Feb 2019 13:22:34 -0500
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:37493)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gwWVq-0008Jr-K0
	for qemu-arm@nongnu.org; Wed, 20 Feb 2019 13:22:31 -0500
Received: by mail-pf1-x444.google.com with SMTP id s22so12315639pfh.4
	for <qemu-arm@nongnu.org>; Wed, 20 Feb 2019 10:22:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=VkwFK3onGyFTWHTj7q4FMm4WOH/SlkMYOTx+n7ePkpo=;
	b=oYxM/U4TnyX8Nx0NUT6q/CiHSjMCe0YbLvcNlYT/cDG/xmmtbUDJOM6lNImM29rrSt
	oKEClXRNaKrQEQyhLwMdgcscpcK+8HfnsAnfdtNLoQxUNPvSiKFGhX08WZyKgZT9eojE
	oF84hKsEJO2+WoF29WOOJ+V+pEgSgSUa9gJgP8JLQMmoaL1HeqyYzOUOCXsGAjT5M6nb
	Iel520DZ+BdmpkqOZ5NnfCa/hTeoNLDWK4UX0AWJ0qfhlIkO1uklWBktecGnC+7XR0ba
	uHjdd8xGZLMwo44AFpxoJaM/9Wq74y/g0AWM4wMx3MmcV8e2qc8CUJ5yE+Rz2t376TCO
	MYgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=VkwFK3onGyFTWHTj7q4FMm4WOH/SlkMYOTx+n7ePkpo=;
	b=j77JC7JV2OtCBYhoVqC+qrbBkdS6zKgVu01tsGdDURtTCQ8iwusxy85imtSjixvT/U
	iVzPPfF5+xlzWIdROQsAXIqJu5HG9CzqG6BB70DiXWoN48Y+jpAnDBFiegQyUkbEAPaQ
	/r8LbywZoUf5lHVbd1//zNwwGqwRqFv6s/ppMIuVYqtLIex8PQgf88IlN4CcATSe09FN
	vJ3E3A2R8Ck1iI/cerTm/1WvuhYDIBLNL4M96TX9sQAo5dq277kLxgy5qOfugtL3QJOh
	vFi8aXW7mqPnuKRnt8XzyOUdayhyByVaVCNGqEwrS37zDXL1sXnt52UerDkWoyiuldJK
	iC6Q==
X-Gm-Message-State: AHQUAuZ+gKkMtA+KHnNvb0fSIAnrrycT1i/uhfQGyaBT1Jdo+OJNz/TR
	O63D2j+pspRYhA03pVV2HfeS7A==
X-Received: by 2002:a63:2c0e:: with SMTP id s14mr30766544pgs.132.1550686946751;
	Wed, 20 Feb 2019 10:22:26 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82]) by smtp.gmail.com with ESMTPSA id
	w6sm30725852pga.72.2019.02.20.10.22.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Feb 2019 10:22:26 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190219125808.25174-1-peter.maydell@linaro.org>
	<20190219125808.25174-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <af9298f6-15ca-fb51-9618-9cf7e3cd3d6e@linaro.org>
Date: Wed, 20 Feb 2019 10:22:24 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190219125808.25174-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 5/8] hw/misc/iotkit-sysctl:
 Correct typo in INITSVTOR0 register name
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
X-TUID: pIzSnDXVrSk/

On 2/19/19 4:58 AM, Peter Maydell wrote:
> The iotkit-sysctl device has a register it names INITSVRTOR0.
> This is actually a typo present in the IoTKit documentation
> and also in part of the SSE-200 documentation:  it should be
> INITSVTOR0 because it is specifying the initial value of the
> Secure VTOR register in the CPU. Correct the typo.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/misc/iotkit-sysctl.h |  2 +-
>  hw/misc/iotkit-sysctl.c         | 16 ++++++++--------
>  2 files changed, 9 insertions(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
