Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fa77bf3f01sm7499100a12.70.2025.05.06.05.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 05:57:18 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id CF7165FAC7;
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
	Alexandre Iooss <erdnaxe@crans.org>
Subject: [PATCH v2 08/14] MAINTAINERS: add Akihiko and Dmitry as reviewers
Date: Tue,  6 May 2025 13:57:09 +0100
Message-Id: <20250506125715.232872-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250506125715.232872-1-alex.bennee@linaro.org>
References: <20250506125715.232872-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: /fSeUaxyXX4+

Thanks for volunteering to help.

Cc: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d11f8ac18c..2df6c09894 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2645,6 +2645,8 @@ F: include/hw/display/ramfb.h
 
 virtio-gpu
 M: Alex Bennée <alex.bennee@linaro.org>
+R: Akihiko Odaki <akihiko.odaki@daynix.com>
+R: Dmitry Osipenko <dmitry.osipenko@collabora.com>
 S: Odd Fixes
 F: hw/display/virtio-gpu*
 F: hw/display/virtio-vga.*
-- 
2.39.5
