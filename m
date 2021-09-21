Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp3196993lfp;
        Tue, 21 Sep 2021 09:30:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwOV18tIWQFX6mRiMVQTXRE1nm0a31aM+kfYXtE3nwzAk66manZsQ7lgKNicA71/Lpv7H/N
X-Received: by 2002:a0c:e102:: with SMTP id w2mr32024761qvk.44.1632241802020;
        Tue, 21 Sep 2021 09:30:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632241802; cv=none;
        d=google.com; s=arc-20160816;
        b=zjAUDO2BeDZXR3/8PVGE6d77EfKcZBVBlU1tli4DsvK7h/2nn8phIlCR/VmoVU8rAP
         DTOST/IFh9IjGREhD5nnh5rn8sdexQXuKXS9QUx4AJLww12bZvFq/g7ofQPC+vZ5tByG
         Sij3Vaa35ok4idXHO8YNAqebQnSOMlgxC1HmHDBED7YQOEdFZ8QIZ/XOyARETJFZP67s
         Z5rBj1Nc9Nb3mzElGXXGwarbaKlY2hdQmpM8ZptVITgy4uap4gNK53hDzHvQb3rSuM+2
         9c7VxYhfpWqUpe+UViSF4Aa4199ALA+Lrjrwp/lRMA/TBTle5nXrDnXfIJPDRArMR9zV
         bznQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=VHb17IfanSTmLS+2/xtwkgJnWlHcbTTMTVtLLMK51LM=;
        b=YIIcUIwXWB1vvU0azwAkfFzSjm/KBw42M0YUfFAXSGyslM+ugJv4zvPK7+jH1cKuxn
         S5zN8yvDZJ0WdwRlPq8Q6U/1jm9Eb5toN5i/L6lXD6N6SWzWdMQm9jM+EWqp4Xfd3stu
         hMkU4D+c/ypdoD4Q76GhgmgRFFSk5tbF3BfubbL/L1pvHGy4vav2FYO416O9izUZ7tFN
         Taeb6Sk4P88udUqy0iarxfwmbKRLk1NBrVOFh+oFA1FqgqvWzHhLkzD7Eip0dbprV0Pg
         B7ENvGzsgedASmbSYtOn15hp0sNrDWxgy0ayitNyXxd5B0SXRf/QWTyV8ShDe8IDZlHm
         UQqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Gj/Fm9tP";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 69si12341903qkm.266.2021.09.21.09.30.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Sep 2021 09:30:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Gj/Fm9tP";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mSief-0000fq-FE
	for alex.bennee@linaro.org; Tue, 21 Sep 2021 12:30:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSido-0008MJ-SC
 for qemu-arm@nongnu.org; Tue, 21 Sep 2021 12:29:08 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:39514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSidm-00029v-Sn
 for qemu-arm@nongnu.org; Tue, 21 Sep 2021 12:29:08 -0400
Received: by mail-wr1-x42d.google.com with SMTP id u15so40946870wru.6
 for <qemu-arm@nongnu.org>; Tue, 21 Sep 2021 09:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VHb17IfanSTmLS+2/xtwkgJnWlHcbTTMTVtLLMK51LM=;
 b=Gj/Fm9tPaPhll9ETWjNeNKNbCOXJqPK1qOFQ4N1L2WfndEINeUqT+Nxeu61sTHo4yD
 xq884hhOOykw2z4xLWo+QM7aetryEks4F01PFYJNQJH9L3pIfFuh5QFTt5/Uc9Vg9aLj
 ez91tAC9hNlnYOJMt7bg5v8vYRA0ZVW1vIV9B/OEpC3BiBM2bYFu8L14eHhl4NOKNztz
 NS2hiBDMeOqhIDzKYxGi3mJ8qjLhScslLpp1uoeyFi+64a+qNEmQj3SOiO1QOCK+MIWv
 pVE/dERuubmKKS/jscOqjv/jx81dr6bew3vR5dwqd8OraHQa1XazeA325bawOZ7BspdO
 rAig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VHb17IfanSTmLS+2/xtwkgJnWlHcbTTMTVtLLMK51LM=;
 b=db6GhoMjBMoyBIiy2JpGDKp1g1EqYKGlf2pkJSEdmV+9gj2/Zu2oWgauqlHv1/kmhp
 5TpWCcP+1PjJTOu8kJSk0d7pA4/H2P7Q5VGDL4PjlLNuwQtvk0mNTPX14PH1UJyn4u7g
 /cSkiMdy4ZVeWhDhMi0NzcP1rKEknD3nxqgycjU6l9XOcBsa064E7VvGLpk+auWzjcXD
 Rw5UBY6O2ksJV5NDv83guqAPB97g18CHhhYxZoW1wkgh4edeTe/79Btq5DnTjnJ8RL6F
 giJ8mKQbvjlWr43N2IVZA0srcnbO+N8G40ehrlNImEJ8qHzt5DijeQ1DAXnQJx8eEw9w
 AZnA==
X-Gm-Message-State: AOAM5315EUBpZQTywjuGuASaI4NC0uR9+K6Kfnh5q1H/yoNcRBv5gVy2
 +Ui7COmxojBQYPkS5spG3Me+EJuQy7LjOQ==
X-Received: by 2002:adf:f24a:: with SMTP id b10mr37259167wrp.281.1632241744833; 
 Tue, 21 Sep 2021 09:29:04 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q7sm19841014wru.56.2021.09.21.09.29.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 09:29:04 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 2/5] target/arm: Fix coding style issues in gdbstub code in
 helper.c
Date: Tue, 21 Sep 2021 17:28:58 +0100
Message-Id: <20210921162901.17508-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210921162901.17508-1-peter.maydell@linaro.org>
References: <20210921162901.17508-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Luis Machado <luis.machado@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: twMojpz1AfA8

We're going to move this code to a different file; fix the coding
style first so checkpatch doesn't complain.  This includes deleting
the spurious 'break' statements after returns in the
vfp_gdb_get_reg() function.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index b210da2bc26..179038ad3da 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -72,9 +72,12 @@ static int vfp_gdb_get_reg(CPUARMState *env, GByteArray *buf, int reg)
         }
     }
     switch (reg - nregs) {
-    case 0: return gdb_get_reg32(buf, env->vfp.xregs[ARM_VFP_FPSID]); break;
-    case 1: return gdb_get_reg32(buf, vfp_get_fpscr(env)); break;
-    case 2: return gdb_get_reg32(buf, env->vfp.xregs[ARM_VFP_FPEXC]); break;
+    case 0:
+        return gdb_get_reg32(buf, env->vfp.xregs[ARM_VFP_FPSID]);
+    case 1:
+        return gdb_get_reg32(buf, vfp_get_fpscr(env));
+    case 2:
+        return gdb_get_reg32(buf, env->vfp.xregs[ARM_VFP_FPEXC]);
     }
     return 0;
 }
@@ -98,9 +101,15 @@ static int vfp_gdb_set_reg(CPUARMState *env, uint8_t *buf, int reg)
         }
     }
     switch (reg - nregs) {
-    case 0: env->vfp.xregs[ARM_VFP_FPSID] = ldl_p(buf); return 4;
-    case 1: vfp_set_fpscr(env, ldl_p(buf)); return 4;
-    case 2: env->vfp.xregs[ARM_VFP_FPEXC] = ldl_p(buf) & (1 << 30); return 4;
+    case 0:
+        env->vfp.xregs[ARM_VFP_FPSID] = ldl_p(buf);
+        return 4;
+    case 1:
+        vfp_set_fpscr(env, ldl_p(buf));
+        return 4;
+    case 2:
+        env->vfp.xregs[ARM_VFP_FPEXC] = ldl_p(buf) & (1 << 30);
+        return 4;
     }
     return 0;
 }
@@ -119,7 +128,7 @@ static int aarch64_fpu_gdb_get_reg(CPUARMState *env, GByteArray *buf, int reg)
         return gdb_get_reg32(buf, vfp_get_fpsr(env));
     case 33:
         /* FPCR */
-        return gdb_get_reg32(buf,vfp_get_fpcr(env));
+        return gdb_get_reg32(buf, vfp_get_fpcr(env));
     default:
         return 0;
     }
-- 
2.20.1

