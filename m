Received: by 2002:a17:906:6dca:b0:989:33b4:be89 with SMTP id j10csp198514ejt;
        Tue, 20 Jun 2023 04:08:56 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5IvGzgtzxvRnmpV4f5s7WPNqzRAhR4J0wop/6Bi0B/otcqA1o2GE2PZH6K9W0dnNh3dDJd
X-Received: by 2002:a05:620a:8f87:b0:762:404f:1d53 with SMTP id ri7-20020a05620a8f8700b00762404f1d53mr7835156qkn.74.1687259336100;
        Tue, 20 Jun 2023 04:08:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687259336; cv=none;
        d=google.com; s=arc-20160816;
        b=ctxurb7r7pd57i7dfyXcq6dKDz37bCtTzMYM9U5sWZKELLqi8CKcKYPe8keVumFBWB
         ocj3z54hmdOSPKx9CuBTLU+2K9kaJS+F7zAJmn0Ja0xBvZT9VkQRsX76QdRCudcw3CGK
         Go2gXn9XTp3xo6RbXcB1IWYPZcJBozS1N6qQcslWX1OE/G4I0BhoMhgpkZszVlXn8O71
         dkk8syboZe3WHcnmlsAwcoqQ/qDBg8bW4W+zgNKbU7bjT9HtHy+DxMkodAHCEIAcu+LS
         fdacD5UMZ81m4Yd9M78Vuu0up9IHjW3A4sVSp69chrP2uOCdKmY8ggu5Svql1zlYfdpG
         DxFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=5CADGmxGJYg/RjV/FHciOOU7jKKLgdI+xydvPDVf6m0=;
        b=ukQTap1ugAu5KAFuLDB2URVr1AC16GjZuvJIfqZl+fBQfAL8ezJYrCrtIjF9anktZe
         jrusex31OZZhzynQ/bZzNDdJJleXvUa5JI1HTUZ1rs92h93LKc+BbLRpjPnNC44+/Iny
         9NkC8Q3eg2atmDTuCd+CUDkLT70Sw3VEqZXdAM8gFQJomYAKlV82BHtSKg6HB18lMgYz
         r0oUD5MSb++5SQ09STBtIS9WdhPiskbgkxnvZmv/uQHE+ZOTzYaO342b/dX/nZ+HDC4K
         aAcVkDTXTboRSMklLoldTrX487sxDsqlRh+VtcM0lzRrKPU1HdL2lkq7m9/zYpLMYEmG
         eREw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kmaRhTun;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ox17-20020a05620a829100b0075cc05fcbb3si690928qkn.462.2023.06.20.04.08.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Jun 2023 04:08:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kmaRhTun;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qBZE6-0006fP-5y; Tue, 20 Jun 2023 07:08:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBZE1-0006Wq-9B
 for qemu-arm@nongnu.org; Tue, 20 Jun 2023 07:08:41 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBZDy-0004Tm-0n
 for qemu-arm@nongnu.org; Tue, 20 Jun 2023 07:08:41 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-51a52a7d859so4500001a12.0
 for <qemu-arm@nongnu.org>; Tue, 20 Jun 2023 04:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687259316; x=1689851316;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5CADGmxGJYg/RjV/FHciOOU7jKKLgdI+xydvPDVf6m0=;
 b=kmaRhTunpRHqu1Dxjhr36m8NW55YJQUI6E24JzAolRKCJ35LpPhQf30r99LGvF8UCQ
 mNcm17XOmsbPi32rbeNhCgieHOp/mgosexsP2OCzlxXU6xVPO3MYdAKiVPF09flgVnW8
 /jyEQbc7KkxudMIOEkMwb0oiUb5E0kxvCXHd/yl0oKdE6USR5STpdBtrSlE+zHI/kjV5
 WG5XQ7AJENxMmQNlGbd+Fgpxkxg9ZupJb40+WkHLNbgCnKuirfI/uRrKYkFPJPeVXVwE
 YHA1ppKN/4WBZQVUHgRrDtP21N8cIlkr5UADvnTJYxC8nm3F6Wzb3bsQmvXyvuGDG7Sn
 fS3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687259316; x=1689851316;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5CADGmxGJYg/RjV/FHciOOU7jKKLgdI+xydvPDVf6m0=;
 b=XBKMcRYL0iz50WEmxyn84emsdWNHej0w7eWL8iSAzaRbLUv2JjMgNGvO+ZRXmd4Cd1
 JA3JjcV5v3XeXu+BnaivbHbVCvkH1bq9OWTf8zaxvVS9WyeBivPc+cAFLZnPB1hL+hUt
 Sab8apl73U0wZwBUiT1M1uC9zlc652ZmeKANrLa2jb/cpfygwEz/P7Jwm9hJf0uP1FoY
 Hu6T3vW/77IjT8bxTl3b4hk+QugSiXEkBayxPQws+0eLAaS1sr1xu6DoCE01Ag+9c452
 mfBX03CPYdzibR5eZTwxHqa8fkZkO69wwS8iGW4B4QiezwDSl0SIobIR4Ezy8VpbX5Y3
 3o7A==
X-Gm-Message-State: AC+VfDzcyqhgaUT5bP+S0qsAwwmAR4PEKCrPbhoy1r5pR20GQ08AJKNp
 Tnlm1V6aiia/f9u+LAh5Kt3jLg==
X-Received: by 2002:a17:907:3ea4:b0:978:8979:c66c with SMTP id
 hs36-20020a1709073ea400b009788979c66cmr17803113ejc.18.1687259316435; 
 Tue, 20 Jun 2023 04:08:36 -0700 (PDT)
Received: from stoup.lan ([176.176.183.29]) by smtp.gmail.com with ESMTPSA id
 x17-20020a170906711100b009884f015a44sm1170687ejj.49.2023.06.20.04.08.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 04:08:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: berrange@redhat.com, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v3 27/37] target/i386: Use aesdec_ISB_ISR_IMC_AK
Date: Tue, 20 Jun 2023 13:07:48 +0200
Message-Id: <20230620110758.787479-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230620110758.787479-1-richard.henderson@linaro.org>
References: <20230620110758.787479-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: gkCH1xTrs9bM

This implements the AESDEC instruction.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/ops_sse.h | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 93a4e0cf16..a0e425733f 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -2162,16 +2162,12 @@ void glue(helper_pclmulqdq, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s,
 
 void glue(helper_aesdec, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
 {
-    int i;
-    Reg st = *v;
-    Reg rk = *s;
+    for (int i = 0; i < SHIFT; i++) {
+        AESState *ad = (AESState *)&d->ZMM_X(i);
+        AESState *st = (AESState *)&v->ZMM_X(i);
+        AESState *rk = (AESState *)&s->ZMM_X(i);
 
-    for (i = 0 ; i < 2 << SHIFT ; i++) {
-        int j = i & 3;
-        d->L(i) = rk.L(i) ^ bswap32(AES_Td0[st.B(AES_ishifts[4 * j + 0])] ^
-                                    AES_Td1[st.B(AES_ishifts[4 * j + 1])] ^
-                                    AES_Td2[st.B(AES_ishifts[4 * j + 2])] ^
-                                    AES_Td3[st.B(AES_ishifts[4 * j + 3])]);
+        aesdec_ISB_ISR_IMC_AK(ad, st, rk, false);
     }
 }
 
-- 
2.34.1

