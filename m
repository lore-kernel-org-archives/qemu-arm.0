Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp3999806ejb;
        Sun, 12 Feb 2023 16:41:07 -0800 (PST)
X-Google-Smtp-Source: AK7set8kVemsScGpe/UCTRvCxLzllL/+Dyl6sqIHNU8+fMRCLwScx/czGjw7WwxNtooC6DUaPf/9
X-Received: by 2002:a05:622a:c4:b0:3b0:2fa:8a90 with SMTP id p4-20020a05622a00c400b003b002fa8a90mr43031194qtw.8.1676248867204;
        Sun, 12 Feb 2023 16:41:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676248867; cv=none;
        d=google.com; s=arc-20160816;
        b=LeXCF9vM7j0AQXpkxHjIHJQlP62IoxMk1Ro0AMEjCjCCM6bWdoUflaEsM1412NVE3k
         0sEBr6jQGwNrTNCfVZHZu4a7WqkMIc+7bPi5mOIJ9ZFx8crfdQexIbwwt+Qes1B9JL+q
         CoFHEATArMdGwKVyhdYYiEqresBATXOhSAtEA7rICp8q767b9qdRDPvjteN9DF3PNtGP
         GVl/WFF3wsxjHpT/F1h+sOCIsDxDn1XAqiCrF5V86NMcWgKUtxEQA+XS9jBp6/NfVKZp
         mNo+JleQf9NGfc8uBYEQOMCl2XQD6CCoz6MjbPwwqHWqxmde+F4YfpYdkK4wbKOatO8f
         NLpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=yfEiMlotzwVa+BZ2vnpJRtaUaWl9FtqnjFN3oEdOp24=;
        b=Su9hWWESJQp3Jp07FBuMCgEu569fOnEY70IXJOkglSwxjZIXBJyxxIvNRJWc6Dv64u
         +6P2vDlXnSlSohqDzA8wYA5R4nXsipkB52SpzgGcL3Ab+9JpWCKcAwx/r9sV84Fn7H4n
         ER6rjth4drb6gp3+XTcNdhUm7ri/lp6C6froqzKWSeXvuMhkkOXXP7+uU5HOk+XBbgqH
         6dQekKTFy03CCRJdHI+CtFOnemk3zlibht7aVjGRDoX/TS7rJu81hdsFOPSg2gAjeuxx
         LR/U3gUyhwj1HqUAP1ZlP8U6gnZNTc4SSbflMcCa0gNVWsBXjd+V5QalqrvfzDmycqxU
         DjMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PtcGmepg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c1-20020ac85a81000000b003ba138f7b10si8128558qtc.476.2023.02.12.16.41.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 Feb 2023 16:41:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PtcGmepg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRMtS-0000D4-VQ; Sun, 12 Feb 2023 19:40:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pRMtR-0000Bo-FM
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 19:40:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1pRMtP-0003NL-Vv
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 19:40:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676248827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yfEiMlotzwVa+BZ2vnpJRtaUaWl9FtqnjFN3oEdOp24=;
 b=PtcGmepgU9vnSHWDQ1xUk3d70yMx09M4hYzmNnMN4mpANGiXL6X6sJTVw8/Gocfyzke/p3
 IK+oEKe5eHSnKWcK4WIqMo9FLkScnzKd3kyUsd9uf/V9CTuCFHvy8C1TMMOlaIGvgJiCSi
 sWI91IEDt8Fh1phtspaTiq0aGwIrocc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-652-o_veNRWYNcGXPYzaYQEhSA-1; Sun, 12 Feb 2023 19:40:25 -0500
X-MC-Unique: o_veNRWYNcGXPYzaYQEhSA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5A9BB185A78B;
 Mon, 13 Feb 2023 00:40:25 +0000 (UTC)
Received: from gshan.redhat.com (vpn2-54-114.bne.redhat.com [10.64.54.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6034240A3607;
 Mon, 13 Feb 2023 00:40:18 +0000 (UTC)
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, peter.maydell@linaro.org,
 peterx@redhat.com, david@redhat.com, philmd@linaro.org, mst@redhat.com,
 cohuck@redhat.com, quintela@redhat.com, dgilbert@redhat.com,
 maz@kernel.org, zhenyzha@redhat.com, shan.gavin@gmail.com
Subject: [PATCH v1 6/6] kvm: Enable dirty ring for arm64
Date: Mon, 13 Feb 2023 08:39:25 +0800
Message-Id: <20230213003925.40158-7-gshan@redhat.com>
In-Reply-To: <20230213003925.40158-1-gshan@redhat.com>
References: <20230213003925.40158-1-gshan@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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
X-TUID: iNrGVp8eDcsn

arm64 has different capability from x86 to enable the dirty ring, which
is KVM_CAP_DIRTY_LOG_RING_ACQ_REL. To enable it in kvm_dirty_ring_init()
when KVM_CAP_DIRTY_LOG_RING isn't supported.

Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
---
 accel/kvm/kvm-all.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index e5035026c9..f6fbeae644 100644
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
@@ -1484,7 +1490,7 @@ static int kvm_dirty_ring_init(KVMState *s)
         return -EINVAL;
     }
 
-    ret = kvm_vm_enable_cap(s, KVM_CAP_DIRTY_LOG_RING, 0, ring_bytes);
+    ret = kvm_vm_enable_cap(s, capability, 0, ring_bytes);
     if (ret) {
         error_report("Enabling of KVM dirty ring failed: %s. "
                      "Suggested minimum value is 1024.", strerror(-ret));
-- 
2.23.0

