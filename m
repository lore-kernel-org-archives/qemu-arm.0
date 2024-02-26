Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2231428ejf;
        Mon, 26 Feb 2024 10:30:05 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU0Gfz5Wps+dIb8b8jRx7qDdJ0kZ4vngzrPH4BiR2RhEzmqfFlzfdHQEQ7NJ6ZeWb2twSKLmRnIVy41s7u/gIKfkpeBnni8
X-Google-Smtp-Source: AGHT+IFYrLUbwmGbzVSbDG9dyE6Ym8CogYZEeDJy0zSXiymql3WOaA++N7JX7cPD42cuHWpn+DE+
X-Received: by 2002:a05:6808:1294:b0:3c0:4196:8e2c with SMTP id a20-20020a056808129400b003c041968e2cmr10655422oiw.43.1708972205678;
        Mon, 26 Feb 2024 10:30:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708972205; cv=none;
        d=google.com; s=arc-20160816;
        b=zf1bcvrqY0vjHAoqS37MvRY+pXua9Tutwe/55K8iKqyqDl1fvmZWdk+tbzEiYWePm6
         xfVFU3TTFXmIo7Soy8JNYnDEJzZebW5L1ILVXuMzqC3bXy4C4pmU3D7tFj43MaEWKKph
         qfvRjws4wSWN0HvOC3h0GdOfyIETl0ucc+cBIyDPG8hM3/qvLxi0o9UCVGZtF3nv8l4E
         P8J8UuK1u1U0jaLKInmEWdSzkQp/FkC0AtJyDtSEs93w3IqeN9iKFVzlsZ5Yo4b2//CJ
         7GkWQyTBDHQeVcLRX/urb+jhvc8e/LhT2l7tA+kfobWNE9nEadACgC4CRDuNDKALOwOP
         ECcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=FI1hKicCK8zs/vgaF8e68TNy2vSotfEUghqqQ0cpDbY=;
        fh=NaRJj891Y75pPM8FURniyoVKMSKLkHI1slssYFtQoJo=;
        b=yrRjRCv7/xwTd///obK4rx+fjQGfxIbq+n518C79Pd6SjIH+m9AKBR8yZu8ToH+27Q
         sIGW2EUbm2OQ6lEwSd0lK9i3fBz77FRu5/NS9YN0EzWBXi0i3x8wtNv9NOPyFLzXTHaK
         vSwJ4KGMsneQpIeZnPYDjgkuYP5xXVDds8dxq96DtDI/KqTE2fbCw19N+QA6fkxvKLjS
         WdYdyGufqhTVjORKrRQBrhMXXz5+uyrWU5ItvoVGWpNjuMQKbejKwZho+1OSe81Yx8jY
         V+beMwA0i1ksJWmp3h6VZWqI726dZY6B1f2hb3UAT1eaBvmpxDxRUwRwuobY7SS/ar4d
         CcSQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n5+aAJ+0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id iu8-20020ad45cc8000000b0068cbab014absi5732016qvb.595.2024.02.26.10.30.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Feb 2024 10:30:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n5+aAJ+0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1refjH-0005M9-AA; Mon, 26 Feb 2024 13:29:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1refjG-0005Lm-1m
 for qemu-arm@nongnu.org; Mon, 26 Feb 2024 13:29:30 -0500
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1refjE-0007WG-9t
 for qemu-arm@nongnu.org; Mon, 26 Feb 2024 13:29:29 -0500
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2d27184197cso40972091fa.1
 for <qemu-arm@nongnu.org>; Mon, 26 Feb 2024 10:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708972166; x=1709576966; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FI1hKicCK8zs/vgaF8e68TNy2vSotfEUghqqQ0cpDbY=;
 b=n5+aAJ+0fJys+s50CCE+tMhmvnzUDVsJCfUg8EB7/y25lK3O5ID5qGgKigQhizrOUN
 iuXn2/K0U6vJ05BnRx/t5VYhROFPWBOISdQ5A9owR+C2ykS35pvkM3m463fBB2E7n10u
 u3kX+w0QkPC1ZDVGyJXPf69T8sBL5uLB0im9UqvUPcQ/wPWhdE/T9YL+dGjLG6s5fkAl
 mhSVK7bw4ayFNw2omb5OVNLdJ40eSq8k7GKdjhzrqjtHOCs/YWP/S55Oao8jeVG9gQNS
 lKYmD8y8Ye0ogJu36uO81sQqkR+HVn0M9mnTaEdM2aV3AUnyI3Wugt72+AtKutGaQW08
 U78A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708972166; x=1709576966;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FI1hKicCK8zs/vgaF8e68TNy2vSotfEUghqqQ0cpDbY=;
 b=p96qHamLIPMCHKSPg4a0MiAsqV/xqkTOxSppWH0aCCIaR4Y6mCqxDez24+vV2r5VJN
 FRSZTnu7VCE6kIJ1nHiIapnQmGJbJj2SmDbe36ujSaZkJwN9k4B/XT4xGRFrozRIDcyc
 mC+E8566AUcfnPFuNLzTu5rDJ/cHH2HoO2hqf9x06xeOT/9crJdw3itBWMch3CFmBsKz
 xLiECHtSnhcsHVvJ8/hxEJ6KUrb7y8BvUMCjxZe/9Ec4lx3xndoneYegcGc2M8DLYvQw
 e26Jsp21STZq6o6a+6eFsJcn4sJGgtEGuT74eRCMKGKA9h97CoaFl5qqOeIxt7wz2e1P
 rxlw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtg6sJ3SB4auDJgSLL9jQ9/zhXTovsUh8HRAwnyj7qawQzEg1Du8DQkUCKcwwqo1jh8So774mAlMb3+AOiHEbUq1yk
X-Gm-Message-State: AOJu0Yx+W5AQi5BWPOgT023lzi0JhBnD6dgaj8WXyy0sRMbOTTHcFVea
 bBauXp5tpXMdBJYfSUvT+xIqk03+aK4tJGvOJDZ7fMNbHKqHjpwYmwS/SKtyM3k=
X-Received: by 2002:a19:f018:0:b0:512:b245:402b with SMTP id
 p24-20020a19f018000000b00512b245402bmr4232150lfc.17.1708972165811; 
 Mon, 26 Feb 2024 10:29:25 -0800 (PST)
Received: from [192.168.69.100] ([176.187.223.153])
 by smtp.gmail.com with ESMTPSA id
 p16-20020a056512313000b00512dfaf4399sm914696lfd.229.2024.02.26.10.29.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 10:29:25 -0800 (PST)
Message-ID: <0f4c424e-be6f-48b9-9c78-fcfa52594bbc@linaro.org>
Date: Mon, 26 Feb 2024 19:29:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] virtio-iommu: Add a granule property
Content-Language: en-US
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, mst@redhat.com,
 jean-philippe@linaro.org, peter.maydell@linaro.org, clg@redhat.com,
 yanghliu@redhat.com
Cc: alex.williamson@redhat.com, zhenzhong.duan@intel.com,
 jasowang@redhat.com, pbonzini@redhat.com, berrange@redhat.com
References: <20240226181337.24148-1-eric.auger@redhat.com>
 <20240226181337.24148-3-eric.auger@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240226181337.24148-3-eric.auger@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::235;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x235.google.com
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
X-TUID: wtIdelcQqvBT

On 26/2/24 19:11, Eric Auger wrote:
> This allows to choose which granule will be used by
> default by the virtio-iommu. Current page size mask
> default is qemu_target_page_mask so this translates
> into a 4K granule.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
> ---
> v4 -> v5:
> - use -(n * KiB) (Phild)
> 
> v3 -> v4:
> - granule_mode introduction moved to that patch
> ---
>   include/hw/virtio/virtio-iommu.h |  2 ++
>   hw/virtio/virtio-iommu.c         | 28 +++++++++++++++++++++++++---
>   qemu-options.hx                  |  3 +++
>   3 files changed, 30 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
