Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id i1-20020a05600c290100b003edf2dc7ca3sm1272810wmd.34.2023.05.03.02.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 02:22:32 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 3086D1FFCC;
	Wed,  3 May 2023 10:12:47 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Helge Deller <deller@gmx.de>,
	Xiaojuan Yang <yangxiaojuan@loongson.cn>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Juan Quintela <quintela@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Andrew Jeffery <andrew@aj.id.au>,
	qemu-s390x@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-arm@nongnu.org,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Beraldo Leal <bleal@redhat.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	David Hildenbrand <david@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Song Gao <gaosong@loongson.cn>,
	Joel Stanley <joel@jms.id.au>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 21/22] tests/avocado: use http for mipsdistros.mips.com
Date: Wed,  3 May 2023 10:12:43 +0100
Message-Id: <20230503091244.1450613-22-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230503091244.1450613-1-alex.bennee@linaro.org>
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ZVpY/eqs3SVP

As the cached assets have fallen out of our cache new attempts to
fetch these binaries fail hard due to certificate expirty. It's hard
to find a contact email for the domain as the root page of mipsdistros
throws up some random XML. I suspect Amazon are merely the hosts.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/avocado/replay_kernel.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/avocado/replay_kernel.py b/tests/avocado/replay_kernel.py
index f13456e1ec..fe1e901f4b 100644
--- a/tests/avocado/replay_kernel.py
+++ b/tests/avocado/replay_kernel.py
@@ -493,7 +493,7 @@ def test_mips_malta32el_nanomips_4k(self):
         :avocado: tags=endian:little
         :avocado: tags=cpu:I7200
         """
-        kernel_url = ('https://mipsdistros.mips.com/LinuxDistro/nanomips/'
+        kernel_url = ('http://mipsdistros.mips.com/LinuxDistro/nanomips/'
                       'kernels/v4.15.18-432-gb2eb9a8b07a1-20180627102142/'
                       'generic_nano32r6el_page4k.xz')
         kernel_hash = '477456aafd2a0f1ddc9482727f20fe9575565dd6'
@@ -507,7 +507,7 @@ def test_mips_malta32el_nanomips_16k_up(self):
         :avocado: tags=endian:little
         :avocado: tags=cpu:I7200
         """
-        kernel_url = ('https://mipsdistros.mips.com/LinuxDistro/nanomips/'
+        kernel_url = ('http://mipsdistros.mips.com/LinuxDistro/nanomips/'
                       'kernels/v4.15.18-432-gb2eb9a8b07a1-20180627102142/'
                       'generic_nano32r6el_page16k_up.xz')
         kernel_hash = 'e882868f944c71c816e832e2303b7874d044a7bc'
@@ -521,7 +521,7 @@ def test_mips_malta32el_nanomips_64k_dbg(self):
         :avocado: tags=endian:little
         :avocado: tags=cpu:I7200
         """
-        kernel_url = ('https://mipsdistros.mips.com/LinuxDistro/nanomips/'
+        kernel_url = ('http://mipsdistros.mips.com/LinuxDistro/nanomips/'
                       'kernels/v4.15.18-432-gb2eb9a8b07a1-20180627102142/'
                       'generic_nano32r6el_page64k_dbg.xz')
         kernel_hash = '18d1c68f2e23429e266ca39ba5349ccd0aeb7180'
-- 
2.39.2
