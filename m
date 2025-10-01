Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADB27CCA470
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Oct 2025 08:28:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v3s8w-0003Ex-Ta; Wed, 01 Oct 2025 04:24:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3s8d-0002c6-ET
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 04:24:40 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3s7d-0006YB-6V
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 04:24:37 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-46e34052bb7so68962465e9.2
 for <qemu-arm@nongnu.org>; Wed, 01 Oct 2025 01:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759307009; x=1759911809; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zegXXCpa9ASQOrNtWqt+ADNwdFoZ3Z29Rva7UQGyObo=;
 b=VhrrFFbDydNoWPnFy09LPXLX0Ti/j08gc8Kf90RJ+1581vUQNthwf2JqtugsjbwsUT
 WFwlrtdkGmgyT5k9TJp2S1fkA+lLc1ejmcLIVxFMR+8qQC+9QxAK62Itbt0wE5afooH+
 WK0j64vz5kbRyej6x6hc6Rdm7TqdLskFhYkWaAsh0SEGRJtX1j8rtHToUelg3rhHAFiC
 HNu2JxNzFvgKUt6sFjDeSKMCIQWe+h8n7xtbjp6mVqRsOV6to5zjCQrC9an+JSu2z2AI
 ObqfzlaJX8qDFrg3GZWR4qEfBlsp1WpfpUDtkHdrJuoJvNYtB0s16Z92dwoCZ5VRWt2R
 Wa8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759307009; x=1759911809;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zegXXCpa9ASQOrNtWqt+ADNwdFoZ3Z29Rva7UQGyObo=;
 b=XoXLh7xtrfxyvxQJh2PKAibhTvaTd7sJ2lMIRhmarzDY7TkYaQYm+O1AGG71BYY/xx
 IuO5DsRAwB411Bm5Z2cABTY4R3ePEz54CkKfeOHe66qLvIj02Mk3QYX7TV7L/IBHMx6p
 eY0CwaIzXHRaPsVpduM/8CuC1Em3yKUJIKq+AY609/En3DutQ8Crm5TRrweXw/GtQSz+
 22u77EMzWVOv9tEYZu42Nc/Q8g7z+Uz3vEfxpV9olO43cwlIIsl/+5rlw9v4gPSNKjP3
 Kj5/wJN7BBFReFFY5qGQp2c9xZhlMLsY/77Tp/ZQ75MvTnweOTHT1igYxCWo8i9wMjiw
 GSDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1JkMVXv/I8a/6a6m5HR+9OZ5xen97U3UISGBYII/5ZOj7ovVQj5WglXOy+xeqcTBx64Qblf4lwg==@nongnu.org
X-Gm-Message-State: AOJu0YxoYRhvEbk50AUnJg5vqpb0tWVRYwnfHU7KHy70ytFPZTwsojYw
 S3w8VqZli7ElSat2FWUev6EKQq2vsSrJL/HEAlHPoLQSlOGJHIQBmdY++FAdkxJV164=
X-Gm-Gg: ASbGncuxQCwx1MdRaaThV84ESRoyLkqIc0Eo8tu7cK7TndgwIq+jRLzfjR0ncfhPz4h
 M7UDZ4h+wukxIagk0++G2lyEbVTTukwcBOTaYj3Er3r7Lj10Rdgh6JXLVcdb+OZW0WouOoukxos
 0W5hfrZsDypjCxpIdPQSKSp14trotoSs2Tb+9+SVhSj7vHUCz4ya4fjvNRxpTRJ/uaB/ArQc+kj
 OqcJePvwujZPPk9yvJJX5fSPzF17qeh/T8es2eBbU42per9WYniwC4ga0LzcULdCB6o76fEueuJ
 zGJkps9jHorsP3EjWZtPZiurexRPChjWPec7t8dnvYC4MkKbZYOmkG+TLk9DjrHExKGglkc9tld
 gFOu0VDhrz21N1U2vJmG2pnqO8PBqVOMxLDUOY0py1uP+IBQUyb7tQjJN4IzaOTnYXx6FpLy9/N
 U+s79x4b5gBuPsVh3zrFSZ
X-Google-Smtp-Source: AGHT+IG3vnUwmmtH6S8njdb++5bFx0+A0p48CnO15CBnkP8W5zkTavOHjjeODL9wCrfaHIz1bpH0yA==
X-Received: by 2002:a05:600c:8b71:b0:46e:1fb7:a1b3 with SMTP id
 5b1f17b1804b1-46e612bc098mr20498785e9.23.1759307008619; 
 Wed, 01 Oct 2025 01:23:28 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e5b6b4cc0sm30642885e9.4.2025.10.01.01.23.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 01 Oct 2025 01:23:28 -0700 (PDT)
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
Subject: [PATCH 22/25] system/physmem: Reduce
 cpu_physical_memory_clear_dirty_range() scope
Date: Wed,  1 Oct 2025 10:21:22 +0200
Message-ID: <20251001082127.65741-23-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001082127.65741-1-philmd@linaro.org>
References: <20251001082127.65741-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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

cpu_physical_memory_clear_dirty_range() is now only called within
system/physmem.c, by qemu_ram_resize(). Reduce its scope by making
it internal to this file. Since it doesn't involve any CPU, remove
the 'cpu_' prefix. As it operates on a range, rename @start as @addr.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/system/ram_addr.h | 9 ---------
 system/physmem.c          | 9 ++++++++-
 2 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/include/system/ram_addr.h b/include/system/ram_addr.h
index 3899c084076..c55e3849b0e 100644
--- a/include/system/ram_addr.h
+++ b/include/system/ram_addr.h
@@ -177,15 +177,6 @@ bool cpu_physical_memory_snapshot_get_dirty(DirtyBitmapSnapshot *snap,
                                             ram_addr_t start,
                                             ram_addr_t length);
 
-static inline void cpu_physical_memory_clear_dirty_range(ram_addr_t start,
-                                                         ram_addr_t length)
-{
-    cpu_physical_memory_test_and_clear_dirty(start, length, DIRTY_MEMORY_MIGRATION);
-    cpu_physical_memory_test_and_clear_dirty(start, length, DIRTY_MEMORY_VGA);
-    cpu_physical_memory_test_and_clear_dirty(start, length, DIRTY_MEMORY_CODE);
-}
-
-
 /* Called with RCU critical section */
 static inline
 uint64_t cpu_physical_memory_sync_dirty_bitmap(RAMBlock *rb,
diff --git a/system/physmem.c b/system/physmem.c
index 9e36748dc4a..40ec67572b0 100644
--- a/system/physmem.c
+++ b/system/physmem.c
@@ -1140,6 +1140,13 @@ bool cpu_physical_memory_test_and_clear_dirty(ram_addr_t addr,
     return dirty;
 }
 
+static void physical_memory_clear_dirty_range(ram_addr_t addr, ram_addr_t length)
+{
+    cpu_physical_memory_test_and_clear_dirty(addr, length, DIRTY_MEMORY_MIGRATION);
+    cpu_physical_memory_test_and_clear_dirty(addr, length, DIRTY_MEMORY_VGA);
+    cpu_physical_memory_test_and_clear_dirty(addr, length, DIRTY_MEMORY_CODE);
+}
+
 DirtyBitmapSnapshot *cpu_physical_memory_snapshot_and_clear_dirty
     (MemoryRegion *mr, hwaddr offset, hwaddr length, unsigned client)
 {
@@ -2076,7 +2083,7 @@ int qemu_ram_resize(RAMBlock *block, ram_addr_t newsize, Error **errp)
         ram_block_notify_resize(block->host, oldsize, newsize);
     }
 
-    cpu_physical_memory_clear_dirty_range(block->offset, block->used_length);
+    physical_memory_clear_dirty_range(block->offset, block->used_length);
     block->used_length = newsize;
     cpu_physical_memory_set_dirty_range(block->offset, block->used_length,
                                         DIRTY_CLIENTS_ALL);
-- 
2.51.0


