Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp796430ejo;
        Fri, 5 Jan 2024 07:52:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEjB+4AEiop62jAnN8osAhOxksmdAAwOk4Msdf7hySUecpOQKnJam1Xb1leryc2+A4oR2AJ
X-Received: by 2002:a05:620a:bcd:b0:781:5905:c7f6 with SMTP id s13-20020a05620a0bcd00b007815905c7f6mr2773578qki.57.1704469959843;
        Fri, 05 Jan 2024 07:52:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704469959; cv=none;
        d=google.com; s=arc-20160816;
        b=lwLBm6k6HDUTRrfs2uxY0j/vUmVbzlAKfnGOTg/dJTdlY4X4u2AL3OzHSHJAAkPHSW
         juFihMOc8dJvWrA2I8OJ14Sv/POqCqWx5fm+yGQtpVPjb3gNqt5STFN3dNtbPitN6x/f
         Rk+pKG7sqnvu0mvKk0ZWKjJfxcqPJ+Gq7sogvm2jSJc9gA8ji0gcmdz5P50ArO1+aaJV
         /jFytOb76UuE6xxFuD6OkQSK+SzOWRNWuGvQ9OkIUpjxxG3WDCUFQrhowZ96r1Ihf+Qv
         hDTz4m6vwPjlazyVoMCZw2cCt1JMaDHUO/Z2OqEDGtsXvQvl48ycGgFK1n17za0q0w2S
         2iqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Ux8OTSc8Ad9jOVNGlPCxH1dshjQrIfyvWA7mV8zeD70=;
        fh=9e/GdPOc9kaFcZwUUs4wJrMLrLita2N4fbrPz9ApZsQ=;
        b=KYksc4KCFXU3vbcmYNshJrOJ0XyRmge059bxVeo/SlneNg0jqUtijOReNfnwu8ptG7
         pKTKfpFeFnYexWiRQhgRYd63qYu0aBizt2nrxjuy5UnMi6271jozCSPsh5ZslqsQnu91
         INVR5lcJCM8DKmEM+Tj/7GwDhBmqJSN1eetZ/p2lBjWPm+wey2wCPuYOg+TVcIlLi8tc
         eMh1jVy/fASdIatWybU2T7Tp+Kwh91bIHtmFptxfbDGDsKWg+L3zsLHdS8nZoKlNF0v7
         ub6iAz0ET7GQnS1gmXHmBB5muEhGIk3r3s4NLwzTzu3qr/lUovje/wSFkMtwUHqFjaGT
         eY/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KvLiuHot;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pj16-20020a05620a1d9000b0077f8c4cfd9csi1931175qkn.186.2024.01.05.07.52.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jan 2024 07:52:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KvLiuHot;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rLmSY-0000eJ-Md; Fri, 05 Jan 2024 10:50:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmRd-00074G-7i
 for qemu-devel@nongnu.org; Fri, 05 Jan 2024 10:49:16 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmRZ-0007fu-LZ
 for qemu-devel@nongnu.org; Fri, 05 Jan 2024 10:49:12 -0500
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-33686649b72so1473637f8f.3
 for <qemu-devel@nongnu.org>; Fri, 05 Jan 2024 07:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469748; x=1705074548; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ux8OTSc8Ad9jOVNGlPCxH1dshjQrIfyvWA7mV8zeD70=;
 b=KvLiuHotPLFzDY5cGRIYlx7MzPpNJHtlWFKoRlRM92gtTF6gcJZHZFac9pzvl+4OjA
 5Y7TUBAgkt91UmhVpooMo3vFLsXkW3/L6pLDFmvOgwc1KiL5P3AntWTx+NUqLz9coDyk
 mvDzDYMpREBNgkwfKy/w9196OppRfEOwe1TJ6tHtldw9W1wufNkcbzOFzR1HxJfb9bO3
 r79ie326Qqf4mbWYFWkRaGuDfFFsrR8E0gf6FqgTAUwZtTaPJCMV3NVcUWdGfNvjwC4o
 nUVBfbVrHyZ732LbSWFdfHcPw3nXUut+r4dkawPydxjoMBIKh7PiKS5uSu6oV2u0Hto8
 s3xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469748; x=1705074548;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ux8OTSc8Ad9jOVNGlPCxH1dshjQrIfyvWA7mV8zeD70=;
 b=hhCfOeKjAYo6mPFS8hSTFokyUhrM3sKtymZ+azbKwRa5ir6MlO9R9rksbCAULdb6e4
 8nKsEF7jkTy5hL4rxTDqOJluJPtgasnx3qDP3RDRcGIDaoSYh8Ew+Dq8mEJ+3t0r0vQt
 rjlVG9CmjA8ioxHfdJJkvM1g3Dptjc56Tz0OhRlz//sjZUT39KlJ0XdJHIS+VvG3EXk+
 qV7gZWe4p4/kjOoqXhyGL4o9oT13hqihOw4j6Je5yEwucvkrSprNG3f/Mjl2gyW7tiyT
 JRrXay3UjTW8g0zirKNrca4hvvpRGqReDHnnccODRsnqzKQNaVQ+/WMTavGCqZyYp6az
 3iYg==
X-Gm-Message-State: AOJu0Ywij7XlZHUCJq6hYexSvCNraDs8SSyuE814E7szxuhXKy/+9QIK
 KOGy05pjc8Y4EbDjCceZ0zvB0fQIaE7kicKxTPQ3bk5j8xA=
X-Received: by 2002:a5d:4a84:0:b0:336:7bd0:47a2 with SMTP id
 o4-20020a5d4a84000000b003367bd047a2mr1392275wrq.112.1704469747954; 
 Fri, 05 Jan 2024 07:49:07 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 v11-20020a5d4a4b000000b0033755d8ce7asm1612139wrs.76.2024.01.05.07.49.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:49:07 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Gavin Shan <gshan@redhat.com>, David Hildenbrand <david@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Subject: [PULL 58/71] backends: Simplify host_memory_backend_memory_complete()
Date: Fri,  5 Jan 2024 16:42:51 +0100
Message-ID: <20240105154307.21385-59-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240105154307.21385-1-philmd@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: LbaHB0OioTAD

Return early if bc->alloc is NULL. De-indent the if() ladder.

Note, this avoids a pointless call to error_propagate() with
errp=NULL at the 'out:' label.

Change trivial when reviewed with 'git-diff --ignore-all-space'.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Message-Id: <20231120213301.24349-16-philmd@linaro.org>
---
 backends/hostmem.c | 133 +++++++++++++++++++++++----------------------
 1 file changed, 67 insertions(+), 66 deletions(-)

diff --git a/backends/hostmem.c b/backends/hostmem.c
index 747e7838c0..1723c19165 100644
--- a/backends/hostmem.c
+++ b/backends/hostmem.c
@@ -328,83 +328,84 @@ host_memory_backend_memory_complete(UserCreatable *uc, Error **errp)
     void *ptr;
     uint64_t sz;
 
-    if (bc->alloc) {
-        bc->alloc(backend, &local_err);
-        if (local_err) {
-            goto out;
-        }
+    if (!bc->alloc) {
+        return;
+    }
+    bc->alloc(backend, &local_err);
+    if (local_err) {
+        goto out;
+    }
 
-        ptr = memory_region_get_ram_ptr(&backend->mr);
-        sz = memory_region_size(&backend->mr);
+    ptr = memory_region_get_ram_ptr(&backend->mr);
+    sz = memory_region_size(&backend->mr);
 
-        if (backend->merge) {
-            qemu_madvise(ptr, sz, QEMU_MADV_MERGEABLE);
-        }
-        if (!backend->dump) {
-            qemu_madvise(ptr, sz, QEMU_MADV_DONTDUMP);
-        }
+    if (backend->merge) {
+        qemu_madvise(ptr, sz, QEMU_MADV_MERGEABLE);
+    }
+    if (!backend->dump) {
+        qemu_madvise(ptr, sz, QEMU_MADV_DONTDUMP);
+    }
 #ifdef CONFIG_NUMA
-        unsigned long lastbit = find_last_bit(backend->host_nodes, MAX_NODES);
-        /* lastbit == MAX_NODES means maxnode = 0 */
-        unsigned long maxnode = (lastbit + 1) % (MAX_NODES + 1);
-        /* ensure policy won't be ignored in case memory is preallocated
-         * before mbind(). note: MPOL_MF_STRICT is ignored on hugepages so
-         * this doesn't catch hugepage case. */
-        unsigned flags = MPOL_MF_STRICT | MPOL_MF_MOVE;
-        int mode = backend->policy;
+    unsigned long lastbit = find_last_bit(backend->host_nodes, MAX_NODES);
+    /* lastbit == MAX_NODES means maxnode = 0 */
+    unsigned long maxnode = (lastbit + 1) % (MAX_NODES + 1);
+    /* ensure policy won't be ignored in case memory is preallocated
+     * before mbind(). note: MPOL_MF_STRICT is ignored on hugepages so
+     * this doesn't catch hugepage case. */
+    unsigned flags = MPOL_MF_STRICT | MPOL_MF_MOVE;
+    int mode = backend->policy;
 
-        /* check for invalid host-nodes and policies and give more verbose
-         * error messages than mbind(). */
-        if (maxnode && backend->policy == MPOL_DEFAULT) {
-            error_setg(errp, "host-nodes must be empty for policy default,"
-                       " or you should explicitly specify a policy other"
-                       " than default");
-            return;
-        } else if (maxnode == 0 && backend->policy != MPOL_DEFAULT) {
-            error_setg(errp, "host-nodes must be set for policy %s",
-                       HostMemPolicy_str(backend->policy));
-            return;
-        }
+    /* check for invalid host-nodes and policies and give more verbose
+     * error messages than mbind(). */
+    if (maxnode && backend->policy == MPOL_DEFAULT) {
+        error_setg(errp, "host-nodes must be empty for policy default,"
+                   " or you should explicitly specify a policy other"
+                   " than default");
+        return;
+    } else if (maxnode == 0 && backend->policy != MPOL_DEFAULT) {
+        error_setg(errp, "host-nodes must be set for policy %s",
+                   HostMemPolicy_str(backend->policy));
+        return;
+    }
 
-        /* We can have up to MAX_NODES nodes, but we need to pass maxnode+1
-         * as argument to mbind() due to an old Linux bug (feature?) which
-         * cuts off the last specified node. This means backend->host_nodes
-         * must have MAX_NODES+1 bits available.
-         */
-        assert(sizeof(backend->host_nodes) >=
-               BITS_TO_LONGS(MAX_NODES + 1) * sizeof(unsigned long));
-        assert(maxnode <= MAX_NODES);
+    /* We can have up to MAX_NODES nodes, but we need to pass maxnode+1
+     * as argument to mbind() due to an old Linux bug (feature?) which
+     * cuts off the last specified node. This means backend->host_nodes
+     * must have MAX_NODES+1 bits available.
+     */
+    assert(sizeof(backend->host_nodes) >=
+           BITS_TO_LONGS(MAX_NODES + 1) * sizeof(unsigned long));
+    assert(maxnode <= MAX_NODES);
 
 #ifdef HAVE_NUMA_HAS_PREFERRED_MANY
-        if (mode == MPOL_PREFERRED && numa_has_preferred_many() > 0) {
-            /*
-             * Replace with MPOL_PREFERRED_MANY otherwise the mbind() below
-             * silently picks the first node.
-             */
-            mode = MPOL_PREFERRED_MANY;
-        }
+    if (mode == MPOL_PREFERRED && numa_has_preferred_many() > 0) {
+        /*
+         * Replace with MPOL_PREFERRED_MANY otherwise the mbind() below
+         * silently picks the first node.
+         */
+        mode = MPOL_PREFERRED_MANY;
+    }
 #endif
 
-        if (maxnode &&
-            mbind(ptr, sz, mode, backend->host_nodes, maxnode + 1, flags)) {
-            if (backend->policy != MPOL_DEFAULT || errno != ENOSYS) {
-                error_setg_errno(errp, errno,
-                                 "cannot bind memory to host NUMA nodes");
-                return;
-            }
+    if (maxnode &&
+        mbind(ptr, sz, mode, backend->host_nodes, maxnode + 1, flags)) {
+        if (backend->policy != MPOL_DEFAULT || errno != ENOSYS) {
+            error_setg_errno(errp, errno,
+                             "cannot bind memory to host NUMA nodes");
+            return;
         }
+    }
 #endif
-        /* Preallocate memory after the NUMA policy has been instantiated.
-         * This is necessary to guarantee memory is allocated with
-         * specified NUMA policy in place.
-         */
-        if (backend->prealloc) {
-            qemu_prealloc_mem(memory_region_get_fd(&backend->mr), ptr, sz,
-                              backend->prealloc_threads,
-                              backend->prealloc_context, &local_err);
-            if (local_err) {
-                goto out;
-            }
+    /* Preallocate memory after the NUMA policy has been instantiated.
+     * This is necessary to guarantee memory is allocated with
+     * specified NUMA policy in place.
+     */
+    if (backend->prealloc) {
+        qemu_prealloc_mem(memory_region_get_fd(&backend->mr), ptr, sz,
+                          backend->prealloc_threads,
+                          backend->prealloc_context, &local_err);
+        if (local_err) {
+            goto out;
         }
     }
 out:
-- 
2.41.0

