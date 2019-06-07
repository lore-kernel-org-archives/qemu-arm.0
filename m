Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp547307wrg;
        Fri, 7 Jun 2019 12:22:49 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzZ+JyCutf/wkZEpSHjnSL4JBib5aBXmFSlYMDEOr0C1KXUU9GcdzFTOLYwgBUAbhFJVCT7
X-Received: by 2002:a9f:3899:: with SMTP id t25mr3156668uaf.93.1559935369114;
        Fri, 07 Jun 2019 12:22:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559935369; cv=none;
        d=google.com; s=arc-20160816;
        b=0Dw0TXjf9o8vkMRQONp/AximoqysJZRaD0ZxeCLZvmGpP2d/8II0GG8eYZGTUkhloN
         ln6k4lQpAnUjN6rXRp9DI9A0XrlSuRtviUtPuhoK988bkcM3md5qQug+YexaFvzh6LFK
         IqTG08OVKBnqdv3hBpqSPlpGleHypzZpj5gFZfqWcUTWVJxV/S4dOnKNqyaiE+cex4XK
         b7UeUl9ElL0wwK74BUT78wTftJrdXH3vFMTIwLob7eVEEmPwXY4Fr4ZlGExm2Sg0uA5q
         uI67mMdGNeVq6YXazoWHtUpYGphrKRxS6PvmCqQTsE/b8l93Qedm1LCktx3dNObBBeOf
         71VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=xSxr2khXk/E2wuomvgD1zBa6o7VMFaqnrO/SqCVlTc8=;
        b=u2G1Vwmx5icYBYIUHMXBTw+9hvG1VYhqPXJDJAdl5hTRaAg4jltcSko45mL48bLbsF
         ld7WuW6EJER5OlePACTcp1kCQpprKUU+2tEOJ1d0jFkVAd0hEkfkLHDbOT6hSV37ri6L
         igeE4mdIG3UKcUXHnoeCFyMX36aB4CeFxw68z2gF9XYycit3K2tZioJtXfv5ov1soV0J
         5/aIOR3cqvcmIa7BwEmlbn7NVcRrixzd/q+c9ufe3TnZH2FZh9L5WxvDsibpdq4aRXLW
         EDfXzo87OcpY65PYpK32zG6Yew75RDPXGO1AihXm6NQ9WBU1DGNCx17SVmqH1dqZhhNt
         Ij9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ksyvPKsS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r18si295637uao.4.2019.06.07.12.22.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Jun 2019 12:22:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ksyvPKsS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51710 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hZKRs-00071m-LF
	for alex.bennee@linaro.org; Fri, 07 Jun 2019 15:22:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44802)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hZJI4-0002T0-Je
 for qemu-arm@nongnu.org; Fri, 07 Jun 2019 14:08:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hZJI2-0001DP-JA
 for qemu-arm@nongnu.org; Fri, 07 Jun 2019 14:08:36 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:35867)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hZJHx-000140-2K
 for qemu-arm@nongnu.org; Fri, 07 Jun 2019 14:08:32 -0400
Received: by mail-ot1-x343.google.com with SMTP id c3so2697137otr.3
 for <qemu-arm@nongnu.org>; Fri, 07 Jun 2019 11:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xSxr2khXk/E2wuomvgD1zBa6o7VMFaqnrO/SqCVlTc8=;
 b=ksyvPKsSN8sSK8T0sDDfSAznRFlErxOKyt+r5n13AL5dFHLTrfRl69LmRTc0mlXbNk
 4SD8iOnPFAeq64f0F6LW9jqJgI1S82Df8zP7/S/b43N1HrzqdsLLpgzxkBJwhsGUysrI
 ybMLsX9ixfzK8i3xEyu2dxQSp/iuex+mJgGtM5/j8+eaG7pTmXOXCSYne1EzsgxSObZj
 B9I7dcGb5t5XEAKI79HYZc19tZFJaGbYm86idsESG6fUeelDIXgxRyRinvq+Ku6euG7Q
 E41XscN0FNqEWuldDFkHak8ZT/4JGH6n5fehCIylI0LgUFhH9VnOrbETOAtYlNzvd7bj
 EUhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xSxr2khXk/E2wuomvgD1zBa6o7VMFaqnrO/SqCVlTc8=;
 b=etdND2LJSMrpsws+sALNz1y/YPo34klVc6WpMtSaP/yvoT1lqlgpqbukQ5yEckr7iC
 BFEOAGIJ9Iyl0Ot7pm/Q9wxLXYJT2ADqy/2lHqKn2Cky6rNdimLrqZmzlmcu5E5mTtM4
 Mr0AtDE9YP5JD71703uwrTxEFT80qWT/chJx4ZhYQO07INsfXxP+CZR4XfnYB5Px9/DT
 B+JzYp76OSSQRZR2jkT85SZOnVcSOElugI/MFOJZ4waxLXew2ERasrpiknyuAcmCwuWp
 Dd045nnDr+oKkFh2n3s/qwRhbKVodAYMxtYcVUINbidWyiYi+LcwIsM8zwTGMUAQD6/q
 h4Hw==
X-Gm-Message-State: APjAAAVaSEtJo5eNoQRsEi0/ZNV6NCjQ6uC/xT7K6ateEAdCl3XX29eM
 oC1yzP7xKq2hARmydCAtS4HDow==
X-Received: by 2002:a9d:6453:: with SMTP id m19mr3172037otl.70.1559930905732; 
 Fri, 07 Jun 2019 11:08:25 -0700 (PDT)
Received: from [192.168.3.43] (200-56-192-86-cable.cybercable.net.mx.
 [200.56.192.86])
 by smtp.gmail.com with ESMTPSA id s110sm1021947otb.34.2019.06.07.11.08.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 07 Jun 2019 11:08:24 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190606174609.20487-1-peter.maydell@linaro.org>
 <20190606174609.20487-14-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <119282bd-4a60-e9a6-99c2-4fa2ddb1ecc0@linaro.org>
Date: Fri, 7 Jun 2019 13:08:21 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190606174609.20487-14-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-arm] [PATCH 13/42] target/arm: Convert "single-precision"
 register moves to decodetree
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
X-TUID: G/2vxi8w66vW

On 6/6/19 12:45 PM, Peter Maydell wrote:
> Convert the "single-precision" register moves to decodetree:
>  * VMSR
>  * VMRS
>  * VMOV between general purpose register and single precision
> 
> Note that the VMSR/VMRS conversions make our handling of
> the "should this UNDEF?" checks consistent between the two
> instructions:
>  * VMSR to MVFR0, MVFR1, MVFR2 now UNDEF from EL0
>    (previously was a nop)
>  * VMSR to FPSID now UNDEFs from EL0 or if VFPv3 or better
>    (previously was a nop)
>  * VMSR to FPINST and FPINST2 now UNDEF if VFPv3 or better
>    (previously would write to the register, which had no
>    guest-visible effect because we always UNDEF reads)
> 
> We also tighten up the decode: we were previously underdecoding
> some SBZ or SBO bits.
> 
> The conversion of VMOV_single includes the expansion out of the
> gen_mov_F0_vreg()/gen_vfp_mrs() and gen_mov_vreg_F0()/gen_vfp_msr()
> sequences into the simpler direct load/store of the TCG temp via
> neon_{load,store}_reg32(): we know in the new function that we're
> always single-precision, we don't need to use the old-and-deprecated
> cpu_F0* TCG globals, and we don't happen to have the declaration of
> gen_vfp_msr() and gen_vfp_mrs() at the point in the file where the
> new function is.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-vfp.inc.c | 161 +++++++++++++++++++++++++++++++++
>  target/arm/translate.c         | 148 +-----------------------------
>  target/arm/vfp.decode          |   4 +
>  3 files changed, 168 insertions(+), 145 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
