Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6FB5CCA470
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Oct 2025 08:24:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v3s5s-0000Tt-1B; Wed, 01 Oct 2025 04:21:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3s5q-0000TC-K6
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 04:21:46 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3s5f-0005Ds-Uu
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 04:21:44 -0400
Received: by mail-wr1-x441.google.com with SMTP id
 ffacd0b85a97d-3f0308469a4so3883479f8f.0
 for <qemu-arm@nongnu.org>; Wed, 01 Oct 2025 01:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759306890; x=1759911690; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UYQLfS3wHinTh/qC50pdHFAAD2+v7Vtk7mze5MUxp5E=;
 b=m8DBcgSqy5iKPr0jgb08yr1FAKc89RUTK2Se0PZI/BgV7swMhx36gscid2tE5E2BJ3
 /Q4GHI7Csc69lmt2My4dY9helUQ81MqZp3CGimyPyTL6BHjsheWPtCGLnWTnTddzhpgZ
 ODGHNgicG0mEXe8iTYf2vLM1IAUBBNNMq5T7JEcLqNXJM8aFempU/wgOwk5hrRvpTJew
 azfHRJkgPEIxydhTW9Plov2FY9OX+5WpMsaiMfLkLaoWABMgJaevDld8RbNp05PKbTAs
 e18eGdKQunAx0eQuLMmHNGBYtmTRXAQ4O9MC2hABtb9BVvlcEwe/dqcem5nKiLem97bA
 UOAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759306890; x=1759911690;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UYQLfS3wHinTh/qC50pdHFAAD2+v7Vtk7mze5MUxp5E=;
 b=LFuBd60YNnrmMXAU9YOYq8RM+xfXwChGTP5mLjZZShUuGJIHM2zPG0b3O3nONUangc
 230cPL8TOAQ0RzloOJxGVhg74UPwubcnuMgpfyvLsTqoRMsJYazHmI49bKIqncRxZZCH
 PuIjQlRw/lSd9axDYjFkRbMokHxtEXbZsRfBMmiWXz5qJBKsLQsA1d9VanJYQUg0tcv4
 7LZBMK6MHQ7g56Asgg/RLD04mrSnin5cA3hkLTNoGc9fJVmBkqqtBD0nBHYHg6p9XHA6
 no8KtKSl658HRE9xvE0vA2sK5UI1pGYWsVA9wDUe9xcBXFzUMXZDJoQSzBQTApVnrzQm
 tMlw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHLno5M4VEH6l4/0sz0rl3oNACxBtt+d8ajfaUrXgmISS9Z+BTfRILxGdhAtzku9zikbfs/sdkyQ==@nongnu.org
X-Gm-Message-State: AOJu0Yx77acA8jRqEKnas/XUfuy4xpdR1Qs0VhCn/4xNofdUGYq34zMk
 mEfID1uagCtR3tLCDI+lDOmao7fRtfvL0W20TMuZi2Z0c1nMqfPneYCtihtBFkvMfwA=
X-Gm-Gg: ASbGnctNPsfyy2AK2nO3uQkSuL/UYFg89/uZ7nE/S/WcXb4CwrJaXLCNJ18MwIhTGC9
 Zk4opt0xSuX0FHwbUr7Xb/Eo70hunOqlrc8r6rW/SidqOEEJRwgmeAp/9VnUfe76tdxHaE0Fru/
 f2dwQ1lpRW2Zn5ZH1qHnuEzopkWQB5M5p+9Evy53RZkaaBAvuJg7GLeUP1Ospa3yyY7YB98qQp+
 SYRiPsLhVJ8XWd8pMzdCSuHpxShc8YmwICJq0iD4TDv8LvOKwXbghCWpl9GVncOJXf6jc/L3C8V
 F7fLkFrzmKrIhQMsOJYKzOZjqirWZCRW04Qn9ZxC7ykbqmaYvwHDInZDNZ1X5w76YmL67sHHEvB
 9+U9UfGoTYoVJSkXgkYZDurazTm8VEGijGhlHCSBnMkbj7bkWu3DSzCFrf/rng1wO+ksj6v6G6t
 09HgZZZSSFuerzYC/C4JF5
X-Google-Smtp-Source: AGHT+IHKt/ivTsoC6PZcZTjZzL5LDs95xiGR88ZSKusdRALPX64xSrvTFt9lt4nGAnJGd8G2pFxftQ==
X-Received: by 2002:a05:6000:310d:b0:3ee:af89:a68 with SMTP id
 ffacd0b85a97d-425577f321dmr1791557f8f.22.1759306889640; 
 Wed, 01 Oct 2025 01:21:29 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fc8aa0078sm25842872f8f.59.2025.10.01.01.21.28
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 01 Oct 2025 01:21:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, qemu-arm@nongnu.org,
 Jagannathan Raman <jag.raman@oracle.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Jason Herne <jjherne@linux.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 kvm@vger.kernel.org, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Fabiano Rosas <farosas@suse.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-s390x@nongnu.org,
 Peter Xu <peterx@redhat.com>
Subject: [PATCH 00/25] system/physmem: Extract API out of 'system/ram_addr.h'
 header
Date: Wed,  1 Oct 2025 10:21:00 +0200
Message-ID: <20251001082127.65741-1-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x441.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Following a previous comment from Richard in [*],
reduce "system/ram_addr.h" size by un-inlining a
lot of huge functions that aren't really justified,
and extract the API to the hew "system/physmem.h"
header, after renaming the functions (removing the
confusing 'cpu_' prefix).

(I plan to eventually merge this myself due to the
likelyness of conflicts).

[*] https://lore.kernel.org/qemu-devel/9151205a-13d3-401e-b403-f9195cdb1a45@linaro.org/

Philippe Mathieu-Daudé (25):
  system/ram_addr: Remove unnecessary 'exec/cpu-common.h' header
  accel/kvm: Include missing 'exec/target_page.h' header
  hw/s390x/s390-stattrib: Include missing 'exec/target_page.h' header
  hw/vfio/listener: Include missing 'exec/target_page.h' header
  target/arm/tcg/mte: Include missing 'exec/target_page.h' header
  hw: Remove unnecessary 'system/ram_addr.h' header
  accel/tcg: Document rcu_read_lock is held when calling
    tlb_reset_dirty()
  accel/tcg: Rename @start argument of tlb_reset_dirty*()
  system/physmem: Rename @start argument of physical_memory_get_dirty()
  system/physmem: Un-inline cpu_physical_memory_get_dirty_flag()
  system/physmem: Un-inline cpu_physical_memory_is_clean()
  system/physmem: Rename @start argument of physical_memory_all_dirty()
  system/physmem: Rename @start argument of physical_memory_range*()
  system/physmem: Un-inline cpu_physical_memory_range_includes_clean()
  system/physmem: Un-inline cpu_physical_memory_set_dirty_flag()
  system/physmem: Rename @start argument of physical_memory_*range()
  system/physmem: Un-inline cpu_physical_memory_set_dirty_range()
  system/physmem: Un-inline cpu_physical_memory_set_dirty_lebitmap()
  system/physmem: Rename @start argument of physmem_dirty_bits_cleared()
  system/physmem: Un-inline cpu_physical_memory_dirty_bits_cleared()
  system/physmem: Rename @start argument of
    physmem_test_and_clear_dirty()
  system/physmem: Reduce cpu_physical_memory_clear_dirty_range() scope
  system/physmem: Reduce cpu_physical_memory_sync_dirty_bitmap() scope
  system/physmem: Drop 'cpu_' prefix in Physical Memory API
  system/physmem: Extract API out of 'system/ram_addr.h' header

 MAINTAINERS                       |   1 +
 include/exec/cputlb.h             |   5 +-
 include/system/physmem.h          |  56 ++++
 include/system/ram_addr.h         | 413 ------------------------------
 accel/kvm/kvm-all.c               |   5 +-
 accel/tcg/cputlb.c                |  19 +-
 hw/ppc/spapr.c                    |   1 -
 hw/ppc/spapr_caps.c               |   1 -
 hw/ppc/spapr_pci.c                |   1 -
 hw/remote/memory.c                |   1 -
 hw/remote/proxy-memory-listener.c |   1 -
 hw/s390x/s390-stattrib-kvm.c      |   2 +-
 hw/s390x/s390-stattrib.c          |   2 +-
 hw/s390x/s390-virtio-ccw.c        |   1 -
 hw/vfio/container-legacy.c        |  10 +-
 hw/vfio/container.c               |   5 +-
 hw/vfio/listener.c                |   2 +-
 hw/vfio/spapr.c                   |   1 -
 hw/virtio/virtio-mem.c            |   1 -
 migration/ram.c                   |  79 +++++-
 system/memory.c                   |   9 +-
 system/physmem.c                  | 342 +++++++++++++++++++++++--
 target/arm/tcg/mte_helper.c       |   5 +-
 system/memory_ldst.c.inc          |   2 +-
 tests/tsan/ignore.tsan            |   4 +-
 25 files changed, 495 insertions(+), 474 deletions(-)
 create mode 100644 include/system/physmem.h

-- 
2.51.0


