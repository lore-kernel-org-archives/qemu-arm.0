Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5421528lfp;
        Tue, 11 Feb 2020 10:49:40 -0800 (PST)
X-Google-Smtp-Source: APXvYqxkL4p/kGOO4EKSZ3Fj+7NYMFMosHZ5sdgSt9od8MHnganawl0vltk6XXOsdD1XLHalNxe3
X-Received: by 2002:a0c:fa11:: with SMTP id q17mr16336833qvn.10.1581446980152;
        Tue, 11 Feb 2020 10:49:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581446980; cv=none;
        d=google.com; s=arc-20160816;
        b=JL9eZOBIpvBYdjRurfXEgTL20wnBWHHblx51rvqccHpLUMAciB/74fBGRSp2etbfZY
         3tbIKcsTI9kuoulhogk7R5pXDX/nl6dncPoLLpN6C5ySc3jechHQq8RDcRhKqa1kjWmC
         l3akDuRMyVgXbW+b9rtkxXsgq2Jv7sSRS9FrzPVWs5lyc2Qipvfcw040VUN7uub0XQQH
         JG0YEc6vSHB80LJtyr7ASw0+batRBnIG9cho/f+A9/D3suXGseZGF1K0sv2ZLOYZScz/
         SliQxFAiKgJNU0wdP6U808cthbQi01hw+8L+OpcezlbgVk5sJKlrmNPSpilmIsQPXtZ8
         U/lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Oxft3jtxJKwQ7Egx48zyh88CIRwoheucgSvHmE4yHPA=;
        b=hA+0hXuiPU67rtNOvQc9fjv/8e8ScMfVC6qvHyaZlL87tVkU6HNfow8Yrku+Re/89M
         06NZ7w1Q1NZGFueqzNXpR+w7ZFe7zcBiiKuPPEmyk/WsDlXw6mI57F80cK1Ed20iR6sO
         cMVHWadZk442IYNYG8+zS3XUX2DzUVg7J/AHMpRKFr29lCJ1t8dZbXzmQfMh+p4kEugw
         PsafvHFEKOGPJs9yreUtSQZ/KCRUUoAZdcEIXJMGAI/ruMNktwb+GWKv4aDYzp1WkAyv
         gmJBUDpJpnfAQxiEfLG37Iu77mPh0qpE4cjAXfTcg+jtRsaQApYNz62StEa1UQP3o+mO
         IaPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YKxsLUlD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e19si2296110qka.206.2020.02.11.10.49.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Feb 2020 10:49:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YKxsLUlD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j1abL-0007qe-Jc
	for alex.bennee@linaro.org; Tue, 11 Feb 2020 13:49:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54609)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j1abA-0007nX-0v
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 13:49:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j1ab7-0000RQ-TB
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 13:49:27 -0500
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:42462)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j1ab7-0000Jy-NX
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 13:49:25 -0500
Received: by mail-pg1-x543.google.com with SMTP id w21so6179498pgl.9
 for <qemu-arm@nongnu.org>; Tue, 11 Feb 2020 10:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Oxft3jtxJKwQ7Egx48zyh88CIRwoheucgSvHmE4yHPA=;
 b=YKxsLUlD9K20dR169Ol7Tvw9iMKmHH44pcjMsUNmmw8xEcMxJqDmhdFM0haAlKikG7
 ROKroaP06sBFZYbbFrD0axlibfiFG+dZsgxRIyrQAzMupgJ2/IlDGyKLLUoI9rbhvlpq
 WuiNZiajv36w++GvhVgAxC7IicebXcicOTAy/7Vqee1yU7SzuMrcvw1GRGvAdU4sUN4K
 gvUiJNV4uTSWcRIJ+a10kT7CLq4ZntWHKdZ4yNliO7Km3SveOyqkEWtkIZ7wnn5zt8Us
 D265jZld9F040rG0IiqWtNLN1IHVXN7kRW1z5hjjUx4ZkMcRcWqrtsxDKdTWSr00B/Xl
 hOkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Oxft3jtxJKwQ7Egx48zyh88CIRwoheucgSvHmE4yHPA=;
 b=NsLtVeKnb/KuqLTVVFawZAYu7R3hQsxSzM5E1+46WKj0m1vcxXAqXRvWsu8xjK5qWW
 dU5keV/Yht5d6M6ZeIs0hv3GHnvFiLQGRjp/V1Qd9IaCSEqbWvnX+mSXuLvNpu+WySiO
 ovaHN2RnrTy8I5fQVr34LmgejeDQykBwdls3ES5nPMowS4Ej7h24tPi2xXkGMikQztCi
 4fDHgLPU4u+kNgKqMqAmcOeQnkQfBFI/5S0j1srrmMBbWl4WAI9n4NvyemWBlu1UsR9b
 GHinkKxMJwjl8x4lKT3yfX7hvJt/cwsm31+ZeyVH23adQ/WRpuzd4JRmBtjrpYb4OIAk
 gE0Q==
X-Gm-Message-State: APjAAAUnJ/bMg75Nqvs8S9p3NlCuQenJ4nRI1z2ao5TGhhQ4c5myHZXj
 ekRYRdwB8FUPLUggF/kA/98VnA==
X-Received: by 2002:a62:5447:: with SMTP id i68mr7872655pfb.44.1581446960421; 
 Tue, 11 Feb 2020 10:49:20 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 a21sm4938456pgd.12.2020.02.11.10.49.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Feb 2020 10:49:19 -0800 (PST)
Subject: Re: [PATCH 10/13] target/arm: Implement ARMv8.4-PMU extension
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200211173726.22541-1-peter.maydell@linaro.org>
 <20200211173726.22541-11-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d8ece08f-f4f7-1425-7f4e-eb3af84807f5@linaro.org>
Date: Tue, 11 Feb 2020 10:49:17 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200211173726.22541-11-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::543
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Eric Auger <eric.auger@redhat.com>,
 Aaron Lindsay <aaron@os.amperecomputing.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XiSGe5Dkjkl9

On 2/11/20 9:37 AM, Peter Maydell wrote:
> The ARMv8.4-PMU extension adds:
>  * one new required event, STALL
>  * one new system register PMMIR_EL1
> 
> (There are also some more L1-cache related events, but since
> we don't implement any cache we don't provide these, in the
> same way we don't provide the base-PMUv3 cache events.)
> 
> The STALL event "counts every attributable cycle on which no
> attributable instruction or operation was sent for execution on this
> PE".  QEMU doesn't stall in this sense, so this is another
> always-reads-zero event.
> 
> The PMMIR_EL1 register is a read-only register providing
> implementation-specific information about the PMU; currently it has
> only one field, SLOTS, which defines behaviour of the STALL_SLOT PMU
> event.  Since QEMU doesn't implement the STALL_SLOT event, we can
> validly make the register read zero.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.h    | 18 ++++++++++++++++++
>  target/arm/helper.c | 22 +++++++++++++++++++++-
>  2 files changed, 39 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

