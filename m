Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2947733lft;
        Thu, 23 Jun 2022 06:10:27 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tz3Hq69HFee14QqgUqNyscQMUW9cneXjl56YVL6JVxUOKJAV30BH/7QoBD3cUkGRrQnp74
X-Received: by 2002:a17:907:97c4:b0:711:ea9a:103b with SMTP id js4-20020a17090797c400b00711ea9a103bmr8777454ejc.155.1655989826880;
        Thu, 23 Jun 2022 06:10:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655989826; cv=none;
        d=google.com; s=arc-20160816;
        b=0WLADbs66yqxWCroFEwnGxoSWdLx4223fEM33pbW2NxXAy/csFm53P5uWaqSaJ/gjA
         uIUi/kQ1wm6uatp2r++d2kmi+KQuldrWZtBIJU/zFCTb6V20cpGUqFkRAPYZDYxyWQ/c
         f92Flj+ormtCvtVgd5d4hh85V8GLRL1GkLwz7rjrfAb/W9VRQU17W9FLdLC88by54Avq
         IwzH0l8n9gwB+1sZUeFJcH1ogNqDoIZismfEl5SiCiAHbSjXtZ3S6ZFZjcT0s81OUJk6
         w4jdkemQ4mH7iGJP8izl9Y5Ot5D72oiUz/L1hEz34OLtxahiBjMOqHzWuoyoNhsJRikB
         C+vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=rmoM2sqrNH4gB4OMADyCrtt+JYV77lbslouxb07UaD0=;
        b=qLhTRE4kWu2nloDEjmAQsXC4kqt3iVY8OoapHNZXZKlRZTGVudYH2q/aLy9FcS5AHv
         XQDOvu1Mxje+fhH/+Zniy3nBEQn/pgxmNL0w3jhJW+lg3fLkliNWGDAlDuKtcWvIva3+
         V3zXSQ6A9crhdk9Ben3yv81+J8mT+34yfb+c61pc9a8xq+TgqqdGEnWdjvUcsOS6Twnd
         9DYrh9oVNjBoZV2QNSKK4F35rWELEPreKO96jnv+NAJ3Vh3h+/ipTzel6Z9nLOw6ViVd
         AqNfu4FFJPDm7nRkSIzkxHCmvcVGAgB9n0tvKeP0MO3sSxrKB0PgkL9iloS//rXkcVFS
         UI5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZOv9Z+Ca;
       spf=pass (google.com: domain of drjones@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id j14-20020aa7c40e000000b00435c7624e98si2483632edq.293.2022.06.23.06.10.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 Jun 2022 06:10:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZOv9Z+Ca;
       spf=pass (google.com: domain of drjones@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655989825;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rmoM2sqrNH4gB4OMADyCrtt+JYV77lbslouxb07UaD0=;
	b=ZOv9Z+CamERy+09igdSDh8FrfwnlgW7YgEWF3MROYaaIf55Eunupitv3JbbEU+Ow0T+wZx
	St6iimL5PjE+z1fNmxu7NEG+OG3MvC4zgn9y7PiyBg/ZyqY6sLbyZoGeCE3tvc17/B8Jhi
	5e57xREOPI1ocsIHSKOxDYg1lXSSLUs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-82-l24YVwCaORSxh1PyRf7X7Q-1; Thu, 23 Jun 2022 09:10:22 -0400
X-MC-Unique: l24YVwCaORSxh1PyRf7X7Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B9A538032F6;
	Thu, 23 Jun 2022 13:10:21 +0000 (UTC)
Received: from gator.redhat.com (unknown [10.40.193.109])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 58C5940CF8EE;
	Thu, 23 Jun 2022 13:10:18 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: kvm@vger.kernel.org,
	kvmarm@lists.cs.columbia.edu
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	pbonzini@redhat.com,
	thuth@redhat.com,
	alexandru.elisei@arm.com,
	alex.bennee@linaro.org,
	andre.przywara@arm.com,
	nikos.nikoleris@arm.com,
	ricarkol@google.com,
	seanjc@google.com,
	maz@kernel.org,
	peter.maydell@linaro.org
Subject: [PATCH kvm-unit-tests] MAINTAINERS: Change drew's email address
Date: Thu, 23 Jun 2022 15:10:17 +0200
Message-Id: <20220623131017.670589-1-drjones@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-TUID: FWq0fvMXyALF

As a side effect of leaving Red Hat I won't be able to use my Red Hat
email address anymore. I'm also changing the name of my gitlab group.

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 MAINTAINERS | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index bab08e740332..5e4c7bd70786 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -55,7 +55,7 @@ Maintainers
 -----------
 M: Paolo Bonzini <pbonzini@redhat.com>
 M: Thomas Huth <thuth@redhat.com>
-M: Andrew Jones <drjones@redhat.com>
+M: Andrew Jones <andrew.jones@linux.dev>
 S: Supported
 L: kvm@vger.kernel.org
 T: https://gitlab.com/kvm-unit-tests/kvm-unit-tests.git
@@ -64,14 +64,14 @@ Architecture Specific Code:
 ---------------------------
 
 ARM
-M: Andrew Jones <drjones@redhat.com>
+M: Andrew Jones <andrew.jones@linux.dev>
 S: Supported
 L: kvm@vger.kernel.org
 L: kvmarm@lists.cs.columbia.edu
 F: arm/
 F: lib/arm/
 F: lib/arm64/
-T: https://gitlab.com/rhdrjones/kvm-unit-tests.git
+T: https://gitlab.com/drew-jones/kvm-unit-tests.git
 
 POWERPC
 M: Laurent Vivier <lvivier@redhat.com>
-- 
2.34.3
