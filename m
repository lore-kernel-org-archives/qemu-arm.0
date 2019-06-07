Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp333503wrg;
        Fri, 7 Jun 2019 08:41:36 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwoybN/mmux9WZUXUAi8MBSZ+8HRpRSIQUmYJ8LNhFMg/J9b9wCJ4VTowNhv/97GBUdoBLx
X-Received: by 2002:a37:a541:: with SMTP id o62mr24944539qke.90.1559922096662;
        Fri, 07 Jun 2019 08:41:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559922096; cv=none;
        d=google.com; s=arc-20160816;
        b=gNzNIV3rlRyvLSLxiQJD7WWV/pMAI7CGY1ZFBqLFTU9eEle5eAZkk83gdkY8IZiJaR
         EPCT3sRBwRXDiaO66GWmNDIj7VMz/FmDFb1GmLvxE/N9sSsVDDROm/Z9ObA3/5Tbw9CN
         fpT9UyT51YR3HDKCMjBdjWH9d99pQ/CFUwQ7vlFdsZcc7hUQrvJe2BKMp9/EO0bn9Gg8
         YtUi0MxBfMteBjyk8aui2hgsCwJVmZRlGZnOP7zkv3SO3COTUAAYV1obcxh17HDlbmfr
         u8+2y7d3Rf7cty5dlSswGJF6DNJNv1u3iY2nSOLuHABuWTTQSaA5L1PCywUMra+LY7M5
         lnLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=mEL5VNuCAJ4QjXnRvkR4/WbGybXGX+dMAv+s89e3Ku8=;
        b=bFvR9z/fqzNR8dVBkuDb+vqYWPLw3c8m0gSWe2imY3bNxcMsmTvbaDGy9TFsxGy3CQ
         XaoBS/31ru6eDf/KH814WwIrbvea3ib/ke5rZcvH4ESPHgnSpZk4NTV50Z9o8oh+8eAO
         leXdlFHe1DkNEH3+/XeGRBFRlsuu9XfGpXsA8Vxelff7GCGRUgnMVT3uE7D6LAFPCOfr
         NZ5TlX1pyCgB4dCJYhJx65RL8Ieb8vxwVbBkusM9hUXqinNifE3GY+Cs2hLw6HjahnHY
         uYa7jUBHlY+18+FqwkdvVjzn1NjJe9IBzXnml0ogdwDeaUJ8t2vpWmCrhWUSn77QmH3m
         fntw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mjXY+GNk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a8si1549784qta.131.2019.06.07.08.41.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Jun 2019 08:41:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mjXY+GNk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48900 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hZGzo-0003Bb-7E
	for alex.bennee@linaro.org; Fri, 07 Jun 2019 11:41:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38803)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hZG9M-0008RR-MY
 for qemu-arm@nongnu.org; Fri, 07 Jun 2019 10:47:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hZG9I-0001pi-Ia
 for qemu-arm@nongnu.org; Fri, 07 Jun 2019 10:47:22 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:35534)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hZG9E-0001XX-Qt
 for qemu-arm@nongnu.org; Fri, 07 Jun 2019 10:47:18 -0400
Received: by mail-ot1-x343.google.com with SMTP id j19so2088137otq.2
 for <qemu-arm@nongnu.org>; Fri, 07 Jun 2019 07:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mEL5VNuCAJ4QjXnRvkR4/WbGybXGX+dMAv+s89e3Ku8=;
 b=mjXY+GNkd0XYLhroUAl/GvVOc5ccVo1Ptr27hqYv+Iu5LAP5J2ic6T1t3Rs2NGV/jy
 3F7y5RyopIVABYAScBvRyhnjPRyflPnPZmbFXoYn48snlg8MGUmQawl2VV/Yt2ZdEI9X
 5rz/7RgBTTx/hucMegifzI6jBtcYcVGosHTzgwkV6oVe3Ub9cCEvma24kiJkr7D1sZWc
 35Qzuq8PuUfwdv8wyzST0G0sBDAfVMIQSTueOxtZhB73p8N32EfVyKnAfCDdzzH969Qr
 RH/w80hzi4+iwETMNhptrZARy9bgvhMvNDOyEY86CTYC5xZocu2/0+HitqpC+ixWtoR2
 MvXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mEL5VNuCAJ4QjXnRvkR4/WbGybXGX+dMAv+s89e3Ku8=;
 b=NvcFqjE2+Si2PqV2arq0dJ8WxBsebmOGWFKjYrFyo6v6JiiiEQvvYYg9LlLsK6OmTR
 TodfvCo1ru983KncmagbfhggmY+dzNAg51hdxzkTBlBtpJLE0LpdDdjIrNOshQsA/Bsm
 cP3HK9q0DgsiVW9MTcSlbRUIMfcEPSsWyLkR8bUSYgcHUizNBgddrmNSg3QOYkqDJMsO
 7S48qQSI2hj0/XYPaECAKqwqGcE0mKy1XntsHAI3GeB7V+/aRSxQC6P1NyZ3AvTe2t+E
 b0Kc3Te/ndrw9pPS+vFpMJLBPnY9WJwju7COUibwzTBpBDopK9EEb4Dl8rzwtfJSUIin
 oMIQ==
X-Gm-Message-State: APjAAAWOQh0CnSI6ebArmwB8rU+S7MbsiKfKs3PGKeUZIzyLeiUNGgj1
 PeIN4q/e555RN4KGAnTbJpp8Aw==
X-Received: by 2002:a9d:27e8:: with SMTP id c95mr19889701otb.101.1559918834202; 
 Fri, 07 Jun 2019 07:47:14 -0700 (PDT)
Received: from [192.168.3.43] (200-56-192-86-cable.cybercable.net.mx.
 [200.56.192.86])
 by smtp.gmail.com with ESMTPSA id p64sm744037oif.8.2019.06.07.07.47.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 07 Jun 2019 07:47:13 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190606174609.20487-1-peter.maydell@linaro.org>
 <20190606174609.20487-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <555096c4-3be8-c0f9-3054-37570f0e6150@linaro.org>
Date: Fri, 7 Jun 2019 09:47:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190606174609.20487-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-arm] [PATCH 02/42] target/arm: Add stubs for AArch32 VFP
 decodetree
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pdAs17eHIDa2

On 6/6/19 12:45 PM, Peter Maydell wrote:
> Add the infrastructure for building and invoking a decodetree decoder
> for the AArch32 VFP encodings.  At the moment the new decoder covers
> nothing, so we always fall back to the existing hand-written decode.
> 
> We need to have one decoder for the unconditional insns and one for
> the conditional insns, as otherwise the patterns for conditional
> insns would incorrectly match against the unconditional ones too.
> 
> Since translate.c is over 14,000 lines long and we're going to be
> touching pretty much every line of the VFP code as part of the
> decodetree conversion, we create a new translate-vfp.inc.c to hold
> the code which deals with VFP in the new scheme.  It should be
> possible to convert this into a standalone translation unit
> eventually, but the conversion process will be much simpler if we
> simply #include it midway through translate.c to start with.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/Makefile.objs       | 13 +++++++++++++
>  target/arm/translate-vfp.inc.c | 31 +++++++++++++++++++++++++++++++
>  target/arm/translate.c         | 19 +++++++++++++++++++
>  target/arm/vfp-uncond.decode   | 28 ++++++++++++++++++++++++++++
>  target/arm/vfp.decode          | 28 ++++++++++++++++++++++++++++
>  5 files changed, 119 insertions(+)
>  create mode 100644 target/arm/translate-vfp.inc.c
>  create mode 100644 target/arm/vfp-uncond.decode
>  create mode 100644 target/arm/vfp.decode

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
