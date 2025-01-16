Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c7499884sm65557275e9.5.2025.01.16.08.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 08:12:15 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id C7FE6608D4;
	Thu, 16 Jan 2025 16:03:08 +0000 (GMT)
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
Subject: [PATCH v3 24/37] docs/devel/style: add a section about bitfield, and disallow them for packed structures
Date: Thu, 16 Jan 2025 16:02:53 +0000
Message-Id: <20250116160306.1709518-25-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250116160306.1709518-1-alex.bennee@linaro.org>
References: <20250116160306.1709518-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: yIy8I7P33G4+

From: Pierrick Bouvier <pierrick.bouvier@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Tested-by: Stefan Weil <sw@weilnetz.de>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20250110203401.178532-3-pierrick.bouvier@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/devel/style.rst | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/docs/devel/style.rst b/docs/devel/style.rst
index 2f68b50079..d025933808 100644
--- a/docs/devel/style.rst
+++ b/docs/devel/style.rst
@@ -416,6 +416,26 @@ definitions instead of typedefs in headers and function prototypes; this
 avoids problems with duplicated typedefs and reduces the need to include
 headers from other headers.
 
+Bitfields
+---------
+
+C bitfields can be a cause of non-portability issues, especially under windows
+where `MSVC has a different way to lay them out than GCC
+<https://gcc.gnu.org/onlinedocs/gcc/x86-Type-Attributes.html>`_, or where
+endianness matters.
+
+For this reason, we disallow usage of bitfields in packed structures and in any
+structures which are supposed to exactly match a specific layout in guest
+memory. Some existing code may use it, and we carefully ensured the layout was
+the one expected.
+
+We also suggest avoiding bitfields even in structures where the exact
+layout does not matter, unless you can show that they provide a significant
+usability benefit.
+
+We encourage the usage of ``include/hw/registerfields.h`` as a safe replacement
+for bitfields.
+
 Reserved namespaces in C and POSIX
 ----------------------------------
 
-- 
2.39.5
