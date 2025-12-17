Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 202C9D6554E
	for <qemu-arm@archiver.kernel.org>; Wed, 17 Dec 2025 14:32:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vVsZd-0001aA-G6; Wed, 17 Dec 2025 09:32:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vVsZM-0001Y2-Sj
 for qemu-arm@nongnu.org; Wed, 17 Dec 2025 09:32:04 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vVsZI-00071x-Vz
 for qemu-arm@nongnu.org; Wed, 17 Dec 2025 09:32:00 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-477bf34f5f5so43218085e9.0
 for <qemu-arm@nongnu.org>; Wed, 17 Dec 2025 06:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1765981914; x=1766586714; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bm1lEufkdD0ycuNfJSZZcU6UUrZFUPztcWLPFzlXpEU=;
 b=p56s5zlm3TiNXtKaquw2cShcc4w0lqco86Sm57uovKOjXYiLGPK8cMoPlxyWfjiz+9
 vG+hvAYiP+3lcvxwEzUU57STasu6s6krUUrYesG6UxqgHDLcxe1DZK1+QcXoH6AsuoSy
 UfxroqOdk3g9RmV7XzmHYjPskensVF9MofOHeYdfgZC6L5k9NdG4/T7IW56d34B2/3Jk
 BLk0/MA91MlkpeG6bvrk9LlQTbsminVOUGHYQUN3JItzRO048ImvTZqvV593lVOtz6Z5
 FPwsLfzxN38yXV2FkcLBTVMwGGYJbJ0IkkxxtHrCMfa1tbZrvlBV78BNE2PK5LT73PUr
 wVOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765981914; x=1766586714;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bm1lEufkdD0ycuNfJSZZcU6UUrZFUPztcWLPFzlXpEU=;
 b=IrhttAgZ3w8vUpmlB4s4RlOn7Tp/OHAtJdtl+RWbc3UN67CdGlrPrg/hR75hKQRpUX
 0onCT5GIU2QEPEQZnL8/CmZ0bA0eoO1rLVNSH4pmy6qLHhZyJcR1P7REjGT+F+9bFUWx
 GVsbVhfB6c5Glm377MR6gd+9MZuHsln5Ab+xeJPwUW53xxhy/Sdn6UZ9BY8C7tmk0j4D
 1EVogjJdeczTOraWAD8gaUh8phaECG9FfTDGDKdV0lVSb97BnCbfoAXZCkXkvwGHdZ9l
 JwMA3leB4EVa0gGDxtshHBzYUZkkQYB+NQaXtUzI8gWDEQt5v/9jtbAI+Uemcc+RkFOq
 grlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyO0+BMiavQb8G3fL7sxqYDEmUNk6aJbcEoSUPCzN1kMAzd2gqBKelIllB6kLdT4n1RnUztkoetg==@nongnu.org
X-Gm-Message-State: AOJu0YxXimPWkI7gUU5pCxLacihdCBmCXTdMQda/D9TR0mWjRptBMMUd
 cDwUzKrDSeHEVhgxF2eGTLCVsjlQ4sB1fi7gwkFBlkP0DG+wsTCy5LfjTDtKkojT+Es=
X-Gm-Gg: AY/fxX6JARZhcD/8C7jcrhCimYZZKQC+e6DCS4t3YBrOvGfwgru1wCOkA+EQr1aKSXR
 US/aDujjX+L/1y8kPyOI2SBxrftG6Nj3Mbg7vLTbYNQwb4XJUtY7QBeewgmqxYv5IOFvhlj4Hvm
 2ap6DhUFyigFWnkVSmpV6MIfOjEdFjsXQlCI3ovKUKaumFUkqOiRLEXiKfUqvJp6UKnFedZX4O/
 vMBOFhLx/d/j1H3lx+xPusBdnjjZbPZLdGIuYWiTiPEi+hFd+2DRiaqmnGSc4zUJoghTI/f6PqG
 v1Fmeap0NcBKABi+6Sytl9n23gDJm0Y0FsDLPeNOMeH08HkO0R84iUoaolgoPhmv211FMtr3VFH
 U24hg9g+kMKJG2WNWeTXxGkjicyRkg15o1BBAjWOZkGRiVg4ZhMXR+Z27Ns74gAyKv5pJkr3XMw
 6CKJdda4Vr3JHoCf8lDrEX28Tg9/WiCMs15LRbwJp3OZcSXhq4kKpgIqDrqrVe
X-Google-Smtp-Source: AGHT+IFuVHQ3i+yvTmtxvFbhb0Wo9uSXQh1cUms4j24KV4ia2in7c/HSvCKOSXg1WDf4F6vVsFaGiw==
X-Received: by 2002:a05:6000:310f:b0:430:f7dc:7e96 with SMTP id
 ffacd0b85a97d-430f7dc80f6mr12890259f8f.48.1765981913476; 
 Wed, 17 Dec 2025 06:31:53 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4310adf6fc1sm4619619f8f.40.2025.12.17.06.31.51
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 17 Dec 2025 06:31:52 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Anton Johansson <anjo@rev.ng>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@kernel.org>, Peter Xu <peterx@redhat.com>
Subject: [PATCH 00/14] system/memory: Clean ups around address_space_ldst()
 endian variants
Date: Wed, 17 Dec 2025 15:31:36 +0100
Message-ID: <20251217143150.94463-1-philmd@linaro.org>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi,

This series is preliminary on unifying endianness for the
single binary. The goal is to have a clean API ready for
harder refactor.

First we remove the _notdirty() and leul_to_cpu() helpers,
then we prepare the subpage_ops[] MemoryRegionOps to handle
distinct endianness in the same binary, and finally we add
a pair of ldm()/stm() variants to directly infer the access
size and endianness from a MemOp argument.

(As a bonus we also moved MemoryRegionCache out of memory.h).

Please review,

Phil.

Philippe Mathieu-Daudé (14):
  target/i386: Remove x86_stl_phys_notdirty() leftover
  target/sparc: Update MMU page table using stl_phys()
  hw/arm: Update bootloader generated with '-kernel' using stl_phys()
  system/memory: Remove address_space_stl_notdirty and stl_phys_notdirty
  system/physmem: Inline and remove leul_to_cpu()
  system/physmem: Use explicit endianness in subpage_ops::read/write()
  system/memory: Split MemoryRegionCache API to 'memory_cached.h'
  system/memory: Inline address_space_stq_internal()
  system/memory: Define address_space_ldst[W] endian variants via
    template
  system/memory: Define address_space_ldst[L] endian variants via
    template
  system/memory: Define address_space_ldst[Q] endian variants via
    template
  system/memory: Factor address_space_ldst[M]_internal() helper out
  system/memory: Pass device_endian argument as MemOp bit
  system/memory: Sort methods in memory_ldst.c.inc file

 MAINTAINERS                                  |   3 +
 include/hw/virtio/virtio-access.h            |   1 +
 include/qemu/bswap.h                         |  11 -
 include/system/memory.h                      | 191 -------
 include/system/memory_cached.h               | 207 ++++++++
 target/i386/cpu.h                            |   1 -
 include/exec/memory_ldst.h.inc               |  52 +-
 include/exec/memory_ldst_phys.h.inc          | 111 +---
 include/system/memory_ldst_endian.h.inc      |  33 ++
 include/system/memory_ldst_phys_endian.h.inc |  57 ++
 hw/arm/aspeed.c                              |   3 +-
 hw/arm/boot.c                                |   6 +-
 system/physmem.c                             |  87 +++-
 target/i386/helper.c                         |  10 -
 target/sparc/mmu_helper.c                    |   2 +-
 system/memory_ldst.c.inc                     | 514 ++++---------------
 system/memory_ldst_endian.c.inc              |  64 +++
 17 files changed, 546 insertions(+), 807 deletions(-)
 create mode 100644 include/system/memory_cached.h
 create mode 100644 include/system/memory_ldst_endian.h.inc
 create mode 100644 include/system/memory_ldst_phys_endian.h.inc
 create mode 100644 system/memory_ldst_endian.c.inc

-- 
2.52.0


