Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id j16-20020a056000125000b0032f983f7306sm11470293wrx.78.2023.11.15.12.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 12:55:46 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 4D8435F7B6;
	Wed, 15 Nov 2023 20:55:43 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Beraldo Leal <bleal@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	qemu-arm@nongnu.org,
	Alexandre Iooss <erdnaxe@crans.org>
Subject: [PATCH 06/10] docs/emulation: expand warning about semihosting
Date: Wed, 15 Nov 2023 20:55:38 +0000
Message-Id: <20231115205542.3092038-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231115205542.3092038-1-alex.bennee@linaro.org>
References: <20231115205542.3092038-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: uUwNcMSI4kLz

A surprising feature of calls like SYS_READC is this can cause QEMU to
indefinitely block as there is no handling for EOF.

Clarifies: https://gitlab.com/qemu-project/qemu/-/issues/1963
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/about/emulation.rst | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/docs/about/emulation.rst b/docs/about/emulation.rst
index 0ad0b86f0d..a2eefe3f3f 100644
--- a/docs/about/emulation.rst
+++ b/docs/about/emulation.rst
@@ -129,8 +129,9 @@ causing most hypervisors to trap and fault on them.
 .. warning::
    Semihosting inherently bypasses any isolation there may be between
    the guest and the host. As a result a program using semihosting can
-   happily trash your host system. You should only ever run trusted
-   code with semihosting enabled.
+   happily trash your host system. Some semihosting calls (e.g.
+   ``SYS_READC``) can block execution indefinitely. You should only
+   ever run trusted code with semihosting enabled.
 
 Redirection
 ~~~~~~~~~~~
-- 
2.39.2
