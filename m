Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp750378wrq;
        Wed, 20 Jun 2018 06:10:10 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIG/lu5fEXluGqXZ3PvQT6s6vAXEa1SaZ5VTEcmxf593QAkCLovC56bLD7Ry3Wm2SdfuAe+
X-Received: by 2002:a0c:da0a:: with SMTP id x10-v6mr18329154qvj.158.1529500210410;
        Wed, 20 Jun 2018 06:10:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529500210; cv=none;
        d=google.com; s=arc-20160816;
        b=KsUYzRZ4YZgPGfLuVb+4XIGWH3o7g2l1O0J2pQmT2Cuk78cHfiqeknIMoSPNKxCJPt
         VM+QbA+8ehMj9jYWYgv1XqwNAoZYTF749S3UKXYgFYco0r8/M6AesdGtQicpxSSTOY/7
         0GIX8tgh0m9UkpPi4boXm1YaajhIBnY/va1WpSXLk5ndZa/46DYqV8Oec6hwVFgdrzwM
         EZqUBI4LVk1ueitkdbGxqT7QWCLjTsB3JnNAGA0w8fH6iwxbvzInqiJry2fsUhX0HGdB
         yLiJY3Q5QMXdJFBc8VZp1LkBvEe+4HBM01x5suZ1h3MGoal3CBwFiuEhSSyBmzjNvJwz
         zD6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=7/HHKOLE2IqKZfUqZqovgsitP8LIrdz7unUCLKSS0aQ=;
        b=corlCt69nbbgqhl2vhMT8unq3sSgBP7tB8Jwyk9i7xzoAnC4o5HbkQTlXWAVbtENLl
         z9Z+n5spsym+6x1akrd0BKaccLSxHItFf4LIYJMJsjInX4kTh0eqE5nhANNyKXjL3VOF
         5fH4JqgIESfnEyUCoFNDlg4il+v8kI6raOARL2XjHS5C72UndssLWwizDFk4FWcfShmn
         ehZND3twn3gt+hQd9BS+eNxhRFug2BxjMF8jkwxVGe8GzTt3hyBbbUs2usD3a8xE2HlQ
         epU+RaLAuwLz2iN/Qv7QfNPHfW7vUwfHlJ7Pza9VpxXIcF9UUrX6k0eKaircthhLfUf1
         DSXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h128-v6si859426qkc.331.2018.06.20.06.10.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Jun 2018 06:10:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49532 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fVcsD-00069i-Og
	for alex.bennee@linaro.org; Wed, 20 Jun 2018 09:10:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50879)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fVcq0-0004QH-5s
	for qemu-arm@nongnu.org; Wed, 20 Jun 2018 09:07:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fVcpx-0005fU-Bk
	for qemu-arm@nongnu.org; Wed, 20 Jun 2018 09:07:52 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:53746 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fVcpx-0005fG-6F; Wed, 20 Jun 2018 09:07:49 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C6AD44023826;
	Wed, 20 Jun 2018 13:07:48 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-117-106.ams2.redhat.com
	[10.36.117.106])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1D6D72026D6B;
	Wed, 20 Jun 2018 13:07:46 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Wed, 20 Jun 2018 15:07:29 +0200
Message-Id: <1529500053-21704-3-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1529500053-21704-1-git-send-email-eric.auger@redhat.com>
References: <1529500053-21704-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Wed, 20 Jun 2018 13:07:48 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Wed, 20 Jun 2018 13:07:48 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC 2/6] hw/boards: Add a MachineState parameter to
 kvm_type callback
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
Cc: drjones@redhat.com, suzuki.poulose@arm.com, dgilbert@redhat.com,
	agraf@suse.de, david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kRE9KELTy2k+

On ARM, the kvm_type will be resolved by querying the KVMState.
Let's add the MachineState handle to the callback so that we
can retrieve the  KVMState handle. in kvm_init, when the callback
is called, the kvm_state variable is not yet set.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 accel/kvm/kvm-all.c   | 2 +-
 hw/ppc/mac_newworld.c | 2 +-
 hw/ppc/mac_oldworld.c | 2 +-
 hw/ppc/spapr.c        | 2 +-
 include/hw/boards.h   | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index ffee68e..0590986 100644
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
index 744acdf..1409d9e 100644
--- a/hw/ppc/mac_newworld.c
+++ b/hw/ppc/mac_newworld.c
@@ -492,7 +492,7 @@ static void ppc_core99_init(MachineState *machine)
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
index f59999d..faf078e 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -2834,7 +2834,7 @@ static void spapr_machine_init(MachineState *machine)
     }
 }
 
-static int spapr_kvm_type(const char *vm_type)
+static int spapr_kvm_type(MachineState *ms, const char *vm_type)
 {
     if (!vm_type) {
         return 0;
diff --git a/include/hw/boards.h b/include/hw/boards.h
index ef7457f..78f90a1 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -170,7 +170,7 @@ struct MachineClass {
     void (*init)(MachineState *state);
     void (*reset)(void);
     void (*hot_add_cpu)(const int64_t id, Error **errp);
-    int (*kvm_type)(const char *arg);
+    int (*kvm_type)(MachineState *ms, const char *arg);
 
     BlockInterfaceType block_default_type;
     int units_per_default_bus;
-- 
2.5.5

