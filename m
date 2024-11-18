Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp2743153njc;
        Mon, 18 Nov 2024 09:24:28 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWt5wU75LrrY2hHzhzR/thXJueQZJTpVj81Uqyy+Z2C/jAD04YElwsUAEArHxt8eGSz6o63VNEnUBAfTg==@linaro.org
X-Received: by 2002:a17:902:d505:b0:20c:af5d:2ed8 with SMTP id d9443c01a7336-211d0ebf9f2mr205661415ad.36.1731950663999;
        Mon, 18 Nov 2024 09:24:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731950663; cv=none;
        d=google.com; s=arc-20240605;
        b=aN6ilfyCX9LXRIdbRh+z5lKRMwyD9w9V1LTR5koHgfnO8bt3oxloU7y2o03nRP/H+1
         /nkvbCRSN5JSEbMQUwQ9xmF+S/xrIn0Hn/thqQCDsNqF+pqKWFlHOLrKlG+xa4DbmrI8
         ffzq8X6BRSWT0R9+++h/Rp3nvgmpen0lKzfatmYLFkYVzT+2/msuSt1X/OxVOZmAfHMu
         wq53CxtaQDy0g63MsIxmH3PTSONecSAhkcocfEPDJsNlVUDf6fKcID0cH1OTXBrVjqF/
         5neLojB9ejlMpe52XvDxebUjqfXTS0v0uzcU6ACkrutY+shagy9MvFrwzJu9xbMxACwj
         0K5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=O5xaWyMs57+hnnqWUIpSm0cVCeYUwv1WfgxLMkRlc7c=;
        fh=FasV2IlvIlOgAi2Tkj+2H+FKlRa0R0qeCOxLY+wYU40=;
        b=R4IMlo+prjxk2ngCMnbbrjWDFZxt5gvki175X5svcUp1maA/psSpe1YEkkj8WwCk9N
         8mmQD5XFJcG/SGxrEU4dB24Ze+yjPNUZhKzyowCUNrQnVGO8asHrMDYKsziAVrbj5hGb
         X60npK4MGDpqWns1m29FElEnFx0+BBy0TmMVnxh65qVR4Sbp4taZUuRa4ETe2lrmADRT
         6YoZSFNALoBJ+1TYIoQ2Ifb26bb3XAjSJ8o7avooelKM/H2ea+DaB8MaC6kXSpDfdyLr
         HPUkpOq4JquOdVTvrn1+du/QQFY3p8gaX82UrEteMQN9Y8WfwJDGcL4viFTErnL6FpYt
         6g2A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qpApYIda;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-211f5162bb3sor24692515ad.15.2024.11.18.09.24.23
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 18 Nov 2024 09:24:23 -0800 (PST)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qpApYIda;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731950663; x=1732555463; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O5xaWyMs57+hnnqWUIpSm0cVCeYUwv1WfgxLMkRlc7c=;
        b=qpApYIda/KBYdmDWsICvWyZ8mBSaf54RqOvmuPa9q4wC/Y1PddblnzDg48TzIpi+i5
         jB+5GBt/B9xBI5Vv6iAyWWBF9nIU4aQUgITn5j7JLYGjEwfdcKAejMIWwA4c/69nsIyK
         S7vGbv+QmiSwHjHrWCPp0EmeAsfz2VipWpgzAMEod7ib0lFwsZKjeJs+1KaLuI9gkTi0
         1U65ho9kpf7WDvmZ00TjqT26bIs0CXwZT5zyULuAPs8yc09XD2tmnS40ZLCbnddU0deA
         GJbebjNzqRlay7sv9fFxRmZS30/PXEbZP294Zbfhur4CyBkxOEZa0reqKNYp7GOKy+BJ
         Z+jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731950663; x=1732555463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O5xaWyMs57+hnnqWUIpSm0cVCeYUwv1WfgxLMkRlc7c=;
        b=pKGEGt7qqqivIj7tskHdV+q+4MPQv5SLM8Fi6wWFJBfAOrP2zatQTfPU5M17INUdjn
         nXpoUwhCauxbaCfWapsXyb04DfBzqBYnF/doRlJEiVhwN5Tl9Fkhtlvu5PcaIBGxkrZS
         U7GyMx+BbLJyyMd0mkfXQ08FwroiWrYFgLmRHfuxdckwQ3cvBcsjs6tqYn55bmwZlvLY
         1HnRFIPWjZ9gm0O9wvDM4C06wd6NPVx94yVxKI/8vIcnnfZcSJt34nyp9qjYLzCBj3ii
         /Xg9YEqgTj6QmEllUwDyacfINfmwt3/Bev1YiOghfZ91xuUc2WXnXCDvvNR2CCDS1hXc
         5EYg==
X-Forwarded-Encrypted: i=1; AJvYcCUr/MfpUZM+4wZoPqwVHhwMKIW8SYYDKJj1CgXnQFzplfSo90p3dBhmA1YgTn9Pr3rhQQPGp3HY9F7A9w==@linaro.org
X-Gm-Message-State: AOJu0YxG7OjIYYjgk4Y9fnqXVB0mSZJqWnTe7dogXVL9K/Oi2yvDFWeV
	YBzqMoaxdzHiXUokCehteDrempvleAyLxxH/UDqHg4OxlFYga/przTXQ3KKyJR0dTQ==
X-Google-Smtp-Source: AGHT+IFd+isfj+MijvIfhlYm0YwRz6KEGHY0eaL6yeO5vKqUx6emPrFwrqa4l0559t1iCFG6uOulPQ==
X-Received: by 2002:a05:6a21:3985:b0:1dc:7907:6d67 with SMTP id adf61e73a8af0-1dc90bf49b3mr24723643637.40.1731950662036;
        Mon, 18 Nov 2024 09:24:22 -0800 (PST)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from linaro.. (216-180-64-156.dyn.novuscom.net. [216.180.64.156])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211d0f55d04sm59469765ad.264.2024.11.18.09.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 09:24:21 -0800 (PST)
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
Subject: [PATCH 7/7] docs: add a how to section
Date: Mon, 18 Nov 2024 09:23:57 -0800
Message-Id: <20241118172357.475281-8-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241118172357.475281-1-pierrick.bouvier@linaro.org>
References: <20241118172357.475281-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: ufuihYO+D9gi

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 docs/devel/build-system.rst |   2 +
 docs/how-to/index.rst       | 146 ++++++++++++++++++++++++++++++++++++
 docs/index.rst              |   1 +
 3 files changed, 149 insertions(+)
 create mode 100644 docs/how-to/index.rst

diff --git a/docs/devel/build-system.rst b/docs/devel/build-system.rst
index d42045a2325..db444787e37 100644
--- a/docs/devel/build-system.rst
+++ b/docs/devel/build-system.rst
@@ -1,3 +1,5 @@
+.. _build:
+
 ==================================
 The QEMU build system architecture
 ==================================
diff --git a/docs/how-to/index.rst b/docs/how-to/index.rst
new file mode 100644
index 00000000000..3a9d4d777df
--- /dev/null
+++ b/docs/how-to/index.rst
@@ -0,0 +1,146 @@
+.. _how-to:
+
+------
+How to
+------
+
+This section of the manual will give you some commands to do various tasks with
+QEMU. It does not intend to be complete, but to be simple.
+
+Build
+-----
+
+First you need setup your `build environment <setup-build-env>`.
+
+Then, you can build QEMU using:
+
+::
+
+    git clone https://gitlab.com/qemu-project/qemu
+    cd qemu
+    ./configure
+    ninja -C build
+    # all binaries are in ./build
+
+By default, QEMU build is optimized. You may want to switch to debug builds
+instead (non optimized, and with more runtime checks enabled):
+
+::
+
+    ./configure --enable-debug
+
+It's recommended to use sanitizers to catch issues when developing your change.
+
+::
+
+    ./configure --enable-asan --enable-ubsan
+    # Of course, you can combine debug and sanitizers if needed
+
+You can find more information on `build page <build>`.
+
+Test
+----
+
+QEMU has a lot of tests, mainly in 4 categories:
+
+::
+
+    # run tests related to TCG. They are based on Makefiles.
+    make check-tcg
+    # run system tests, running a full VM, with avocado framework
+    make check-avocado
+    # run functional tests, running a full VM, integrated with Meson
+    make check-functional
+    # run all other tests, integrated with Meson
+    make check
+
+You can find more information on `testing page<testing>`.
+
+Use QEMU
+--------
+
+To create a 20 gigabytes disk image usable with qemu-system:
+
+::
+
+    qemu-img create system.img 20g
+
+To run an x86_64 system emulated, with 4 cpus, 8G of memory and an install iso:
+
+::
+
+    qemu-system-x86_64 -smp 4 -m 8G system.img -cdrom install.iso
+
+To boot directly a Linux Kernel:
+
+::
+
+    qemu-system-x86_64 -kernel bzImage -hda system.img -append "root=/dev/hda"
+
+To boot an aarch64 system emulated, you need to specify a UEFI and associated
+pflash. Once started, you can switch to Serial output by clicking on View ->
+Serial0.
+
+::
+
+    # UEFI can be obtained from debian package qemu-efi-aarch64.
+    # First, we need to copy a file to save UEFI variables:
+    # cp /usr/share/AAVMF/AAVMF_VARS.fd .
+    qemu-system-aarch64 \
+        -m 8G \
+        -smp 4 \
+        -M virt \
+        -cpu max \
+        -device virtio-blk-pci,drive=root \
+        -drive if=none,id=root,file=system.img \
+        -drive if=pflash,readonly=on,file=/usr/share/AAVMF/AAVMF_CODE.fd \
+        -drive if=pflash,file=AAVMF_VARS.fd \
+        -cdrom install.iso
+
+To run git using QEMU user-mode:
+
+::
+
+    qemu-x86_64 /usr/bin/git --version
+
+Contribute
+----------
+
+We recommend using `git-publish <https://github.com/stefanha/git-publish>`_ for
+contributing. You need to configure `git send-email
+<https://git-send-email.io/>`_ first.
+
+::
+
+    git checkout -b my_feature
+    ... # edit, build, test
+    # When ready to send the series...
+
+    # Add upstream QEMU repo as a remote.
+    git remote add upstream https://gitlab.com/qemu-project/qemu
+    # Fetch all new content.
+    git fetch -a upstream
+
+    # Rebase your branch on top of upstream master, and include a signoff.
+    git rebase -i upstream/master --signoff
+    # Check your patches are correct.
+    ./scripts/checkpatch.pl $(git merge-base upstream/master HEAD)..HEAD
+
+    # Send your series, you'll be given a chance to edit cover letter for it.
+    git-publish
+
+    # After review, and other changes, you can send a v2 simply by using:
+    git-publish
+
+If you need to apply locally an existing series, you can use `b4
+<https://github.com/mricon/b4>`_ (installable via pip) to retrieve it:
+
+::
+
+    b4 shazam <series_msg_id>
+    # message id is an identifier present in email sent.
+    # when using patchwork, it is the last part of a series url (2024...):
+    # https://patchew.org/QEMU/20241118021820.4928-1-joel@jms.id.au/
+
+More complete information is available on our `Submit a patch page
+<submitting-a-patch>`.
diff --git a/docs/index.rst b/docs/index.rst
index 2cad84cd77c..e275a9223dd 100644
--- a/docs/index.rst
+++ b/docs/index.rst
@@ -20,5 +20,6 @@ Welcome to QEMU's documentation!
    interop/index
    specs/index
    devel/index
+   how-to/index
    codebase/index
    glossary/index
-- 
2.39.5
