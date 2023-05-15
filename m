Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp6590023ejq;
        Mon, 15 May 2023 08:25:01 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7M9VcldHLx87s9ZPHeqzaC1hjVyF9jDEC+UQo6nFXzI+nzn6bjLIEtbKxU1P2ce7ckE7Lj
X-Received: by 2002:a05:6214:f65:b0:621:216c:456c with SMTP id iy5-20020a0562140f6500b00621216c456cmr53516449qvb.43.1684164300755;
        Mon, 15 May 2023 08:25:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684164300; cv=none;
        d=google.com; s=arc-20160816;
        b=kO+jpidnT81+0C97il0BC3tdUM/FfTkT394cwQ4tGOm6LwDMDMsZW3RpBODZCb50sK
         6jO6VrBU/EfokGCRQjOq3YYxAzBCitq/tF9LoUuunqrMMbgIkrGudq0dXfVzQZuD9cSI
         e5rtXhYNX1FPVYZFKkk0oXwVi+LN+QYgu/9iwlqA3d36+mkm21f0j0iXqNLLuTlm4FNg
         6AiSDtzpvvkwGneWhk85dMEGxyWYKA9d5yzPBeoPF7PbE0FRRJSnmZNIktIAnQPdmGGD
         pS9tINgL6/wlLi9hIu5a57Ufy9DycCHvJmBXnANHTTQf8IPex1IEQuzTLxyQbrEI6KnJ
         ueTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=gXvb5M+QQ4GlJC4+AWTZXZCLTvkRCJufT4wwLa/Umbo=;
        b=wOuJxX6csv+3FwohroX8RSo52Kn2C+Omvl669pBNM7pXHhRLUmeAknKC/F5DaEDVSX
         yrqaHnEy2ffw7G9SesYlyBMDmHwnxo+QSDhqrxyKlS9X7VaapV09J4ndTlNMzdb1AQOn
         HAZLd0giQebvrygqu7wIrJdHaARVxlt8GvkRYCORdgHZ/yrEOr5d+wfSu3RgFRcTN+Lm
         9V6uAsrQxQoeDD2b6Mof7i5sHX8cbI6RBGfGZZ9R7mFgl5oDdZrZjeWsrqjNZ+xAcgsf
         Vz5TsPTkYvE8Z/Rwgv7wM3PYOe6Rxr0o/V2fDJOFOiFf/0jF2jexi/gSwV/YKCPzjKX1
         L00w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=s4NhjvT2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r13-20020a0562140c8d00b0061b70a7e33esi10018555qvr.101.2023.05.15.08.25.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 May 2023 08:25:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=s4NhjvT2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pyZI8-0007Ws-J1; Mon, 15 May 2023 10:35:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZHS-0006y2-Rc
 for qemu-arm@nongnu.org; Mon, 15 May 2023 10:34:36 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZGY-0004yk-Qb
 for qemu-arm@nongnu.org; Mon, 15 May 2023 10:33:45 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1ab0c697c84so97897385ad.3
 for <qemu-arm@nongnu.org>; Mon, 15 May 2023 07:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684161213; x=1686753213;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gXvb5M+QQ4GlJC4+AWTZXZCLTvkRCJufT4wwLa/Umbo=;
 b=s4NhjvT2n7X+pja39Pi4BDc1sNK7U0CQVYP46Ulru9k1GoWMfgt59ssGik9AVDTNWg
 vbfm0HVMdgLD6Yvghnb8VABMDYUed5x9qeu4mMimczP/Q/Cw43VuPYlwejpOwwhdIrQQ
 xa0Xnxh//jtRJgKj1rGnYMFjYG2KKbbMZYZJhSW6p/i3DJho7xqIjvNex9O8MLXgd2cL
 Inw0IkGguUeaxzjxUAExJiaX94/lelPAudR1q2bkXDvzLEoJ30BNsTHn0k7r/qeNLmGY
 RtFzvUKxIbO2IWH2NS/wQ9BSiBhcnuU+kiRBkmY3sptzTgbmTn5P9nJwy8uv2LiBpEPQ
 UVZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684161213; x=1686753213;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gXvb5M+QQ4GlJC4+AWTZXZCLTvkRCJufT4wwLa/Umbo=;
 b=leNaCyo5e0I47LNbogQgkjmtxRuZFF8E7+++L/sZSH9bGlqB0pwqo+w/GPavlJNCO9
 BL2/KrPP5bRsS4khcR2pCjK3kuY8vX6CqaY/7FhzZuqvL5sWFIWuQqlAUjzORvZBNw4B
 9F4kA+19CHw4UE3RzZl9ohEPsi0V6giJ+yBk28/+5z93SOhUXvov/kHv6GAhdw1eDqnk
 Q8gzEfEcNCi0TjPBfHM3Go+KK5rIUdIUjuJL1o6bJCHWtjdd0ifrurACjzsAKWGwmQYq
 tMwYdYkUvpIZ6V8U95878RyUVW93fWQ5FQMbs7Lyjbe2dKsu8oyq/wYczwhLxy65b4be
 2XAg==
X-Gm-Message-State: AC+VfDx3G286UKdXUDQhjzlrxHWI7bmw6H6HU+LsLVe4JtVZw27o8ewM
 PB48XTqeqylVAfRvTKVxvgkPng==
X-Received: by 2002:a17:903:1247:b0:1ab:afd:903a with SMTP id
 u7-20020a170903124700b001ab0afd903amr44833633plh.24.1684161213068; 
 Mon, 15 May 2023 07:33:33 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:9902:96ac:8d8c:4366])
 by smtp.gmail.com with ESMTPSA id
 ik9-20020a170902ab0900b001ab0aec388bsm13694335plb.135.2023.05.15.07.33.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 07:33:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 21/54] tcg/arm: Use full load/store helpers in user-only
 mode
Date: Mon, 15 May 2023 07:32:40 -0700
Message-Id: <20230515143313.734053-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515143313.734053-1-richard.henderson@linaro.org>
References: <20230515143313.734053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
X-TUID: dykvEnITfBL8

Instead of using helper_unaligned_{ld,st}, use the full load/store helpers.
This will allow the fast path to increase alignment to implement atomicity
while not immediately raising an alignment exception.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/arm/tcg-target.c.inc | 45 ----------------------------------------
 1 file changed, 45 deletions(-)

diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index a02804dd69..eb0542f32e 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -1325,7 +1325,6 @@ typedef struct {
     bool index_scratch;
 } HostAddress;
 
-#ifdef CONFIG_SOFTMMU
 static TCGReg ldst_ra_gen(TCGContext *s, const TCGLabelQemuLdst *l, int arg)
 {
     /* We arrive at the slow path via "BLNE", so R14 contains l->raddr. */
@@ -1368,50 +1367,6 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     tcg_out_goto(s, COND_AL, qemu_st_helpers[opc & MO_SIZE]);
     return true;
 }
-#else
-static bool tcg_out_fail_alignment(TCGContext *s, TCGLabelQemuLdst *l)
-{
-    if (!reloc_pc24(l->label_ptr[0], tcg_splitwx_to_rx(s->code_ptr))) {
-        return false;
-    }
-
-    if (TARGET_LONG_BITS == 64) {
-        /* 64-bit target address is aligned into R2:R3. */
-        TCGMovExtend ext[2] = {
-            { .dst = TCG_REG_R2, .dst_type = TCG_TYPE_I32,
-              .src = l->addrlo_reg,
-              .src_type = TCG_TYPE_I32, .src_ext = MO_UL },
-            { .dst = TCG_REG_R3, .dst_type = TCG_TYPE_I32,
-              .src = l->addrhi_reg,
-              .src_type = TCG_TYPE_I32, .src_ext = MO_UL },
-        };
-        tcg_out_movext2(s, &ext[0], &ext[1], TCG_REG_TMP);
-    } else {
-        tcg_out_mov(s, TCG_TYPE_I32, TCG_REG_R1, l->addrlo_reg);
-    }
-    tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_R0, TCG_AREG0);
-
-    /*
-     * Tail call to the helper, with the return address back inline,
-     * just for the clarity of the debugging traceback -- the helper
-     * cannot return.  We have used BLNE to arrive here, so LR is
-     * already set.
-     */
-    tcg_out_goto(s, COND_AL, (const void *)
-                 (l->is_ld ? helper_unaligned_ld : helper_unaligned_st));
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
-#endif /* SOFTMMU */
 
 static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
                                            TCGReg addrlo, TCGReg addrhi,
-- 
2.34.1

