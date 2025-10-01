Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDD37CCA470
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Oct 2025 08:33:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v3s87-0001k1-6A; Wed, 01 Oct 2025 04:24:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3s7s-0001Yq-Dy
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 04:23:52 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3s71-0006AE-9H
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 04:23:52 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-46e491a5b96so30545295e9.2
 for <qemu-arm@nongnu.org>; Wed, 01 Oct 2025 01:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759306976; x=1759911776; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Fn2TjoRESSlrNJjOER4d6gpZrt35+AGo12EpGqjkW1I=;
 b=WMJORzKbWQinwJlWgOGmr2Ob2FURGzE7QVjCPlSrDSjFH5QUxp3+nsOq7ZIWsr3FQr
 XfCmjG36S5LL2aTgZqqD6gINAVeBPgI4+jRvGovyQeaLyYGgBzmGFTwI2ZwQoEp5M/mB
 R1FJs4RKEZkarsVTbmLmsKf8HWlGU/zHXvf19GSKyTrxAZk2tBNqe+2pjUSawMimoDYO
 Q1prXBFBprGB2Uv3ZZlGBxNvbfMBV5x4giqjCh9ReZAPJ+y7lzQPAJLG8UGTFBXtgiFf
 yCvKgNy1HghmXWYvHGZRD1s7oTuPftwp3bvePG6rUKB5hyukt6PnxSmZCML+b3rbveiP
 unnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759306976; x=1759911776;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Fn2TjoRESSlrNJjOER4d6gpZrt35+AGo12EpGqjkW1I=;
 b=um+QMKAwqzQyj918/m8L2+sD4gtWQC3TgxDWFhNKWn1+kGNkC7NGrIdGOBx5OcZBFA
 vxOJK05bz+DE4l9K/X0pGnGO7fIWqyFLVi10MuEDAfB3QFt48g2GeRwscL6LVjmT9YKp
 6MdVC1/nKO5JaHypy+g50zmflumIneO4Xw9w0FxrljBMgdb/48z0IdnFM1v8XHez8OtW
 OvfrL5fxVDZRRlZVx1o+Qxtag9KRfyhFEMWhF5fll8oi0c+DM13XPx6uPMo73zfq84dT
 JqUG3eAw2v12U9oXrEou4X+Vy/Y17egs1P7eTXGikKmt0m7XqxGiD5EEjdtRHejDre6b
 z2eA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPXmTuzx7+wNqcQ3bY0h/hy/KRo1d6Ll//iL9AZmntBR3XpkujasyvbbLED69c/Emg1Shp6cnd8w==@nongnu.org
X-Gm-Message-State: AOJu0YxRyNQPPCyLp+KTbZnBlhbe30yqVEskJeaJloQ3NSn477Gwldp+
 WKqo8V1vhtlC/7ap/59skA2VUn0crLYJTteKYsbrxYanFfKpsEYKsN+JnRN5mWuMR0E=
X-Gm-Gg: ASbGncvSJEmAoBBovShAlSNEhhDvC7h7jB2Ps7VpW1yL+Vd26mRMOsVuJG8+WbAi0IF
 U3XlvEiXTkorjUbDrjmqPg/9fotBP2DE8AVni7fD3ovoaVojr0DWZiC+aYEVeFYZuxFBRfifNkK
 r6lmo9Y3Up8AJWVRsbhG2kAXiEXwsjBYs48/cTxO60Tnn2bX86S6f0Qaxo6IRRt0o6Ml+ZxgZQn
 TCKLOCYWMlAJ+u7t9oNWoc9zbx7ICIiWdClW+I2ozV4i5ok7kA590dp98xU5mYjLtEcIgl8bu/T
 hmOwcEdVupnb73t25ikR5vsHeE7d896VDtI7uTdvzFVZ8PxF1Izl1GPV0rQ1PvH4sGuqxi/5bq6
 XLs2NMnDEPhRSb74Tvv6YAtUZR2orC2Rq/uY8+4ablbu6mXfjy3oncXmz98JRQr7XPZwiKXUCgD
 l+ZN+HH4EmlX6hP5gNPUeg
X-Google-Smtp-Source: AGHT+IGa971mXhZ9J5c8QC/V145CuXilY9sHAaHNYsxw+frSzKFCefeHYCbSr6kcPeg6FkecemzV3g==
X-Received: by 2002:a05:600c:8414:b0:46e:206a:78cc with SMTP id
 5b1f17b1804b1-46e612c9042mr20995395e9.28.1759306975822; 
 Wed, 01 Oct 2025 01:22:55 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e61a25dbcsm28397185e9.19.2025.10.01.01.22.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 01 Oct 2025 01:22:55 -0700 (PDT)
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
Subject: [PATCH 16/25] system/physmem: Rename @start argument of
 physical_memory_*range()
Date: Wed,  1 Oct 2025 10:21:16 +0200
Message-ID: <20251001082127.65741-17-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001082127.65741-1-philmd@linaro.org>
References: <20251001082127.65741-1-philmd@linaro.org>
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
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

Generally we want to clarify terminology and avoid confusions,
prefering @start with (exclusive) @end, and base @addr with
@length (for inclusive range).

Here as cpu_physical_memory_set_dirty_range() operates on a
range, rename @start as @addr.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/system/ram_addr.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/system/ram_addr.h b/include/system/ram_addr.h
index 6ed17b455b4..84a8b5c003d 100644
--- a/include/system/ram_addr.h
+++ b/include/system/ram_addr.h
@@ -152,7 +152,7 @@ uint8_t cpu_physical_memory_range_includes_clean(ram_addr_t addr,
 
 void cpu_physical_memory_set_dirty_flag(ram_addr_t addr, unsigned client);
 
-static inline void cpu_physical_memory_set_dirty_range(ram_addr_t start,
+static inline void cpu_physical_memory_set_dirty_range(ram_addr_t addr,
                                                        ram_addr_t length,
                                                        uint8_t mask)
 {
@@ -165,8 +165,8 @@ static inline void cpu_physical_memory_set_dirty_range(ram_addr_t start,
         return;
     }
 
-    end = TARGET_PAGE_ALIGN(start + length) >> TARGET_PAGE_BITS;
-    page = start >> TARGET_PAGE_BITS;
+    end = TARGET_PAGE_ALIGN(addr + length) >> TARGET_PAGE_BITS;
+    page = addr >> TARGET_PAGE_BITS;
 
     WITH_RCU_READ_LOCK_GUARD() {
         for (i = 0; i < DIRTY_MEMORY_NUM; i++) {
@@ -200,7 +200,7 @@ static inline void cpu_physical_memory_set_dirty_range(ram_addr_t start,
     }
 
     if (xen_enabled()) {
-        xen_hvm_modified_memory(start, length);
+        xen_hvm_modified_memory(addr, length);
     }
 }
 
-- 
2.51.0


