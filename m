Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp930715njm;
        Wed, 5 Mar 2025 08:42:19 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU38OebdwUpF/7icSrpa6TcfklDyEHYRND/ysm9uDRQkaIXT3xWOWnI2vgEs9WBOhHWA3XG8i8ofv5P4Q==@linaro.org
X-Google-Smtp-Source: AGHT+IGvU4C+JyqQy+QWtSBFVRNcRImGOC3r3j8MSFBHJvNPF9NYIKH0pMzIkVRgpuxroJEQuYJn
X-Received: by 2002:a05:6902:2a4a:b0:e5a:b05e:4da8 with SMTP id 3f1490d57ef6-e611e31afd0mr5283066276.42.1741192938833;
        Wed, 05 Mar 2025 08:42:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741192938; cv=none;
        d=google.com; s=arc-20240605;
        b=aY8gf96K0QAraDQ91ouLmZcrkTfqF3If+rKaciMzSr5HyWaxlr3YWKnIoTSfuvnKOf
         uGgG1m0PcQ3M0Dij3yxdMzH8XLGjDaQScI0x2aor5iXD0/Kj5FaHFOCRTz8VGv9fE6OX
         jAeOwjLSP5EXBj3LYS8y2M0/9JVWYKZ93XNXzjI+QEdynkhkI/O4B5EEc6YpFnwhbnKx
         yxUeA0Jt3dOWvyO8IdUFFcJHUjV3EnJZqN0xH2wNZhPsq3ISG++5taWRKUGu6xJSROSP
         d7wtEXkKKS5eMSWyaEosc/n3XA/4ib2zfKOPyGoyrFkbffnNxpeA2dc3+IO96RXq8XcK
         u7dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=FC4UbF4F42Zk1lANeuJySWt0Klm/3oNM+IlRRNUTvBc=;
        fh=zInp4xe4IkcRrNM2aFMptin5JRRr9I02FEAKlsM82YU=;
        b=V1uk3rmf7TZ2sSO8gYtLarl5AidtI652PPpMj7/1Cxuer+W8Wv0laYj8GPNzYxdKUd
         0YSW/Qm1wKz1IEsyr3V7gBLAw0hDnYyebNm7co2LawUGsRZLrGlcDHOKl7vjwsb2BPZf
         ZfYMEYKTg3qMZ6oT7XFJP1HPC48BG2DfjaO4lUG+NP7u9x2BCeL+LEJEZemKsricLHxa
         e2oQkmJGsdGLLTG+ubI9H8ZB9uTR8G3UBU2BJzjiOuEuZ8Kge6p1Ym6XFj4hTBIwm3M7
         js/cWjq4ZLNZC6BuRvWpfjihrHxHMql7YEwSdbzaATSXrVr1RIy6bLI0gT6UmO7Ieb//
         DTZA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LwhJFhd4;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 3f1490d57ef6-e63428babfdsi560768276.174.2025.03.05.08.42.18
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 08:42:18 -0800 (PST)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LwhJFhd4;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741192938;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FC4UbF4F42Zk1lANeuJySWt0Klm/3oNM+IlRRNUTvBc=;
	b=LwhJFhd40C1JKryp9nlW/JgV4KUoOnL6HHOQ6VjFq2Ti7x3HQlq0Apw1Xd0PEZ8E9GEN8g
	oP3geo922Rje8N7GmASsLUWk7/1JrdxnBkDLpBKxebehJfwpHL4qQjuACwC2wkbSwPyXtd
	oz/CTps5+hZR8mou5JcBSZZ1oMZ4iig=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-582-qvmy90P1N0O2c-gPkGuTHg-1; Wed,
 05 Mar 2025 11:42:17 -0500
X-MC-Unique: qvmy90P1N0O2c-gPkGuTHg-1
X-Mimecast-MFC-AGG-ID: qvmy90P1N0O2c-gPkGuTHg_1741192935
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B449A1956050;
	Wed,  5 Mar 2025 16:42:14 +0000 (UTC)
Received: from gondolin.redhat.com (unknown [10.67.24.9])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1E9621955DDE;
	Wed,  5 Mar 2025 16:41:59 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: eric.auger.pro@gmail.com,
	eric.auger@redhat.com,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	kvmarm@lists.linux.dev,
	peter.maydell@linaro.org,
	richard.henderson@linaro.org,
	alex.bennee@linaro.org,
	maz@kernel.org,
	oliver.upton@linux.dev,
	sebott@redhat.com,
	shameerali.kolothum.thodi@huawei.com,
	armbru@redhat.com,
	berrange@redhat.com,
	abologna@redhat.com,
	jdenemar@redhat.com,
	agraf@csgraf.de
Cc: shahuang@redhat.com,
	mark.rutland@arm.com,
	philmd@linaro.org,
	pbonzini@redhat.com,
	Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v2 13/14] arm/cpu: Add sysreg generation scripts
Date: Wed,  5 Mar 2025 17:38:18 +0100
Message-ID: <20250305163819.2477553-14-cohuck@redhat.com>
In-Reply-To: <20250305163819.2477553-1-cohuck@redhat.com>
References: <20250305163819.2477553-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-TUID: wH7D+udiOe3e

From: Eric Auger <eric.auger@redhat.com>

Introduce scripts that automate the generation of system register
definitions from a given linux source tree arch/arm64/tools/sysreg.

Invocation of
./update-aarch64-sysreg-code.sh $PATH_TO_LINUX_SOURCE_TREE
in scripts directory generates target/arm/cpu-sysregs.h.inc
containing defines for all system registers.

[CH: update to handle current kernel sysregs structure, and to emit
     the re-worked register structures; cpu properties will be added
     later]
Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 scripts/gen-cpu-sysregs-header.awk    | 70 +++++++++++++++++++++++++++
 scripts/update-aarch64-sysreg-code.sh | 35 ++++++++++++++
 2 files changed, 105 insertions(+)
 create mode 100755 scripts/gen-cpu-sysregs-header.awk
 create mode 100755 scripts/update-aarch64-sysreg-code.sh

diff --git a/scripts/gen-cpu-sysregs-header.awk b/scripts/gen-cpu-sysregs-header.awk
new file mode 100755
index 000000000000..27a222856a84
--- /dev/null
+++ b/scripts/gen-cpu-sysregs-header.awk
@@ -0,0 +1,70 @@
+#!/bin/awk -f
+# SPDX-License-Identifier: GPL-2.0
+# gen-cpu-sysregs-header.awk: arm64 sysreg header generator
+#
+# Usage: awk -f gen-cpu-sysregs-header.awk -- -v structure=xxx $LINUX_PATH/arch/arm64/tools/sysreg
+# where structure is one of "idx" "reg" "table"
+
+BEGIN {
+    print ""
+    if (structure == "idx") {
+	print "typedef enum ARMIDRegisterIdx {"
+    }
+    if (structure == "reg") {
+	print "typedef enum ARMSysRegs {"
+    }
+    if (structure == "table") {
+	print "static const uint32_t id_register_sysreg[NUM_ID_IDX] = {"
+    }
+} END {
+    if (structure == "idx") {
+	print "    NUM_ID_IDX,"
+	print "} ARMIDRegisterIdx;"
+    }
+    if (structure == "reg") {
+	print "} ARMSysRegs;"
+    }
+    if (structure == "table") {
+	print "};"
+    }
+    print ""
+}
+
+# skip blank lines and comment lines
+/^$/ { next }
+/^[\t ]*#/ { next }
+
+/^Sysreg\t/ || /^Sysreg /{
+
+	reg = $2
+	op0 = $3
+	op1 = $4
+	crn = $5
+	crm = $6
+	op2 = $7
+
+	if (op0 == 3 && (op1>=0 && op1<=3) && crn==0 && (crm>=0 && crm<=7) && (op2>=0 && op2<=7)) {
+	    idreg = 1
+        } else {
+	    idreg = 0
+	}
+
+	if (idreg) {
+	    if (structure == "idx") {
+		print "    "reg"_IDX,"
+	    }
+	    if (structure == "reg") {
+		print "    SYS_"reg" = ENCODE_ID_REG("op0", "op1", "crn", "crm", "op2"),"
+	    }
+	    if (structure == "table") {
+		print "    ["reg"_IDX] = SYS_"reg","
+	    }
+	}
+
+	next
+}
+
+{
+	/* skip all other lines */
+	next
+}
diff --git a/scripts/update-aarch64-sysreg-code.sh b/scripts/update-aarch64-sysreg-code.sh
new file mode 100755
index 000000000000..01762c620556
--- /dev/null
+++ b/scripts/update-aarch64-sysreg-code.sh
@@ -0,0 +1,35 @@
+#!/bin/sh -e
+#
+# Update target/arm/cpu-sysregs.h
+# from a linux source tree (arch/arm64/tools/sysreg)
+#
+# Copyright Red Hat, Inc. 2024
+#
+# Authors:
+#          Eric Auger <eric.auger@redhat.com>
+#
+
+linux="$1"
+output="$PWD"
+
+if [ -z "$linux" ] || ! [ -d "$linux" ]; then
+    cat << EOF
+usage: update-aarch64-sysreg-code.sh LINUX_PATH
+
+LINUX_PATH      Linux kernel directory to obtain the headers from
+EOF
+    exit 1
+fi
+
+            cat <<EOF >../target/arm/cpu-sysregs.h.inc
+/* GENERATED FILE -- DO NOT EDIT */
+#ifndef ARCH_ARM_CPU_SYSREGS_H_INC
+#define ARCH_ARM_CPU_SYSREGS_H_INC
+EOF
+
+for structure in "idx" "reg" "table"; do
+    awk -f gen-cpu-sysregs-header.awk -v structure="$structure"\
+       $linux/arch/arm64/tools/sysreg >> ../target/arm/cpu-sysregs.h.inc
+done
+
+echo "#endif /* ARCH_ARM_CPU_SYSREGS_H_INC */" >> ../target/arm/cpu-sysregs.h.inc
-- 
2.48.1
