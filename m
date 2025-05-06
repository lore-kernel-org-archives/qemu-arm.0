Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad189146fb4sm708483366b.10.2025.05.06.05.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 05:57:16 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 761AE5FAAC;
	Tue,  6 May 2025 13:57:15 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	David Hildenbrand <david@redhat.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Laurent Vivier <lvivier@redhat.com>,
	qemu-arm@nongnu.org,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Markus Armbruster <armbru@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	John Snow <jsnow@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Fabiano Rosas <farosas@suse.de>,
	Peter Maydell <peter.maydell@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Nabih Estefan <nabihestefan@google.com>,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 04/14] Running with --enable-ubsan leads to a qtest failure
Date: Tue,  6 May 2025 13:57:05 +0100
Message-Id: <20250506125715.232872-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250506125715.232872-1-alex.bennee@linaro.org>
References: <20250506125715.232872-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: VhsQR0zXAFxw

From: Nabih Estefan <nabihestefan@google.com>

  ../tests/qtest/libqos/igb.c:106:5: runtime error: load of misaligned address 0x562040be8e33 for type 'uint32_t', which requires 4 byte alignment

Instead of straight casting the uint8_t array, we use use ldl_le_p and
lduw_l_p to assure alignment is correct against uint32_t and uint16_t.

Signed-off-by: Nabih Estefan <nabihestefan@google.com>
Reviewed-by: Laurent Vivier <lvivier@redhat.com>
Tested-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20250429155621.2028198-1-nabihestefan@google.com>
[AJB: fix commit message, remove unneeded casts]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/qtest/libqos/igb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/libqos/igb.c b/tests/qtest/libqos/igb.c
index f40c4ec4cd..7df9272069 100644
--- a/tests/qtest/libqos/igb.c
+++ b/tests/qtest/libqos/igb.c
@@ -104,10 +104,10 @@ static void igb_pci_start_hw(QOSGraphObject *obj)
     e1000e_macreg_write(&d->e1000e, E1000_RDT(0), 0);
     e1000e_macreg_write(&d->e1000e, E1000_RDH(0), 0);
     e1000e_macreg_write(&d->e1000e, E1000_RA,
-                        le32_to_cpu(*(uint32_t *)address));
+                        ldl_le_p(address));
     e1000e_macreg_write(&d->e1000e, E1000_RA + 4,
                         E1000_RAH_AV | E1000_RAH_POOL_1 |
-                        le16_to_cpu(*(uint16_t *)(address + 4)));
+                        lduw_le_p((address + 4)));
 
     /* Set supported receive descriptor mode */
     e1000e_macreg_write(&d->e1000e,
-- 
2.39.5
