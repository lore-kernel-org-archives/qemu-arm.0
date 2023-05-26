Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp813313ejb;
        Thu, 25 May 2023 17:26:34 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ71Xz6+53N82Ws/55zdhSD/zkwJKjPZoQqO3zg/ylKbeDMbyVni589MoXskzBmr3cpoDGvs
X-Received: by 2002:a05:622a:4d0:b0:3f6:bffe:3c03 with SMTP id q16-20020a05622a04d000b003f6bffe3c03mr183350qtx.64.1685060794458;
        Thu, 25 May 2023 17:26:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685060794; cv=none;
        d=google.com; s=arc-20160816;
        b=SAHmcNFWCv31WbFYAvsgBBa2LabUWy7gadp0aJ/H8h7YGK5hw/RiAY4CJr5Ufh5jY5
         243nBps/SqF6VtMFEBUXHap+4pMjx0/GQG6Z+ZNwp1WPqLOzc5kNTPCUBeJkldidaYyH
         DQ6GIhYh1B8qbTd+iejVFmawpE4iMKaCguEr60T2+INzAwqtTQtQda+KTrIh+6DAdN0u
         eDYPsP9NomejZvLQdlaI9te3JKHw4cyQe0faC1RszoOnSKv9dxHmYn7ybCzUudpKtMP+
         gIzBQAaWAdGwwF7nxK5twojDu8UpctDN0h/8m35Xk8aiqvL5gdHK3syk8Qhsr4nexoDB
         qTLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=0AAV8qNIzM2y2qtbP5R8DqIlK8an3kV/cLXGaTOytOE=;
        b=DORiBH+djm+o2i6NGx1Aca+n+PCgtai8dF0fFErd0MF+VObg3PtRZcIl8GumNBwtJZ
         2UtTHmdbg8G71cpy21+UoFT63zbd9n2y/RUuwNmQMy6RlY0bxWjIc1kt4qpxr2s/yhI/
         HnUg0a4alMq2KaePkN5oBOMOQCFf5HguiSuQU3CqGt7mCjhH9eD2MrLIDA9FDCORFDUc
         e0WJbHwhhlOxdbg1ik47rhe29jp3CDZi7Etxmxz1wa25w2tMDOiSoxG+MMwOotTl/oib
         2VJmC88UJd61q7hpQxI6XhQFpv+wOHj8pvu2T/i+bqx1IWPeVYfd7Fi3YmdUjFqnZBDW
         E7Fg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Gd7lrdjm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k4-20020ac85fc4000000b003f6a6e9edc7si955704qta.54.2023.05.25.17.26.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 May 2023 17:26:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Gd7lrdjm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q2LFE-0002Zy-Kt; Thu, 25 May 2023 20:23:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q2LFC-0002Y7-M7
 for qemu-arm@nongnu.org; Thu, 25 May 2023 20:23:46 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q2LFA-0002A1-Sq
 for qemu-arm@nongnu.org; Thu, 25 May 2023 20:23:46 -0400
Received: by mail-pg1-x52e.google.com with SMTP id
 41be03b00d2f7-52c30fbccd4so150853a12.0
 for <qemu-arm@nongnu.org>; Thu, 25 May 2023 17:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685060621; x=1687652621;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0AAV8qNIzM2y2qtbP5R8DqIlK8an3kV/cLXGaTOytOE=;
 b=Gd7lrdjmRVyo9O2UCPi9Z71mChg/fJ/nbl4T/7Nc3D2v7gIjtDu9/LYxECJ4kGoCBm
 IaLnM7bWAItfvzykn2elY5de/1as3Qhi+YWDlM0PvuO5H4hTgiCglgm6i0WfvHnKRcqc
 AbfI0uj6RMyGbrAQHu+61DgSj94eKjC4FkxKj5RtV8oBc/NwsvJa+isHRCrBiYEPcSgC
 SOcDX6fZ/x/GI69EvofTrvhXJfmSlMhR8HKy2KtwJR6D28hcQHe3njdO0QG3eWDsTAMp
 +DAUgaiCbbn6YIFXciKJt/mXe1RyXNondZ/MOIRaRQqgJzyIaGo6JUplJW6eiP8YqXH9
 jzZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685060621; x=1687652621;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0AAV8qNIzM2y2qtbP5R8DqIlK8an3kV/cLXGaTOytOE=;
 b=JXInJkwVahS8eDjbJKyytWjD4RqOc6VVrWhgXOdeS8mc+4mNXW9vCCdpKsS2rofTSq
 OVDoS/k7nqfiBj8DW2DJitAzuxbFhHHI59WAojSD0Bh0KQ+kxsHxRllctFc3jLRSaUIe
 5uqnBxwyaggpPfxh8ii/0KfW+u4mGZNl03kGsKB+dsLEPyLuDw9mjE2WyQPkN30XunBt
 /UcevQ2SvRNO6uaFNMv9Pz8/YRCTnW9A0WXTaAMKt6C/8QQN7Z/Tjth9ddeICWyFYgsI
 fLOXV4NRMlsTxT6MMQ9SXPNiYbbX5TnLUIkh1KTP/oatXTqV3UWKZzj9gCpDpyMR0alJ
 7wXw==
X-Gm-Message-State: AC+VfDweJMAWC0qOiY8l38/Ov+Htxi8xJYm3xMqrNcYOrBAF5xtJoyLJ
 3+dxj1Sooo39pGnpReZQZNBPXw==
X-Received: by 2002:a05:6a20:728f:b0:10c:b9ed:6a38 with SMTP id
 o15-20020a056a20728f00b0010cb9ed6a38mr11531391pzk.28.1685060621323; 
 Thu, 25 May 2023 17:23:41 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:7ac5:31cc:3997:3a16])
 by smtp.gmail.com with ESMTPSA id
 s188-20020a635ec5000000b0053491d92b65sm1675593pgb.84.2023.05.25.17.23.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 May 2023 17:23:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 07/16] tcg/aarch64: Reserve TCG_REG_TMP1, TCG_REG_TMP2
Date: Thu, 25 May 2023 17:23:25 -0700
Message-Id: <20230526002334.1760495-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230526002334.1760495-1-richard.henderson@linaro.org>
References: <20230526002334.1760495-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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
X-TUID: b8doqX/O/IXw

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/aarch64/tcg-target.c.inc | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 8996e29ca9..5e7ac6fb76 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -40,11 +40,12 @@ static const int tcg_target_reg_alloc_order[] = {
 
     TCG_REG_X8, TCG_REG_X9, TCG_REG_X10, TCG_REG_X11,
     TCG_REG_X12, TCG_REG_X13, TCG_REG_X14, TCG_REG_X15,
-    TCG_REG_X16, TCG_REG_X17,
 
     TCG_REG_X0, TCG_REG_X1, TCG_REG_X2, TCG_REG_X3,
     TCG_REG_X4, TCG_REG_X5, TCG_REG_X6, TCG_REG_X7,
 
+    /* X16 reserved as temporary */
+    /* X17 reserved as temporary */
     /* X18 reserved by system */
     /* X19 reserved for AREG0 */
     /* X29 reserved as fp */
@@ -71,7 +72,9 @@ static TCGReg tcg_target_call_oarg_reg(TCGCallReturnKind kind, int slot)
     return TCG_REG_X0 + slot;
 }
 
-#define TCG_REG_TMP0 TCG_REG_X30
+#define TCG_REG_TMP0 TCG_REG_X16
+#define TCG_REG_TMP1 TCG_REG_X17
+#define TCG_REG_TMP2 TCG_REG_X30
 #define TCG_VEC_TMP0 TCG_REG_V31
 
 #ifndef CONFIG_SOFTMMU
@@ -2902,6 +2905,8 @@ static void tcg_target_init(TCGContext *s)
     tcg_regset_set_reg(s->reserved_regs, TCG_REG_FP);
     tcg_regset_set_reg(s->reserved_regs, TCG_REG_X18); /* platform register */
     tcg_regset_set_reg(s->reserved_regs, TCG_REG_TMP0);
+    tcg_regset_set_reg(s->reserved_regs, TCG_REG_TMP1);
+    tcg_regset_set_reg(s->reserved_regs, TCG_REG_TMP2);
     tcg_regset_set_reg(s->reserved_regs, TCG_VEC_TMP0);
 }
 
-- 
2.34.1

