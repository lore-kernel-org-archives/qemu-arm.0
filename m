Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4289342ejc;
        Sun, 26 Feb 2023 21:29:15 -0800 (PST)
X-Google-Smtp-Source: AK7set9FMomFcBnelFbo/Kav6KON4L+LVLpbLhXNJlvq2z1gEKqLO0FWmY+smX41eGIPOLR3c9bo
X-Received: by 2002:ac8:5e4e:0:b0:3bf:cfaa:737e with SMTP id i14-20020ac85e4e000000b003bfcfaa737emr8947729qtx.23.1677475755200;
        Sun, 26 Feb 2023 21:29:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677475755; cv=none;
        d=google.com; s=arc-20160816;
        b=D+2QlC1p4OohZEnW6lZc9D7KhDM3uMpqhxTy3GRE6qrLOOMFtVIVlfakTDjBAxWjkP
         EV1bCmVPY8Gp/6tPX3uRIvwo7E4sk/e1VtG+brSN1RO02I7CtAJc1aRGCIXefDe3eRZC
         6F5D/8h3cSJMX//sb1PA7aoZtCZY27/pw41eQ4RNR0Hc7ymWnJOWkPb/Mfngzx888FX8
         UHVQqXv4ffOhPd+GSTiwLgdh6AR44lz7Rh1XfMBi/u94VPwuRlWSyQlg/LkdGO+NzWov
         PiQSbjMU0lxJfeG5FxUBJPqhxmHlDoeugSSxbigedvW8vJH8TLPd9tGs4RAN0eESD22Z
         bvvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=+mYb7riWV9KcKnyuvmf5HGj/XCuu4SlQJaHS4dBhBKA=;
        b=pj0MR1b9gBzVdDDEZkVDPsGizGTe7NvhJxAFA3h/lt+KB/yPZLSaGb2M4ph1gHY8fm
         +WmyMvha5Vz3JbfrjqVYflkRjRFeeAxs9SWEFkhB1yohfs/T11iqxBag5Mt8ipF1i5SZ
         BdXKmjR8aJL5Ebx59fDwyj86f4Tyw+QPe5cUP4i+jY5B0xHpZ+zpR4YCqaICKYoKUdzQ
         aKExw+iXPpKCrYOMOeClDMYpJvF/fwZEcDnxjfu/XQDN4B0ovScaO7yzfBs/6XNyz56o
         Mj6aJY0gDwKCZeqIOOsx+2QG0yK6oHSLufjP6tTr2sgST3g88MhvKUUHPSLVEW/QXn86
         x1NA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iBEb0deh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b10-20020ac87fca000000b003b9e0b29a62si5581387qtk.610.2023.02.26.21.29.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Feb 2023 21:29:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iBEb0deh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWW2h-0002il-Nm; Mon, 27 Feb 2023 00:27:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW2Q-0000Zi-CI
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:27:02 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW2L-000819-U3
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:27:00 -0500
Received: by mail-pj1-x1030.google.com with SMTP id c23so4848129pjo.4
 for <qemu-arm@nongnu.org>; Sun, 26 Feb 2023 21:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+mYb7riWV9KcKnyuvmf5HGj/XCuu4SlQJaHS4dBhBKA=;
 b=iBEb0dehBGg22Tu70J3uchC3rNbPpQ01VA4aWW/aGL2c2389JIjYPVdqsb33DC/18N
 1r1hnZQeS1OmW1yfjdwsUJxVdB7/HFfdjk0R80RcgF64ADk2XhiqJKom/fQFDxKvR19S
 U6soW4H98jgS9PiDmcGa9Wb0SrUl9aKljcsYOrtlLi9USthCC7lodbmsSNdyDPJUJp6m
 me1k24K3eqiRc6Hp6av/lGZ5TZDNOWfqAgBp6DnhbRQSSvTvLIqp0lwf8ctvKjZiW4Tu
 0JnFnaOO7ZiW9zA1rNd5MMf+X+j4tVKm3sBxEbgqQZkqwO83EUIjbpZHQ4bW1IlIK0j/
 DGOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+mYb7riWV9KcKnyuvmf5HGj/XCuu4SlQJaHS4dBhBKA=;
 b=a89qzm5NS7j0AY5/+dTpJbRdjlgbw5+kbljD/Gx86WSwsksPU5KuP2ej73+r/iRpdB
 bei9iQLQ1N+WZBzwm6F7WCOV/k9GMlF9Ftaf/PfpJF+iXMSiHt8X7IIif+fQ4jXUGszS
 nQWEWliYuyRuGUcaD9fBtcxa5cIzn7K/9Vn13tu9P0hegywnNW3PcurSW2FdT7bSYhQr
 K6vVDfkZ46pN7gWBdGXmwk7zjwQ7EbLCnl6BVoeYpOf2jHdwIjEg3Uk5/hblt+uyRStg
 YqGwSa5KPH+Bdpy1ncwR7BaRzTJ3PXpqvj0SOAxOLyXcmfKKgX27rnspOQMsqz56fPOe
 jmBA==
X-Gm-Message-State: AO0yUKU97Ne6ktnIvXrJuMxONZuvHejzl/oBjQdZ5N6bu7MxWVAPvz9v
 Lh2r4pIil7MPFTlAY2jlujGpvQ==
X-Received: by 2002:a17:903:2948:b0:19c:dbce:dce4 with SMTP id
 li8-20020a170903294800b0019cdbcedce4mr8280933plb.15.1677475616702; 
 Sun, 26 Feb 2023 21:26:56 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 a14-20020a170902ecce00b0019a837be977sm3513341plh.271.2023.02.26.21.26.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:26:56 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH v2 39/76] target/mips: Drop tcg_temp_free from msa_translate.c
Date: Sun, 26 Feb 2023 19:24:28 -1000
Message-Id: <20230227052505.352889-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227052505.352889-1-richard.henderson@linaro.org>
References: <20230227052505.352889-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
X-TUID: RVp99l7tlMvc

Translators are no longer required to free tcg temporaries.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/mips/tcg/msa_translate.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index 1bcdbb1121..220cd3b048 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -217,8 +217,6 @@ static void gen_check_zero_element(TCGv tresult, uint8_t df, uint8_t wt,
     /* if some bit is non-zero then some element is zero */
     tcg_gen_setcondi_i64(cond, t0, t0, 0);
     tcg_gen_trunc_i64_tl(tresult, t0);
-    tcg_temp_free_i64(t0);
-    tcg_temp_free_i64(t1);
 }
 
 static bool gen_msa_BxZ_V(DisasContext *ctx, int wt, int sa, TCGCond cond)
@@ -237,7 +235,6 @@ static bool gen_msa_BxZ_V(DisasContext *ctx, int wt, int sa, TCGCond cond)
     tcg_gen_or_i64(t0, msa_wr_d[wt << 1], msa_wr_d[(wt << 1) + 1]);
     tcg_gen_setcondi_i64(cond, t0, t0, 0);
     tcg_gen_trunc_i64_tl(bcond, t0);
-    tcg_temp_free_i64(t0);
 
     ctx->btarget = ctx->base.pc_next + (sa << 2) + 4;
 
@@ -545,8 +542,6 @@ static bool trans_CTCMSA(DisasContext *ctx, arg_msa_elm *a)
     gen_load_gpr(telm, a->ws);
     gen_helper_msa_ctcmsa(cpu_env, telm, tcg_constant_i32(a->wd));
 
-    tcg_temp_free(telm);
-
     return true;
 }
 
@@ -563,8 +558,6 @@ static bool trans_CFCMSA(DisasContext *ctx, arg_msa_elm *a)
     gen_helper_msa_cfcmsa(telm, cpu_env, tcg_constant_i32(a->ws));
     gen_store_gpr(telm, a->wd);
 
-    tcg_temp_free(telm);
-
     return true;
 }
 
@@ -782,8 +775,6 @@ static bool trans_msa_ldst(DisasContext *ctx, arg_msa_i *a,
     gen_base_offset_addr(ctx, taddr, a->ws, a->sa << a->df);
     gen_msa_ldst(cpu_env, tcg_constant_i32(a->wd), taddr);
 
-    tcg_temp_free(taddr);
-
     return true;
 }
 
-- 
2.34.1

