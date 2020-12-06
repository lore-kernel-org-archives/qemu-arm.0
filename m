Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp2497080lfb;
        Sun, 6 Dec 2020 10:55:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJye9a5LWS6ZDsfzWCGMsgRUBm82vS3KMlNFHU7tk2CS1t4mtw19LsDj7si7HPztuFwPUAFY
X-Received: by 2002:a25:cc47:: with SMTP id l68mr17842873ybf.346.1607280920931;
        Sun, 06 Dec 2020 10:55:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607280920; cv=none;
        d=google.com; s=arc-20160816;
        b=QV4a4UrSqSdHCqogu3z5xivEqCLyYXrEDVuwKnFSxVOaauqIpLYT1hjpWwwx6Edku+
         XBxVcf97h50UjSURbAS19QkQtQe+rpTDJgclaYtzy0Z40DGMZGWyTh9CdkNc4b4C9cYZ
         zJ8crHx0PjziajfdHNhhcpEMMxbiPueLG2wnBATU9xy3CCRYBCKCmqfZbrLkNgqP23gm
         kujIfdEBKCnAXKSpWfY5uxej0QMDTjrFadGHXYjaM5gaDO1ZV6x3ty1rZrnDfkzeuk7z
         s7AThiHu1zDIEnb7wG/rmKJwaAzK9R9coqCkJmz5mKJJJ98TAkdQpca1QAyeHjoN3LHc
         NhhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=J0caE/rg850u7bwr+Q+jKihpcnbP+o9Z+fIMhlSMarg=;
        b=idnxsSMB1nXPXdiMjQXGTig6skjN0mC9c3LZKLK6JEW2Bhl/1wcCHhek4rk9z7VDgq
         XW44bmCwFBmMZCivca+DOqyA339i3VQvNoVMINY5fvEC1liENvAS5t1Kv68RadJ/K2mB
         R4lnZi973FYNt3VH0XRPlqKyCqoQAWOe21asV1ADjjNn1hXo94FkpGucEirxzrNIsFT4
         /3/3Y5+WxR0NkU6V5JmYeXTCCVxvXwlISWIZW2kle2gq0gnv6qwbS316bCcK+2ouX93K
         TkPYywfwFhZ/XH2eBpp0kOLT6e0ux8zpHX4o/e0Cdb4ISyf/QJ+Bv+ZtMMi13jgfRkie
         R6dw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=P4Z0ATzx;
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [63.128.21.124])
        by mx.google.com with ESMTPS id a124si6101655ybb.335.2020.12.06.10.55.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 06 Dec 2020 10:55:20 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 63.128.21.124 as permitted sender) client-ip=63.128.21.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=P4Z0ATzx;
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607280920;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J0caE/rg850u7bwr+Q+jKihpcnbP+o9Z+fIMhlSMarg=;
	b=P4Z0ATzxM3uQDdwrsK6NPVownN6Vh+jBf4n3ODAK1USO/vJkWtEq1fS3XVAStP9lHUi67h
	DXQhgJabcFgtRXmBgqWLIvkq4K7qDiYSc9Ir4b2KnA2+74GOqu4ghOJFX4Ov6GhvlNy0mq
	EOgAjr9IyO3oJOxUL+q/I8fiNahWczg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-jT17N4B4PcOC9DtYj5LmFQ-1; Sun, 06 Dec 2020 13:55:18 -0500
X-MC-Unique: jT17N4B4PcOC9DtYj5LmFQ-1
Received: by mail-wm1-f72.google.com with SMTP id g198so3221694wme.7
        for <alex.bennee@linaro.org>; Sun, 06 Dec 2020 10:55:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=J0caE/rg850u7bwr+Q+jKihpcnbP+o9Z+fIMhlSMarg=;
        b=Zr+3hW3m9EXvqKR83hNPTJ4rrd/b1n9ySd2wphi5kjN8ZZ1CVhn5rvZoS2jAk8KL85
         J+u+wvruWHl6Yo8rXs3qvlEt7vT7AlYlta9gp9O0rircfP0I0HZOYZ1ko2IiPxKsqaas
         y/V3zaS31yDQQSBk00OB9CxiLzCMc9xo/1JRo6U7LUUINyiQMS/zmn61nUwtY1F9vyht
         oPxqCfSoAHzjErFRu3vB/uubYEoiI5zKToFtHDXiska55M2KmKd+ii2rUtwAjCJnTLxe
         xRZmo0Rg+jkl50owzBhFRvo8GK8pRKCI56v01VBC3In61y2md5XvYne0jzpV0t7GnqZS
         iHJQ==
X-Gm-Message-State: AOAM531noedmDOc/l+90QEczYECziXOaivrTM9sQ2fLcCXqaq3yiojIc
	1XOa9xqyCxAE+6BC8qZ5hfqkBp82uDWSyDaUcaYFssRwxoae0FmQEZOFBG3blvDCSppl5JZFukq
	iw1TMpWmg9VbntrbH
X-Received: by 2002:a5d:6447:: with SMTP id d7mr15842830wrw.96.1607280917539;
        Sun, 06 Dec 2020 10:55:17 -0800 (PST)
X-Received: by 2002:a5d:6447:: with SMTP id d7mr15842818wrw.96.1607280917387;
        Sun, 06 Dec 2020 10:55:17 -0800 (PST)
Return-Path: <philmd@redhat.com>
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net. [88.21.206.101])
        by smtp.gmail.com with ESMTPSA id v7sm11353163wma.26.2020.12.06.10.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Dec 2020 10:55:16 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	xen-devel@lists.xenproject.org,
	kvm@vger.kernel.org,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Willian Rampazzo <wrampazz@redhat.com>,
	Paul Durrant <paul@xen.org>,
	Huacai Chen <chenhc@lemote.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Claudio Fontana <cfontana@suse.de>,
	Halil Pasic <pasic@linux.ibm.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Cornelia Huck <cohuck@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-s390x@nongnu.org,
	Aurelien Jarno <aurelien@aurel32.net>,
	qemu-arm@nongnu.org
Subject: [PATCH 1/8] gitlab-ci: Replace YAML anchors by extends (cross_system_build_job)
Date: Sun,  6 Dec 2020 19:55:01 +0100
Message-Id: <20201206185508.3545711-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201206185508.3545711-1-philmd@redhat.com>
References: <20201206185508.3545711-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: fN0UcbRNVkZe

'extends' is an alternative to using YAML anchors
and is a little more flexible and readable. See:
https://docs.gitlab.com/ee/ci/yaml/#extends

More importantly it allows exploding YAML jobs.

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 .gitlab-ci.d/crossbuilds.yml | 40 ++++++++++++++++++------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index 03ebfabb3fa..099949aaef3 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -1,5 +1,5 @@
 
-.cross_system_build_job_template: &cross_system_build_job_definition
+.cross_system_build_job:
   stage: build
   image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
   timeout: 80m
@@ -13,7 +13,7 @@
           xtensa-softmmu"
     - make -j$(expr $(nproc) + 1) all check-build
 
-.cross_user_build_job_template: &cross_user_build_job_definition
+.cross_user_build_job:
   stage: build
   image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
   script:
@@ -24,91 +24,91 @@
     - make -j$(expr $(nproc) + 1) all check-build
 
 cross-armel-system:
-  <<: *cross_system_build_job_definition
+  extends: .cross_system_build_job
   variables:
     IMAGE: debian-armel-cross
 
 cross-armel-user:
-  <<: *cross_user_build_job_definition
+  extends: .cross_user_build_job
   variables:
     IMAGE: debian-armel-cross
 
 cross-armhf-system:
-  <<: *cross_system_build_job_definition
+  extends: .cross_system_build_job
   variables:
     IMAGE: debian-armhf-cross
 
 cross-armhf-user:
-  <<: *cross_user_build_job_definition
+  extends: .cross_user_build_job
   variables:
     IMAGE: debian-armhf-cross
 
 cross-arm64-system:
-  <<: *cross_system_build_job_definition
+  extends: .cross_system_build_job
   variables:
     IMAGE: debian-arm64-cross
 
 cross-arm64-user:
-  <<: *cross_user_build_job_definition
+  extends: .cross_user_build_job
   variables:
     IMAGE: debian-arm64-cross
 
 cross-mips-system:
-  <<: *cross_system_build_job_definition
+  extends: .cross_system_build_job
   variables:
     IMAGE: debian-mips-cross
 
 cross-mips-user:
-  <<: *cross_user_build_job_definition
+  extends: .cross_user_build_job
   variables:
     IMAGE: debian-mips-cross
 
 cross-mipsel-system:
-  <<: *cross_system_build_job_definition
+  extends: .cross_system_build_job
   variables:
     IMAGE: debian-mipsel-cross
 
 cross-mipsel-user:
-  <<: *cross_user_build_job_definition
+  extends: .cross_user_build_job
   variables:
     IMAGE: debian-mipsel-cross
 
 cross-mips64el-system:
-  <<: *cross_system_build_job_definition
+  extends: .cross_system_build_job
   variables:
     IMAGE: debian-mips64el-cross
 
 cross-mips64el-user:
-  <<: *cross_user_build_job_definition
+  extends: .cross_user_build_job
   variables:
     IMAGE: debian-mips64el-cross
 
 cross-ppc64el-system:
-  <<: *cross_system_build_job_definition
+  extends: .cross_system_build_job
   variables:
     IMAGE: debian-ppc64el-cross
 
 cross-ppc64el-user:
-  <<: *cross_user_build_job_definition
+  extends: .cross_user_build_job
   variables:
     IMAGE: debian-ppc64el-cross
 
 cross-s390x-system:
-  <<: *cross_system_build_job_definition
+  extends: .cross_system_build_job
   variables:
     IMAGE: debian-s390x-cross
 
 cross-s390x-user:
-  <<: *cross_user_build_job_definition
+  extends: .cross_user_build_job
   variables:
     IMAGE: debian-s390x-cross
 
 cross-win32-system:
-  <<: *cross_system_build_job_definition
+  extends: .cross_system_build_job
   variables:
     IMAGE: fedora-win32-cross
 
 cross-win64-system:
-  <<: *cross_system_build_job_definition
+  extends: .cross_system_build_job
   variables:
     IMAGE: fedora-win64-cross
-- 
2.26.2
