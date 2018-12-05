Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp9837894wrt;
        Wed, 5 Dec 2018 13:05:00 -0800 (PST)
X-Google-Smtp-Source: AFSGD/X1EkOKr6PQ2PLSDJi6xxqEPeEdyPmA50q2Xkqc0OEi16u9hVUtXEeyg6Bxes3ExYTnGzbu
X-Received: by 2002:a0c:ec92:: with SMTP id u18mr25556495qvo.168.1544043899756;
        Wed, 05 Dec 2018 13:04:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544043899; cv=none;
        d=google.com; s=arc-20160816;
        b=kI8IcXc+PqI2g2TNeC2uq+tjkVpYgD1j5as1Rrn/tzwUw+ua0CVGd7H9Y/5O9e+skq
         r4A9uRVhxcmAl1UPLFLDixhB5qheOHrVU7Im8ZaMmSwNL7C6Jym3o59+Avp7NUCHSvUb
         uFH324BeUS2FZC8iAt7F87D8vKpGsgNCLWaopvtUWSka+urCPG2Ce+To6QSGJSzxnbD7
         g8pw97rp3/H/9XzYn02KseQqg3dLn4HrDA5mTUtdZxfjUVJGIw6YegEopxwy2rnf8LcC
         TjRKvCvsxCtybzA7s/XqgXAkDEZrUXTzlH6irN++gokHq//HYJAG9niH10u/z7Xwy7y8
         bNOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=sSh24bo3FZ6lJTV+nyR/3BskGMCmWMpih7uGDBAYYLU=;
        b=vxxtenlfqcS2Py50T5alCjmac6UUURouuWYbgfv39r326AhE1vVWRcMjOdsSA9cn3K
         vIuMA/HPD4s/9n2qDBr79VBc9hXHxLrSYItvn6/nsB1tqE217xcCLGmPv1tFIMifqMvM
         ziLsTN2OsZVanc4rwkRxGQNh7PyOArf3zCuTJeSoX4iusSnEyJoOEqyQFTcqIKmYHCJ9
         Dr+A8oKRg3R/Qb1B3aPuu0R6DakQqQ8KyScwmzI5FEIgqSEb/SSTNkgCaBOXxnxJ18RY
         UI+pAmPlsLnjEmjbvbSXhz1OHb621Zkn8nxw6YtiNNfYhqoYnRle5CAw3FXIfS81xxtt
         wu8g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c13si8442055qtg.329.2018.12.05.13.04.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 05 Dec 2018 13:04:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36830 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gUeLr-0006PI-7S
	for alex.bennee@linaro.org; Wed, 05 Dec 2018 16:04:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59444)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gUeGS-0008Ju-6e
	for qemu-devel@nongnu.org; Wed, 05 Dec 2018 15:59:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gUeGN-0003au-Mz
	for qemu-devel@nongnu.org; Wed, 05 Dec 2018 15:59:24 -0500
Received: from mx1.redhat.com ([209.132.183.28]:54176)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gUeGG-0002vG-6G; Wed, 05 Dec 2018 15:59:12 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C8DFF89AC1;
	Wed,  5 Dec 2018 20:59:09 +0000 (UTC)
Received: from localhost (ovpn-116-33.gru2.redhat.com [10.97.116.33])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 701DF5C5E0;
	Wed,  5 Dec 2018 20:59:02 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  5 Dec 2018 18:58:26 -0200
Message-Id: <20181205205827.19387-5-ehabkost@redhat.com>
In-Reply-To: <20181205205827.19387-1-ehabkost@redhat.com>
References: <20181205205827.19387-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Wed, 05 Dec 2018 20:59:09 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH for-4.0 4/5] spapr: Delete instance_options
 functions
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kQHwIVRO28gB

Now that all instance_options functions for spapr are empty,
delete them.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/ppc/spapr.c | 85 --------------------------------------------------
 1 file changed, 85 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 0c3b27a8cc..523e5d83f8 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -3939,16 +3939,10 @@ static const TypeInfo spapr_machine_info = {
             mc->is_default = 1;                                      \
         }                                                            \
     }                                                                \
-    static void spapr_machine_##suffix##_instance_init(Object *obj)  \
-    {                                                                \
-        MachineState *machine = MACHINE(obj);                        \
-        spapr_machine_##suffix##_instance_options(machine);          \
-    }                                                                \
     static const TypeInfo spapr_machine_##suffix##_info = {          \
         .name = MACHINE_TYPE_NAME("pseries-" verstr),                \
         .parent = TYPE_SPAPR_MACHINE,                                \
         .class_init = spapr_machine_##suffix##_class_init,           \
-        .instance_init = spapr_machine_##suffix##_instance_init,     \
     };                                                               \
     static void spapr_machine_register_##suffix(void)                \
     {                                                                \
@@ -3959,10 +3953,6 @@ static const TypeInfo spapr_machine_info = {
 /*
  * pseries-4.0
  */
-static void spapr_machine_4_0_instance_options(MachineState *machine)
-{
-}
-
 static void spapr_machine_4_0_class_options(MachineClass *mc)
 {
     /* Defaults for the latest behaviour inherited from the base class */
@@ -3976,11 +3966,6 @@ DEFINE_SPAPR_MACHINE(4_0, "4.0", true);
 #define SPAPR_COMPAT_3_1                                              \
     HW_COMPAT_3_1
 
-static void spapr_machine_3_1_instance_options(MachineState *machine)
-{
-    spapr_machine_4_0_instance_options(machine);
-}
-
 static void spapr_machine_3_1_class_options(MachineClass *mc)
 {
     spapr_machine_3_1_class_options(mc);
@@ -3995,11 +3980,6 @@ DEFINE_SPAPR_MACHINE(3_1, "3.1", false);
 #define SPAPR_COMPAT_3_0                                              \
     HW_COMPAT_3_0
 
-static void spapr_machine_3_0_instance_options(MachineState *machine)
-{
-    spapr_machine_3_1_instance_options(machine);
-}
-
 static void spapr_machine_3_0_class_options(MachineClass *mc)
 {
     sPAPRMachineClass *smc = SPAPR_MACHINE_CLASS(mc);
@@ -4029,11 +4009,6 @@ DEFINE_SPAPR_MACHINE(3_0, "3.0", false);
         .value    = "on",                                              \
     },
 
-static void spapr_machine_2_12_instance_options(MachineState *machine)
-{
-    spapr_machine_3_0_instance_options(machine);
-}
-
 static void spapr_machine_2_12_class_options(MachineClass *mc)
 {
     sPAPRMachineClass *smc = SPAPR_MACHINE_CLASS(mc);
@@ -4051,11 +4026,6 @@ static void spapr_machine_2_12_class_options(MachineClass *mc)
 
 DEFINE_SPAPR_MACHINE(2_12, "2.12", false);
 
-static void spapr_machine_2_12_sxxm_instance_options(MachineState *machine)
-{
-    spapr_machine_2_12_instance_options(machine);
-}
-
 static void spapr_machine_2_12_sxxm_class_options(MachineClass *mc)
 {
     sPAPRMachineClass *smc = SPAPR_MACHINE_CLASS(mc);
@@ -4074,11 +4044,6 @@ DEFINE_SPAPR_MACHINE(2_12_sxxm, "2.12-sxxm", false);
 #define SPAPR_COMPAT_2_11                                              \
     HW_COMPAT_2_11
 
-static void spapr_machine_2_11_instance_options(MachineState *machine)
-{
-    spapr_machine_2_12_instance_options(machine);
-}
-
 static void spapr_machine_2_11_class_options(MachineClass *mc)
 {
     sPAPRMachineClass *smc = SPAPR_MACHINE_CLASS(mc);
@@ -4096,11 +4061,6 @@ DEFINE_SPAPR_MACHINE(2_11, "2.11", false);
 #define SPAPR_COMPAT_2_10                                              \
     HW_COMPAT_2_10
 
-static void spapr_machine_2_10_instance_options(MachineState *machine)
-{
-    spapr_machine_2_11_instance_options(machine);
-}
-
 static void spapr_machine_2_10_class_options(MachineClass *mc)
 {
     spapr_machine_2_11_class_options(mc);
@@ -4120,11 +4080,6 @@ DEFINE_SPAPR_MACHINE(2_10, "2.10", false);
         .value    = "on",                                              \
     },                                                                 \
 
-static void spapr_machine_2_9_instance_options(MachineState *machine)
-{
-    spapr_machine_2_10_instance_options(machine);
-}
-
 static void spapr_machine_2_9_class_options(MachineClass *mc)
 {
     sPAPRMachineClass *smc = SPAPR_MACHINE_CLASS(mc);
@@ -4149,11 +4104,6 @@ DEFINE_SPAPR_MACHINE(2_9, "2.9", false);
         .value    = "off",                                      \
     },
 
-static void spapr_machine_2_8_instance_options(MachineState *machine)
-{
-    spapr_machine_2_9_instance_options(machine);
-}
-
 static void spapr_machine_2_8_class_options(MachineClass *mc)
 {
     spapr_machine_2_9_class_options(mc);
@@ -4238,11 +4188,6 @@ static void phb_placement_2_7(sPAPRMachineState *spapr, uint32_t index,
      */
 }
 
-static void spapr_machine_2_7_instance_options(MachineState *machine)
-{
-    spapr_machine_2_8_instance_options(machine);
-}
-
 static void spapr_machine_2_7_class_options(MachineClass *mc)
 {
     sPAPRMachineClass *smc = SPAPR_MACHINE_CLASS(mc);
@@ -4267,11 +4212,6 @@ DEFINE_SPAPR_MACHINE(2_7, "2.7", false);
         .value    = stringify(off),\
     },
 
-static void spapr_machine_2_6_instance_options(MachineState *machine)
-{
-    spapr_machine_2_7_instance_options(machine);
-}
-
 static void spapr_machine_2_6_class_options(MachineClass *mc)
 {
     spapr_machine_2_7_class_options(mc);
@@ -4292,11 +4232,6 @@ DEFINE_SPAPR_MACHINE(2_6, "2.6", false);
         .value    = "off", \
     },
 
-static void spapr_machine_2_5_instance_options(MachineState *machine)
-{
-    spapr_machine_2_6_instance_options(machine);
-}
-
 static void spapr_machine_2_5_class_options(MachineClass *mc)
 {
     sPAPRMachineClass *smc = SPAPR_MACHINE_CLASS(mc);
@@ -4314,11 +4249,6 @@ DEFINE_SPAPR_MACHINE(2_5, "2.5", false);
 #define SPAPR_COMPAT_2_4 \
         HW_COMPAT_2_4
 
-static void spapr_machine_2_4_instance_options(MachineState *machine)
-{
-    spapr_machine_2_5_instance_options(machine);
-}
-
 static void spapr_machine_2_4_class_options(MachineClass *mc)
 {
     sPAPRMachineClass *smc = SPAPR_MACHINE_CLASS(mc);
@@ -4341,11 +4271,6 @@ DEFINE_SPAPR_MACHINE(2_4, "2.4", false);
             .value    = "off",\
         },
 
-static void spapr_machine_2_3_instance_options(MachineState *machine)
-{
-    spapr_machine_2_4_instance_options(machine);
-}
-
 static void spapr_machine_2_3_class_options(MachineClass *mc)
 {
     spapr_machine_2_4_class_options(mc);
@@ -4365,11 +4290,6 @@ DEFINE_SPAPR_MACHINE(2_3, "2.3", false);
             .value    = "0x20000000",\
         },
 
-static void spapr_machine_2_2_instance_options(MachineState *machine)
-{
-    spapr_machine_2_3_instance_options(machine);
-}
-
 static void spapr_machine_2_2_class_options(MachineClass *mc)
 {
     spapr_machine_2_3_class_options(mc);
@@ -4384,11 +4304,6 @@ DEFINE_SPAPR_MACHINE(2_2, "2.2", false);
 #define SPAPR_COMPAT_2_1 \
         HW_COMPAT_2_1
 
-static void spapr_machine_2_1_instance_options(MachineState *machine)
-{
-    spapr_machine_2_2_instance_options(machine);
-}
-
 static void spapr_machine_2_1_class_options(MachineClass *mc)
 {
     spapr_machine_2_2_class_options(mc);
-- 
2.18.0.rc1.1.g3f1ff2140

