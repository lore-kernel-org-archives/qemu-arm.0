Received: by 2002:a05:7023:b15:b0:92:a90b:6588 with SMTP id qd21csp436977dlb;
        Tue, 4 Feb 2025 10:11:37 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXqZFrzuW7oAX5xBdtnLciWyCY4ZUwYfKaPZy/B0OKSdoQ+Ya++KitqgrYmnx5/dDNzUVG9RoZm/p7lVg==@linaro.org
X-Google-Smtp-Source: AGHT+IHLyHMxKA3CIoRPpr6LXo7kFTIJn0FQFhI+7gVCHDuIf82sHMWx2qMPmSMLNYti7oFdE8A5
X-Received: by 2002:a05:622a:1985:b0:467:874a:fc77 with SMTP id d75a77b69052e-46fd0bba8cbmr360639461cf.45.1738692696937;
        Tue, 04 Feb 2025 10:11:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738692696; cv=none;
        d=google.com; s=arc-20240605;
        b=lGG2FKGrTgFGKEGrhEa4P/xmHRYIKc/nftVGWR+kyzqpsarHlSajS3CirtbBS9hjwm
         TiidY36fTnK4A3Xb6fce6wWQkqBEnIOzL+4A9GHdsIxNictTKDVN9ghieMdpLGUUkLJk
         XONUUXjQQpNs7tGW13LGUjtsNn3v5NlFZ3/CISqGhFEwEEu4DibF8RzNSTTkfjZT3jPN
         5DqtwLbFDlKrAjP6cgsvpI+XetYtPJ0U5cfP1cU4FIQZd1mJsu3ki/JNngtb8VcMH4i8
         e9TaqxxxxV4396LZQFZ2x8SYb44lFgjKsS/YAMbjWv9zj6f59u5tPRrwwfe0/WzX+RYh
         6uJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ZlE4fNYmUStQOF+rAXXEDQvHrAQjzPrrJWt5KEXXmgw=;
        fh=iZPAgHKJWkEy0t8Ho2DKouf85/+WOlle/+h/UDeZOTE=;
        b=RrUv1rlnLcC+ry5BA1Gd72As0tR/p9ItFGLYxXpqls+eybv8oeoHioiUJC7eXkuCYI
         64LViWAxDVYac1hs/QsDE4pJNJC7ygyIgZKZDqBB3zLwOx3asuj7J9IAfZAn2XRHm4T1
         l/wIq/AcPj21XuKC7bjA0MvuCjFBvNaXNwT27gGqTc7NgAAIJGrFlSglf2CBBka1vHRz
         53UQrnwPVTa9cAYlQBu1vWsG/qt49JDkck/qhmRpsgT+Cs8JPrPj1OoWNxhMOOTgZgWd
         aaT21FYUK2VYL9LcxZNy8cnlwN+z7WaApiCTeQnfHv2GznU5E5RgaUXCuDYYebqRITF9
         EvOg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=crBb+v0y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47016a00456si33750841cf.127.2025.02.04.10.11.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Feb 2025 10:11:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=crBb+v0y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tfNO6-00009J-NU; Tue, 04 Feb 2025 13:11:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tfNNn-0007j6-3j
 for qemu-arm@nongnu.org; Tue, 04 Feb 2025 13:10:49 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tfNNj-0007cH-Me
 for qemu-arm@nongnu.org; Tue, 04 Feb 2025 13:10:46 -0500
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-38634c35129so4670532f8f.3
 for <qemu-arm@nongnu.org>; Tue, 04 Feb 2025 10:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738692641; x=1739297441; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZlE4fNYmUStQOF+rAXXEDQvHrAQjzPrrJWt5KEXXmgw=;
 b=crBb+v0yWDqdCQF38FVc5mk+JBTPjIuXGKWDIVz06Nmws/NcBh6sPxwdKC9x3aVBxr
 B3Qd8rli/OMPvU7qBnXP+DcYf7Ui/mEB8QLKQ+JwrQKLTP6Cm9aXG2qw8vEbJe26KvK1
 3U8FQFu6a9WlovjMW9ZPbSL3zv5v6CegFVKncfXCOeOQCBkgokat4HHc9bokvnVRqtRh
 m9PjowIYgV4tAzn0vCIDEif6h7nFhT1M3kA7L0hLjYjGKrDbdJYn8LCCEKjfpNWSVPoA
 TAvB5uK499Sd2Xkcl5dZPB0t3flmiOuAWFyASUDQaaFcVuc89l6oNyht5ChF6dCZoeiq
 ugxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738692641; x=1739297441;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZlE4fNYmUStQOF+rAXXEDQvHrAQjzPrrJWt5KEXXmgw=;
 b=dFJalV7IKGNzKmJ5/NSibA37Gg1qZiWS6w1fi7cchKHK/R1B84dhUTB/QYBYqzaWZJ
 ZSaL5SOCZjgrdx0PsGALwDwp2xaguKSGbaXj6io/fEk/gFvlr8MbGRqK5WAatc8DwQh2
 8ktdrSDP/OwR9JaHSXQShLVI/Rs8YaTIS6X+nKtkZJVrDg07JW9mI5hYBzd4LrsXdPFk
 W2qwZ9xRVjAuH6zLfId0wQm+X88sgsC8JM7fa8wECO8bwGnsCfdiwREuNBvq5WATGg2q
 B2K9FY1cRtybG+HIHFcG4kjKil2oE/m5+O3TFRIwnkRG/iqsIFDReWkJrSS08nORmxz7
 ToCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdiCT54Pvg8JdeqmvVKfpjiDFuwelNt6BKKhg/05w/nU1vRlUGckZp3Cz77VDLeyQ84TBiE5MVWw==@nongnu.org
X-Gm-Message-State: AOJu0YySKxW6mdkHhZ5+L5Mu2x4FQ2pt5UAc3d9T4UmntDSdb1pgLnY6
 PRor7qDxtzKnzP2csXaPW3eZ10Eklr0dqzU4oQU/FBqaN2EYkSRi7alG5lwwPT4=
X-Gm-Gg: ASbGncupPnL5YXi9kjsNn0qqjQKj88D1LGre7Ih/kNaxAdo5AQ52BDK9lGu7bbUFurc
 dKT9DF5n7PEI1WHT1FRYPRPplynbb23dMKfX0V6oGVzcUPCFI3fWcyyCrX8jM2crw4q1lfJuv8Z
 uodMTtQwHXvYFi1p2/M7aOIXT3uT115t65j0cmB9z/P74XouagPhYnCamWApbf7qOl4Hi6cyAuG
 z5h9y3fSEkwlcVx2as8vbcuJdqhTXgaXHA78YSZdMimetn5cGrI0fP2MIpPPu9GdCU4Jd8boRE3
 KuzQ6glT6QZ7+Y0f9Hdju3aaWBHDU4jKyCUAhbTnNuaFXjfzAvgbWKPBIfc=
X-Received: by 2002:a05:6000:1a8b:b0:385:ecdf:a30a with SMTP id
 ffacd0b85a97d-38c51b63ed0mr24849695f8f.33.1738692641616; 
 Tue, 04 Feb 2025 10:10:41 -0800 (PST)
Received: from [192.168.69.198] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc13151sm231467285e9.1.2025.02.04.10.10.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 10:10:41 -0800 (PST)
Message-ID: <af58daa1-45a0-4252-be09-38be43233db0@linaro.org>
Date: Tue, 4 Feb 2025 19:10:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] hw/boards: Try to make sense of
 MachineClass::no_sdcard flag
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org, Markus Armbruster <armbru@redhat.com>
References: <20250204180746.58357-1-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250204180746.58357-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
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
X-TUID: /MFuW9T2pCi2

On 4/2/25 19:07, Philippe Mathieu-Daudé wrote:
> Invert MachineClass 'no_sdcard' flag logic and rename it
> to 'create_default_sdcard_drive' to make sense of this
> default value applied to all machines.
> We use the OnOffAuto tri-state to catch implicit default
> values. Then we toggle the logic and remove invalid uses.
> No logical change intended (except the assertion added).
> 
> Philippe Mathieu-Daudé (8):
>    hw/boards: Convert no_sdcard flag to OnOffAuto tri-state
>    hw/boards: Explicit no_sdcard=false as ON_OFF_AUTO_OFF
>    hw/boards: Rename no_sdcard -> auto_create_sdcard
>    hw/boards: Remove all invalid uses of auto_create_sdcard=true
>    hw/ppc/e500: Remove empty ppce500_machine_class_init()
>    hw/arm: Remove all invalid uses of auto_create_sdcard=true
>    hw/riscv: Remove all invalid uses of auto_create_sdcard=true
>    hw/boards: Ensure machine setting auto_create_sdcard expose a SD Bus
> 
>   include/hw/boards.h        |  2 +-
>   hw/arm/cubieboard.c        |  1 +
>   hw/arm/integratorcp.c      |  1 +
>   hw/arm/mcimx7d-sabre.c     |  2 ++
>   hw/arm/npcm7xx_boards.c    |  5 +++++
>   hw/arm/omap_sx1.c          |  2 ++
>   hw/arm/orangepi.c          |  1 +
>   hw/arm/realview.c          |  4 ++++
>   hw/arm/stellaris.c         |  1 +
>   hw/arm/vexpress.c          |  2 ++
>   hw/arm/xilinx_zynq.c       |  1 -
>   hw/core/null-machine.c     |  1 -
>   hw/riscv/microchip_pfsoc.c |  1 +
>   hw/riscv/sifive_u.c        |  1 +
>   hw/s390x/s390-virtio-ccw.c |  1 -

We can now easily see the machines automatically creating SDcard:

$ git grep 'auto_create_sdcard = true'
hw/arm/cubieboard.c:125:    mc->auto_create_sdcard = true;
hw/arm/integratorcp.c:691:    mc->auto_create_sdcard = true;
hw/arm/npcm7xx_boards.c:484:    mc->auto_create_sdcard = true;
hw/arm/npcm7xx_boards.c:497:    mc->auto_create_sdcard = true;
hw/arm/npcm7xx_boards.c:510:    mc->auto_create_sdcard = true;
hw/arm/npcm7xx_boards.c:523:    mc->auto_create_sdcard = true;
hw/arm/npcm7xx_boards.c:536:    mc->auto_create_sdcard = true;
hw/arm/omap_sx1.c:219:    mc->auto_create_sdcard = true;
hw/arm/omap_sx1.c:238:    mc->auto_create_sdcard = true;
hw/arm/orangepi.c:124:    mc->auto_create_sdcard = true;
hw/arm/realview.c:418:    mc->auto_create_sdcard = true;
hw/arm/realview.c:439:    mc->auto_create_sdcard = true;
hw/arm/realview.c:458:    mc->auto_create_sdcard = true;
hw/arm/realview.c:478:    mc->auto_create_sdcard = true;
hw/arm/stellaris.c:1444:    mc->auto_create_sdcard = true;
hw/arm/vexpress.c:806:    mc->auto_create_sdcard = true;
hw/arm/vexpress.c:822:    mc->auto_create_sdcard = true;
hw/riscv/microchip_pfsoc.c:653:    mc->auto_create_sdcard = true;
hw/riscv/sifive_u.c:727:    mc->auto_create_sdcard = true;

