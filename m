Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp154223lfb;
        Tue, 24 Nov 2020 20:08:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxsuhqpl0cFIkXqPFXAAwn8V/JDVAt8ItnHVi8XIjji2OTfo8dO9oCY0JUzWDNjYX0aBDAJ
X-Received: by 2002:a25:fc11:: with SMTP id v17mr2365946ybd.233.1606277306975;
        Tue, 24 Nov 2020 20:08:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606277306; cv=none;
        d=google.com; s=arc-20160816;
        b=nCgGa0c/tcBTUvMTVe+QlOj2J9xnFC0d6QIIrTFaayqdY1t3v+t1zazEYg4rINdbPq
         igBX82AgLJ+e2IGieUcaaiYnKS6+YGAwWd9Ql1QN5kiaddDKoFnjo0Tw829RaQ7/2f+L
         bUKd5ebkaOKoExwdW3xbjaC4tHrVmEjGKeONWs81/rTfoDcO3eDnbE+rykQsUTFPZzUR
         XmCfEx/ICntm+np6loZ/dn2HMhq0xN9az0A2q2ax3p+hrIkfYpymVDIcqAPtZNUP1Bnh
         UI7HjsYzMjrBB3dGcfx4IBaqhSVuaCfCH69X/yMl7zcyPtWv5gkZ/O6fuM0SubSTZ/rD
         ZVfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Wu5Kt3iN7e6z3sUpws6R3XP7/Dj8XZZymOVS+ThDJek=;
        b=jAxZgxBA3Wlx2ATo4XHf3H7a2wdlaAoENJo0coP7OG+Ur0oxap6DUt1BzOHSnfc+qH
         aM9NyZTAEmUtEE+bcMGK9w9gKPCNIQTRin3CSIH7QElR4Hjm7+f0ywLLCjST3g89oZa0
         N7lRPKQPzUQI+k7/BsvcNfk5Z7R+CwF2EZMfsbmf/zFjdT4/X2F05U7kxs8Cwjcmlu30
         kVWyjVezWG9FP50naQlbJU66q2JZ8RJPt2pWtJO3EEMV++hfsG5Y4v0JiT8DMuD5nCXx
         4TiV22Ro08225jB6aLqqF4m+LAEtxCnXJAiJm2XOz8BtMvE/YzdP8PCHHKxeDAiL2sN6
         BklA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="G/ezqJF/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i18si1188438ybj.169.2020.11.24.20.08.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Nov 2020 20:08:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="G/ezqJF/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1khm6U-0006Qw-9V
	for alex.bennee@linaro.org; Tue, 24 Nov 2020 23:08:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1khm52-0004ua-F8
 for qemu-arm@nongnu.org; Tue, 24 Nov 2020 23:06:56 -0500
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:45099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1khm4z-00063l-PO
 for qemu-arm@nongnu.org; Tue, 24 Nov 2020 23:06:56 -0500
Received: by mail-pg1-x541.google.com with SMTP id 62so1162395pgg.12
 for <qemu-arm@nongnu.org>; Tue, 24 Nov 2020 20:06:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Wu5Kt3iN7e6z3sUpws6R3XP7/Dj8XZZymOVS+ThDJek=;
 b=G/ezqJF/80UzEjCfBVtjm4leY8YH0zUhtNhTnGWR4tGn6HtDRVkFqRtP1njB2uclMl
 9F+uyGlUSao3mvwrsvIPQ/PVMW+iqZ/km7c2vSAV28ipiZgDfR/GI3dm97OKEc46xg8Y
 wFDEyVuRjnq17GRz/BGkai+EGR61jLkDIaObLnnsG/0jclZnl6Eiv5NteasbB5dtxdt8
 TctK79qGJ6kuLfG/ell5UE3u6ub0cyPI48H1aVVniL+N5/4tGLm2tcYDyDNj3T+jLw8L
 BQKCYpUWNuhXAgwDeiNc2ymElUocG9ym+9+8t7QfaaOoAKg1+kPHjanQobWYtkN9nCG2
 QazQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Wu5Kt3iN7e6z3sUpws6R3XP7/Dj8XZZymOVS+ThDJek=;
 b=ggUoBE3u1DZ24Tx9/9LQ7gYYfzaJ5bRDaQ2gxV096ZHOa5Sls5faxcWBALW4O1prUS
 Q0OK1fYXwAABtG7kp12rWN2/rgayHDtzBTO7eRtmSJraucSFEeUWb/wAyP37owHYoTRe
 jjBPLrrXz4yTQJd7rfY8SyFd83aKcYlB3MI8tqZmfgroeccx7Cnfs2F+b3hKuapp+fmm
 GAZOPPVSUDEzfruxSTdI0rM13e+lhg5cFC+lbzG10ZYxQVIlF3WDZTlXYvMUt8HmVG2R
 xlPm78nOTz37g4T+pNWUiH0Pt4XVwvAIs7TjsSGxQVgr86pdHvTy/LtC74F+G4J3q+EI
 yy9w==
X-Gm-Message-State: AOAM532BfPtL/U1gEDQ3Im370rocm/DKvHANaNAqgGuHjSupbi3M5xg9
 hlfV5azkuzlVj3LjW8rVKT6+8g==
X-Received: by 2002:a17:90a:e016:: with SMTP id
 u22mr1821185pjy.195.1606277212724; 
 Tue, 24 Nov 2020 20:06:52 -0800 (PST)
Received: from localhost.localdomain ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id f7sm447806pfe.30.2020.11.24.20.06.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 20:06:52 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/11] target/arm: Enforce alignment for VLDM/VSTM
Date: Tue, 24 Nov 2020 20:06:37 -0800
Message-Id: <20201125040642.2339476-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201125040642.2339476-1-richard.henderson@linaro.org>
References: <20201125040642.2339476-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::541;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x541.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qqXmjW5S5moa

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-vfp.c.inc | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/target/arm/translate-vfp.c.inc b/target/arm/translate-vfp.c.inc
index 96948f5a2d..58b31ecc3f 100644
--- a/target/arm/translate-vfp.c.inc
+++ b/target/arm/translate-vfp.c.inc
@@ -1065,12 +1065,14 @@ static bool trans_VLDM_VSTM_sp(DisasContext *s, arg_VLDM_VSTM_sp *a)
     for (i = 0; i < n; i++) {
         if (a->l) {
             /* load */
-            gen_aa32_ld32u(s, tmp, addr, get_mem_index(s));
+            gen_aa32_ld_i32(s, tmp, addr, get_mem_index(s),
+                            MO_UL | MO_ALIGN | s->be_data);
             vfp_store_reg32(tmp, a->vd + i);
         } else {
             /* store */
             vfp_load_reg32(tmp, a->vd + i);
-            gen_aa32_st32(s, tmp, addr, get_mem_index(s));
+            gen_aa32_st_i32(s, tmp, addr, get_mem_index(s),
+                            MO_UL | MO_ALIGN | s->be_data);
         }
         tcg_gen_addi_i32(addr, addr, offset);
     }
@@ -1148,12 +1150,14 @@ static bool trans_VLDM_VSTM_dp(DisasContext *s, arg_VLDM_VSTM_dp *a)
     for (i = 0; i < n; i++) {
         if (a->l) {
             /* load */
-            gen_aa32_ld64(s, tmp, addr, get_mem_index(s));
+            gen_aa32_ld_i64(s, tmp, addr, get_mem_index(s),
+                            MO_Q | MO_ALIGN_4 | s->be_data);
             vfp_store_reg64(tmp, a->vd + i);
         } else {
             /* store */
             vfp_load_reg64(tmp, a->vd + i);
-            gen_aa32_st64(s, tmp, addr, get_mem_index(s));
+            gen_aa32_st_i64(s, tmp, addr, get_mem_index(s),
+                            MO_Q | MO_ALIGN_4 | s->be_data);
         }
         tcg_gen_addi_i32(addr, addr, offset);
     }
-- 
2.25.1

