Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp110956wrq;
        Mon, 2 Jul 2018 10:23:21 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfr1jrOAPiYhGSrPs1Et0yEMJxwyxupIsk2HX+UC3PnlLAD5zFKMnDcYEnbKXep+BzIUE0V
X-Received: by 2002:ac8:24b3:: with SMTP id s48-v6mr23824221qts.140.1530552201693;
        Mon, 02 Jul 2018 10:23:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530552201; cv=none;
        d=google.com; s=arc-20160816;
        b=FbNYzS0t1k3gwV2V/HDBQcx+20dfvSYGrqTotl11kJQY6I937SqWA7PfMYjrVEJeGg
         HooZsyN/OyocgZyA874Xt1ioM62cmdbkfRqs5mcSDX5icNNjhkSY77BkPx5vijLJS7aY
         +wFT1x/PyRsqKCRwyxVZuVPbz+y4PrekEpofjdveF2PFrR7D7KeQFVGjuUaBD2x+Ip/s
         Ame59Di7RJHdIs/APue/dTSi9StdeshLbeYTKqIV8UQvSe7y5JX27buqifamkdevlxpc
         7PkhNE1Q++oSm/HG1kQSn0WOp/rhjSq1tcKhPAQEy7jD4M+IABHediK4bgBGLzJ61I1O
         MY2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=pPPVXZnTWaVXDmtVU/8xxIIqv3Mo2Sc0Gz+izd0H8WI=;
        b=ZUOPahiDykeppLM5ZQZ1k49juHk1FxizR6pEdnSbkcVlfju4Qbp0ltM/r80OpMXduK
         3QoqeH2GxLHcgO5HjUYcTEZsik7FmdHYBXYlvoteB+4K0Q5YmiMJ/6w1zykaTaAZ7tVO
         dZIWI6jLdEdflK+UiDgrNM6XJlA3PichQxRjO1rb+aa7gJdwkAOpkbO4X7ahrOuSYIAj
         4/kY1D005dlsUvf7lKoAPEexzM1DQYbBaMnegbNHVDrrX66Z+X/6yuZoGaSzGZTwlDrb
         IEAZVkGenkPMb/XnCfwwlAfDhDwnSVf+tIt+cclLTctyDMMZO1ZtEFtg+7Qs6M49o22F
         VeXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w124-v6si3020966qka.381.2018.07.02.10.23.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 02 Jul 2018 10:23:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34488 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fa2Xp-0008I6-2V
	for alex.bennee@linaro.org; Mon, 02 Jul 2018 13:23:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45356)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fa2XY-0008HL-1P
	for qemu-arm@nongnu.org; Mon, 02 Jul 2018 13:23:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fa2XW-0006Gs-U7
	for qemu-arm@nongnu.org; Mon, 02 Jul 2018 13:23:04 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:42262 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fa2XW-0006GE-NT; Mon, 02 Jul 2018 13:23:02 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2BFC581A4EA6;
	Mon,  2 Jul 2018 17:23:02 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-57.ams2.redhat.com
	[10.36.116.57])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0EA7A111AF38;
	Mon,  2 Jul 2018 17:22:59 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, kwangwoo.lee@sk.com,
	imammedo@redhat.com, david@redhat.com
Date: Mon,  2 Jul 2018 19:22:29 +0200
Message-Id: <1530552162-15533-3-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1530552162-15533-1-git-send-email-eric.auger@redhat.com>
References: <1530552162-15533-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Mon, 02 Jul 2018 17:23:02 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Mon, 02 Jul 2018 17:23:02 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC v2 02/15] hw/boards: Add a MachineState parameter
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
Cc: drjones@redhat.com, david@gibson.dropbear.id.au, dgilbert@redhat.com,
	agraf@suse.de
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8OdelIkqNAzw

On ARM, the kvm_type will be resolved by querying the KVMState.
Let's add the MachineState handle to the callback so that we
can retrieve the  KVMState handle. in kvm_init, when the callback
is called, the kvm_state variable is not yet set.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
[ppc parts]
---
 accel/kvm/kvm-all.c   | 2 +-
 hw/ppc/mac_newworld.c | 2 +-
 hw/ppc/mac_oldworld.c | 2 +-
 hw/ppc/spapr.c        | 2 +-
 include/hw/boards.h   | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index eb7db92..37ac834 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -1549,7 +1549,7 @@ static int kvm_init(MachineState *ms)
 
     kvm_type = qemu_opt_get(qemu_get_machine_opts(), "kvm-type");
     if (mc->kvm_type) {
-        type = mc->kvm_type(kvm_type);
+        type = mc->kvm_type(ms, kvm_type);
     } else if (kvm_type) {
         ret = -EINVAL;
         fprintf(stderr, "Invalid argument kvm-type=%s\n", kvm_type);
diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
index ff715ff..606b827 100644
--- a/hw/ppc/mac_newworld.c
+++ b/hw/ppc/mac_newworld.c
@@ -511,7 +511,7 @@ static void ppc_core99_init(MachineState *machine)
     qemu_register_boot_set(fw_cfg_boot_set, fw_cfg);
 }
 
-static int core99_kvm_type(const char *arg)
+static int core99_kvm_type(MachineState *ms, const char *arg)
 {
     /* Always force PR KVM */
     return 2;
diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
index 4608bab..1211fcd 100644
--- a/hw/ppc/mac_oldworld.c
+++ b/hw/ppc/mac_oldworld.c
@@ -363,7 +363,7 @@ static void ppc_heathrow_init(MachineState *machine)
     qemu_register_boot_set(fw_cfg_boot_set, fw_cfg);
 }
 
-static int heathrow_kvm_type(const char *arg)
+static int heathrow_kvm_type(MachineState *ms, const char *arg)
 {
     /* Always force PR KVM */
     return 2;
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index b32b971..db6b018 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -2841,7 +2841,7 @@ static void spapr_machine_init(MachineState *machine)
     }
 }
 
-static int spapr_kvm_type(const char *vm_type)
+static int spapr_kvm_type(MachineState *ms, const char *vm_type)
 {
     if (!vm_type) {
         return 0;
diff --git a/include/hw/boards.h b/include/hw/boards.h
index 79069dd..3ac9594 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -173,7 +173,7 @@ struct MachineClass {
     void (*init)(MachineState *state);
     void (*reset)(void);
     void (*hot_add_cpu)(const int64_t id, Error **errp);
-    int (*kvm_type)(const char *arg);
+    int (*kvm_type)(MachineState *ms, const char *arg);
 
     BlockInterfaceType block_default_type;
     int units_per_default_bus;
-- 
2.5.5

