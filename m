Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp1980402njc;
        Tue, 11 Mar 2025 09:32:28 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWsI6OM0s7GA1zmb/rWA3uIESq8g3VKa6acjqMZblvHNIDiTHutMybGf9jHQBxA0EQkG8Vz4HsphAfmqg==@linaro.org
X-Google-Smtp-Source: AGHT+IEt65fxmO7Weicf6HSGlUPwBhaDiQmQkRFEj6uevm2C+f75KDIOeNLl+kbX65v9KEbyqlQf
X-Received: by 2002:a05:6214:ca6:b0:6e8:fa33:2965 with SMTP id 6a1803df08f44-6e90061fa6emr247940306d6.14.1741710748603;
        Tue, 11 Mar 2025 09:32:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741710748; cv=none;
        d=google.com; s=arc-20240605;
        b=E4jWKEhrMfEfRRQGA90ix8QtzNAYyFkO18faW6osBMhbNoOWYrJHbvSS9vvGuMlMDL
         BPowC4ldS6pdTq9L96LjsIrT7W+LoeEoRoUMKtlgBKEOODPoewHUMvwy6u1z2tO/VED9
         T3kIZ7Z86FX/2J684zBGXA+Ya33zicBQPK1xX6eB8ohHLG/hgw63EGXEozxxb/QxP9MF
         muIbrfGp/7YyZV/3HFTXsRreQqZV33t+GPsuOuoU4f6dpS5zIsWQYvx9KdJNQ9W049Ow
         /hRDdRt6PnbKFVo8gBpnahjeHelxlWFOhJ1FZY6oSSeqOdzdeNnWR5AEmYESKsP4rCAr
         13mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=W3tvx8qg8MVRqCnGq1PIJ4k1jvpB6TQBqfMA8N0h4F0=;
        fh=zInp4xe4IkcRrNM2aFMptin5JRRr9I02FEAKlsM82YU=;
        b=EoxYalUOM4Hgbhia66z/XdaaP8hdXu0y0AylFi4uKqkglJRGRaflLY+kb/tSOHIndy
         DgmXFrYwc2m5v7BGr++gWibmbRkh2rlO+weHS6QAUY0M+Ia8mkpUiIo/itz+fYt1794i
         5HJ6b2aQcCVhMHst9kThddoFQc9osT1bTA0+0CkyCqIUX1Orx7+uHoyl1Q2LktfDaBIq
         ZKcDXhfvs1VLvPLSlZ/Acn1UMMcxk8PAaoYhzZy+8K0jrTa9ulHWdXrYta4fiH3ZrMYG
         ND9yt7MgSQJJrYyvdo3OG8mCwCrZ/mxo1qwvNLiP5X5qvwBbijDS4oHl+dzZVaTiT65K
         KpTQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MBOeAZ7Z;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e8f74674cfsi111529506d6.462.2025.03.11.09.32.28
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 09:32:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MBOeAZ7Z;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741710748;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W3tvx8qg8MVRqCnGq1PIJ4k1jvpB6TQBqfMA8N0h4F0=;
	b=MBOeAZ7ZinMn/D94YC9ej46lKSQnQGGXxCpd/Z437rxO+Z+n2TKUlnnQ4ZoeP1OB2tnJEY
	4+EsG4ClTFYsDi5tvDKrWnLNc7BkqubCoO1zEpnH3cePISTRiouP+Fzjs21+OKw2lWcDM2
	7pgsKeLqkDY8+EB9Yuxhq244Rn7zCyk=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-413-hyDLPQzjNZ6XKV4qg6Wvjg-1; Tue,
 11 Mar 2025 12:32:26 -0400
X-MC-Unique: hyDLPQzjNZ6XKV4qg6Wvjg-1
X-Mimecast-MFC-AGG-ID: hyDLPQzjNZ6XKV4qg6Wvjg_1741710745
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EA6641956087;
	Tue, 11 Mar 2025 16:32:24 +0000 (UTC)
Received: from gondolin.redhat.com (unknown [10.67.24.185])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2D9EB1828A95;
	Tue, 11 Mar 2025 16:32:08 +0000 (UTC)
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
Subject: [PATCH v3 13/14] arm/cpu: Add sysreg generation scripts
Date: Tue, 11 Mar 2025 17:28:23 +0100
Message-ID: <20250311162824.199721-14-cohuck@redhat.com>
In-Reply-To: <20250311162824.199721-1-cohuck@redhat.com>
References: <20250311162824.199721-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-TUID: xICS/ustm9sP

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
 scripts/gen-cpu-sysregs-header.awk    | 39 +++++++++++++++++++++++++++
 scripts/update-aarch64-sysreg-code.sh | 25 +++++++++++++++++
 2 files changed, 64 insertions(+)
 create mode 100755 scripts/gen-cpu-sysregs-header.awk
 create mode 100755 scripts/update-aarch64-sysreg-code.sh

diff --git a/scripts/gen-cpu-sysregs-header.awk b/scripts/gen-cpu-sysregs-header.awk
new file mode 100755
index 000000000000..d1b440483425
--- /dev/null
+++ b/scripts/gen-cpu-sysregs-header.awk
@@ -0,0 +1,39 @@
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
+	    idreg = 1
+        } else {
+	    idreg = 0
+	}
+
+	print "DEF("reg", "op0", "op1", "crn", "crm", "op2")"
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
