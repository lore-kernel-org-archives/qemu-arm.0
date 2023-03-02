Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp8409464ejc;
        Thu, 2 Mar 2023 08:31:23 -0800 (PST)
X-Google-Smtp-Source: AK7set+UdwAW0yO5YrNg1JoH5CdU0yApumfcnjC+K64KrQPUn9lDQbVyOob7TSZGLQ0CYFlEQHjb
X-Received: by 2002:a67:f897:0:b0:412:a93:ec50 with SMTP id h23-20020a67f897000000b004120a93ec50mr5861724vso.29.1677774682858;
        Thu, 02 Mar 2023 08:31:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677774682; cv=none;
        d=google.com; s=arc-20160816;
        b=hKx6orsOvjLLV1FfehBujLPNJhkzQWtFjXcW4eSa3SsJKG+bcxnlaOvUG5n54kNSn+
         N18vXRfjrXbRkAEy61HeI5iKgUwFdQgK8GFv3eyji6oIgGuUYzgv/l40mPc44nHK18eR
         VfqDPBSsQtS8+L1NdHHgtO8XZh4Sdwn3tCZVeq6wN27cjD2vjTCfjw2nkmfFiapgaro5
         BSCg7flb83U6xovtjdxRFMZLCNGV9ny0dhkGCzeclYNQjWH9HSzjC/v0leqGY2XpaK8D
         XgJUR7wsNVTSaTaz+5yHiYQCNN8YDul5mu7s18IBlPKBxpKhcPfX19G43guNU+A67JMC
         EP+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=UosB4aUxpi/5dWz6XRm7RMey1SsdH1cuc7g1it7tUeE=;
        b=SZJIwJxls20psbmElc5xVzqpXwYMP1gYZoJpdfS8M0+rTLycXa7WSoQ5tQRJ66d2QS
         LFAo9AmvXqKiVCS9fCCxvRpcJr60b1/shkYtiRsAESIUNpxPRwgfwZKAukFob/nhVmiq
         6AphG//aVsshjWkMPv/SUyuAomE++69HIVBeF9GJFJWeNcbahFQVS2FUsQoI53zEBm7h
         km8I1SPJacIdFAb3qnYdXWbL+GwO7SMlDJS8jYBBMT21Pndt9Q/FF+1TvOWwOC5TVOQK
         ZLGOSBIT2Xzbl1jfDp0+yphGCMj9fGCkiZ+ULw2zZIsb3+abOGzBltCscBlJxPMaFlbR
         D46w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Co0OSiG7;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id w15-20020ab0650f000000b0068a56e48208si5013785uam.4.2023.03.02.08.31.22
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Mar 2023 08:31:22 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Co0OSiG7;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677774682;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UosB4aUxpi/5dWz6XRm7RMey1SsdH1cuc7g1it7tUeE=;
	b=Co0OSiG7yh2Lw8ZV2THS+LjQmjMyh3ZwKRTSWTDu2WGq+XAhLCZ4CEgyqs973NnP8Sya+s
	A7LBiSwSG5+B5KN7Tj/byfAqG3ZM7Fh7K5xHcgCI7lB5zxQaVFnJ6/e43cUPCNvlAbGAnO
	kOv6Big/noLBZb6VhnC68NELRfLqFtw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-436-ljrgtJZkOLWCI0Dxai-ocQ-1; Thu, 02 Mar 2023 11:31:19 -0500
X-MC-Unique: ljrgtJZkOLWCI0Dxai-ocQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 870D1802D38;
	Thu,  2 Mar 2023 16:31:18 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.93])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 443AE400EA93;
	Thu,  2 Mar 2023 16:31:16 +0000 (UTC)
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
Subject: [PATCH v2 3/6] gitlab-ci.d/crossbuilds: Drop the i386 jobs
Date: Thu,  2 Mar 2023 17:31:03 +0100
Message-Id: <20230302163106.465559-4-thuth@redhat.com>
In-Reply-To: <20230302163106.465559-1-thuth@redhat.com>
References: <20230302163106.465559-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-TUID: jzx8KHJ/Z2b2

Hardly anybody still uses 32-bit x86 environments for running QEMU,
so let's stop wasting our scarce CI minutes with these jobs.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.d/crossbuilds.yml | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index 101416080c..3ce51adf77 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -43,22 +43,6 @@ cross-arm64-user:
   variables:
     IMAGE: debian-arm64-cross
 
-cross-i386-system:
-  extends: .cross_system_build_job
-  needs:
-    job: i386-fedora-cross-container
-  variables:
-    IMAGE: fedora-i386-cross
-    MAKE_CHECK_ARGS: check-qtest
-
-cross-i386-user:
-  extends: .cross_user_build_job
-  needs:
-    job: i386-fedora-cross-container
-  variables:
-    IMAGE: fedora-i386-cross
-    MAKE_CHECK_ARGS: check
-
 cross-i386-tci:
   extends: .cross_accel_build_job
   timeout: 60m
-- 
2.31.1
