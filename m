Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp884402ejc;
        Fri, 3 Mar 2023 02:15:02 -0800 (PST)
X-Google-Smtp-Source: AK7set9WAZE6aaJZr+Jxy7kaPd7AzV4TZu8rEo8ITIDn1aOsmw5mrbmMIP3pP2Qs8A41nG5gi+/o
X-Received: by 2002:ac8:5fd0:0:b0:3bf:d51e:b14 with SMTP id k16-20020ac85fd0000000b003bfd51e0b14mr1666365qta.46.1677838502005;
        Fri, 03 Mar 2023 02:15:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677838501; cv=none;
        d=google.com; s=arc-20160816;
        b=LxFcRiLwztsvqKBXsWs8tcKAA5euTSD1yjVJmPJBz7eBz1IiQhswNOhzkwiivGNdnr
         LVMgZRHbLWLLr+M3NUwP1h9uj/XMt6nxwREgPXhLGhKVGcVBSx16BS54eKjlOdfb5fri
         sqTB71gMcbCUS6NWpoYRHBakqzjPyp0NRQG+4rY2yNOGhhQzp8xIhs+lWan0IKQNynrP
         MHJ4SQdzpTKqDDuXKSE+Mh00nIoqBytK0XfBvuKCXxQKkqvgJnIJRNDbEqxOCE03uoQD
         Ps5RWvxl2NCHNJxlBNz8ngyruDa0kn4mHLMgFk8BXY2FysOaOLP8iDVo26vZhHCiA4xS
         eKew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=DHZuso5/0DhJfAOxX6dvaVSE+Y2aY/gn2NzRTirrpYs=;
        b=MOMWA9DS38c7xKBFz1yXtklRegQOiEYhVqFtxfItL0lqcx9I4jj2UpNdIaLRyI60u8
         dfs/dzJB6eJDFmNwa9w+ZApmywOgl4wxNa3WNwFsdkGAeMNpXzPG44sQmmCmZtSIlwDF
         YryCIx6c0t1QHNzbd+SiFZjZO5QdBzqg/yo6R0vDY5wTMqXC334RBV8fCZYyzjG87ycC
         Bxps9g8zjKEBXFr1dG3dxH0OjkbjxYgsaVT3syaWkvObKtJeNLhpD0gOtLLAGDd8XFWq
         Yz29wVHlcAoB1Qkz1Mbqs3DTE0xG/7MoEHkXiA9H/qJCBLJ4x1q32I7SLDczU6sl99d7
         YhPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ea+5DwFl;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id n140-20020a374092000000b007426fc20ee0si1362840qka.535.2023.03.03.02.15.01
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 02:15:01 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ea+5DwFl;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677838501;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DHZuso5/0DhJfAOxX6dvaVSE+Y2aY/gn2NzRTirrpYs=;
	b=Ea+5DwFlPLXyDJMbqpbpodbcu6KmeOl5tllaFaqdZ7S22qBbKoACTXkuL1vjni1uYyYQ4F
	ColFBr1wDBHBh313dcIvHjtqqLs/OPApI7gtBZTln7i5yg8JfoLbIvJLlYL3KCMPU7lsN0
	vNxah3b+JfGfToAD9cnQ7TmUvURDrZM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-224-mpFHp4drOdGIlxtLMzSiMw-1; Fri, 03 Mar 2023 05:15:00 -0500
X-MC-Unique: mpFHp4drOdGIlxtLMzSiMw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AEE061871D9C;
	Fri,  3 Mar 2023 10:14:59 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.255])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3771B492C14;
	Fri,  3 Mar 2023 10:14:57 +0000 (UTC)
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
	Wilfred Mallawa <wilfred.mallawa@wdc.com>
Subject: [PATCH v3 1/6] docs/about/deprecated: Deprecate 32-bit x86 hosts
Date: Fri,  3 Mar 2023 11:14:47 +0100
Message-Id: <20230303101452.769367-2-thuth@redhat.com>
In-Reply-To: <20230303101452.769367-1-thuth@redhat.com>
References: <20230303101452.769367-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-TUID: HanoOMHLq3of

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
 docs/about/deprecated.rst | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 15084f7bea..f0c1e6b545 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -196,6 +196,18 @@ CI coverage support may bitrot away before the deprecation process
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
