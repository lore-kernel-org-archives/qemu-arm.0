Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp518558wrt;
        Wed, 23 Jan 2019 02:17:14 -0800 (PST)
X-Google-Smtp-Source: ALg8bN53wDBnIbwzXP4lehlpAAmIFWLsGTBryl9gSkft5SB078nUwQDZPODHRQI16iDRzzJkSGbq
X-Received: by 2002:adf:97d1:: with SMTP id t17mr2008370wrb.283.1548238634712;
        Wed, 23 Jan 2019 02:17:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548238634; cv=none;
        d=google.com; s=arc-20160816;
        b=LN0sDHxD3GazjWzXbWxy8gHIbBbELDGhDBH5Mh/o6Tisv+MVfg1qznWh1xjE+btKI4
         TRkfqHvFgiCO0AFaIC4EoykC6GuBiWqyyD2a0QYkenvUrsgs8XaCkIUF8PvqnWHriBjw
         Wu7F1yQUCOO8og2hoR5Ws0uVYrOheIm4MGWH6wdzBQRPxxH8Or64UZJvAUUqCOBehV5I
         vXJa0iWyr6JaLviCXH5wKM9G7XkZn5QZrzhug0ONh/3wHBJZl5dN+ypu2tBVfzwn+177
         k8N3XagcaZnv/IUYQqHNr+JDG+eTQPB8mc4gezaTtcApmosLy5RdD3v8IOeu55doKtg0
         TYgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=HhOUETKyfLsfMd0z9jsG4ZF0GVXuL/h8xPAWNlKHfvg=;
        b=t0NWN9EYFfvjoiemm/53RueMSCyBbFOB8y4Ql6uHepqIh5mGnO0X4GyhhCjYSByouT
         GHuC96PMc6bJEBI0dAyXAv+IG8zhT3JBSxfL16HtQ3Vj5BqxXUtQ2WSwUZWvHINszb6I
         iEaQBMkaKnfuR6rsa3byK640iQWe/BAIUaMuW+3/fLjd9h9MReWx7l+vYM1+0u6GonMk
         8Ay3idFfsFU5zrEX5sZ4DxAS/gDTyCq9fd23WZ24sHGseJPq05b0ntTZ4Qt+BvOo6oMH
         8YF1RWLJc3iKNdDAlJj3gusa+9ytyXmjOczq8+2q4oBmmUuRoYn6ZyRGfGO0RIHKI1PL
         d5Aw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u9si41027213wre.193.2019.01.23.02.17.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Jan 2019 02:17:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:59687 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gmFar-0002Pn-KY
	for alex.bennee@linaro.org; Wed, 23 Jan 2019 05:17:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34479)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gmFZN-0001OX-9X
	for qemu-arm@nongnu.org; Wed, 23 Jan 2019 05:15:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gmFZL-0007Bh-EO
	for qemu-arm@nongnu.org; Wed, 23 Jan 2019 05:15:40 -0500
Received: from mx1.redhat.com ([209.132.183.28]:36592)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gmFZL-0007AT-2F; Wed, 23 Jan 2019 05:15:39 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CA0BF58E29;
	Wed, 23 Jan 2019 10:15:37 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-91.ams2.redhat.com [10.36.117.91])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3E7EC601A5;
	Wed, 23 Jan 2019 10:15:35 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com, david@redhat.com
Date: Wed, 23 Jan 2019 11:14:46 +0100
Message-Id: <20190123101458.12478-7-eric.auger@redhat.com>
In-Reply-To: <20190123101458.12478-1-eric.auger@redhat.com>
References: <20190123101458.12478-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Wed, 23 Jan 2019 10:15:37 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v5 06/18] hw/boards: Add a MachineState parameter
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
X-TUID: BGwC9lV2ylPM

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
index bb19eaba36..ddeb006ccb 100644
--- a/hw/ppc/mac_newworld.c
+++ b/hw/ppc/mac_newworld.c
@@ -564,8 +564,7 @@ static char *core99_fw_dev_path(FWPathProvider *p, Bu=
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
index 817f70e52c..525416d033 100644
--- a/hw/ppc/mac_oldworld.c
+++ b/hw/ppc/mac_oldworld.c
@@ -420,7 +420,7 @@ static char *heathrow_fw_dev_path(FWPathProvider *p, =
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
index 0942f35bf8..cd786a849e 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -2920,7 +2920,7 @@ static void spapr_machine_init(MachineState *machin=
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

