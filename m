Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp4075810ejb;
        Mon, 6 Feb 2023 03:23:18 -0800 (PST)
X-Google-Smtp-Source: AK7set9dS9NJ1XwtnDaeUt8+sKh3QtaJ3WwvVLMEvRThV7IwTOH0fRhc6+WitPeCH1huKZTl3e9+
X-Received: by 2002:a05:6214:5191:b0:56b:dd60:3496 with SMTP id kl17-20020a056214519100b0056bdd603496mr14903708qvb.34.1675682598329;
        Mon, 06 Feb 2023 03:23:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675682598; cv=none;
        d=google.com; s=arc-20160816;
        b=PcKndK3QOF9uCDDGGNK5OKC7JRRly2pDTjCJ5sY0KUzT3BIYE+4Da79TVSrirn/9J9
         gkJEA+6KnILofQyRD0teaJPlqD8+cYIFGV5QW+4M/BtzS9n2M424wYphxoU/Yjt4AxfZ
         6uA3N+0RosvwKugairjatE7pmY75Uw+dhTpMGR6cfHaNEKxMHc/9aHsyCVwg7IBgH9Ur
         LGFe1XuwXGP5wYfKLjsLybZgS4W3mzaHl9oDeOU6kWEhDNRJEKt5K50pYddAqXXK7Dyw
         gB8xZ5cY8j+HU877CiaiRcFiP6jraPrhSPQJOwOmywkp+iGUPrREUAz9aJnuicXjL0Hp
         dkQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ezT0/aoBW/YY0l1s0UAK7lpF6HyMwc+sYc1e4IW+uoI=;
        b=vqOugx0xT51+sJ41zM5IYZ392GQHmKr7uFXaFKfRb5ZR6KTwKtIjiIaucWPoFQAy/3
         VcFHAX6+8iKDFSSpPZJHK8i1ewSjxMy5v2z4/9Y8hwGq6sknmcLGVgMfZac44WxIYrdk
         ac8x2dquRFYV6IOD9pDwLYhY7elDwX6xkGwG7mEyUJS7mda5/UxU403nE6Uk1O/CTZhb
         4vfliS+uj8jepvU/BJB2THSDXp2v7p77+ad8F5vSfSns55oUwtksycV7l5LwzPSFilGI
         gg85MxD0NzfmliqU15UrUaoR4h87E/Y2eUfW1k7hpElDrGQF6XF0JMjTIOcXFBKM20Xi
         31pQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=INXrfSNp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 68-20020a370547000000b006fbba0f5a48si7900414qkf.3.2023.02.06.03.23.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Feb 2023 03:23:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=INXrfSNp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOzaU-0005Cr-CP; Mon, 06 Feb 2023 06:23:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pOzaS-00052j-Ev
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 06:23:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pOzaP-0003Xa-E4
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 06:23:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675682580;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ezT0/aoBW/YY0l1s0UAK7lpF6HyMwc+sYc1e4IW+uoI=;
 b=INXrfSNpMwxYSkSvuoU7HGck0BAEY3X9m43YkAMMxb4auZkY1tPKT3bjT3csjRy0ydUAEa
 vYaPV37Ucq9GNcfpLCFpyDTnTQeUthN5il7zxgQO0U0fdI47NnDi/Z57RyCKY2dXmvR12I
 2icI15DFJbJRl8ct+qB+/z8oU1toO2U=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-597-I_iCKIeoN4eCqfiLZIGa2g-1; Mon, 06 Feb 2023 06:21:45 -0500
X-MC-Unique: I_iCKIeoN4eCqfiLZIGa2g-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A8B951C08964;
 Mon,  6 Feb 2023 11:21:44 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-63.bne.redhat.com [10.64.54.63])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C0EA2492B23;
 Mon,  6 Feb 2023 11:21:38 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, peter.maydell@linaro.org,
 peterx@redhat.com, david@redhat.com, philmd@linaro.org, mst@redhat.com,
 cohuck@redhat.com, quintela@redhat.com, dgilbert@redhat.com,
 maz@kernel.org, zhenyzha@redhat.com, shan.gavin@gmail.com
Subject: [PATCH RFCv1 8/8] kvm: Enable dirty ring for arm64
Date: Mon,  6 Feb 2023 19:20:10 +0800
Message-Id: <20230206112010.99871-9-gshan@redhat.com>
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
X-TUID: jyR7EP7nq5ND

arm64 has different capability from x86 to enable the dirty ring, which
is KVM_CAP_DIRTY_LOG_RING_ACQ_REL. To enable it in kvm_dirty_ring_init()
when KVM_CAP_DIRTY_LOG_RING isn't supported.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 accel/kvm/kvm-all.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 399ef0f7e6..8ab31865eb 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -1479,13 +1479,19 @@ static int kvm_dirty_ring_reaper_init(KVMState *s)
 static int kvm_dirty_ring_init(KVMState *s)
 {
     uint64_t ring_bytes;
+    unsigned int capability = KVM_CAP_DIRTY_LOG_RING;
     int ret;
 
     /*
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
         s->kvm_dirty_ring_size = 0;
@@ -1502,7 +1508,7 @@ static int kvm_dirty_ring_init(KVMState *s)
         goto out;
     }
 
-    ret = kvm_vm_enable_cap(s, KVM_CAP_DIRTY_LOG_RING, 0, ring_bytes);
+    ret = kvm_vm_enable_cap(s, capability, 0, ring_bytes);
     if (ret) {
         error_report("Enabling of KVM dirty ring failed: %s. "
                      "Suggested minimum value is 1024.", strerror(-ret));
-- 
2.23.0

