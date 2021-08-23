Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp2037439lfg;
        Mon, 23 Aug 2021 09:55:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7uriFOicSAYLi5Edjd+I1Xj/qYZo9FbCV364TYRM43j7dmt95SIi+mcdLuhuxuun5Cuyl
X-Received: by 2002:a5b:58e:: with SMTP id l14mr47914062ybp.143.1629737738359;
        Mon, 23 Aug 2021 09:55:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629737738; cv=none;
        d=google.com; s=arc-20160816;
        b=byszzRsrjIo2R1t0rvlltwhnTuOU44jbJ4ckijrqADbe1GPNN4XTci2/7emR/P5S9t
         U3m4YRdd2GGM1NIJJmDYg6GgWLLDVsUl/NdGJXGHhk96onchPpVcPQvEW7i5mgV8XS0P
         GhzuRT11TviC/pn3446bvERrccTZzsjztqn3m88RbjAEsFrbnxAqwQ/UF7ncay3DLdP6
         3e+zplMceK4jlGDEKU0GG7mOvFjTQ+hgp/UMOzPu6LvkSRVHiPNdwsWBGA+CoiLXKOBZ
         QSxk5YCkWHYHA1xYe9PaCe4V7dB3+NaWzbxIKK+gI+LgBblwZTuJUm6KG4Ljp0l8jG6Q
         BuhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=7R4zUdURf5txsJu6CyZuzHy/f/1sygZW3eoytgU2yN8=;
        b=DV17DfcZ3HO73OUfGlJIXa1y2fRaP60F1Zl7gUkwxQbOahrdalDY7XwV47l6uj2gk+
         N8Uv75LBOFiAJP3k9pZm4j0YrUI26l2URdKHT29aUBFH7ypwB+8Hsj9E7l6qwNTtXIxO
         m132/dzHi3ak1QLLJ2dD3ahjAbgOYf/UCTALjlDyWLyGF8CRsn0J16AsxQiwq9DDBFa+
         uhhFA6fxIHAJNCUGSP7BQ93BIyp67vxUgEsB34hDunXFggcYg8tP5xLSC4pb4c6KkMXi
         jgmyiK70EUsbfAmIbqz2SkKYDLUTGi3YtsN28ZyYSXVuPnRwOZHHTaL/+MJEzamszjxP
         RVPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="B/ZRpe6M";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i3si15792064ybi.167.2021.08.23.09.55.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Aug 2021 09:55:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="B/ZRpe6M";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mIDEX-0002C9-MO
	for alex.bennee@linaro.org; Mon, 23 Aug 2021 12:55:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mID1i-0000Pq-Iv
 for qemu-arm@nongnu.org; Mon, 23 Aug 2021 12:42:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26089)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mID1g-0007RD-LC
 for qemu-arm@nongnu.org; Mon, 23 Aug 2021 12:42:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629736939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7R4zUdURf5txsJu6CyZuzHy/f/1sygZW3eoytgU2yN8=;
 b=B/ZRpe6MzOUkyUaS3kyGg/STdew/ZUQnq4Ls17P6ml1j3zQR7Yb9KgYBHGWiLJPGreaLjM
 vlpjI2uwXkouLK1Z3iagY4Rf9vu1gYnoqQdPdaaLMKXZe3Bp3NO6N7tWFAcz5XtptcNnzf
 Db/nsK4BhiEC6FRJH7HAL0i4WKjSp6Y=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-zHHdWRo4O76eGUTZlbvMcQ-1; Mon, 23 Aug 2021 12:42:18 -0400
X-MC-Unique: zHHdWRo4O76eGUTZlbvMcQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 q11-20020a5d61cb0000b02901550c3fccb5so5168776wrv.14
 for <qemu-arm@nongnu.org>; Mon, 23 Aug 2021 09:42:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7R4zUdURf5txsJu6CyZuzHy/f/1sygZW3eoytgU2yN8=;
 b=jgihgsXhDaUxwdfMUXGnFIErsA5CjEEDZRIB4J9VL71XOSnLTNP9qCfuHPvyi/RSnG
 N2un5iqX7n+My4uC906ewu0SwVIUdZ+v4SjNl1IV85xm9O/bCzYExAWRTEW0yj4XCgPN
 gK/EmXsJA+n6/u8UPOsHMqP864uWGTEiTPZWqbL0Q6wMjcpROSi2y61Cm3FAamd/vSOS
 EA1uHTppe/c0+9sFSZZxiywNHf0bQAtcfcRUpd/sxD50f5yn/pWfmbch/hI/iwTfR3la
 Z/h1/Z2eCjWekP2YXZ9btT+/9emqfyo3OHmHyxwLDmdROALS+bDGmNushJaCNT63MTpp
 aAhA==
X-Gm-Message-State: AOAM530OZPUSzOHcvHPSoYJDB7blzDMjemHv3A5QFa9yeK109ojLgZ0N
 3uRviad/YIzSEZI4CobKkyFhX8Y2jcWx++UQGi6wF7qfg7hM4FSjphe1IPAe2tHy03IyDw71Lhb
 6k7rSaZfl5JJC
X-Received: by 2002:a1c:4a:: with SMTP id 71mr17335581wma.87.1629736937676;
 Mon, 23 Aug 2021 09:42:17 -0700 (PDT)
X-Received: by 2002:a1c:4a:: with SMTP id 71mr17335551wma.87.1629736937427;
 Mon, 23 Aug 2021 09:42:17 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 o10sm2922553wrc.16.2021.08.23.09.42.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 09:42:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 4/5] softmmu/physmem: Introduce
 flatview_access_allowed() to check bus perms
Date: Mon, 23 Aug 2021 18:41:56 +0200
Message-Id: <20210823164157.751807-5-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210823164157.751807-1-philmd@redhat.com>
References: <20210823164157.751807-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Peter Xu <peterx@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0dxqUlbgQK+e

Introduce flatview_access_allowed() to check bus permission
before running any bus transaction. For now this is a simple
stub.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 softmmu/physmem.c | 37 +++++++++++++++++++++++++++++++++++--
 1 file changed, 35 insertions(+), 2 deletions(-)

diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index e534dc69918..0d31a2f4199 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -2754,6 +2754,27 @@ static bool prepare_mmio_access(MemoryRegion *mr)
     return release_lock;
 }
 
+/**
+ * flatview_access_allowed
+ * @mr: #MemoryRegion to be accessed
+ * @attrs: memory transaction attributes
+ * @addr: address within that memory region
+ * @len: the number of bytes to access
+ * @result: optional pointer to a MemTxResult or NULL
+ *
+ * Check if a memory transaction is allowed. If an error occurs this
+ * method will return false to indicate denial, as well as setting
+ * @result to contain corresponding #MemTxResult.
+ *
+ * Returns: true if transaction is allowed, false if denied.
+ */
+static inline bool flatview_access_allowed(MemoryRegion *mr, MemTxAttrs attrs,
+                                           hwaddr addr, hwaddr len,
+                                           MemTxResult *result)
+{
+    return true;
+}
+
 /* Called within RCU critical section.  */
 static MemTxResult flatview_write_continue(FlatView *fv, hwaddr addr,
                                            MemTxAttrs attrs,
@@ -2768,7 +2789,9 @@ static MemTxResult flatview_write_continue(FlatView *fv, hwaddr addr,
     const uint8_t *buf = ptr;
 
     for (;;) {
-        if (!memory_access_is_direct(mr, true)) {
+        if (!flatview_access_allowed(mr, attrs, addr1, l, &result)) {
+            /* 'result' contains the error, keep going. */
+        } else if (!memory_access_is_direct(mr, true)) {
             release_lock |= prepare_mmio_access(mr);
             l = memory_access_size(mr, l, addr1);
             /* XXX: could force current_cpu to NULL to avoid
@@ -2810,9 +2833,13 @@ static MemTxResult flatview_write(FlatView *fv, hwaddr addr, MemTxAttrs attrs,
     hwaddr l;
     hwaddr addr1;
     MemoryRegion *mr;
+    MemTxResult result = MEMTX_OK;
 
     l = len;
     mr = flatview_translate(fv, addr, &addr1, &l, true, attrs);
+    if (!flatview_access_allowed(mr, attrs, addr, len, &result)) {
+        return result;
+    }
     return flatview_write_continue(fv, addr, attrs, buf, len,
                                    addr1, l, mr);
 }
@@ -2831,7 +2858,9 @@ MemTxResult flatview_read_continue(FlatView *fv, hwaddr addr,
 
     fuzz_dma_read_cb(addr, len, mr);
     for (;;) {
-        if (!memory_access_is_direct(mr, false)) {
+        if (!flatview_access_allowed(mr, attrs, addr1, l, &result)) {
+            /* 'result' contains the error, keep going. */
+        } else if (!memory_access_is_direct(mr, false)) {
             /* I/O case */
             release_lock |= prepare_mmio_access(mr);
             l = memory_access_size(mr, l, addr1);
@@ -2871,9 +2900,13 @@ static MemTxResult flatview_read(FlatView *fv, hwaddr addr,
     hwaddr l;
     hwaddr addr1;
     MemoryRegion *mr;
+    MemTxResult result = MEMTX_OK;
 
     l = len;
     mr = flatview_translate(fv, addr, &addr1, &l, false, attrs);
+    if (!flatview_access_allowed(mr, attrs, addr, len, &result)) {
+        return result;
+    }
     return flatview_read_continue(fv, addr, attrs, buf, len,
                                   addr1, l, mr);
 }
-- 
2.31.1

