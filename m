Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp885657ejc;
        Fri, 3 Mar 2023 02:16:17 -0800 (PST)
X-Google-Smtp-Source: AK7set/z4h9vmv5ZLXQ7xjPxj9b/AWZZRGdGyHW3d0DHDPvfDjdCRPXif03Fq7IFjSfVFAuoCTx9
X-Received: by 2002:ac8:570f:0:b0:3bf:b504:d5ec with SMTP id 15-20020ac8570f000000b003bfb504d5ecmr2000769qtw.42.1677838577787;
        Fri, 03 Mar 2023 02:16:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677838577; cv=none;
        d=google.com; s=arc-20160816;
        b=JTecBaHFsicptEMbY39o8+OlK1F6pY5MQD/UXpLXDXtTd0mXVwqCIS0iPCa2Vgyya2
         oXm2+mBAeJiH5oxdkReD8IkokbB9jp5ptLNxnHdC2PPjhETWIxmcGGXWTOZdhsRKNvez
         PmD/tOAWaM5FInb/Yu+IdfiynFGfGXDudwG2E93oSNE+cF57G4ney6ZCCY5Rde48ci71
         H2WNbaHSe+HhCe3M1pR9hY1NCK8KeUiPwW3s6CJiQyYSMimWkV3Vv+8zKIIvlVIcHWIT
         Te+6mFErIK3ZxlW4+cET64tKxYiOmpgiQneMK16qLkoCrWR+n9Yx939IlC6Uc4gflR5g
         5CYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=VsyNx8S0oHx7gbsAqA7uqjFZbAUv+nmUJaK3qsCgNpc=;
        b=TOJ2bNUZV/kJkjAVGq1zll06FAjiD2a5rNtVMOsZRi7M2qP5ZPaPMYJhUF45GzcxwD
         olz6mDGEK27ny+bPuIYOZsC9wgJODNK68KALdrqPRX7YZ4xQc+B4YcljKojfjUgehRQQ
         BbCPI/ZxvvI6i6ZpP4VDGHeHByjIGJcsHYoYps3sTB/q0YOrvm061Y6Akwl+/qAtBpPP
         kN5HCRKvH38WOy2RMk5T0BvOlzKJF0rhLdrfNSwZJzRshDJZUBxCdPoJwMqGeC/I64im
         yKLkxmKoscBOwVXdXnDJhJ2+TDVu46RCI8X7PnpxwFm7Ap4it2saBUnZsscLYksa2fyh
         lzgg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="ZhrG/s9C";
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id v11-20020a05620a0f0b00b00742704aed0dsi1674548qkl.71.2023.03.03.02.16.17
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 02:16:17 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="ZhrG/s9C";
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677838577;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VsyNx8S0oHx7gbsAqA7uqjFZbAUv+nmUJaK3qsCgNpc=;
	b=ZhrG/s9CN6MAnaiOpBLgC23j4+OXuODt90kJgNXS5i3CuDVF48FGXKXEnxeFwzx1HIedpJ
	z6PyapQ5DMn3LAlYmpLfHmWPw19TnUkwUEQjg/r8Br2OR/lsRbJjkIELyJgtoT1L9P3XIU
	KIEJ0ocCC56NKjmDldG2LY2v44VvqfA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-287-busq1su_NymslZNVzzrKCw-1; Fri, 03 Mar 2023 05:15:09 -0500
X-MC-Unique: busq1su_NymslZNVzzrKCw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4FA5A1C05EA9;
	Fri,  3 Mar 2023 10:15:09 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.255])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2B304492C18;
	Fri,  3 Mar 2023 10:15:07 +0000 (UTC)
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
Subject: [PATCH v3 5/6] docs/about/deprecated: Deprecate the qemu-system-arm binary
Date: Fri,  3 Mar 2023 11:14:51 +0100
Message-Id: <20230303101452.769367-6-thuth@redhat.com>
In-Reply-To: <20230303101452.769367-1-thuth@redhat.com>
References: <20230303101452.769367-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-TUID: cwBltrS5HX2P

qemu-system-aarch64 is a proper superset of qemu-system-arm,
and the latter was mainly still required for 32-bit KVM support.
But this 32-bit KVM arm support has been dropped in the Linux
kernel a couple of years ago already, so we don't really need
qemu-system-arm anymore, thus deprecated it now.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/about/deprecated.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index e2e908f84d..1b7b3da309 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -45,6 +45,16 @@ run 32-bit guests by selecting a 32-bit CPU model, including KVM support
 on x86_64 hosts. Thus users are recommended to reconfigure their systems
 to use the ``qemu-system-x86_64`` binary instead.
 
+``qemu-system-arm`` binary (since 8.0)
+''''''''''''''''''''''''''''''''''''''
+
+``qemu-system-aarch64`` is a proper superset of ``qemu-system-arm``. The
+latter was mainly a requirement for running KVM on 32-bit arm hosts, but
+this 32-bit KVM support has been removed three years ago already (see:
+https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=541ad0150ca4
+). Thus the QEMU project will drop the ``qemu-system-arm`` binary in a
+future release. Use ``qemu-system-aarch64`` instead.
+
 
 System emulator command line arguments
 --------------------------------------
-- 
2.31.1
