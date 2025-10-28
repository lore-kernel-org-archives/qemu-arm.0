Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93DD6CCF9E0
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Oct 2025 18:21:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDoK6-0005DS-HP; Tue, 28 Oct 2025 14:21:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDoK3-0005Ac-F1
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 14:21:32 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDoJx-0002ha-VA
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 14:21:29 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-47118259fd8so49343615e9.3
 for <qemu-arm@nongnu.org>; Tue, 28 Oct 2025 11:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761675682; x=1762280482; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fNxVM5WlfMGkdiBkQUKUIDFWTm7wwHT2PE47Xc1PuFg=;
 b=KoLmBxvjni58P3I/OQ5aT+my8uWkJEZkfW6mDilqMOHKizGej9pakEWC8DXH9Z6BQZ
 6IueRWyctihuPHNVNI9Gk5FzyX5M5pfP5G0gY/MAfYi3DmxzdiTg2xLAfvM/MGg//Vj3
 uBfcJeYZ3rS50B/Az0qi61vt8/Nhrbd5fTBsgNcdIo7QWYHokLUoccjy+y7vkkF2+QjW
 R5eFUuyuxBaF/DRsHFxoGzobE0ap4Ar2Yg46b+ixZJigr3VVHzIyNL9PWJUlAbjyltG0
 E8Wqa6SG2Um5qu0UuCG9dKrZZrUB7Xub3ZdtrjvXHUm8xUANKlPXbPQQpHcbs5gVcILb
 tgsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761675682; x=1762280482;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fNxVM5WlfMGkdiBkQUKUIDFWTm7wwHT2PE47Xc1PuFg=;
 b=oMbVBWDAsOMXL588yh7H8tpAlXeLhY78htV+Z9mamo/GR72Mgo5c822ihbQPC05liy
 Vk1XB7zj3GCAibXFlzVMyT0y18GZ+Z7uzDrNfacMU7JrebliSPgzfpojKucF3Cu3FWG4
 7jOKqGdQSZ3cz1NIWkcyG93maCiJ5L46lwxrxF+EtL9g3WZy3aN7ehIf3Q2wFGyjiYHz
 wDaJMRz27Yf2YFDrtkqFk6LmRSVynmSXe3lz3COjHJT0dV4XA2xrnpYnKXTNlNOb8XPo
 iNmsDEStExj8Mw8hBLVNyF8TfQr35uJ6BU0nkd+6dfIiJNQN5d+dngPkEocTD6/kjc4D
 1eGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAkTZmpCfWn3JAph61SYPZ+O/edY/NCcJoPXKiJv4GItZ1rpXZZOZKwXBIpoKsy5PXrZ4+V6UNuQ==@nongnu.org
X-Gm-Message-State: AOJu0YwAKbRUgsVy+l8fnl7m8/SDiVXldUFHvUraxoa6vFYpCFp3EHr1
 mkikJgtq69NUiD4Db+/kvADHLTvDeGot4n/smB3qBuRm4jiGss2wC1/XrXy2e/V41RI=
X-Gm-Gg: ASbGncskxGK6cfOSLVh/e41+qkIs+GFNbgr0+K2FSLEdtFHxLadnN0HpYf6DA2xea2n
 MTbmdeg/RrK7ipcALWjs4HgwcqR8iksT5t0cUSAEO8U2Fgwf8bSdYmw7MAMWWkISW8th6yUu/I1
 DJc459KyhDNmxQb2vMgamoly8PJaN373wyVDWMWRhhPWXq0+/LofUvdj3QeiNqLPJt8RHfnVbC+
 6bk2LCAGUpHpCIncp6NJuWmv7On1zjTvr67A7VO5hf1z8WNmrwveKEft99bHcFA7qYGPrSb+YhO
 dsr5O5LJprklmYiN7oFpsuqivkGmgMjAT+P467JPaGdvu+K3jCcndciyyv3yUF/xeJclB5kKNY/
 DlkO3DIOdlRLj2bZuyw4009P178Prco2R/UaURQc0BO6fH/vT83KAqYlBrRU55qPT1AMVPKEUQp
 /qpdj73Lch1HwCM4+zujjpTwP8hkLBMFnLH/d1agJH15EXNunpSQ==
X-Google-Smtp-Source: AGHT+IGPvvSboRVK4jDOdh6s27u0FTr4UC3OsgbP4owA92aeWHz0dL+KCqlvt2kB6S2acByZkxFTfg==
X-Received: by 2002:a05:600c:46ca:b0:45f:2922:2aef with SMTP id
 5b1f17b1804b1-4771e235900mr4315395e9.28.1761675682354; 
 Tue, 28 Oct 2025 11:21:22 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4771e196a22sm5526535e9.5.2025.10.28.11.21.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 28 Oct 2025 11:21:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.caveayland@nutanix.com>, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Jesper Devantier <foss@defmacro.it>
Subject: [PATCH v3 08/25] hw/nvme/ctrl: Use memory_region_size()
Date: Tue, 28 Oct 2025 19:12:42 +0100
Message-ID: <20251028181300.41475-9-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251028181300.41475-1-philmd@linaro.org>
References: <20251028181300.41475-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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

MemoryRegion::size is private data of MemoryRegion,
use the proper memory_region_size() getter to get it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/nvme/ctrl.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index cd81f739975..9505f291f62 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -514,14 +514,16 @@ static bool nvme_update_ruh(NvmeCtrl *n, NvmeNamespace *ns, uint16_t pid)
 
 static bool nvme_addr_is_cmb(NvmeCtrl *n, hwaddr addr)
 {
+    MemoryRegion *mr;
     hwaddr hi, lo;
 
     if (!n->cmb.cmse) {
         return false;
     }
 
+    mr = &n->cmb.mem;
     lo = n->params.legacy_cmb ? n->cmb.mem.addr : n->cmb.cba;
-    hi = lo + int128_get64(n->cmb.mem.size);
+    hi = lo + memory_region_size(mr);
 
     return addr >= lo && addr < hi;
 }
@@ -540,7 +542,7 @@ static bool nvme_addr_is_pmr(NvmeCtrl *n, hwaddr addr)
         return false;
     }
 
-    hi = n->pmr.cba + int128_get64(n->pmr.dev->mr.size);
+    hi = n->pmr.cba + memory_region_size(&n->pmr.dev->mr);
 
     return addr >= n->pmr.cba && addr < hi;
 }
@@ -563,7 +565,7 @@ static inline bool nvme_addr_is_iomem(NvmeCtrl *n, hwaddr addr)
      * in BAR0 as well, then this must be changed.
      */
     lo = n->bar0.addr;
-    hi = lo + int128_get64(n->bar0.size);
+    hi = lo + memory_region_size(&n->bar0);
 
     return addr >= lo && addr < hi;
 }
-- 
2.51.0


