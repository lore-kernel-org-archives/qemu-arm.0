Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp4358202njk;
        Mon, 23 Dec 2024 14:59:26 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVlO81YZakufpJxBL724cgBJdBfavGrNEOJzEuMK4kVejVxrf8RbYX+GQz+KR9RPkEOIaM4tbSI+iLuxw==@linaro.org
X-Google-Smtp-Source: AGHT+IGwwxjYbUl1oUTJv6IzUp6Y3O/Fv3us0W6gWstKPwBEiYgEIg7S2YnrJ2fuOMQKn/GbMpHx
X-Received: by 2002:a05:620a:318c:b0:7b6:c695:fb88 with SMTP id af79cd13be357-7b9ba84f9c6mr2420155485a.62.1734994766109;
        Mon, 23 Dec 2024 14:59:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734994766; cv=none;
        d=google.com; s=arc-20240605;
        b=C2tU8IaFaC5/XXBvMoH2us7M6I7hAVFI8Ua0ppGPo2wUerc6c4Bu6ysfBR8vm9fyfK
         e5wgk5j5LV1SNV3inOP0eTdTc5nWw0gzFJdqeiC6q78pwrc1alCWg/lxARPDcdnKeTk0
         5MVSvjg/VnEWM0mHe6/eBz7nITFBnPIwVdKxNoCbbel/KonG1Wdl7FP9RCm6SFjUBptM
         75L+E48gwqeq1385yMQe0Sh42Nja16BW1hOEGPTDTjel6I7eHbXzXNV9Khlbznn8sRxu
         uzexIiMfDcXtEXwoquILIIE8Cd8Pt5j4Hy52JDxh/+Z+2Th8FWzlvm8WI6ZLTpwPEaRE
         +nXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=YGWkDaqt04ZkiclE3mCSHcf1ELTIIJpcH40F4qJ5MgU=;
        fh=+2B2Waf9dI0oqadjhnMyuhcSeddTgXQyfw5td+Ao0+A=;
        b=VYfsAhd4pnNVL9N+i/H6W2VsL/4pYV1mePNFSVunQamE62iiKBu3y49c5Hsw91qtH4
         Xu7WSLI7q0c4flqKBYArfVIYRZxzVHSAiAn10n0Sx8aQQ1lePmNjW888D49PyFwh3Eqm
         kJy/2cgtDgXILYaatfR//kGhJuYNFBAVKZfMmPuLzcmgvIhJiVLkh62whJEYQ4NwBZv8
         dqwti4QPwgJjnjkVaoB/avYbvXhnm8UTnPIM7ff8F7EODA7sFMKownZBIqBR31nMxV8w
         +O++lgatqm79PkkINabfjZI1bZIB5JjeNI8FrOBr9b/YoYvYEuThgJ4MPUzQvgHt+65F
         +6xQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tZ4PiwKs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46a3ebb9387si127767481cf.362.2024.12.23.14.59.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Dec 2024 14:59:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tZ4PiwKs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tPrNy-0003CJ-8F; Mon, 23 Dec 2024 17:58:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tPrNw-0003BQ-Ly
 for qemu-arm@nongnu.org; Mon, 23 Dec 2024 17:58:48 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tPrNt-0002s8-1J
 for qemu-arm@nongnu.org; Mon, 23 Dec 2024 17:58:48 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43625c4a50dso31942075e9.0
 for <qemu-arm@nongnu.org>; Mon, 23 Dec 2024 14:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734994723; x=1735599523; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YGWkDaqt04ZkiclE3mCSHcf1ELTIIJpcH40F4qJ5MgU=;
 b=tZ4PiwKs52t5NUscZ7en4a5H//2L3hNRH/qHY2aiKmwp4E+/0jr9tKiCBpBimLtKi9
 +EPUTNv/+O/S3wWZ11gwil3b6gGwPRR9+9j5xRntnp5R8w9ZsU15qyslXEuRH6DhiRNV
 HzfJiW2jxJ5SShAlkQYF8qJfyGXsj42/OOrPtWYIrjhjqWNn7eo+8UsWtmXnA2f+kIFu
 RkIe4STkTsMH+D9QxdpMm2KYejT/9/ZImrzIxo5Bdrdsy9eotL+VrtIInhX4bJvF0DOJ
 QllTa5hWcC03BGOqwYazeTK/aVrDKU63VhbFx3KfP46cji7/AhIGpWn5MG3i5u4iSOvd
 MLbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734994723; x=1735599523;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YGWkDaqt04ZkiclE3mCSHcf1ELTIIJpcH40F4qJ5MgU=;
 b=LIULgiuqZxiRqaXlZhh/vx+Yg3bT6DD5Iu+FM21dkWDLsYdX8981/u/C1V9ypzXECj
 W73I4g34+e8sxFO9pjfStq4hcL/N+iNvo4BAHqiDS4OzKGm59jGP8orlHOWYCDP3AuAP
 820CgAtAWRBSFM+itnPcKao4f5BXxVVQaXWoxAkyMsWWmSVInUQggzOe8xepH4v5KfzA
 k6o0AzQmRDtA75RWlReztUhKclAEVEWvJSd+OF/WIW0LNMNrII58Ky71RPX0rtXBeih0
 okMhKA1u78Q4k4Gb/4wK2jeh9dIuA0Q7Pc1D/f+07b/X/JktzvSPp9l1QnT3DOgZ/hLq
 /zCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhiWa/4f7aTm3qTcUQtyrggw0yBAYoIthGufAzYVrdrpNiIF19igZMu9MO03pWH66PV4E+2PPELw==@nongnu.org
X-Gm-Message-State: AOJu0Yx38eqK+2xWrxXlISeAi3p/iBWjDnqpg9xUO2+dy9a0zkSgEgrP
 4NeOUYkIU0pAwjkz7qnRV1PapR22fzFiBzaV1OenmMtspck6GWRhncDMYXt4AvE=
X-Gm-Gg: ASbGnctw/qE6oP1ID4PICWyCsy4pUaiDFuiXYYSekoyqvufBa9RFopOfJu/9nLRrvET
 ZRutb4p8qZID4tMg5wOldQsOPxOahL5FJaF5KlpAifhLzZHFsc9Ctx5KFzrgRZTuQM52TS8iJjD
 Kx9+RR/2hdf5D+tO0clkkv2I6GauVM8Q4TyYR5oQ2jK4vd+NGZ8DtwGw37mGVIrkXbZFqkmFIIi
 UuLP4jm6t721z0xYmO8qnPYdgelIE6KhXSiKdJLhhG1EdQsZwayFxThX9FBNmTIjdU=
X-Received: by 2002:a05:600c:4f51:b0:436:1b7a:c0b4 with SMTP id
 5b1f17b1804b1-4366854850emr93928925e9.1.1734994722648; 
 Mon, 23 Dec 2024 14:58:42 -0800 (PST)
Received: from [192.168.1.117] ([78.196.4.158])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43661289995sm147841595e9.36.2024.12.23.14.58.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Dec 2024 14:58:41 -0800 (PST)
Message-ID: <8554330d-fd9b-4fa5-b37c-161f70b71f7d@linaro.org>
Date: Mon, 23 Dec 2024 23:58:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 00/14] macOS PV Graphics and new vmapple machine type
To: Phil Dennis-Jordan <phil@philjordan.eu>, qemu-devel@nongnu.org
Cc: agraf@csgraf.de, peter.maydell@linaro.org, pbonzini@redhat.com,
 rad@semihalf.com, quic_llindhol@quicinc.com, stefanha@redhat.com,
 mst@redhat.com, slp@redhat.com, richard.henderson@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, gaosong@loongson.cn,
 jiaxun.yang@flygoat.com, chenhuacai@kernel.org, kwolf@redhat.com,
 hreitz@redhat.com, shorne@gmail.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bmeng.cn@gmail.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, jcmvbkbc@gmail.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, akihiko.odaki@daynix.com,
 qemu-arm@nongnu.org, qemu-block@nongnu.org, qemu-riscv@nongnu.org,
 balaton@eik.bme.hu
References: <20241223221645.29911-1-phil@philjordan.eu>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241223221645.29911-1-phil@philjordan.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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
X-TUID: BWCc5L7wj/JT

On 23/12/24 23:16, Phil Dennis-Jordan wrote:
> This patch set introduces a new ARM and macOS HVF specific machine type
> called "vmapple", as well as a family of display devices based on the
> ParavirtualizedGraphics.framework in macOS. One of the display adapter
> variants, apple-gfx-mmio, is required for the new machine type, while
> apple-gfx-pci can be used to enable 3D graphics acceleration with x86-64
> macOS guest OSes.
> 
> Previous versions of this patch set were submitted semi-separately:
> the original vmapple patch set by Alexander Graf included a monolithic
> implementation of apple-gfx-mmio. I subsequently reviewed and reworked
> the latter to support the PCI variant of the device as well and submitted
> the result in isolation. As requested in subsequent review, I have now
> recombined this with the original vmapple patch set, which I have updated
> and improved in a few ways as well.
> 
> The vmapple machine type approximates the configuration in macOS's own
> Virtualization.framework when running arm64 macOS guests. In addition to
> generic components such as a GICv3 and an XHCI USB controller, it
> includes nonstandard extensions to the virtio block device, a special
> "hardware" aes engine, a configuration device, a pvpanic variant, a
> "backdoor" interface, and of course the apple-gfx paravirtualised display
> adapter.
> 
> There are currently a few limitations to this which aren't intrinsic,
> just imperfect emulation of the VZF, but it's good enough to be just
> about usable for some purposes:
> 
>   * macOS 12 guests only. Versions 13+ currently fail during early boot.
>   * macOS 11+ arm64 hosts only, with hvf accel. (Perhaps some differences
>     between Apple M series CPUs and TCG's aarch64 implementation? macOS
>     hosts only because ParavirtualizedGraphics.framework is a black box
>     implementing most of the logic behind the apple-gfx device.)
>   * PCI devices use legacy IRQs, not MSI/MSI-X. As far as I can tell,
>     we'd need to include the GICv3 ITS, but it's unclear to me what
>     exactly needs wiring up.
>   * Due to a quirk (bug?) in the macOS XHCI driver when MSI-X is not
>     available, correct functioning of the USB controller (and thus
>     keyboard/tablet) requires a small workaround in the XHCI controller
>     device. This is part of another patch series:
>     https://patchew.org/QEMU/20241208191646.64857-1-phil@philjordan.eu/
>   * The guest OS must first be provisioned using Virtualization.framework;
>     the disk images can subsequently be used in Qemu. (See docs.)
> 
> The apple-gfx device can be used independently from the vmapple machine
> type, at least in the PCI variant. It mainly targets x86-64 macOS guests
> from version 11 on, but also includes a UEFI bootrom for basic
> framebuffer mode. macOS 11 is also required on the host side, as well
> as a GPU that supports the Metal API. On the guest side, this provides
> 3D acceleration/GPGPU support with a baseline Metal feature set,
> irrespective of the host GPU's feature set. A few limitations in the
> current integration:
> 
>   * Although it works fine with TCG, it does not work correctly
>     cross-architecture: x86-64 guests on arm64 hosts appear to make
>     some boot progress, but rendering is corrupted. I suspect
>     incompatible texture memory layouts; I have no idea if this is
>     fixable.
>   * ParavirtualizedGraphics.framework and the guest driver support
>     multi-headed configurations. The current Qemu integration always
>     connects precisely 1 display.
>   * State serialisation and deserialisation is currently not
>     implemented, though supported in principle by the framework.
>     Both apple-gfx variants thus set up a migration blocker.
>   * Rendering efficiency could be better. The GPU-rendered guest
>     framebuffer is copied to system memory and uses Qemu's usual
>     CPU-based drawing. For maximum efficiency, the Metal texture
>     containing the guest framebuffer could be drawn directly to
>     a Metal view in the host window, staying on the GPU. (Similar
>     to the OpenGL/virgl render path on other platforms.)


> v15 -> v16
> 
>   * 14 patches now, as patch 8 has already been pulled. (Thanks Philippe!)
>   * Fixed a bunch of conflicts with upstream code motion:
>      - DEFINE_PROP_END_OF_LIST removal (4/14 - apple-gfx mode list, 7/14 -
>        pvpanic-mmio, 10/14 - bdif, 11/14 - cfg device, and
>        12/14 - vmapple-virtio-blk)
>      - sysemu->system move/rename: (1/14 - ui/qemu-main, 2/14 - apple-gfx,
>        9/14 - aes, 10/14 - bdif, 14/14 - vmapple machine type)
>   * 14/14 (vmapple machine type):
>      - Moved compatibility setting for removing legacy mode from virtio-pci
>        to proper global property table rather than (ab)using sugar property.
>      - Removed a few superfluous #includes during sysemu rename cleanup.
>      - Removed machine type versioning as it's not necessary (yet?)
>      - Made memory map array const

Great.

> Alexander Graf (8):
>    hw: Add vmapple subdir
>    hw/misc/pvpanic: Add MMIO interface
>    gpex: Allow more than 4 legacy IRQs
>    hw/vmapple/aes: Introduce aes engine
>    hw/vmapple/bdif: Introduce vmapple backdoor interface
>    hw/vmapple/cfg: Introduce vmapple cfg region
>    hw/vmapple/virtio-blk: Add support for apple virtio-blk
>    hw/vmapple/vmapple: Add vmapple machine type
> 
> Phil Dennis-Jordan (6):
>    ui & main loop: Redesign of system-specific main thread event handling
>    hw/display/apple-gfx: Introduce ParavirtualizedGraphics.Framework
>      support
>    hw/display/apple-gfx: Adds PCI implementation
>    hw/display/apple-gfx: Adds configurable mode list
>    MAINTAINERS: Add myself as maintainer for apple-gfx, reviewer for HVF
>    hw/block/virtio-blk: Replaces request free function with g_free

If there are no objection or further comments, I'm taking this
series and will post a PR after xmas & testing.

Thanks all!

Phil.
