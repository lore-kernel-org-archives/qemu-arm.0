Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4299657ejc;
        Sun, 26 Feb 2023 21:47:52 -0800 (PST)
X-Google-Smtp-Source: AK7set/sNASWqMdj0NFhk3RzvPDAz8UFwKOkJDzJYb84w1Ot9gdtREtj2yO3uos/+66lsjeYzdEa
X-Received: by 2002:a05:6214:1c4c:b0:56a:b749:3ca0 with SMTP id if12-20020a0562141c4c00b0056ab7493ca0mr43914415qvb.35.1677476872250;
        Sun, 26 Feb 2023 21:47:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677476872; cv=none;
        d=google.com; s=arc-20160816;
        b=kGTu8moG4bkG8fpBuraTjc1Z4VHWMS46CWEKbm+7KNkjuETTY4rvNDk+e1Xt7YS+vR
         LQU7HznbH3Y+wM7pWlBii0qc74uyzRG0hoy1+RKv4hs2dCjfQSoxDV4k3slypxz7A7gu
         SYwFz7RTnndfgTM0AI64JWODwGHvP2Eiz9YBlSVAdaXZkM98mQSpuKxBHBU2Ba9rx6K7
         sUuonSOaIrar8ezLJgVni4sCRRjUnL0S/obGoH96QQbHjKBNAE/fxbdXwLXNS5RdozJ5
         oSnUvC/8jujPBtiX1eLZKifd+zS3Q5xmYX0VMtyaR8JEBqJvx7FUSOX6V1E83MXO33+h
         4bvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=DKCOLyI/wsJHJKYRWjsEmHI6WWtv0JONwA4WRgdn8Pc=;
        b=ZDccgzgX6SzPBG4SaEDCnHSzYz1MQMx8j/m350q8FuwVVCvzBphAQQtSy31vckwQHc
         mJejwLzFsneQ1rTiP7g5ZYLRGonovrxW9bLPH3dOhUBee4YdRDT9UeORzzmDCzrCgFOj
         +QDw1xvjmTEGZyH3f1W7FlphLfuLxp4uUkAzQ+EgRt8d0I+6q0yJBCZQZUDTC1NdiR0p
         0JfvWIiwqxVcJemvEzmbDOa3T/yGJSjQsOlGXrebdOMCMajdD4g2qgpRlI5ixkpm4PiY
         3uNSe8Oqhw9HyEvuGwrrYpN6NXBHkJl68GLfDO/RC7iqXDiigqMNg/uz4VprPJx4TzFd
         NwkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KAmnNQYG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n4-20020a0cdc84000000b0056eac1cd994si5905181qvk.165.2023.02.26.21.47.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Feb 2023 21:47:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KAmnNQYG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWWET-0000fX-FF; Mon, 27 Feb 2023 00:39:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWDU-0003sq-HY
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:38:28 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWDQ-00037h-13
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:38:27 -0500
Received: by mail-pf1-x42d.google.com with SMTP id y10so2785498pfi.8
 for <qemu-arm@nongnu.org>; Sun, 26 Feb 2023 21:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DKCOLyI/wsJHJKYRWjsEmHI6WWtv0JONwA4WRgdn8Pc=;
 b=KAmnNQYG7oo7HRbzLj7ZekprHiufPjxwwQEE07L82SEACBph3bvEseJA0yQ+M91w8M
 Lr01udLhLA0x9CEqn+e2thM8jFPv73np9/YMsYrrTxdltAurbKD7AU9YztRe9gNGwuFb
 mGXt2GsKFQhinMMiXM70imU4uGc9YklIcSu212TzjJ2YQHAMeoXwt8UZx0RBoi1p6v0S
 ++Cb7rJCJ0PU7NjxYDPvcQLthlkAWHZkcoHOI854Vh+l9dGXeeNKKXFjDwUQsWMYbMBS
 zixEX+fU9pVCC9DMUAaWliSAQLHKQHVzl62IYp1RdSTkBNtYgHBOq/YetKzCTJPnMD9h
 cLtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DKCOLyI/wsJHJKYRWjsEmHI6WWtv0JONwA4WRgdn8Pc=;
 b=mLjQhAA6SR96eWTPkuxMws+YlK2dIgHmdwb8XEwZuqeM77OD8n4MPdbwFyyi5dcN3G
 sDj5tw9BSvDvREhCnP+2QShMkUd0lKmrxAYxlFHtMOA6CM2PsPilsQ3kuZRamJI0xLP1
 HsEQSJpVeefkjl0bGlRYj6fpx3ZIqxCjFinZaZ9xF5ib0eYKS/oqJ2Qs2hmsDBYMejLH
 pNNOcfVo2v7IqCHfvCtKDgRUSRQlWerMZoAkiJBKtDnnRPpFkSVtvYpDp3alPd04k/sW
 xCTli1dvLwNTAYEkGpJtgGLAulpFYKgRPfs6iJCMfJPR8o9MOw1sJ+ClKc/r2D6h3zXF
 bMnQ==
X-Gm-Message-State: AO0yUKWN7uYAgoFshGomCHjdKCnpE5AnjaqST9INvAR0cXg7OTrjBChU
 sw44U8UtBWs9yK0idzL3WSad6C8UkE5GCffXEvw=
X-Received: by 2002:a05:6a00:1:b0:5e1:f4e3:57d4 with SMTP id
 h1-20020a056a00000100b005e1f4e357d4mr9472495pfk.17.1677476301994; 
 Sun, 26 Feb 2023 21:38:21 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 k12-20020aa792cc000000b005a7c892b435sm3342137pfa.25.2023.02.26.21.38.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:38:21 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 28/31] target/xtensa: Don't use tcg_temp_local_new_*
Date: Sun, 26 Feb 2023 19:36:58 -1000
Message-Id: <20230227053701.368744-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227053701.368744-1-richard.henderson@linaro.org>
References: <20230227053701.368744-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: CAS9nuGAGCbR

Since tcg_temp_new_* is now identical, use those.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/xtensa/translate.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index 8d7bf566de..4af0650deb 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -307,7 +307,7 @@ static void gen_right_shift_sar(DisasContext *dc, TCGv_i32 sa)
 static void gen_left_shift_sar(DisasContext *dc, TCGv_i32 sa)
 {
     if (!dc->sar_m32_allocated) {
-        dc->sar_m32 = tcg_temp_local_new_i32();
+        dc->sar_m32 = tcg_temp_new_i32();
         dc->sar_m32_allocated = true;
     }
     tcg_gen_andi_i32(dc->sar_m32, sa, 0x1f);
@@ -1074,10 +1074,10 @@ static void disas_xtensa_insn(CPUXtensaState *env, DisasContext *dc)
             if (i == 0 || arg_copy[i].resource != resource) {
                 resource = arg_copy[i].resource;
                 if (arg_copy[i].arg->num_bits <= 32) {
-                    temp = tcg_temp_local_new_i32();
+                    temp = tcg_temp_new_i32();
                     tcg_gen_mov_i32(temp, arg_copy[i].arg->in);
                 } else if (arg_copy[i].arg->num_bits <= 64) {
-                    temp = tcg_temp_local_new_i64();
+                    temp = tcg_temp_new_i64();
                     tcg_gen_mov_i64(temp, arg_copy[i].arg->in);
                 } else {
                     g_assert_not_reached();
@@ -1187,7 +1187,7 @@ static void xtensa_tr_tb_start(DisasContextBase *dcbase, CPUState *cpu)
     DisasContext *dc = container_of(dcbase, DisasContext, base);
 
     if (dc->icount) {
-        dc->next_icount = tcg_temp_local_new_i32();
+        dc->next_icount = tcg_temp_new_i32();
     }
 }
 
@@ -2273,8 +2273,8 @@ static void gen_check_atomctl(DisasContext *dc, TCGv_i32 addr)
 static void translate_s32c1i(DisasContext *dc, const OpcodeArg arg[],
                              const uint32_t par[])
 {
-    TCGv_i32 tmp = tcg_temp_local_new_i32();
-    TCGv_i32 addr = tcg_temp_local_new_i32();
+    TCGv_i32 tmp = tcg_temp_new_i32();
+    TCGv_i32 addr = tcg_temp_new_i32();
     MemOp mop;
 
     tcg_gen_mov_i32(tmp, arg[0].in);
@@ -2303,8 +2303,8 @@ static void translate_s32ex(DisasContext *dc, const OpcodeArg arg[],
                             const uint32_t par[])
 {
     TCGv_i32 prev = tcg_temp_new_i32();
-    TCGv_i32 addr = tcg_temp_local_new_i32();
-    TCGv_i32 res = tcg_temp_local_new_i32();
+    TCGv_i32 addr = tcg_temp_new_i32();
+    TCGv_i32 res = tcg_temp_new_i32();
     TCGLabel *label = gen_new_label();
     MemOp mop;
 
-- 
2.34.1

