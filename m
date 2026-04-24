Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F32A3FDEE28
	for <qemu-arm@archiver.kernel.org>; Fri, 24 Apr 2026 00:06:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wG43O-0006ap-Tg; Thu, 23 Apr 2026 20:05:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucaaamaral@gmail.com>)
 id 1wG43O-0006aP-2W
 for qemu-arm@nongnu.org; Thu, 23 Apr 2026 20:05:54 -0400
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lucaaamaral@gmail.com>)
 id 1wG43M-0000xt-GC
 for qemu-arm@nongnu.org; Thu, 23 Apr 2026 20:05:53 -0400
Received: by mail-dy1-x1330.google.com with SMTP id
 5a478bee46e88-2bd9a485bd6so8821596eec.1
 for <qemu-arm@nongnu.org>; Thu, 23 Apr 2026 17:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776989151; x=1777593951; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oCzWXRgOCadYTORyOC3+pSx/THt4GuRTdvIpDdRgxN0=;
 b=dEnidserK1gQSFBAGWSQjWHnJH+KjSmKGd9PEIBTunudpiDOYhwPzbkfIdMCfFy5bf
 gEL1b7VSl5YkTyaETXBWqJz2lk4qgo3+F8ogUfawsRqTPxM/h3G8kRbUk0YjoOqqKdNl
 oMsysZDiH0dfpcNkOFZwIY4Podo/tJehhdXhH9a2soMHSoS1ixNCarOyrBOOpEJI83No
 KqTDRalHKvOozv4CclCgexSNvvLGS/qep9KnDjvHQTiztd4JMLiAquj5+qey/eiySi4Z
 ymWw7VGLIh551U0cUbJs3vWyyQEt1DIqUbh9At2BDxgc2Gg/GztK1HkTeAXqOIjZcvrR
 NOVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776989151; x=1777593951;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oCzWXRgOCadYTORyOC3+pSx/THt4GuRTdvIpDdRgxN0=;
 b=qL0ufJGzrsrLncP7d1I65p9adtQgEUcOxGQdoug+RoALFS8bm9mtyxK8PTY39B4dug
 G3TTb6dlH1JXdk1vhZ16eYwovypmvqryC6AfZzHGnQSysmgOrEYRIXzlpIE7HaMPO7ij
 V2gldxbUp5eqjFSw8gxx/JLyCIEed/Dc0MYoq3vngjM/rvBAs6Yb3Ey2ZXe+YMzUHA2t
 LDMknXFv97bQnlaRj4bTtVCVe+0T+weEWx1xP6MPyZziqjahmwPlvXIAHb5TlVOGB4bn
 efvzqSCRUZ5I3SI9Ss96JM9Sh3/NjrmXrbF3saFkOqQViln5eMABBIfPib5HqScbpNsp
 VV4w==
X-Gm-Message-State: AOJu0Yzix40xj5kN8VLkgELo+zaCrcyU28lkoic9dLIwSSkvxq0wiHL4
 zUsEVkoL0ABY0rGPR3snw8dTgkVJnYy0Xh2lsUcLt1FNUylfmI6spJdJ
X-Gm-Gg: AeBDiesQOJ4ck29W3KTxx+9zwE04PnAtW8tYF7SN6LB0anPYD/lq77lUNK0MKQPdAmN
 oKRLouK6YT1rL/ZbEH7d96T1f1ULIzIxj7WsAOobthll+cm3FurtOaB+DiEuvzaiZqoPFQzjBpy
 KkVhlREr5CTneJBguOT24q5fyVX0U/BB7hquDPYzQ/mWg4SHgN0FWL3KnomCSWAtEv5F2OTmQtE
 oViTyMJ28YUpZcWVOdUlaz1LNyNR4acGrQFt6e0edFsoFzkidJ70Lcq0kBIsNbxtlEhTz5oPCWQ
 qRWbbHmPFuSSR0Rg4hhq/4XNdCLMNrzUrahpjL0a0WrW+64DijnQgsKzx+6Hc5zVBTceSDSrjlZ
 +jPoERJ3mEjF78Ioc5jkd6TraBVYIQ1hPYNYEnZiCtcVQhaOmmlGMYUn2c7fXnZHo8885Xg5wU0
 kkDIGFdvEVgSaYworQoeDAq6wEtRz8Smccgh5YrAXCn9o2mqjCDH644Pi3LL1+T1zVjCqVSx9m
X-Received: by 2002:a05:7300:8622:b0:2c9:1943:e7ff with SMTP id
 5a478bee46e88-2e465773791mr16890359eec.10.1776989150657; 
 Thu, 23 Apr 2026 17:05:50 -0700 (PDT)
Received: from localhost.localdomain ([2804:7f4:c030:44a8:c4b9:45be:963d:f3a])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2ea8e4b373dsm12958055eec.6.2026.04.23.17.05.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Apr 2026 17:05:50 -0700 (PDT)
From: Lucas Amaral <lucaaamaral@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, agraf@csgraf.de, peter.maydell@linaro.org,
 mohamed@unpredictable.fr, alex.bennee@linaro.org,
 Lucas Amaral <lucaaamaral@gmail.com>
Subject: [PATCH v5 0/3] hvf: map granule abstraction, configurable IPA,
 and MAP_FIXED alignment fix
Date: Thu, 23 Apr 2026 21:05:41 -0300
Message-ID: <20260424000544.9617-1-lucaaamaral@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1330;
 envelope-from=lucaaamaral@gmail.com; helo=mail-dy1-x1330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Fix a bug in the MAP_FIXED blob mapping path (introduced by 4eb0aace)
where non-host-page-aligned offsets cause mmap(MAP_FIXED) to fail with
EINVAL.  This affects any host where the page size exceeds the guest's
(ARM64 with 16KB/64KB pages, macOS ARM64).

This series introduces:

1. MAP_FIXED alignment validation in virtio-gpu: check that both
   offset and blob size are aligned to the host page size before
   calling virgl_renderer_resource_map_fixed().  When not aligned,
   fall through to the subregion method (which works at any
   alignment).

2. A map granule abstraction (hvf_set/get_map_granule) replacing
   hardcoded qemu_real_host_page_size() calls in HVF memory mapping.
   Non-aligned regions return early instead of proceeding with
   add=false (which attempted an unnecessary unmap).
   An 'ipa-granule' property (auto, 4k, 16k) on the HVF accelerator
   object allows opt-in configuration:

     -accel hvf,ipa-granule=4k

   The property follows the kvm_arch_accel_class_init() pattern:
   ARM registers the property in hvf_arch_accel_class_init(), x86
   provides an empty stub.

3. macOS 26 IPA granule support via hv_vm_config_set_ipa_granule(),
   reading the ipa-granule property to select HV_IPA_GRANULE_4KB or
   HV_IPA_GRANULE_16KB.  Falls back with a warning on macOS < 26.

Dependencies: none.

Changes v4 -> v5:
  - Use g_strcmp0() instead of strcmp() (Alex Bennée)

Changes v3 -> v4:
  - Rebased onto current master (no code changes)
  - Fix Signed-off-by email in patches 2/3 and 3/3
  - Resent as new top-level thread per Alex Bennée's feedback

Changes v2 -> v3:
  - Rebased on current master
  - Add MAP_FIXED alignment validation (new patch 1)
  - Move #ifdef __aarch64__ property code into hvf_arch_accel_class_init
    following kvm_arch_accel_class_init() pattern (x86 empty stub)
  - Use MAC_OS_VERSION_26_0 named constant
  - Remove Venus blob mapping warning

Changes v1 -> v2 (Mohamed Mosaad review):
  - Replace hardcoded 4KB with configurable ipa-granule property
    (auto, 4k, 16k) on the HVF accelerator object.
  - 'auto' defaults to host page size; explicit values opt in.
  - Add fallback warning when macOS < 26 can't honor the request.
  - Add Venus blob mapping safety warning.
  - Use KiB constants instead of magic numbers.

Lucas Amaral (3):
  virtio-gpu: validate host page alignment for MAP_FIXED blobs
  accel/hvf: introduce map granule abstraction and IPA property
  target/arm/hvf: configure IPA granule on macOS 26

 accel/hvf/hvf-all.c           | 30 +++++++++++++--
 hw/display/virtio-gpu-virgl.c | 45 +++++++++++++---------
 include/system/hvf.h          | 15 ++++++++
 include/system/hvf_int.h      |  2 +
 target/arm/hvf/hvf.c          | 72 +++++++++++++++++++++++++++++++++++
 target/i386/hvf/hvf.c         |  4 ++
 6 files changed, 147 insertions(+), 21 deletions(-)

-- 
2.52.0


