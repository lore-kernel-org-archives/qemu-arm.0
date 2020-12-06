Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp2497262lfb;
        Sun, 6 Dec 2020 10:55:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzWa2gmK00BknlCoXtGAVXgMCblRVBDWOJ9QYlKNDbWwEIhdDjE+axg9A63+w86IphOAJEI
X-Received: by 2002:a17:906:b003:: with SMTP id v3mr15826527ejy.290.1607280945863;
        Sun, 06 Dec 2020 10:55:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607280945; cv=none;
        d=google.com; s=arc-20160816;
        b=JEMltax3Vsv0Wz+LwU6nWzU+0b6ydSxDdU0F6r8QUD3IdHpwdi1o7U9MfJ3rR+yk70
         D6i1aziQBl0ajJO0NGyHsyxdczgU9RhP0fXUI838dqznWg7ZAuHvxK4mLN/Cb81AGmgi
         kmgrnOKHiYdZmu1/6vKjoN8yHq1IbUqMb3kF83t4CEDCgM3pvtaibT5QYqUBkb1AjfQ4
         Hz8t3SXlQPhBu23gbuEN5a1c0tZZv0ij3R3hHTDSmRkcNoUbB0KD3nFbPHpw5rmzVmZE
         T7f5DGmVCUXEhauum5KwAWOClNxaCUZ3Ow+1RcvguRjO0pky57zyReGd5kDNUL3nNyWl
         wQCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ICTgDX+4v4WDebhKXLX3qGQtibzA3mRvScrd6C7n6Ec=;
        b=YxqOHupIzFEOkBNn06r5+htZcB1Z/rbU9u75ddvl2Bguq9kNYyAwjUO3pkKQopBdtw
         sFQO0QHBUXEBpszq6a3a4+VywKY0P79dW4SXmLaw5R7HgWDdQdyYvm+okE6O/ebYKFch
         7g7An0RJgHdehpJBaiZty1Ra/zJxxQo3AbRe91X0zE0oBMFF7PNeslxqselPKThkOSn/
         j4DsS/P9ZUYYu1AFTNmWoelHFXdQzA1KYXIWN1FPxTp5oB16SE00UiXebyQOIcapfo7G
         BNKXOSQfC4wN85RHvzV3rTaQsc4PEktWbvrAuRiL+Dh1tmdnDY3yytAoirZDxIcqpEpw
         0T2g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=g8pUas2X;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id o3si5048780ejn.637.2020.12.06.10.55.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 06 Dec 2020 10:55:45 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=g8pUas2X;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607280944;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ICTgDX+4v4WDebhKXLX3qGQtibzA3mRvScrd6C7n6Ec=;
	b=g8pUas2XUUS4lxcKAwzEWpUEKwZt8ao5rTtgB0fgh/fHoY29tPGxjN2IxuYnCLMq12tiiy
	Vpi7lwbGgdWkxed1ZhseEu1n9caq7llBlREoCt14rSPPn0KGoCnAapGanfh1wXvB3O9UwW
	R0HBD6/73uhs+x+p5YGbJ/AmeNsYu/0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-Hi6RfZOgNXW8_TwmzeC0FQ-1; Sun, 06 Dec 2020 13:55:42 -0500
X-MC-Unique: Hi6RfZOgNXW8_TwmzeC0FQ-1
Received: by mail-wm1-f70.google.com with SMTP id g198so3222032wme.7
        for <alex.bennee@linaro.org>; Sun, 06 Dec 2020 10:55:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ICTgDX+4v4WDebhKXLX3qGQtibzA3mRvScrd6C7n6Ec=;
        b=fCrQX9wDkGObTKRFaYWsf2pEBziKyF1jaHfODRI8AYQVcuLds6oHpzxi1r9WW6QPPJ
         V3CbGLmsT/1hPzS+cRf76kj/ZkCTQzG1w1WJUjqQvbttYxdKqUbsvXnwIdnSgel3tt7W
         kXHkPsO37/D22S3jHH/r/zNrzU5MxA0VDtLK5FGe5Q6SfJuddru4r9Mv1sGZtKvqqCbl
         4L39pInR0xU55xddcqwFBWb5RQol4yEwjDzuOsjLksMo1ls7wY/ehjvQsxnO2nq0/K4Z
         gyFN+MxhFEehv0E/Th8kOBTN+H4g5R+eseNkoI+EX3gXVRhKwFUEFRCnwgMxToyOQUWJ
         kcRg==
X-Gm-Message-State: AOAM532QvPKgi6+IVsAb24dIqLKkuPpRluJPhCJEU1UJ0zJkHR0ijOcv
	W0gJKJS4vbH/A6//cVZXgw0wGh4w7bBxvV9U/nENOtLyuFKjh43udCDKV4c2eSnvFZxx6ECknFa
	zi0edp6RyA/7cNdb6
X-Received: by 2002:a1c:9d8b:: with SMTP id g133mr14902031wme.189.1607280940120;
        Sun, 06 Dec 2020 10:55:40 -0800 (PST)
X-Received: by 2002:a1c:9d8b:: with SMTP id g133mr14902001wme.189.1607280939914;
        Sun, 06 Dec 2020 10:55:39 -0800 (PST)
Return-Path: <philmd@redhat.com>
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net. [88.21.206.101])
        by smtp.gmail.com with ESMTPSA id l1sm5951733wrq.64.2020.12.06.10.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Dec 2020 10:55:39 -0800 (PST)
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
Subject: [PATCH 5/8] gitlab-ci: Add KVM s390x cross-build jobs
Date: Sun,  6 Dec 2020 19:55:05 +0100
Message-Id: <20201206185508.3545711-6-philmd@redhat.com>
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
X-TUID: 2idE5dXMD2ew

Cross-build s390x target with only KVM accelerator enabled.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 .gitlab-ci.d/crossbuilds-kvm-s390x.yml | 6 ++++++
 .gitlab-ci.yml                         | 1 +
 MAINTAINERS                            | 1 +
 3 files changed, 8 insertions(+)
 create mode 100644 .gitlab-ci.d/crossbuilds-kvm-s390x.yml

diff --git a/.gitlab-ci.d/crossbuilds-kvm-s390x.yml b/.gitlab-ci.d/crossbuilds-kvm-s390x.yml
new file mode 100644
index 00000000000..1731af62056
--- /dev/null
+++ b/.gitlab-ci.d/crossbuilds-kvm-s390x.yml
@@ -0,0 +1,6 @@
+cross-s390x-kvm:
+  extends: .cross_accel_build_job
+  variables:
+    IMAGE: debian-s390x-cross
+    TARGETS: s390x-softmmu
+    ACCEL_CONFIGURE_OPTS: --disable-tcg
diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 573afceb3c7..a69619d7319 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -14,6 +14,7 @@ include:
   - local: '/.gitlab-ci.d/crossbuilds.yml'
   - local: '/.gitlab-ci.d/crossbuilds-kvm-x86.yml'
   - local: '/.gitlab-ci.d/crossbuilds-kvm-arm.yml'
+  - local: '/.gitlab-ci.d/crossbuilds-kvm-s390x.yml'
 
 .native_build_job_template: &native_build_job_definition
   stage: build
diff --git a/MAINTAINERS b/MAINTAINERS
index 40271eba592..d41401f6683 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -417,6 +417,7 @@ F: hw/intc/s390_flic.c
 F: hw/intc/s390_flic_kvm.c
 F: include/hw/s390x/s390_flic.h
 F: gdb-xml/s390*.xml
+F: .gitlab-ci.d/crossbuilds-kvm-s390x.yml
 T: git https://github.com/cohuck/qemu.git s390-next
 T: git https://github.com/borntraeger/qemu.git s390-next
 L: qemu-s390x@nongnu.org
-- 
2.26.2
