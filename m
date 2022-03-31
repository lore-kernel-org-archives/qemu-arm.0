Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp157325lfb;
        Thu, 31 Mar 2022 08:11:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyBoxiVdHf3lVMxIPM4cew0THrg9gXAzYG69xcn2kMHSyk5SK34IxjuSXNpUYZBZNu8Si4p
X-Received: by 2002:a5b:f42:0:b0:633:7ad6:78b0 with SMTP id y2-20020a5b0f42000000b006337ad678b0mr4431798ybr.156.1648739491965;
        Thu, 31 Mar 2022 08:11:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648739491; cv=none;
        d=google.com; s=arc-20160816;
        b=JAxd5tY+qr884DV3nBAoXQCuNUWt4EGRpkVk2++9Fq5pH8qH2e/5XRGkspn2EvfRoq
         cXgxHCZrDQ4Naq2HUvpSFnAKSEgzHtzy1r0syu/ssWosDzz1SDDlV7P0pVwLbyajA0X0
         SRzxuqRZQuIirLEEj1/PrcmkqZISeXxtmP1yWOFQM21+PjdJ1PuwTYbC8Wb7U8NECLxI
         lT0pYDO1cBxbk+1DcLlVZZGWzM6J7FAuDszKf0nfs1k/0mCicAtBiR0RNBrhPuN0+TdL
         od/ZNHo/3zLweAJs1wxb9Ut6IAfW+kHWx5YwAGLxSIQK0KzmBfWETFTJ1INTJKp26S2K
         v9FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=cW50SmXqEracG+5yeGdL1zrv5YQm6JkbHDr7NxJxYqA=;
        b=Scg10RUm38F+pDUYTRVueMd3DbpcMqD2hXAnfU010Kd3FTor0LtVS5dyhnuaq+JUA8
         RcHpZpzLG8DDe8kZIpwAtBFzSKA2DyMHlV7eUq5fNnzhnijk+aKgvrduyvh6MwPGXgCu
         57QTx2+yjr/dfi5W38tg2+E/NeK4j0QE1Bi+KavGKZrGLUQUqfQClIH6Gbp+hJPi3dVG
         sCMrLSpiTViFD/xqRDywnJ2Y6LkS49L4Zpu2ld429DkKCHf4BXe75cnCbHHeqdywGlbR
         s6qnB6apJmSQH2O/Cjx+FmBP1I/XZC7ABeHe1YTs0m3nUBdFMCv1hMPFJHkClVbEoHSF
         T7vA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CBYhTG9N;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b64-20020a0dc043000000b002e5bb9dc9dcsi22064104ywd.101.2022.03.31.08.11.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Mar 2022 08:11:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CBYhTG9N;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nZwSR-0004pt-7m
	for alex.bennee@linaro.org; Thu, 31 Mar 2022 11:11:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nZwQ4-00021x-Fz
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 11:09:04 -0400
Received: from [2a00:1450:4864:20::42c] (port=40576
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nZwQ2-0001KL-Bm
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 11:09:03 -0400
Received: by mail-wr1-x42c.google.com with SMTP id d7so193811wrb.7
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 08:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cW50SmXqEracG+5yeGdL1zrv5YQm6JkbHDr7NxJxYqA=;
 b=CBYhTG9N6SJnYI3eCqLQcMECqP4rgmJOrmpPel5Y0YkarGuA/k8vNfZx6rqsRh9URU
 T9OEQ5SIUdZ1Lqkj5HlFVPbWhSSXqMxJBanW2nl3gvC5ONCkS6wEJdrHziJC6hkGgwZa
 h1q7Uixi8ds58Y5b/3ysulTEo9nXHkk49jFzIUyLD++7Cmzx4PCPKplTPIX0llK+aKJ7
 EY4x4C4J8FslJDl4NBRFWBOXlIzP83FpVXa7G+GJPD3OUppzf2vegzBdUO47oCetJiFz
 Q+xht6UwYeIyjVMUsPeOVc7ydnTMljsqxUofFg+7219FX64xXhJYYt1bAGhIwB8xm0qG
 H6EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cW50SmXqEracG+5yeGdL1zrv5YQm6JkbHDr7NxJxYqA=;
 b=kFBXE89ZiL0YBkNxofbRW0TBHvY/rusVXkIlHu6NTAkOZRno4bLcoJGvQeD56WO9BJ
 k+FeT+m1ZX8V2B/ywGkizjmWdc/H3Mq9TKnVJcYe7w2KVrtdGk0PEnuzKKIPZAVM9ozd
 oyH/20jp7cl+ZBh9vUvLKFBuoSnl9OYdaYGaDmmqVkHgxZ7ZpygN50mgKK1CZXhPkX4J
 a5o0XWJdNP/jWMoUxx9JR0bXqzOokMzkImbYZp5VA993t94FOHMJq59sfrR64H4KGQzA
 sestYNWSP84aeih2VhWH5ivXac2k5QGwVb+s8m8Ltv9lOjSXgb3tzAPA+EjjBJ+zGTiJ
 MJBw==
X-Gm-Message-State: AOAM530WcU9c4AC/ZWjk+GUmWsJb0lZANSmzzAmR6lwnvTa4DCDss5DF
 1TSqvxJLZlni4uShkLYWznYQPg==
X-Received: by 2002:a5d:62cf:0:b0:203:d97c:3bae with SMTP id
 o15-20020a5d62cf000000b00203d97c3baemr4382700wrv.237.1648739340599; 
 Thu, 31 Mar 2022 08:09:00 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 q6-20020adffec6000000b00205b60faeeesm13277603wrs.24.2022.03.31.08.08.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Mar 2022 08:09:00 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-7.0] target/arm: Don't use DISAS_NORETURN in STXP
 !HAVE_CMPXCHG128 codegen
Date: Thu, 31 Mar 2022 16:08:58 +0100
Message-Id: <20220331150858.96348-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ndwHmhEyEl/d

In gen_store_exclusive(), if the host does not have a cmpxchg128
primitive then we generate bad code for STXP for storing two 64-bit
values.  We generate a call to the exit_atomic helper, which never
returns, and set is_jmp to DISAS_NORETURN.  However, this is
forgetting that we have already emitted a brcond that jumps over this
call for the case where we don't hold the exclusive.  The effect is
that we don't generate any code to end the TB for the
exclusive-not-held execution path, which falls into the "exit with
TB_EXIT_REQUESTED" code that gen_tb_end() emits.  This then causes an
assert at runtime when cpu_loop_exec_tb() sees an EXIT_REQUESTED TB
return that wasn't for an interrupt or icount.

In particular, you can hit this case when using the clang sanitizers
and trying to run the xlnx-versal-virt acceptance test in 'make
check-acceptance'.  This bug was masked until commit 848126d11e93ff
("meson: move int128 checks from configure") because we used to set
CONFIG_CMPXCHG128=1 and avoid the buggy codepath, but after that we
do not.

Fix the bug by not setting is_jmp.  The code after the exit_atomic
call up to the fail_label is dead, but TCG is smart enough to
eliminate it.  We do need to set 'tmp' to some valid value, though
(in the same way the exit_atomic-using code in tcg/tcg-op.c does).

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/953
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-a64.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index d1a59fad9c2..9333d7be41a 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -2470,7 +2470,12 @@ static void gen_store_exclusive(DisasContext *s, int rd, int rt, int rt2,
         } else if (tb_cflags(s->base.tb) & CF_PARALLEL) {
             if (!HAVE_CMPXCHG128) {
                 gen_helper_exit_atomic(cpu_env);
-                s->base.is_jmp = DISAS_NORETURN;
+                /*
+                 * Produce a result so we have a well-formed opcode
+                 * stream when the following (dead) code uses 'tmp'.
+                 * TCG will remove the dead ops for us.
+                 */
+                tcg_gen_movi_i64(tmp, 0);
             } else if (s->be_data == MO_LE) {
                 gen_helper_paired_cmpxchg64_le_parallel(tmp, cpu_env,
                                                         cpu_exclusive_addr,
-- 
2.25.1

