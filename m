Received: by 2002:a05:6512:2248:0:0:0:0 with SMTP id i8csp471078lfu;
        Sat, 30 Apr 2022 23:09:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwxlLWTHFmrfLDVzUWXHFbosdB5p9o9dl90bCKcSXE/OEMoZjPw6JWSn6C5X+e/D75Duwev
X-Received: by 2002:a0c:8e8f:0:b0:443:d25b:4e21 with SMTP id x15-20020a0c8e8f000000b00443d25b4e21mr5081878qvb.128.1651385377397;
        Sat, 30 Apr 2022 23:09:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651385377; cv=none;
        d=google.com; s=arc-20160816;
        b=aI/GzMUE5/jCuZ/RMXXSKxiXYHGle5/4F15bKnzQMRz5Oxtvf6JtF9YNbsjC2PfnTo
         Mh/SLWN1vrgu6r/odC1xOkVw5Lw+rhzIcmppl3EfYYZc7omjz2k+jkgeQN72wNBR77UM
         UUO1TxBjDDMMd433BSrIvswQ62qoyLueYbZpu0U4HzN+TfLaw9MzrbnXMzApagJumVKq
         AQLPOW7Sk1Tb2ZNYK8OlxiYj9TyGNUO6WFXY+ThD1AsLNXLRcOB+PFv+yH4PdCs2x9b9
         0HriHgO4Sni7bUF0iVc/DSVZRyukXkURYYOk18fDmpX2TA7ZFmG5zVsf22ifguc54ssU
         10Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=dbDAxfca3xZASncYMUEB6IYFJ1wRcOw6UIc41wY+Pts=;
        b=VILyvaR+3puWQDg2FYlg3/a5GQ/wulAwM8D08O+MT3ZCqAkrmn04gRq2LGoBo8Hrc2
         MXqbUT8zTkixYCia906z0YnVe5bnuHkcuEww2PfCYQq1vpgx4AgRNS455kZKBZaHLz3v
         kYg/cq4CuLcYJQtKSMD/If4aMuFLbJUJ+QtVwo+MZio1Fm/2vDZ+fXCb7STg6j4/cAzO
         3Ti9hCWWvmW4aEYIf8rNxuJqojvsJlRaM9y4LukKeNQR/XrUfRQ3+K/T4CYAzYkZMp1v
         OpU6yvm6gRlFi7tzwSvbBl6GnGZm+cNf8CIgNxOCIYxI/nnhWHJ3Z/Yjjlfzr71HsQBr
         n1iQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="sixa/PNE";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y13-20020a05620a44cd00b0069a14682517si5116054qkp.586.2022.04.30.23.09.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 30 Apr 2022 23:09:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="sixa/PNE";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nl2m0-0006cY-CI
	for alex.bennee@linaro.org; Sun, 01 May 2022 02:09:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2Tl-0006sC-PD
 for qemu-devel@nongnu.org; Sun, 01 May 2022 01:50:51 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:39599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2Tg-0001GI-Ak
 for qemu-devel@nongnu.org; Sun, 01 May 2022 01:50:41 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 a15-20020a17090ad80f00b001dc2e23ad84so1790516pjv.4
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 22:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dbDAxfca3xZASncYMUEB6IYFJ1wRcOw6UIc41wY+Pts=;
 b=sixa/PNE0Pd/Ljrk7clbzAS59HwI667ULaeHCHspi3kLPq+//Pe2IGm8vKgK4vVRVw
 2HPuRYiHQqHKLqzTp2b72NOvQp3DDUk/BCDHf8pgcy1c4P8OSi6jowQCdTa4QJYYWr2J
 1n6Q4RTnjt6/wviTRsDFenKoQk2bRYxzOB2d1PmqFvvmkUtTvFby4VCuajPCqQ47s8dC
 +n+AYvaVthw18HmeCNOHbO6sUvTT67BqLCl3kWeuGO49IhKgd1fGIEWbfkgVJc0eYxgM
 xWYcP1DX/Dza55eXq37FdCRPiE3SeM2jcZp4eoZg+vZgQiNTyoNIbNwsySdWgVKkqXdX
 0qCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dbDAxfca3xZASncYMUEB6IYFJ1wRcOw6UIc41wY+Pts=;
 b=rngSp26HN1TpFz858QwE3f0ZPJMxJdHUV6hjhyYo00nAsKTVtAXlJ1PeWDs4QAncy1
 LLzYcL/vbU28BCnnctW4knZANniyYIWyHL1TjckjDGimRnFtS/J+zPceNvPWQXjXOzxN
 a50J5unETx9pG6gkjIKvxiLGgcoqmVWh2T5idEpklSDaQS27HeNF2ZyFgo/icQ4cGsRd
 pIiVlrFSwaLyzXw6DNcGc/weOY/JD4lLgk9u4/bvVW3pJAvXSCohC1SHeQAT1tmg+DE1
 bQGx9g7vEhT0wamhWkBsxGGxqfUrjWD6+KYTHlmXLYV81PM3dIBIcktM1nT2fHEk9T6m
 o18g==
X-Gm-Message-State: AOAM531MUdQnQOrm8G8HEj0cpP0fYl/kZDdRDYXknfYOvmnWL4+g51cd
 XS0ZRLl9AFRUJ1f1yqLghBUu+SwnIgANzQ==
X-Received: by 2002:a17:90b:4b12:b0:1d2:8bda:ef7 with SMTP id
 lx18-20020a17090b4b1200b001d28bda0ef7mr12089731pjb.174.1651384238982; 
 Sat, 30 Apr 2022 22:50:38 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 cm18-20020a17090afa1200b001cd8e9ea22asm17310342pjb.52.2022.04.30.22.50.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 22:50:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 09/45] target/arm: Name CPSecureState type
Date: Sat, 30 Apr 2022 22:49:51 -0700
Message-Id: <20220501055028.646596-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220501055028.646596-1-richard.henderson@linaro.org>
References: <20220501055028.646596-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MIKogvnyB3ts

Give this enum a name and use in ARMCPRegInfo and add_cpreg_to_hashtable.
Add the enumerator ARM_CP_SECSTATE_BOTH to clarify how 0
is handled in define_one_arm_cp_reg_with_opaque.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpregs.h | 7 ++++---
 target/arm/helper.c | 7 +++++--
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index 4179a8cdd5..73984549d2 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -131,10 +131,11 @@ typedef enum {
  * registered entry will only have one to identify whether the entry is secure
  * or non-secure.
  */
-enum {
+typedef enum {
+    ARM_CP_SECSTATE_BOTH = 0,       /* define one cpreg for each secstate */
     ARM_CP_SECSTATE_S =   (1 << 0), /* bit[0]: Secure state register */
     ARM_CP_SECSTATE_NS =  (1 << 1), /* bit[1]: Non-secure state register */
-};
+} CPSecureState;
 
 /*
  * Access rights:
@@ -266,7 +267,7 @@ struct ARMCPRegInfo {
     /* Access rights: PL*_[RW] */
     CPAccessRights access;
     /* Security state: ARM_CP_SECSTATE_* bits/values */
-    int secure;
+    CPSecureState secure;
     /*
      * The opaque pointer passed to define_arm_cp_regs_with_opaque() when
      * this register was defined: can be used to hand data through to the
diff --git a/target/arm/helper.c b/target/arm/helper.c
index d560a6a6a9..50ad2e3e37 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8502,7 +8502,8 @@ CpuDefinitionInfoList *qmp_query_cpu_definitions(Error **errp)
 }
 
 static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
-                                   void *opaque, CPState state, int secstate,
+                                   void *opaque, CPState state,
+                                   CPSecureState secstate,
                                    int crm, int opc1, int opc2,
                                    const char *name)
 {
@@ -8785,7 +8786,7 @@ void define_one_arm_cp_reg_with_opaque(ARMCPU *cpu,
                                                    r->secure, crm, opc1, opc2,
                                                    r->name);
                             break;
-                        default:
+                        case ARM_CP_SECSTATE_BOTH:
                             name = g_strdup_printf("%s_S", r->name);
                             add_cpreg_to_hashtable(cpu, r, opaque, state,
                                                    ARM_CP_SECSTATE_S,
@@ -8795,6 +8796,8 @@ void define_one_arm_cp_reg_with_opaque(ARMCPU *cpu,
                                                    ARM_CP_SECSTATE_NS,
                                                    crm, opc1, opc2, r->name);
                             break;
+                        default:
+                            g_assert_not_reached();
                         }
                     } else {
                         /* AArch64 registers get mapped to non-secure instance
-- 
2.34.1

