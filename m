Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32BDFFED9F6
	for <qemu-arm@archiver.kernel.org>; Tue, 17 Mar 2026 17:49:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w2YXM-0003bu-OR; Tue, 17 Mar 2026 13:49:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucaaamaral@gmail.com>)
 id 1w2YXH-0003b2-Iq
 for qemu-arm@nongnu.org; Tue, 17 Mar 2026 13:48:56 -0400
Received: from mail-dy1-x1333.google.com ([2607:f8b0:4864:20::1333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lucaaamaral@gmail.com>)
 id 1w2YXF-00074p-0M
 for qemu-arm@nongnu.org; Tue, 17 Mar 2026 13:48:54 -0400
Received: by mail-dy1-x1333.google.com with SMTP id
 5a478bee46e88-2bea8220c38so3616657eec.1
 for <qemu-arm@nongnu.org>; Tue, 17 Mar 2026 10:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773769731; x=1774374531; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qbvbq0VTItu7GuY8OaExbqLTy+JwMWJd64qMCbghOpk=;
 b=DJwXNSDgnOtV0544uqyqbk/RkZaC5PP0twLwvROR6RECP6hRzzn+77byHNZSMSubX4
 vrELL1pDU+FO7QALaBy4Xe7sAMLe9W55+46KxjGU/MEqHsQRcAIrAH3TL8446lVgYJqz
 4wgnrTT6Afy1kg38AqMlBNM6LhW7WYzYEYOkXs9iAFwWNUbrNTzp6Onbp3OrwsoFQ7iL
 hhzraeTSfGNRCPUEBdvBPEIdoamnC1mAY2t9xEfozba4J5b81zSOQjwoDtkoUzktQU39
 N3Se2AW+XDx0D9jJ8GgusAjEpvLsCTMRSKeQfDhX9dgJBR6Ib+EiJr5u5PlRegNwOmtO
 6ahg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773769731; x=1774374531;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qbvbq0VTItu7GuY8OaExbqLTy+JwMWJd64qMCbghOpk=;
 b=tOnocOR13/gFeFN7m9no4Fsfy/7QIiHueNjeYLy/OO2ZLiTXRyHxNvuqMoSCSPbGfu
 KPLIhbYT5nHPVvswpFR9PUAuUAGCGSuW0cqGiekL2J4GtIxmT+/EtHT8psAW1YBG9xP7
 XM5RJMPfcc+AQrzaDHnhZJh2oURP/jIft+mcbVuz/elEy64MmLhX06VgDGsaqV+cwEK0
 Y0DhxO/FJuMJRn3fqVt/Zmo0ypBMMWAaSG6Y3YSGIoGkmbNteAE4eqcGHbztJRAAs/Bj
 YqorTjNfjAfL8GRW/BBdSkjPqYIEECjYsNLB5pkQysqgqDK+VnTsooKDQDK9dSzM6PtZ
 cYqg==
X-Gm-Message-State: AOJu0YxAbadhj4w3aD8YNRZLRK4MDONjRIETt2osf3RiJrc0+4q6cuHb
 OPtnt9LF8AGTzIHQhPbquK5CLB2JUb1cQJsRJHCHkJjXv1i88q7WNsVN
X-Gm-Gg: ATEYQzwrkzRomFje6l156rQcQA35lED6rXmBMqvLAQyLFwAyqyHZDWKzDw0upPdxbrg
 RpKZKVqC6l4w8hbj7p2IMwUeQzgH5/OVxU4Sa719l9MIMFENne7HpyoB1nJ+yd1wJFnfYxM/1kM
 ve/qNicZllu+Nk7gkxHCEVTrC8s9hUjENmPtKMLWLELb4Lmauwvw4dSyxNf7j1MhomdIcVcnF4a
 1tnyD7YE1O2D//29FCYyIIs4WgSNhh6OHcWliYrkj3OFyhfssJ5UfbQXTRSTuD550kdvWxju/Mw
 cUzT3IEEtHYRclKUNL3GgQ/xNzgVp0yXdN0LYUzKCuyC+5D/MtXriPgoG/Aq8JBOt2kjGPKGhqU
 6pOHP0xdU8qPbG13dgril9I4azJ9dBKjbiSMCJwcggTWu8+/Mqeu+RPYC27m8EW3EQ1Vnl0nVnT
 pZ0a8rbxxhZtifkXgNd0M4sLo9ajUY9tnlxL+SG8utUyGjo4pFpGPM
X-Received: by 2002:a05:7301:4187:b0:2c0:ae1b:4568 with SMTP id
 5a478bee46e88-2c0e4f5d62fmr156638eec.7.1773769730747; 
 Tue, 17 Mar 2026 10:48:50 -0700 (PDT)
Received: from localhost.localdomain ([143.54.78.51])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2c0e5583533sm190487eec.18.2026.03.17.10.48.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 17 Mar 2026 10:48:50 -0700 (PDT)
From: Lucas Amaral <lucaaamaral@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, agraf@csgraf.de, peter.maydell@linaro.org,
 mohamed@unpredictable.fr, Lucas Amaral <lucaaamaral@gmail.com>
Subject: [PATCH v4 0/3] hvf: map granule abstraction, configurable IPA,
 and MAP_FIXED alignment fix
Date: Tue, 17 Mar 2026 14:48:42 -0300
Message-ID: <20260317174845.31768-1-lucaaamaral@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1333;
 envelope-from=lucaaamaral@gmail.com; helo=mail-dy1-x1333.google.com
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

Changes v3 -> v4:
  - Rebased onto current master (no code changes)
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


