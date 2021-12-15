Received: by 2002:a19:8c50:0:0:0:0:0 with SMTP id i16csp103769lfj;
        Wed, 15 Dec 2021 11:23:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJybsY26A8C/KfRjaOKSEF0zyDqkpKtsrQgmsUNSZPWOcY6fe5/XEbyT5I3/LFcD+gptiAKq
X-Received: by 2002:a05:6214:f61:: with SMTP id iy1mr2887133qvb.28.1639596186342;
        Wed, 15 Dec 2021 11:23:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639596186; cv=none;
        d=google.com; s=arc-20160816;
        b=zztuVxftgPFov85PN5QwQziXKWQqMab0YypmzPSqVfvejOsugCB6DU54FC637opGsB
         n4GFJwUyn6/yGJVRw4cXipoAp/tHa3Cx57YbwNlWBV+4gFgx4Hdop97VXW0j2xLvTwKB
         jvw7uI4fcJxR5l4zvuiadgIoJ6yZkmqwCgIsX/fyK+l/lg4cPLvc661pReLrp/z3wBPJ
         5rcJbFWZQZgi75VV+1eHiqmq4W8PMZWy2AFSj8bK/ofCRUPlm8yzX9WQOVfDQxg8JNWb
         7W20h655RZ/pbtn4cyZ0xUtwoVkCjc+Z2MLjCN/3QaSjGVEqeziCXY5fxfeH8VewzV5E
         JJxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Qgbl1qGGn0Mrb86U52QIs0aG9NLVai4plfdZIwipvAo=;
        b=iSBoXKPuaXYnRY2mZ3WBUlWr8jwQ1Hj/qGrn1UWNq7DEZJDibJeHY+F9w34CgiDB0o
         Bicb8ur4EZYdRpQNj41yPbgyY52H1T5KkPzC58Jt1dCs3ZPlfCnL8NRMmDy8a8eq0s0j
         A/Rx06kp/BqRd6Ge7mYJaNllIYWzYCvp7kz2Bh72Wv1OvfQxI3nUiZnMdGVJZAQVwH2T
         T0+sRa6yqZlUSvppo+7TNrI7AAsi5jxA6tN0k4SJFdJFkKapKUiaRM14qpaWHKDAyMDB
         7bJOKfFbYB055WI6PJettn+lwRJjaydI/H7ZR67Ujwcjru6JwCrWuA2RILjWlG+G1mUe
         mvqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="fTCMKnA/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fn12si1717061qvb.428.2021.12.15.11.23.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Dec 2021 11:23:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="fTCMKnA/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mxZrk-0004O9-IN
	for alex.bennee@linaro.org; Wed, 15 Dec 2021 14:23:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxYxO-0005Z3-NT
 for qemu-arm@nongnu.org; Wed, 15 Dec 2021 13:24:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47079)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxYxN-0007Q3-1D
 for qemu-arm@nongnu.org; Wed, 15 Dec 2021 13:24:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639592688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qgbl1qGGn0Mrb86U52QIs0aG9NLVai4plfdZIwipvAo=;
 b=fTCMKnA/V4lS0WU055TT7BoTYzVCFR6uEeou1cKrLfwACtjodt2pqIcfyiZtID3TFF4C6c
 ikQXwRQzdPjONCLdU03YF6VKKTnypkgmj669kWaPvVh8gK+VfGzy6XjSehUOkebyyerQsE
 mYMwxpgWfpvd3Q6Cp7Y5AECJUoYnlro=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-577-ZKiqgZGHMMKUKfdJONP7lA-1; Wed, 15 Dec 2021 13:24:45 -0500
X-MC-Unique: ZKiqgZGHMMKUKfdJONP7lA-1
Received: by mail-wm1-f70.google.com with SMTP id
 n31-20020a05600c3b9f00b0034440f99123so2408265wms.7
 for <qemu-arm@nongnu.org>; Wed, 15 Dec 2021 10:24:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Qgbl1qGGn0Mrb86U52QIs0aG9NLVai4plfdZIwipvAo=;
 b=LI8xWnQrMESomn1auRc4m8A9UFocJfqisyNjmIxpugGaP0BjA3O/CrH0uIQh9oEhRh
 wejlJLMebdMO2M0yZ+z120/Fg/qugBqZIpJeaZZqiDaOcueVWwmhCZqbaYlN+vZR5Ium
 wrjUoiCMNFA2+f9gZhJczEGB7StqQWFUlcWvf6/VuVfEnipA6r4UYzT8AJQCYuzWs+ln
 +tsNGTWJtr6nQ83trYRlgviKqH51PfBwmZZlsecGSLr14Q9+p+2aC5o6XGuxHP7nPG9+
 p9/AWS6mcKzYLmsjGWQyFRlfIbVhQC+4gbLLBrRBdmLFK11t5zhRUX9rQr60XfpJ9D9J
 hpuA==
X-Gm-Message-State: AOAM533M8ozz9htWN/q1t1LqnsAJFFkpJ/zvXPnN2aD3kcPfq/viL8vR
 l7FGDOIqX+8xzLMa26XtXz86LwsCmPFNY13DPieUXgmeWYoRt2nHp8QlhzfHebSAPAcUYa2t3cz
 KTsRpdX+vUWrh
X-Received: by 2002:a1c:7714:: with SMTP id t20mr1239902wmi.139.1639592684128; 
 Wed, 15 Dec 2021 10:24:44 -0800 (PST)
X-Received: by 2002:a1c:7714:: with SMTP id t20mr1239873wmi.139.1639592683929; 
 Wed, 15 Dec 2021 10:24:43 -0800 (PST)
Received: from localhost.localdomain
 (174.red-83-50-185.dynamicip.rima-tde.net. [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id o1sm3493282wri.100.2021.12.15.10.24.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 10:24:43 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v3 3/3] softmmu/physmem: Introduce MemTxAttrs::memory
 field and MEMTX_BUS_ERROR
Date: Wed, 15 Dec 2021 19:24:21 +0100
Message-Id: <20211215182421.418374-4-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211215182421.418374-1-philmd@redhat.com>
References: <20211215182421.418374-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Peter Xu <peterx@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UPH71OPIIeV2

Add the 'memory' bit to the memory attributes to restrict bus
controller accesses to memories.

Introduce flatview_access_allowed() to check bus permission
before running any bus transaction.

Have read/write accessors return MEMTX_BUS_ERROR if an access is
restricted.

There is no change for the default case where 'memory' is not set.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/exec/memattrs.h |  9 +++++++++
 softmmu/physmem.c       | 43 +++++++++++++++++++++++++++++++++++++++--
 2 files changed, 50 insertions(+), 2 deletions(-)

diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
index 95f2d20d55b..f0063583ee2 100644
--- a/include/exec/memattrs.h
+++ b/include/exec/memattrs.h
@@ -35,6 +35,14 @@ typedef struct MemTxAttrs {
     unsigned int secure:1;
     /* Memory access is usermode (unprivileged) */
     unsigned int user:1;
+    /*
+     * Bus interconnect and peripherals can access anything (memories,
+     * devices) by default. By setting the 'memory' bit, bus transaction
+     * are restricted to "normal" memories (per the AMBA documentation)
+     * versus devices. Access to devices will be logged and rejected
+     * (see MEMTX_BUS_ERROR).
+     */
+    unsigned int memory:1;
     /* Requester ID (for MSI for example) */
     unsigned int requester_id:16;
     /* Invert endianness for this page */
@@ -66,6 +74,7 @@ typedef struct MemTxAttrs {
 #define MEMTX_OK 0
 #define MEMTX_ERROR             (1U << 0) /* device returned an error */
 #define MEMTX_DECODE_ERROR      (1U << 1) /* nothing at that address */
+#define MEMTX_BUS_ERROR         (1U << 2) /* bus returned an error */
 typedef uint32_t MemTxResult;
 
 #endif
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 6c97a20107a..c03abcc0362 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -2759,6 +2759,33 @@ static bool prepare_mmio_access(MemoryRegion *mr)
     return release_lock;
 }
 
+/**
+ * flatview_access_allowed
+ * @mr: #MemoryRegion to be accessed
+ * @attrs: memory transaction attributes
+ * @addr: address within that memory region
+ * @len: the number of bytes to access
+ *
+ * Check if a memory transaction is allowed.
+ *
+ * Returns: true if transaction is allowed, false if denied.
+ */
+static inline bool flatview_access_allowed(MemoryRegion *mr, MemTxAttrs attrs,
+                                           hwaddr addr, hwaddr len)
+{
+    if (likely(!attrs.memory)) {
+        return true;
+    }
+    if (memory_region_is_ram(mr)) {
+        return true;
+    }
+    qemu_log_mask(LOG_GUEST_ERROR,
+                  "Invalid access to non-RAM device at "
+                  "addr 0x%" HWADDR_PRIX ", size %" HWADDR_PRIu ", "
+                  "region '%s'\n", addr, len, memory_region_name(mr));
+    return false;
+}
+
 /* Called within RCU critical section.  */
 static MemTxResult flatview_write_continue(FlatView *fv, hwaddr addr,
                                            MemTxAttrs attrs,
@@ -2773,7 +2800,10 @@ static MemTxResult flatview_write_continue(FlatView *fv, hwaddr addr,
     const uint8_t *buf = ptr;
 
     for (;;) {
-        if (!memory_access_is_direct(mr, true)) {
+        if (!flatview_access_allowed(mr, attrs, addr1, l)) {
+            result |= MEMTX_BUS_ERROR;
+            /* Keep going. */
+        } else if (!memory_access_is_direct(mr, true)) {
             release_lock |= prepare_mmio_access(mr);
             l = memory_access_size(mr, l, addr1);
             /* XXX: could force current_cpu to NULL to avoid
@@ -2818,6 +2848,9 @@ static MemTxResult flatview_write(FlatView *fv, hwaddr addr, MemTxAttrs attrs,
 
     l = len;
     mr = flatview_translate(fv, addr, &addr1, &l, true, attrs);
+    if (!flatview_access_allowed(mr, attrs, addr, len)) {
+        return MEMTX_BUS_ERROR;
+    }
     return flatview_write_continue(fv, addr, attrs, buf, len,
                                    addr1, l, mr);
 }
@@ -2836,7 +2869,10 @@ MemTxResult flatview_read_continue(FlatView *fv, hwaddr addr,
 
     fuzz_dma_read_cb(addr, len, mr);
     for (;;) {
-        if (!memory_access_is_direct(mr, false)) {
+        if (!flatview_access_allowed(mr, attrs, addr1, l)) {
+            result |= MEMTX_BUS_ERROR;
+            /* Keep going. */
+        } else if (!memory_access_is_direct(mr, false)) {
             /* I/O case */
             release_lock |= prepare_mmio_access(mr);
             l = memory_access_size(mr, l, addr1);
@@ -2879,6 +2915,9 @@ static MemTxResult flatview_read(FlatView *fv, hwaddr addr,
 
     l = len;
     mr = flatview_translate(fv, addr, &addr1, &l, false, attrs);
+    if (!flatview_access_allowed(mr, attrs, addr, len)) {
+        return MEMTX_BUS_ERROR;
+    }
     return flatview_read_continue(fv, addr, attrs, buf, len,
                                   addr1, l, mr);
 }
-- 
2.33.1

