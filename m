Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id g6sm36900389wro.29.2019.05.23.03.25.36
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 May 2019 03:25:40 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id D53841FF8C;
	Thu, 23 May 2019 11:25:33 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH  v2 16/28] editorconfig: add settings for .s/.S files
Date: Thu, 23 May 2019 11:25:20 +0100
Message-Id: <20190523102532.10486-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190523102532.10486-1-alex.bennee@linaro.org>
References: <20190523102532.10486-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: OImNexCu0kum

We are starting to add assembler foe tests/tcg so lets make sure we
get the mode right.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 .editorconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/.editorconfig b/.editorconfig
index 15828833938..df6db65531d 100644
--- a/.editorconfig
+++ b/.editorconfig
@@ -26,6 +26,11 @@ file_type_emacs = makefile
 indent_style = space
 indent_size = 4
 
+[*.{s,S}]
+indent_style = tab
+indent_size = 8
+file_type_emacs = asm
+
 [*.{vert,frag}]
 file_type_emacs = glsl
 
-- 
2.20.1
