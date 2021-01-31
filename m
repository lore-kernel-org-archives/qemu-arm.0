Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp2599896lfo;
        Sun, 31 Jan 2021 03:51:26 -0800 (PST)
X-Received: by 2002:adf:9f54:: with SMTP id f20mr2709589wrg.362.1612093886503;
        Sun, 31 Jan 2021 03:51:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612093886; cv=none;
        d=google.com; s=arc-20160816;
        b=WeVG4tJM4gAfG3hTFnEO66izp+KCJ3D8XrsCO0qcmbKaSOZKTy4IjKJACH2BsxMbNc
         TeyCmwrP0n8mjY96LISUiaRjPiUdJHD6LJhTexvsaOY/IV9no7riHYi+QpUJNP192JEY
         UJojbk1FGtFhRJzSpAYTiWN+Dor79nFWUlltg5NVheIs3OPY6CgGnoheabpyDq9U/eWB
         OvEgDgfDagW+Bl2tw4mKL5CzrBTborpjUYbjhGwQBlK2JXMNhkreU0q6fB6zaFJqCODQ
         dLertfPXTv0l0q53rcrJwX4er2ptxeTSnWcukgWDvEE6s47WSwCmXVcH70rKnglILMUU
         nvMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=dDZADzgKI5lXuqqUK6CV2RYB4kAOXUW22/2lumwj8o4=;
        b=LCk/e58i9n0nykSY819UekqCKXBVvzwNy4OtfxwRj0O/OM8hcc+qJgrJmUwEYHb/MS
         +eP8lwUnjo0pOp77tAdOnR1ynyGiPaLTRqsEoRr+98PXbNYaKZCsCi2gcO9/g7QFZ0wG
         gdZtTEO4zCKJEEryhz5dslwIHnj1aHu87C8sD5+zXWjyD727simT6amHRlACyj/GdCrE
         xPoYrFvzH4n+2vriYGKSF3qth0/ARU1dRq7/yhiaydxC5RSXMtfDctHiitH53iH9yBOd
         1OcJAGCNLlumJ7r3WpnJBhRA/1XhRn4wsPd2Q5znAZRZr4i50mnFPU2AuPosGY69a8Ha
         tRnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=GPA3cPX5;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m7sor6911224wml.13.2021.01.31.03.51.26
        (Google Transport Security);
        Sun, 31 Jan 2021 03:51:26 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=GPA3cPX5;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dDZADzgKI5lXuqqUK6CV2RYB4kAOXUW22/2lumwj8o4=;
        b=GPA3cPX5JqpAFpzVcjZKg1cO1/9FihznwxhN41y6BZVikFsYSNE6B0F3b9X4VO71cp
         GyaFWx06W4d8AT7wOOpbEv7rWLR6Qtiz0j5zPdW4jmA03AE7iBWAl+qefDWnlBg1V4z9
         2hzf0FUOYthAF2ms02+vvuipScW5aEoQfhM5Srd93RmxYebfiQUiVZHh2JesAfrjbQB0
         cMFWV7UC3rXS0EBZiWNOOLMzmTv768bnbQkOi/XMIRHsBx16z36CUzwuUgCR8NuoQrgW
         IawFdKNFLz9n71Y6SFOU0j45CXgLpwvg9ZqphDDITLGf2fxUdnKHiy3pt17p/Z2oEROU
         U1cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=dDZADzgKI5lXuqqUK6CV2RYB4kAOXUW22/2lumwj8o4=;
        b=poizh4xmAg24H4iMJLXMeoGqi2nseu9ei/P1XHGhvk+6pecg1xUwfJJPvitaOB+oc8
         iu0+fakKg3opT+0y2cNopelkUF3RFdXDyDHidaO/U1qSlp3D2nOjf5C9Laq4t5OSHMHi
         YoiyKgHLqZ61dJM8m4grCiDKMH1ZtbMQnAsuociwAvdp4+D3HbWZkiCWtRtb0h1cq88k
         fmonjbVXmG/3+qyo4iRh3uaIEwamt5BSNQ4QDlMXlIIDaxu0AQjC1mA+Mo6cKZ1srzYW
         75NxM9w15JEfq8IYVTrjg6xm3Gvoulw3/Sk1Pu9cvFD1b9DKDrE0i3r8tW+trVHOxE0O
         GLTg==
X-Gm-Message-State: AOAM532SdW9Uq6w0aFBeMoYBhzMvmfuA337xAG7zar6Xeoc8RhtK4uH0
	NE2P5+ufNByxyF5KZsVsh/8=
X-Google-Smtp-Source: ABdhPJw2bZG4ateZlH907WN0fRnTRmRpW0onowzIJAbKbCMmlTsxOnsYabaEy2SQ4dqJh8Bjumsguw==
X-Received: by 2002:a1c:6289:: with SMTP id w131mr2722637wmb.0.1612093886306;
        Sun, 31 Jan 2021 03:51:26 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net. [83.57.171.7])
        by smtp.gmail.com with ESMTPSA id n19sm17298998wmq.25.2021.01.31.03.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Jan 2021 03:51:25 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	Fam Zheng <fam@euphon.net>,
	Claudio Fontana <cfontana@suse.de>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-block@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	kvm@vger.kernel.org,
	Laurent Vivier <lvivier@redhat.com>,
	qemu-arm@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	John Snow <jsnow@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 11/11] .travis.yml: Add a KVM-only Aarch64 job
Date: Sun, 31 Jan 2021 12:50:22 +0100
Message-Id: <20210131115022.242570-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210131115022.242570-1-f4bug@amsat.org>
References: <20210131115022.242570-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: +5eCtQNt/Bmi

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Add a job to build QEMU on Aarch64 with TCG disabled, so
this configuration won't bitrot over time.

We explicitly modify default-configs/aarch64-softmmu.mak to
only select the 'virt' and 'SBSA-REF' machines.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Job ran for 7 min 30 sec
https://travis-ci.org/github/philmd/qemu/jobs/731428859
---
 .travis.yml | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/.travis.yml b/.travis.yml
index 5f1dea873ec..4f1d662b5fc 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -264,6 +264,38 @@ jobs:
         - CONFIG="--disable-containers --target-list=${MAIN_SOFTMMU_TARGETS}"
         - UNRELIABLE=true
 
+    - name: "[aarch64] GCC (disable-tcg)"
+      arch: arm64
+      dist: focal
+      addons:
+        apt_packages:
+          - libaio-dev
+          - libattr1-dev
+          - libbrlapi-dev
+          - libcap-ng-dev
+          - libgcrypt20-dev
+          - libgnutls28-dev
+          - libgtk-3-dev
+          - libiscsi-dev
+          - liblttng-ust-dev
+          - libncurses5-dev
+          - libnfs-dev
+          - libnss3-dev
+          - libpixman-1-dev
+          - libpng-dev
+          - librados-dev
+          - libsdl2-dev
+          - libseccomp-dev
+          - liburcu-dev
+          - libusb-1.0-0-dev
+          - libvdeplug-dev
+          - libvte-2.91-dev
+          - ninja-build
+      env:
+        - CONFIG="--disable-containers --disable-tcg --enable-kvm --disable-xen --disable-tools --disable-docs"
+        - TEST_CMD="make check-unit"
+        - CACHE_NAME="${TRAVIS_BRANCH}-linux-gcc-aarch64"
+
     - name: "[ppc64] GCC check-tcg"
       arch: ppc64le
       dist: focal
-- 
2.26.2
