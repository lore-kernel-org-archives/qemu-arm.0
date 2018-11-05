Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2033828wro;
        Sun, 4 Nov 2018 17:48:31 -0800 (PST)
X-Google-Smtp-Source: AJdET5fOidwrm/FnxKOIQMqon0XPMIGNJmxeF1ykXldUDUGv6cmyYlZxBMwlqooAct0bK3nl/gKd
X-Received: by 2002:a37:8806:: with SMTP id k6-v6mr18797786qkd.119.1541382511218;
        Sun, 04 Nov 2018 17:48:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541382511; cv=none;
        d=google.com; s=arc-20160816;
        b=HUUP1ny77LSNrDqdQMOyaj8YrkYPTS/xn/NFkrlH+EJcAs1K9nVm/uUG3Ce365tqsy
         Fd1LOyuerOgdChTHpOdLp6IOngE/UzlHeLcPoI3QW+KFuFYbEEFgQ6ucciHMIvmLR09E
         GS4pUf4gY2/XVO8Hydo/V52eeFk6k4PBs7Jv4qHFxcfBfT/cM9cASDMFAkDE+BpkGfXj
         Own/QmLAjpb7S5udDRV7dNPLhyzbXluzDhvbNoUxa/Up/HtC1b3WnJRpQw7I++peyOyK
         3L1GgegVAOMSVrbBJgTJRa1WSgtI9PfWxxW8C7/eILkFLmpsKUeZH0BKNLwApki8fEbP
         z5bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=yngy3YctG1UhwMIwvrBWUvxF1mq0ud8J+F3MR9fC1lE=;
        b=UonPZh1mrfAhSltTg81PyFAfg9xhQQi6QnHp2d+a8J0QGVPuUASNwt5UxWJJYUH8Ls
         qONeBAQ/1F4X+6KYhiFpy+vWwhRZsyai2F2aFHPISBpMr58onSCdjcrxHNF5CMrQ4glV
         SN3L6lkmfHUPck0sGdspxofJ0GC/CJrIZJRqqVI7YYAgzxvFO46c2AMC61/+lNppuagR
         OMKRAf272+M8HRukZMB+8DF5BhGLqIFjDvSTo+XPFRawUHbnFDe9lQK81cRTnE0mHJl8
         Ra7AveKAZ6MVNVaDOe8BGw3l5ziZhd06KJcrVArRAVPCZGzQEBv9vU48qxDlaAt71oCR
         O5QA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j16si2038592qvp.114.2018.11.04.17.48.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 04 Nov 2018 17:48:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:60877 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gJU0E-0004Re-MU
	for alex.bennee@linaro.org; Sun, 04 Nov 2018 20:48:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47095)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gJTup-0007xA-2s
	for qemu-devel@nongnu.org; Sun, 04 Nov 2018 20:42:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gJTui-0002yv-O1
	for qemu-devel@nongnu.org; Sun, 04 Nov 2018 20:42:54 -0500
Received: from mga03.intel.com ([134.134.136.65]:22001)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gJTui-0002wL-1d; Sun, 04 Nov 2018 20:42:48 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Nov 2018 17:42:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,466,1534834800"; d="scan'208";a="277074386"
Received: from emurphy1-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
	([10.252.26.250])
	by fmsmga005.fm.intel.com with ESMTP; 04 Nov 2018 17:42:42 -0800
From: Samuel Ortiz <sameo@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Mon,  5 Nov 2018 02:40:36 +0100
Message-Id: <20181105014047.26447-14-sameo@linux.intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181105014047.26447-1-sameo@linux.intel.com>
References: <20181105014047.26447-1-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.65
Subject: [Qemu-devel] [PATCH v5 13/24] hw: acpi: Do not create hotplug
 method when handler is not defined
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
	Stefano Stabellini <sstabellini@kernel.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GP/CXuLnaEUT

CPU and memory ACPI hotplug are not necessarily handled through SCI
events. For example, with Hardware-reduced ACPI, the GED device will
manage ACPI hotplug entirely.
As a consequence, we make the CPU and memory specific events AML
generation optional. The code will only be added when the method name is
not NULL.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
---
 hw/acpi/cpu.c            |  8 +++++---
 hw/acpi/memory_hotplug.c | 11 +++++++----
 2 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
index f10b190019..cd41377b5a 100644
--- a/hw/acpi/cpu.c
+++ b/hw/acpi/cpu.c
@@ -569,9 +569,11 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
     aml_append(sb_scope, cpus_dev);
     aml_append(table, sb_scope);
 
-    method = aml_method(event_handler_method, 0, AML_NOTSERIALIZED);
-    aml_append(method, aml_call0("\\_SB.CPUS." CPU_SCAN_METHOD));
-    aml_append(table, method);
+    if (event_handler_method) {
+        method = aml_method(event_handler_method, 0, AML_NOTSERIALIZED);
+        aml_append(method, aml_call0("\\_SB.CPUS." CPU_SCAN_METHOD));
+        aml_append(table, method);
+    }
 
     g_free(cphp_res_path);
 }
diff --git a/hw/acpi/memory_hotplug.c b/hw/acpi/memory_hotplug.c
index 8c7c1013f3..db2c4df961 100644
--- a/hw/acpi/memory_hotplug.c
+++ b/hw/acpi/memory_hotplug.c
@@ -715,10 +715,13 @@ void build_memory_hotplug_aml(Aml *table, uint32_t nr_mem,
     }
     aml_append(table, dev_container);
 
-    method = aml_method(event_handler_method, 0, AML_NOTSERIALIZED);
-    aml_append(method,
-        aml_call0(MEMORY_DEVICES_CONTAINER "." MEMORY_SLOT_SCAN_METHOD));
-    aml_append(table, method);
+    if (event_handler_method) {
+        method = aml_method(event_handler_method, 0, AML_NOTSERIALIZED);
+        aml_append(method,
+                   aml_call0(MEMORY_DEVICES_CONTAINER "."
+                             MEMORY_SLOT_SCAN_METHOD));
+        aml_append(table, method);
+    }
 
     g_free(mhp_res_path);
 }
-- 
2.19.1

