Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp1091955njb;
        Fri, 6 Dec 2024 11:29:13 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVoUK+sxu62yFOyKOEcTvk9FLtzbgAD+wYGMtPQdcdV8cMAhv0vYl2li5/TMYvzSB8Fx1P5Esy9M33cEQ==@linaro.org
X-Received: by 2002:a17:902:ea08:b0:215:4b92:2656 with SMTP id d9443c01a7336-21614d5e2bamr58789895ad.31.1733513353472;
        Fri, 06 Dec 2024 11:29:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733513353; cv=none;
        d=google.com; s=arc-20240605;
        b=leXJtrRJQ/qKu0k1ov7u1DrbgM3DKswPrjUVnHfh/DscFG+ZIh9eUCz0KzIc9QL6AR
         ndqQxUdAPZRnhIlr0iyh8gCx/loPGbisRQeLhxS1QZuEpvxHt9LTvAgdPBDqmiwHjIdg
         3Lyf6IhpLcYVXyDUkwmFjQigdiIXZZe40+dZ1sN6c2r5PSeCEva7HNf+mlYU0Yid/Y7a
         k2RVUBotjKCD6NTkpZCeH4lD6dk7u77OPKPLKErxB2OCuebZS63jOCv7jSHh2lbkBu8F
         cpqfVNBtjLgfGdQv1GeRQY37B0YeQj7x23Hfu0YpMHniN4ozqb+gkAjMrHVIki10iE59
         ATeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=KcbaNjWF8lnwvj+PtEoJozlcQBiv6h5KPfhVvS5OAGE=;
        fh=SSHeLyiOI6oPU/StgypIjQHXkSV1bHaL5ggUDPHzJuQ=;
        b=CakG+rslHLlsgaGLU3hwsToMx7+RsJ3dXhBF0X0ByBygeLCJl1hZbZGyCkVb+MDXh6
         TaUFpjCQxN+bThHwc0l8XUMDKDCMDh61bOYi4uYTCb2YUoBmqh5qJwuGx4CdTFMM3XDd
         7bbfccATPDjTaWdWme2X7LLLR0bVXNlR2vrvtzjeUuL3CYMYS2cmyH6PgNLprjVDJu8x
         dt010EK8yBAHJNuWUnz6bQfQAWG5zIYrnQUPiriediihTGYe1dDi2WWBlt2hgbD27Foq
         0j746nXgUcRsIYF64jw9PADbP/MpxoV732GoGr8UvzT7TiUBYKR07Zy5NmENkIe7XhG6
         yXpA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=icGh8Tvp;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-215f9085b18sor30608515ad.14.2024.12.06.11.29.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 06 Dec 2024 11:29:13 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=icGh8Tvp;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733513353; x=1734118153; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KcbaNjWF8lnwvj+PtEoJozlcQBiv6h5KPfhVvS5OAGE=;
        b=icGh8TvpK2Gof6DfctFruw/LSnKHT8iJyfQZKzug3JXQbkF9T5AavdUF+4qFr2T+fM
         dJNIsuzD3TvPFV139Uy+GgYM2t7XxF+RsQaY8my17U05mbrAO8mnrVMPQ1Myo/n5gjIP
         hIbxzutjORd/4c2vgPHeLgsMJxtEgGegOkPP9G4n6qOkfyzgTFCdWs0ZAMYyR+hcMnGz
         a8O2X/QlM6h8n5PYRKGvA9m+aHxDibjaaRWqmjBKzyIpw5j97apefKZA8PIoeJuHlS6C
         gbdw7n4MK/E6KLjLbW4H0N/YRCmC81kbc+HZNa+tDa9fse9ZN6HG64emyTwHN6tS9i+k
         BrwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733513353; x=1734118153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KcbaNjWF8lnwvj+PtEoJozlcQBiv6h5KPfhVvS5OAGE=;
        b=UVV57d9Hbwfuj3o9v86hrS3F7kGA7XJ11sClvUlcdcNR4rD/sHxQ/jQGBIczn/r8RU
         gU/IWD1f3XDPoKyMVY916H0GcSEF2SgsnCf5OJeKtVZiFeaPu5U7c80nEbJ/SHQJl4Ht
         c/6wlLqvuybgWsPaRI9z9D5sXGIcqwnOWXuo5d8bAtmV1vdcjbyC5rhPPu+OkYkoLPew
         EnHTLaxl9JOtucSjXgAI3JYbdeH6z3eR+1OQXXpopohYe5mNOYFyp/w3Qto5M8kQS0sc
         mBUdtFKbHFDNDsJCPNeVxXwFKgDyCdaq7MF3R/W5NVISEaE2On4+6Dkl4OIJCpJGOmVr
         TL6w==
X-Forwarded-Encrypted: i=1; AJvYcCWkmioCZdezyV+81yolZ/7CKLBLycFTLZncgltceumjXmLsRIlxVPBLmqzMy3MCFepenoVwZLRacfjgSw==@linaro.org
X-Gm-Message-State: AOJu0YwZ/FoKzpJYOBWTWSeiRWXCzcFQZJBzXMZN04lG4e656lk/NtB1
	IHIrqWGLs1SfIHKu3gQaIg2gjNuwq0bZ/vxiPejgHUACJEIeqqFPG+3a3Wc7/fYu9g==
X-Gm-Gg: ASbGnctijWNSYZ2tIxTk2N9rmYkEfSX30arElT4XKV8PwDfV2qQpr5zSONugFD3eKXk
	CBzmIzrQ+81jXci7g2gweUN5ZWJP4iF5tf/EkUGMF+/m3fUs57dZuLl9DsDOhnh9XL5Sj267UKd
	2wWjCID2984iXbACLCc6BSGUNQh83gCUCe/3xTo4exgilCHDAGyV7Wd23MyaqSVub3YtYDeqWpS
	8M0nZ76NDdPGtzQYLw4IPsTzwpUdEecwMr8K8ZnLAuNLCAfeQ6of7oBdYiYLzSlDhnR3yv4yMSD
	zJ5337V4
X-Google-Smtp-Source: AGHT+IHFufaYCMClPTi98G1CjKlYsKdw5Xn8o2W/Sp0Nd43LyJNVgZeaRPg2/bVDivENzf+ncij9aw==
X-Received: by 2002:a17:902:f611:b0:216:282d:c692 with SMTP id d9443c01a7336-216282dd85emr12524825ad.34.1733513353005;
        Fri, 06 Dec 2024 11:29:13 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from pc.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215f8ef9fcdsm32110205ad.146.2024.12.06.11.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 11:29:12 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-block@nongnu.org,
	philmd@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Fabiano Rosas <farosas@suse.de>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	qemu-arm@nongnu.org,
	Michael Roth <michael.roth@amd.com>,
	Peter Xu <peterx@redhat.com>,
	gustavo.romero@linaro.org,
	Yuri Benditovich <yuri.benditovich@daynix.com>,
	Eric Blake <eblake@redhat.com>,
	Andrew Melnychenko <andrew@daynix.com>,
	Konstantin Kostiuk <kkostiuk@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	manos.pitsidianakis@linaro.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 4/6] docs/devel: add information on how to setup build environments
Date: Fri,  6 Dec 2024 11:28:58 -0800
Message-Id: <20241206192900.3893118-5-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241206192900.3893118-1-pierrick.bouvier@linaro.org>
References: <20241206192900.3893118-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: iQZSv5VGrqtC

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
