Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CC7DC43458
	for <qemu-arm@archiver.kernel.org>; Mon, 13 Jul 2026 23:03:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wjPfp-00066U-Mi; Mon, 13 Jul 2026 19:02:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wjPfo-00065c-Tr
 for qemu-arm@nongnu.org; Mon, 13 Jul 2026 19:02:52 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wjPfn-0005ml-6G
 for qemu-arm@nongnu.org; Mon, 13 Jul 2026 19:02:52 -0400
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-2cc7ef7ec27so41197605ad.1
 for <qemu-arm@nongnu.org>; Mon, 13 Jul 2026 16:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783983770; x=1784588570; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=D3B4FRG0i1WwOJHdec37PeTEQbfPbhciyRXi7UVkDdM=;
 b=ZGksirqmOMSyHSRpkOUYkLDVgt1YSiK+299NfyjA5DuAvNDB6i1mvHBXTCuDlspzBX
 vZcC+IptRVs/fFxkUxOOmf80ZlC6bXpNg00nfDHEB1Q4pcokd9FLEBQ8x5+BYlz56OCY
 3FyDNt9te/rmKJcYhO4rlGISvGpkWwbwj3tWKL2F9yO32ZUnjiXqQcfAHRXoiWWmIMSy
 2kjzclC/bg19MCBW/bEPeai9t8wxhCxpceN4Y+HUCaooM2sYZxqtpGRBBDqU0Ei+a3fo
 ggAkbp/pEN8KhgfYBzqUXWjcwbzf5X2xunS49x9HcWwIsESSLjNuiajh5bMmflMz7wk4
 fk5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783983770; x=1784588570;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=D3B4FRG0i1WwOJHdec37PeTEQbfPbhciyRXi7UVkDdM=;
 b=gQQ5s0REmBGdnQadujn6rTews0BhK1omCwARGSeOulTbGTog+b1foEGFyEzqmbUIdl
 zymvP3/mOa1eeIbG3FmqjQKCvfnpR5ptEGiJEl6TjekTIzzh/B9YAK7c+5wlRFZGs6mP
 MqE9JT1grDr24S4Q4ZIlzw+ZU4oWXIzud7dnZq3TThxjAKMH2en8DZYQ+dSf00JgjohA
 NTvzK89Wc7qvsrETF6MuOGJWtaCuoLoOkJepn+Gr/rHizT4j7Wti+0mkOIFFCsdysiJE
 SzeZx3wkQWkX/jhtQXDULB8B9tpgIk0SMIKrWiNPdplfSDBRkQqhgJ7CnF5AulWNbtaD
 JUCA==
X-Gm-Message-State: AOJu0YyI2IxnWHmS0DbI0dNdpQzMcmYZwMBUg+T+LcKLTWQ0WG5jMAZD
 jQogOKyo4kdTEp6W8wKBNcG5rgDPp2PdKo8WFG5RjGEkEKNWL8aJgqTMHLjkReq9ptI=
X-Gm-Gg: AfdE7cnDEV7TQfCgqvWNJI6h+Dhm3lThZrvN3MZiJl6mPACi7kTNxiTykYh2F43NJ27
 jR6Vh4lN0tE7u5j81Bjwl358dP+6aPez4gGN6v9/koZTUPER4QFPHnapW4wRARbJEiht1a62B/H
 5fUxpDHasChZRWB/brS3JbOwa0Oh1TqX2jSpkeQZwXDSSEynegFsJrCRNPaPLZpY3kTRv0dn6jA
 N6v0glTOhg/wXIxRXU3pmhOxKCMVvrTH0+o4xHJda/yqw4g6ySdFN4QCAw8f0zK4s3YRrbBJckr
 k++G2CC5yN9GUSPQ7v3bxd8gIzgicRnTRhWvwbUAB9rlmXBSQkqBZoYHalHwhGamoLSilvfNETS
 h4kookYAyNMOe+O7KVqlEshkFr6Sz6uLzUv+1TN1PvhbJWDxou5JelQI6aQCr551Slihhv6c6aG
 Es5yGBFf/IVZ5L1m4w4UYizxkZ0oFI
X-Received: by 2002:a17:902:fda5:b0:2ca:d7a0:1312 with SMTP id
 d9443c01a7336-2ce9ee16623mr111917935ad.25.1783983769677; 
 Mon, 13 Jul 2026 16:02:49 -0700 (PDT)
Received: from stoup.. ([71.212.146.49]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ccc9bf8e9csm106902965ad.24.2026.07.13.16.02.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2026 16:02:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 05/10] target/arm: Implement FTMOPA (widening, 2-way,
 FP16 to FP32)
Date: Mon, 13 Jul 2026 16:02:39 -0700
Message-ID: <20260713230244.70174-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260713230244.70174-1-richard.henderson@linaro.org>
References: <20260713230244.70174-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/helper-sme-defs.h | 1 +
 target/arm/tcg/sme_helper.c      | 6 ++++++
 target/arm/tcg/translate-sme.c   | 2 ++
 target/arm/tcg/sme.decode        | 1 +
 4 files changed, 10 insertions(+)

diff --git a/target/arm/tcg/helper-sme-defs.h b/target/arm/tcg/helper-sme-defs.h
index f05b53f412..8a959447b2 100644
--- a/target/arm/tcg/helper-sme-defs.h
+++ b/target/arm/tcg/helper-sme-defs.h
@@ -410,3 +410,4 @@ DEF_HELPER_FLAGS_6(sme_ftmopa_hh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, fps
 DEF_HELPER_FLAGS_6(sme_ftmopa_ss, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, fpst, i32)
 
 DEF_HELPER_FLAGS_6(sme_bftmopa_sh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_FLAGS_6(sme_ftmopa_sh, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, ptr, env, i32)
diff --git a/target/arm/tcg/sme_helper.c b/target/arm/tcg/sme_helper.c
index 91447d9c0e..c2b7c23d6c 100644
--- a/target/arm/tcg/sme_helper.c
+++ b/target/arm/tcg/sme_helper.c
@@ -3020,6 +3020,12 @@ void HELPER(sme_fmop4a_sh)(void *vza, void *vzn, void *vzm,
     sme_mop4(vza, vzn, vzm, env, desc, sizeof(float32), inner_fmop4a_sh);
 }
 
+void HELPER(sme_ftmopa_sh)(void *vza, void *vzn, void *vzm, void *vzk,
+                           CPUArchState *env, uint32_t desc)
+{
+    sme_tmop_2way_sh(vza, vzn, vzm, vzk, env, desc, inner_fmop4a_sh);
+}
+
 static void inner_fmop4s_sh(void *vd, void *vn, void *vm, void *vinfo)
 {
     float32 *d = vd;
diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index 8548bfd5c9..43d1726972 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -2165,3 +2165,5 @@ TRANS_FEAT(FTMOPA_ss, aa64_sme_tmop, do_tmop_fp,
 
 TRANS_FEAT(BFTMOPA_sh, aa64_sme_tmop, do_tmop_fp,
            a, MO_32, FPST_ENV, gen_helper_sme_bftmopa_sh)
+TRANS_FEAT(FTMOPA_sh, aa64_sme_tmop, do_tmop_fp,
+           a, MO_32, FPST_ENV, gen_helper_sme_ftmopa_sh)
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index 49af8fd19e..5c453ea729 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -1147,3 +1147,4 @@ FTMOPA_hh       1000 0001 010 ..... 000 ... .... .. 100 .       @tmop_o1
 FTMOPA_ss       1000 0000 010 ..... 000 ... .... .. 00 ..       @tmop_o2
 
 BFTMOPA_sh      1000 0001 010 ..... 000 ... .... .. 00 ..       @tmop_o2
+FTMOPA_sh       1000 0001 011 ..... 000 ... .... .. 00 ..       @tmop_o2
-- 
2.43.0


