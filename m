Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2029391wro;
        Sun, 4 Nov 2018 17:42:07 -0800 (PST)
X-Google-Smtp-Source: AJdET5fk5kzEGmDX417mrF2EPaEeQeV5OZiC07Lpv5otjtzXobsH39HfTL2zIIBQsqcI13a/MXNS
X-Received: by 2002:a0c:aff9:: with SMTP id t54mr19414878qvc.93.1541382126933;
        Sun, 04 Nov 2018 17:42:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541382126; cv=none;
        d=google.com; s=arc-20160816;
        b=Yw1euNXd80Ci6ANRbXGOHWgeA8Gunx5QM+v87ZwyefXrQreP3/d4sLrlZozg+AHdzu
         qR2lB8SDkK+fXttBGp7g1YH8nB1FXiOYCGBshXEV63ZMivmsz5iCXD3Zla7VMtDzPoBX
         nVU4Kf25ChZEPtmSjaoTqJ/HWR5AATZCmgkAuyOYLXoL+iA0ofNdIZY8WJNsXPF0sGuq
         WOBNBHrUW9W342RxPJNAn+cpn3ud85+l0RlB4SLMdSaZ1JQ7ges3zZJrPp/w3kGVYPLS
         J9BfuUL6ENODnh1qWgpbhPGWFxnCR82o+7dvTpmjqkrRnDgNRQ6/AWvtaYpAhyxUyoba
         sA+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=DnUvNMWOorUjISkkLZoT1tYMu5WGW5WPao5Ti4i5Ah8=;
        b=MsDUQo0Gtfgt2oY1Xtk/2cPDnGDHaOJ7Ma2AnpJkgLKHJGn3loE3jagb0DuPKfXJhf
         sjpeyq1k30Bh6fSG9Sr/z18+yhxOZd0yNznKRvJf2HlqOahE9n54gmea0Dj8qWAKrSps
         1gSjI1pCw9XHqiMgKduMejV03B5/xN8UWiE38ElOxvfzlzRx8mgSSOGpd/b+/tRPUa0l
         rt3gp/ks1Sre1pA0bf40By2UXt2OZVXR3ZiU1uKKsyiuloVQCSp5ONfPPC5F9iIJNKWj
         F2w/xmgEAeGWwjLY/JSZyo8ynH1xvO3KVy7/yIS955b5LVhXHUI5dMyDr4lFCz/goy3V
         AWBA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j6-v6si385971qth.245.2018.11.04.17.42.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 04 Nov 2018 17:42:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:60843 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gJTu2-000654-DG
	for alex.bennee@linaro.org; Sun, 04 Nov 2018 20:42:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46753)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gJTtm-000631-TS
	for qemu-arm@nongnu.org; Sun, 04 Nov 2018 20:41:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gJTtm-000190-4E
	for qemu-arm@nongnu.org; Sun, 04 Nov 2018 20:41:50 -0500
Received: from mga03.intel.com ([134.134.136.65]:21934)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gJTtj-0000tf-DJ; Sun, 04 Nov 2018 20:41:47 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Nov 2018 17:41:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,466,1534834800"; d="scan'208";a="277074252"
Received: from emurphy1-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
	([10.252.26.250])
	by fmsmga005.fm.intel.com with ESMTP; 04 Nov 2018 17:41:41 -0800
From: Samuel Ortiz <sameo@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Mon,  5 Nov 2018 02:40:25 +0100
Message-Id: <20181105014047.26447-3-sameo@linux.intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181105014047.26447-1-sameo@linux.intel.com>
References: <20181105014047.26447-1-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.65
Subject: [Qemu-arm] [PATCH v5 02/24] hw: acpi: Export ACPI build alignment
 API
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
	Stefano Stabellini <sstabellini@kernel.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aS9/5uJIA9+Q

This is going to be needed by the Hardware-reduced ACPI routines.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
---
 include/hw/acpi/aml-build.h | 2 ++
 hw/acpi/aml-build.c         | 8 ++++++++
 hw/i386/acpi-build.c        | 8 --------
 3 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
index 6c36903c0a..73fc6659f2 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -384,6 +384,8 @@ build_header(BIOSLinker *linker, GArray *table_data,
              const char *oem_id, const char *oem_table_id);
 void *acpi_data_push(GArray *table_data, unsigned size);
 unsigned acpi_data_len(GArray *table);
+/* Align AML blob size to a multiple of 'align' */
+void acpi_align_size(GArray *blob, unsigned align);
 void acpi_add_table(GArray *table_offsets, GArray *table_data);
 void acpi_build_tables_init(AcpiBuildTables *tables);
 void acpi_build_tables_cleanup(AcpiBuildTables *tables, bool mfre);
diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 1e43cd736d..51b608432f 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -1565,6 +1565,14 @@ unsigned acpi_data_len(GArray *table)
     return table->len;
 }
 
+void acpi_align_size(GArray *blob, unsigned align)
+{
+    /* Align size to multiple of given size. This reduces the chance
+     * we need to change size in the future (breaking cross version migration).
+     */
+    g_array_set_size(blob, ROUND_UP(acpi_data_len(blob), align));
+}
+
 void acpi_add_table(GArray *table_offsets, GArray *table_data)
 {
     uint32_t offset = table_data->len;
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index d0362e1382..81d98fa34f 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -282,14 +282,6 @@ static void acpi_get_pci_holes(Range *hole, Range *hole64)
                                                NULL));
 }
 
-static void acpi_align_size(GArray *blob, unsigned align)
-{
-    /* Align size to multiple of given size. This reduces the chance
-     * we need to change size in the future (breaking cross version migration).
-     */
-    g_array_set_size(blob, ROUND_UP(acpi_data_len(blob), align));
-}
-
 /* FACS */
 static void
 build_facs(GArray *table_data, BIOSLinker *linker)
-- 
2.19.1

