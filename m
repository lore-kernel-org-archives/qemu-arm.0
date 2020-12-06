Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp2497359lfb;
        Sun, 6 Dec 2020 10:55:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJykfm74Fpqni/bI7g5keSqMhJsWtHwdnswMPbpmbJttqLFC7fRGWP33bUrvkqzVcJMrRGae
X-Received: by 2002:a17:906:b003:: with SMTP id v3mr15826871ejy.290.1607280955905;
        Sun, 06 Dec 2020 10:55:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607280955; cv=none;
        d=google.com; s=arc-20160816;
        b=FgCxOBYHqPPJQR+2TmGpwa5agYfI5S0HWgQ80qFDOnu1GlrxRCipZZvCiAf+oWfu80
         B9RHylYkAB9gJxgaMyn/GBm5L9Vj/1QB4kIGVOcS64gOszuanqSwqGFFB6pzQcZeCxNS
         pMJ73VvIYha5qunzwGI+ZTe51kR4RHd58qnf7qYUicxnUkYp4itqobi3UW9vemD4Aj33
         6QLrKON+YJEMRjDdIoVjn9TDsz2qLzfUCsVw7oD6mFXHF26xdepsa3DmcknRq7U7I7ir
         w7VpToa3oRgCXSdeMgbMfMPeIiN7a6+yMKQEZ9EZEkXK7IERUbDSqYNM9EN2b8W9rRnc
         nXow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=i1vxVlVvkT3sP8apHjKZ3bpOmMfnVbEari6EJ9mVBVw=;
        b=mNIYQME6T+8slGUhFekiF7XEfy9wfmRMZtt8Gh25Rt6o76nlit43VGE3ZmGPjCCC6k
         9j/TNd9zevIS1Z2jCETzTvAZ+1ahCf1OV4JIezsWZ+X7tcP7bIT4PgqPpQEP4bnFmkBy
         p6F6pYWb3s+q6xTIQGvreLl31kKcib2FyTd96Zs8GGLZkTeXdvvuB6kC6Kvi7/cy0tta
         bHdL39Ep85uuB8XNz38QLMwfJ2z5kGYaLBFfHCaA3Jp52R600sJ6RZAJmdVNtF9KxBiz
         /OXK/3XJyX+L/BnVRrs0lVAg3XLcKloj+9rKqQ7qGItVhhB9ebU6Ff2ZsOci3jDi/N5g
         oUfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=C0o3h9AK;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id d17si8276187edv.240.2020.12.06.10.55.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 06 Dec 2020 10:55:55 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=C0o3h9AK;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607280955;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i1vxVlVvkT3sP8apHjKZ3bpOmMfnVbEari6EJ9mVBVw=;
	b=C0o3h9AKYsREy3BIwJrwDIb1WUj9F5x1R+Gx2Fh4K1TFZuK3EGNxj8nv5i2ndR3ilY56wC
	mf3Omv44bpVce6O3R65ZiG4lb7JYVlNppbShxWloyDHoXz6MhOuV4MUDe6BooDdFCVamUN
	AB3gyXazN1dmVG0j5vFqGc6WhMe2rrg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-3OJTOuntMYCi3e9bIYNZrg-1; Sun, 06 Dec 2020 13:55:53 -0500
X-MC-Unique: 3OJTOuntMYCi3e9bIYNZrg-1
Received: by mail-wm1-f70.google.com with SMTP id l5so3281476wmi.4
        for <alex.bennee@linaro.org>; Sun, 06 Dec 2020 10:55:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i1vxVlVvkT3sP8apHjKZ3bpOmMfnVbEari6EJ9mVBVw=;
        b=a0joa34zojsdPm37AHdLTi51uf+wOLgEDBsh59GCf1OMmG1rPIsGI8mrOKSTf5PLFc
         TTWylOf7v3rtELm4R8OOzCi0PgPRtG3U4kS7n4jcOvWKK78mQL+12z5V+E4cBlUMbxKH
         XTfT2L5FeLQwldIJJXqtgIj6/CHrbMX56gZ6TSsSD/9nFiX/chrvWVyRgENDIGljh2tf
         fXfqy5D4J5cLFu4np8Tcqnk0xfGbeu2mqbd68xznvir2aSbLq1taS/kI/ebUy1IrKJiq
         eNrx/it3H/yAInvioxqBRk9MIluU+77dPmTeDyyTTlVp+C1grjExrDcSxcL+plEsScq5
         ji2Q==
X-Gm-Message-State: AOAM532XqdQz1lBLfU+bEw/jLHqsQFrXQ9QOPScWFnpn7MgUTK2nPR/8
	V1QHcPN7Dn+cbTQ2FQdsEC7E5n9Z7fsKlxkWBvNrrid2r8V1RzlU+tazgvQeSLZe3K+nEhnM02O
	Xl+pdbuZ5jJ587fpb
X-Received: by 2002:adf:9b9b:: with SMTP id d27mr13324084wrc.125.1607280951438;
        Sun, 06 Dec 2020 10:55:51 -0800 (PST)
X-Received: by 2002:adf:9b9b:: with SMTP id d27mr13324062wrc.125.1607280951287;
        Sun, 06 Dec 2020 10:55:51 -0800 (PST)
Return-Path: <philmd@redhat.com>
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net. [88.21.206.101])
        by smtp.gmail.com with ESMTPSA id v20sm10922213wml.34.2020.12.06.10.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Dec 2020 10:55:50 -0800 (PST)
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
Subject: [PATCH 7/8] gitlab-ci: Add KVM MIPS cross-build jobs
Date: Sun,  6 Dec 2020 19:55:07 +0100
Message-Id: <20201206185508.3545711-8-philmd@redhat.com>
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
X-TUID: kWk3jZR62HYh

Cross-build mips target with KVM and TCG accelerators enabled.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
later we'll build KVM-only.
---
 .gitlab-ci.d/crossbuilds-kvm-mips.yml | 5 +++++
 .gitlab-ci.yml                        | 1 +
 MAINTAINERS                           | 1 +
 3 files changed, 7 insertions(+)
 create mode 100644 .gitlab-ci.d/crossbuilds-kvm-mips.yml

diff --git a/.gitlab-ci.d/crossbuilds-kvm-mips.yml b/.gitlab-ci.d/crossbuilds-kvm-mips.yml
new file mode 100644
index 00000000000..81eeeb315bb
--- /dev/null
+++ b/.gitlab-ci.d/crossbuilds-kvm-mips.yml
@@ -0,0 +1,5 @@
+cross-mips64el-kvm:
+  extends: .cross_accel_build_job
+  variables:
+    IMAGE: debian-mips64el-cross
+    TARGETS: mips64el-softmmu
diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 024624908e8..5f607fc7b48 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -16,6 +16,7 @@ include:
   - local: '/.gitlab-ci.d/crossbuilds-kvm-arm.yml'
   - local: '/.gitlab-ci.d/crossbuilds-kvm-s390x.yml'
   - local: '/.gitlab-ci.d/crossbuilds-kvm-ppc.yml'
+  - local: '/.gitlab-ci.d/crossbuilds-kvm-mips.yml'
 
 .native_build_job_template: &native_build_job_definition
   stage: build
diff --git a/MAINTAINERS b/MAINTAINERS
index c7766782174..5f26626a512 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -392,6 +392,7 @@ MIPS KVM CPUs
 M: Huacai Chen <chenhc@lemote.com>
 S: Odd Fixes
 F: target/mips/kvm.c
+F: .gitlab-ci.d/crossbuilds-kvm-mips.yml
 
 PPC KVM CPUs
 M: David Gibson <david@gibson.dropbear.id.au>
-- 
2.26.2
