Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp884519ejc;
        Fri, 3 Mar 2023 02:15:09 -0800 (PST)
X-Google-Smtp-Source: AK7set9ZwJTRh4c3q6A/z+W0s2I/MTkYaEi9J6uh8pW5MyiCsz+UpaGrRlaI0qItGXwGC5SJU1EC
X-Received: by 2002:a05:6402:792:b0:49e:4786:a0e2 with SMTP id d18-20020a056402079200b0049e4786a0e2mr972107edy.14.1677838509072;
        Fri, 03 Mar 2023 02:15:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677838509; cv=none;
        d=google.com; s=arc-20160816;
        b=opMs8IyPv3lXDuqrBkIQUEg7CRovVadgKKsIvhfyEpArljLJeUHW4aAXn16d0YP1tw
         7tYUR2fXFNaX2BM49S18+FsGrOk2MHF88ia43qU15U2EJEojRrqQbsLBopp4DjpudFmv
         kkZ50p/z//VxluFOXxbXdItzXx8uBF3203dr/Cz5d7+oAD3IPbnBkL3c6bDIOAYG1Bej
         fjFOALITOErcVr+Yw6cqszMm4/ZJ4jsvFk0BmkvT+HL7Hufqk+ovZlzPexaSg6jVnBof
         iqbUtZp3P5OfU+qf7RpugmSYC4xdUaqefqTws95bDwXcD/VpQIMGoRnp7vh086Bofi1E
         fICA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ZpA69n947yXoh4gqIJjGzU3sLNRw3vGXKAhlnCotvoU=;
        b=BfrezzNPaNO4KyqpI3mKzsjedTlxHAZHojBCVpKHjOaRcMi0czjxhm0EIAkfr6kVI9
         0p9r8E4/iOYBAa2xtF4mocwWzDvV8cHQaeDUH5JneVqIzn+/XhIv/6E7hjSDX3JVoRta
         94AyR3kae9x8wluTayCna/aFQlCdP9N74Jq7DBig99EQoxNqPuilOSfJTg94BFjyUZiJ
         B52CjY3auC6j6Noml9+fJ0+JMDguMlMPuwyHgv2th/YJymgMPDw18h7jn1b48DLsbJ3J
         X1cwBqDcq93nEaK9XvNt3S/o0cNWDN/BW1zfekY/MtYQ+fd3kyAIpAcllC8swQSRYcNW
         m6Rw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IkIvPd+O;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id ay15-20020a170906d28f00b008bedd21abe0si1784089ejb.567.2023.03.03.02.15.08
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Mar 2023 02:15:09 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IkIvPd+O;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677838508;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZpA69n947yXoh4gqIJjGzU3sLNRw3vGXKAhlnCotvoU=;
	b=IkIvPd+OSyZ5BafAA+vEWMT7583BLZTNJrAjAHFor1n3n2RIffXkSDWvraPsEOD6PdX/Xt
	HF7sOZjXtKzPnlzuEokaa4p7zCidg9LbxcEnWq4y6yAwbAtAQ4w3o9XqQ8wgRweanRDXaH
	L2uF99xAobMSZOzU23CilxrIm/2cUyI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-584--lM7xaz9Md-CoiMDdufbdQ-1; Fri, 03 Mar 2023 05:15:05 -0500
X-MC-Unique: -lM7xaz9Md-CoiMDdufbdQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7C76B1C05B17;
	Fri,  3 Mar 2023 10:15:04 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.255])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6054D492C3E;
	Fri,  3 Mar 2023 10:15:02 +0000 (UTC)
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
Subject: [PATCH v3 3/6] gitlab-ci.d/crossbuilds: Drop the i386 jobs
Date: Fri,  3 Mar 2023 11:14:49 +0100
Message-Id: <20230303101452.769367-4-thuth@redhat.com>
In-Reply-To: <20230303101452.769367-1-thuth@redhat.com>
References: <20230303101452.769367-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-TUID: 9zB+oBBrUsky

Hardly anybody still uses 32-bit x86 environments for running QEMU,
so let's stop wasting our scarce CI minutes with these jobs.

(There are still the 32-bit MinGW and TCI jobs around for having
some compile test coverage on 32-bit, and the dockerfile can stay
in case someone wants to reproduce a flaw locally)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.d/crossbuilds.yml | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index d3a31a2112..b96439146f 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -43,26 +43,6 @@ cross-arm64-user:
   variables:
     IMAGE: debian-arm64-cross
 
-cross-i386-system:
-  extends:
-    - .cross_system_build_job
-    - .cross_test_artifacts
-  needs:
-    job: i386-fedora-cross-container
-  variables:
-    IMAGE: fedora-i386-cross
-    MAKE_CHECK_ARGS: check-qtest
-
-cross-i386-user:
-  extends:
-    - .cross_user_build_job
-    - .cross_test_artifacts
-  needs:
-    job: i386-fedora-cross-container
-  variables:
-    IMAGE: fedora-i386-cross
-    MAKE_CHECK_ARGS: check
-
 cross-i386-tci:
   extends:
     - .cross_accel_build_job
-- 
2.31.1
