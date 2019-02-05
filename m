Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp5037351wrt;
        Tue, 5 Feb 2019 09:51:12 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYwSBKzFsRgiieUFkhq2u0hHgPEOcMvKpemtskWhb1j0g4cgvUJmcJ6yhB0V46UN1kL+75u
X-Received: by 2002:a25:404c:: with SMTP id n73mr4980460yba.27.1549389072561;
        Tue, 05 Feb 2019 09:51:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549389072; cv=none;
        d=google.com; s=arc-20160816;
        b=wxr1FyTUKQm+3EQYtGBO1VvBhChxi0DkrTs1uMcp8ogLeyFCT5UpYBOoSUFxhIz2Of
         tRm/a3ceWK2Rrl6gsUsNYf/SHetErZ+53Q3DhcQKavdcGHKu28uHUWTdvZz9jsYF/2Lu
         99RagDCkvRDv6OMPFYmfEg0CoXyqiFmpcGJHf8h07XmdHnhBC/246JQFJWk5p7bEwzVa
         t1kOpzyDDx1dlRsyAtch7Du83AdJyTElXZzBG2noIuVyqJWpZb5F7Lt8L23x76BF6AUl
         8TcvBgl7hNlsnJzyjrdCEuC+vbKPXt94Oz9t/USem5sXJF1vBITq+MyYUsRckw9Cnn2x
         zobQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=8WJtX4FdB4rJXj/z+ACCECSkrDI6vzEA7ntE2mHcfQw=;
        b=eqeigkPHNogdpdhU9KLWe26bc9qFYFV1tBPNFgWE5wGnYQIHz1QQEuolABY5tmzc9x
         PaQAoU+qaZ4aj6P6S4UjIKGFgWe/K0Uax1K4Btlvd3svFI9yAzJE/aNl8+7qicx8uSCk
         dx6Gtf1u8Y1nhwQ4Yl3l528FOM0JbAqfQ7Izt7823TIUcOrG55990kN6jxp8GBb1lq9U
         gnBaKoyr3+YhOm9lRNrRw38vh7BLYcLHONm7uIhvom9tb9rqV7/JSzk8aEVZkbivQHhF
         dhSESb5UUVkJSmyYvd70mgXWHUyIP1xsG4RBUoB6B8kO60RoFGYvRORPuMW256VNOjNk
         tEJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u4si2269474ybu.105.2019.02.05.09.51.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Feb 2019 09:51:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:35947 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gr4sK-0005s9-0x
	for alex.bennee@linaro.org; Tue, 05 Feb 2019 12:51:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46501)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gr4bU-0008MO-AO
	for qemu-arm@nongnu.org; Tue, 05 Feb 2019 12:33:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gr4bS-00041F-Ne
	for qemu-arm@nongnu.org; Tue, 05 Feb 2019 12:33:48 -0500
Received: from mx1.redhat.com ([209.132.183.28]:33832)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gr4bS-00040E-CT; Tue, 05 Feb 2019 12:33:46 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6BF5081F0C;
	Tue,  5 Feb 2019 17:33:45 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C6D3E60A9D;
	Tue,  5 Feb 2019 17:33:42 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Tue,  5 Feb 2019 18:32:54 +0100
Message-Id: <20190205173306.20483-7-eric.auger@redhat.com>
In-Reply-To: <20190205173306.20483-1-eric.auger@redhat.com>
References: <20190205173306.20483-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 05 Feb 2019 17:33:45 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v6 06/18] hw/boards: Add a MachineState parameter
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
Cc: drjones@redhat.com, dgilbert@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: y8zcbHf6y2co

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
index 4e1de942ce..503900604c 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -1590,7 +1590,7 @@ static int kvm_init(MachineState *ms)
=20
     kvm_type =3D qemu_opt_get(qemu_get_machine_opts(), "kvm-type");
     if (mc->kvm_type) {
-        type =3D mc->kvm_type(kvm_type);
+        type =3D mc->kvm_type(ms, kvm_type);
     } else if (kvm_type) {
         ret =3D -EINVAL;
         fprintf(stderr, "Invalid argument kvm-type=3D%s\n", kvm_type);
diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
index f1c8400efd..3cce612ffa 100644
--- a/hw/ppc/mac_newworld.c
+++ b/hw/ppc/mac_newworld.c
@@ -563,8 +563,7 @@ static char *core99_fw_dev_path(FWPathProvider *p, Bu=
sState *bus,
=20
     return NULL;
 }
-
-static int core99_kvm_type(const char *arg)
+static int core99_kvm_type(MachineState *ms, const char *arg)
 {
     /* Always force PR KVM */
     return 2;
diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
index 98d531d114..f3a594d7dc 100644
--- a/hw/ppc/mac_oldworld.c
+++ b/hw/ppc/mac_oldworld.c
@@ -419,7 +419,7 @@ static char *heathrow_fw_dev_path(FWPathProvider *p, =
BusState *bus,
     return NULL;
 }
=20
-static int heathrow_kvm_type(const char *arg)
+static int heathrow_kvm_type(MachineState *ms, const char *arg)
 {
     /* Always force PR KVM */
     return 2;
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 0fcdd35cbe..90cd0acb74 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -2919,7 +2919,7 @@ static void spapr_machine_init(MachineState *machin=
e)
     }
 }
=20
-static int spapr_kvm_type(const char *vm_type)
+static int spapr_kvm_type(MachineState *ms, const char *vm_type)
 {
     if (!vm_type) {
         return 0;
diff --git a/include/hw/boards.h b/include/hw/boards.h
index 02f114085f..425d2c86a6 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -171,7 +171,7 @@ struct MachineClass {
     void (*init)(MachineState *state);
     void (*reset)(void);
     void (*hot_add_cpu)(const int64_t id, Error **errp);
-    int (*kvm_type)(const char *arg);
+    int (*kvm_type)(MachineState *ms, const char *arg);
=20
     BlockInterfaceType block_default_type;
     int units_per_default_bus;
--=20
2.20.1

