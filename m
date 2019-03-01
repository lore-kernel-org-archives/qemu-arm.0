Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp647484wrx;
        Fri, 1 Mar 2019 05:51:14 -0800 (PST)
X-Google-Smtp-Source: APXvYqw53d9xSVpEffgcV1nZ4KxkPLBtBgGffBKmNyjmeXmiUPOS59hgGqERq7CzibalXNAAoz64
X-Received: by 2002:a25:3252:: with SMTP id y79mr963694yby.460.1551448274589;
        Fri, 01 Mar 2019 05:51:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551448274; cv=none;
        d=google.com; s=arc-20160816;
        b=yJB/8kLA89lE5w1fN6+fTeSS6gOIe4R+zAJmbKp/zfaaJZEriggX6L6TC/9cGhtes9
         3G5M6TPjwIvGKdjUh/ylB9PSKYFOERRP24ZKDG/V1YmkFFsTcaOFTXmtNX8HL0qbjqrI
         UEFh/R7ZfHHBuu2+NWtr9djSuM9P75bmrBSKddT8Tc0OS2zGzg14tKx2LMZc9cj0KwCu
         gBdr1ObBcl4pqKuZ1AdUdOpQwDUzk2E5ddhItGaN/qn6/602tnB397/cLwhoUDOT2YLe
         lLnZ4qA57V3Pg4hqXE+OWzaA2x4iBLfZ63NZm/OzHKp9AbS99wwqCXX4PiVQ+0VPN9Xt
         JEew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=IZmvdUF6WVRfTo3/AIabmmhc71TdgeFOFnBeuG7HBAw=;
        b=zA1yRsqGk5w74R9QEdxueOHGwCAFGAqDxz8gbBQLBzeSNf3qKAEe0bkoUeiRY9ttbz
         ei/IjOb0fr7wahWhLCZt+IwXPUG6KPl4aKlw8cj7ETVR6eho9+oXvBNfDuoKTqZDKMGG
         krQxhHw2IyTc/DmNs/Nljg0OuL40KLGfZLv0i+UCCFzIQieUGc5yn2tzV6yld53jeY3X
         QU9cgaKFFpTkXdpLLy6ImfpJZ87NwSamKAm0kuFc/PdtYkimLo8xpqfwPNRfZMfHWgF7
         daUlz8yHPVkkGTSq1UjYZVI2SK5eUSWZZWcUZNS41JoiAf8WDW+oyOHDezIOM2aifVlh
         b95Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 10si11966968ybz.82.2019.03.01.05.51.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Mar 2019 05:51:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:38157 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gziZG-0005aO-1l
	for alex.bennee@linaro.org; Fri, 01 Mar 2019 08:51:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59755)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gziVs-0002r8-TD
	for qemu-arm@nongnu.org; Fri, 01 Mar 2019 08:47:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gziVr-0002hn-2w
	for qemu-arm@nongnu.org; Fri, 01 Mar 2019 08:47:44 -0500
Received: from mx1.redhat.com ([209.132.183.28]:58902)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gziVp-0002dS-39; Fri, 01 Mar 2019 08:47:41 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2A42B301509D;
	Fri,  1 Mar 2019 13:47:38 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E64E95D707;
	Fri,  1 Mar 2019 13:47:30 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Fri,  1 Mar 2019 14:47:03 +0100
Message-Id: <20190301134709.4695-5-eric.auger@redhat.com>
In-Reply-To: <20190301134709.4695-1-eric.auger@redhat.com>
References: <20190301134709.4695-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Fri, 01 Mar 2019 13:47:38 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v11 04/10] hw/boards: Add a MachineState
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
X-TUID: GddHWZYudCHU

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
index b55c9cc087..f7ce553aa1 100644
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

