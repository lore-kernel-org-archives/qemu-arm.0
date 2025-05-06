Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad18950b5c3sm696344566b.159.2025.05.06.05.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 05:57:22 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 3F95E5FADB;
	Tue,  6 May 2025 13:57:16 +0100 (BST)
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
	Dongwon Kim <dongwon.kim@intel.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: [PATCH v2 12/14] ui/gtk-gl-area: Remove extra draw call in refresh
Date: Tue,  6 May 2025 13:57:13 +0100
Message-Id: <20250506125715.232872-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250506125715.232872-1-alex.bennee@linaro.org>
References: <20250506125715.232872-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: myAZvtH+/LoJ

From: Dongwon Kim <dongwon.kim@intel.com>

This partially reverts commit 77bf310084dad38b3a2badf01766c659056f1cf2
which causes some guest display corruption when gtk-gl-area
is used for GTK rendering (e.g. Wayland Compositor) possibly due to
simulataneous accesses on the guest frame buffer by host compositor
and the guest.

Fixes: 77bf310084 ("ui/gtk: Draw guest frame at refresh cycle")
Reported-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Reported-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
Message-Id: <20250214170813.2234754-1-dongwon.kim@intel.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 ui/gtk-gl-area.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/ui/gtk-gl-area.c b/ui/gtk-gl-area.c
index 2c9a0db425..9f7dc697f2 100644
--- a/ui/gtk-gl-area.c
+++ b/ui/gtk-gl-area.c
@@ -129,7 +129,6 @@ void gd_gl_area_refresh(DisplayChangeListener *dcl)
 
     if (vc->gfx.guest_fb.dmabuf &&
         qemu_dmabuf_get_draw_submitted(vc->gfx.guest_fb.dmabuf)) {
-        gd_gl_area_draw(vc);
         return;
     }
 
-- 
2.39.5
