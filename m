Received: by 10.25.85.209 with SMTP id j200csp102454lfb;
        Fri, 10 Jun 2016 10:45:18 -0700 (PDT)
X-Received: by 10.140.241.6 with SMTP id m6mr3226130qhc.0.1465580718830;
        Fri, 10 Jun 2016 10:45:18 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k97si6908146qgk.40.2016.06.10.10.45.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 10 Jun 2016 10:45:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43640 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bBQUg-00024r-6B
	for alex.bennee@linaro.org; Fri, 10 Jun 2016 13:45:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55682)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bBQQJ-0006Lt-JF
	for qemu-arm@nongnu.org; Fri, 10 Jun 2016 13:40:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bBQQG-0000Mq-FB
	for qemu-arm@nongnu.org; Fri, 10 Jun 2016 13:40:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58333)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1bBQQG-0000Me-8r; Fri, 10 Jun 2016 13:40:44 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A393185A00;
	Fri, 10 Jun 2016 17:40:43 +0000 (UTC)
Received: from hawk.localdomain.com (dhcp-1-122.brq.redhat.com [10.34.1.122])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u5AHeVPV032552; Fri, 10 Jun 2016 13:40:41 -0400
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org
Date: Fri, 10 Jun 2016 19:40:15 +0200
Message-Id: <1465580427-13596-5-git-send-email-drjones@redhat.com>
In-Reply-To: <1465580427-13596-1-git-send-email-drjones@redhat.com>
References: <1465580427-13596-1-git-send-email-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Fri, 10 Jun 2016 17:40:43 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH RFC 04/16] hw/core/machine: Introduce pre_init
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, agraf@suse.de,
	pbonzini@redhat.com, dgibson@redhat.com, imammedo@redhat.com,
	david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Bkg9fcUHmXvD

From: Igor Mammedov <imammedo@redhat.com>

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 hw/core/machine.c   | 6 ++++++
 include/hw/boards.h | 1 +
 vl.c                | 1 +
 3 files changed, 8 insertions(+)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index ccdd5fa3e7728..3dce9020e510a 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -368,10 +368,16 @@ static void machine_init_notify(Notifier *notifier, void *data)
     foreach_dynamic_sysbus_device(error_on_sysbus_device, NULL);
 }
 
+static void machine_pre_init(MachineState *ms)
+{
+}
+
 static void machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
 
+    mc->pre_init = machine_pre_init;
+
     /* Default 128 MB as guest ram size */
     mc->default_ram_size = 128 * M_BYTE;
     mc->rom_file_has_mr = true;
diff --git a/include/hw/boards.h b/include/hw/boards.h
index d268bd00a9f7d..4e8dc68b07a24 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -92,6 +92,7 @@ struct MachineClass {
     const char *alias;
     const char *desc;
 
+    void (*pre_init)(MachineState *state);
     void (*init)(MachineState *state);
     void (*reset)(void);
     void (*hot_add_cpu)(const int64_t id, Error **errp);
diff --git a/vl.c b/vl.c
index 8d482cb1bf020..4849dd465d667 100644
--- a/vl.c
+++ b/vl.c
@@ -4500,6 +4500,7 @@ int main(int argc, char **argv, char **envp)
     current_machine->boot_order = boot_order;
     current_machine->cpu_model = cpu_model;
 
+    machine_class->pre_init(current_machine);
     machine_class->init(current_machine);
 
     realtime_init();
-- 
2.4.11

