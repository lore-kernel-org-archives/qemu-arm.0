Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id w96sm15739393wrc.33.2017.07.04.07.48.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Jul 2017 07:48:09 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id D68673E21EE;
	Tue,  4 Jul 2017 15:49:10 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RISU PATCH 02/11] reginfo.c: always return 1 on OP_TESTEND
Date: Tue,  4 Jul 2017 15:48:50 +0100
Message-Id: <20170704144859.17644-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170704144859.17644-1-alex.bennee@linaro.org>
References: <20170704144859.17644-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: +rHhLTF+vJAo

In the master/apprentice setup the response byte of 1 is returned by
write_fn. However when tracing it will happily report 0 as it
successfully writes the last bytes. To avoid running of the end when
tracing we just always return 1 at this point.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 reginfo.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/reginfo.c b/reginfo.c
index d9d37b3..76f24f9 100644
--- a/reginfo.c
+++ b/reginfo.c
@@ -39,7 +39,10 @@ int send_register_info(write_fn write_fn, void *uc)
 
     switch (op) {
     case OP_TESTEND:
-        return write_fn(&ri, sizeof(ri));
+        write_fn(&ri, sizeof(ri));
+        /* if we are tracing write_fn will return 0 unlike a remote
+           end, hence we force return of 1 here */
+        return 1;
     case OP_SETMEMBLOCK:
         memblock = (void *)(uintptr_t)get_reginfo_paramreg(&ri);
         break;
-- 
2.13.0
