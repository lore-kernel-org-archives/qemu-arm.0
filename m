Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp884625ejc;
        Fri, 3 Mar 2023 02:15:14 -0800 (PST)
X-Google-Smtp-Source: AK7set/SC+wGIL0oT+YxPGQcW/V4MNQUG8Lu4w7AykIRxZaL8W4Blj2zOGmRqSM9jcSF20ZxQMtC
X-Received: by 2002:a05:6214:21cc:b0:56e:b1d2:9c2a with SMTP id d12-20020a05621421cc00b0056eb1d29c2amr1801226qvh.28.1677838513953;
        Fri, 03 Mar 2023 02:15:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677838513; cv=none;
        d=google.com; s=arc-20160816;
        b=QiR/og+KKePBfahUOjbkdWUrWTxYhqvIl9T09Kl5nHX5d/C2PjgXV7vdgyLF+DuxlH
         JUwHI7aDDlq1qtjBvIAdnVI8AqAH3yIK4TbSumdjXWa6GwGcAsDAOvgR5LAJ1rQpH0K4
         iCZHW4PveRDDspLHaZDhe4HqP+vWTGYXL5c7h2/Mq5H2dxIRHBmK3aZFfuHy2meuT3eZ
         G9XS3h2X/8FRWwNldUROjD0umLXIQEUs2vtoYkepiwD+NgCiJfKEo0+JkBmwYVORgND5
         ke1HnQXTUroCGpdRMthauvtrNQrIzfyAhHOobadSwKaXa6j2hUENIjpK77cDkj334JyS
         UyWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=TA8n6cCaxiG/TrAIzxGyTy420i7qS2ZnxNV585T25Zs=;
        b=UJHuL5R/qaHFVxa2wegnUHuewLjuFjfsX9LHlIZw+QByszPyTMltE/ci418Lw88CHy
         gqo1GqIZw8h/WICTiCUIPo0u+QELi3Z0kU8OxGtPiMS68Qe9XYq+BJRTrZEJ85cB7yej
         Y9Wk2Zkp/S5ZdPQbMxR7uFUMF5IfrjXKDQ3vJEr9XUt6q4s2nitupRQrU2gWA8PJ9zi+
         tud5AhdxxF5L5PK4QeOnkAgmonXdikKdF0utFI2j1kBdP3dJpYYlt1xzluYi8CDKgCRT
         SGKtmgcBjxtqUjcGPunbQckW7NMRhYAGgZF63f94y/AjdYgFoXVDl4ZwdwrK3NaaEd+e
         /3bg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PWPVzlBz;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d4-20020a0cf0c4000000b0056eb1bfcb15si1197380qvl.76.2023.03.03.02.15.13
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Mar 2023 02:15:13 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PWPVzlBz;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677838513;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TA8n6cCaxiG/TrAIzxGyTy420i7qS2ZnxNV585T25Zs=;
	b=PWPVzlBz6yuhliKMI4HGZzrTdiZMifX3cg0BmSHHKj9wqHe6IRdgaDuxKZIcOgmZUrQD9n
	svWR6xZVbyaRrw97OCIGv/+0HblvYxvHEm04xnYTy5Ikoup/fSAPIZJO89DUV0gGPrcHPA
	EdR25JT5i0UFOAQGeCPRe+B5nfwWclc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-509-bZLmghJgM0iRuMfk4t6oHQ-1; Fri, 03 Mar 2023 05:15:12 -0500
X-MC-Unique: bZLmghJgM0iRuMfk4t6oHQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B90173C0F361;
	Fri,  3 Mar 2023 10:15:11 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.255])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 90C90492C14;
	Fri,  3 Mar 2023 10:15:09 +0000 (UTC)
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
Subject: [PATCH v3 6/6] gitlab-ci.d/crossbuilds: Drop the 32-bit arm system emulation jobs
Date: Fri,  3 Mar 2023 11:14:52 +0100
Message-Id: <20230303101452.769367-7-thuth@redhat.com>
In-Reply-To: <20230303101452.769367-1-thuth@redhat.com>
References: <20230303101452.769367-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-TUID: ZA++TT560XII

Hardly anybody still uses 32-bit arm environments for running QEMU,
so let's stop wasting our scarce CI minutes with these jobs.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.d/crossbuilds.yml | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index b96439146f..d1feca9f9f 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -1,13 +1,6 @@
 include:
   - local: '/.gitlab-ci.d/crossbuild-template.yml'
 
-cross-armel-system:
-  extends: .cross_system_build_job
-  needs:
-    job: armel-debian-cross-container
-  variables:
-    IMAGE: debian-armel-cross
-
 cross-armel-user:
   extends: .cross_user_build_job
   needs:
@@ -15,13 +8,6 @@ cross-armel-user:
   variables:
     IMAGE: debian-armel-cross
 
-cross-armhf-system:
-  extends: .cross_system_build_job
-  needs:
-    job: armhf-debian-cross-container
-  variables:
-    IMAGE: debian-armhf-cross
-
 cross-armhf-user:
   extends: .cross_user_build_job
   needs:
-- 
2.31.1
