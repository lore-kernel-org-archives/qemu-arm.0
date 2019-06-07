Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp334679wrg;
        Fri, 7 Jun 2019 08:42:47 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxZF6SORMPpZtRW2aQVzwffWmYZ4/Rv2MPRch1Hhbl6II4U9PC6clQXNDSPyFqaieMpN55A
X-Received: by 2002:ac8:7342:: with SMTP id q2mr5882248qtp.134.1559922167794;
        Fri, 07 Jun 2019 08:42:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559922167; cv=none;
        d=google.com; s=arc-20160816;
        b=SF2PVnM/ltcV9DiJGATP2Ir8AspAKmxAs2AEPQqNhbcdcCcewElr1xKxnqudWAplXs
         cn4VR6IuB9lBstpc56XJvnJudqYEwnZ5Rd4A37G6wUAjmimo2nwxW9jX06r7JPb/7kBk
         UjD8oU+mW4c0q/jz2CRHntwziai0R/Q6g1JGra640XK/4ocqPmF+5hBylKxOQjHrrQYT
         46ndFTHeloFLDJq1rOCNRJEMbOANrPCZko/8p7DvjryMVNJ4d5uyanlfyFaF6d+B6+MT
         5qN/gXnuJO4zotGhRuC9p6JuzWHuP00d5gFjprGOu+NStIjYLbjaUdSw3XT6/6N2uk0v
         OYcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=uZoUAwCZM64CjI/sYBQ//kI4ibpdbMr/7i8IhdgNm3A=;
        b=jvjBKbKgbvnBH8xOEQXAv5zLUOCcNeLruHBCbT0YR+yc7HPJoeoBzPYYENXnpKvxN1
         ypFQCN0RAZ3H+Oxy53oIzgoMLcJK5D+9G0F5u3qoiOM+g97W6Ikbs1AtbSFyYbe6Az/l
         4Ji1WIJnxOsLDVv6uABaDv0jQ8oJL39BjlECE+bOg1jKRU+2veiogw37lxs9CZR4F8gj
         KMrX84nkIT9riaT5H7kR5v23uV1ATtoC3ijylyu73ucItC+bX2LPTbIS+bIy8wrVH/+g
         MoiW8RpkGTbJt6wgqVFOoHogt0iNMuLun2t97gbeuO57x36kq+jnl5PJI9fXnCUNNHMz
         t+2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VZDF4WlY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w22si1481998qtk.185.2019.06.07.08.42.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Jun 2019 08:42:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VZDF4WlY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48938 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hZH0t-0004Z4-L9
	for alex.bennee@linaro.org; Fri, 07 Jun 2019 11:42:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40152)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hZGDO-0003a8-V1
 for qemu-arm@nongnu.org; Fri, 07 Jun 2019 10:51:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hZGDN-00045T-Na
 for qemu-arm@nongnu.org; Fri, 07 Jun 2019 10:51:34 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:37423)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hZGDN-00042Y-By
 for qemu-arm@nongnu.org; Fri, 07 Jun 2019 10:51:33 -0400
Received: by mail-oi1-x242.google.com with SMTP id t76so1630666oih.4
 for <qemu-arm@nongnu.org>; Fri, 07 Jun 2019 07:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=uZoUAwCZM64CjI/sYBQ//kI4ibpdbMr/7i8IhdgNm3A=;
 b=VZDF4WlYJTRaCqvdraypaPV4CKl5rOpJtzu1ExmYRDcLJ8l1hiO5H9UPsTk1uNN8DP
 ZZUmI2D4k91OGyMEh8PoJ2uCmGRxXmAlZeIjBGwp3RPcsp3YSCb2T7w7LrjujSjsv7By
 3xwXr9MNd9DpuoKA5O4XuXYjKiHvx2oCi7Uq1F30ZC4N19MfVj1x/Yzmia9sYWPfP9C3
 88FqTHQliavw5VcAFoBmCXv7w7KzIfYN/7CP7ip0wokJ3lIw3FfndDJpynQbfgvLL/ce
 tXtUIi+d6F6WvqN2MRojFFmdyrMBie9A/6uyJAVk14ZXl1BUbXdlJkYG3E8X2Jc6Cf3Z
 DM2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uZoUAwCZM64CjI/sYBQ//kI4ibpdbMr/7i8IhdgNm3A=;
 b=gEYs5NIVZVgtdzILNfyQrJu0BRJvU5DVwOzXZ1gpoNXr7LkMG3n0XS7jijhVPH68cD
 DtgHFYSO0Y4HBV67ybo+jWE3iBdwQoqDeYrrCUEqMNd3SiZ9gd2Y8fg9LvAOANaDDwmC
 GelA2veYcnmAePE/Z96VriFu/cSNErWzAT0nVdjl4Y0dZ+FQhPAHYCH+VurRdxd4EJGG
 jwyqq7NwfUaa/qKr0iXLSEvjGT22zCXJWY6Xctp9V3F1fyLMIk/L1xmPnDISB/5hsu23
 cU4J5vvolm9tEKnX9cca8RaFf8kzs+ha8sPJfYFXmlOBW8s+9FQDkN1ozc4x2h/5eXyh
 GsLw==
X-Gm-Message-State: APjAAAU+l1R1oPaVbkTg1fSTKIMwTDTwnIFTQjVEazyBEsGuFfFycSSY
 y3XGMlDsHHZqf0X2TNTL1NXjBA==
X-Received: by 2002:aca:3256:: with SMTP id y83mr4170162oiy.110.1559919092220; 
 Fri, 07 Jun 2019 07:51:32 -0700 (PDT)
Received: from [192.168.3.43] (200-56-192-86-cable.cybercable.net.mx.
 [200.56.192.86])
 by smtp.gmail.com with ESMTPSA id r205sm773727oig.0.2019.06.07.07.51.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 07 Jun 2019 07:51:31 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190606174609.20487-1-peter.maydell@linaro.org>
 <20190606174609.20487-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <e264d4ee-e712-0d11-a368-1268d9290db3@linaro.org>
Date: Fri, 7 Jun 2019 09:51:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190606174609.20487-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-arm] [PATCH 05/42] target/arm: Explicitly enable VFP
 short-vectors for aarch32 -cpu max
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
X-TUID: fIcG4EfzieYz

On 6/6/19 12:45 PM, Peter Maydell wrote:
> At the moment our -cpu max for AArch32 supports VFP short-vectors
> because we always implement them, even for CPUs which should
> not have them. The following commits are going to switch to
> using the correct ID-register-check to enable or disable short
> vector support, so we need to turn it on explicitly for -cpu max,
> because Cortex-A15 doesn't implement it.
> 
> We don't enable this for the AArch64 -cpu max, because the v8A
> architecture never supports short-vectors.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.c | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

