Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp1541418ejb;
        Sun, 11 Jun 2023 09:04:33 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6MI739WnuvZ9Ef2RlO3PpH0jpJc7I8iQopVkaitqbnsXG/SHaQNnzQJnSjgMx5mcFA0l1C
X-Received: by 2002:a67:e3a5:0:b0:43b:2ca9:9b9e with SMTP id j5-20020a67e3a5000000b0043b2ca99b9emr2864904vsm.30.1686499473313;
        Sun, 11 Jun 2023 09:04:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686499473; cv=none;
        d=google.com; s=arc-20160816;
        b=0p7udwRl4eTFwEiFExJ8SUXFVn7z0fK99+l1IDA/OfgBRNOOKy5/xjJIzW6HaEOOu8
         mA2OXfsP1jz/nv/4INckhxA9zYEZ4HzxxbTqJDVeR5pZ4VvAKlf339TlqRW9RBgJl6IR
         YIpCxHPQVMUpOciEbXqGpDUmz91XeQQ5InlgO2QQOIAUBBk41UD8k8Tuw273LGfplJAp
         quOMtCzgrQiApy3MND2zE47/o+MUajoKrpCFvbKK3+Jmg1J2PhmjBe4rcI/h96/WS6XQ
         bIWiCBGjO03ZzfJQlw29FcAdAHFXtBy1p7pP4gwc6vIBxF1w15tjBAcbRdZYeffPhU0s
         BeHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=+rINJvFsN+oVD80Eh3osK1p8SBHtR21Dx7Bo1Xv1nvY=;
        b=pq9H6FGnKbDa8Ydcutqaq9VjBUiCsIbEXEpiuQS5kJMOfEpainVcqPEIj5IM4rY5ms
         Nj6cYM5Q3eS3JmnNQCnbByMXrHeKPRv26uJwG5jkFU8JO2uxLl8FW41A2WXLd3rhkotN
         m4GQj2lZvKqtvmyppaJUOyoLn6RsFNYgWthrHV6U6tByYZlYMPCFWvuFDeIqsCBOdoqJ
         KCpCHWb3zbLe51mWl0U8/687bTrNs/f0zsnIWA+vXl3GHHqZR7Bv20mYVPXkobczUAI7
         GnFI3YfNQH2ZLJXcLZrzXk3Z64IJGoQJF7YBkhcf4b5EhYiJnqY4IOoDscq6lAPYxfdh
         fYsA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YRcr2d3y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e24-20020a056102311800b0043b55bf0a1csi482528vsh.338.2023.06.11.09.04.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 11 Jun 2023 09:04:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YRcr2d3y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q8NVW-0006Ly-C0; Sun, 11 Jun 2023 12:01:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q8NUd-0005ot-TQ
 for qemu-arm@nongnu.org; Sun, 11 Jun 2023 12:00:42 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q8NUa-0000RR-Vr
 for qemu-arm@nongnu.org; Sun, 11 Jun 2023 12:00:39 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-30fba11b1ceso754185f8f.1
 for <qemu-arm@nongnu.org>; Sun, 11 Jun 2023 09:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686499235; x=1689091235;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=+rINJvFsN+oVD80Eh3osK1p8SBHtR21Dx7Bo1Xv1nvY=;
 b=YRcr2d3yuZ/IcB8tq+IMkrHwwlyX5WwRQArfK42t58w6cApfDQ0E+HYtMXZ6epNyTw
 jJgCiH1cBskj4v+DC1+JDPCUERaVRLedoud0HbIot6asLeX/jikNjOzK1+QU2XSTKEmr
 VQoeZVBz0xgYHFMnl3faflHibRKFJkp/wMW1RNSGfv/cIZhhqwZBdHiaNhHnwod8VyHS
 8kvUj8OD96mdMH8HxBCXBzSx0O1gkVlIjva8vit8z4Uupv0UZZ/moZ4KSd5spq2tm5iZ
 ORmRQUBcoK56+mH0GI5ikyXYbdrGWjKV3pM3/Z4o/LTXR+/vRjDEwiNtkLKn16QOtFnI
 vDAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686499235; x=1689091235;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+rINJvFsN+oVD80Eh3osK1p8SBHtR21Dx7Bo1Xv1nvY=;
 b=MFqENkXOIUrPnggKfsaVuEmnF0/7t5PdSD3et1wXAZ2PK0ucoaEGHaCoiEV2GrVCc7
 9zk7TE6RT92gcHTXstTMbSXgVqlpRM+cLz8eX7zj5MuNqXvZIebNatVHpaNrSDXxIE6Q
 L+oeEGXqLXMZUXIPq78RhAbLMoQAYT4r/tQxvAVM4Y3zXd6T1fzod7UDYAJM12R3sShN
 TiddHQsiu4KJraj8fg8vYY+hbwkdY3zGQLdRZp+OB9fVVo0/NkcFBkKbw8zTI8nl01/X
 D2DcN2m3/r8tKS+K8gNT1M6cRiirPU4ullBwT1/8k/D0xOFIHCQHMvgp5Z3MV3YstWiW
 Ssqg==
X-Gm-Message-State: AC+VfDzty6XF7HUx1fzjp8CJgw6hUGbJJsILxdPLS2r8llq6h1iW3mpt
 m+tQgm44l/rN1Q2LMjc2aT/ZColVxsVrh25JhE8=
X-Received: by 2002:a05:6000:136c:b0:30f:c243:d7e7 with SMTP id
 q12-20020a056000136c00b0030fc243d7e7mr199984wrz.68.1686499235464; 
 Sun, 11 Jun 2023 09:00:35 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 m9-20020a056000008900b0030ae499da59sm9923022wrx.111.2023.06.11.09.00.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jun 2023 09:00:35 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 03/23] target/arm: Pass memop to gen_mte_check1_mmuidx() in
 reg_imm9 decode
Date: Sun, 11 Jun 2023 17:00:12 +0100
Message-Id: <20230611160032.274823-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230611160032.274823-1-peter.maydell@linaro.org>
References: <20230611160032.274823-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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
X-TUID: 9ZD+CIef2ZRg

In disas_ldst_reg_imm9() we missed one place where a call to
a gen_mte_check* function should now be passed the memop we
have created rather than just being passed the size. Fix this.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/translate-a64.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 4ec857bcd8d..d271449431a 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -3226,7 +3226,7 @@ static void disas_ldst_reg_imm9(DisasContext *s, uint32_t insn,
 
     clean_addr = gen_mte_check1_mmuidx(s, dirty_addr, is_store,
                                        writeback || rn != 31,
-                                       size, is_unpriv, memidx);
+                                       memop, is_unpriv, memidx);
 
     if (is_vector) {
         if (is_store) {
-- 
2.34.1

