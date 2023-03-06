Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4393245ejc;
        Mon, 6 Mar 2023 00:47:11 -0800 (PST)
X-Google-Smtp-Source: AK7set97bPyOMO92W5CPWhkajNyXp7GeIIkCp+aIBpez25J5/pDoJNx7oYnaHL5g9rhf15jlRV7P
X-Received: by 2002:a17:906:3087:b0:8b1:7eda:702e with SMTP id 7-20020a170906308700b008b17eda702emr10467700ejv.32.1678092430963;
        Mon, 06 Mar 2023 00:47:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678092430; cv=none;
        d=google.com; s=arc-20160816;
        b=DhpUS3X4DDquBrfrpIxYDA9FdxzxD7/WbHZoSVv1DUXZLni92oPUyJrB6J4tEzSc/U
         Cr1jB2jlSEEe2S/aJESowXBGepXCXpEdFh3DLMrnAVH6NmT/H5r7nKGl2QOJm1yrnTpt
         WS34fXHMRCKzMjByfK6cKTJlcoZyS+ke2jZd21DO+2IA1h9sxAotQjuOShftXgqbAxD9
         pORsgsRcYOuTFF4PMM43VIRxyuXPk09qtHFiTyrXIEix5F+J/uq/gp2aPsBg63oZ6AcM
         Yp1LmZL0Y4NYDQKFxn8OMl+fEQ3z2F+A34d7twIlW6hKjQYnSMLA5diyX3qg8L1GiLYp
         wJhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=sHwLHNH3FPXXpeNzRTV2uFlinD5O4VAUvDUShaonn/I=;
        b=LYoa5BpMZ+fVRU4t43SYHwvjiASKFstMXoNKgS2L9McC9BH3WcRwWWbckkTT3QtlPE
         Xy40mCcmbubVnS8kIYAp/vqkFuUkB9aQBgNMHmLCPv/JDZqBNpAtTqpso5XftHO+nPPM
         l2QalVHcxnUvtexEuPMno0tghS4WuRi2OBLZY9G9ZZTtulsqflEVmrQlyXY3huR+TdFY
         OGfBHwGYgpi8oheVVuVWJdjMb5YKtBB5LVFhAFob/I/lAD4Egidjd8sJP1qR+7hjxAG4
         Px36frYz/Z9ufqtEKQuTRAQRvi58AwoRmdaxs48fec1yaw+BPoJQFtyPGhk9srin1a+y
         Aylw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id o22-20020a056402039600b004bbceaaceafsi9199305edv.170.2023.03.06.00.47.10
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 00:47:10 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-480-BweyhluRMwuANh_BPVGZnA-1; Mon, 06 Mar 2023 03:47:06 -0500
X-MC-Unique: BweyhluRMwuANh_BPVGZnA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6AB3C1C05EB7;
	Mon,  6 Mar 2023 08:47:05 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.101])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 21233440DE;
	Mon,  6 Mar 2023 08:47:02 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Daniel Berrange <berrange@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	Maxim Levitsky <mlevitsk@redhat.com>,
	libvir-list@redhat.com,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: [PATCH v4 1/5] docs/about/deprecated: Deprecate 32-bit x86 hosts for system emulation
Date: Mon,  6 Mar 2023 09:46:54 +0100
Message-Id: <20230306084658.29709-2-thuth@redhat.com>
In-Reply-To: <20230306084658.29709-1-thuth@redhat.com>
References: <20230306084658.29709-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-TUID: wY3gQ1CDHS2Y

Hardly anybody still uses 32-bit x86 hosts today, so we should start
deprecating them to stop wasting our time and CI minutes here.
For example, there are also still some unresolved problems with these:
When emulating 64-bit binaries in user mode, TCG does not honor atomicity
for 64-bit accesses, which is "perhaps worse than not working at all"
(quoting Richard). Let's simply make it clear that people should use
64-bit x86 hosts nowadays and we do not intend to fix/maintain the old
32-bit stuff.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/about/deprecated.rst | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 15084f7bea..1ca9dc33d6 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -196,6 +196,17 @@ CI coverage support may bitrot away before the deprecation process
 completes. The little endian variants of MIPS (both 32 and 64 bit) are
 still a supported host architecture.
 
+System emulation on 32-bit x86 hosts (since 8.0)
+''''''''''''''''''''''''''''''''''''''''''''''''
+
+Support for 32-bit x86 host deployments is increasingly uncommon in mainstream
+OS distributions given the widespread availability of 64-bit x86 hardware.
+The QEMU project no longer considers 32-bit x86 support for system emulation to
+be an effective use of its limited resources, and thus intends to discontinue
+it. Since all recent x86 hardware from the past >10 years is capable of the
+64-bit x86 extensions, a corresponding 64-bit OS should be used instead.
+
+
 QEMU API (QAPI) events
 ----------------------
 
-- 
2.31.1
