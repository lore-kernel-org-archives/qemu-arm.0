Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2353648wrt;
        Mon, 17 Dec 2018 03:11:54 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VjMECx6HR2aQM3pGLDiOV9VA+Wm7/xxKUl9e4Yp4MVvjZKoPSp9XZp9CYsDi8AhO2ysxma
X-Received: by 2002:ac8:7016:: with SMTP id x22mr12487671qtm.325.1545045114496;
        Mon, 17 Dec 2018 03:11:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1545045114; cv=none;
        d=google.com; s=arc-20160816;
        b=w4LPuS161I5Z9iMWQJC0ST3Ie9smGGSdsL8Cs1jAdAeg54OtdEaWpCwdRfyW/gb39l
         T11CbbeNpa02Q5KtKTDyDI20dUPCFfYHqLU14MO3ziDpBhH0sB38tKKbJz/DAhM6w9du
         onRjAzXuyo73uAZLoA+anrKHXPdjqodV6KFAE5I4Y4TjYT7XhY9nTM1NhEMaL73Tx2ij
         p+TY4oHn9W2ZOoAxS9ex/+7qfW6RGuxGuO7y8cYPWA5l2ZFohwRQpoAJcuSJjKYf5r8E
         P/6q7sdDC02r1GJ7ygduHJGvuiqYA/lb1e+RMyQTN1YMAtBPjbXZP5R55gdEnp3I5B73
         34Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=0E03appgn/L0OTMzwT/dSihj44/ev4jm7kRQ6gs6+Fw=;
        b=BOmY4R7bXPzKNst78k7pTcAzcPlL8o2HK34uEKFQXU/IJhzgylzz7H+/naadHYLo9f
         fcmHDZfGqKttsXOGcXVctMZ7HMtMRLBNHjJq8hvTSGlMbbg2H14G+gnITOkVZWU98wJ6
         hOJ2y4gMo60B8bHvGS+5lUqKtNQx4hA0zxpNGIDyPX7PNSpIUM1dTRI1+CZVelFTS2k8
         WEybG4Nonvg8iogKECu5HP0GMRlGZGFsIf3hQKNoojM+C7UPqS2OJkyDw/bvK3T3WRG6
         kD/PwYUby2J109Di2SRBUPo765mF2foxCymV0rgwehGDIvU2Fzv2NXVogOGJsgJxi34e
         uGrw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h34si362484qtd.155.2018.12.17.03.11.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 17 Dec 2018 03:11:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:45968 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gYqoU-0004Pe-0L
	for alex.bennee@linaro.org; Mon, 17 Dec 2018 06:11:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37585)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gYqcS-00036H-Sf
	for qemu-arm@nongnu.org; Mon, 17 Dec 2018 05:59:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gYqSh-0003MX-W1
	for qemu-arm@nongnu.org; Mon, 17 Dec 2018 05:49:24 -0500
Received: from mga06.intel.com ([134.134.136.31]:26425)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gYqSe-0003JM-PE; Mon, 17 Dec 2018 05:49:20 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Dec 2018 02:49:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,365,1539673200"; d="scan'208";a="130583635"
Received: from apeskov-mobl.ccr.corp.intel.com (HELO localhost.localdomain)
	([10.252.26.185])
	by fmsmga001.fm.intel.com with ESMTP; 17 Dec 2018 02:49:14 -0800
From: Samuel Ortiz <sameo@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Mon, 17 Dec 2018 11:48:32 +0100
Message-Id: <20181217104838.18957-3-sameo@linux.intel.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181217104838.18957-1-sameo@linux.intel.com>
References: <20181217104838.18957-1-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.31
Subject: [Qemu-arm] [PATCH v4 2/8] hw: arm: acpi: Fix incorrect checksums in
 RSDP
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
Cc: Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Ben Warren <ben@skyportsystems.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sVndzcQOq4z1

From: Igor Mammedov <imammedo@redhat.com>

When RSDP table was introduced (d4bec5d87), we calculated only legacy
checksum, and that was incorrect as it
 - specified rev=2 and forgot about extended checksum.
 - legacy checksum calculated on full table instead of the 1st 20 bytes

Fix it by adding extended checksum calculation and using correct
size for legacy checksum.

While at it use explicit constants to specify sub/full tables
sizes instead of relying on AcpiRsdpDescriptor size and fields offsets.
The follow up commits will convert this table to build_append_int_noprefix() API,
will use constants anyway and remove unused AcpiRsdpDescriptor structure.

Based on "[PATCH v5 05/24] hw: acpi: Implement XSDT support for  RSDP"
by Samuel Ortiz, who did it right in his impl.

Fixes: d4bec5d87 (hw/arm/virt-acpi-build: Generate RSDP table)
Signed-off-by: Igor Mammedov <imammedo@redhat.com>
CC: Ard Biesheuvel <ard.biesheuvel@linaro.org>
CC: Shannon Zhao <shannon.zhaosl@gmail.com>
Reviewed-by: Samuel Ortiz <sameo@linux.intel.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
---
 hw/arm/virt-acpi-build.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index fcaa350892..0835900052 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -390,8 +390,13 @@ build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned xsdt_tbl_offset)
 
     /* Checksum to be filled by Guest linker */
     bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE,
-        (char *)rsdp - rsdp_table->data, sizeof *rsdp,
+        (char *)rsdp - rsdp_table->data, 20 /* ACPI rev 1.0 RSDP size */,
         (char *)&rsdp->checksum - rsdp_table->data);
+
+    /* Extended checksum to be filled by Guest linker */
+    bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE,
+        (char *)rsdp - rsdp_table->data, 36 /* ACPI rev 2.0 RSDP size */,
+        (char *)&rsdp->extended_checksum - rsdp_table->data);
 }
 
 static void
-- 
2.19.2

