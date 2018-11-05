Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2037382wro;
        Sun, 4 Nov 2018 17:54:05 -0800 (PST)
X-Google-Smtp-Source: AJdET5eIH3OEnibr6mkyhq6ioLykJp7/PiPpkmmYhm7z90yGlvnZhAzSBzcqa4Bu0Zl5Ry29lbfv
X-Received: by 2002:aed:3f22:: with SMTP id p31mr9567681qtf.185.1541382845685;
        Sun, 04 Nov 2018 17:54:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541382845; cv=none;
        d=google.com; s=arc-20160816;
        b=J3jAybmqwEUxOyds00Hus8EwbYvKd3p2G24ia1Iyjq0odR0aVPz6ulyJCKr+6PnoHA
         pxWvGcXODlWu2PnVGzp2/uNfVUf9WxZcEO8c7uW+dUZ3k/g5/B8ava1DVy+tONiHQSNp
         cY4YZqielhTHtBjeX9KgxoXVcuuSg7KZp+s4dw8F50XlT0m8T8q5oqbQvrnBUu8wY4dH
         cAsFmbfqvSswA2eDw72p5KGulKRbB2GI5OurknCuGIf+NmtKfcQkZ65oCni+Lj2E/nqo
         tLTAPZozFq/MWbzBTjYy0U+xEGMgGNjDb1uG68Aub8YBPM7iiBW9klvaIZmbeJwEgQr+
         uMqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=4tWCWwouHyeilRf6DFS0h52a8nCBmQ3v5WMUtGP/dd8=;
        b=cO5wILKbGW1YrDdTfDdfV/iG1aj837fXQW5JWYmxye9DkYaVKcT+kcADTPJLpRAD/R
         Vgflsg3EfAcFaZEAMwrgYX5o2nfUpNvj6w8EMIJAh72RhRXGkC3JnqAloSd7hSNgQmc3
         h0ilDURv3GZgP/J9wiTAJOpFg8qmBgM+ywXmEorIjH4kIzCdf/U3JReF0U3cK+epskA6
         wvqUkMC3+duijr1AFqVWGBBd+f1P5VApgRTEU3uHsFo2mSFJECZ6WJ8yxn5RnG6bizaS
         Z6Yw2YEip3c69RjnwtMQ0jASW8fk9x0Nsdgv/lWxbVYS0B2XIKtoG3y2aJzP0l8H22cX
         qA2g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y12si4511535qth.357.2018.11.04.17.54.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 04 Nov 2018 17:54:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:60910 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gJU5d-00024W-5e
	for alex.bennee@linaro.org; Sun, 04 Nov 2018 20:54:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47190)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gJTv2-00086m-53
	for qemu-devel@nongnu.org; Sun, 04 Nov 2018 20:43:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gJTux-0003CP-7X
	for qemu-devel@nongnu.org; Sun, 04 Nov 2018 20:43:08 -0500
Received: from mga18.intel.com ([134.134.136.126]:7994)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gJTuv-0003BH-CD; Sun, 04 Nov 2018 20:43:03 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Nov 2018 17:42:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,466,1534834800"; d="scan'208";a="277074430"
Received: from emurphy1-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
	([10.252.26.250])
	by fmsmga005.fm.intel.com with ESMTP; 04 Nov 2018 17:42:53 -0800
From: Samuel Ortiz <sameo@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Mon,  5 Nov 2018 02:40:38 +0100
Message-Id: <20181105014047.26447-16-sameo@linux.intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181105014047.26447-1-sameo@linux.intel.com>
References: <20181105014047.26447-1-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.126
Subject: [Qemu-devel] [PATCH v5 15/24] hw: i386: Export the i386 ACPI SRAT
 build method
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
X-TUID: iSyb0uIDcxDV

This is the standard way of building SRAT on x86 platfoms. But future
machine types could decide to define their own custom SRAT build method
through the ACPI builder methods.
Moreover, we will also need to reach build_srat() from outside of
acpi-build in order to use it as the ACPI builder SRAT build method.

Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
---
 hw/i386/acpi-build.h | 5 +++++
 hw/i386/acpi-build.c | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/i386/acpi-build.h b/hw/i386/acpi-build.h
index 065a1d8250..d73c41fe8f 100644
--- a/hw/i386/acpi-build.h
+++ b/hw/i386/acpi-build.h
@@ -4,6 +4,11 @@
 
 #include "hw/acpi/acpi.h"
 
+/* ACPI SRAT (Static Resource Affinity Table) build method for x86 */
+void
+build_srat(GArray *table_data, BIOSLinker *linker,
+           MachineState *machine, AcpiConfiguration *acpi_conf);
+
 void acpi_setup(MachineState *machine, AcpiConfiguration *acpi_conf);
 
 #endif
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 1ef1a38441..673c5dfafc 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1615,7 +1615,7 @@ build_tpm2(GArray *table_data, BIOSLinker *linker, GArray *tcpalog)
 #define HOLE_640K_START  (640 * KiB)
 #define HOLE_640K_END   (1 * MiB)
 
-static void
+void
 build_srat(GArray *table_data, BIOSLinker *linker,
            MachineState *machine, AcpiConfiguration *acpi_conf)
 {
-- 
2.19.1

