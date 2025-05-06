Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2973787njj;
        Tue, 6 May 2025 01:54:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVtDzoWybktd0aVE6jgj5FwtzTuvlxw2iuENvK8p//MSedqgKfq6GQTEjW7UigPut3TQ9p3ueqWgNy9iw==@linaro.org
X-Google-Smtp-Source: AGHT+IHMh2zCYqzSlty5REnTlJN7I6F7MbC5oXcQIWUzVjkUlXA32oTXm1zekwe4ywfUdAg3VbdJ
X-Received: by 2002:ac8:57c2:0:b0:477:e2d:2ec7 with SMTP id d75a77b69052e-490f2d81674mr38948781cf.33.1746521653624;
        Tue, 06 May 2025 01:54:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746521653; cv=none;
        d=google.com; s=arc-20240605;
        b=e3kbhXnKzOfKjr0MzYyAwh92UiOsBAmjV07LGF5CIFLNY5ojzGHj/s/ODTX78xdkC3
         nxtLX9qileycwAMMl78rCycmieo/fKTryPVMjgkc4ik0JgtljO5e8jP4LB5JabNJhM3x
         m4wQAH59KSXL5yC6tQ4EFlNzPh2xQWH99/rLqTi6tGnnj/JzjhVo72xY33VddwHMkB/C
         zJSbopP1jyT5y6WttWNLk8t+iOhVtq0tPujfaakeefnTwQQR5j8lWkCfNglCsWJ8+R9Q
         mD3DFYbGIrNek8U9+CVraQIb7mz734Minknl4DxPeXYMgw429sIF2RjNtzsYJC1RzvBm
         TEwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=d0LVp9WGvpnSpGKnQ5fjiC3xZMDj9y9IEIxZzZWGpkM=;
        fh=zInp4xe4IkcRrNM2aFMptin5JRRr9I02FEAKlsM82YU=;
        b=jeYKNAxo4tfZwpYuWmv6+0FIDdY4A6/YKF4a+seSXYZdqCPjXe+VY1Quj3gEPZfk4f
         Q1lFuIi4NilxTZhl4ckUS0nKvher1PQjdDF7sG/U3tzUn5sgfPhZJLxPuX3kb24RlPaZ
         sp+tbvquXqpU+wx+BsAOBNKavX09FH1YRoPh1+qh+kxesOa/DJWIr3DHar82vr2vhAv9
         WzFfgKT5iqN5AGcYlBM4D/7gMgAy0tXe3/AO0c6SGkHKxTUQUJBVzTethelCUaBVo/sl
         5jpnnICg1YMo6BT9DMkn4ipgfd2gEnF06FRX0GaPK40d8ZkUZjF/jagdcweOsX2sLwag
         OcPg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="IW/MDNuF";
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-48b98246d06si103215481cf.218.2025.05.06.01.54.13
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 01:54:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="IW/MDNuF";
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746521653;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d0LVp9WGvpnSpGKnQ5fjiC3xZMDj9y9IEIxZzZWGpkM=;
	b=IW/MDNuFAy4SIA3cHx8QfQ8qaU2f4PZYp6hjQ9GUt9LnwMEODpSQgR4nCdiHCiusA3VWFA
	tiTsukNlyu10FQ+6xl503SgzOGv4d+6HPLJKtH7cbnI5EkXIFnDcwXXMLdCfoLLkgyj839
	o0vTI4qLOv/XzTm4QqgojXxPYwiGzNU=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-671-wYe-SC1bPve6_mkefGgkTA-1; Tue,
 06 May 2025 04:54:10 -0400
X-MC-Unique: wYe-SC1bPve6_mkefGgkTA-1
X-Mimecast-MFC-AGG-ID: wYe-SC1bPve6_mkefGgkTA_1746521648
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7FBB31955DD0;
	Tue,  6 May 2025 08:54:08 +0000 (UTC)
Received: from gondolin.str.redhat.com (dhcp-192-216.str.redhat.com [10.33.192.216])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E18F71956094;
	Tue,  6 May 2025 08:54:02 +0000 (UTC)
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
Subject: [PATCH v6 12/14] arm/cpu: Add sysreg generation scripts
Date: Tue,  6 May 2025 10:52:32 +0200
Message-ID: <20250506085234.855779-13-cohuck@redhat.com>
In-Reply-To: <20250506085234.855779-1-cohuck@redhat.com>
References: <20250506085234.855779-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-TUID: WhHrdhjRWFWX

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
2.49.0
