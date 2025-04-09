Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp7769162njd;
        Wed, 9 Apr 2025 07:44:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX0SZeSfsv25odxijqWam12wKxbnWj1gOLJf/M75Sz2hfLE9uW7cx3hRI6ozCurzfMm0HdEVcVQxDv76g==@linaro.org
X-Google-Smtp-Source: AGHT+IG6IyZgS5QLKoblIpO35nSnz7w0/26h8bTV4FkCVe5m2NrAfn4pJU30F6wOiZ/hbeLIRALe
X-Received: by 2002:a05:6902:10c4:b0:e5d:c6e8:2e32 with SMTP id 3f1490d57ef6-e702f5f89cfmr4905556276.24.1744209883187;
        Wed, 09 Apr 2025 07:44:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744209883; cv=none;
        d=google.com; s=arc-20240605;
        b=NtN22+5/jep/ImKUlISs9QAtnxDE38SAg3+gEd0vuaKot0ECqG2oj6w2NbyiWZosNJ
         ohdzJ6SX0UxzyDG6sYwyaTe0pYcTWv4U0k1ZN1FVUAXdu5M2F1m1ppxdPZFgLe1HAgDt
         K4y+CRuYFKh3kIfMKYefjyiHs25JkSE5z4DTlwwUhg4GHayHOyTWxQbnvORkSnAsrZuL
         W+gs/KBxtNiNgYCkc8b41UezNzO+Taa7V0+XHhXgZC8peiyvqiBObKyXZdFBwwRPOoWR
         ymhWHrgOtJSJAGlCcoHD4jhPNW34vyvsRORzjvnDMPnbUlOKhphhDxZNogBXNP8mDcgB
         k+lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=KhUgn4/7zQGJ2lgryJzEz6u4zhgrsTQVznT5OXMnSBY=;
        fh=zInp4xe4IkcRrNM2aFMptin5JRRr9I02FEAKlsM82YU=;
        b=PorKlgv7XfO/aio6+jqwRi+oJqEc/XTecId2ArGt/alo9uQ1iYvhmi8jWNLfdCYz+d
         FZOcoQqMIf+zW4XkftqwJYKFExrFnjMtC1Z2kW9IbwBeohYlIusgGQkhLzFOyoDTGox6
         EWIprKqCXiCwUqUnTzvtzLNLp3qv6t8VuoWMsNIMRaWGdAQGGhKgUpnsDig+mRCYcjg6
         NWLsAegLSy6tVESH8JfLGkFBI7nps5QHv59ifXRqkaEACIR2vQSxUM4+eQYYCZ2KkcIj
         /5EsKd1PGx3x5ez3MO4g07A01UyWWQj/nS/34YCRoVJib4XYWwI4n2r3bFAWMvAF3dXn
         bIsQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RIOY354w;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 3f1490d57ef6-e70327bf62asi2012119276.196.2025.04.09.07.44.42
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 07:44:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RIOY354w;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744209882;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KhUgn4/7zQGJ2lgryJzEz6u4zhgrsTQVznT5OXMnSBY=;
	b=RIOY354wXfGui0wjKViBdjUBQl5mDF+knoyijWA0eS7Lt24rwPzNZOv6wd9JmtWFaz3bbC
	j47GbZw/YKMJ+O344DbSRIJdrsoCRhc9hZWEyByB8nHhQVpXA2xuOwlr/KCo6xErRzmkEp
	8nUc+bNosb9FZeGGr56VTPTzJLa7g+U=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-490-Ag9Nj4meMp27dEJ0ESh5cg-1; Wed,
 09 Apr 2025 10:44:37 -0400
X-MC-Unique: Ag9Nj4meMp27dEJ0ESh5cg-1
X-Mimecast-MFC-AGG-ID: Ag9Nj4meMp27dEJ0ESh5cg_1744209875
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 559C119560B6;
	Wed,  9 Apr 2025 14:44:35 +0000 (UTC)
Received: from gondolin.redhat.com (unknown [10.45.227.4])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A1F88180B48E;
	Wed,  9 Apr 2025 14:44:29 +0000 (UTC)
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
Subject: [PATCH for-10.1 v5 12/13] arm/cpu: Add sysreg generation scripts
Date: Wed,  9 Apr 2025 16:43:03 +0200
Message-ID: <20250409144304.912325-13-cohuck@redhat.com>
In-Reply-To: <20250409144304.912325-1-cohuck@redhat.com>
References: <20250409144304.912325-1-cohuck@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-TUID: 36ShW5HMggX2

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
