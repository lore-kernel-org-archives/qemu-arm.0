Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id e11-20020a056000120b00b002e45f6ffe63sm10570412wrx.26.2023.04.17.06.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 06:43:28 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 719411FFBE;
	Mon, 17 Apr 2023 14:43:22 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Markus Armbruster <armbru@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	John Snow <jsnow@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	qemu-arm@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>,
	Kevin Wolf <kwolf@redhat.com>
Subject: [PATCH v4 6/6] qemu-options: finesse the recommendations around -blockdev
Date: Mon, 17 Apr 2023 14:43:21 +0100
Message-Id: <20230417134321.3627231-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230417134321.3627231-1-alex.bennee@linaro.org>
References: <20230417134321.3627231-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: vbY7RXQBnL/s

We are a bit premature in recommending -blockdev/-device as the best
way to configure block devices. It seems there are times the more
human friendly -drive still makes sense especially when -snapshot is
involved.

Improve the language to hopefully make things clearer.

Suggested-by: Michael Tokarev <mjt@tls.msk.ru>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20230330101141.30199-5-alex.bennee@linaro.org>

---
v3
  - more re-wording to try and approach consensus
  - add explicit warning to -snapshot option
---
 qemu-options.hx | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 59bdf67a2c..4b8855a4f7 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1143,10 +1143,22 @@ have gone through several iterations as the feature set and complexity
 of the block layer have grown. Many online guides to QEMU often
 reference older and deprecated options, which can lead to confusion.
 
-The recommended modern way to describe disks is to use a combination of
+The most explicit way to describe disks is to use a combination of
 ``-device`` to specify the hardware device and ``-blockdev`` to
 describe the backend. The device defines what the guest sees and the
-backend describes how QEMU handles the data.
+backend describes how QEMU handles the data. It is the only guaranteed
+stable interface for describing block devices and as such is
+recommended for management tools and scripting.
+
+The ``-drive`` option combines the device and backend into a single
+command line option which is a more human friendly. There is however no
+interface stability guarantee although some older board models still
+need updating to work with the modern blockdev forms.
+
+Older options like ``-hda`` are essentially macros which expand into
+``-drive`` options for various drive interfaces. The original forms
+bake in a lot of assumptions from the days when QEMU was emulating a
+legacy PC, they are not recommended for modern configurations.
 
 ERST
 
@@ -1639,6 +1651,14 @@ SRST
     the raw disk image you use is not written back. You can however
     force the write back by pressing C-a s (see the :ref:`disk images`
     chapter in the System Emulation Users Guide).
+
+    .. warning::
+       snapshot is incompatible with ``-blockdev`` (instead use qemu-img
+       to manually create snapshot images to attach to your blockdev).
+       If you have mixed ``-blockdev`` and ``-drive`` declarations you
+       can use the 'snapshot' property on your drive declarations
+       instead of this global option.
+
 ERST
 
 DEF("fsdev", HAS_ARG, QEMU_OPTION_fsdev,
-- 
2.39.2
