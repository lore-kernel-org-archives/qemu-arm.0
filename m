Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp462218njb;
        Thu, 5 Dec 2024 14:22:54 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVRlHsLg1PTG+DvgmBJm36Qh6ImpbwLhVFrGGCSAgMBXKEUqn8Ljxx9giDBbe+XxOq29B20EFjDBxptSw==@linaro.org
X-Received: by 2002:a17:903:2a84:b0:216:1357:8df8 with SMTP id d9443c01a7336-21614da40e6mr9208555ad.43.1733437373723;
        Thu, 05 Dec 2024 14:22:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733437373; cv=none;
        d=google.com; s=arc-20240605;
        b=ZQWtKHDg5QYU3EFc6TO3hUze8kkfj6OLY0r/W5iE+oDdyl9y2EHx1RXZtB2QkbkZoB
         kB0ZUZzJUx99V0Q5VHe1JJR+pul/Z6hBwiEHB1Pn3dDGiIbVlFOljI4mikyVXouEe+7j
         0bZITUC1+9RyIZsDdxHZ5kc+r+vDKEYWKDrEci1dNxJl96pJteiol6FAuCsRVPFXdL9V
         a19mRYbPEVoqvVv5o48l4sO6G0uSy0513HhVQJl6UNznn0V9lzbJy+i47NwmrnJJdfpC
         9YSUZfbmnA97xwUu9ltzzDBkBTwk4rjdOfz+IONMcJarKDNj38dBBj/BnPoLmuKmq5iU
         rx4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=KcbaNjWF8lnwvj+PtEoJozlcQBiv6h5KPfhVvS5OAGE=;
        fh=SQD7L+I5PXeZjYbmV4yT3VG2CZkPEAywLpFDU0FSCIA=;
        b=WeRuYEjugN1ZlqOs+ZctBHaNL56rZAYWCghn4BwEaFo2G6pb8awIMWL2mI78ssfQTd
         Vz/rjpe65Y8MytO/pOktndQg2JtwPsfTIM0xRAtdQPBg/66TWfWnGujKaZyz76vnQegD
         yjCpySmgOqaAoZTesQD/TJ78fxCIHkHTr50Z25tOgljxrLsAjtbKX+FiLdo62vHUeuNd
         9suPy09oIVR8q5RNNR2yMj6r0eqKddwxxFyChfKPaJpbgEeHjVF1y7em3L0TGf0lsbaV
         IyzcfGyrwhBPlDij5VElbQwB8TXp6fd6tI1ZR5dEERsSXUhwC/zd+yQusRaEFHsk3GsX
         fl2Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wMIpQsUL;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-215f8e91af3sor17261515ad.7.2024.12.05.14.22.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 05 Dec 2024 14:22:53 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wMIpQsUL;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733437373; x=1734042173; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KcbaNjWF8lnwvj+PtEoJozlcQBiv6h5KPfhVvS5OAGE=;
        b=wMIpQsULSjDWTjMj+X/fjHAqu8w05klKoKX2CoAVRZNxK36aCu6/tCXgLHs126OVEr
         djKwnBV8yu/DxvK2bHS2mUaapFyv+Ck6lyE6b4C8+uZHevXwX8JgnzJjiV//EhUrGDIU
         8mJ8PuZqGYyzUPDTyhHzim7wU/OZoH4UdP2DYvcrIf9LGMwrPQOJzzOEQp4UVhOZHipo
         9hN77Yvv4bRnzPOdUUm06BUseIcYhTeNZg9hvtccbxbmqaU95tVjHwpGU2yaiMA/412D
         4txd+pfMkpY338dbZ/brtFGML8r3dNu9YZjt4fMsKjnfqlc+hklpS9RCZLPPWrOlRnO2
         +L9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733437373; x=1734042173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KcbaNjWF8lnwvj+PtEoJozlcQBiv6h5KPfhVvS5OAGE=;
        b=uUufOhP6AgddPW6R4xJAZ3xCe0TaxVprOZh1V7dhxQRb8rr3a+mmJXKPmbwwdun6OF
         7aD2L/+oOJTMV5Z1GUvitopEYgPrM5nY/CQLDmJt8cXVzWSBePCJrFFk3pO4ZiKnoO1i
         tz6a+LrOZWdwTukIM5s/ewIwfoj+WSUAcyCfxOXXLSEjCEp+e/Y+4cdCBIVaz3OqY9JY
         gokc2aUjBT1sgriQ/vdJ7AQhAmdSSnS83lpD9FDYPhzeNQbMnObo7rDA8ZpXjBge3HVP
         Jwj5g/ew9t0EdEusuPkqtf6vt39BULgvmH8RRgkC9B4uS2+4ePegYhqPwUYbGqqSlRsS
         XRcA==
X-Forwarded-Encrypted: i=1; AJvYcCV33MjAhNFHOZ2aD7wmpKjMBpo2cVLL+QVBggk+YY0xpGP9vFStQECBycLAHUE0SIhU57Wj4/5FjQC5AQ==@linaro.org
X-Gm-Message-State: AOJu0YzT/VrLoDR1HaU6xghuUoJf7hzjL0cvLF64t97oMiqQaJF8ADHt
	9JR6Sf2qmzUKpfVGX9owImxnLYvP6/L563IwFNHgLO571TMidxNBJMGYopyx3WzcGg==
X-Gm-Gg: ASbGncuctWlokvOgLA66VSeZ8bRca2pjC6jtvzwqJQF/EjukKmfYTdxYQ6LhNfwXzXT
	SbRKU1XW/koN1hpIlP+OntUnmPqZYeAfYsy+XDQZQPuGKHg8G8aoZmEYFqyOLCmQXvIjijsINnO
	TGc3Kmxi8jukFRd1OTu8UKVxRqy03shNhncQHL2Mfe9+RAov4g/iHvRHikxaIQeZ6tqfAE5ETe+
	NfiMDY33XB2O5uYa5FM0mRwFUXX/VJadkxWCU1JZMTbmWqmplqrmwuIGYlCA3GaWMB5KwVw/i9L
	ubIxo/57
X-Google-Smtp-Source: AGHT+IHIbtAAqdAFW+Oy5fuBgsr/s1pWnvnmvxuaSKy/z0uO/rzsU77P4JYdSX7D+Q1C5liHGAtQqQ==
X-Received: by 2002:a17:903:41c9:b0:215:620f:8de4 with SMTP id d9443c01a7336-21614d1a449mr7912055ad.2.1733437373275;
        Thu, 05 Dec 2024 14:22:53 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215f8f0b571sm17310435ad.183.2024.12.05.14.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 14:22:52 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Fabiano Rosas <farosas@suse.de>,
	Kevin Wolf <kwolf@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	gustavo.romero@linaro.org,
	Andrew Melnychenko <andrew@daynix.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	Konstantin Kostiuk <kkostiuk@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Peter Xu <peterx@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Yuri Benditovich <yuri.benditovich@daynix.com>,
	Jason Wang <jasowang@redhat.com>,
	Michael Roth <michael.roth@amd.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	manos.pitsidianakis@linaro.org,
	qemu-block@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 4/6] docs/devel: add information on how to setup build environments
Date: Thu,  5 Dec 2024 14:22:39 -0800
Message-Id: <20241205222241.3789437-5-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241205222241.3789437-1-pierrick.bouvier@linaro.org>
References: <20241205222241.3789437-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: mOZhq+CXcV/7

MacOS and Linux are straightforward, but Windows needs a bit more
details.

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
