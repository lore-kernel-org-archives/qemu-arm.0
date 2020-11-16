Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3835124lfb;
        Mon, 16 Nov 2020 08:14:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy5zZT/fv3RrvGJv3bqLnNWCSDFENV/4IIEPW9AF1bMfmzy2upvi6mSJiuyWA8v3qwxRuyW
X-Received: by 2002:a25:37cc:: with SMTP id e195mr25813192yba.441.1605543259078;
        Mon, 16 Nov 2020 08:14:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605543259; cv=none;
        d=google.com; s=arc-20160816;
        b=I5C7cLS1FZ1SJVMg4hetnjIqFm91M+3MCtrrdiwTxxClUlT8+WCMzIEk+hSPh7k3fY
         vIcmZ1D5R5fBSpRGSxaFeJNgYbCcn2vQIXoh93QQ37zKAJjiDOv4VykZGtrBwzEfVYzo
         XyQe1SHnPspJdoChWIMK99MnQkJXJCEKyF5e5v8GK6EL+9mL0BU0kJlzpGbAAB6gi1Y1
         wxb0SaDKZwIz1I3y3RTrJcTJS1+Ei6qewaw34ltZCpz90c3P4NnLPIRgGzbAzvz0OigJ
         CPqruz4W8T7ur10CvSWxqYXvm86lP0hpOvyNTuvjuA9n/XzhgONnKr7oPigr1ct7jw3U
         uj6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=oWhq3GtfKWqTzUPWOIICtNkc0+RZpcNcf71L6lZS9uI=;
        b=s9xNsP7CGn97vbOhDt2WguCc4COJGz8BDfJV0R5EOfFrH1vig6rLAqOH/+tTNuIOj4
         dcR4NrMwVIJ7ND2U+I7fpllUb/zq6AY+7cQurnQI0c6RwpVrqhKEhcIJl5G74PbVZava
         LqLw3igHBYAR3BdE6Z3iIA1b88b2dBESmUSUchs8093j7b1bk8u6FmYWqs2fJtbXfgeE
         32gwkDG90R2sn/17Gr4FYXue3zR/Hl6Klq02VTMwyICZZU/wGc8l4RUZvZBRNJdLzL5f
         M4shCEeAOZ9L29dA3SozfTuDAi2UmtPJRbMU57qniXDvebKzJljRRv40plvL1sQIFj5+
         FpDg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=COfaHfnl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c18si17814714ybs.130.2020.11.16.08.14.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Nov 2020 08:14:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=COfaHfnl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1keh90-0004iV-FE
	for alex.bennee@linaro.org; Mon, 16 Nov 2020 11:14:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1keh3g-00009A-TT
 for qemu-arm@nongnu.org; Mon, 16 Nov 2020 11:08:48 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:56072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1keh3d-0007ri-7E
 for qemu-arm@nongnu.org; Mon, 16 Nov 2020 11:08:48 -0500
Received: by mail-wm1-x343.google.com with SMTP id c9so24218537wml.5
 for <qemu-arm@nongnu.org>; Mon, 16 Nov 2020 08:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=oWhq3GtfKWqTzUPWOIICtNkc0+RZpcNcf71L6lZS9uI=;
 b=COfaHfnl8XMb6UY2VD03kaxrx5qfkq/h2AWwUX99JE9s5kVzMKHVYMpg8Zg7w3rFKk
 7iNmiHlMw+eXvj8P5WxwpG9hxyp9XTIkuH2PPF//rHI24W3J0CtJyhQ9GWEUlkiHQJSt
 WdLrTRcu5oTJyRTlT76fMPy6XUzWpX4A73OdIrOI7vVkpy/oY6DlIdh7xpdt62Gi0hWj
 +km/hbxsF3wbtci8A/q1AQ+CV7cx6dWzgg/ziUl32XDpOXDzcz4li3PrjkuIK3FpmhC1
 rt5U3mDSpwrjIb6WLSkcBnGRpKgldk8O2wFvqenlTdJjt8+u5fdnwgPCmZFPSmew/Hf9
 yb8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oWhq3GtfKWqTzUPWOIICtNkc0+RZpcNcf71L6lZS9uI=;
 b=adnfW+zs5+PeBNtx24cRrAgymMpLTxGhrrzM3f79CkU9yF/7zoeSGbK09bQsn2u2kJ
 Hxzi47A2cZVmosbRttIy/KNnhn5a4RAAb3jc3At9Guy4wW7wB1iJGPkSZhtvRJZpXsvL
 epbBav9DeK+hIkiJzT3o841hIvC8lahBzTkFYpxl1A9hzQfHdNsvQqN81KKQR+fKCGlX
 kx0OUjpdyv+t7/MFeJyiZWBtnIOnkTLIz8PPoBVmeCGKtlKNAcidJRVvWwtN43xcHbmi
 y8wT9G8cR1Q4WAfrsP7pM+U3DEQn6GZffU8QLXyYLAhtyKe/23JXJDAC7kazlQdGNl4d
 zcXA==
X-Gm-Message-State: AOAM5316xt0H9PJfvR4WsYOs/NaKhqFsyUAHuUrbSGnnLq45kh4GRTzg
 uE91JRX/mgGRp9lnAmrAUEyuSP8hx8go3w==
X-Received: by 2002:a1c:23cf:: with SMTP id j198mr16010519wmj.6.1605542923617; 
 Mon, 16 Nov 2020 08:08:43 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g20sm20116975wmh.20.2020.11.16.08.08.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 08:08:42 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 08/15] target/arm: Move general-use constant expanders up in
 translate.c
Date: Mon, 16 Nov 2020 16:08:24 +0000
Message-Id: <20201116160831.31000-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201116160831.31000-1-peter.maydell@linaro.org>
References: <20201116160831.31000-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iv57KmknT0n3

The constant-expander functions like negate, plus_2, etc, are
generally useful; move them up in translate.c so we can use them in
the VFP/Neon decoders as well as in the A32/T32/T16 decoders.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c | 46 +++++++++++++++++++++++-------------------
 1 file changed, 25 insertions(+), 21 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index ac8c118427f..3e5bcab0a62 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -109,6 +109,30 @@ static void arm_gen_condlabel(DisasContext *s)
     }
 }
 
+/*
+ * Constant expanders for the decoders.
+ */
+
+static int negate(DisasContext *s, int x)
+{
+    return -x;
+}
+
+static int plus_2(DisasContext *s, int x)
+{
+    return x + 2;
+}
+
+static int times_2(DisasContext *s, int x)
+{
+    return x * 2;
+}
+
+static int times_4(DisasContext *s, int x)
+{
+    return x * 4;
+}
+
 /* Flags for the disas_set_da_iss info argument:
  * lower bits hold the Rt register number, higher bits are flags.
  */
@@ -5174,29 +5198,9 @@ static void arm_skip_unless(DisasContext *s, uint32_t cond)
 
 
 /*
- * Constant expanders for the decoders.
+ * Constant expanders used by T16/T32 decode
  */
 
-static int negate(DisasContext *s, int x)
-{
-    return -x;
-}
-
-static int plus_2(DisasContext *s, int x)
-{
-    return x + 2;
-}
-
-static int times_2(DisasContext *s, int x)
-{
-    return x * 2;
-}
-
-static int times_4(DisasContext *s, int x)
-{
-    return x * 4;
-}
-
 /* Return only the rotation part of T32ExpandImm.  */
 static int t32_expandimm_rot(DisasContext *s, int x)
 {
-- 
2.20.1

