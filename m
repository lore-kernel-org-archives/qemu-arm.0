Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp4076512ejb;
        Mon, 6 Feb 2023 03:24:12 -0800 (PST)
X-Google-Smtp-Source: AK7set+iagzd5aVahCkAgGMK27T6SakNLO2mrU9QKINqw+rwvyCuSiBNGKQ8rtGXET9AMFzvqvnq
X-Received: by 2002:a05:622a:14d0:b0:3b9:b447:5913 with SMTP id u16-20020a05622a14d000b003b9b4475913mr35064673qtx.7.1675682651972;
        Mon, 06 Feb 2023 03:24:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675682651; cv=none;
        d=google.com; s=arc-20160816;
        b=ULGG9dOCUphrSJvTjnGPo51DlSkmhk5KKJNJVzuciFq2tTiwjd+JrZ00zCSP9ITgVN
         Tav+sDdn4wbrO09z5MlxNKkTBhs2y2wDUfwXF0dZEiCka/FLdIDJpx+0kQyFTl2/wv16
         UMoZ42N09N3HNOFNttOx/ybigE748j2oZgvTJlBLnkmY+akY6YTtVtTOSLKnB0td/1h5
         mdq9epd/dvCMFJJyHn551p+7oi59m7k77GANlCvibMIFQLgLoenmCzSDL48qlTbJsbl8
         U5euJpto25yeciWizeYTbSm0rzTK/LTIHCYX+hP8OvM9LLM+GxKXt3Xkxyvsx/E+EZTJ
         9l2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=S7zj9j3WG5yOw3N8S6DF7Pu5F0DlcQE5xV5NIX1uE+g=;
        b=HK2M4FgwiCAtdiTZgB8EIO2p4MfKiewi1tiADA23emoWF+5pHcc/F6WOd3u7A7XZjX
         ej+FjL/yEow5/BWZKSQSFVHHHzBIw7BueWuPr3wl5h3dQLKsF9FBdlog9s0vltYZ+rD6
         N4FLg7nGdfp1+PXWQFkYJGuyAEkfIa1subxYj4sg62CNAfZGCfDbv1m0IhTwvCmEeDg6
         tjdD7mjleuJusgMRmIubtua18NI5rYPLtwDFWgqpbzSlcAFRRcahEaK1+Tc0rWCShXam
         edD46/tgokscGqiRDl0YFoMmOUo4jbVbhn2inVWUwYBnjegm9rIUwVVup+94vkSKPjZS
         z/nw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=flgD1Jj3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 8-20020ac85748000000b003b86b4fb399si7992023qtx.425.2023.02.06.03.24.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Feb 2023 03:24:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=flgD1Jj3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pOzaV-0005Gx-Ew; Mon, 06 Feb 2023 06:23:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pOzaS-00052e-F9
 for qemu-arm@nongnu.org; Mon, 06 Feb 2023 06:23:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pOzaP-0003XR-Aa
 for qemu-arm@nongnu.org; Mon, 06 Feb 2023 06:23:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675682580;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S7zj9j3WG5yOw3N8S6DF7Pu5F0DlcQE5xV5NIX1uE+g=;
 b=flgD1Jj3tWO/cluuxxFRhKlF1JCOPNVJUsfOGvu0F0Fu/bcp2xwbwWnwxxUgYZeaPSRG6/
 G+sHld/aCOAgaAWhzKpa1zfjAJODIY5Cf4nOtvhz4nqB2cr2mAb7rl3lPXms7bWReTNQQ1
 5ES2AhprNVv9caSXJyFwu/SEWYcgpMQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-388-csO-Z1grO3ugrvZ2gXhW5A-1; Mon, 06 Feb 2023 06:21:36 -0500
X-MC-Unique: csO-Z1grO3ugrvZ2gXhW5A-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AE19B10395C6;
 Mon,  6 Feb 2023 11:21:32 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-63.bne.redhat.com [10.64.54.63])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E54B2492B21;
 Mon,  6 Feb 2023 11:21:27 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, peter.maydell@linaro.org,
 peterx@redhat.com, david@redhat.com, philmd@linaro.org, mst@redhat.com,
 cohuck@redhat.com, quintela@redhat.com, dgilbert@redhat.com,
 maz@kernel.org, zhenyzha@redhat.com, shan.gavin@gmail.com
Subject: [PATCH RFCv1 6/8] kvm: Add helper kvm_dirty_ring_init()
Date: Mon,  6 Feb 2023 19:20:08 +0800
Message-Id: <20230206112010.99871-7-gshan@redhat.com>
In-Reply-To: <20230206112010.99871-1-gshan@redhat.com>
References: <20230206112010.99871-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
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
X-TUID: Hvn5IGHXc/Wx

Due to multiple capabilities associated with the dirty ring for different
architectures: KVM_CAP_DIRTY_{LOG_RING, LOG_RING_ACQ_REL} for x86 and
arm64 separately. There will be more to be done in order to support the
dirty ring for arm64.

Lets add helper kvm_dirty_ring_init() to enable the dirty ring. With this,
the code looks a bit clean.

No functional change intended.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 accel/kvm/kvm-all.c | 73 ++++++++++++++++++++++++++++-----------------
 1 file changed, 46 insertions(+), 27 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 9ec117c441..399ef0f7e6 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -1476,6 +1476,49 @@ static int kvm_dirty_ring_reaper_init(KVMState *s)
     return 0;
 }
 
+static int kvm_dirty_ring_init(KVMState *s)
+{
+    uint64_t ring_bytes;
+    int ret;
+
+    /*
+     * Read the max supported pages. Fall back to dirty logging mode
+     * if the dirty ring isn't supported.
+     */
+    ret = kvm_vm_check_extension(s, KVM_CAP_DIRTY_LOG_RING);
+    if (ret <= 0) {
+        warn_report("KVM dirty ring not available, using bitmap method");
+        s->kvm_dirty_ring_size = 0;
+        return 0;
+    }
+
+    ring_bytes = s->kvm_dirty_ring_size * sizeof(struct kvm_dirty_gfn);
+    if (ring_bytes > ret) {
+        error_report("KVM dirty ring size %" PRIu32 " too big "
+                     "(maximum is %ld).  Please use a smaller value.",
+                     s->kvm_dirty_ring_size,
+                     (long)ret / sizeof(struct kvm_dirty_gfn));
+        ret = -EINVAL;
+        goto out;
+    }
+
+    ret = kvm_vm_enable_cap(s, KVM_CAP_DIRTY_LOG_RING, 0, ring_bytes);
+    if (ret) {
+        error_report("Enabling of KVM dirty ring failed: %s. "
+                     "Suggested minimum value is 1024.", strerror(-ret));
+        ret = -EIO;
+    }
+
+out:
+    if (ret) {
+        s->kvm_dirty_ring_size = 0;
+    } else {
+        s->kvm_dirty_ring_bytes = ring_bytes;
+    }
+
+    return ret;
+}
+
 static void kvm_region_add(MemoryListener *listener,
                            MemoryRegionSection *section)
 {
@@ -2545,33 +2588,9 @@ static int kvm_init(MachineState *ms)
      * dirty logging mode
      */
     if (s->kvm_dirty_ring_size > 0) {
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
+        ret = kvm_dirty_ring_init(s);
+        if (ret < 0) {
+            goto err;
         }
     }
 
-- 
2.23.0

