Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp2433343ejq;
        Mon, 8 May 2023 19:23:13 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ58yaFyMsveijz4p2abE5SGfyf5dA1SCjdRZvPMZzIIugPTgpS4JsS2jEIjn0ABIQk8VqNW
X-Received: by 2002:a05:622a:2d5:b0:3e8:1903:ab05 with SMTP id a21-20020a05622a02d500b003e81903ab05mr18761171qtx.64.1683598993250;
        Mon, 08 May 2023 19:23:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683598993; cv=none;
        d=google.com; s=arc-20160816;
        b=goK34c9nJTNi1Uc4iyOuOzvmHr/NzxV4koTra2m+CREFI3bQwM8tYgJzrQU+XVh+x4
         O4Gq729tCl6H5VinhJ/EFSAAhkeB5TtBtjv5iwGv7aeiTTTEj0fN6+SAhIlWZyqBzAhe
         RE0a8hVbIEMeRRgUWDTD6wbKhq52HUpeiIj8hMCyzo35JZMxoG4ZkIQxc4x5oLrs+Xif
         SI7SZaw3SUjSyUEsAvKhHI6u7EU1zL2rHe6NOeq1zBVP5n4kEl5aOu9/xe5oSvcT+rzU
         LX6K6QjHmgO/TshV5wW/KeNY0E3xRr9KbznRd0V/XeOLTs8m77SWhSgtYGVC1NHqjKMY
         N2JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=KWghLOz3HpWxoe11c4O6AK1yng47haWuN7Nrkqj0J7g=;
        b=qLbA2mnSc5Nx18CambBL5gs1nXUY6ivkTf2LGUx9KVNdfeOWXRayIubLTmUIEtVFZY
         RVPTlPs6Wen1CwyQ7+PNTRvoEVJ8Hjlf21BexsfeWhZbin4bKBDTccxytcZRoQxa9rHS
         4R6Xsk9tMmvYVR0zrViF/xYiJMFzP/cN8UaUhLIx0XvVtGO/sVOh1tP040hc+uKMXhOr
         ybnLcvFuuxPVnuNXgMUVXIaZNHxvTNIUfcXeZ+cCkVBL7rwDIu/NqEqr5Cd2oxbSxOVS
         OIncM5h3xeNA1Z/qINp+9DiQtEEY5NI7l4Ex3zhRgd5maRLSo80N13mW6PLd/NVE5Y9W
         Odpg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Sd5J7KsY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e22-20020ac84e56000000b003ef3035746dsi144680qtw.56.2023.05.08.19.23.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 May 2023 19:23:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Sd5J7KsY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pwCzV-0004Jj-Vo; Mon, 08 May 2023 22:22:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pwCzS-0004Ix-J2
 for qemu-arm@nongnu.org; Mon, 08 May 2023 22:22:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pwCzR-0001zL-4R
 for qemu-arm@nongnu.org; Mon, 08 May 2023 22:22:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683598926;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KWghLOz3HpWxoe11c4O6AK1yng47haWuN7Nrkqj0J7g=;
 b=Sd5J7KsYHRK5sTLm4+CcRlVcQkbk1XxGCGD75ALAiOJE8958L4CVbA+EeAhLco16/SKF3y
 0jxYMVcoPr+8oopGgz0AFYOtAFb/LetRQwVSfOth+YjgMpUL50hb3aA4Yr9Tmnc3NcJox2
 ll5wotufta6Kf2FmI5o/+kOSiYDfVWY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-258-i6s3r3AgO8-NiEpbQGVeSg-1; Mon, 08 May 2023 22:22:03 -0400
X-MC-Unique: i6s3r3AgO8-NiEpbQGVeSg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C4432185A790;
 Tue,  9 May 2023 02:22:01 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-118.bne.redhat.com [10.64.54.118])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F1320492B00;
 Tue,  9 May 2023 02:21:56 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, peter.maydell@linaro.org,
 peterx@redhat.com, david@redhat.com, philmd@linaro.org, mst@redhat.com,
 cohuck@redhat.com, quintela@redhat.com, dgilbert@redhat.com,
 maz@kernel.org, zhenyzha@redhat.com, shan.gavin@gmail.com
Subject: [PATCH v3 4/4] kvm: Enable dirty ring for arm64
Date: Tue,  9 May 2023 12:21:22 +1000
Message-Id: <20230509022122.20888-5-gshan@redhat.com>
In-Reply-To: <20230509022122.20888-1-gshan@redhat.com>
References: <20230509022122.20888-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 8SK0jxEujpXp

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
index 5d0de9d0a8..7679f397ae 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -1466,6 +1466,7 @@ static int kvm_dirty_ring_init(KVMState *s)
 {
     uint32_t ring_size = s->kvm_dirty_ring_size;
     uint64_t ring_bytes = ring_size * sizeof(struct kvm_dirty_gfn);
+    unsigned int capability = KVM_CAP_DIRTY_LOG_RING;
     int ret;
 
     s->kvm_dirty_ring_size = 0;
@@ -1480,7 +1481,12 @@ static int kvm_dirty_ring_init(KVMState *s)
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
@@ -1493,13 +1499,26 @@ static int kvm_dirty_ring_init(KVMState *s)
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

