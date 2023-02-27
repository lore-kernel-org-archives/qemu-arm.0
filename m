Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4254950ejc;
        Sun, 26 Feb 2023 20:29:18 -0800 (PST)
X-Google-Smtp-Source: AK7set9np+R8u8NxBF2sOyZH32j2FZ+Y6vFBMucG8nuNyn8vNMPBSinIqZEd+6qevgh2XJTyEKBL
X-Received: by 2002:a05:622a:118a:b0:3b2:1003:37e5 with SMTP id m10-20020a05622a118a00b003b2100337e5mr42903806qtk.55.1677472157917;
        Sun, 26 Feb 2023 20:29:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677472157; cv=none;
        d=google.com; s=arc-20160816;
        b=EMWqAWwTNOtBxf4LPxi9SBOAMx79VqgMhtjZ7WcuUdIYIP1BGZQW1FKKWKx8q3yPjb
         CsxeqXqDMPsq358yGLrs4cCZeoEOt7F5cOqH0+yZtUkuls6b9lm2ycezUDPI9HCoAEnQ
         Cv5Fcr9WO3Z47NOOm35EXuPoRzRghs4/63bT7eP0h2LeqqpGhG/YB1M41HzTZH0fYJBp
         teval8cv+6aiXgHlhWShXszFJr+o6y3YTVK+m2y2HiATK2Lo2JmvC9bSIvlr5RFisCr9
         5zru/zBLxAXfNjOZNkoqonX/z37kPwdAJLoT5Ne3Jqs02vdtVqqcFRCE30BmvD/mAXYI
         N3yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=6XFstomBiQ7+sR1kwRrER3iVKCZa8Lv1o7ES+ZiQ+xQ=;
        b=cwQazfdYLas6YrUAiDWqrY6cBT7fGzUfT43sORV1CkpJOhb3Ns0Zq8p4oqYk0FJCp0
         XAeXnxLCjgrUZvgA4epH5aHjiRmybu3luFYhKuQxumJKSI/yXglNHthF27gjtU5giPmx
         lyO1QYs1z9imGz0bfa9hn3LhOpWx6wuT1ImSEKEUw4DcjqdYBeI0utpXJhbzhHtm7FoM
         +43d38TogXpfNb+EjUj05pD8rL5jhkuTWZ2v5nmBbL374kT5QoIn5dAbXMoNw645IkqG
         XGxP7ZsJ5oAykqGREUKr08NEOcD++fdpoerTDf6VPKltrhldSZfjAubiL7bu0yjeuAUc
         LSBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PzubndOu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l22-20020ac84596000000b003bd134d475bsi5580400qtn.368.2023.02.26.20.29.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Feb 2023 20:29:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PzubndOu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWV81-0002go-N8; Sun, 26 Feb 2023 23:28:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pWV7z-0002fE-QI
 for qemu-arm@nongnu.org; Sun, 26 Feb 2023 23:28:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pWV7y-0003vF-9v
 for qemu-arm@nongnu.org; Sun, 26 Feb 2023 23:28:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677472121;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6XFstomBiQ7+sR1kwRrER3iVKCZa8Lv1o7ES+ZiQ+xQ=;
 b=PzubndOuIlvm5SWoDMGIC/SWi/MlsdMZKOZ8aK3QxPSIhpkzMZFMHidYQakkMSGgozJVEs
 IfZVkEb97I58yxSiQkpf3fgoj0/AKngP9q3wZHbq1rpdqL71zQmX/A82iJAyC036XGraMx
 KgxNsgS54CffVdLvXfPApS+MuzKfxS0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-532-BYz8SgByM7uIq_y9UteoAA-1; Sun, 26 Feb 2023 23:28:39 -0500
X-MC-Unique: BYz8SgByM7uIq_y9UteoAA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1117A29AA3B1;
 Mon, 27 Feb 2023 04:28:39 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-58.bne.redhat.com [10.64.54.58])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6886A1121314;
 Mon, 27 Feb 2023 04:28:33 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, peter.maydell@linaro.org,
 peterx@redhat.com, david@redhat.com, philmd@linaro.org, mst@redhat.com,
 cohuck@redhat.com, quintela@redhat.com, dgilbert@redhat.com,
 maz@kernel.org, zhenyzha@redhat.com, shan.gavin@gmail.com
Subject: [PATCH v2 3/4] kvm: Add helper kvm_dirty_ring_init()
Date: Mon, 27 Feb 2023 12:26:28 +0800
Message-Id: <20230227042629.339747-4-gshan@redhat.com>
In-Reply-To: <20230227042629.339747-1-gshan@redhat.com>
References: <20230227042629.339747-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: cGYKxq+AiiZe

Due to multiple capabilities associated with the dirty ring for different
architectures: KVM_CAP_DIRTY_{LOG_RING, LOG_RING_ACQ_REL} for x86 and
arm64 separately. There will be more to be done in order to support the
dirty ring for arm64.

Lets add helper kvm_dirty_ring_init() to enable the dirty ring. With this,
the code looks a bit clean.

No functional change intended.

Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Tested-by: Zhenyu Zhang <zhenyzha@redhat.com>
---
 accel/kvm/kvm-all.c | 76 ++++++++++++++++++++++++++++-----------------
 1 file changed, 47 insertions(+), 29 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index b5e12de522..e5035026c9 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -1453,6 +1453,50 @@ static int kvm_dirty_ring_reaper_init(KVMState *s)
     return 0;
 }
 
+static int kvm_dirty_ring_init(KVMState *s)
+{
+    uint32_t ring_size = s->kvm_dirty_ring_size;
+    uint64_t ring_bytes = ring_size * sizeof(struct kvm_dirty_gfn);
+    int ret;
+
+    s->kvm_dirty_ring_size = 0;
+    s->kvm_dirty_ring_bytes = 0;
+
+    /* Bail if the dirty ring size isn't specified */
+    if (!ring_size) {
+        return 0;
+    }
+
+    /*
+     * Read the max supported pages. Fall back to dirty logging mode
+     * if the dirty ring isn't supported.
+     */
+    ret = kvm_vm_check_extension(s, KVM_CAP_DIRTY_LOG_RING);
+    if (ret <= 0) {
+        warn_report("KVM dirty ring not available, using bitmap method");
+        return 0;
+    }
+
+    if (ring_bytes > ret) {
+        error_report("KVM dirty ring size %" PRIu32 " too big "
+                     "(maximum is %ld).  Please use a smaller value.",
+                     ring_size, (long)ret / sizeof(struct kvm_dirty_gfn));
+        return -EINVAL;
+    }
+
+    ret = kvm_vm_enable_cap(s, KVM_CAP_DIRTY_LOG_RING, 0, ring_bytes);
+    if (ret) {
+        error_report("Enabling of KVM dirty ring failed: %s. "
+                     "Suggested minimum value is 1024.", strerror(-ret));
+        return -EIO;
+    }
+
+    s->kvm_dirty_ring_size = ring_size;
+    s->kvm_dirty_ring_bytes = ring_bytes;
+
+    return 0;
+}
+
 static void kvm_region_add(MemoryListener *listener,
                            MemoryRegionSection *section)
 {
@@ -2522,35 +2566,9 @@ static int kvm_init(MachineState *ms)
      * Enable KVM dirty ring if supported, otherwise fall back to
      * dirty logging mode
      */
-    if (s->kvm_dirty_ring_size > 0) {
-        uint64_t ring_bytes;
-
-        ring_bytes = s->kvm_dirty_ring_size * sizeof(struct kvm_dirty_gfn);
-
-        /* Read the max supported pages */
-        ret = kvm_vm_check_extension(s, KVM_CAP_DIRTY_LOG_RING);
-        if (ret > 0) {
-            if (ring_bytes > ret) {
-                error_report("KVM dirty ring size %" PRIu32 " too big "
-                             "(maximum is %ld).  Please use a smaller value.",
-                             s->kvm_dirty_ring_size,
-                             (long)ret / sizeof(struct kvm_dirty_gfn));
-                ret = -EINVAL;
-                goto err;
-            }
-
-            ret = kvm_vm_enable_cap(s, KVM_CAP_DIRTY_LOG_RING, 0, ring_bytes);
-            if (ret) {
-                error_report("Enabling of KVM dirty ring failed: %s. "
-                             "Suggested minimum value is 1024.", strerror(-ret));
-                goto err;
-            }
-
-            s->kvm_dirty_ring_bytes = ring_bytes;
-         } else {
-             warn_report("KVM dirty ring not available, using bitmap method");
-             s->kvm_dirty_ring_size = 0;
-        }
+    ret = kvm_dirty_ring_init(s);
+    if (ret < 0) {
+        goto err;
     }
 
     /*
-- 
2.23.0

