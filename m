Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp1689877lfc;
        Fri, 28 Aug 2020 11:37:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyzR/VJiAjMYMXQ9i/Q8M6fY/UzhPHa/eXDmfZJJgS4XfIC9raoN+7gSSQwjMv0kru18tZi
X-Received: by 2002:a25:8250:: with SMTP id d16mr4379703ybn.402.1598639821816;
        Fri, 28 Aug 2020 11:37:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598639821; cv=none;
        d=google.com; s=arc-20160816;
        b=Byh0swFzOWqldiaGIjk6j4T+0P4J0PjnAcFz+MyRjvokO+toabcc5RQ2TXVQyxME/4
         gbzWqxDYK2W1h6Wh+Qw3KX65lQOXJCKAk/CG20Loq9yXX9cXsbjJP7KaWC9YxapzPsDo
         LAW0Mb9niaDKPYR7DWtoXCzXVS+SrgHhJKtMzfznhSMMktfjmy4C20izMqO77g79HT0d
         N4HwF6JzswQGmb6P1OaOp7F1T5TUXbejNX1WddjBU44Tfw4sCYqoLT7wV/RBTQkolHpn
         O2ICJABJMF4em9hlaX+Ma8k9N/atG+3LO+3Dkqrq3oN2r1L18dnswxDz0r8fVHnW6IYm
         guNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=lqdF8B5zR97t5g0010GIU4n/HI2zsZ2s/f6t9ofxj/o=;
        b=ino3oNBo75CjiHjhhkUWf7dp/xfj/CiBMJzC6x6XLIlsdXftRqtOQQUm3UzJYBOBxk
         OJSyB9X0C7SsnML9vnurpnU+0iInJSVfmEn0FNyp3bEn3vWJ96thrKGUmDaEpPIutzBm
         ThtEcLs+VWXhdNn/U1IY2HaX95vw+GXhVTBXjThL2f4wpWl0u44HtdBZLoOAnPAzviUr
         uCye9dMMz3YCnSzmPtzCh/VstWRvHZ2dXeOZLmtzRjvCX399UBqE44s840IRe1OIUI1s
         pe61gHqUiLBqv8hpl71EcjodEw9p9+T3ruaCd2Kgx4E8qitkRldJMWfsw5yG9G++WCU9
         yyLA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jtoUJuTm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 205si48629ybc.473.2020.08.28.11.37.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Aug 2020 11:37:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jtoUJuTm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kBjFF-0006VC-20
	for alex.bennee@linaro.org; Fri, 28 Aug 2020 14:37:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kBjCa-0002Al-9b
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 14:34:16 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:40388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kBjCS-0005w6-UQ
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 14:34:15 -0400
Received: by mail-wr1-x444.google.com with SMTP id b18so49929wrs.7
 for <qemu-arm@nongnu.org>; Fri, 28 Aug 2020 11:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=lqdF8B5zR97t5g0010GIU4n/HI2zsZ2s/f6t9ofxj/o=;
 b=jtoUJuTmdzW1O2siNF3Ks231BvUfS+1u7KvMQDyKHRJWscAKlOpEhzxoLLrue3xKnP
 ORiy96vAVJ1xYkxZYRCOA+uFmJZewUc7uIdSCRSF+mUZuunaidjGgD5o2jOWnQIl9p7r
 UVDsCGKPmLd+WQ9u96OMmZ5LxM71oegQtgKHQkgYOQqi45Gvo5K1kkdCvq4CfSojsO+R
 frYMccrFugLC/DPpolHLCraK1FsSad189B7SCG0GPgRb7sz+kdmc1JxvehraYhgBCMyx
 X3w2QoaDaDe59mLkkco9u0hC+Qr6mov0DvccfCaciR884B+5utJwz4wC9YMetGK2ZWvx
 RLCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lqdF8B5zR97t5g0010GIU4n/HI2zsZ2s/f6t9ofxj/o=;
 b=ZZtdoMfTaH5WAxqvEXgm9/tiUCzYr0U7OmWEmu2ApNqXSxCPCdpCBHxDhubBcJQVq1
 iHTrFCjW6PPIYnqEP30fXqumYs4YguW2yEi9ARpMIzcdGwW8Ick3LAVsSNwGmxkrdX2L
 B4jnbJGmt8ZE3z1ukJeohyE93VQ7yic5N2D9tUVl5F2g+hHaU3Zh7jk6knm1Uwc0WG4M
 vBk95tl+UnmnzwfBHYMjEUcZqjOPVB4DREqai78y+yKoEdukE28ZiswqCMjkdDHoZnky
 Il7Ux/LN7AxbiMk5C3y7s74/rlYh5rm/b60fQQSgCE1B3fxs+zokfFprT0KZrvxppbzO
 FR8Q==
X-Gm-Message-State: AOAM530x2fT/WUKMtLVQbcQ6Bp+dX0Yae9Se/G6FZJlTusru3f7/OgNl
 Daj8MwFa/bgi8QaP7ft11/N+5rQaOkVjeX/w
X-Received: by 2002:adf:c453:: with SMTP id a19mr269163wrg.179.1598639642979; 
 Fri, 28 Aug 2020 11:34:02 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id s20sm356251wmh.21.2020.08.28.11.34.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 11:34:02 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 05/45] target/arm: Macroify trans functions for VFMA, VFMS,
 VFNMA, VFNMS
Date: Fri, 28 Aug 2020 19:33:14 +0100
Message-Id: <20200828183354.27913-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200828183354.27913-1-peter.maydell@linaro.org>
References: <20200828183354.27913-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mlHSV9KBHsEt

Macroify creation of the trans functions for single and double
precision VFMA, VFMS, VFNMA, VFNMS. The repetition was OK for
two sizes, but we're about to add halfprec and it will get a bit
more than seems reasonable.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-vfp.c.inc | 50 +++++++++-------------------------
 1 file changed, 13 insertions(+), 37 deletions(-)

diff --git a/target/arm/translate-vfp.c.inc b/target/arm/translate-vfp.c.inc
index 15bb23688bd..9937fa569e4 100644
--- a/target/arm/translate-vfp.c.inc
+++ b/target/arm/translate-vfp.c.inc
@@ -1978,26 +1978,6 @@ static bool do_vfm_sp(DisasContext *s, arg_VFMA_sp *a, bool neg_n, bool neg_d)
     return true;
 }
 
-static bool trans_VFMA_sp(DisasContext *s, arg_VFMA_sp *a)
-{
-    return do_vfm_sp(s, a, false, false);
-}
-
-static bool trans_VFMS_sp(DisasContext *s, arg_VFMS_sp *a)
-{
-    return do_vfm_sp(s, a, true, false);
-}
-
-static bool trans_VFNMA_sp(DisasContext *s, arg_VFNMA_sp *a)
-{
-    return do_vfm_sp(s, a, false, true);
-}
-
-static bool trans_VFNMS_sp(DisasContext *s, arg_VFNMS_sp *a)
-{
-    return do_vfm_sp(s, a, true, true);
-}
-
 static bool do_vfm_dp(DisasContext *s, arg_VFMA_dp *a, bool neg_n, bool neg_d)
 {
     /*
@@ -2069,25 +2049,21 @@ static bool do_vfm_dp(DisasContext *s, arg_VFMA_dp *a, bool neg_n, bool neg_d)
     return true;
 }
 
-static bool trans_VFMA_dp(DisasContext *s, arg_VFMA_dp *a)
-{
-    return do_vfm_dp(s, a, false, false);
-}
+#define MAKE_ONE_VFM_TRANS_FN(INSN, PREC, NEGN, NEGD)                   \
+    static bool trans_##INSN##_##PREC(DisasContext *s,                  \
+                                      arg_##INSN##_##PREC *a)           \
+    {                                                                   \
+        return do_vfm_##PREC(s, a, NEGN, NEGD);                         \
+    }
 
-static bool trans_VFMS_dp(DisasContext *s, arg_VFMS_dp *a)
-{
-    return do_vfm_dp(s, a, true, false);
-}
+#define MAKE_VFM_TRANS_FNS(PREC) \
+    MAKE_ONE_VFM_TRANS_FN(VFMA, PREC, false, false) \
+    MAKE_ONE_VFM_TRANS_FN(VFMS, PREC, true, false) \
+    MAKE_ONE_VFM_TRANS_FN(VFNMA, PREC, false, true) \
+    MAKE_ONE_VFM_TRANS_FN(VFNMS, PREC, true, true)
 
-static bool trans_VFNMA_dp(DisasContext *s, arg_VFNMA_dp *a)
-{
-    return do_vfm_dp(s, a, false, true);
-}
-
-static bool trans_VFNMS_dp(DisasContext *s, arg_VFNMS_dp *a)
-{
-    return do_vfm_dp(s, a, true, true);
-}
+MAKE_VFM_TRANS_FNS(sp)
+MAKE_VFM_TRANS_FNS(dp)
 
 static bool trans_VMOV_imm_sp(DisasContext *s, arg_VMOV_imm_sp *a)
 {
-- 
2.20.1

