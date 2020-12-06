Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp2497299lfb;
        Sun, 6 Dec 2020 10:55:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxxSRYV6bJlwZotVnupRisaJO0rzt/d8DUZk9mXHLHWE7jX8mPCKYTAqg9TTP8kN1xM2ez3
X-Received: by 2002:a25:e8b:: with SMTP id 133mr18139965ybo.146.1607280949465;
        Sun, 06 Dec 2020 10:55:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607280949; cv=none;
        d=google.com; s=arc-20160816;
        b=mrn2FIMqrDXlxLXxmv4/8+7mt/Pc58pMqGOgtsjLhMtzOmixmXYv+hduJ+vXe9NsQ+
         IiqNlwPxIiHL+Sxc2uBbDOmS3QVSTNW+iq8YhiZvCwYyBN1R66r8hmtS2TG3bJHK1Vf6
         3WxaKoM6qYfrnBhjobuFlrWBzqv5tCoEqalLxEaBjIg7VYMgb7P/4/SUk9bqsNd3lxpZ
         dpGwN3U7Pg0qDyiPcto0STJaaACXIpbVUo4/1iGVUA/7+FvQmP0PpSq1Z1tVTXXVf01n
         6Wgrgo2DB8sXirXqb1cC9gxtq1Vm8oonoP+GH1Wg8SEjAaRbTJ/FHDvJexFGQRpWJuyp
         0WkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=OgnINeMOsSyDZG4XwDK8Xw/XSsfPDxGpQ5JDhRmZjUY=;
        b=A1XjNeNOEkCoXdzOo8ciNTdmAXBg6U6dIN3zsM673NvR/giTVff+atjQ80p5+gfIki
         4yTyhwzwJ71ST04OmPLBS/OhqCf4ji4vWwx064CnSLf9sXYcyDYdFtO6Tnjxg8Ks8+vh
         39LzFdRalTRMa0xmJaF2OgSadhgreI3qHH5he5lDzRb7d5BTXbeIdsY1L+DDDlRMinxU
         OEMu0Ut3xmNlHY2Eu8d7fOm/aHRNN4C8LJuBxBKf1oAZSEjv/5b//hXE7pIuWAkfzymc
         ARc0Fq5pqBvJb8q/N6FugXTqegJnKQch/wpCmsehCwI72Hwfue/RgVlXpaJU2B0UWAcR
         RsZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CAopMyaj;
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [63.128.21.124])
        by mx.google.com with ESMTPS id s12si10589084ybi.495.2020.12.06.10.55.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 06 Dec 2020 10:55:49 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 63.128.21.124 as permitted sender) client-ip=63.128.21.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CAopMyaj;
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607280949;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OgnINeMOsSyDZG4XwDK8Xw/XSsfPDxGpQ5JDhRmZjUY=;
	b=CAopMyajJehc2dVd8qLO5n8LE/KYgBAfziz5CA88UJW6ioMSPkXrl1VFuwKm/r5a0YdvPR
	M8IhMv57l+y1tRq7ZMVWwu8Hmj0StLDsoGe+QwlSVLGQD4yGQPy4zOj81jUPw5sC98y0Aa
	cRIe7xn2ZMqY8YX1PxBOUUxgkr1DS+w=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-448-aSik-OvlPUaCGQgNR4NhaQ-1; Sun, 06 Dec 2020 13:55:47 -0500
X-MC-Unique: aSik-OvlPUaCGQgNR4NhaQ-1
Received: by mail-wm1-f71.google.com with SMTP id j62so4334721wma.4
        for <alex.bennee@linaro.org>; Sun, 06 Dec 2020 10:55:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OgnINeMOsSyDZG4XwDK8Xw/XSsfPDxGpQ5JDhRmZjUY=;
        b=d3ZxgXw1PwylLDIZVvleyMXNEoCQpKhHCLWvYXqrcZCVTegKY3+BKeHehh9kViwBmw
         ny25Zm2k3nfnMIgI7rLTN889LXThud5ek+qOefgWEDC4zIF65EkAmxED79zznphVhbkn
         JYoEQuM29e8dHykw7/X3HkGOrVLuADwq+pM8eLtUvyzuVkWaIP39CorQDFpo1k54cJ+g
         TyCbs8q4iIK4i5Okc01a3YsVeV5ZS2YdwS9tW5uC6RhfXU+768+mQX5HF21fO2tcgaGO
         +I42f8oAiKEPBWL/gq0LjaLpWITlpKYDazCGQJZm7CYv+HoZcYHA3qYZN41/fK06cvAJ
         o2OQ==
X-Gm-Message-State: AOAM532SFYCbiC/ohD3HqVgvPlQbboC/U9nKzieTdhb/ZUyPMixinT6I
	2vli8a+vJAeX84+WXwEZUnakUZOKKc+ZxSiznnIGjdLjUXy+vfuMw6SHnkMUV/gllQrC2duBH20
	U234FOTV2hbI7HLFB
X-Received: by 2002:a1c:27c4:: with SMTP id n187mr14572193wmn.157.1607280946015;
        Sun, 06 Dec 2020 10:55:46 -0800 (PST)
X-Received: by 2002:a1c:27c4:: with SMTP id n187mr14572172wmn.157.1607280945820;
        Sun, 06 Dec 2020 10:55:45 -0800 (PST)
Return-Path: <philmd@redhat.com>
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net. [88.21.206.101])
        by smtp.gmail.com with ESMTPSA id f16sm10763171wmh.7.2020.12.06.10.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Dec 2020 10:55:45 -0800 (PST)
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
Subject: [PATCH 6/8] gitlab-ci: Add KVM PPC cross-build jobs
Date: Sun,  6 Dec 2020 19:55:06 +0100
Message-Id: <20201206185508.3545711-7-philmd@redhat.com>
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
X-TUID: C4H0gPAN0YqE

Cross-build PPC target with KVM and TCG accelerators enabled.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
later this job build KVM-only.
---
 .gitlab-ci.d/crossbuilds-kvm-ppc.yml | 5 +++++
 .gitlab-ci.yml                       | 1 +
 MAINTAINERS                          | 1 +
 3 files changed, 7 insertions(+)
 create mode 100644 .gitlab-ci.d/crossbuilds-kvm-ppc.yml

diff --git a/.gitlab-ci.d/crossbuilds-kvm-ppc.yml b/.gitlab-ci.d/crossbuilds-kvm-ppc.yml
new file mode 100644
index 00000000000..9df8bcf5a73
--- /dev/null
+++ b/.gitlab-ci.d/crossbuilds-kvm-ppc.yml
@@ -0,0 +1,5 @@
+cross-ppc64el-kvm:
+  extends: .cross_accel_build_job
+  variables:
+    IMAGE: debian-ppc64el-cross
+    TARGETS: ppc64-softmmu
diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index a69619d7319..024624908e8 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -15,6 +15,7 @@ include:
   - local: '/.gitlab-ci.d/crossbuilds-kvm-x86.yml'
   - local: '/.gitlab-ci.d/crossbuilds-kvm-arm.yml'
   - local: '/.gitlab-ci.d/crossbuilds-kvm-s390x.yml'
+  - local: '/.gitlab-ci.d/crossbuilds-kvm-ppc.yml'
 
 .native_build_job_template: &native_build_job_definition
   stage: build
diff --git a/MAINTAINERS b/MAINTAINERS
index d41401f6683..c7766782174 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -397,6 +397,7 @@ PPC KVM CPUs
 M: David Gibson <david@gibson.dropbear.id.au>
 S: Maintained
 F: target/ppc/kvm.c
+F: .gitlab-ci.d/crossbuilds-kvm-ppc.yml
 
 S390 KVM CPUs
 M: Halil Pasic <pasic@linux.ibm.com>
-- 
2.26.2
