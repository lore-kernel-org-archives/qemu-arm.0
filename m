Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43890367b48sm3792705e9.0.2025.01.16.08.03.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 08:03:16 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 52FBD608DF;
	Thu, 16 Jan 2025 16:03:09 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	Markus Armbruster <armbru@redhat.com>,
	Yuri Benditovich <yuri.benditovich@daynix.com>,
	Jason Wang <jasowang@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	"Dr. David Alan Gilbert" <dave@treblig.org>,
	Peter Xu <peterx@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Stefan Weil <sw@weilnetz.de>,
	Stefano Garzarella <sgarzare@redhat.com>,
	qemu-arm@nongnu.org,
	Michael Roth <michael.roth@amd.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Andrew Melnychenko <andrew@daynix.com>,
	Konstantin Kostiuk <kkostiuk@redhat.com>,
	Kyle Evans <kevans@freebsd.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	John Snow <jsnow@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Fabiano Rosas <farosas@suse.de>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Kevin Wolf <kwolf@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Warner Losh <imp@bsdimp.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v3 29/37] include/exec: fix some copy and paste errors in kdoc
Date: Thu, 16 Jan 2025 16:02:58 +0000
Message-Id: <20250116160306.1709518-30-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250116160306.1709518-1-alex.bennee@linaro.org>
References: <20250116160306.1709518-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: HSH+j6/TOh3q

A number of copy and paste kdoc comments are referring to the wrong
definition. Fix those cases.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/exec/memory.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 9458e2801d..605687befa 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -1194,7 +1194,7 @@ static inline bool MemoryRegionSection_eq(MemoryRegionSection *a,
 MemoryRegionSection *memory_region_section_new_copy(MemoryRegionSection *s);
 
 /**
- * memory_region_section_new_copy: Free a copied memory region section
+ * memory_region_section_free_copy: Free a copied memory region section
  *
  * Free a copy of a memory section created via memory_region_section_new_copy().
  * properly dropping references on all relevant members.
@@ -2510,7 +2510,7 @@ MemoryRegionSection memory_region_find(MemoryRegion *mr,
 void memory_global_dirty_log_sync(bool last_stage);
 
 /**
- * memory_global_dirty_log_sync: synchronize the dirty log for all memory
+ * memory_global_after_dirty_log_sync: synchronize the dirty log for all memory
  *
  * Synchronizes the vCPUs with a thread that is reading the dirty bitmap.
  * This function must be called after the dirty log bitmap is cleared, and
-- 
2.39.5
