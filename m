Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp3446338wrx;
        Mon, 4 Mar 2019 02:14:40 -0800 (PST)
X-Google-Smtp-Source: APXvYqx5asiU6vEDsXnFycgrwc/ZvOEXeeAtCo9GhB0b3qg8NPDeiFQlh+DXPipSQlhurTuvequ1
X-Received: by 2002:a0d:df15:: with SMTP id i21mr13690360ywe.27.1551694480056;
        Mon, 04 Mar 2019 02:14:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551694480; cv=none;
        d=google.com; s=arc-20160816;
        b=SZrc/W2aMdlCTfc81O8UBnCuobEJ1mL4I3c4hG1TOSsZPS7C04eq3kOS3zK0tBTNlX
         ED3ro+71BH6q20h1NE8zpPAuOMaW8oaznPcQorBc2zv0kxTi2/LCdSrFMU8PXp16aT5u
         vb6+zrzKY8+xXV3bqDVVtjxxTS7C1kmYRPKNLc9lNXfzWmAoYJAMuo6VMd8npAkjQzqY
         rrEnPJIKLGrLcGh4R3gM36hoiimHR+qUcPkuztTFEG5E2lJC532Cn7gsGnqH1pXPvY7i
         yibf4PUARVYt9knIAYDmAG89Oj3DV/K3Q4oxEGh4nNy3xe9pRkdXxU76GCGDNSgx8zcn
         9d6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=vOeDMNcO1KgApLUf7Ekot50jXcVY696k6MGyjR/s3VI=;
        b=ynUwgTc+d6b96Cc25GyVeXHVO2j3dtK2f1w+c/jXkIHfFDVa0NdU8hx0c5jJcEv88g
         M8+fz/gBNIeXlFwnbErxqKrsb92pIfHH21YWph032VmwnXwQB+DWiKWutV20cMIZJDGy
         GtisF5QPp2RgYgulItmYK2DM+cFKl+ZhM+XMmE8xUZY6PtCFl5SGsJ1UWDSjSX8ECT8o
         0gJ2Sb6fdMxDZA6zZ1ddl2NfKD4rlKlJvUCe6gxsPb0f8OSB5sbum/02fyBi08paiVeH
         Z/xVDElvK7XOhTuV/PnEutO3B8zpjGPmq4dwgb9ZwG/FgsFaEJi6IXPXWlKS5ilRZpUH
         Q/vQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z62si2924051ybb.428.2019.03.04.02.14.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Mar 2019 02:14:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:51290 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h0kcJ-0001WG-GM
	for alex.bennee@linaro.org; Mon, 04 Mar 2019 05:14:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51459)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1h0kc9-0001W8-B0
	for qemu-arm@nongnu.org; Mon, 04 Mar 2019 05:14:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1h0kc8-0008TX-B7
	for qemu-arm@nongnu.org; Mon, 04 Mar 2019 05:14:29 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52682)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1h0kc8-0008T4-2r; Mon, 04 Mar 2019 05:14:28 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4CC3B8666F;
	Mon,  4 Mar 2019 10:14:27 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8C0CC60F8D;
	Mon,  4 Mar 2019 10:14:24 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Mon,  4 Mar 2019 11:13:33 +0100
Message-Id: <20190304101339.25970-5-eric.auger@redhat.com>
In-Reply-To: <20190304101339.25970-1-eric.auger@redhat.com>
References: <20190304101339.25970-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Mon, 04 Mar 2019 10:14:27 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v12 04/10] hw/boards: Add a MachineState
 parameter to kvm_type callback
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
Cc: pbonzini@redhat.com, drjones@redhat.com, dgilbert@redhat.com,
	david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SpUMBrTPTxYo

On ARM, the kvm_type will be resolved by querying the KVMState.
Let's add the MachineState handle to the callback so that we
can retrieve the  KVMState handle. in kvm_init, when the callback
is called, the kvm_state variable is not yet set.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
[ppc parts]
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>

---
v7 -> v8: added Igor's R-b
v6 -> v7:
- add a comment for kvm_type
- use machine instead of ms in the declaration
- add Peter's R-b
---
 accel/kvm/kvm-all.c   | 2 +-
 hw/ppc/mac_newworld.c | 3 +--
 hw/ppc/mac_oldworld.c | 2 +-
 hw/ppc/spapr.c        | 2 +-
 include/hw/boards.h   | 5 ++++-
 5 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index fd92b6f375..241db496c3 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -1593,7 +1593,7 @@ static int kvm_init(MachineState *ms)
=20
     kvm_type =3D qemu_opt_get(qemu_get_machine_opts(), "kvm-type");
     if (mc->kvm_type) {
-        type =3D mc->kvm_type(kvm_type);
+        type =3D mc->kvm_type(ms, kvm_type);
     } else if (kvm_type) {
         ret =3D -EINVAL;
         fprintf(stderr, "Invalid argument kvm-type=3D%s\n", kvm_type);
diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
index 98461052ac..97e8817145 100644
--- a/hw/ppc/mac_newworld.c
+++ b/hw/ppc/mac_newworld.c
@@ -564,8 +564,7 @@ static char *core99_fw_dev_path(FWPathProvider *p, Bu=
sState *bus,
=20
     return NULL;
 }
-
-static int core99_kvm_type(const char *arg)
+static int core99_kvm_type(MachineState *machine, const char *arg)
 {
     /* Always force PR KVM */
     return 2;
diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
index 284431ddd6..cc1e463466 100644
--- a/hw/ppc/mac_oldworld.c
+++ b/hw/ppc/mac_oldworld.c
@@ -420,7 +420,7 @@ static char *heathrow_fw_dev_path(FWPathProvider *p, =
BusState *bus,
     return NULL;
 }
=20
-static int heathrow_kvm_type(const char *arg)
+static int heathrow_kvm_type(MachineState *machine, const char *arg)
 {
     /* Always force PR KVM */
     return 2;
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index b6a571b6f1..d7850ada7d 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -3023,7 +3023,7 @@ static void spapr_machine_init(MachineState *machin=
e)
     }
 }
=20
-static int spapr_kvm_type(const char *vm_type)
+static int spapr_kvm_type(MachineState *machine, const char *vm_type)
 {
     if (!vm_type) {
         return 0;
diff --git a/include/hw/boards.h b/include/hw/boards.h
index 1447f37010..bbc8cafd19 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -157,6 +157,9 @@ typedef struct {
  *    should instead use "unimplemented-device" for all memory ranges wh=
ere
  *    the guest will attempt to probe for a device that QEMU doesn't
  *    implement and a stub device is required.
+ * @kvm_type:
+ *    Return the type of KVM corresponding to the kvm-type string option=
 or
+ *    computed based on other criteria such as the host kernel capabilit=
ies.
  */
 struct MachineClass {
     /*< private >*/
@@ -172,7 +175,7 @@ struct MachineClass {
     void (*init)(MachineState *state);
     void (*reset)(void);
     void (*hot_add_cpu)(const int64_t id, Error **errp);
-    int (*kvm_type)(const char *arg);
+    int (*kvm_type)(MachineState *machine, const char *arg);
=20
     BlockInterfaceType block_default_type;
     int units_per_default_bus;
--=20
2.20.1

