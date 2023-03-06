Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4393270ejc;
        Mon, 6 Mar 2023 00:47:15 -0800 (PST)
X-Google-Smtp-Source: AK7set+2AKV2JyneS2x//z049EkMsFNh8YtIJnxalkeqhj2dhZAbIBJ+CnqzlGLbG4N/AGy6nsEt
X-Received: by 2002:a05:622a:58d:b0:3b8:118d:83d9 with SMTP id c13-20020a05622a058d00b003b8118d83d9mr15455211qtb.4.1678092434859;
        Mon, 06 Mar 2023 00:47:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678092434; cv=none;
        d=google.com; s=arc-20160816;
        b=DDvPZiX7Xa9OuhhELpCpyCIKXZVxnixOJuIxcKKbZ/+Yjp6BkN/hBnCyxaC9ietA2G
         zlPOnU2QFrzmerLb28YiFMCK6UJ4snFfgM0ctBZSPFaUR57r2v663yg8kCQd3gSrxg4U
         EJ1LnUrdR+3CaHm5TkM+tnJf49GD2H4vhAdpa/002iDrZY+QYn1JAolsDkKMF+6FqDTK
         A7pYb0Jfj5wLhdludyc2zzFbyFTQ01X/BpB7+kimLbI7PzY3toajdW2Q6u4gqAw5Ufdb
         lFy0zBJSIWTjCLCuSdrXdl4NqzLjyn3sp4M+5zcPohPXSfkbCQxdmdCVGyi9jUYO+Yoc
         NuJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=oOdHjT9I3a98EaTtzARQkAnvMgS9UeiFJMCcEWuHsDg=;
        b=rXQFdh0lWK9nbMTSo7FRkBHjqPSsYLwVWAfJbD0nZC0Pf0l+auQvshpxgseFb2lC6h
         emoJJ5aWzEmnrnp/5O72ls0PwxypKIyj+E32aLeKzxM9fPPrMYDauzQRILnpyDV7fV0N
         Y7AHrDtLtvvj4/jWOzjUY90cobXXX1POQXdVQFcsRBT0f3MTWGc8PtmfdyIGjr4Zhy7/
         lUKP+m8AsNvx7/zg7gwNpJSttCoqLryj18Q0oGTG3LlcqKEiFMGplsgSU3k8nxpsmCQT
         FQVBfJnlQOLBYOmeGTUaYbhHdcUNvwx1UnvNtAC+VqdjlycZiSZr0QvW9m9FYVYN8rGn
         vIJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DjAt4GJO;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id bj7-20020a05620a190700b007428227f4edsi7308664qkb.328.2023.03.06.00.47.14
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 00:47:14 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DjAt4GJO;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678092434;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oOdHjT9I3a98EaTtzARQkAnvMgS9UeiFJMCcEWuHsDg=;
	b=DjAt4GJOOkGvRm5K2/rky9P1UeeDEp6qpryOkVblpWoOtXgwMuYKQ+21PLrkd2NLmkqTsL
	bleh6d+LTi/u/I6AUnmVMQe9N/A4AsVXlT1sgW/MNrOLlA3PPpb2xqKUAIaM8xu0QYjbiY
	a2kmrqa+nTE2lDSkR9O+X4bpmI7u8yA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-221-1imUG1pVNKuXUSYHpP6cUQ-1; Mon, 06 Mar 2023 03:47:11 -0500
X-MC-Unique: 1imUG1pVNKuXUSYHpP6cUQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9BDFA101A52E;
	Mon,  6 Mar 2023 08:47:10 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.101])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 46752175AD;
	Mon,  6 Mar 2023 08:47:08 +0000 (UTC)
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
Subject: [PATCH v4 3/5] gitlab-ci.d/crossbuilds: Drop the i386 system emulation job
Date: Mon,  6 Mar 2023 09:46:56 +0100
Message-Id: <20230306084658.29709-4-thuth@redhat.com>
In-Reply-To: <20230306084658.29709-1-thuth@redhat.com>
References: <20230306084658.29709-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-TUID: vxlbZGM1ubuL

Hardly anybody still uses 32-bit x86 environments for running QEMU with
full system emulation, so let's stop wasting our scarce CI minutes with
this job.

(There are still the 32-bit MinGW and TCI jobs around for having
some compile test coverage on 32-bit)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.d/crossbuilds.yml | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index d3a31a2112..a25cb87ae4 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -43,16 +43,6 @@ cross-arm64-user:
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
 cross-i386-user:
   extends:
     - .cross_user_build_job
-- 
2.31.1
