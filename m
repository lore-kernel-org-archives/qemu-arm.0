Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1547700lfg;
        Sun, 1 Mar 2020 09:50:26 -0800 (PST)
X-Google-Smtp-Source: ADFU+vvhiRvESy0/iQm7a0Z0mg1b6EtlTJ1JGW8+aZfq1MDlG6MYEZM29VHQZbRZMcl88+P+PStH
X-Received: by 2002:ac8:4d4b:: with SMTP id x11mr2198101qtv.171.1583085026821;
        Sun, 01 Mar 2020 09:50:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583085026; cv=none;
        d=google.com; s=arc-20160816;
        b=a8TZ1XWJ0Go7K+llGTdKoKK9qXVATsugrA9n2XrqSsXwUv3G7K3daR9w0b1AoL4WwZ
         SaJpbmXZdsYRqqY9nnxn+UHQOQIKKM5SaWq+DNG5rf72hMX1nxoxvzk+4RjUImIIcztO
         DF3mvPywtnMEXNnSMuLhD99MNnCAsIxmGXxBuyx6xEatZJbwZdb1PociJpMI6NxsODXg
         0K7MVCymkGLYUwLFSbB5SYe3Ir7NuvUuTCLIfkDdrJGp6usfcs8M65PHGFfHRxnWACsa
         GHuVR+UcBUwurH9vL3YL9rzpKgtEkzgvt7jYRZ4eJ4lGSobaRNqwMsmruRb778I9mHLE
         z7WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=dfxdb7fsCcoZicRbs+z58/8kgpx9oS1+5EKK4VU5s6Q=;
        b=zPpQwnlKo84w7sNTP4GWm6/YWZo2E2IWShkRKxb/nFOJL8Wwh+FTQS0elDu0whDtK1
         uLZ2OwuNoWkoOkR4tmw2siqUtccXwoDEMmNJhXFEg2st3ObqcKUWVmS8lO05uJgggT/a
         RthJHMpB1kYRKWOZcGZt9RUTHoYo6LQ1ab6OaOSV3KXGlYa0Sid17bTVUTq10jRYXftf
         PZwl7/G5RoYxH8UGmkwEhQe7PGFkDfm2Fu/nKnFPh8mhQ8v8WQJpViS93oM+MmeBW6OM
         LLBAYsdert0JLXkdDAIn72rMoaW+vaW3KWIpbqDDSqlzyoAzPE5q+tk1MJ68C4cJrtSJ
         lSqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gQLOJgmi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s16si4634331qtq.33.2020.03.01.09.50.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 01 Mar 2020 09:50:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gQLOJgmi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j8SjS-0003mU-9C
	for alex.bennee@linaro.org; Sun, 01 Mar 2020 12:50:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33480)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j8SjG-0003g0-W9
 for qemu-arm@nongnu.org; Sun, 01 Mar 2020 12:50:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j8SjG-00008i-1a
 for qemu-arm@nongnu.org; Sun, 01 Mar 2020 12:50:14 -0500
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:42389)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j8SjF-00007z-RJ
 for qemu-arm@nongnu.org; Sun, 01 Mar 2020 12:50:13 -0500
Received: by mail-pf1-x441.google.com with SMTP id 15so4371703pfo.9
 for <qemu-arm@nongnu.org>; Sun, 01 Mar 2020 09:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dfxdb7fsCcoZicRbs+z58/8kgpx9oS1+5EKK4VU5s6Q=;
 b=gQLOJgmi3zd/CWRo89RHpidJy/4RAPYMFlLdnV547lLJhHbVm2m6VBq/xkcDcWQfZh
 TWvRkblo8Q9hiXwhB/k5Ej3tGqeNVcFdmeh3psN4+zHMppbZOHstdgiD1+uHYQuu6Qda
 Wj5xKpXmrMskvSi1FL/5ByTVLV5LrhGpht9w1FS4IP89Z7PxHiXyrwi5HHJqlc4MT2O5
 6weMkq4IMNrCzufFTqEiuXjty1P0EpGTp9uop+IV1yzJ2tSa6sy+56KWe2GnsaLDEoNA
 aQ79abM9S4N12SHdKiCJB8D00XXz7EtjoRamCyGIcps8jy8UwikF7v9glxAxSl1bGsvD
 i+AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dfxdb7fsCcoZicRbs+z58/8kgpx9oS1+5EKK4VU5s6Q=;
 b=f5AFZYaU4EHW7ZlQFH7WJG6ZZ+wxuhznzyb01BvYZ0oyFh/rO9xOkkr7pU9g+I0dNy
 7avZi8wihruPw+WDDeyNbNIHqG0sCrr2WcRp6UA3lDdtSpqfNA40aXCCwE4wLeEO3VHx
 OO6aFMKTS99OODr/eO2W3fzR6BASwFvcCg9tZTbLYIzuTfaQyDEVRQxYeaZfqf8157Tg
 0s93SIp7BCAPzC/E4PYqOvQOu0/bD85AZcJEvIyph9PuisIUQ9GhhmeRjm2Sc7Qgo9yK
 A2q7NOitEHM9BcNA4WPPXsrrfAQ8vuneP8zMfFBWAah8RH37XVm6YqsbLpF7pxnHscsS
 oPEQ==
X-Gm-Message-State: APjAAAU2Rt2FoQzVnMdpaQUriOdk5LAqK9rKBvO6e4NoqsgKLbqEZUaz
 wHCdxCgg+UBXeDBOmcEdOqlNOw==
X-Received: by 2002:a62:4d87:: with SMTP id
 a129mr14189456pfb.116.1583085012733; 
 Sun, 01 Mar 2020 09:50:12 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 191sm10370082pfa.142.2020.03.01.09.50.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 Mar 2020 09:50:12 -0800 (PST)
Subject: Re: [PATCH v2 4/6] target/arm/kvm: Let kvm_arm_vgic_probe() return a
 bitmap
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <20200301104040.15186-1-eric.auger@redhat.com>
 <20200301104040.15186-5-eric.auger@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <21e0115d-59b5-6923-cb7c-3d84632d9d57@linaro.org>
Date: Sun, 1 Mar 2020 09:50:10 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200301104040.15186-5-eric.auger@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
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
Cc: maz@kernel.org, drjones@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: POeDgrfAhG9b

On 3/1/20 2:40 AM, Eric Auger wrote:
> Convert kvm_arm_vgic_probe() so that it returns a
> bitmap of supported in-kernel emulation VGIC versions instead
> of the max version: at the moment values can be v2 and v3.
> This allows to expose the case where the host GICv3 also
> supports GICv2 emulation. This will be useful to choose the
> default version in KVM accelerated mode.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/arm/virt.c        | 11 +++++++++--
>  target/arm/kvm.c     | 14 ++++++++------
>  target/arm/kvm_arm.h |  3 +++
>  3 files changed, 20 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

