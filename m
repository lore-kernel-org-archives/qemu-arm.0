Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3549993wrt;
        Fri, 30 Nov 2018 05:04:15 -0800 (PST)
X-Google-Smtp-Source: AFSGD/XeqUTj5tGvKxAyu53ERv2hhwLWzCMssrtdB9Vu3iceno1/4dJU3ChgbZtJNLEqShG2aC3B
X-Received: by 2002:a25:5c88:: with SMTP id q130-v6mr5299008ybb.236.1543583055740;
        Fri, 30 Nov 2018 05:04:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543583055; cv=none;
        d=google.com; s=arc-20160816;
        b=vU07VdQftcaMlIzb+3CLC7cNnX52T5/5LgYdZ5G3ymP5sxLYQn7WqL6ud9oV8fl1Uz
         hY1I8ZXGDlu0gePfX6bPSGEb7i36dCUXJQBZJV42KoLIS3evz8vWNY8hgK3O/BAKuZEE
         A6HZxTnsrkdthkffhmqT7smQ6g64/jA7LVlXRGtJxJM0X+csVRoGyQsYCK+bpB1bGGio
         LsR0j1kLm30Ii7LeiXHx94TlWzpntxOwd8q8L5qdXenKbZsPW9e4daj3mSUr4VuWWCGY
         7F7zbUYQDi3q+GMwRe/G3MrYe/5IXdKcvMwuzBKlYHs8HOHYG3Vbj5mOAc/WXknWEoKJ
         yLNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=0E03appgn/L0OTMzwT/dSihj44/ev4jm7kRQ6gs6+Fw=;
        b=APte/3URujddXALM1XqSeXtO1W1wi8pIT0oYr4Oi7moa/p41+HmJ/oDGuyNUc26LDX
         ndybE1JkkYQzg8xHk0E5LmYGRXDhi/QdEvJLd/E5NJlsnX1rDBPtVFxU/6S88IL0PXS/
         eFDA+NQfUdXdStywLvS4ATuVb9V40paMpzXfoRY4ouqbB8END/ahnb9KgH+OsrERyAyT
         ctWRg6RpTmE19PmI70dTDX5irlw2ZVSHb0X68sG5aTyxC/KxNINjmtLF03Dec98fbnKk
         J8q0g4Ne3AKuzBrBOUlbNovfQcexpLMZ/gHcdSaVsrwu2CJgx2cCNjsCfFA2ulDkm2oi
         FnAg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x63-v6si2980766ybb.269.2018.11.30.05.04.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 30 Nov 2018 05:04:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:59851 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gSiSt-0006n7-6d
	for alex.bennee@linaro.org; Fri, 30 Nov 2018 08:04:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33538)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gSiQL-00047A-21
	for qemu-devel@nongnu.org; Fri, 30 Nov 2018 08:01:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gSiQE-0004xL-R0
	for qemu-devel@nongnu.org; Fri, 30 Nov 2018 08:01:36 -0500
Received: from mga09.intel.com ([134.134.136.24]:51026)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gSiQE-0004nX-Fn; Fri, 30 Nov 2018 08:01:30 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Nov 2018 05:01:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,298,1539673200"; d="scan'208";a="293506517"
Received: from ppkrause-mobl.ger.corp.intel.com (HELO localhost.localdomain)
	([10.251.84.55])
	by fmsmga005.fm.intel.com with ESMTP; 30 Nov 2018 05:01:16 -0800
From: Samuel Ortiz <sameo@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Fri, 30 Nov 2018 14:00:26 +0100
Message-Id: <20181130130032.11835-3-sameo@linux.intel.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181130130032.11835-1-sameo@linux.intel.com>
References: <20181130130032.11835-1-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.24
Subject: [Qemu-devel] [PATCH v3 2/8] hw: arm: acpi: Fix incorrect checksums
 in RSDP
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
Cc: Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Ben Warren <ben@skyportsystems.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zJ8HiY94GRU8

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

