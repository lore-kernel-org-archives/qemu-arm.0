Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp2743017njc;
        Mon, 18 Nov 2024 09:24:19 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU2wPoyjSU2c9CNASk0D1eMWHlH4SCHZONhx/FjKss37sSSTI9i3kbR6w5NQ+V1/sLLYpFRVAGe0Qj/kQ==@linaro.org
X-Received: by 2002:a17:902:ecc4:b0:212:12a2:4007 with SMTP id d9443c01a7336-21212a24570mr65129385ad.34.1731950658933;
        Mon, 18 Nov 2024 09:24:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731950658; cv=none;
        d=google.com; s=arc-20240605;
        b=Hm5/47Hw8JQ5XmJCCFisAeHyM0TXsIOSuRDJivS/Up5v1cuiPiAcA6gjwfM5e69sf1
         LBhVfKTzXI4YEIJmCnR+Czf5ruiloyAe3qggPy8ae6XDGrNh7P4q6VZC9pPIGGLXZVso
         nkDXRAy0qLuFrie7ctgvC5zcwfLph/qt9QFpx482xcvFdqLsHDjXyHN4jCowv+Lul9Fj
         kfLhF9jLcY47ebaZNuNNt7/Yv34JH9astFmJ4gYuqliTMPergQSMLltoGsqmTfBa1Eqy
         FRaFb9HGmu4ysNE8axrLTBForlVFHcHhCzeI7I4hi4bpGgT2TVn0yJ4zbzHrj363DuCb
         Vj4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=zrtTSIAZyM7Cil0D9jbVirGKiaDBwbsx28N7FRyo/s0=;
        fh=ecSRmFy0n+JgzrQb5f4+eBGvkGfiK5DjZ+ZhuetgVq0=;
        b=hkgHVuugrsx3dUwoi+cxKfQD3PF/xi2suSzB2z28h685bYU+3/vNeUva1M1bT9pMd2
         aMywkoysmARn9LLqRA3VGpE6n8F6slCaBqktW9XsWeoceyWojgiq9kzVNnA3kSDJwkTp
         rx3c9+LXTbZRT/XyCTPIHpQ8et3IDTVRpvbGonuf5V1vJ+IGxr5qw4y3GFX8nzxZe6r7
         3m+VC7ao57013CQ1OBhn4OYFu9JPzen7grf2hWwfak+pxKzRQ2Srq0FHxiQ59kC5sztf
         SMIt3EwVfaZdAdb1MINgZcJIMlpAR9/tNuz16Ot178gKZkkATMAsgkPX2IygyF09D50Q
         GF6w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZiB1u7hD;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-211c7c7f780sor58705885ad.9.2024.11.18.09.24.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 18 Nov 2024 09:24:18 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZiB1u7hD;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731950658; x=1732555458; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zrtTSIAZyM7Cil0D9jbVirGKiaDBwbsx28N7FRyo/s0=;
        b=ZiB1u7hDwgD33/uV1xLC0gWZ8Uhpoz4E0TlRGBzs4y5MWPLEhhHfGcIzg7o/NwTK0r
         NwRdQxOTCCg89X0CPae9TaPgQxL0prrcI3sTRsX207+FUGx4JHfAi7B9PvOZhdPxyMS4
         OiQZlNUhPt0nCc/K1IZXcuNrKI33TWIWBxZC8xpIF/KQ4b4x++E+uYmedH4D8m3JoZzX
         JJDMr060TPu/E4h0M8U2Fatwrx4AxyUrgl4Dhq4M3OgriLDoXhR3Qm9je2Zieeyl1OAe
         mIzLa1lpWTQdmpTVFgPjL8U+MV0pwg8tjHdc25e0ayqTqt0VoPgrx7qeBn5zuLzf3dY7
         2kMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731950658; x=1732555458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zrtTSIAZyM7Cil0D9jbVirGKiaDBwbsx28N7FRyo/s0=;
        b=Ova9ezrstkxUUMZUa5GGe7iP1zCdYHjc7ljCZlp/4QXJNB1hBrkm8aDKS6FkmOFMTq
         /KxJF/HVJi+SLOk++GzYCDfQwzCeGrlL4Y5F1xT4Vxk92+FgKjIyJJL1d3B9TrIX5spm
         mpaKbTI4OF0+lmC54RUSXDmRtkMi6mTHfKIHBIUq/4kxuAQghGNm9xYbTdZWWDvKdhSF
         jbGVVaYLv2jpkRTBRf9Ikrg7a2lxjyqQCNqrFGfbVdHltJMWS1AYYlTF8W9Ki0lCUVT0
         BsXzebGLTGWMY8yTM7zErop2a+Ta/lOye9XoZYeuYLqQkY9tw26WzEjGPdc/WoUtZqkx
         0u1g==
X-Forwarded-Encrypted: i=1; AJvYcCVgt6tqqvvVj130xHYZGbrMW34vQkM4FqlyJlnzSKbxbAHq8tPd2GMsoI+ZYY3htXVlRzoXHXlilfPWMQ==@linaro.org
X-Gm-Message-State: AOJu0YzQDeRvPMjK9FZ+oOZ1TiU65Sjl06RzKVrX8fThnOgbnzxi3ug9
	eQwMseWV5Vl30BncKRGnmO0aCQW0Qz97d0J38rJTO9dcXBN93CU67YI7WQtE5MOaNA==
X-Google-Smtp-Source: AGHT+IGHEKlIRWL+XYdRBjSjr+8KS7IdhoUvTf18r/81DSRfBRUnTVVNUgJVrL0Adv0eAFM3HfQNwQ==
X-Received: by 2002:a17:902:da92:b0:20c:c694:f6c6 with SMTP id d9443c01a7336-211d0ed25e5mr183981405ad.49.1731950658440;
        Mon, 18 Nov 2024 09:24:18 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211d0f55d04sm59469765ad.264.2024.11.18.09.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 09:24:18 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Andrew Melnychenko <andrew@daynix.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	alex.bennee@linaro.org,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	Fabiano Rosas <farosas@suse.de>,
	Kevin Wolf <kwolf@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	qemu-arm@nongnu.org,
	Yuri Benditovich <yuri.benditovich@daynix.com>,
	manos.pitsidianakis@linaro.org,
	qemu-block@nongnu.org,
	Michael Roth <michael.roth@amd.com>,
	Konstantin Kostiuk <kkostiuk@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	gustavo.romero@linaro.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 4/7] docs/devel: add information on how to setup build environments
Date: Mon, 18 Nov 2024 09:23:54 -0800
Message-Id: <20241118172357.475281-5-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241118172357.475281-1-pierrick.bouvier@linaro.org>
References: <20241118172357.475281-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: uihOnQ+o3n/y

MacOS and Linux are straightforward, but Windows needs a bit more
details.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 docs/about/build-platforms.rst   |   4 +-
 docs/devel/build-environment.rst | 114 +++++++++++++++++++++++++++++++
 docs/devel/index-build.rst       |   1 +
 3 files changed, 118 insertions(+), 1 deletion(-)
 create mode 100644 docs/devel/build-environment.rst

diff --git a/docs/about/build-platforms.rst b/docs/about/build-platforms.rst
index 6102f00aec0..c1ea53db834 100644
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
index 00000000000..d9a66f5fcc6
--- /dev/null
+++ b/docs/devel/build-environment.rst
@@ -0,0 +1,114 @@
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
