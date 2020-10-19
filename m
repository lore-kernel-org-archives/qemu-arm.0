Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp3957148lfa;
        Mon, 19 Oct 2020 08:13:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy3HOJPuIcayCn67JxG6YEjq81hwxWVxWnyXXA9Igex+lGl+6bxVSZ/zYhXGd4Uo1X71J11
X-Received: by 2002:a25:dc3:: with SMTP id 186mr162981ybn.207.1603120419018;
        Mon, 19 Oct 2020 08:13:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603120419; cv=none;
        d=google.com; s=arc-20160816;
        b=ZEwkRWr0BGi+FgxfyylBGFAb/QzffN4kXB0z61dwt+dk+cs4Kkfo7WwqrtxC5o1OQj
         PePwBZLRWxAD18srNK+eWXRq8DQ2nFMpmNGYxkdE7Xg5hNPd43mzqTqY1A2unS8TWzYo
         IFth0NMZwkqhcvLZMjpL4ra4/s/YcnbN6Djg773RyjKs9FOKEDcsqgG9q5LC5fHeGKHn
         K5NOMOkQqHoMODHffy4YL9eU5aPbmYIXLvGu8ECy8ZbLQsb2L57Eyp5XiAZt8BU/wgeK
         aaNl6LHnVFFGtj27iiEuSoWGuiE2IOC5N/FXAyzqfKvyYcI1NXlJZtkGCa/IpMgEjY2/
         s5ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=73sxXQONcqBgzHuOsaIz5hu+3BY6+pw52N6WyKkQfZo=;
        b=Ebz/3ngYI7OhfNy3+s7f0qjWvFvipqzL6Ii99wORZXToJhNu52wJTksiCI1VANO3TG
         tjGmFse3Nqjcw+ayn3Q2N8tIEnMNAx2ccs2ZMksmvL/nyvDecNXyEbBMLmgEEtXTQGPv
         ATDwXutgQekWh0ufoAaBNdrCgAEYKlJuLLxv441nn/0eVObutK91VQ00fGptUwbSvV+r
         Ze1ZcriQbvC5aqvJyioS4517fAYtFbAzsPtnWvOHkSZQ7yZ+f1SJ1L6C3JJ05RvrFY3X
         CEhRVJZB1095ThytJ8JV0MLnhIRJttceTIOr9uAlV5GTHminTiYGeAJ7FJbl8KYw/xB9
         0pIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dV3shNVI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c81si251589ybb.5.2020.10.19.08.13.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Oct 2020 08:13:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dV3shNVI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kUWqw-0007MA-8s
	for alex.bennee@linaro.org; Mon, 19 Oct 2020 11:13:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kUWqW-0006p8-1B
 for qemu-arm@nongnu.org; Mon, 19 Oct 2020 11:13:12 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:52579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kUWqS-0002jt-A1
 for qemu-arm@nongnu.org; Mon, 19 Oct 2020 11:13:10 -0400
Received: by mail-wm1-x344.google.com with SMTP id e23so186120wme.2
 for <qemu-arm@nongnu.org>; Mon, 19 Oct 2020 08:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=73sxXQONcqBgzHuOsaIz5hu+3BY6+pw52N6WyKkQfZo=;
 b=dV3shNVINT2JmGcZ1DoEKBgo9PJ/JaVd55gCmwwFC+lFWWGb5+ZfGSXWV1xK7BZ51u
 L0Ex2krQo7iSxfdR3rQXSxjyDOTNeUkbNLl9pG1q9dFLZfq0pjkp72KhS6jz9iSPcEBb
 0b6nmnkTpBcHB8J88cjm9Wkyd3nCWJVsx6lNXwIquyKQBmPABGm3G6TFmI/QGcDR1MtC
 7pnu2LFP0/EM5TXjMbC8VwUsGN2M/UppNjSZjA3dKTfKfb8ygrHZRm0NiaMmXtZLxZsg
 woeGbEsar7EW9nfvQbZOjMVW3v7f13CXcjkQ9W197stScAkYeju/zHkd7jbsKkGYguSq
 DIsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=73sxXQONcqBgzHuOsaIz5hu+3BY6+pw52N6WyKkQfZo=;
 b=rhswY5/qGVz4pLL5XZZMrxAjtH2zZja9JUXFPWDj1W9CpKNisWOSMRU0E1iYhgs/WQ
 KekCivxYZOWz6Sf1IKSDmzoi0Q8CGQmhN5JoJHThcAJn1G/pXFcLNTCtMt6OAbXLchs/
 KWYQpTiYLmGxtn+yQx/jlpP1xsQW49Q4sao9e1eYSDz9dsr2dwKSTiks0zKCcg2MzZl0
 tul8qo622c67w8aMVfXIscKktBxgc+TGMY4dKSJqOFGGCeIflXmKNuN/a+/CaEEwf/0c
 D4khgcjak8xPX7yJDCKtvAKCCGpKKyHyVA7UKdz+MkKWyFGygcMlB4/Fo2oNmzjoZc2j
 yCxg==
X-Gm-Message-State: AOAM532WyNXASpDofZ+D1AjcACrybQ7wT9VkuPszfHOTGipkJCuoOPg9
 tJk97r4mdILe3bHajkZq/WVIO9CBoexReQ==
X-Received: by 2002:a1c:3c4:: with SMTP id 187mr44004wmd.14.1603120386263;
 Mon, 19 Oct 2020 08:13:06 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y14sm309918wma.48.2020.10.19.08.13.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 08:13:05 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 02/10] target/arm: Implement v8.1M NOCP handling
Date: Mon, 19 Oct 2020 16:12:53 +0100
Message-Id: <20201019151301.2046-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201019151301.2046-1-peter.maydell@linaro.org>
References: <20201019151301.2046-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x344.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jywxxdc56Szh

From v8.1M, disabled-coprocessor handling changes slightly:
 * coprocessors 8, 9, 14 and 15 are also governed by the
   cp10 enable bit, like cp11
 * an extra range of instruction patterns is considered
   to be inside the coprocessor space

We previously marked these up with TODO comments; implement the
correct behaviour.

Unfortunately there is no ID register field which indicates this
behaviour.  We could in theory test an unrelated ID register which
indicates guaranteed-to-be-in-v8.1M behaviour like ID_ISAR0.CmpBranch
>= 3 (low-overhead-loops), but it seems better to simply define a new
ARM_FEATURE_V8_1M feature flag and use it for this and other
new-in-v8.1M behaviour that isn't identifiable from the ID registers.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h               |  1 +
 target/arm/m-nocp.decode       | 10 ++++++----
 target/arm/translate-vfp.c.inc | 17 +++++++++++++++--
 3 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index cfff1b5c8fe..74392fa0295 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1985,6 +1985,7 @@ enum arm_features {
     ARM_FEATURE_VBAR, /* has cp15 VBAR */
     ARM_FEATURE_M_SECURITY, /* M profile Security Extension */
     ARM_FEATURE_M_MAIN, /* M profile Main Extension */
+    ARM_FEATURE_V8_1M, /* M profile extras only in v8.1M and later */
 };
 
 static inline int arm_feature(CPUARMState *env, int feature)
diff --git a/target/arm/m-nocp.decode b/target/arm/m-nocp.decode
index 7182d7d1217..28c8ac6b94c 100644
--- a/target/arm/m-nocp.decode
+++ b/target/arm/m-nocp.decode
@@ -29,14 +29,16 @@
 # If the coprocessor is not present or disabled then we will generate
 # the NOCP exception; otherwise we let the insn through to the main decode.
 
+&nocp cp
+
 {
   # Special cases which do not take an early NOCP: VLLDM and VLSTM
   VLLDM_VLSTM  1110 1100 001 l:1 rn:4 0000 1010 0000 0000
   # TODO: VSCCLRM (new in v8.1M) is similar:
   #VSCCLRM      1110 1100 1-01 1111 ---- 1011 ---- ---0
 
-  NOCP         111- 1110 ---- ---- ---- cp:4 ---- ----
-  NOCP         111- 110- ---- ---- ---- cp:4 ---- ----
-  # TODO: From v8.1M onwards we will also want this range to NOCP
-  #NOCP_8_1     111- 1111 ---- ---- ---- ---- ---- ---- cp=10
+  NOCP         111- 1110 ---- ---- ---- cp:4 ---- ---- &nocp
+  NOCP         111- 110- ---- ---- ---- cp:4 ---- ---- &nocp
+  # From v8.1M onwards this range will also NOCP:
+  NOCP_8_1     111- 1111 ---- ---- ---- ---- ---- ---- &nocp cp=10
 }
diff --git a/target/arm/translate-vfp.c.inc b/target/arm/translate-vfp.c.inc
index 28e0dba5f14..cc9ffb95887 100644
--- a/target/arm/translate-vfp.c.inc
+++ b/target/arm/translate-vfp.c.inc
@@ -3459,7 +3459,7 @@ static bool trans_VLLDM_VLSTM(DisasContext *s, arg_VLLDM_VLSTM *a)
     return true;
 }
 
-static bool trans_NOCP(DisasContext *s, arg_NOCP *a)
+static bool trans_NOCP(DisasContext *s, arg_nocp *a)
 {
     /*
      * Handle M-profile early check for disabled coprocessor:
@@ -3472,7 +3472,11 @@ static bool trans_NOCP(DisasContext *s, arg_NOCP *a)
     if (a->cp == 11) {
         a->cp = 10;
     }
-    /* TODO: in v8.1M cp 8, 9, 14, 15 also are governed by the cp10 enable */
+    if (arm_dc_feature(s, ARM_FEATURE_V8_1M) &&
+        (a->cp == 8 || a->cp == 9 || a->cp == 14 || a->cp == 15)) {
+        /* in v8.1M cp 8, 9, 14, 15 also are governed by the cp10 enable */
+        a->cp = 10;
+    }
 
     if (a->cp != 10) {
         gen_exception_insn(s, s->pc_curr, EXCP_NOCP,
@@ -3489,6 +3493,15 @@ static bool trans_NOCP(DisasContext *s, arg_NOCP *a)
     return false;
 }
 
+static bool trans_NOCP_8_1(DisasContext *s, arg_nocp *a)
+{
+    /* This range needs a coprocessor check for v8.1M and later only */
+    if (!arm_dc_feature(s, ARM_FEATURE_V8_1M)) {
+        return false;
+    }
+    return trans_NOCP(s, a);
+}
+
 static bool trans_VINS(DisasContext *s, arg_VINS *a)
 {
     TCGv_i32 rd, rm;
-- 
2.20.1

