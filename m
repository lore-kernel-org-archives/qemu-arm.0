Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp6586327ejq;
        Mon, 15 May 2023 08:18:57 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ62qz2QLB88r/xLHVuKDZZcs9MKRUr2C5O2AWnSGLmDD06IqBi2JuHwhrAMCH8o8uDs4ajf
X-Received: by 2002:a05:622a:1aa2:b0:3f4:404f:a4c7 with SMTP id s34-20020a05622a1aa200b003f4404fa4c7mr37017835qtc.56.1684163936911;
        Mon, 15 May 2023 08:18:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684163936; cv=none;
        d=google.com; s=arc-20160816;
        b=q0vS2ad66WWJddcxN7TWb2oeUbNlHWrGN4wwAJLGQ9ocNWxXvYai1v/xA+LRmdr1Y1
         B9U2elVbPZyUkxJe8E8WUNhybHnpo2ZUzs6jKiCsKoX7Pu/pmPSE1/Rum65wxqfor1O3
         EmK/WISRyLCYogvDZgG81cPIU+6aPUTKp5VHHPk76PRir9hKlw8ITYkMMpF1O/c9EBw/
         hSZkLeuecli/yW+vmCyga/fcXluuKM/xdAiyPwm5T17R3rYBedbGs4UkEN3amPXy/j/Y
         +EXujMPlko0gBhWmTxfirsxJQ0dISp4D7vF1K/6gKjdaXKOcdEqdVe836cn5+kR13et4
         cDAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=c2X0vEktAU9CIzOCMmP9cn2Oif9GXs/gZcvny2bfDX8=;
        b=jYRDcdqask5+slyN0Y/Er+ohn1K4aXPgQsbJqPNoxg0eu7DW3rk1MkALyDl9zP8AGE
         u5Zo2/iZx+RKXtER8tJj2TRUj4MQfWqOGKpV3CL8IdUiC1UdfWidL5H85Fx6L1Td+o3U
         yaku2O85lJMAGYN4wAwpvAiCpXQ16+8p7lWzfDyeTcX/WUl2jpPUwMFAniYGKNvwpJWr
         0tLN6VMDDuFUZ5EjRdBAAPUEnlchesxllswxGyC0Gc5o/3tZKmBqKyXp72pdWJ9lMBPU
         sYt07VD9IDuqEtMPiUmrmdQRchVmvtFRE4c2OyCrMfmjTj2Qo9qwv/QQ/lZ1DGpH/kbj
         qiKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S3dWbWCL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e16-20020ac85990000000b003ef7d5b4870si7243951qte.147.2023.05.15.08.18.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 May 2023 08:18:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S3dWbWCL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pyZIX-0008Ha-UK; Mon, 15 May 2023 10:35:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZHS-0006xu-SK
 for qemu-arm@nongnu.org; Mon, 15 May 2023 10:34:36 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZGV-0004rV-3j
 for qemu-arm@nongnu.org; Mon, 15 May 2023 10:33:43 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1ab0c697c84so97896915ad.3
 for <qemu-arm@nongnu.org>; Mon, 15 May 2023 07:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684161210; x=1686753210;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c2X0vEktAU9CIzOCMmP9cn2Oif9GXs/gZcvny2bfDX8=;
 b=S3dWbWCLjrZXoFH7472Pjl+571El8373lbF7dk4WJUBI0rTU4i/Txyf1n6UtCmu9VI
 QJ8yRupr+THchXWcWJxfW4Hr3+ZwVWxXsNI+iv6mztqxf+0kh/YWpUB2cfmJH4ec/bCy
 tL8thNR7atdDRtk/mSwY7biLgi3k341i/iY3tATsOw/6z+2NAr9geDxnqeX1bFZPahrR
 Hu+swDy7z+63Ep017ZIVZF1YzWG8tTCiMZ0y3wlP2EZLWlbvlqnuOZnqAdQXXHqMXNUP
 IcLys6D2LzbECBqyPVRRcEqgzai1tlNB8s2K4sgp/mImJIb67VFe39FFepjLujY39ZOL
 85yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684161210; x=1686753210;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c2X0vEktAU9CIzOCMmP9cn2Oif9GXs/gZcvny2bfDX8=;
 b=BmseM24RqmeZ1LLNlJAtvzNkmbsWKNaiWfOrlitSUTDviNE+oDhUWupUNqbUI00urP
 WXugxnHTFS3dMVpkhzIDJvPVg+xFcHIpwkDhpRVWaEKGrtcAYd/epnwr471pQO2qmtRH
 e044CrJ3a9DajP+xujrIBeWUOUsynMf4bZxE7cwWRcs93LUyJJOO4uLnGmzfFXKW2f0+
 Jdls+wm6Gg6CWeZZPunowLlrtTgYXMVfXoTK/XogGSJV461QmmeJ2eI8JP8RWnuqLOdm
 SzvwmtatTbqt1hDg5XuHEN2rhon3OxJOxrC5SOG4Qn49Ew2ajQjBHj2j/D5TJtAE4oER
 jlTw==
X-Gm-Message-State: AC+VfDzyjjEzYUVxxjI/66klfzhg9Wm3OSVr1OMKpdgvRibVHgkmpRpz
 m1Bdw6kyx4YOU+sG4pmNIOcPMA==
X-Received: by 2002:a17:902:da8f:b0:1aa:e739:4092 with SMTP id
 j15-20020a170902da8f00b001aae7394092mr47032971plx.52.1684161210351; 
 Mon, 15 May 2023 07:33:30 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:9902:96ac:8d8c:4366])
 by smtp.gmail.com with ESMTPSA id
 ik9-20020a170902ab0900b001ab0aec388bsm13694335plb.135.2023.05.15.07.33.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 07:33:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 18/54] tcg/loongarch64: Use full load/store helpers in
 user-only mode
Date: Mon, 15 May 2023 07:32:37 -0700
Message-Id: <20230515143313.734053-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515143313.734053-1-richard.henderson@linaro.org>
References: <20230515143313.734053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: DAvC4xdYShej

Instead of using helper_unaligned_{ld,st}, use the full load/store helpers.
This will allow the fast path to increase alignment to implement atomicity
while not immediately raising an alignment exception.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/loongarch64/tcg-target.c.inc | 30 ------------------------------
 1 file changed, 30 deletions(-)

diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index d1bc29826f..e651ec5c71 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -783,7 +783,6 @@ static bool tcg_out_sti(TCGContext *s, TCGType type, TCGArg val,
  * Load/store helpers for SoftMMU, and qemu_ld/st implementations
  */
 
-#if defined(CONFIG_SOFTMMU)
 static bool tcg_out_goto(TCGContext *s, const tcg_insn_unit *target)
 {
     tcg_out_opc_b(s, 0);
@@ -822,35 +821,6 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
     tcg_out_call_int(s, qemu_st_helpers[opc & MO_SIZE], false);
     return tcg_out_goto(s, l->raddr);
 }
-#else
-static bool tcg_out_fail_alignment(TCGContext *s, TCGLabelQemuLdst *l)
-{
-    /* resolve label address */
-    if (!reloc_br_sk16(l->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
-        return false;
-    }
-
-    tcg_out_mov(s, TCG_TYPE_TL, TCG_REG_A1, l->addrlo_reg);
-    tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_A0, TCG_AREG0);
-
-    /* tail call, with the return address back inline. */
-    tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_RA, (uintptr_t)l->raddr);
-    tcg_out_call_int(s, (const void *)(l->is_ld ? helper_unaligned_ld
-                                       : helper_unaligned_st), true);
-    return true;
-}
-
-static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
-{
-    return tcg_out_fail_alignment(s, l);
-}
-
-static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
-{
-    return tcg_out_fail_alignment(s, l);
-}
-
-#endif /* CONFIG_SOFTMMU */
 
 typedef struct {
     TCGReg base;
-- 
2.34.1

