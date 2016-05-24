Received: by 10.25.30.65 with SMTP id e62csp848664lfe;
        Tue, 24 May 2016 10:19:10 -0700 (PDT)
X-Received: by 10.129.112.150 with SMTP id l144mr3539121ywc.251.1464110343031;
        Tue, 24 May 2016 10:19:03 -0700 (PDT)
Return-Path: <bobby.prani@gmail.com>
Received: from mail-yw0-x243.google.com (mail-yw0-x243.google.com. [2607:f8b0:4002:c05::243])
        by mx.google.com with ESMTPS id l4si18866483ywl.262.2016.05.24.10.19.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 May 2016 10:19:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of bobby.prani@gmail.com designates 2607:f8b0:4002:c05::243 as permitted sender) client-ip=2607:f8b0:4002:c05::243;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of bobby.prani@gmail.com designates 2607:f8b0:4002:c05::243 as permitted sender) smtp.mailfrom=bobby.prani@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-yw0-x243.google.com with SMTP id l126so3170141ywe.3;
        Tue, 24 May 2016 10:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=QNhlFAneAs3X5c9c69SpadvcOvnKVEo5RURyBAmHr0A=;
        b=KTvjN6+7HrfRr+Pg7/6HCYpa79R6mSi3CLT+lcL9mor/nmTBiJ5OQg6oty8DrmhhOr
         brVvKgo7Eo7W1geIfn03UAVkZwix9zG0gx+0mjsdhPc62D4r8wNoitHOueICzVb9+7Ka
         X4G8g5NjjP3a1aCTi6JfTrgl3LBLo/PdxwIQOrjlbHiw0Xu9B10BJjxT0joWdLy3nt7c
         FS53iegrEYUKucEwepl5v+qoDvPGUK5PLb7k+gWL4xEf4Y14TmHu7WFXsO8gtrvUBTzE
         V69+432j9UMs9nfs63mD6vU907Kkr1t3ydhOIu1S6XBBt/t6BbnZ43UAX/Bke7Xd9imC
         YrtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=QNhlFAneAs3X5c9c69SpadvcOvnKVEo5RURyBAmHr0A=;
        b=mZbaP4pFR/JobNJKst0Ns1HCNuXeoIAD7Q9cj//yvQSb4yplBSxtUWnzJFhsV4t2+m
         3XroesDRrrGOiioDTVN2axp9K2gmLyrTx4VxYFfdIWM/2y37v84IwtM5dApTN6He7N8X
         +OqFeaLQIqF0vOVY5kjVgY8QIHY3XDgaKw0NDN0CT1Kbwip1xqK7UoX70/ToUj6+JXaq
         QSz0jxRstKGpUldHdrovNeW2o7JgbVAlOKQwXeAEpS8xYj9PuYcMdc2ficDDMs/jfVLE
         WiKkCVmjnZAZyeXLQVHhgMua6WSa+TTyq4+r2tD5V3wHyBIlPwNn5v1l5DQnW5vFZkJB
         HWKQ==
X-Gm-Message-State: ALyK8tKokmsIWrPqhJodwKAKaY8gHcTN1QH3bq097Wi3Ehn9uQGoaB4Osp2xv4Q4y0+sWg==
X-Received: by 10.129.56.196 with SMTP id f187mr3179903ywa.111.1464110342709;
        Tue, 24 May 2016 10:19:02 -0700 (PDT)
Return-Path: <bobby.prani@gmail.com>
Received: from evgadesktop.attlocal.net (108-232-152-155.lightspeed.tukrga.sbcglobal.net. [108.232.152.155])
        by smtp.gmail.com with ESMTPSA id w125sm22676221ywd.55.2016.05.24.10.19.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 24 May 2016 10:19:02 -0700 (PDT)
From: Pranith Kumar <bobby.prani@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <rth@twiddle.net>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Sergey Fedorov <serge.fdrv@gmail.com>,
	qemu-arm@nongnu.org (open list:ARM),
	qemu-devel@nongnu.org (open list:All patches CC here)
Subject: [RFC PATCH 3/3] tcg: Add frontend support for fence gen in ARMv7
Date: Tue, 24 May 2016 13:18:56 -0400
Message-Id: <20160524171856.1000-4-bobby.prani@gmail.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20160524171856.1000-1-bobby.prani@gmail.com>
References: <20160524171856.1000-1-bobby.prani@gmail.com>
X-TUID: Jb4CoYmaVRSV

Signed-off-by: Pranith Kumar <bobby.prani@gmail.com>
---
 target-arm/translate.c | 11 +++++++++--
 tcg/tcg-op.h           |  5 +++++
 tcg/tcg-opc.h          |  2 +-
 3 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/target-arm/translate.c b/target-arm/translate.c
index c946c0e..3407176 100644
--- a/target-arm/translate.c
+++ b/target-arm/translate.c
@@ -7980,9 +7980,13 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
                 gen_clrex(s);
                 return;
             case 4: /* dsb */
+                ARCH(7);
+                return;
             case 5: /* dmb */
                 ARCH(7);
-                /* We don't emulate caches so these are a no-op.  */
+                if (TCG_TARGET_HAS_fence) {
+                    tcg_gen_fence();
+                }
                 return;
             case 6: /* isb */
                 /* We need to break the TB after this insn to execute
@@ -10330,8 +10334,11 @@ static int disas_thumb2_insn(CPUARMState *env, DisasContext *s, uint16_t insn_hw
                             gen_clrex(s);
                             break;
                         case 4: /* dsb */
+                            break;
                         case 5: /* dmb */
-                            /* These execute as NOPs.  */
+                            if (TCG_TARGET_HAS_fence) {
+                                tcg_gen_fence();
+                            }
                             break;
                         case 6: /* isb */
                             /* We need to break the TB after this insn
diff --git a/tcg/tcg-op.h b/tcg/tcg-op.h
index c446d3d..1c7e8fc 100644
--- a/tcg/tcg-op.h
+++ b/tcg/tcg-op.h
@@ -261,6 +261,11 @@ static inline void tcg_gen_br(TCGLabel *l)
     tcg_gen_op1(&tcg_ctx, INDEX_op_br, label_arg(l));
 }
 
+static inline void tcg_gen_fence(void)
+{
+    tcg_gen_op1(&tcg_ctx, INDEX_op_fence, 0);
+}
+
 /* Helper calls. */
 
 /* 32 bit ops */
diff --git a/tcg/tcg-opc.h b/tcg/tcg-opc.h
index b772d90..4696cf1 100644
--- a/tcg/tcg-opc.h
+++ b/tcg/tcg-opc.h
@@ -42,7 +42,7 @@ DEF(br, 0, 0, 1, TCG_OPF_BB_END)
 # define IMPL64  TCG_OPF_64BIT
 #endif
 
-DEF(fence, 0, 0, 0, TCG_OPF_SIDE_EFFECTS)
+DEF(fence, 0, 0, 0, 0)
 
 DEF(mov_i32, 1, 1, 0, TCG_OPF_NOT_PRESENT)
 DEF(movi_i32, 1, 0, 1, TCG_OPF_NOT_PRESENT)
-- 
2.8.3
