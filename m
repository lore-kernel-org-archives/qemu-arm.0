Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp3483241njc;
        Wed, 26 Mar 2025 10:41:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWbghUu3FFI/VpROcnVm4SXPDP4HjifwprYqbdhz+sIhAYbuXb0gtN5RtKS/w46ur9dKqRJ3mYA59Bgig==@linaro.org
X-Google-Smtp-Source: AGHT+IGXYkC0FljuK4QVhhk3EMfsabLK/7J1s+gLgWRaumhPKr7O/VRvJrxcoyY4QimSjiQeA63S
X-Received: by 2002:a05:6214:234f:b0:6e8:f166:b1a0 with SMTP id 6a1803df08f44-6ed2394319fmr4180606d6.36.1743010871626;
        Wed, 26 Mar 2025 10:41:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743010871; cv=none;
        d=google.com; s=arc-20240605;
        b=AmIXHujtRxjcoqaapCr0jPAQpSe/v7jqj/f80SysQn9Z8IahbsXaOUzuy6gcfKrVc2
         JBXBCI6h/ILS9um+2QMEwDRXpycXT3MeLpFTF35wYMlmGwX3nZLyf0MEr7oR5/W2jF4E
         pqOvxbDwx1hl514qwtvdFnYiCtioY/f5O2Fr8roxNXFlkW2NQCFNwuoWvokkQqkBRIOU
         SCX5W8pLbK+PGNdpsINZ3L14X4fkVJd+qeO5kxv0/7UqJ7cz+7XdmKWds7T9aIH/22wb
         QeH7RU/YbnO7kkyCo0NVOagjdLiqFnR6vh/nCQJeSv3Cw/NKRXZl8HEHmKrbwTYyBiV0
         uYXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=KhUgn4/7zQGJ2lgryJzEz6u4zhgrsTQVznT5OXMnSBY=;
        fh=zInp4xe4IkcRrNM2aFMptin5JRRr9I02FEAKlsM82YU=;
        b=cvAKsGcK/vTPzNqcWEMOC/KPG1oi+Yv0l88SUUsOTIXRyWGsRviJi+Kjz3d2zV15v8
         giDKfaMiZu15I7obVSIS+rod3NnKFy+cwQGjnT4HrnmekLBDDr6xA4aNyMuGlbdeHdBZ
         3Scn2AWigSejI1BReNCGzaWWpznc3bEmTwzbQWr4tI2eNJ8cLhS/wLPMzEbDptOc4YxR
         FWCK4TU5a7S/Xw9nAkYLR4X9CU6fSTOaHc5Ov6N6rYPzhDpgBEnflM8wVBohV1IVHdw0
         nUMs14adZJZ1P4cB1SpbTp+hRJu15uRWhsek+eWAUHaANpDhdXelUJrluoljmrl+kqbc
         JX2Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EKsBbFQ1;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6eb3f01a4f8si117848736d6.299.2025.03.26.10.41.11
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 10:41:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EKsBbFQ1;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743010871;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KhUgn4/7zQGJ2lgryJzEz6u4zhgrsTQVznT5OXMnSBY=;
	b=EKsBbFQ1GaepJ4NC5P3ZpKmjjb8a4OGLglGLJP6atGv0Is9EdTBKdSn3ju1UJWmmGmaM+Q
	OyK+TpcTLbx9yvFytmdFIwVE/PTvA7HNGXed3VgoMiSS6gkfhtp0WaQ/ul4WN74ImqoAd5
	waAU1z1G9ED4PhEVaz58AqykMtAqujE=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-477-CQ6NefqcPT2EHJBqF-lQYw-1; Wed,
 26 Mar 2025 13:41:08 -0400
X-MC-Unique: CQ6NefqcPT2EHJBqF-lQYw-1
X-Mimecast-MFC-AGG-ID: CQ6NefqcPT2EHJBqF-lQYw_1743010866
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E382A19560B0;
	Wed, 26 Mar 2025 17:41:05 +0000 (UTC)
Received: from gondolin.redhat.com (unknown [10.67.24.38])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 04E6C180B489;
	Wed, 26 Mar 2025 17:40:50 +0000 (UTC)
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
Subject: [PATCH for-10.1 v4 12/13] arm/cpu: Add sysreg generation scripts
Date: Wed, 26 Mar 2025 18:37:22 +0100
Message-ID: <20250326173723.389988-13-cohuck@redhat.com>
In-Reply-To: <20250326173723.389988-1-cohuck@redhat.com>
References: <20250326173723.389988-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-TUID: FhB57/2lRVmi

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
 scripts/gen-cpu-sysregs-header.awk    | 35 +++++++++++++++++++++++++++
 scripts/update-aarch64-sysreg-code.sh | 25 +++++++++++++++++++
 2 files changed, 60 insertions(+)
 create mode 100755 scripts/gen-cpu-sysregs-header.awk
 create mode 100755 scripts/update-aarch64-sysreg-code.sh

diff --git a/scripts/gen-cpu-sysregs-header.awk b/scripts/gen-cpu-sysregs-header.awk
new file mode 100755
index 000000000000..b6b207e3c0fd
--- /dev/null
+++ b/scripts/gen-cpu-sysregs-header.awk
@@ -0,0 +1,35 @@
+#!/bin/awk -f
+# SPDX-License-Identifier: GPL-2.0
+# gen-cpu-sysregs-header.awk: arm64 sysreg header include generator
+#
+# Usage: awk -f gen-cpu-sysregs-header.awk $LINUX_PATH/arch/arm64/tools/sysreg
+
+BEGIN {
+    print ""
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
+	if (op0 == 3 && (op1>=0 && op1<=3) && crn==0 && (crm>=0 && crm<=7) && (op2>=0 && op2<=7)) {
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
index 000000000000..721f41a9a516
--- /dev/null
+++ b/scripts/update-aarch64-sysreg-code.sh
@@ -0,0 +1,25 @@
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
+awk -f gen-cpu-sysregs-header.awk \
+    $linux/arch/arm64/tools/sysreg > ../target/arm/cpu-sysregs.h.inc
-- 
2.48.1
