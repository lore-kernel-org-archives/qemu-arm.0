Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp425580njb;
        Thu, 5 Dec 2024 13:06:49 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUYaOy6ZtpWOkNFN7/+DQSnbUsNBFxJnd686yHewKTbuRo7B8yhcmvh7pSzqLV4pxMURf+MWlswqnoR9A==@linaro.org
X-Google-Smtp-Source: AGHT+IExyaUQAqRgT/bkfh3UoaeFzi5LyROO0e/jlvIU8UkqrQKYZbEC2YACjrrDHKkkg7cLmE40
X-Received: by 2002:a05:620a:3902:b0:7b1:880c:5805 with SMTP id af79cd13be357-7b6bcb658b5mr112381785a.45.1733432809668;
        Thu, 05 Dec 2024 13:06:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733432809; cv=none;
        d=google.com; s=arc-20240605;
        b=IW8pJRwfcFiJp6wU3SpBfhYXBaKhg/fcxqTARPI+m8Ctu+OBLOV9qu3rAnmluY6jmi
         uFlfoZaa2WABOl/oJcgsRBN4rz/e7hMS+JwTNrln1ZE60KUaEMBwUKoLrF4qutmD6k8d
         XhyHrBkTr3fBVApG4LJKs+LgwUTPuQmVihl0kyVEQR16/prM4WfCXMWX50I+srLlylx8
         eCuh51wIPWguKDab8Ki//L8FawLyylarfgV03OpDfXcSiCIPYWVZAjaurCF+ySv5QXNB
         sqtD7stYvAx63S0wOoEwf5ACmwTRA1Crat8NuSfd0pBvAzVN8WImpZCeIXjA8Q6TaN8W
         uzcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=PAkhrLwGmqi1fZGll5e5LUyn+/zJSLdsLNxxOCgRSFc=;
        fh=zDpZjVjLJgpkjEKR0KYphjX0dMFwVBP2uU8TWIfTGxE=;
        b=LUfDwQ8ccgSSXU4IK6OkcGX8LQAJHYtGEiyv/eRNlRiKNmaoS5TqAUVocHcJ1mnP99
         JagiaTyJ01Ku98o+RMoKOH7e8oSR/FgUX+gixxLJs2iF6IHv59BnR/neTgzXLfwvtpXz
         jZjDgGpfN38UoSP26y4aE/NlXI+fOrJGNr+iKJFfRMCTl750ysR9J3hdmT65GkD3R6wc
         iRVoWhaBTtX8f7liI4jAE4pSNJ7/o1C5rYSeLo3+NzsGhr/LwCedIZUwL1jyuqe66msx
         Kq4yQkQbVGlZ3FKu3W5UpfFmRkNOY+SxIk4gOpkMH7xw3vq/zWxUizQaohomTB/R85TK
         qbCA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r8UrVrUk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6b5aaa7acsi250805085a.417.2024.12.05.13.06.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Dec 2024 13:06:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r8UrVrUk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tJJ3A-0001wl-0r; Thu, 05 Dec 2024 16:06:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tJJ36-0001uv-AN
 for qemu-arm@nongnu.org; Thu, 05 Dec 2024 16:06:13 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tJJ2z-0007J2-23
 for qemu-arm@nongnu.org; Thu, 05 Dec 2024 16:06:10 -0500
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-385e3621518so1055685f8f.1
 for <qemu-arm@nongnu.org>; Thu, 05 Dec 2024 13:06:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733432763; x=1734037563; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PAkhrLwGmqi1fZGll5e5LUyn+/zJSLdsLNxxOCgRSFc=;
 b=r8UrVrUkzK2Tfp5fd6tRDcgzsKgsgGY5ecS92Vwfgf/GWwelVzRAhuThGvHBVVDkzm
 KNtGZbzypDq0ETbczc4t89oQDe8JfPtlZDnlYTtldFXeRjOHIA6R9w5IK2gMv/kAXLwG
 0eRfWgUiXeShV4mN/J5JW1mi9VZXCVVT0sVrFNAyiTMW7WJ9e9oWmrL/Vv2xGsAo+HtN
 aYdITyUbwjnAheeF+fmeB3G7MtYO6OVwL9JlHws3gyxt5JD2IWTYuz5Va+DrWBxCo7W7
 /ixtwdT+H3x7SpzkUei346NGPCsoL9jk0oxnWUEfftVMkVOzKtBOKzCLM5EMtq4vHuOV
 FZHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733432763; x=1734037563;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PAkhrLwGmqi1fZGll5e5LUyn+/zJSLdsLNxxOCgRSFc=;
 b=MCB12sV6eUQGdUmf1F0X4OScZSjZ+0OAGj7snwnhH1NEyEfod8pTHego/QoILxp6of
 vOTddKFTCzOXb2Yp/9P/hMjg+8yDzkKFSWd3roXxX9j2Z9I0eJBfQWyHLFiY1V2AU8u+
 tnkvsnJaZeTxqhb9fvQ2uJA41kt0N3BgSujIEnJ6rgkJB2jZb6YAv2/B/PwbAW/dpg8b
 qGmd57klTgbW4K2rA58Mnvsyq+s8RoLRO2QYeV0RGczdNGCMmEGBcArAe6MMUiMCuh/o
 bvBHIRQZHUrOB6klOR/HELuidGQvbuozjQWBPb7UWEy87KYaN/AeBKiD94nwrk0DI24Y
 DuuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEoKAU+DQtbtdINwkLZWubnx8sOGbieaqsonWB85RlAqA89oyVIk2WMbcCQlJsvJzv/isb00GMtQ==@nongnu.org
X-Gm-Message-State: AOJu0Yzm42+9CRGUDfS80WDvM2kIFHer/DJV3Rr2uO22zuGUMLvtKh05
 45maZVZFVOdzbMEDwEaSpmxzcDIrXOd8njM2whk6jUuY4CzuoNAMKwxpZJwuNDc=
X-Gm-Gg: ASbGncs8HZX5LyXOgN/0MFatgTo+5IdKssJByPZbjJJHIARmYkyhIozVZsqqAjVHdC5
 5rTGXH9G+nkYuGD3SDcicBcqWt9RGHZ1IGZuhZy1mneeokefN6MyqFonnbbbHuq0uORtOQX8+XT
 PV7IfNiDR4R6UzQw0VHtJmbQhVvAKoxiqDSNZCtqA9ixlMAG2OmpJfCP0dTmBAKg1AkjDXLowmP
 0uIZx5cAjVA1ggkjZ0YfsGr3KCLSCL0C/WiV2bhyWOslrYU7hAjsDBXtctuTuBba9T1HJxAUZ1P
 g4DrjGN3za2rXSVVUA==
X-Received: by 2002:a05:6000:4007:b0:382:4d54:2cde with SMTP id
 ffacd0b85a97d-3862b3cea94mr373934f8f.37.1733432763295; 
 Thu, 05 Dec 2024 13:06:03 -0800 (PST)
Received: from [192.168.69.223] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3862190966bsm2963202f8f.75.2024.12.05.13.06.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Dec 2024 13:06:02 -0800 (PST)
Message-ID: <4ef6acd6-6d40-4cb3-97f6-362552c7f7eb@linaro.org>
Date: Thu, 5 Dec 2024 22:06:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] hw/ide/ahci: Extract TYPE_SYSBUS_AHCI into
 dedicated file
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 qemu-block@nongnu.org, Peter Xu <peterx@redhat.com>,
 John Snow <jsnow@redhat.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Alexander Graf <agraf@csgraf.de>
References: <20241205131937.32833-1-shentey@gmail.com>
 <20241205131937.32833-3-shentey@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241205131937.32833-3-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: CAVpNjYmp3Qb

On 5/12/24 14:19, Bernhard Beschow wrote:
> Implement in dedicated file, just like TYPE_ICH9_AHCI.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/ide/ahci-sysbus.c | 91 ++++++++++++++++++++++++++++++++++++++++++++
>   hw/ide/ahci.c        | 67 --------------------------------
>   hw/arm/Kconfig       | 10 ++---
>   hw/ide/Kconfig       |  4 ++
>   hw/ide/meson.build   |  1 +
>   5 files changed, 101 insertions(+), 72 deletions(-)
>   create mode 100644 hw/ide/ahci-sysbus.c
> 
> diff --git a/hw/ide/ahci-sysbus.c b/hw/ide/ahci-sysbus.c
> new file mode 100644
> index 0000000000..d43db0923f
> --- /dev/null
> +++ b/hw/ide/ahci-sysbus.c
> @@ -0,0 +1,91 @@
> +/*
> + * QEMU AHCI Emulation (MMIO-mapped devices)
> + *
> + * Copyright (c) 2010 qiaochong@loongson.cn
> + * Copyright (c) 2010 Roland Elek <elek.roland@gmail.com>
> + * Copyright (c) 2010 Sebastian Herbszt <herbszt@gmx.de>
> + * Copyright (c) 2010 Alexander Graf <agraf@suse.de>
> + *
> + * This library is free software; you can redistribute it and/or

Normally hw/ uses GPL, not LGPL, odd.

> + * modify it under the terms of the GNU Lesser General Public
> + * License as published by the Free Software Foundation; either
> + * version 2.1 of the License, or (at your option) any later version.
> + *
> + * This library is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + * Lesser General Public License for more details.
> + *
> + * You should have received a copy of the GNU Lesser General Public
> + * License along with this library; if not, see <http://www.gnu.org/licenses/>.
> + *
> + */

