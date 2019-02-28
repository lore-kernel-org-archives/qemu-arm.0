Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp683088wrx;
        Thu, 28 Feb 2019 07:07:25 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZHTQlNx9Fneo5UEhlbY403W/Uia/OJLJsqDDK9MLEeQ5vSMATJsSG6Sjyl67Fm9ugxkqH5
X-Received: by 2002:a25:9bc8:: with SMTP id w8mr6685380ybo.350.1551366445070;
        Thu, 28 Feb 2019 07:07:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551366445; cv=none;
        d=google.com; s=arc-20160816;
        b=bVAHfzD0fMYywYtAgX8yiToUX8EGguvG0FfG9kQS95eEn4W+/mkD7KFTcHc4kd7xUs
         6WAYh/u0DAEt+5LxMqEtfm5PJa+2ZZtppNjsbLLMNDYjO54BaKiT+eag6gWb2Z050BlX
         RK7cA/tRnGD051or1UN40M/0NGJVV+ZDLB4KFd1OI0LcM6QS29wwGNYtJ1w6Oj+vdoAz
         iWr+VVNnX0CDYseFX+kICIuZZTEPX6a4WEqfRx5X7Xkv2PIlZxKSP3lK3ibmDn6aksBZ
         hO7D6k6SQnfC36BYKFwUNm2/RhMO0kYq6SnUYiACGg6RtMlC9TznM0aDCpSGx0qHBoOW
         bmIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=plHPvdvHvhnlXbJZarYU/MovaRfZq+iX+uwSeMPadqs=;
        b=UtPpXiZAJLyGEy+iyZBEvAai+zdLaDcp0V6JUqJGv/n4zP0M+jL5zsS0K9X+ZjDqGo
         IDCr94DZbj3AU4nXpcAZNeJkGhV64AYNQuiUxx7luuoK1YKc93YXnvZskCO7aPqissgd
         4QKeFihBHtk5FvLzXBZDo3Q9HQ2exljyU2wVqhaJN3cS5D0tCS1stenCRTm3wP5h290x
         M0RVvJzfCcTmnAnL/l7vzzLL9WYsGgFcUahrkqtpgWcPdCzrT49T4Jb73JojDdpOYirK
         0+Xm1V/rjm1qALRu8Gm8o1KvCRsuqdjw4hCixeNZuq+KllkPAD1maKYXPD6xKyNIMXbn
         EAAg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t76si10954418ywe.440.2019.02.28.07.07.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Feb 2019 07:07:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:39804 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gzNHQ-0003Q4-BV
	for alex.bennee@linaro.org; Thu, 28 Feb 2019 10:07:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53929)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gzNEP-0001bo-Fv
	for qemu-devel@nongnu.org; Thu, 28 Feb 2019 10:04:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gzNEO-00044T-8f
	for qemu-devel@nongnu.org; Thu, 28 Feb 2019 10:04:17 -0500
Received: from mx1.redhat.com ([209.132.183.28]:49290)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gzNEG-0003vX-1T; Thu, 28 Feb 2019 10:04:08 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 26D2830DC588;
	Thu, 28 Feb 2019 15:04:05 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BBF0219C71;
	Thu, 28 Feb 2019 15:03:56 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Thu, 28 Feb 2019 16:03:18 +0100
Message-Id: <20190228150324.25973-5-eric.auger@redhat.com>
In-Reply-To: <20190228150324.25973-1-eric.auger@redhat.com>
References: <20190228150324.25973-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Thu, 28 Feb 2019 15:04:05 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v10 04/10] hw/boards: Add a MachineState
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
X-TUID: rr3wdVAazztC

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

