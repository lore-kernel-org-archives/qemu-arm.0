Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp11092541wrx;
        Tue, 26 Feb 2019 05:52:09 -0800 (PST)
X-Google-Smtp-Source: AHgI3Ia7kMg2y2v0SmzOUjAd5R5it3rVyJaQS9rMqAfxQdkqa+2L2at/bEkmcdpK6Q4TPbvQNoIW
X-Received: by 2002:a25:bc82:: with SMTP id e2mr934352ybk.159.1551189129196;
        Tue, 26 Feb 2019 05:52:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551189129; cv=none;
        d=google.com; s=arc-20160816;
        b=wMIRGlyy6D4qs+MpHgLH9euguAHS2UsVMfCWYMQ1bx4Sskhs5RQnJ4+8eWTnkJfuVk
         UCGuqy76erpmSzHI2AmLSbJbh8++ay7OIqFCil3OL4oqNpfzkULzDA5gXEz4u9T2dPm7
         aq0qMGR65A/5B0hynl1MJNmG9x/w5c03wabbiYqMJx9FqKg31DWEQCdG9E+s/5ZrIxyE
         bDctDAdl6Sq3W4xXGLuXAQ6eSf9qBj/5EflaFluS/sjHxqlHtuO72uhB/DvxVPnjgvwM
         xoLBkLv/7JAzsDxbWHRyVLr3rTmwjdovQm3/1iA5jKxH9jc09w3CS5T56IM8k/xn58lz
         x9rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=plHPvdvHvhnlXbJZarYU/MovaRfZq+iX+uwSeMPadqs=;
        b=Z1LgkiawIdIZIXC84LwJGWl5Fvx2/QiqrJMAPiQ/unGhK/0i3s9X4IO4jYdBXWyuHU
         4CD37bmIpTux7x/fAa5vEuKMBjqwwMZc/QFtE5AkAoVkE7nG/3I4S9oDNcA1CkEWbTtN
         GBGB8VaDl+L7TcQoCBmWPNHpmowW1+lzE85w3ub3CnTGGUiZrsa1Ib8yjELaNa32+fW5
         oq1W3cPtFn/qIUQ5gTAJPqcPgsWzqpZcybJRbE7J1Ny9JTdbYLjLnG4Ursbub0XhJSSI
         WQGttwIKxMqlMDVe3JUjNVKN3n1pcLbJhPjq+KKoc9hh8RqT87TUEQpWImTiF9bH6A+g
         p+Vw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 8si6728776ybq.49.2019.02.26.05.52.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Feb 2019 05:52:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:55620 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gyd9U-0000B7-Ie
	for alex.bennee@linaro.org; Tue, 26 Feb 2019 08:52:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47351)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gyd8O-0008Va-UU
	for qemu-devel@nongnu.org; Tue, 26 Feb 2019 08:51:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gyd8M-0006qy-T3
	for qemu-devel@nongnu.org; Tue, 26 Feb 2019 08:51:00 -0500
Received: from mx1.redhat.com ([209.132.183.28]:49440)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gyd89-0006aQ-L3; Tue, 26 Feb 2019 08:50:47 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7451D30C1A4C;
	Tue, 26 Feb 2019 13:50:44 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B29C85F9A0;
	Tue, 26 Feb 2019 13:50:41 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Tue, 26 Feb 2019 14:50:00 +0100
Message-Id: <20190226135014.31854-5-eric.auger@redhat.com>
In-Reply-To: <20190226135014.31854-1-eric.auger@redhat.com>
References: <20190226135014.31854-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Tue, 26 Feb 2019 13:50:44 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v8 04/18] hw/boards: Add a MachineState
 parameter to kvm_type callback
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: pbonzini@redhat.com, drjones@redhat.com, dgilbert@redhat.com,
	david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: x7ByYINnvrlu

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
index abf9ebce59..3d0811fa81 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -2920,7 +2920,7 @@ static void spapr_machine_init(MachineState *machin=
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
index 05f9f45c3d..ed2fec82d5 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -156,6 +156,9 @@ typedef struct {
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
@@ -171,7 +174,7 @@ struct MachineClass {
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

