Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp2794091njb;
        Mon, 9 Dec 2024 10:31:14 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVLHxd7OZZP7Pb/9YY0Er0ubK8vKvAAKgDxr45V6pCit6YNmt2wPx41NXZkryCjtzHuNHaufhthRZTXUA==@linaro.org
X-Received: by 2002:aa7:88c3:0:b0:727:64c8:2c44 with SMTP id d2e1a72fcca58-72764c82f55mr1655290b3a.19.1733769074541;
        Mon, 09 Dec 2024 10:31:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733769074; cv=none;
        d=google.com; s=arc-20240605;
        b=aI+px+otpDNqiaoy/zDY84cjAvsQGFid7bIn1byVap2aZ67r38K7WTBueGkZwmrUIM
         m2SbiAyPnwQngg7sMiz7wJ+lIy12R2WRN6nS7qHSbSZML7HKuEzphCV17MWa8vjiHnMa
         DICGcS45ezU7gO6Wa6tUCwWbLg4kbd+p8hp2Tqo/uOxcCR703SQkrWtd0/iHDrcO0KJl
         tGVo3sMvBcfG+hYWohhBZRoHw9qOPaS62vOMY8EhlFkyB44vhzp7uK3C/436TVmEdl2+
         +pNiCtwBjTtExCZLS8ZNo+flfu/PWGtD6ZV9SdXcNee+vROaDI94IBZPhSTigc8H6U+m
         Nt4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=CBM/p49u2jieahHwz0ZRKkSAG9NHcl7RjE84D7tGV3Y=;
        fh=yQOSq7mkTgyVlnmWgCEbqgH84QkxHrzYQaoWdYN9Ptc=;
        b=DLgPQf2Hfj1bIo+14ZffMEIXQ3azFO6Q/UeXJmOk63zDs3zkZC64NIOlF4vX0zPTe8
         srInzJVCMQrPwsgM189r//NdTJc+BkTOpq8gFF7DUQ40IE6OYZNYft5YVXwTjichbL7F
         i0boxCrW36OfkY1nXXdnBL53Rg+bq2O0gSprlJqCF8S51jIETOHNI1Av1SYV8Zp4ocLF
         QhvOapPuevoMdsMEy830n8ebl80eZ8g5qqSwJJ2wNX9WYqKg4zylrJdXdWuVCwBbTSSH
         JpnvuCuI5Im2oqyrH4sK82eBkXJN28BxPUTXnBDeSP/FmaTG0uH+joudZADrUx2xnS1l
         /eCg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S0aSa+K4;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-725a2a554aesor6852490b3a.5.2024.12.09.10.31.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 09 Dec 2024 10:31:14 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S0aSa+K4;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733769074; x=1734373874; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CBM/p49u2jieahHwz0ZRKkSAG9NHcl7RjE84D7tGV3Y=;
        b=S0aSa+K4EimYDOPESaEExrjPoXf10WFwaP/46+frNnAIXPkxJryq2cCpn66PjdFBxT
         Nq6FO5R/el1GQhuyqqQugiYUgIFsbyRlxIBFdc7z4JstYUuKjp+t9lEA2U6iymz84SYF
         D2mGcjKUJ647ilTM/dBGS+CJ0/PNX2UFFnV+yv7g2XebJJnjQR9XUoLfb9BWUTz4T+sn
         a5zhgpIkkhAPEYrAafS4glIApz0QQy4mwAaSnUJpJ6S2T21DMsLtaMg3ptH4UQPtks0T
         /BrVAfEp1cP2YBqTM/Y82STmvTMX0HsMsOWOHOEQXJqhXWNw/B57/3IK17d6VeWRdXI+
         skvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733769074; x=1734373874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CBM/p49u2jieahHwz0ZRKkSAG9NHcl7RjE84D7tGV3Y=;
        b=rR+P/bkBuxc3/HDtj0isM9FCM4+I7BIcGPwol3cSYXaDF366lSliDigeMvzl+Ogi1Z
         BSeoT0IsxneyMzeaf0YfKbeSvsjFitCfOR3uB4jcxg3TdNpoTdSsXYe1w/3H0wOiXY8m
         h663QBozmgGZ8PeDoM0YRWgZ2oemwXg/SB3GqgDdEGZ1AVBe8XZOue3qkMRMS+CDL4hw
         CK1arl2LsA3KnNDLChOApBnC+VeTyczKtDW9Ec0GFkeQnmjY2hZO6pbqRgqXyp8pPdb1
         aSDhbahnBGHxLQSXR6GIBcU9RhA0HyLJODX88p/T2VYfb2KeGKpEIXd2asGsuNRkTi+k
         Zw2g==
X-Forwarded-Encrypted: i=1; AJvYcCVsDMWTBKc1oNSBy8GTmd1UY+BJ/6BjIRhS6z/kCJUhxBtM+UbCDgM7sac74BW4hHQaIj1d0StQAWoHMA==@linaro.org
X-Gm-Message-State: AOJu0YwGhdKFV0nPSx3LVhMXh9Hh6Uy6s5pZVu1FOiMnFGztYH4+37AC
	WfL+qpSNVDLp1VEHnzDj7pheZpqRpIkCIrRowecqhiLyLBkVnJGAIj8yWC7F1zrM5A==
X-Gm-Gg: ASbGncuNpWqJUhC8X4xHthmxhcwutxDbxZF5805570PWhgdg+cGBWWMXEiE9Rlt/pKn
	QGmTgos73hmdypAly2dOhP7pcsh8heLGLo3SCI1f14fvPZxY2oiF/eP8p37c9Cbx4Dh/RGq6yXM
	EATE+z9qRSYRUtQsPsAVOe0mpxMvLPmjZ9sXnFUM/92En032EsWhSfq6fWEtKvmVi3ULUvEbqKc
	twiDIgd5IHP0hVwR9Smo6WHrySPVKdpUkmB/tTjW8nb/cJNLduvBkfDgnNvRVCuhOSarxe8Iuq2
	CI01Xk3QfQK1
X-Google-Smtp-Source: AGHT+IG4xVqZ5JAJVqvox16c4c22BfLKT+SrLm8O6qDi0i0+gSqm+GrVLMSA/VkkSOW5NViTFLxw9w==
X-Received: by 2002:a05:6a20:c78c:b0:1e0:d848:9e83 with SMTP id adf61e73a8af0-1e1870cc3c8mr23445354637.25.1733769072320;
        Mon, 09 Dec 2024 10:31:12 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725e2388d37sm3322821b3a.73.2024.12.09.10.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 10:31:11 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: manos.pitsidianakis@linaro.org,
	Andrew Melnychenko <andrew@daynix.com>,
	Thomas Huth <thuth@redhat.com>,
	Michael Roth <michael.roth@amd.com>,
	qemu-block@nongnu.org,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Yuri Benditovich <yuri.benditovich@daynix.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	philmd@linaro.org,
	Fabiano Rosas <farosas@suse.de>,
	Konstantin Kostiuk <kkostiuk@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	Markus Armbruster <armbru@redhat.com>,
	gustavo.romero@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 4/6] docs/devel: add information on how to setup build environments
Date: Mon,  9 Dec 2024 10:31:02 -0800
Message-Id: <20241209183104.365796-5-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241209183104.365796-1-pierrick.bouvier@linaro.org>
References: <20241209183104.365796-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: dmwhxnt9W5kq

MacOS and Linux are straightforward, but Windows needs a bit more
details.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 docs/about/build-platforms.rst   |   4 +-
 docs/devel/build-environment.rst | 118 +++++++++++++++++++++++++++++++
 docs/devel/index-build.rst       |   1 +
 3 files changed, 122 insertions(+), 1 deletion(-)
 create mode 100644 docs/devel/build-environment.rst

diff --git a/docs/about/build-platforms.rst b/docs/about/build-platforms.rst
index d8b0445157f..482b09819c1 100644
--- a/docs/about/build-platforms.rst
+++ b/docs/about/build-platforms.rst
@@ -29,6 +29,9 @@ The `Repology`_ site is a useful resource to identify
 currently shipped versions of software in various operating systems,
 though it does not cover all distros listed below.
 
+You can find how to install build dependencies for different systems on the
+:ref:`setup-build-env` page.
+
 Supported host architectures
 ----------------------------
 
@@ -130,7 +133,6 @@ Optional build dependencies
   cross compilation using ``docker`` or ``podman``, or to use pre-built
   binaries distributed with QEMU.
 
-
 Windows
 -------
 
diff --git a/docs/devel/build-environment.rst b/docs/devel/build-environment.rst
new file mode 100644
index 00000000000..f133ef2e012
--- /dev/null
+++ b/docs/devel/build-environment.rst
@@ -0,0 +1,118 @@
+
+.. _setup-build-env:
+
+Setup build environment
+=======================
+
+QEMU uses a lot of dependencies on the host system. glib2 is used everywhere in
+the code base, and most of the other dependencies are optional.
+
+We present here simple instructions to enable native builds on most popular
+systems.
+
+You can find additional instructions on `QEMU wiki <https://wiki.qemu.org/>`_:
+
+- `Linux <https://wiki.qemu.org/Hosts/Linux>`_
+- `MacOS <https://wiki.qemu.org/Hosts/Mac>`_
+- `Windows <https://wiki.qemu.org/Hosts/W32>`_
+- `BSD <https://wiki.qemu.org/Hosts/BSD>`_
+
+Note: Installing dependencies using your package manager build dependencies may
+miss out on deps that have been newly introduced in qemu.git. In more, it misses
+deps the distribution has decided to exclude.
+
+Linux
+-----
+
+Fedora
+++++++
+
+::
+
+    sudo dnf update && sudo dnf builddep qemu
+
+Debian/Ubuntu
++++++++++++++
+
+You first need to enable `Sources List <https://wiki.debian.org/SourcesList>`_.
+Then, use apt to install dependencies:
+
+::
+
+    sudo apt update && sudo apt build-dep qemu
+
+MacOS
+-----
+
+You first need to install `Homebrew <https://brew.sh/>`_. Then, use it to
+install dependencies:
+
+::
+
+    brew update && brew install $(brew deps --include-build qemu)
+
+Windows
+-------
+
+You first need to install `MSYS2 <https://www.msys2.org/>`_.
+MSYS2 offers `different environments <https://www.msys2.org/docs/environments/>`_.
+x86_64 environments are based on GCC, while aarch64 is based on Clang.
+
+We recommend to use MINGW64 for windows-x86_64 and CLANGARM64 for windows-aarch64
+(only available on windows-aarch64 hosts).
+
+Then, you can open a windows shell, and enter msys2 env using:
+
+::
+
+    c:/msys64/msys2_shell.cmd -defterm -here -no-start -mingw64
+    # Replace -ucrt64 by -clangarm64 or -ucrt64 for other environments.
+
+MSYS2 package manager does not offer a built-in way to install build
+dependencies. You can start with this list of packages using pacman:
+
+Note: Dependencies need to be installed again if you use a different MSYS2
+environment.
+
+::
+
+    # update MSYS2 itself, you need to reopen your shell at the end.
+    pacman -Syu
+    pacman -S \
+        base-devel binutils bison diffutils flex git grep make sed \
+        ${MINGW_PACKAGE_PREFIX}-toolchain \
+        ${MINGW_PACKAGE_PREFIX}-glib2 \
+        ${MINGW_PACKAGE_PREFIX}-gtk3 \
+        ${MINGW_PACKAGE_PREFIX}-libnfs \
+        ${MINGW_PACKAGE_PREFIX}-libssh \
+        ${MINGW_PACKAGE_PREFIX}-ninja \
+        ${MINGW_PACKAGE_PREFIX}-pixman \
+        ${MINGW_PACKAGE_PREFIX}-pkgconf \
+        ${MINGW_PACKAGE_PREFIX}-python \
+        ${MINGW_PACKAGE_PREFIX}-SDL2 \
+        ${MINGW_PACKAGE_PREFIX}-zstd
+
+If you want to install all dependencies, it's possible to use recipe used to
+build QEMU in MSYS2 itself.
+
+::
+
+    pacman -S wget
+    wget https://raw.githubusercontent.com/msys2/MINGW-packages/refs/heads/master/mingw-w64-qemu/PKGBUILD
+    # Some packages may be missing for your environment, installation will still
+    # be done though.
+    makepkg -s PKGBUILD || true
+
+Build on windows-aarch64
+++++++++++++++++++++++++
+
+When trying to cross compile meson for x86_64 using UCRT64 or MINGW64 env,
+configure will run into an error because the cpu detected is not correct.
+
+Meson detects x86_64 processes emulated, so you need to manually set the cpu,
+and force a cross compilation (with empty prefix).
+
+::
+
+    ./configure --cpu=x86_64 --cross-prefix=
+
diff --git a/docs/devel/index-build.rst b/docs/devel/index-build.rst
index 0023953be36..0745c81a264 100644
--- a/docs/devel/index-build.rst
+++ b/docs/devel/index-build.rst
@@ -8,6 +8,7 @@ some of the basics if you are adding new files and targets to the build.
    :maxdepth: 3
 
    build-system
+   build-environment
    kconfig
    docs
    qapi-code-gen
-- 
2.39.5
