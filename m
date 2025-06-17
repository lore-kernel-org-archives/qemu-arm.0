Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp2602510njc;
        Tue, 17 Jun 2025 08:41:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUvbJrIioX+QLSRIUN5bbwuZ/FKVW4h9nImXak3IKZ4apxhXC41fWd0EDOSX0BpRHpW6KZFL7BR3FrTUg==@linaro.org
X-Google-Smtp-Source: AGHT+IExnqfgZAxRFWoa9MT/rM6V7iuQY7T5mDqnTqljsqP92+xeZ09t9t0zs6K4iPqakkfZExZO
X-Received: by 2002:a05:6214:310d:b0:6fa:a0af:7644 with SMTP id 6a1803df08f44-6fb4776ff03mr228705926d6.27.1750174865947;
        Tue, 17 Jun 2025 08:41:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750174865; cv=none;
        d=google.com; s=arc-20240605;
        b=kxgURIc2DMI34WsPuBkQ9P3L/LtScWbihbL+nhYu8Oap4xMmQyXQq3hiqkshrCHnP3
         AIxc3gYD9mwpVzBSjHq8P8MhlsXTL6iewha1I169zXFE+wHdo/cBJnzNoa9GChmOwWUl
         lwc1ziJukSCt9nSpM9ErRGEPqFZp0uON1Jr8pSp5+u0hipDZSCZShWPkKpqmwYN8ixWp
         VWZRkHpV9cSuCC+Gj3rosLBwgnNchc5mIB/IbNDRxF+M54L0K7nUtubdwvIp+u4VmEBm
         8KxfBfyg0ARpNtXbVvdDVsMvvofgX00QBRXB+DfwCCjp2xdkKdCit/bhfa4XsjVFU+St
         WSAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=YvlwFYdrmYZ5pBPrt5fnuh8VXecITqSPvDABKFjWw0w=;
        fh=zInp4xe4IkcRrNM2aFMptin5JRRr9I02FEAKlsM82YU=;
        b=KjnyJno1q1uLLmeOonmj9GFcKm7MsTBTC82zTxNz3NlMz3p/vk6SOq0Q8mEAR16T2h
         JBAeS09LlnCi3HNTD4qzwLAgY75wM7az+GsHlOtyRZnMnLwwTSzaP7vhUStVMuPlLBPO
         2Oi0e+r3mN0pX80z9Ybk7bFU0F/Wpr25B3Z2cFbhiSZx4rO+I5UJm+Mgc54gv+XQcr7P
         Sczql5c6k7oReDr2Xcs3eBQg3ZhSMjEFzkgHUIu3XZs2+TwaQ96+N7wzBJsbSF3yRxfk
         60ZvuJ05JAC2ZYS5vhUzyyj92aTZWu1YWY+PhhETiCXw92wvOuivqYz8vk8AVxivJtlo
         8opw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=M141Qoh7;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fb4d62681asi76229716d6.282.2025.06.17.08.41.05
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 08:41:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=M141Qoh7;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750174865;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YvlwFYdrmYZ5pBPrt5fnuh8VXecITqSPvDABKFjWw0w=;
	b=M141Qoh7Qf0r4f5M5aRTBG1NqpVoWyw+nj95FllmINhHSXEf5YYjo2/HYBVXZ3irdMAOFC
	zEIcdjEwPLwhQVt9XRJNrXBnr8ZISo/ih//Z23JXtgTLzLyr+cL36qNbtwYe/bC7quDw+p
	nd+IsBytrl1eKijJe+wLxlm7gR1nyuQ=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-463-ukgekzDbOOW4TRqhwIM9dQ-1; Tue,
 17 Jun 2025 11:41:02 -0400
X-MC-Unique: ukgekzDbOOW4TRqhwIM9dQ-1
X-Mimecast-MFC-AGG-ID: ukgekzDbOOW4TRqhwIM9dQ_1750174860
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D32711956068;
	Tue, 17 Jun 2025 15:40:59 +0000 (UTC)
Received: from gondolin.str.redhat.com (pixel-6a.str.redhat.com [10.33.192.205])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id DCDCD180045B;
	Tue, 17 Jun 2025 15:40:53 +0000 (UTC)
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
Subject: [PATCH v8 12/14] arm/cpu: Add sysreg generation scripts
Date: Tue, 17 Jun 2025 17:39:29 +0200
Message-ID: <20250617153931.1330449-13-cohuck@redhat.com>
In-Reply-To: <20250617153931.1330449-1-cohuck@redhat.com>
References: <20250617153931.1330449-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-TUID: QxylBS65I6IL

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
Reviewed-by: Sebastian Ott <sebott@redhat.com>
Signed-off-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 MAINTAINERS                            |  1 +
 scripts/arm-gen-cpu-sysregs-header.awk | 37 ++++++++++++++++++++++++++
 scripts/update-aarch64-sysreg-code.sh  | 32 ++++++++++++++++++++++
 3 files changed, 70 insertions(+)
 create mode 100755 scripts/arm-gen-cpu-sysregs-header.awk
 create mode 100755 scripts/update-aarch64-sysreg-code.sh

diff --git a/MAINTAINERS b/MAINTAINERS
index 28b3dd2684b4..01334cb93ca1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -443,6 +443,7 @@ M: Peter Maydell <peter.maydell@linaro.org>
 L: qemu-arm@nongnu.org
 S: Maintained
 F: target/arm/kvm.c
+F: scripts/*-sysreg*
 
 MIPS KVM CPUs
 M: Huacai Chen <chenhuacai@kernel.org>
diff --git a/scripts/arm-gen-cpu-sysregs-header.awk b/scripts/arm-gen-cpu-sysregs-header.awk
new file mode 100755
index 000000000000..f92bbbafa727
--- /dev/null
+++ b/scripts/arm-gen-cpu-sysregs-header.awk
@@ -0,0 +1,37 @@
+#!/bin/awk -f
+# SPDX-License-Identifier: GPL-2.0-or-later
+# arm-gen-cpu-sysregs-header.awk: arm64 sysreg header include generator
+#
+# Usage: awk -f arm-gen-cpu-sysregs-header.awk $LINUX_PATH/arch/arm64/tools/sysreg
+
+BEGIN {
+    print "/* SPDX-License-Identifier: GPL-2.0-or-later */"
+    print "/* GENERATED FILE, DO NOT EDIT */"
+    print "/* use arm-gen-cpu-sysregs-header.awk to regenerate */"
+} END {
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
+	if (op0 == 3 && (op1==0 || op1==1 || op1==3) && crn==0 && (crm>=0 && crm<=7) && (op2>=0 && op2<=7)) {
+	    print "DEF("reg", "op0", "op1", "crn", "crm", "op2")"
+	}
+	next
+}
+
+{
+	/* skip all other lines */
+	next
+}
diff --git a/scripts/update-aarch64-sysreg-code.sh b/scripts/update-aarch64-sysreg-code.sh
new file mode 100755
index 000000000000..7bba0bcd6f66
--- /dev/null
+++ b/scripts/update-aarch64-sysreg-code.sh
@@ -0,0 +1,32 @@
+#!/bin/sh -e
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+# Update target/arm/cpu-sysregs.h
+# from a linux source tree (arch/arm64/tools/sysreg)
+#
+# Copyright Red Hat, Inc. 2024
+#
+# Authors:
+#          Eric Auger <eric.auger@redhat.com>
+#
+
+scripts="$(dirname "$0")"
+linux="$1"
+output="$2"
+
+if [ -z "$linux" ] || ! [ -d "$linux" ]; then
+    cat << EOF
+usage: update-aarch64-sysreg-code.sh LINUX_PATH [OUTPUT_PATH]
+
+LINUX_PATH      Linux kernel directory to obtain the register definitions from
+OUTPUT_PATH     output directory, usually the qemu source tree (default: $PWD)
+EOF
+    exit 1
+fi
+
+if [ -z "$output" ]; then
+    output="$PWD"
+fi
+
+awk -f $scripts/arm-gen-cpu-sysregs-header.awk \
+    $linux/arch/arm64/tools/sysreg > $output/target/arm/cpu-sysregs.h.inc
-- 
2.49.0
