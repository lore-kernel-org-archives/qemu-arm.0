Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2381327wrt;
        Thu, 18 Oct 2018 07:35:56 -0700 (PDT)
X-Google-Smtp-Source: ACcGV602acPSHpGcVXXLJFCR3o6AOKch9OAgYmFNobycZjTFFsOSgqsXWwJYb39/6m82w5Oks4qW
X-Received: by 2002:ac8:33d6:: with SMTP id d22-v6mr28806421qtb.313.1539873356218;
        Thu, 18 Oct 2018 07:35:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539873356; cv=none;
        d=google.com; s=arc-20160816;
        b=BkFQKjygphz5lQkEXPTqhghFJUCNrZtlLWyQlZlAhpb1MipoCghMKULdvxyJBBnzds
         Dju+eFvAp4m0x6WC4kl9ScoqBcneToSuZ8JukZd81zwU3VqF/V9ibRLCFWHCBQBpzE4U
         Ajo6YOlJovdKhAlErUFJbGy1elR/S86cfOQ0vjsURtbwK3J+04oINAgKvvhkzdsdAs0Q
         8z6sy8hnayqpfpz0kEzY4if5C2uiH8Inx+3LXATePdBmM/W0UpVAtOXAOy291/aJSAfQ
         VJS8bq+e/GsCO9FJBSjLTFkrSmcMPg2/k8GsU+lVtlb7uFWEP7JjAcf0MKcnY0nz2cF1
         h68g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=3Vta8vQJOwLZJWLY0bXj6ZMPefkNLglqjgl0MUsV07w=;
        b=xT9K8p0pwBjO8fN3KjfvUOcheDUjH9x1rfbm1mq+SkxEYNjN/F0IToQFs2SS5pgwyU
         jGZopJhYCCOFK/WfYXEF7RBFFwusRkJheS3bxrkFAzunb52mh1Q+ihGsTjzwP4uNQ511
         kYhxkSsyNS7GVDs8sK7ZnE+ZSbaaGzDdI3keoc9se6ibp2v0qVCZDoNGVlXbV5E+KL/5
         mY9QjUu5+DmNfV28mBAC1nvz0CJBOUlBwiTeqneMtu4t69sQijeIJ3FW+e3hROIysJVR
         0FkrF88P96T1D1+V9VZVcla6PSCBdc9CKvLc5QzvhB9HHbEM3FM69J9CE4FCP7e3TTpj
         UDwg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t187-v6si5135576qkf.141.2018.10.18.07.35.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Oct 2018 07:35:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42703 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gD9P1-0001Fp-Ll
	for alex.bennee@linaro.org; Thu, 18 Oct 2018 10:35:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36029)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gD9Kq-0005n0-N8
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 10:31:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gD9Ko-00074u-GZ
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 10:31:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56018)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gD9Km-0006eJ-Sd; Thu, 18 Oct 2018 10:31:34 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 54E8B9091A;
	Thu, 18 Oct 2018 14:31:13 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-215.ams2.redhat.com [10.36.116.215])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6912A789AA;
	Thu, 18 Oct 2018 14:31:03 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, kwangwoo.lee@sk.com,
	imammedo@redhat.com, david@redhat.com
Date: Thu, 18 Oct 2018 16:30:29 +0200
Message-Id: <20181018143042.29588-4-eric.auger@redhat.com>
In-Reply-To: <20181018143042.29588-1-eric.auger@redhat.com>
References: <20181018143042.29588-1-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Thu, 18 Oct 2018 14:31:13 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [RFC v4 03/16] hw/boards: Add a MachineState parameter
 to kvm_type callback
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: drjones@redhat.com, dgilbert@redhat.com, Suzuki.Poulose@arm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KfElphZricga

On ARM, the kvm_type will be resolved by querying the KVMState.
Let's add the MachineState handle to the callback so that we
can retrieve the  KVMState handle. in kvm_init, when the callback
is called, the kvm_state variable is not yet set.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
[ppc parts]
---
 accel/kvm/kvm-all.c   | 2 +-
 hw/ppc/mac_newworld.c | 3 +--
 hw/ppc/mac_oldworld.c | 2 +-
 hw/ppc/spapr.c        | 2 +-
 include/hw/boards.h   | 2 +-
 5 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index de12f78eb8..1505342ec5 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -1550,7 +1550,7 @@ static int kvm_init(MachineState *ms)
 
     kvm_type = qemu_opt_get(qemu_get_machine_opts(), "kvm-type");
     if (mc->kvm_type) {
-        type = mc->kvm_type(kvm_type);
+        type = mc->kvm_type(ms, kvm_type);
     } else if (kvm_type) {
         ret = -EINVAL;
         fprintf(stderr, "Invalid argument kvm-type=%s\n", kvm_type);
diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
index a630cb81cd..5b897011db 100644
--- a/hw/ppc/mac_newworld.c
+++ b/hw/ppc/mac_newworld.c
@@ -569,8 +569,7 @@ static char *core99_fw_dev_path(FWPathProvider *p, BusState *bus,
 
     return NULL;
 }
-
-static int core99_kvm_type(const char *arg)
+static int core99_kvm_type(MachineState *ms, const char *arg)
 {
     /* Always force PR KVM */
     return 2;
diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
index 9891c325a9..67cbd06b0f 100644
--- a/hw/ppc/mac_oldworld.c
+++ b/hw/ppc/mac_oldworld.c
@@ -422,7 +422,7 @@ static char *heathrow_fw_dev_path(FWPathProvider *p, BusState *bus,
     return NULL;
 }
 
-static int heathrow_kvm_type(const char *arg)
+static int heathrow_kvm_type(MachineState *ms, const char *arg)
 {
     /* Always force PR KVM */
     return 2;
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 98868d893a..18a9d2cf03 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -2821,7 +2821,7 @@ static void spapr_machine_init(MachineState *machine)
     }
 }
 
-static int spapr_kvm_type(const char *vm_type)
+static int spapr_kvm_type(MachineState *ms, const char *vm_type)
 {
     if (!vm_type) {
         return 0;
diff --git a/include/hw/boards.h b/include/hw/boards.h
index f82f28468b..8bc015fb7c 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -172,7 +172,7 @@ struct MachineClass {
     void (*init)(MachineState *state);
     void (*reset)(void);
     void (*hot_add_cpu)(const int64_t id, Error **errp);
-    int (*kvm_type)(const char *arg);
+    int (*kvm_type)(MachineState *ms, const char *arg);
 
     BlockInterfaceType block_default_type;
     int units_per_default_bus;
-- 
2.17.1

