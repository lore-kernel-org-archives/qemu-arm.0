Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp6558445ejq;
        Mon, 15 May 2023 07:36:36 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6HgB1aruKeEhA1B3FzzEOnf3C4qYHT6I4ZZUFnpu2byzG8/FwzOM92qsAJO4pk4g6e/Qlt
X-Received: by 2002:a05:6102:d3:b0:434:89e3:5a39 with SMTP id u19-20020a05610200d300b0043489e35a39mr12878747vsp.10.1684161396476;
        Mon, 15 May 2023 07:36:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684161396; cv=none;
        d=google.com; s=arc-20160816;
        b=wma4WQLPOX3asw6742zcc0tojTle3YM96HZfm3K1xcrmNnhYqiQVpliidtAFPso1GT
         WKM5l7qwAQiAOSJAoI0sj/wAVT2iHup/O+Udvayo/SXVV6bVFP8mqX/mnkJu9lgjGvft
         800wcSxMQ62RrdesVHf+HihwYVS8BjmbtkhaX1mNRdFfCY/AsC2GZD0sJjPW55P1GR4l
         0zrq/9XUZMVExKaZzz9UL2/2M0sSOf681Ac3gLukO4bxa5bFweov24gkwt8Za+cJ4yYO
         8HJQ7sf9DWUrRTBztpgVppNsjGQrXRs7ewRaqUI111eYsxmNbQLo5UX9TdQSP+lmwU3d
         5jxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=PEsWAFpnCMYNqvb5yhVEEwYFWaIpTnBv29asu3C8fXA=;
        b=QI+0/Hmgt+lep4l5GeyHa1g7pTvkvpk+sHYRzZKgH8jLofZ0+YMtHsNhLtqRAxG0/s
         CnODvM7Fk3ffdulUEZdI/TSay6Sq0oHK5u7b31X7OWS9+jZjit/gKoO6FzrpYmcoer7n
         qm8IQBZQtca0Abtzp5oxQ9Lg7qPkoGr8tl3yuqJb4FpTo3da3iWEhS15bP7OC7fWlisx
         vAmfd46lzVIVSnRqmJSuVS4Ssvs/rx375/lF5jhshv8O3PeYynn994OXvU39UTkoA3Fp
         ATblW7QiUlGR2gGmwER0cbSM7la1qot1WNXVbm88+/k+JXsJkx1q6Yx+HcvqmIqnFZeK
         x5hA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=viSPRN0b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a28-20020a05620a16dc00b00757da616db3si8874314qkn.232.2023.05.15.07.36.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 May 2023 07:36:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=viSPRN0b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pyZIC-0007i8-4T; Mon, 15 May 2023 10:35:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZHc-00077p-Oz
 for qemu-arm@nongnu.org; Mon, 15 May 2023 10:34:47 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pyZHY-0004zb-4S
 for qemu-arm@nongnu.org; Mon, 15 May 2023 10:34:38 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1ab01bf474aso97653405ad.1
 for <qemu-arm@nongnu.org>; Mon, 15 May 2023 07:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684161215; x=1686753215;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PEsWAFpnCMYNqvb5yhVEEwYFWaIpTnBv29asu3C8fXA=;
 b=viSPRN0bskYGKCe2vB2bTfhdcgLJEJpOZaEnEi5JqLgZuweOECFo2l5Dos3y86egFz
 PBDVbiFnFyNvJycmieq330p4un91Rmk52Zwl+zTTx3qASF0xwfy8shhNsDpaKFhCSeWm
 CIS0WiCEQQZuD8xwTFRWpsT569BTFPSgzYYRS0ENkDz7xmSbPewN+G32e5tvfdrADV6w
 hr5q3qQ/lLpM9IuRQ7GbsD4MOP5Wb1JpbxgBnd8zCCR3BuyFqd7+M0QhoMMAhm/n2psF
 edJeb/zUCFrW9G18TYBUEMkZFG0kNBDxUvkUVGQ4L0A0bV0F/ddjYA4N9dPiBzrfp29Y
 VWBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684161215; x=1686753215;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PEsWAFpnCMYNqvb5yhVEEwYFWaIpTnBv29asu3C8fXA=;
 b=GfH1fZylWlbz+8y6d5O4Usd1OwqnLvqffBNj3AeuRrs0Jxc0w+Y/W9dRT3FGc+WVdR
 VuaSu+Sz7JMXdxuu5lWQcVHhqduloyvNsK0XskxJxEFMsSYIbRVobtrz/zIT4/II4fKd
 18h90ebXMs5hzLkuDz1DMxwBFsIPv9es1Jig9xHecuqwMCePQimpTL9MdkedUxorvS8a
 KEcWDYzgP4HmLvgmsHI7Uy9p7QVLBnJ/lxnKor4tBGg/zrowAJSzlSNHZyMxHPnzk18f
 t/3jL8en6Edzhqi/PzhnRcfWreVgfMYuJJ4naqX9oQ5c+b6RexFS1GxcAKiYeq2URt7s
 uH2w==
X-Gm-Message-State: AC+VfDzkSOTDjWG8Fd3k4ooxGT/pIQLbZUH6Y08DK/vor3UuJZEnDa1R
 7GoR9T6qSnNtKropCALVLlBVCQ==
X-Received: by 2002:a17:903:1205:b0:1ac:6d4c:c26a with SMTP id
 l5-20020a170903120500b001ac6d4cc26amr35717447plh.14.1684161214925; 
 Mon, 15 May 2023 07:33:34 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:9902:96ac:8d8c:4366])
 by smtp.gmail.com with ESMTPSA id
 ik9-20020a170902ab0900b001ab0aec388bsm13694335plb.135.2023.05.15.07.33.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 07:33:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 23/54] tcg/s390x: Use full load/store helpers in user-only
 mode
Date: Mon, 15 May 2023 07:32:42 -0700
Message-Id: <20230515143313.734053-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515143313.734053-1-richard.henderson@linaro.org>
References: <20230515143313.734053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62a.google.com
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
X-TUID: Z353cGGfdxGE

Instead of using helper_unaligned_{ld,st}, use the full load/store helpers.
This will allow the fast path to increase alignment to implement atomicity
while not immediately raising an alignment exception.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/s390x/tcg-target.c.inc | 29 -----------------------------
 1 file changed, 29 deletions(-)

diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 968977be98..de8aed5f77 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -1679,7 +1679,6 @@ static void tcg_out_qemu_st_direct(TCGContext *s, MemOp opc, TCGReg data,
     }
 }
 
-#if defined(CONFIG_SOFTMMU)
 static const TCGLdstHelperParam ldst_helper_param = {
     .ntmp = 1, .tmp = { TCG_TMP0 }
 };
@@ -1716,34 +1715,6 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
     tgen_gotoi(s, S390_CC_ALWAYS, lb->raddr);
     return true;
 }
-#else
-static bool tcg_out_fail_alignment(TCGContext *s, TCGLabelQemuLdst *l)
-{
-    if (!patch_reloc(l->label_ptr[0], R_390_PC16DBL,
-                     (intptr_t)tcg_splitwx_to_rx(s->code_ptr), 2)) {
-        return false;
-    }
-
-    tcg_out_mov(s, TCG_TYPE_TL, TCG_REG_R3, l->addrlo_reg);
-    tcg_out_mov(s, TCG_TYPE_PTR, TCG_REG_R2, TCG_AREG0);
-
-    /* "Tail call" to the helper, with the return address back inline. */
-    tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_R14, (uintptr_t)l->raddr);
-    tgen_gotoi(s, S390_CC_ALWAYS, (const void *)(l->is_ld ? helper_unaligned_ld
-                                                 : helper_unaligned_st));
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
-#endif /* CONFIG_SOFTMMU */
 
 /*
  * For softmmu, perform the TLB load and compare.
-- 
2.34.1

