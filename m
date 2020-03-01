Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1551201lfg;
        Sun, 1 Mar 2020 09:56:22 -0800 (PST)
X-Google-Smtp-Source: APXvYqwilXk5oLME0SN5pP+yj8geXaD2tZSttF+VLyvGfr7gUZz/uih4d1L5f+z5PWqmnqH8JGur
X-Received: by 2002:a37:b201:: with SMTP id b1mr12673974qkf.111.1583085382585;
        Sun, 01 Mar 2020 09:56:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583085382; cv=none;
        d=google.com; s=arc-20160816;
        b=NW3trkKrXcGqVCjp/UInja8cpHedrERAVCJcjy4gcWRUkW/BteYI4ipy1cJ5cM4SJU
         e0oM4OM28JSTdnBKAxM04PsKh9g1KKLs2KPNaBjhMdGBcX9jaU3BFDoudluDaNsUvgrC
         o5ZmGgLXHJTBczUUKo6yuTNstUcRycX+GXJIuuLZrw88J/vsCXSfkHeJ4KEMobm3vJPH
         +8H0Cixl7rhcRqdiO6587/pEmXODeMKSiM8z17hOMveQeisqCExdEUPrKaSX0aehy0Mp
         hz6ZPEHbW1FrtoYlcz4U8G6SnKB164WjyY1Fsrz9iO2JnKiVRV1BiO7BIRiecFQzNHuQ
         1EAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Uuh+GFYVp2AKms/X/74SNIcmqthqr2SugXQsxqRaKqc=;
        b=uD88S9/MRJDyC+WxnLZWRW/K39jrU8tp4PBmWGC89zXlA/xKKqJyXraCx5Xd6kJ15D
         n2B895tBxrQIxcdWdpBdYYSWT2v7U20/L6f65pZjuklf5g5WKwsis4//Zc4OPq4qZ3cN
         XDhsjNjuhbcBUTuXWmq86SOwHtSsVu1FnS43llrYNPUlIKJwWlKPTGNeD5YVeX9Uvu6J
         ZJxX53yZRPAh6IbZ3706ceASOggDHbsjP15Le0k+Xq9FPHYEq4hbVFPbZJjpmlVWuWR0
         5L/cEVfCNnhQA1CW+SMm2+l0jxbp+x8zXJxVJI9ZutXotGGXOFfuBU/NrVI7gD8zQaiZ
         Lunw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yKx2T4oK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h20si4510041qke.240.2020.03.01.09.56.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 01 Mar 2020 09:56:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yKx2T4oK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j8SpC-0007U2-3I
	for alex.bennee@linaro.org; Sun, 01 Mar 2020 12:56:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34197)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j8Sp1-0007Tp-8N
 for qemu-arm@nongnu.org; Sun, 01 Mar 2020 12:56:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j8Sp0-0002Ux-5b
 for qemu-arm@nongnu.org; Sun, 01 Mar 2020 12:56:11 -0500
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:46972)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j8Soz-0002TI-Vd
 for qemu-arm@nongnu.org; Sun, 01 Mar 2020 12:56:10 -0500
Received: by mail-pl1-x643.google.com with SMTP id y8so3239763pll.13
 for <qemu-arm@nongnu.org>; Sun, 01 Mar 2020 09:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Uuh+GFYVp2AKms/X/74SNIcmqthqr2SugXQsxqRaKqc=;
 b=yKx2T4oKV5bt4cSjwjkX6qfNcyljvW4xtrMuXYCq+GG+8rDzO9GrJEtKqV+a73CcR2
 AIHkDGIEJJjCvjc4D1Wy789hxwCw0xmXiilylTMhdH0jhmLMaYLQaOc3MJH7fYZBQ20m
 BKC41FNOJEqBIT5oD9khbut1erH58ebFNW/oVXNyQmPRWM4xdagHmN51mnt+HRFCz+Gv
 1+l24ZNUzCGl4MXitmMqNcz/X13dZDmA40FQlz9oavAZ4G8CgElRfoNJofMf5EzjfQTL
 nctGmwVpdm3I80obiKHtIZApB8j7D0VLB6zBWbFJi0Thb3KoGUsJzjzfihTQDGEELh2+
 07yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Uuh+GFYVp2AKms/X/74SNIcmqthqr2SugXQsxqRaKqc=;
 b=InEQY8bPRZF13RBXdPpPbojdzrca8mMSXPK1GLKckeBsdjZKXQVI8tZ8I6XMEQWKoZ
 l7K4Er7cYtrMBjNIh5bhpNGejjkDZVYoZ1GDZDsYnkTKOcX9+VYMU3OOXBjuXWEB7q9Q
 MtjCbswevw4HXWIrxvG2Rbse30F+d87JClQMwen86cmkLrgiDwTPxhSTMLqOuoKLTdnc
 qYa0vM5znXvwybSkkZIstpLOXVCDxdzIR9OG36ADpjMwcq300Ib68GWd0Da/4tapRx1c
 OZzhaYWim8eSHRaohdGwo1xis1E1t9EAtuWE9vv6flM5j4kaG207m5hAtxLyN2SjWDvc
 jP1A==
X-Gm-Message-State: APjAAAWOrVxQSHisZ8b4nKiYQirN0Sw6yaKsDyubIv8JXXorFO5I97Dw
 csIDPM/z2zAlAHwSdKSjnYs8KA==
X-Received: by 2002:a17:902:be04:: with SMTP id
 r4mr13963086pls.315.1583085368554; 
 Sun, 01 Mar 2020 09:56:08 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 r9sm18228685pfl.136.2020.03.01.09.56.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 Mar 2020 09:56:07 -0800 (PST)
Subject: Re: [PATCH v2 5/6] hw/arm/virt: kvm: Check the chosen gic version is
 supported by the host
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <20200301104040.15186-1-eric.auger@redhat.com>
 <20200301104040.15186-6-eric.auger@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <30b6269e-e22f-347c-8e42-5af964bd14b7@linaro.org>
Date: Sun, 1 Mar 2020 09:56:05 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200301104040.15186-6-eric.auger@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::643
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
X-TUID: oPdGRbc0TIUw

On 3/1/20 2:40 AM, Eric Auger wrote:
> +        /* Check chosen version is effectively supported by the host */
> +        if (vms->gic_version == VIRT_GIC_VERSION_2 &&
> +               !(probe_bitmap & KVM_ARM_VGIC_V2)) {
> +                error_report("host does not support in-kernel GICv2 emulation");
> +                exit(1);
> +        } else if (vms->gic_version == VIRT_GIC_VERSION_3 &&
> +               !(probe_bitmap & KVM_ARM_VGIC_V3)) {
> +                error_report("host does not support in-kernel GICv3 emulation");
> +                exit(1);
> +        }

Indentation is wrong here.

> +    case VIRT_GIC_VERSION_HOST:
> +        error_report("gic-version=host requires KVM");
> +        exit(1);
> +    default: /* explicit V2/V3 are left untouched */
> +        break;
>      }

I'd prefer to just list V2 and V3 here explicitly, instead of the default.
It'll be nicer with gic_version changed to an enum.

With those changes,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
