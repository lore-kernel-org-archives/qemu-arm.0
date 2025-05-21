Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d4967c9sm924730066b.129.2025.05.21.09.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 09:42:55 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id E1C565F9FD;
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
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH v3 09/20] MAINTAINERS: add myself to virtio-gpu for Odd Fixes
Date: Wed, 21 May 2025 17:42:39 +0100
Message-Id: <20250521164250.135776-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250521164250.135776-1-alex.bennee@linaro.org>
References: <20250521164250.135776-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 5qRx3Dpc/TVD

Seeing as I've taken a few patches to here now I might as well put
myself forward to maintain virtio-gpu. I've marked it as Odd Fixes as
it is not my core focus. If someone with more GPU experience comes
forward we can always update again.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - s/M:/S:/ for the maintainer entry
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 818d7b9d5f..8dfb393c06 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2673,7 +2673,8 @@ F: hw/display/ramfb*.c
 F: include/hw/display/ramfb.h
 
 virtio-gpu
-S: Orphan
+M: Alex Bennée <alex.bennee@linaro.org>
+S: Odd Fixes
 F: hw/display/virtio-gpu*
 F: hw/display/virtio-vga.*
 F: include/hw/virtio/virtio-gpu.h
-- 
2.39.5
