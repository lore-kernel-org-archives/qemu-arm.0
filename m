Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id b10-20020a5d550a000000b0030639a86f9dsm3597277wrv.51.2023.05.03.02.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 02:12:47 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 87E951FFBF;
	Wed,  3 May 2023 10:12:45 +0100 (BST)
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
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Fabiano Rosas <farosas@suse.de>
Subject: [PATCH 05/22] hw/arm: Select VIRTIO_NET for virt machine
Date: Wed,  3 May 2023 10:12:27 +0100
Message-Id: <20230503091244.1450613-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230503091244.1450613-1-alex.bennee@linaro.org>
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: PiwEw6g/FgBl

From: Fabiano Rosas <farosas@suse.de>

The 'virt' machine uses virtio-net-pci as a fallback when no other
network driver has been selected via command line. Select VIRTIO_NET
and VIRTIO_PCI from CONFIG_ARM_VIRT to avoid errors when PCI_DEVICES=n
(due to e.g. --without-default-devices):

$ ./qemu-system-aarch64 -M virt -accel tcg -cpu max
qemu-system-aarch64: Unsupported NIC model: virtio-net-pci

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230208192654.8854-6-farosas@suse.de>
---
 hw/arm/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 2d7c457955..4c23fbf800 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -32,6 +32,8 @@ config ARM_VIRT
     select VIRTIO_MEM_SUPPORTED
     select ACPI_CXL
     select ACPI_HMAT
+    select VIRTIO_PCI
+    select VIRTIO_NET
 
 config CHEETAH
     bool
-- 
2.39.2
