Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d04b08bsm935707866b.13.2025.05.21.09.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 09:42:51 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 7DCDD5F9EB;
	Wed, 21 May 2025 17:42:50 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	John Snow <jsnow@redhat.com>,
	Fabiano Rosas <farosas@suse.de>,
	Peter Xu <peterx@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Markus Armbruster <armbru@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Gustavo Romero <gustavo.romero@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Nabih Estefan <nabihestefan@google.com>,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 04/20] tests/qtest: fix igb test failure under --enable-ubsan
Date: Wed, 21 May 2025 17:42:34 +0100
Message-Id: <20250521164250.135776-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250521164250.135776-1-alex.bennee@linaro.org>
References: <20250521164250.135776-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: xC+Yv/3Sgq6Y

From: Nabih Estefan <nabihestefan@google.com>

  ../tests/qtest/libqos/igb.c:106:5: runtime error: load of misaligned address 0x562040be8e33 for type 'uint32_t', which requires 4 byte alignment

Instead of straight casting the uint8_t array, we can use ldl_le_p and
lduw_l_p to assure the unaligned access working properly against
uint32_t and uint16_t.

Signed-off-by: Nabih Estefan <nabihestefan@google.com>
Reviewed-by: Laurent Vivier <lvivier@redhat.com>
Tested-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20250429155621.2028198-1-nabihestefan@google.com>
[AJB: fix commit message, remove unneeded casts]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - change title to reflect test that failed
  - re-phrase ldl functions to assure unaligned works
  - remove excess ()'s
---
 tests/qtest/libqos/igb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/libqos/igb.c b/tests/qtest/libqos/igb.c
index f40c4ec4cd..ab3ef6f0c3 100644
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
+                        lduw_le_p(address + 4));
 
     /* Set supported receive descriptor mode */
     e1000e_macreg_write(&d->e1000e,
-- 
2.39.5
