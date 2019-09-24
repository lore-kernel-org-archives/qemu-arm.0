Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp4045512wrp;
        Tue, 24 Sep 2019 08:23:43 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz6QrE3SpUC5FgVgYO7dWW7n4Cs65fPf3wfIJ3m1IiSH71AVHBLiaMRb6JvMvPYs87gWLo4
X-Received: by 2002:a0c:e785:: with SMTP id x5mr2977688qvn.71.1569338623212;
        Tue, 24 Sep 2019 08:23:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569338623; cv=none;
        d=google.com; s=arc-20160816;
        b=HcRm8eP2me/j52r+MjGpC03IBlDSp2FVsnyZierrdunx0U+zkwEts9M8rjS8rOF7pr
         GlWHh3WMymxoEMpwHCsloTm5HxgYhqoy1batGqWjXwH9Fv6pj+eGILaRPLKxY6wPL2Fo
         VtfLWoBD75JiilxpAjj3enV9PNJoJ4T0iLI5X80Jw0cBrcGuwlEdCOmypSvgLo3GX2P4
         WkllmIN3Qbj+BzJYDJwGTctjSYDeKMzNokFfTVfGJ5D6BS/QjhxV8+r9hm6VJI7001uu
         rZ3e4H8ojx6U1ywETQZ8CjW4UtH6ZxGpr8OqQKC2PQ7BlfbW1iz+hZeL1D3GcKt640qK
         zWwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=nGe9lc3/nIVFmF/WvoNeR8DFDPxUP7AH5knkq/mBsAQ=;
        b=SJ3UHRZTLaGL4yd+/I0fQVv0ikfV8236qYH+sljUXsy90jv6a4O+H7c4jfi4amg2VB
         +Cv4p51psVAhYCCoIYz0M9BU+FQ3AYExmDVPAqi3M4qKRoKoIRGkOVwbC1R5EGNn4VNF
         3nsJD6GMVwl+pc3BUkTGK4ccebrQ2N0TPEae2vG7gDwjF1BNkbfTlolp2tuYANiFttrN
         DpXyZZwLpFIcNo2oMPXhR9sprRDHZb3wxwenHTbVqxVI7WqfRWFbTG5KZyDG8y0Guw0w
         05t8cOtrsjx/ZsCSwNKyjrlHdRhozFSEKnQKqeJvLdbqh8RP4kMv3vSgUrNBJQVJ/sVc
         rz5A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id d145si1353288qkb.69.2019.09.24.08.23.43;
        Tue, 24 Sep 2019 08:23:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id E20D84A68F;
	Tue, 24 Sep 2019 11:23:42 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: -1.502
X-Spam-Level: 
X-Spam-Status: No, score=-1.502 required=6.1 tests=[BAYES_00=-1.9,
	DNS_FROM_AHBL_RHSBL=2.699, RCVD_IN_DNSWL_MED=-2.3,
	SPF_HELO_PASS=-0.001] autolearn=no
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QqqZzfUT05ks; Tue, 24 Sep 2019 11:23:41 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id C5D1E4A6C2;
	Tue, 24 Sep 2019 11:23:41 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id 567DD4A64A
 for <kvmarm@lists.cs.columbia.edu>; Tue, 24 Sep 2019 11:23:41 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8Vj76D8APqjk for <kvmarm@lists.cs.columbia.edu>;
 Tue, 24 Sep 2019 11:23:40 -0400 (EDT)
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id 6D0B74A650
 for <kvmarm@lists.cs.columbia.edu>; Tue, 24 Sep 2019 11:23:37 -0400 (EDT)
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 6C35B257579530C63335;
 Tue, 24 Sep 2019 23:23:27 +0800 (CST)
Received: from linux-Bxxcye.huawei.com (10.175.104.222) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.439.0; Tue, 24 Sep 2019 23:23:21 +0800
From: Heyi Guo <guoheyi@huawei.com>
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>,
 <linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.cs.columbia.edu>
Subject: [RFC PATCH 10/12] arm/sdei: check KVM cap and enable SDEI
Date: Tue, 24 Sep 2019 23:21:49 +0800
Message-ID: <1569338511-3572-11-git-send-email-guoheyi@huawei.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1569338511-3572-1-git-send-email-guoheyi@huawei.com>
References: <1569338511-3572-1-git-send-email-guoheyi@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.222]
X-CFilter-Loop: Reflected
Cc: Marc Zyngier <marc.zyngier@arm.com>, Heyi Guo <guoheyi@huawei.com>,
 Dave Martin <Dave.Martin@arm.com>
X-BeenThere: kvmarm@lists.cs.columbia.edu
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: Where KVM/ARM decisions are made <kvmarm.lists.cs.columbia.edu>
List-Unsubscribe: <https://lists.cs.columbia.edu/mailman/options/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=unsubscribe>
List-Archive: <https://lists.cs.columbia.edu/pipermail/kvmarm>
List-Post: <mailto:kvmarm@lists.cs.columbia.edu>
List-Help: <mailto:kvmarm-request@lists.cs.columbia.edu?subject=help>
List-Subscribe: <https://lists.cs.columbia.edu/mailman/listinfo/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kvmarm-bounces@lists.cs.columbia.edu
Sender: kvmarm-bounces@lists.cs.columbia.edu
X-TUID: m2ubBLDBFjf5

Check KVM hypercall forward capability and enable it, and set global
flag "sdei_enabled" to true if everything works well.

Signed-off-by: Heyi Guo <guoheyi@huawei.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Dave Martin <Dave.Martin@arm.com>
Cc: Marc Zyngier <marc.zyngier@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: James Morse <james.morse@arm.com>
---
 target/arm/sdei.c | 17 +++++++++++++++++
 target/arm/sdei.h |  2 ++
 2 files changed, 19 insertions(+)

diff --git a/target/arm/sdei.c b/target/arm/sdei.c
index efdb681..000545e 100644
--- a/target/arm/sdei.c
+++ b/target/arm/sdei.c
@@ -43,6 +43,7 @@
 #define TYPE_QEMU_SDEI "qemu_sdei"
 #define QEMU_SDEI(obj) OBJECT_CHECK(QemuSDEState, (obj), TYPE_QEMU_SDEI)
 
+bool sdei_enabled;
 static QemuSDEState *sde_state;
 
 typedef struct QemuSDEIBindNotifyEntry {
@@ -1465,6 +1466,7 @@ static const VMStateDescription vmstate_sde_state = {
 static void sdei_initfn(Object *obj)
 {
     QemuSDEState *s = QEMU_SDEI(obj);
+    KVMState *kvm = KVM_STATE(current_machine->accelerator);
 
     if (sde_state) {
         error_report("Only one SDEI dispatcher is allowed!");
@@ -1474,6 +1476,21 @@ static void sdei_initfn(Object *obj)
 
     qemu_sde_init(s);
     qemu_register_reset(qemu_sde_reset, s);
+
+    if (kvm_check_extension(kvm, KVM_CAP_FORWARD_HYPERCALL)) {
+        int ret;
+        ret = kvm_vm_enable_cap(kvm, KVM_CAP_FORWARD_HYPERCALL, 0,
+                                KVM_CAP_FORWARD_HYPERCALL_EXCL_PSCI);
+        if (ret < 0) {
+            error_report("Enable hypercall forwarding failed: %s",
+                         strerror(-ret));
+            abort();
+        }
+        sdei_enabled = true;
+        info_report("qemu sdei enabled");
+    } else {
+        info_report("KVM does not support forwarding hypercall.");
+    }
 }
 
 static void qemu_sde_class_init(ObjectClass *klass, void *data)
diff --git a/target/arm/sdei.h b/target/arm/sdei.h
index feaaf1a..95e7d8d 100644
--- a/target/arm/sdei.h
+++ b/target/arm/sdei.h
@@ -29,6 +29,8 @@
 
 #define SDEI_MAX_REQ        SDEI_1_0_FN(0x12)
 
+extern bool sdei_enabled;
+
 void sdei_handle_request(CPUState *cs, struct kvm_run *run);
 
 /*
-- 
1.8.3.1

_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
