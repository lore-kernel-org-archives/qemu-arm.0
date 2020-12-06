Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp2497418lfb;
        Sun, 6 Dec 2020 10:56:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx8w0Z6ixLDDHRHfxJ20iF5tJ3M9u/0wyp8/oDt8XEmGqIYrcdwg2MBQSx6Asa/5yxCc5VF
X-Received: by 2002:aa7:d593:: with SMTP id r19mr17288618edq.246.1607280963168;
        Sun, 06 Dec 2020 10:56:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607280963; cv=none;
        d=google.com; s=arc-20160816;
        b=JeK90CxeI911ODBMgJZPPp1mlS5vIWBS6OVRpQQwTvexvx1z+wtjX6w4ynPSLiSwwA
         ZGxU8OCwwYqwwHx0a3ao43yvWQ6iAL+8+ky8j8Bf3vc7Zt6VnKM9hzBGNwOZHI7G+ajt
         mvUZI/r+fia/vwLp0SfXNFRM0hPr0axYfc/Nq9gZWefYMcWCkgAIRxRIPpPfWNU7feA4
         43dFFFEkfkwFAMEl1Xuiu3z6+SUTROQTBFq/RcKDNo6/YDzP7hZsgkRFcy3BgUZmQ6x/
         6V7/Je5Pz1+hPz2eXw/yDx1Q2EN9K/4vwzAnl19nTfiYol7lJIRGgSgLD1iMEFtewutf
         7jCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=TJv54j6i8iOuNb5cgwW4vcH7LWLUemKzrpTz+i6TyMo=;
        b=B1MQoA23qh0x9xO9CKE/AZ8HjhGla1BcBRoG845QFxAZcMEkO2uRwwChbq1fAHk+Sz
         5Wm/CwcRinhHgN2umaENpKSA7a8u1UVJWViEquRpAC5q5rPolnRKVfoU3bvBwdrUvTD1
         Z5TLtb1ViaAsFE2N6rjmHofBJWEj7wyXLFaZLQEaSrOtdNMn0gr0k0mfB2kMbfRQf1so
         KdnK8zFEE82v+y/GCL9ljLMJ0fkqJl2FwFHZwhqgrIRdh8/gvyRf3+4SGbKw+tTDycfJ
         7hNcB3DidlEgHUVymjLUPZhXp2K35s5w8tWPMgFli/+Pw6N1viTXHUY9EqjG/3vdexBm
         pTxw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Tw6pHfaC;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id od20si5217878ejb.621.2020.12.06.10.56.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 06 Dec 2020 10:56:03 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Tw6pHfaC;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607280962;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TJv54j6i8iOuNb5cgwW4vcH7LWLUemKzrpTz+i6TyMo=;
	b=Tw6pHfaCsc5VycCo9AAHFWomLhs28bDl1BQgN7cHMVqoWf5UUd181PX7ciJ2WamgGNaV3o
	QMx3ZKuXovxOynfmuzDctdxonpsfdftoTf2q0uu1skeaD8Wm2/IgqyiXAkhox/8MFHU42f
	VK1U7E9nIwJ1UxH1gfbuqWrjrmUAMHs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-dQR0TH61OKu06J2UubGXyw-1; Sun, 06 Dec 2020 13:55:58 -0500
X-MC-Unique: dQR0TH61OKu06J2UubGXyw-1
Received: by mail-wm1-f71.google.com with SMTP id o203so3253317wmo.3
        for <alex.bennee@linaro.org>; Sun, 06 Dec 2020 10:55:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TJv54j6i8iOuNb5cgwW4vcH7LWLUemKzrpTz+i6TyMo=;
        b=owQ8xk4qsJTpLh8Nbby/fIQKoG6UIY61KIxqJbSolglKzeYHjSW9hUkEOZoIfzXmba
         Zz8G6Xvvvd6lIMF+Xkf8HzNLdICvpzBePhwvdLKabB5X/Dgs0roNoPlJCkU60QD15NGg
         VbUpqwuhh0jUbsoSVl3IXvBtQhQ/KgmnTsHQdM3G0Zg3fcJPxjGr/BALXOE26MVc/nSz
         O93LPc0ZQJP305O4sOhJVAEBK6+emjbz7J3YeydbHbGF07ook+Lj2RGKg8JOdMwxRZTL
         kM6QKVHIU2fuAYEedIkS4L4yEpwRJPPWHzv3DpVJokRu+MI/hlxggfMUM7h3Dnmvtkfr
         xGbQ==
X-Gm-Message-State: AOAM531TithjxHRp+4ZHlunblShBHbVEgemFTxmrQm9h9OcMMy/AmSJv
	reSrHuAyafFh4S8kIcozuKscRRzZEaqXNOWNkcyi4Eqtw3tu4p+eHhY4nq+bLntbBAcrwNGQT86
	U/S9sDDHWcbxmhy2+
X-Received: by 2002:a5d:540f:: with SMTP id g15mr7837219wrv.397.1607280957359;
        Sun, 06 Dec 2020 10:55:57 -0800 (PST)
X-Received: by 2002:a5d:540f:: with SMTP id g15mr7837200wrv.397.1607280957219;
        Sun, 06 Dec 2020 10:55:57 -0800 (PST)
Return-Path: <philmd@redhat.com>
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net. [88.21.206.101])
        by smtp.gmail.com with ESMTPSA id f199sm10894749wme.15.2020.12.06.10.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Dec 2020 10:55:56 -0800 (PST)
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
Subject: [PATCH 8/8] gitlab-ci: Add Xen cross-build jobs
Date: Sun,  6 Dec 2020 19:55:08 +0100
Message-Id: <20201206185508.3545711-9-philmd@redhat.com>
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
X-TUID: 42IT1YcG60u+

Cross-build ARM and X86 targets with only Xen accelerator enabled.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 .gitlab-ci.d/crossbuilds-xen.yml | 14 ++++++++++++++
 .gitlab-ci.yml                   |  1 +
 MAINTAINERS                      |  1 +
 3 files changed, 16 insertions(+)
 create mode 100644 .gitlab-ci.d/crossbuilds-xen.yml

diff --git a/.gitlab-ci.d/crossbuilds-xen.yml b/.gitlab-ci.d/crossbuilds-xen.yml
new file mode 100644
index 00000000000..9c4def4feeb
--- /dev/null
+++ b/.gitlab-ci.d/crossbuilds-xen.yml
@@ -0,0 +1,14 @@
+cross-amd64-xen:
+  extends: .cross_accel_build_job
+  variables:
+    IMAGE: debian-amd64-cross
+    ACCEL: xen
+    TARGETS: i386-softmmu,x86_64-softmmu
+    ACCEL_CONFIGURE_OPTS: --disable-tcg --disable-kvm
+
+cross-arm64-xen:
+  extends: .cross_accel_build_job
+  variables:
+    IMAGE: debian-arm64-cross
+    ACCEL: xen
+    TARGETS: aarch64-softmmu
diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 5f607fc7b48..9765c2199f7 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -17,6 +17,7 @@ include:
   - local: '/.gitlab-ci.d/crossbuilds-kvm-s390x.yml'
   - local: '/.gitlab-ci.d/crossbuilds-kvm-ppc.yml'
   - local: '/.gitlab-ci.d/crossbuilds-kvm-mips.yml'
+  - local: '/.gitlab-ci.d/crossbuilds-xen.yml'
 
 .native_build_job_template: &native_build_job_definition
   stage: build
diff --git a/MAINTAINERS b/MAINTAINERS
index 5f26626a512..1581e120629 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -488,6 +488,7 @@ F: include/hw/xen/
 F: include/sysemu/xen.h
 F: include/sysemu/xen-mapcache.h
 F: stubs/xen-hw-stub.c
+F: .gitlab-ci.d/crossbuilds-xen.yml
 
 Guest CPU Cores (HAXM)
 ---------------------
-- 
2.26.2
