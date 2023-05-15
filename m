Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp6577044ejq;
        Mon, 15 May 2023 08:06:28 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4Ar1mOMcFAoLOYBeYfdwup5pVmq0/H9vOcDwKHayqtqk7wdrHzQ2PF1cG483sGLPj2Fq2J
X-Received: by 2002:adf:fdd1:0:b0:306:2ff1:5227 with SMTP id i17-20020adffdd1000000b003062ff15227mr24164063wrs.23.1684163188007;
        Mon, 15 May 2023 08:06:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684163187; cv=none;
        d=google.com; s=arc-20160816;
        b=HizfLjAUFeuIf/oyITi7BrW/Lk6PjKhy49eRXD/ls3OJMaJpHV0JiwzpZdUbRZUqPA
         7eMUwxxd5KAKPqXZCx4n2cjOaSotxfX1wNDqOJ3Jo8+D6qKGLIoARS7atWqC76GCG9CA
         EvLOuOibp35gcAz9mY54AsZLd+kBvWuZaGR1CQPKcCxgoDVIzzYo8UW1I5lNd2jaGSAH
         92SEj94YR/iLpBd/9tiQ6Zurex0nuvet/ZrzWngQ2ALGmq6bJjrWKVzwotRCpeIbXAQQ
         CCgy9QJg6XkGIKi/8n6KTC6GPJuUR5ivRos7AZwrodzIjXyKu3WpgbiRISnApDfFMlZP
         zEaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=YyONh+q6+JPHpqSgz1eedz8qFY8evuyzGRq8DlknugQ=;
        b=YQ+h+SUi+5KjSTEkdDnxJPwQzyI6cEquNhAn9/gJMebAm7a8SCzqjaqiaQAaRfnwDr
         BgUoJtmVSxDt5NtOYyWqkSf3G/Wqpu0IvXJKEFeOL0uHXyJRqJOg6GaH3l/plmHBEHp2
         kdOtlnWztSg6afU9mEG8qiRm15wq1I+aTcJIlOanp0Z1EB3nMks/VJDIB0pa836XHx6n
         dkYSMnYPTPLRv9CnAsq29a7F+lBcFloIDkWthUWl7a9aFn8Wz4i8grT9PPcnu/VV0LQl
         7fjPzR4Pux5aaaTxTl9wkzay1bvduCc4U4ouDhfq2iiKko5gicIHe50g9B0Fez3hmogb
         mibw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O4YoGg8g;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b13-20020adfe64d000000b003042af21137si36379wrn.17.2023.05.15.08.06.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 May 2023 08:06:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O4YoGg8g;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyZIv-0001z6-P4; Mon, 15 May 2023 10:36:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZHc-00074p-Fd
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:34:47 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZHV-000503-6U
 for qemu-devel@nongnu.org; Mon, 15 May 2023 10:34:37 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1aaea43def7so88183165ad.2
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 07:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684161215; x=1686753215;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YyONh+q6+JPHpqSgz1eedz8qFY8evuyzGRq8DlknugQ=;
 b=O4YoGg8gOumIMlcnZX1ADy7TAwBiDuVYUnn1MrsPTWuNxoIL1rbCQN+RMBlgv57fZm
 kg0ALBvBxg4v6UQjbJ10IwRYzJPwQU6i40FuU+xs7sNiuvBhaNhWBUNUvNea0kM92zZt
 vgyrCji5j7oP/WleZFrNZNV8mWyqJ2VH3hRYWpn9qAO+abRwvPHPYqvi0kX5vSv3Fb/J
 LJ5MkIwVCfCSy5k2m1Hb+PVStblkBeLn5E3bPcp6NVoPH+8Pi5iCz49T2TDr4PihSBl6
 pIQr07eC917PIYVraRuukBJoQHm5KibCkHBqTfK6w1nQUZepEvnZ+E+X3Uq607SeVgSz
 ou6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684161215; x=1686753215;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YyONh+q6+JPHpqSgz1eedz8qFY8evuyzGRq8DlknugQ=;
 b=kUniqKEpo3qZv6t4q5k85KrzIPMeh08sSSFBKKW/CvgfMPoM5RyKxy3iQKNwDk018/
 Kfmq+D5P0sGNGh3pbcbk3HE6HhbaeGRU0fH9p5mZjHqjikTY73gjqYvyeD0bLHoUU72D
 kYpDQQf6xXkfhpngSxslb8KmEYp7zgO9fkjZ+zyW2nJTtNDOAk5GBxkyzhsleueYYJ0X
 qwljCAelOJSWblOgNgm0K5pTen/CpCVPOvg7v1QJd9mwptGEl1StJgG8D/dne5mkFTwF
 VU5FoyinfBweC76efIPVDe5XeMhrTQ0yGrzTs/QX9Djz5UhXhkH2d/GfZTZgnzkVVywj
 vCEQ==
X-Gm-Message-State: AC+VfDzGEwYYuo86klnTAUtMOvCdldLERWlmGHLfXX8iKOxg0UpuzkF4
 ikIf00rcVBNeU85VJ4K9ExkowhS1t8JP6ytd84o=
X-Received: by 2002:a17:903:552:b0:1ae:2013:4bc8 with SMTP id
 jo18-20020a170903055200b001ae20134bc8mr2546582plb.18.1684161215696; 
 Mon, 15 May 2023 07:33:35 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:9902:96ac:8d8c:4366])
 by smtp.gmail.com with ESMTPSA id
 ik9-20020a170902ab0900b001ab0aec388bsm13694335plb.135.2023.05.15.07.33.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 07:33:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH v5 24/54] tcg/sparc64: Allocate %g2 as a third temporary
Date: Mon, 15 May 2023 07:32:43 -0700
Message-Id: <20230515143313.734053-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515143313.734053-1-richard.henderson@linaro.org>
References: <20230515143313.734053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: b6qLqYpw+Dfh

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/sparc64/tcg-target.c.inc | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index e997db2645..64464ab363 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -83,9 +83,10 @@ static const char * const tcg_target_reg_names[TCG_TARGET_NB_REGS] = {
 #define ALL_GENERAL_REGS     MAKE_64BIT_MASK(0, 32)
 #define ALL_QLDST_REGS       (ALL_GENERAL_REGS & ~SOFTMMU_RESERVE_REGS)
 
-/* Define some temporary registers.  T2 is used for constant generation.  */
+/* Define some temporary registers.  T3 is used for constant generation.  */
 #define TCG_REG_T1  TCG_REG_G1
-#define TCG_REG_T2  TCG_REG_O7
+#define TCG_REG_T2  TCG_REG_G2
+#define TCG_REG_T3  TCG_REG_O7
 
 #ifndef CONFIG_SOFTMMU
 # define TCG_GUEST_BASE_REG TCG_REG_I5
@@ -110,7 +111,6 @@ static const int tcg_target_reg_alloc_order[] = {
     TCG_REG_I4,
     TCG_REG_I5,
 
-    TCG_REG_G2,
     TCG_REG_G3,
     TCG_REG_G4,
     TCG_REG_G5,
@@ -492,8 +492,8 @@ static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
 static void tcg_out_movi(TCGContext *s, TCGType type,
                          TCGReg ret, tcg_target_long arg)
 {
-    tcg_debug_assert(ret != TCG_REG_T2);
-    tcg_out_movi_int(s, type, ret, arg, false, TCG_REG_T2);
+    tcg_debug_assert(ret != TCG_REG_T3);
+    tcg_out_movi_int(s, type, ret, arg, false, TCG_REG_T3);
 }
 
 static void tcg_out_ext8s(TCGContext *s, TCGType type, TCGReg rd, TCGReg rs)
@@ -885,10 +885,8 @@ static void tcg_out_jmpl_const(TCGContext *s, const tcg_insn_unit *dest,
 {
     uintptr_t desti = (uintptr_t)dest;
 
-    /* Be careful not to clobber %o7 for a tail call. */
     tcg_out_movi_int(s, TCG_TYPE_PTR, TCG_REG_T1,
-                     desti & ~0xfff, in_prologue,
-                     tail_call ? TCG_REG_G2 : TCG_REG_O7);
+                     desti & ~0xfff, in_prologue, TCG_REG_T2);
     tcg_out_arithi(s, tail_call ? TCG_REG_G0 : TCG_REG_O7,
                    TCG_REG_T1, desti & 0xfff, JMPL);
 }
@@ -1856,6 +1854,7 @@ static void tcg_target_init(TCGContext *s)
     tcg_regset_set_reg(s->reserved_regs, TCG_REG_O6); /* stack pointer */
     tcg_regset_set_reg(s->reserved_regs, TCG_REG_T1); /* for internal use */
     tcg_regset_set_reg(s->reserved_regs, TCG_REG_T2); /* for internal use */
+    tcg_regset_set_reg(s->reserved_regs, TCG_REG_T3); /* for internal use */
 }
 
 #define ELF_HOST_MACHINE  EM_SPARCV9
-- 
2.34.1

