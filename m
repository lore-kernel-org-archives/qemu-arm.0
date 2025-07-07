Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5998DC83F0A
	for <qemu-arm@archiver.kernel.org>; Mon,  7 Jul 2025 18:13:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uYqLK-0007NA-FX; Mon, 07 Jul 2025 14:13:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1uYq3u-0002Xz-Ik
 for qemu-arm@nongnu.org; Mon, 07 Jul 2025 13:55:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1uYq3s-0001Jr-6L
 for qemu-arm@nongnu.org; Mon, 07 Jul 2025 13:55:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751910927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MUX9xuBZBm2f4twcHh7L75eZY2NDO8mZQSsE2TAmLsw=;
 b=SPo2R5W8oJsTwRO9shJj8dP6TbqwLUBJWZ9twpHIjgZsSyrbVqfX7nfSgynbTLNr5QYDDA
 c38VXpaORFTz/kNZlNlrphrKXNgmBx2Ttl48XRuqkqqYeK1epZ9asqMP+74+cQQ6teDZG3
 v0DBNbNQRYwB13Dhg2IWrPdaq2t/FCg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-284-Sa4e91b3MNi8-EJGbIrAzg-1; Mon, 07 Jul 2025 13:55:26 -0400
X-MC-Unique: Sa4e91b3MNi8-EJGbIrAzg-1
X-Mimecast-MFC-AGG-ID: Sa4e91b3MNi8-EJGbIrAzg_1751910924
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-45311704d22so19662925e9.2
 for <qemu-arm@nongnu.org>; Mon, 07 Jul 2025 10:55:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751910924; x=1752515724;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MUX9xuBZBm2f4twcHh7L75eZY2NDO8mZQSsE2TAmLsw=;
 b=Igx0sjxTvMAIE/p0eorSvn2V9bl4btkO2Wf9CcWd+RZt0eltPzLlBA372ot5yIcIR6
 BUxoAQzLtz+KR0k299huAS541RTPuF0wAAKnoinOccTop+ovbjsHa6tVjQARCIHSrc1Q
 /VnxtElfp6fUnbg4VoKsF3DURa6AQPwsDcT91xLOWP2BybgVk4m7eOcxHW29PyjtO9zd
 0f3/bTaf1IkDpZFTpRva1Qi/GI9LyfHHEGvM0MYMsHEcAdpPmQQDhptPAybZllKi6X8k
 eF3E5msOUoQb5svBP3jIifNJ7RH9cXv+irP/EujftwYi102Xq1G9EeL5Qr2hxKBad+Sp
 EwnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3raH6LwgWFbo9XIgcvzA5G61+r7p6Vp7Y2Gi8N+Q67Wm5o4VkcvfqgMPPtXWyooYjA+CmGC6XWg==@nongnu.org
X-Gm-Message-State: AOJu0YwslpEAVngM311xzCO3YF+wGhsm4gnavlYIuGfso/vD4A4LCZrF
 PSr4UDknT+sSXfsM0cKWYPRUhpJinyFefSapU3PftyGXWhCmRqhhwg249tZl0vR9IMUA9RpAyYd
 nkrlzr0G7oLzRY2DsjlYoq8RI2pSNn3oiaPNBQqayKl6wO0Yo4wOr6g==
X-Gm-Gg: ASbGncs8A7GQ3bAhfMxVkTFkAGZwqn++CSsaDMQ51Y6bco6ImDc++DekcQMouyLZSX5
 dmxLtE8ZYplN3SQ4wwTTXwbefF+Y3OoxUCK5sDzkpRjFKaCNJvvXrRlsORuXkHMvO+84yc22kQ8
 KXdh8tc56E57FOYSH7n4f4vzx48Y+zmpYSvOzOhGF2Xxf3VJeVgLLesn0JNNRntBD5fdk0A8WsQ
 ETi6rMKYyjarZV2aCo7F1qAWvU/qkRpleJD+64SdAnOJiW4QhHrT4pZErXlX1sOTINTyswWYZ5P
 SG85JFhfHGQiYac=
X-Received: by 2002:a05:600c:8b08:b0:442:f4a3:8c5c with SMTP id
 5b1f17b1804b1-454b4e747e7mr143291555e9.10.1751910924319; 
 Mon, 07 Jul 2025 10:55:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFF928xmGnc9oFWUakWIJygF6d4/XRUG0KbZgm6YlVl7JbYou4eyswBkgsWdda9ditK8GlIsw==
X-Received: by 2002:a05:600c:8b08:b0:442:f4a3:8c5c with SMTP id
 5b1f17b1804b1-454b4e747e7mr143291235e9.10.1751910923834; 
 Mon, 07 Jul 2025 10:55:23 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:150d:fc00:de3:4725:47c6:6809])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454b188d8e6sm118625375e9.36.2025.07.07.10.55.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jul 2025 10:55:23 -0700 (PDT)
Date: Mon, 7 Jul 2025 13:55:20 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org
Subject: Re: [RFC PATCH-for-10.1 v6 00/14] target-info: Add more API for
 VirtIO cleanups & introduce ARM macros
Message-ID: <20250707135403-mutt-send-email-mst@kernel.org>
References: <20250707172009.3884-1-philmd@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20250707172009.3884-1-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BYuR0moElLrPaS-1hiokvB3XqH5FnfXQPwUnjbY2_H4_1751910924
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Mon, Jul 07, 2025 at 07:19:54PM +0200, Philippe Mathieu-Daudé wrote:
> Rather than re-spinning the whole "single-binary: Make hw/arm/
> common" series, restrict to the API additions, but include
> examples of their usefulness (hundreds of virtio objects
> removed from default Linux build).
> Time passed since I context-switched out of this work so I'm
> not sure the DEFINE_MACHINE_WITH_INTERFACES() implementation
> is in the form Zoltan asked.


I think I'd prefer to defer cleanups to post 10.1 - already
too much on my plate as I was out sick. Unless there's a reason
I'm missing to rush this in? Is there a feature we want in
10.1 that depends on it?

> Philippe Mathieu-Daudé (14):
>   target/qmp: Use target_cpu_type()
>   qemu/target-info: Factor target_arch() out
>   qemu/target-info: Add %target_arch field to TargetInfo
>   qemu/target-info: Introduce target_base_arch()
>   qemu/target-info: Add target_endian_mode()
>   qemu: Convert target_words_bigendian() to TargetInfo API
>   gdbstub/helpers: Replace TARGET_BIG_ENDIAN -> target_big_endian()
>   qemu: Declare all load/store helpert in 'qemu/bswap.h'
>   hw/virtio: Build various files once
>   hw/core/null-machine: Define machine as generic QOM type
>   hw/arm: Register TYPE_TARGET_ARM/AARCH64_MACHINE QOM interfaces
>   hw/core: Allow ARM/Aarch64 binaries to use the 'none' machine
>   hw/boards: Introduce DEFINE_MACHINE_WITH_INTERFACES() macro
>   hw/arm: Add DEFINE_MACHINE_[ARM_]AARCH64() macros
> 
>  meson.build                           |  1 +
>  include/exec/tswap.h                  | 83 +--------------------------
>  include/gdbstub/helpers.h             | 15 ++---
>  include/hw/arm/machines-qom.h         | 31 ++++++++++
>  include/hw/boards.h                   |  6 +-
>  include/qemu/bswap.h                  | 73 +++++++++++++++++++++++
>  include/qemu/target-info-impl.h       |  8 ++-
>  include/qemu/target-info-qapi.h       | 36 ++++++++++++
>  include/qemu/target-info.h            | 10 +++-
>  include/system/memory.h               |  1 -
>  include/user/abitypes.h               |  1 -
>  target/ppc/mmu-hash64.h               |  2 -
>  cpu-target.c                          |  7 ---
>  hw/acpi/bios-linker-loader.c          |  2 -
>  hw/arm/allwinner-r40.c                |  1 -
>  hw/arm/boot.c                         |  2 +
>  hw/arm/npcm7xx.c                      |  2 +-
>  hw/block/hd-geometry.c                |  1 -
>  hw/char/riscv_htif.c                  |  1 -
>  hw/core/cpu-system.c                  |  2 +-
>  hw/core/machine-qmp-cmds.c            |  8 +--
>  hw/core/null-machine.c                | 20 ++++++-
>  hw/cxl/cxl-events.c                   |  2 -
>  hw/display/artist.c                   |  1 +
>  hw/display/ati.c                      |  1 +
>  hw/display/vga.c                      |  2 +-
>  hw/net/can/ctucan_core.c              |  1 -
>  hw/net/lan9118.c                      |  1 +
>  hw/net/rtl8139.c                      |  1 +
>  hw/net/vmxnet3.c                      |  1 -
>  hw/pci-host/gt64120.c                 |  1 +
>  hw/pci-host/pnv_phb3.c                |  1 +
>  hw/pci-host/pnv_phb4.c                |  1 +
>  hw/pci-host/ppce500.c                 |  1 -
>  hw/pci-host/sh_pci.c                  |  1 -
>  hw/s390x/s390-pci-inst.c              |  1 +
>  hw/sensor/lsm303dlhc_mag.c            |  1 -
>  hw/smbios/smbios.c                    |  1 +
>  hw/vfio/migration-multifd.c           |  1 -
>  hw/virtio/virtio-config-io.c          |  1 -
>  hw/virtio/virtio-pci.c                |  1 +
>  hw/virtio/virtio.c                    |  2 +-
>  hw/vmapple/virtio-blk.c               |  1 -
>  system/memory.c                       |  1 +
>  system/qtest.c                        |  1 +
>  target-info-qom.c                     | 24 ++++++++
>  target-info-stub.c                    |  3 +
>  target-info.c                         | 33 +++++++++++
>  target/arm/arm-qmp-cmds.c             |  3 +-
>  target/arm/cpu.c                      |  1 -
>  target/arm/machine.c                  | 12 ++++
>  target/i386/tcg/system/excp_helper.c  |  1 -
>  target/i386/xsave_helper.c            |  1 -
>  target/loongarch/loongarch-qmp-cmds.c |  3 +-
>  target/mips/system/mips-qmp-cmds.c    |  3 +-
>  target/riscv/vector_helper.c          |  1 -
>  tests/tcg/plugins/mem.c               |  1 +
>  hw/block/meson.build                  |  6 +-
>  hw/virtio/meson.build                 | 20 ++++---
>  59 files changed, 302 insertions(+), 149 deletions(-)
>  create mode 100644 include/hw/arm/machines-qom.h
>  create mode 100644 include/qemu/target-info-qapi.h
>  create mode 100644 target-info-qom.c
> 
> -- 
> 2.49.0


