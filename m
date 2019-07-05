Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id d9sm13335593wrb.71.2019.07.05.09.04.21
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 05 Jul 2019 09:04:22 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 8C7421FF8C;
	Fri,  5 Jul 2019 17:04:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Laurent Desnogues <laurent.desnogues@gmail.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH  v1 1/5] target/arm/vfp_helper: Call set_fpscr_to_host before updating FPSCR reg
Date: Fri,  5 Jul 2019 17:04:17 +0100
Message-Id: <20190705160421.19015-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190705160421.19015-1-alex.bennee@linaro.org>
References: <20190705160421.19015-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: QRIIF5/KX6uh

From: Philippe Mathieu-Daudé <philmd@redhat.com>

In commit e9d652824b0 we extracted the vfp_set_fpscr_to_host()
function but failed at calling it in the correct place, we call
it after xregs[ARM_VFP_FPSCR] is modified.

Fix by calling this function before we update FPSCR.

Reported-by: Laurent Desnogues <laurent.desnogues@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Laurent Desnogues <laurent.desnogues@gmail.com>
Tested-by: Laurent Desnogues <laurent.desnogues@gmail.com>
Message-Id: <20190705124318.1075-1-philmd@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/vfp_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
index 46041e3294..9710ef1c3e 100644
--- a/target/arm/vfp_helper.c
+++ b/target/arm/vfp_helper.c
@@ -197,6 +197,8 @@ void HELPER(vfp_set_fpscr)(CPUARMState *env, uint32_t val)
         val &= 0xf7c0009f;
     }
 
+    vfp_set_fpscr_to_host(env, val);
+
     /*
      * We don't implement trapped exception handling, so the
      * trap enable bits, IDE|IXE|UFE|OFE|DZE|IOE are all RAZ/WI (not RES0!)
@@ -217,8 +219,6 @@ void HELPER(vfp_set_fpscr)(CPUARMState *env, uint32_t val)
     env->vfp.qc[1] = 0;
     env->vfp.qc[2] = 0;
     env->vfp.qc[3] = 0;
-
-    vfp_set_fpscr_to_host(env, val);
 }
 
 void vfp_set_fpscr(CPUARMState *env, uint32_t val)
-- 
2.20.1
