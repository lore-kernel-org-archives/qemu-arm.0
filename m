Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp8409694ejc;
        Thu, 2 Mar 2023 08:31:32 -0800 (PST)
X-Google-Smtp-Source: AK7set9Q71JVprrS2uCep6IBH7Ux50dMLntUUfXnZ/Ttvf4+yOIA9tonkie3KmRovyhFCeo5KISa
X-Received: by 2002:aa7:cd07:0:b0:4ad:7c44:35fc with SMTP id b7-20020aa7cd07000000b004ad7c4435fcmr11387953edw.6.1677774692391;
        Thu, 02 Mar 2023 08:31:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677774692; cv=none;
        d=google.com; s=arc-20160816;
        b=ZVF/fcOPvRmmOmAHoyww5Rr9d5xSBmTV+d6o+ETairsUC2OaB9FCcoy4QS1fqV1fZb
         eRRimo/c4tSOgQ5qlBzUi8mJ8zRIL0soL+p+kRURs93tk270vtndU+YmhZ9FsVQM/Kla
         1g+oJxyyCQnzj0PaNQzlD/3E8VkS6RSOlGBl7yJlBeybR6NARPJV+EKzJOJBoF7lnR09
         c38/eZ7Izu1+3cwOu/a5LgTij7o5n+Td8C58eK6B2aCE8eU+KVdj5+WaGcebhv22LPWg
         9E0d+8SCWnj1viHczsK42MC6OQ/GH7dJXFVhbZEAJS1uE2JwghZyFzYIIWpJeahPQejx
         z+0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=iwI738OIIkLAwRHwvOimrO1YGLXhalSEzhssZIG8uVE=;
        b=NKjpWJONzVF4pKLQq1ZzogXEOkGQ27A2rdAyDMvbnu5wL3pdCpehmZtj4IZa+5bqGw
         b45EIPC8ghcPVf5aggbn1YuQAzX646fh9fi6qoIrvZJjFnafwfhKhdDlbNu4ienEuZfE
         aATSB98gSq5eWMltkBpEZV5kYU29qwVmjCyMxPhvlCey6bxlTkjdnJiyQ0n0tM70dCR9
         zJ7eNOsTOXYXquLi4BmolF6oeiOjrW/b0y6bDSiDe1qL3ELdF6E9NlfA/8NdUJfIpCIB
         lwcmx41QdXUimR0NaApwBxO8Csl4AQ6vySSQjNoHRnzeoAOAW2lQ8HP/BPv2kEbJ5C0w
         Ag+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KP0Fjy0k;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id cw23-20020a170906c79700b008cc93fd1626si17427021ejb.954.2023.03.02.08.31.32
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Mar 2023 08:31:32 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KP0Fjy0k;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677774691;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iwI738OIIkLAwRHwvOimrO1YGLXhalSEzhssZIG8uVE=;
	b=KP0Fjy0kZdSV/8/iACeMPCthcGL0olA7G6dUlolUD8TUmyJrY00mqrxDyIEfbhzZxuYRnu
	dtWzk5Oe+huvgm1USHX8vSNmq3jjSplgvNq1Xjs8B+T7nSkLIIMRY0AHWqu39pwIk+ekGp
	fsLVbB6VDsU5l5vbpTElJSNVDwDn3Vk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-370-Jq8Nao8XNiSn3fIGaKZl_g-1; Thu, 02 Mar 2023 11:31:26 -0500
X-MC-Unique: Jq8Nao8XNiSn3fIGaKZl_g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 74665811E6E;
	Thu,  2 Mar 2023 16:31:26 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.93])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 21E2C400EA93;
	Thu,  2 Mar 2023 16:31:23 +0000 (UTC)
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
Subject: [PATCH v2 6/6] gitlab-ci.d/crossbuilds: Drop the 32-bit arm system emulation jobs
Date: Thu,  2 Mar 2023 17:31:06 +0100
Message-Id: <20230302163106.465559-7-thuth@redhat.com>
In-Reply-To: <20230302163106.465559-1-thuth@redhat.com>
References: <20230302163106.465559-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-TUID: C637zxmHtZ/k

Hardly anybody still uses 32-bit arm environments for running QEMU,
so let's stop wasting our scarce CI minutes with these jobs.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.d/crossbuilds.yml | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index 3ce51adf77..419b0c2fe1 100644
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
