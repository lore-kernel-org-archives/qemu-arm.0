Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp8409401ejc;
        Thu, 2 Mar 2023 08:31:20 -0800 (PST)
X-Google-Smtp-Source: AK7set84kqQ/eE1Mr9fES4OsxKt+1smd2TFF9q/atGJZFlCwur6h3YSmWuRBf55sfvDsfPuaTGn5
X-Received: by 2002:ac8:5bd6:0:b0:3bf:b8ae:fa7d with SMTP id b22-20020ac85bd6000000b003bfb8aefa7dmr19124045qtb.55.1677774680184;
        Thu, 02 Mar 2023 08:31:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677774680; cv=none;
        d=google.com; s=arc-20160816;
        b=amhaC4mP/Y5uC0E6iHiFzvIBvrDenTOnc7/NEawk7DF8avBzbsdh5x4h0iGnfVZJOy
         9WiTbzc5iTTJTcAMuZ3g+fAsU9yYcB7BmzLH2LLzRvBKDFotf079eZ32Bqy3EDYQH68e
         zpjdGO/xweAbiPaeGyF9/iPC/PRrZbGJ9hkI1TyL0qECdpr93s4CUslqJ2Vx1q8rAK33
         53lX0GlDwj+pjUao2bXdpCgU3INhzVFkxu8fNJJ1inYA97x1yvQ3qMoMkcSel4r4WMXq
         IvtxWWsbyvD6gDIJVWf8o3SxQsvtS8HBw9PGJnlvWO00cNtLlnd4ACTSJFEiSv+1f0+C
         W11g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=3psyEgJRau2Jh1sB5FoWnPWnwz10rj9WAfK8OXPQ0lI=;
        b=NyD0SipiKgPChd6g16RcSZt8wLB69nPNS4ImY9fVjXNUFvy1u1/CpDsCQ0Otv/JINs
         1Aam6o2VmEW4n+lcsnJS081k4/3bG8zYVeGszjnD7aScKvb7Rux6a+XIUvs/VYstg5YW
         5THcCqWl7x+8QSdpQziIwS10fZ8KxlsiMf63CxgMg7yAltdpWypMvWMtk85R9r9CU39K
         K3C/75i6aeZRIUFDocc8c6Bw3hDjVeFZZ4HyRQhSaodVpw0MYXR3Gr67cSbSUjRcT1d6
         jkHf8Blmxx4dpifB1yeRC4wjIMvlUlLqksYRpt5EXjGCoTHSam9iEwXUzXqJCjNdrO+q
         Ik/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LHKGtQjn;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id a20-20020a05622a02d400b003ba1d2fd43bsi13142225qtx.195.2023.03.02.08.31.19
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 08:31:20 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LHKGtQjn;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677774679;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3psyEgJRau2Jh1sB5FoWnPWnwz10rj9WAfK8OXPQ0lI=;
	b=LHKGtQjnsBGqMoAminepeLVN4MLwuBFl5nke6s7Orf5OTiIO9AVwdWrJMD78FF8uWYxvUz
	TdQZ73JwPX56ArQMpBeuPai6X+IXRH5qOceV3nUeROA1BI/jkEXGRPQCLBf2yiob2nt/+H
	Udl35ry5Pb7hfDPxWlWrVvi6PogCtOE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-112-FcfOwdQLOLq8Nr9yu7kRsA-1; Thu, 02 Mar 2023 11:31:16 -0500
X-MC-Unique: FcfOwdQLOLq8Nr9yu7kRsA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E59C9802C18;
	Thu,  2 Mar 2023 16:31:15 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.93])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 697CD400EA93;
	Thu,  2 Mar 2023 16:31:13 +0000 (UTC)
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
	Reinoud Zandijk <reinoud@netbsd.org>
Subject: [PATCH v2 2/6] docs/about/deprecated: Deprecate 32-bit x86 hosts
Date: Thu,  2 Mar 2023 17:31:02 +0100
Message-Id: <20230302163106.465559-3-thuth@redhat.com>
In-Reply-To: <20230302163106.465559-1-thuth@redhat.com>
References: <20230302163106.465559-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-TUID: M8uvQH8KqU0q

Hardly anybody still uses 32-bit x86 hosts today, so we should start
deprecating them to stop wasting our time and CI minutes here.
For example, there are also still some unresolved problems with these:
When emulating 64-bit binaries in user mode, TCG does not honor atomicity
for 64-bit accesses, which is "perhaps worse than not working at all"
(quoting Richard). Let's simply make it clear that people should use
64-bit x86 hosts nowadays and we do not intend to fix/maintain the old
32-bit stuff.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/about/deprecated.rst | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 11700adac9..a30aa8dfdf 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -208,6 +208,18 @@ CI coverage support may bitrot away before the deprecation process
 completes. The little endian variants of MIPS (both 32 and 64 bit) are
 still a supported host architecture.
 
+32-bit x86 hosts (since 8.0)
+''''''''''''''''''''''''''''
+
+Support for 32-bit x86 host deployments is increasingly uncommon in
+mainstream OS distributions given the widespread availability of 64-bit
+x86 hardware. The QEMU project no longer considers 32-bit x86 support
+to be an effective use of its limited resources, and thus intends to
+discontinue it. Since all recent x86 hardware from the past >10 years
+is capable of the 64-bit x86 extensions, a corresponding 64-bit OS
+should be used instead.
+
+
 QEMU API (QAPI) events
 ----------------------
 
-- 
2.31.1
