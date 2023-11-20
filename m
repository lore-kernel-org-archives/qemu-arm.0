Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id y4-20020a5d4ac4000000b003316c8ad545sm10450206wrs.76.2023.11.20.07.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 07:08:38 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id A0DC365775;
	Mon, 20 Nov 2023 15:08:34 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	David Hildenbrand <david@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-s390x@nongnu.org,
	Beraldo Leal <bleal@redhat.com>,
	qemu-arm@nongnu.org,
	devel@lists.libvirt.org,
	qemu-ppc@nongnu.org,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Marek Vasut <marex@denx.de>,
	Thomas Huth <thuth@redhat.com>,
	Chris Wulff <crwulff@gmail.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v2 07/14] docs/emulation: expand warning about semihosting
Date: Mon, 20 Nov 2023 15:08:26 +0000
Message-Id: <20231120150833.2552739-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231120150833.2552739-1-alex.bennee@linaro.org>
References: <20231120150833.2552739-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: pZbIEndvxIl/

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
