Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp1619120lfo;
        Fri, 29 Jan 2021 17:53:27 -0800 (PST)
X-Received: by 2002:adf:d850:: with SMTP id k16mr7285255wrl.191.1611971606950;
        Fri, 29 Jan 2021 17:53:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611971606; cv=none;
        d=google.com; s=arc-20160816;
        b=EJAowAK+/PcOoJixX7Upo97Se9Hxaj2y8t1agV5uDHmpV9QNOjuoyIOLeX5akk/G7b
         /7VVQRv+s4IqVqrgDdE4p7SNs/dGVWzjhohwA2mbNgodP7Sf/xPFBVRSnlKav0YWpW2X
         yVPIhEsJydkuGDAAqAllGQVoiNYjK/uIYivw2N9o5TOdWk4M0KmYGOsHw/6JLEd6SU7O
         CK4l9adH/mibbB2kixFl+V+sS6A+VKrcrQKnBTTsilDXba7QP9yww5XtPObUje07JCOc
         4m01m9YfSXfJh6vLOcEx8cAtjhUMerSWFSp9iLjdHwBNeNlcSqr+5rxyADUfoNwZDfRF
         zI7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=dDZADzgKI5lXuqqUK6CV2RYB4kAOXUW22/2lumwj8o4=;
        b=AEqHE9e1TksAyWh/d+WqIdoX1EUC3tcF4MumdOapxDckUL+0PHD9EIokCN+gQB8hJA
         EwtxXhNcJipB7gcq6mhHsALm0BKwXn96Hy74XlZ8YDZvEK9DWvs8nQ4flg9vXlw6JxGO
         dTz6MlGtTpV3G9uxRb0NbtgQa5lx5fnEZ2K2dBg1yoxHMC68IPZmRL8fZSFU8ZqW7Q5w
         gz1zLPJHtJcn17piUEIrkoj1eptftxuHzNjFOzLmtbK3oEoNxy1dgACJ3QUbLRRv2uHe
         84it61jfjiSP08nOmmHqhCE79bfiHLl1JN4BsPE0oMKEuykWeQbwwp9Ej6xmrYGUlMQK
         w2zA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=e7psjHWN;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v3sor5975836wrr.61.2021.01.29.17.53.26
        (Google Transport Security);
        Fri, 29 Jan 2021 17:53:26 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=e7psjHWN;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dDZADzgKI5lXuqqUK6CV2RYB4kAOXUW22/2lumwj8o4=;
        b=e7psjHWNaDe5BRPalel5z+UrUPQyCYHO0ADPAqwnXvE6/jKDRHnq865wvhM3CvcziS
         81EyjqLup5Sso5l2NVZ/0wY2xzImn5JfNEpSNIBoIBengxfy1LzI66lsP+ni/80f/evR
         U7QLC+B3eBq5pi+hy3v4oWie/DVjl15VvVl+DUC7b4bFZ82n+IBpLOg69cciuSH0bv0o
         ugmYLJK5GlHsO6ioN/+OP/utD5jbLp9Mf2b2fwCAn07n5bGBKAg2Ljhf/XruZU6V7ADq
         ieVbF8YOSHcYMgG6rdoDn8FpNs1Ulo8zayvnM2zRRrDOTV3lmjsv5yKhGHhUzizRmIXS
         CcDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=dDZADzgKI5lXuqqUK6CV2RYB4kAOXUW22/2lumwj8o4=;
        b=bBFeDfjCPYs3LG8ey951gwU2R9vKiMLGLjqfbgoIyqDhs0xIPGie8qf3Dfr6++FDd0
         NL6FopbTczXn7+5vwl/RCXtUDAYZ2X2G7dhzDIYNXuoCsEmjV8mv3Xt9BGDmXLMBxxuH
         8VmpjgltbPpirvwkX5Eg1q9CC65PKsKftHDtXRwRZSFjVClYks+xqRyKdzh/ao5WK1j4
         TjvwK3k+kQB+55em0vfDCdiu5et8WtnCWI3DUui/D99avx4mUgTvNug4pW+xXWvckAjN
         cDJUp99HAWHzdrIKId9No1mVtFCBFCKJLyquK3vK9eUcVqLeVg58WszRQ60AF7mN9cnu
         Y2Qw==
X-Gm-Message-State: AOAM532RE2jDQtPstVZLQO8P49C1nNduCyi8nEkqqKJ/SH4mxVWTpSI7
	Hcsjk0OH20ltD+c6sZehP+M=
X-Google-Smtp-Source: ABdhPJxaH/w2Fme7el93QIXUQzDffvAxEB63h7HSmXGa9jkoVnLMptaWM3d09a23cIwVkku9tHUZXg==
X-Received: by 2002:a5d:5049:: with SMTP id h9mr7559886wrt.404.1611971606779;
        Fri, 29 Jan 2021 17:53:26 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net. [83.57.169.13])
        by smtp.gmail.com with ESMTPSA id d13sm14972889wrx.93.2021.01.29.17.53.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jan 2021 17:53:26 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	kvm@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Fam Zheng <fam@euphon.net>,
	Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	Claudio Fontana <cfontana@suse.de>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org
Subject: [PATCH v5 11/11] .travis.yml: Add a KVM-only Aarch64 job
Date: Sat, 30 Jan 2021 02:52:27 +0100
Message-Id: <20210130015227.4071332-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210130015227.4071332-1-f4bug@amsat.org>
References: <20210130015227.4071332-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: woCo3uTj8UCJ

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
