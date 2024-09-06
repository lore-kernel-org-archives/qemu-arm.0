Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp126869njb;
        Fri, 6 Sep 2024 08:32:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWlkw2xRQarHFM/zgttSmbrX0y/me8T6N/ZjhnKWbVNFhDGmcJPgmbQqXp7jys3aK/9we3ajqGYAmYAQQ==@linaro.org
X-Google-Smtp-Source: AGHT+IELdmwMnhpxn7L55x7EFgOnmIel/DhFxK+B6ppLCIjaGFuShdaINZofgg0kGGMbqN+j8PY3
X-Received: by 2002:a05:620a:28d5:b0:79d:8153:57aa with SMTP id af79cd13be357-7a997381fa7mr323564185a.48.1725636750096;
        Fri, 06 Sep 2024 08:32:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725636750; cv=none;
        d=google.com; s=arc-20240605;
        b=C6Fc/OJh9nuiDD8gyDsPBJSuWMTOHiQwtwf8RDP2J6EINYlBHg3mRFm2QfUslxJBQX
         4yMfl03v1MRA/0x3arI89HuiaZWdH/WoWMialbbXlG3koLMmLv0wTqu2IbAo7glZ3LHb
         eIhkq2vN9gF+nHrkTKN9L8zk3wXPMjKr+mt0jwMck0w6JrTjyyBMb/YrvhnZMNLPlVux
         gaKiWICHyjCantzhclirJyBOJucP6l6YmjfE1roWLfNY995ERHad9atTWx4IZqqnhuyT
         FTXVpRMtPUF+Prc8ge4kerSgNIY2wwPjoEDX+/Vgp1Pp/eM5rEzE7mzHc/y7GfX/7Fi+
         7veg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=DPFFJQVcsuCwQ2p/MkF+/pRYxXZXIiAqrfK5ohsi/mg=;
        fh=eHmcW+TWDkv26b89BFbpBXP6P5ziQII1tBWhRpi+4EU=;
        b=Q35E2wAhY00dbYv+cHbBdRTYp+qQOSVr1ECgjdNi8n5cy9c38uD/NR58g7zYVe8Ywx
         7QyOsMTxxOLvzZctqaOVrCSLav8JEKTdRkb31aN1YwvZE2RrSgmKRCFHMEH/Xtzye/gJ
         05JavxUeMKWcxHG1aoQiDlcQAMQuRY6vB94iz367cGd3vtY0Cvk9bewV98rnGLfKeFR5
         TzEEHWa9hgU1Od2scXmA63IGpV91QIBsWANFKfb6I/nazi3RGiSmM9kJdW0KqoXXsVcl
         U+rVeasIMY7nIRZzvZqE/JN2r5jPwrbeKkkil1u4EZMDzsuG7GPhb3j/4AdsXD3KCjDG
         /JrA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MOaLu8nB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a9a108cfe1si49477185a.721.2024.09.06.08.32.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Sep 2024 08:32:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MOaLu8nB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1smawh-0003C6-Hh; Fri, 06 Sep 2024 11:32:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1smawg-00034l-LG
 for qemu-arm@nongnu.org; Fri, 06 Sep 2024 11:32:22 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1smawe-0005xM-Jg
 for qemu-arm@nongnu.org; Fri, 06 Sep 2024 11:32:22 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5c3ca32974fso2523078a12.3
 for <qemu-arm@nongnu.org>; Fri, 06 Sep 2024 08:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725636739; x=1726241539; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DPFFJQVcsuCwQ2p/MkF+/pRYxXZXIiAqrfK5ohsi/mg=;
 b=MOaLu8nBo7Xpaz5+xuBkJJcL7p8Dv8zXX7ygeZCG9VIGm+uKyGhJ7dzHgFoHppFDak
 pzlcpShUELo/5eoQk7fIpyBaAScwf4WdIMbD0MDLdZ0+Hdm2mJATfX71j6rASuYBjnm0
 pE2hRpIwo16P+0Glygr0EaG4CLbk0f13P+e+21Hpos+7gOm3koxyf9XRwo0O6gwmuAql
 ul7gpHkc4Y9CvFegX5Oj6MME2PqHRPA0ab2Hx3bB0DrddQnAXrUiwOKR9mYh5kMTbUWF
 5c0gl5NtYLOwl+alGDbpHk/GuMFmudSlG3AsYRdkxKf/fkatS74HNVOcKQwzrkPN/WIJ
 aVbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725636739; x=1726241539;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DPFFJQVcsuCwQ2p/MkF+/pRYxXZXIiAqrfK5ohsi/mg=;
 b=HezDUmfmdMbkB7a+kfOK0dy6wW6kJeB5cjBComY78dPjKZCHZfVMUZGOXSrdYxRjEi
 +xfDoBNEiLbOPpwY0r6/+dHjg+OOlCH68DSxknX9fvcUxDkIeTVJFKEESBQ6zZ6fvpai
 n15QZcZpZaNeCxNYjiEKW4nk+4pPx4pFaAUVJ2Yr3JWR6S5NRiQFPK8bo9T0eN0XMwUo
 yB96LiI3uEflPHRi1dD1jBgIcm+ud6caze9jbyAVnkBZfX5rdi4Sq+SljVtZnejS4uM+
 1T8t5o7mFDkW1AooEkuPizf2G3G19Q1jlrKT7qvHyWp34IfiJjpglPjgSj2x//u4Yx1W
 Xdbg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUUyUcwwG+YH+RFXsQbqTxZMh4PJhpXP4eQmmb0Q0nlybzhlJzZy1rUxOHrrPfWKUFSGTLcSkyiw==@nongnu.org
X-Gm-Message-State: AOJu0Yyu9l1l3Vu4OF9Ex19PSEr9t5tXf5wWExnJvCj8FtLFZ6EqxVVH
 1rS//sM/xyDNI8lHUU5LxcVoDPcjNyMUgY8PZVM7vaS8ftJAcMWbAHe2Eyo07jq7LoXcVJ3KVC5
 f9y0njnZ3OH7Gl4xK5TR/Iqs8aqh5lXmBkv0cYA==
X-Received: by 2002:a05:6402:84e:b0:5c3:d9ce:4199 with SMTP id
 4fb4d7f45d1cf-5c3dc7c4625mr1958164a12.29.1725636738947; Fri, 06 Sep 2024
 08:32:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240828111552.93482-1-danny_canter@apple.com>
In-Reply-To: <20240828111552.93482-1-danny_canter@apple.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Sep 2024 16:32:08 +0100
Message-ID: <CAFEAcA-Hocqio2DwQoVak+ihGRDx=SQed3nomPiGRAx67BA7Zw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] hvf: arm: Support creating VMs with 64+GB of RAM
 on macOS 15+
To: Danny Canter <danny_canter@apple.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, dirty@apple.com, 
 rbolshakov@ddn.com, agraf@csgraf.de, pbonzini@redhat.com, 
 richard.henderson@linaro.org, eduardo@habkost.net, mst@redhat.com, 
 marcel.apfelbaum@gmail.com, philmd@linaro.org, wangyanan55@huawei.com, 
 zhao1.liu@intel.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: /w13PRwxOxYW

On Wed, 28 Aug 2024 at 12:16, Danny Canter <danny_canter@apple.com> wrote:
>
> This patchsets focus is on lighting up the ability to create VMs with 64+GB
> of RAM through using some new APIs introduced in macOS 13. Due to the IPA sizes
> supported in macOS, the first version we can properly support this requirement
> is macOS 15 as (if the hardware supports it also) the kernel adds support for a
> 40b IPA size, which is the first supported ARM PARange value after 36b, so we
> can advertise this to the guest properly as well in id_aa64mmfr0_el1.
>
> Today if you asked for a > 64GB VM you'd be met with a pretty unwieldy
> HV_BAD_ARGUMENT. On machines without 40b IPA support this patchset also
> improves this, and the message mirrors the kvm_type error you'd get on ARM:
>
> "qemu-system-aarch64: -accel hvf: Addressing limited to 36 bits, but memory
> exceeds it by 18253611008 bytes"
>
> Changes from V1 to V2 (Thanks Peter for review!):
>
> - Added a new function pointer to MachineClass to be able to freeze the memory
> map and compute the highest guest physical address. We use this to inform VM
> creation on what IPA size we should ask the kernel for. This is very similar to
> what ARM's kvm_type() does.
>
> - Fixed redundant loop in `round_down_to_parange_bit_size`
>
> - Move the splitting up of hv_vm_create logic per platform to a separate patch.
> This is mostly for readability.

I only had one minor comment on patch 1, so I've applied the
series to target-arm.next and made that tweak there.

thanks
-- PMM
