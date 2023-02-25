Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp2635740ejc;
        Sat, 25 Feb 2023 01:17:57 -0800 (PST)
X-Google-Smtp-Source: AK7set9ZBdtBLDPdDE+0e2m4SuQPU9Nz23v/PPHo8Qfk7kGjPkFTiQe/i9jQHkUqP21CgTO21XKg
X-Received: by 2002:a05:622a:1a24:b0:3bf:a030:2e50 with SMTP id f36-20020a05622a1a2400b003bfa0302e50mr30693234qtb.64.1677316677386;
        Sat, 25 Feb 2023 01:17:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677316677; cv=none;
        d=google.com; s=arc-20160816;
        b=L6+L21MRU6PLcUCtuJ7B6HA4iKhalDACgSU58+o7C9dc3m7VYvYudCkIQH9mdaNNhO
         zi0jcYqKMhpopu0yuqvU/ZtExI0UjiIymT1e0SmWvfCW39gE6s2zh1qOT+gYbxtjrl8v
         Nozsaw6Zik1mBZny8t6pntc6zuj3+3AHEqwGE5HpHee4dMzhR0IrQIGNR3XY0sD63YPO
         nRoezEO1VxY/HsRCRoXCSE1xGelcHE2rLbMKew9MeTzqHykLxl9NLLg1vmnPsJkwgBQA
         xNKPzq30yPff3fTosCjJsu2WYr0g9E5MDQsLtlP8GWNlghaBHlY0JOUou2AZeUgo4Ud4
         NwyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=+mYb7riWV9KcKnyuvmf5HGj/XCuu4SlQJaHS4dBhBKA=;
        b=XC2XcL+UhXPhHnzXvsaBKT8HMTTvnSPZBCyBVKP07sUkfmeY9MFyxIsmrj6mBMCRPM
         SialhyWG/Bo5Qtd8XSyIZ5FNzQMN9O0u2V5EF9Vuff2dIO+YmeytASID7/qM7IRcq7OI
         z+cdIgf/pIaG44cL//u80+KPSMCFIXjx1Njs8OL475NbsCCf3tpnLlmkXV1+H0YpNwwr
         zhe0nrY4JV5C1w+7rGqj8OT7MWz622DbRP5XRlkbJNbuxJIZD4cKleSS8wN1ulom58ph
         ZbauNv9F0XrMrWCbVXg1AcSuC4O7ReIy+5vPiTjmempOIrB/w1L0SHCxn2oP0PmA50xe
         Riwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QYcpPdrP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q188-20020a3743c5000000b007426a1ceb86si1267352qka.426.2023.02.25.01.17.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 25 Feb 2023 01:17:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QYcpPdrP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVqg9-0002HW-2R; Sat, 25 Feb 2023 04:17:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqfA-0007S0-Eo
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:16:17 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqf7-0001QW-Lw
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:16:16 -0500
Received: by mail-pl1-x62a.google.com with SMTP id l15so1907543pls.1
 for <qemu-devel@nongnu.org>; Sat, 25 Feb 2023 01:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+mYb7riWV9KcKnyuvmf5HGj/XCuu4SlQJaHS4dBhBKA=;
 b=QYcpPdrPQAAs9wBXSoHkh6+IF2k5musAxnintgSEFCXdvG1mxv9rJ3Io3Afg7TNEXp
 um/uQylCJjPMTL4qZB61jn+tFfYnPATsNSB1EcpYyVjo8dDlsDVSBDLu2veS6uTjJggw
 wk48DnXyDWECm7n6D81UDvbZ+Teht7qrA3COaFp7Y9QDNGOXbTeuJ+7bJphb8xdI6Dfs
 kx5dPsc8xlon2agzyv+YgUiPXnoNJecdjEoOOAkwfb77UWU2D+qVKEGjgKfifVI6Ssub
 tdk77mde46LwZQNuYRQok+N0TEuqnSzXtpioCVfpW4/rbm6lBVa9LzyeNLFexOH8hrgf
 PD9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+mYb7riWV9KcKnyuvmf5HGj/XCuu4SlQJaHS4dBhBKA=;
 b=evRLCYhc0gjqchWEF+01tzdWO+IDUJrnR8AVsyGpAsKB1TIK3J71g6M6Svq5vx8Ab5
 Q/wKzh5nR47p8UFpkhc+vpHRrk+QKclnwgTKczLHXbs9hF0VcSHBDopqg4WXSxzTWuK+
 hbATekF4kqlbABFpcDWQ9DRG/0TGUV2phthsNAxYwXBYoLd84fCS45hBBNMpIcQoA7Gt
 YVxUGy/ZSZ7C0VUoD9QbiGh5stZrk7cxnmES4RX3Bshz8qUuaVOSO4ehlf3LeBByDZah
 8ZL0mtACLbWk2n6cDwnu46Z4GcQ/RyuB06XOOwnl234N7XlN1kX4BoAhI5iyWcpIdy6m
 ZIQw==
X-Gm-Message-State: AO0yUKX10xH/cg63B/P5YYWXfmPstX3aVM4RVFyFaFAAmKK5DxrNPfBT
 CLFB8WwZ/pEKJCBRLNPp1BX9SA9QuCFzs8sxpEk=
X-Received: by 2002:a17:902:e851:b0:19a:a267:f16c with SMTP id
 t17-20020a170902e85100b0019aa267f16cmr23099355plg.31.1677316572913; 
 Sat, 25 Feb 2023 01:16:12 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 je12-20020a170903264c00b0019607aeda8bsm831101plb.73.2023.02.25.01.16.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:16:12 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 39/76] target/mips: Drop tcg_temp_free from msa_translate.c
Date: Fri, 24 Feb 2023 23:13:50 -1000
Message-Id: <20230225091427.1817156-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225091427.1817156-1-richard.henderson@linaro.org>
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: byB8BohJdoHM

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

