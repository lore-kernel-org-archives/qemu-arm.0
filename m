Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2891562lft;
        Mon, 27 Jun 2022 21:42:46 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vRGY0xHVxcDUDLq85zDfRP/4RxkBxO9PTkcZHZn6qEK4SNdmXXmG0Vq7kJVJp6FZjFlfyB
X-Received: by 2002:a37:9e44:0:b0:6ae:ea2e:4a5b with SMTP id h65-20020a379e44000000b006aeea2e4a5bmr10779801qke.739.1656391366342;
        Mon, 27 Jun 2022 21:42:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656391366; cv=none;
        d=google.com; s=arc-20160816;
        b=fDv2Kyl9FkAFQzQsXrRhLV6apVPvk9EVlC4IYLdTIYTqPkFpIPTVO93hkSM0oYWYeb
         tI67odU1Qu8scE5i5MfBZjkUoUIXwUxUxkuLT5u1v6cRYXWtx3X/ZppUHWFRHEdR/duQ
         rmzqXt5OgLiBbJSRz5TI4UK43pvrcSzIC5xia1lSVVuAji0InkJp6O6YPiaJgHVWVOge
         on/eZaeX3e3rgbrd0wDvJko5iWMV4aX6RleHLfeMafPfFlE5eGmmNfk+ctVCN8iRMG3Z
         PwZsOib7DOVyOGdUaIgQ8mDyBfpJHmMEb9zYsix8LThTkmQKKYJE5QowK6Lf+TwtfQjL
         VtsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=bb+2dMpalHOyt59eNEFEmGtiWYzqBzkHlaHMi62ekZ0=;
        b=sQz1kszfILTtdFcm6ol53wdvLpiuBkk1H3z/LXoZIpvD+IMNujwJLipdC+aTC3y8Ip
         RqC8b5BFp0fbAFzXkU4gZ/paT1g39JrsxqkRy/oC4CQyVAZuaQQ8QTU3LV8cmTy0rg4b
         rGqygS1klEVQXUbf6FKFslN/84blIWltuyHxCK+/sCsAMTykqg6DQjIL0vjF8OOSIUC6
         vm1r9NfP03clj/i2CxEX8wTQlIrO/iB3BtB/qQMD+HMaqpnoeB4yU82d1k3AS0MYQJ/W
         gS92X5o1C6QYp9VzeLOi5hyx0Hqk1hO3vHeltLr5xJvSyuVpHIrsSXsOSzZ2nEaV9/T+
         OS/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p1NewcHO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ge14-20020a05621427ce00b00470620d96cbsi6682975qvb.151.2022.06.27.21.42.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jun 2022 21:42:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p1NewcHO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o633l-00070o-J7
	for alex.bennee@linaro.org; Tue, 28 Jun 2022 00:42:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62jY-0001fk-RY
 for qemu-arm@nongnu.org; Tue, 28 Jun 2022 00:21:52 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:33375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o62jW-0003eG-La
 for qemu-arm@nongnu.org; Tue, 28 Jun 2022 00:21:52 -0400
Received: by mail-pl1-x636.google.com with SMTP id n10so10025066plp.0
 for <qemu-arm@nongnu.org>; Mon, 27 Jun 2022 21:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bb+2dMpalHOyt59eNEFEmGtiWYzqBzkHlaHMi62ekZ0=;
 b=p1NewcHOgtlm/r5U6mlZ/izOW7DbqNS9H0S6Bxg6QlRtmzSDoLMAQWAAABWEowMIfR
 n/TU1ytbPpC5o1Nk+OIfhjDLAuOCZ3G4PVVJqaw8RFyfip+gRn2IlOa7Dint62sIWIrA
 ApBnP+K5d+JLrYogivVsjprbw2u9RxTSndm0X+EGJLABZScwv0aewopRHVTpxNVcEf1f
 6aCNIeYZ9aiHaJCXX4eJuUaynW3xKdVYLpl7rbdBmnE/PwPFqQFloFGgBda5wpH6iolp
 Y4QveIl7iXjD0elvtmEHyexqqf3ZiXOfDAR3lj3tgIGxJ32otM45rKJs8SuvdDH8GRTR
 Lz/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bb+2dMpalHOyt59eNEFEmGtiWYzqBzkHlaHMi62ekZ0=;
 b=gbIVwGr0nfuRGkJXVGaOUmqKjK0Ag7yBiQicoFMFyGUSoPGrdEQUE61OTpz0P9uAQ5
 nyGBCfwm8BEtQbwjKUIu0rqoTLWAtFmXblffrjBgoMK3P/Bz5MQOwOFX832lSXGO8Ujq
 fmGn8mI1MijMyAORKWuFGukrjVbhG7eTNHU18LfRHwdWPLQqv8ccVYZxyisWO25rbZgh
 D6kMBIEd6jw5xO2v1OxVKSNjLuKjarJAUu6TK8+FO4Y/rHgO4e3M4Ld/KvAtXr7Z4Iiw
 c+L+7yEYog8pN6uLQAh0HxDNChS6Ny226wj3MJ6j1yQ+hwdQAlAT1Pe4/57sQmmnhKA8
 gMZg==
X-Gm-Message-State: AJIora9b2Jx5+BZRhvWqs4XrbX0kjMzed42ymwMoTS6/EWxPc6BU8F3Q
 +Jq98QcH+qxi5dqqU/qsFzIijA==
X-Received: by 2002:a17:903:2281:b0:16a:6604:d1d8 with SMTP id
 b1-20020a170903228100b0016a6604d1d8mr1654916plh.78.1656390109639; 
 Mon, 27 Jun 2022 21:21:49 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 jg6-20020a17090326c600b0016a087cfad8sm7994929plb.264.2022.06.27.21.21.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:21:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 12/45] target/arm: Mark gather prefetch as non-streaming
Date: Tue, 28 Jun 2022 09:50:44 +0530
Message-Id: <20220628042117.368549-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628042117.368549-1-richard.henderson@linaro.org>
References: <20220628042117.368549-1-richard.henderson@linaro.org>
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8XkPhH+PTMdz

Mark these as a non-streaming instructions, which should trap if full
a64 support is not enabled in streaming mode.  In this case, introduce
PRF_ns (prefetch non-streaming) to handle the checks.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sme-fa64.decode |  3 ---
 target/arm/sve.decode      | 10 +++++-----
 target/arm/translate-sve.c | 11 +++++++++++
 3 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/target/arm/sme-fa64.decode b/target/arm/sme-fa64.decode
index 711636ed30..bc41aa2e2a 100644
--- a/target/arm/sme-fa64.decode
+++ b/target/arm/sme-fa64.decode
@@ -58,10 +58,7 @@ FAIL    1100 1110 ---- ---- ---- ---- ---- ----   # Advanced SIMD cryptography e
 #       --11 1100 --1- ---- ---- ---- ---- --10   # Load/store FP register (register offset)
 #       --11 1101 ---- ---- ---- ---- ---- ----   # Load/store FP register (scaled imm)
 
-FAIL    1000 010- -00- ---- 111- ---- ---- ----   # SVE 32-bit gather prefetch (vector+imm)
-FAIL    1000 0100 0-1- ---- 0--- ---- ---- ----   # SVE 32-bit gather prefetch (scalar+vector)
 FAIL    1010 010- ---- ---- 011- ---- ---- ----   # SVE contiguous FF load (scalar+scalar)
 FAIL    1010 010- ---1 ---- 101- ---- ---- ----   # SVE contiguous NF load (scalar+imm)
 FAIL    1010 010- -10- ---- 000- ---- ---- ----   # SVE load & replicate 32 bytes (scalar+scalar)
 FAIL    1010 010- -100 ---- 001- ---- ---- ----   # SVE load & replicate 32 bytes (scalar+imm)
-FAIL    1100 010- ---- ---- ---- ---- ---- ----   # SVE 64-bit gather load/prefetch
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index a54feb2f61..908643d7d9 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1183,10 +1183,10 @@ LD1RO_zpri      1010010 .. 01 0.... 001 ... ..... ..... \
                 @rpri_load_msz nreg=0
 
 # SVE 32-bit gather prefetch (scalar plus 32-bit scaled offsets)
-PRF             1000010 00 -1 ----- 0-- --- ----- 0 ----
+PRF_ns          1000010 00 -1 ----- 0-- --- ----- 0 ----
 
 # SVE 32-bit gather prefetch (vector plus immediate)
-PRF             1000010 -- 00 ----- 111 --- ----- 0 ----
+PRF_ns          1000010 -- 00 ----- 111 --- ----- 0 ----
 
 # SVE contiguous prefetch (scalar plus immediate)
 PRF             1000010 11 1- ----- 0-- --- ----- 0 ----
@@ -1223,13 +1223,13 @@ LD1_zpiz        1100010 .. 01 ..... 1.. ... ..... ..... \
                 @rpri_g_load esz=3
 
 # SVE 64-bit gather prefetch (scalar plus 64-bit scaled offsets)
-PRF             1100010 00 11 ----- 1-- --- ----- 0 ----
+PRF_ns          1100010 00 11 ----- 1-- --- ----- 0 ----
 
 # SVE 64-bit gather prefetch (scalar plus unpacked 32-bit scaled offsets)
-PRF             1100010 00 -1 ----- 0-- --- ----- 0 ----
+PRF_ns          1100010 00 -1 ----- 0-- --- ----- 0 ----
 
 # SVE 64-bit gather prefetch (vector plus immediate)
-PRF             1100010 -- 00 ----- 111 --- ----- 0 ----
+PRF_ns          1100010 -- 00 ----- 111 --- ----- 0 ----
 
 ### SVE Memory Store Group
 
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index a50b2f485b..9c58902b6e 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -5971,6 +5971,17 @@ static bool trans_PRF_rr(DisasContext *s, arg_PRF_rr *a)
     return true;
 }
 
+static bool trans_PRF_ns(DisasContext *s, arg_PRF_ns *a)
+{
+    if (!dc_isar_feature(aa64_sve, s)) {
+        return false;
+    }
+    /* Prefetch is a nop within QEMU.  */
+    s->is_nonstreaming = true;
+    (void)sve_access_check(s);
+    return true;
+}
+
 /*
  * Move Prefix
  *
-- 
2.34.1

