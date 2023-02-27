Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4255037ejc;
        Sun, 26 Feb 2023 20:29:27 -0800 (PST)
X-Google-Smtp-Source: AK7set+qjIQCuEX3jtWx+4jfEzS5ZRMcvURVTtiHcRfbRhzn2UIQs7GzppGBnwsB4jlXh71GBtfO
X-Received: by 2002:a05:622a:1b91:b0:3a7:e619:61a with SMTP id bp17-20020a05622a1b9100b003a7e619061amr43323594qtb.37.1677472167172;
        Sun, 26 Feb 2023 20:29:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677472167; cv=none;
        d=google.com; s=arc-20160816;
        b=kuHT40DcrPI6hUHQdpkIzXR5outzMns74bSPQSb84Fa1Rh72Wcu+ImKrM77mqsxL6h
         SGgqBjqwgjpdV2pVs68CJL4xcBh8CqXOhICAX+gzvxIb8N1UPWGwnlRuRi1BwdY9Wogi
         bNPCC5Lj3J5b00vYf8oaK1vyRny1O2KDygRmykTbRqnX8wkPiqT+TypYgnjiaPeSfVml
         r4As4eYsw19eZPTglBTplvlj9lCPsxFRm/rCNzFWs45aRz3zX7qkt7lbcPQFPWrZSzhC
         pWYKp2tFcdMDbpun6txbKqFMagl7o4rEpVErp8wCE1aJXHD6DLcTty5XY5JVZm7Rs40q
         UfrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=IEbi1lN0FvpAADEiqnPvO0Blw7g5PUkwtEQIj5AfqEA=;
        b=kLd6vZjwlWCrSv3GozxYWMyibIAP19z4fAM6o6AH9qbf6NbsabnHjdevMTJVxQ524V
         56D0jEBWBozx0qtvxWwRSb7fN5wduaiGbzr0NUo5FI+PF5T50B64GS+eieMsC8lBW9pQ
         rWZ+O2DJ7XdEgkw2iieta61pUKhYBP4m6tg/VGbkFVpQL812TLQwnaLljP3RuXBNiF1N
         EMoY1nMSEGytzZSdRaYbc2jrz+HLqEp6HFrP5kn65kwR7lpbI1Bb4alJWAiWjsttwbAO
         ZvJdMJlxJYPmGrdiG2vPh7eAqvJpb0Oi7THaeGwoMTQhNkYJENOwqlROsNvL7/P4APdT
         oWgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HJCRkukw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v13-20020a05622a144d00b003b6953fbb9asi5716438qtx.348.2023.02.26.20.29.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Feb 2023 20:29:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HJCRkukw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWV89-0002jR-D3; Sun, 26 Feb 2023 23:28:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pWV87-0002ij-Qr
 for qemu-arm@nongnu.org; Sun, 26 Feb 2023 23:28:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pWV86-0003xi-ET
 for qemu-arm@nongnu.org; Sun, 26 Feb 2023 23:28:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677472129;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IEbi1lN0FvpAADEiqnPvO0Blw7g5PUkwtEQIj5AfqEA=;
 b=HJCRkukwXxnlJvGtqrvUw5r2DIcVak8RSsVX/FQwc5dr6ofHgJA4XeoV+cUHZ1lQXBI59o
 Osc6nSJYteGzKwu6p76rYl9oC9XzEPK3AOheRU2ADmdCoLlRt15hqcX578ZT0NKG0zmYZx
 AzrEjS4gVWo3ST+8UsszrZpMhwmRc0A=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-413-DFPB52I9PAKpE3hDIYDJEA-1; Sun, 26 Feb 2023 23:28:46 -0500
X-MC-Unique: DFPB52I9PAKpE3hDIYDJEA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D9D9429AA38B;
 Mon, 27 Feb 2023 04:28:45 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-58.bne.redhat.com [10.64.54.58])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9B4221121314;
 Mon, 27 Feb 2023 04:28:39 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, peter.maydell@linaro.org,
 peterx@redhat.com, david@redhat.com, philmd@linaro.org, mst@redhat.com,
 cohuck@redhat.com, quintela@redhat.com, dgilbert@redhat.com,
 maz@kernel.org, zhenyzha@redhat.com, shan.gavin@gmail.com
Subject: [PATCH v2 4/4] kvm: Enable dirty ring for arm64
Date: Mon, 27 Feb 2023 12:26:29 +0800
Message-Id: <20230227042629.339747-5-gshan@redhat.com>
In-Reply-To: <20230227042629.339747-1-gshan@redhat.com>
References: <20230227042629.339747-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Q0nFSZqKEyZW

arm64 has different capability from x86 to enable the dirty ring, which
is KVM_CAP_DIRTY_LOG_RING_ACQ_REL. Besides, arm64 also needs the backup
bitmap extension (KVM_CAP_DIRTY_LOG_RING_WITH_BITMAP) when 'kvm-arm-gicv3'
or 'arm-its-kvm' device is enabled. Here the extension is always enabled
and the unnecessary overhead to do the last stage of dirty log synchronization
when those two devices aren't used is introduced, but the overhead should
be very small and acceptable. The benefit is cover future cases where those
two devices are used without modifying the code.

Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Tested-by: Zhenyu Zhang <zhenyzha@redhat.com>
---
 accel/kvm/kvm-all.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index e5035026c9..d96bca618b 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -1457,6 +1457,7 @@ static int kvm_dirty_ring_init(KVMState *s)
 {
     uint32_t ring_size = s->kvm_dirty_ring_size;
     uint64_t ring_bytes = ring_size * sizeof(struct kvm_dirty_gfn);
+    unsigned int capability = KVM_CAP_DIRTY_LOG_RING;
     int ret;
 
     s->kvm_dirty_ring_size = 0;
@@ -1471,7 +1472,12 @@ static int kvm_dirty_ring_init(KVMState *s)
      * Read the max supported pages. Fall back to dirty logging mode
      * if the dirty ring isn't supported.
      */
-    ret = kvm_vm_check_extension(s, KVM_CAP_DIRTY_LOG_RING);
+    ret = kvm_vm_check_extension(s, capability);
+    if (ret <= 0) {
+        capability = KVM_CAP_DIRTY_LOG_RING_ACQ_REL;
+        ret = kvm_vm_check_extension(s, capability);
+    }
+
     if (ret <= 0) {
         warn_report("KVM dirty ring not available, using bitmap method");
         return 0;
@@ -1484,13 +1490,26 @@ static int kvm_dirty_ring_init(KVMState *s)
         return -EINVAL;
     }
 
-    ret = kvm_vm_enable_cap(s, KVM_CAP_DIRTY_LOG_RING, 0, ring_bytes);
+    ret = kvm_vm_enable_cap(s, capability, 0, ring_bytes);
     if (ret) {
         error_report("Enabling of KVM dirty ring failed: %s. "
                      "Suggested minimum value is 1024.", strerror(-ret));
         return -EIO;
     }
 
+    /* Enable the backup bitmap if it is supported */
+    ret = kvm_vm_check_extension(s, KVM_CAP_DIRTY_LOG_RING_WITH_BITMAP);
+    if (ret > 0) {
+        ret = kvm_vm_enable_cap(s, KVM_CAP_DIRTY_LOG_RING_WITH_BITMAP, 0);
+        if (ret) {
+            error_report("Enabling of KVM dirty ring's backup bitmap failed: "
+                         "%s. ", strerror(-ret));
+            return -EIO;
+        }
+
+        s->kvm_dirty_ring_with_bitmap = true;
+    }
+
     s->kvm_dirty_ring_size = ring_size;
     s->kvm_dirty_ring_bytes = ring_bytes;
 
-- 
2.23.0

