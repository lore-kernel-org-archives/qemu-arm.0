Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp9832066wrt;
        Wed, 5 Dec 2018 12:59:13 -0800 (PST)
X-Google-Smtp-Source: AFSGD/UoDtjzanKSn6Pv6FYmBK3FW7KKz9FSh+/O9RMEI8AsbetLpFZXK2gpYseD+YUBqgo9k6Of
X-Received: by 2002:a37:8e41:: with SMTP id q62mr24685489qkd.290.1544043553877;
        Wed, 05 Dec 2018 12:59:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544043553; cv=none;
        d=google.com; s=arc-20160816;
        b=AM6Hll2zv/lN0ZzpyRV3TbsmrMeXjlySJfyGFUxLkhM5PDXdUT2JUzx3F7/tb3qWh2
         oxO5NBy8lIr3hu4rjzds9V31J1LeyjiFZ00pvD4VSeA81TkTKgDDgbftLhmopP9MeL2n
         EcBEDlVV6nS4tWIoYGOlIAB+cjT83fRYV/HUxeCEwqKrOwRSRt/0DgGbGyj4KrUpLqms
         K0bJwonbP518ziIEf+GQtdLSENMQ8Ggqq7XlAkQz4XyTVrejbAadRAaETHgcPPh7E9XE
         vQel6wqN4jq8yJma5bazDjzy762Uxyvx5LUhwMGxqAgulPkIUW7dmBRIwuYjiIVzpawl
         LW7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=cA2SsX/Zc7+3BkgW7P8O+IOfvO4LafRyAMWUdJ931S0=;
        b=s+mE0M73kK+Xut+7tWsO/TAwFkWmRQLSmWRd06ZDhWNc7rr+UFo1x+4Q3mgYP+u2H0
         TwcCkdvITMuL5Y+BCfLIenrLFCN4UdHkl2nLLf5/cHSok2tsO9YvtOPuHcYhXxBdmauf
         PcLCIULRQ+E22v+Awy5KwMj5aAU6nduKEMZwOsJ5YPO9qyd/3zoN4r6kBPt6EYzdhyY0
         Z9Qu5alZSmc9d+da94wKz1nFO+rmTuHkxKrgqHEzzr5OK7kg+AqA816pjxfPvsD/n/4q
         QgsFw1FBFGJ9CdPgUyl7LLuUPPsLPJ9NDfqvRbUpUd0R8Xl+o+vbY8LhWMuZmu/NfdGd
         y+Zg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r26si7157634qtf.323.2018.12.05.12.59.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 05 Dec 2018 12:59:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36795 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gUeGH-0007xk-7z
	for alex.bennee@linaro.org; Wed, 05 Dec 2018 15:59:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59001)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gUeFy-0007wB-RI
	for qemu-arm@nongnu.org; Wed, 05 Dec 2018 15:58:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gUeFx-0002BL-TA
	for qemu-arm@nongnu.org; Wed, 05 Dec 2018 15:58:54 -0500
Received: from mx1.redhat.com ([209.132.183.28]:57456)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gUeFx-0002AE-MX; Wed, 05 Dec 2018 15:58:53 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E2989309702F;
	Wed,  5 Dec 2018 20:58:52 +0000 (UTC)
Received: from localhost (ovpn-116-33.gru2.redhat.com [10.97.116.33])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1E3751001F54;
	Wed,  5 Dec 2018 20:58:47 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  5 Dec 2018 18:58:24 -0200
Message-Id: <20181205205827.19387-3-ehabkost@redhat.com>
In-Reply-To: <20181205205827.19387-1-ehabkost@redhat.com>
References: <20181205205827.19387-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Wed, 05 Dec 2018 20:58:53 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH for-4.0 2/5] spapr: Use default_machine_opts to
 set use_hotplug_event_source
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qvreEf6pWrQP

Instead of setting use_hotplug_event_source at instance_init
time, set default_machine_opts on spapr_machine_2_7_class_options()
to implement equivalent behavior.

This will let us eliminate the need for separate instance_init
functions for each spapr machine-type.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/ppc/spapr.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 80d8498867..f6b60e6fbd 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -4240,10 +4240,7 @@ static void phb_placement_2_7(sPAPRMachineState *spapr, uint32_t index,
 
 static void spapr_machine_2_7_instance_options(MachineState *machine)
 {
-    sPAPRMachineState *spapr = SPAPR_MACHINE(machine);
-
     spapr_machine_2_8_instance_options(machine);
-    spapr->use_hotplug_event_source = false;
 }
 
 static void spapr_machine_2_7_class_options(MachineClass *mc)
@@ -4252,6 +4249,7 @@ static void spapr_machine_2_7_class_options(MachineClass *mc)
 
     spapr_machine_2_8_class_options(mc);
     mc->default_cpu_type = POWERPC_CPU_TYPE_NAME("power7_v2.3");
+    mc->default_machine_opts = "modern-hotplug-events=off";
     SET_MACHINE_COMPAT(mc, SPAPR_COMPAT_2_7);
     smc->phb_placement = phb_placement_2_7;
 }
-- 
2.18.0.rc1.1.g3f1ff2140

