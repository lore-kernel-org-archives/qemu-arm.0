Received: by 2002:adf:db01:0:0:0:0:0 with SMTP id s1csp459580wri;
        Tue, 5 Nov 2019 01:18:46 -0800 (PST)
X-Google-Smtp-Source: APXvYqzLaip4r+QMtjTOrt3H0KqYkFauNyD5WiwwfFInDEu8t48PcshTthELtoe57LYAMXbhQuaG
X-Received: by 2002:a05:620a:15a3:: with SMTP id f3mr18317135qkk.410.1572945526150;
        Tue, 05 Nov 2019 01:18:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1572945526; cv=none;
        d=google.com; s=arc-20160816;
        b=S3R8gO0xZs2yw5PR9iucCn145XoVvsmzFT9kUXvmYYNBE61Pr7Xvl6LdwPr5V6/L64
         34XFTyj1yPFc45Cf1fBrp6FSxtTfJ0hDx8g+ezaQj/p7pHuQsZc/nhzUQPg+UJH/m1KX
         zc3iK5kYTTIiYBjQ9MsDif5E/IBHlLVsOx3KLg/dhPx/nm4V5c1G98iP2woMdzgHwzo0
         vJPSDmBhRMTgRoRaGJxNDAPGviYKhlKVupk2gb9Mo1BkxggRbnYuJ96Y6r7ZbhqpEym5
         JzSlsPXmC9K0mTAFCi5kdExG2pHt4iuOJJp46enWuGZaaQ96WTeQjhV7Bv5CsS6XKSsA
         O7Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=rhN7RIY4X+CHO3JXVG3arImRdBdmn07zki4ql/ojqMc=;
        b=mwzPuNrFUeZarNB5xg5sY0NZ0FuOxv5BgcZ6Gz4oHOfd4n3M3j38EymxglbOcmhQR+
         ysPCJ4bgKxEdTaaXhzkrR6fe/lcAzIn621xLYHJ2/vReazfOvI/4HDis1Tv5R+idjLmW
         xSgl+mY1TfwRKvwV57FAi1KS/t9aOWRvsvHsby2r3AikpKNpp0c+Z7JZQo2vvXBOw1P1
         CC0a5OP+rp8TwbajKCHT/3sip4u4Bnven7PZ0FCjbeKKua6OBCxVxi7/EVVdIfpsNvOv
         LgVNTJQYkAc9Y8EMqvmW4dBCFf1MLMxWkunGMLNkqwvuVpvRx7Y6w11YLeElx/l00wvk
         xrMA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i22si14992571qvb.54.2019.11.05.01.18.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Nov 2019 01:18:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iRuz5-00045v-RI
	for alex.bennee@linaro.org; Tue, 05 Nov 2019 04:18:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43059)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <guoheyi@huawei.com>) id 1iRusx-00052B-Jb
 for qemu-arm@nongnu.org; Tue, 05 Nov 2019 04:12:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <guoheyi@huawei.com>) id 1iRusv-0007lc-JO
 for qemu-arm@nongnu.org; Tue, 05 Nov 2019 04:12:23 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:52212 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <guoheyi@huawei.com>)
 id 1iRusv-0007jC-6m; Tue, 05 Nov 2019 04:12:21 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 45AA184DA50D9691C0CB;
 Tue,  5 Nov 2019 17:12:18 +0800 (CST)
Received: from linux-OtBuvb.huawei.com (10.175.104.212) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.439.0; Tue, 5 Nov 2019 17:12:09 +0800
From: Heyi Guo <guoheyi@huawei.com>
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [RFC v2 11/14] linux-headers/kvm.h: add capability to forward
 hypercall
Date: Tue, 5 Nov 2019 17:10:53 +0800
Message-ID: <20191105091056.9541-12-guoheyi@huawei.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20191105091056.9541-1-guoheyi@huawei.com>
References: <20191105091056.9541-1-guoheyi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.104.212]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.35
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Marc Zyngier <marc.zyngier@arm.com>,
 Cornelia Huck <cohuck@redhat.com>, James Morse <james.morse@arm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Heyi Guo <guoheyi@huawei.com>,
 wanghaibin.wang@huawei.com, Dave Martin <Dave.Martin@arm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KMV7d2N1r4xg

To keep backward compatibility, we add new KVM capability
"KVM_CAP_FORWARD_HYPERCALL" to probe whether KVM supports forwarding
hypercall to userspace.

The capability should be enabled explicitly, for we don't want user
space application to deal with unexpected hypercall exits. After
enabling this cap, all HVC calls unhandled by kvm will be forwarded to
user space.

Signed-off-by: Heyi Guo <guoheyi@huawei.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Cornelia Huck <cohuck@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Dave Martin <Dave.Martin@arm.com>
Cc: Marc Zyngier <marc.zyngier@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: James Morse <james.morse@arm.com>
---
 linux-headers/linux/kvm.h |  1 +
 target/arm/sdei.c         | 16 ++++++++++++++++
 target/arm/sdei.h         |  2 ++
 3 files changed, 19 insertions(+)

diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
index 3d9b18f7f8..36c9b3859f 100644
--- a/linux-headers/linux/kvm.h
+++ b/linux-headers/linux/kvm.h
@@ -1000,6 +1000,7 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_PMU_EVENT_FILTER 173
 #define KVM_CAP_ARM_IRQ_LINE_LAYOUT_2 174
 #define KVM_CAP_HYPERV_DIRECT_TLBFLUSH 175
+#define KVM_CAP_FORWARD_HYPERCALL 176
=20
 #ifdef KVM_CAP_IRQ_ROUTING
=20
diff --git a/target/arm/sdei.c b/target/arm/sdei.c
index 4cc68e4acf..56e6874f6f 100644
--- a/target/arm/sdei.c
+++ b/target/arm/sdei.c
@@ -46,6 +46,7 @@
 #define SMCCC_RETURN_REG_COUNT 4
 #define PSTATE_M_EL_SHIFT      2
=20
+bool sdei_enabled;
 static QemuSDEState *sde_state;
=20
 typedef struct QemuSDEIBindNotifyEntry {
@@ -1524,6 +1525,7 @@ static const VMStateDescription vmstate_sde_state =3D=
 {
 static void sdei_initfn(Object *obj)
 {
     QemuSDEState *s =3D QEMU_SDEI(obj);
+    KVMState *kvm =3D KVM_STATE(current_machine->accelerator);
=20
     if (sde_state) {
         error_report("Only one SDEI dispatcher is allowed!");
@@ -1533,6 +1535,20 @@ static void sdei_initfn(Object *obj)
=20
     qemu_sde_init(s);
     qemu_register_reset(qemu_sde_reset, s);
+
+    if (kvm_check_extension(kvm, KVM_CAP_FORWARD_HYPERCALL)) {
+        int ret;
+        ret =3D kvm_vm_enable_cap(kvm, KVM_CAP_FORWARD_HYPERCALL, 0, 0);
+        if (ret < 0) {
+            error_report("Enable hypercall forwarding failed: %s",
+                         strerror(-ret));
+            abort();
+        }
+        sdei_enabled =3D true;
+        info_report("qemu sdei enabled");
+    } else {
+        info_report("KVM does not support forwarding hypercall.");
+    }
 }
=20
 static void qemu_sde_class_init(ObjectClass *klass, void *data)
diff --git a/target/arm/sdei.h b/target/arm/sdei.h
index 9c15cf3186..9f683ca2a0 100644
--- a/target/arm/sdei.h
+++ b/target/arm/sdei.h
@@ -29,6 +29,8 @@
=20
 #define SDEI_MAX_REQ        SDEI_1_0_FN(0x12)
=20
+extern bool sdei_enabled;
+
 void sdei_handle_request(CPUState *cs, struct kvm_run *run);
=20
 /*
--=20
2.19.1

