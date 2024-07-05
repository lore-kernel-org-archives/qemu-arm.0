Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-58cb2b83380sm3333502a12.74.2024.07.05.01.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 01:40:48 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id C44435F8AF;
	Fri,  5 Jul 2024 09:40:47 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Thomas Huth <thuth@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Mads Ynddal <mads@ynddal.dk>,
	Yanan Wang <wangyanan55@huawei.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Peter Xu <peterx@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paul Burton <paulburton@kernel.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH v2 01/40] tests/lcitool: fix debian-i686-cross toolchain prefix
Date: Fri,  5 Jul 2024 09:40:08 +0100
Message-Id: <20240705084047.857176-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240705084047.857176-1-alex.bennee@linaro.org>
References: <20240705084047.857176-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: bScu4fqqbeSz

I guess we never noticed and tried to build with this cross image. Fix
the toolchain prefix so we actually build 32 bit images.

Message-Id: <20240628124258.832466-2-alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/dockerfiles/debian-i686-cross.docker | 2 +-
 tests/lcitool/refresh                             | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/docker/dockerfiles/debian-i686-cross.docker b/tests/docker/dockerfiles/debian-i686-cross.docker
index f1e5b0b877..f4ef054a2e 100644
--- a/tests/docker/dockerfiles/debian-i686-cross.docker
+++ b/tests/docker/dockerfiles/debian-i686-cross.docker
@@ -169,7 +169,7 @@ endian = 'little'\n" > /usr/local/share/meson/cross/i686-linux-gnu && \
 
 ENV ABI "i686-linux-gnu"
 ENV MESON_OPTS "--cross-file=i686-linux-gnu"
-ENV QEMU_CONFIGURE_OPTS --cross-prefix=x86_64-linux-gnu-
+ENV QEMU_CONFIGURE_OPTS --cross-prefix=i686-linux-gnu-
 ENV DEF_TARGET_LIST x86_64-softmmu,x86_64-linux-user,i386-softmmu,i386-linux-user
 # As a final step configure the user (if env is defined)
 ARG USER
diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
index b25e3ac4dd..ac803e34f1 100755
--- a/tests/lcitool/refresh
+++ b/tests/lcitool/refresh
@@ -167,7 +167,7 @@ try:
 
     generate_dockerfile("debian-i686-cross", "debian-11",
                         cross="i686",
-                        trailer=cross_build("x86_64-linux-gnu-",
+                        trailer=cross_build("i686-linux-gnu-",
                                             "x86_64-softmmu,"
                                             "x86_64-linux-user,"
                                             "i386-softmmu,i386-linux-user"))
-- 
2.39.2
