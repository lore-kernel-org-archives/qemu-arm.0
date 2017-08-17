Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id h190sm3716635wmd.4.2017.08.17.11.04.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Aug 2017 11:04:05 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 90E3B3E0190;
	Thu, 17 Aug 2017 19:04:04 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: rth@twiddle.net,
	cota@braap.org,
	batuzovk@ispras.ru
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH 1/9] tcg/README: listify the TCG types.
Date: Thu, 17 Aug 2017 19:03:56 +0100
Message-Id: <20170817180404.29334-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170817180404.29334-1-alex.bennee@linaro.org>
References: <20170817180404.29334-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 5tCGWYRsvEOu

Although the other types are aliases lets make it clear what TCG types
are available.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tcg/README | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/tcg/README b/tcg/README
index 03bfb6acd4..f116b7b694 100644
--- a/tcg/README
+++ b/tcg/README
@@ -53,9 +53,12 @@ an "undefined result".
 
 TCG instructions operate on variables which are temporaries, local
 temporaries or globals. TCG instructions and variables are strongly
-typed. Two types are supported: 32 bit integers and 64 bit
-integers. Pointers are defined as an alias to 32 bit or 64 bit
-integers depending on the TCG target word size.
+typed. A number of types are supported:
+
+  TCGv_i32 - 32 bit integer
+  TCGv_i64 - 64 bit integer
+  TCGv     - target pointer (aliased to 32 or 64 bit integer)
+  TCGv_ptr - host pointer (used for direct access to host structures)
 
 Each instruction has a fixed number of output variable operands, input
 variable operands and always constant operands.
-- 
2.13.0
