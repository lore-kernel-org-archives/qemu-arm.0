Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp626845lfo;
        Thu, 28 Jan 2021 14:54:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz/6TyhUnr6d63qaVXxrwkSn8MKmqh1VMpHRa7PiE9UNZ6Lhj5z3cCciGFqDy6UT+fknRuP
X-Received: by 2002:a25:da47:: with SMTP id n68mr1995019ybf.75.1611874456056;
        Thu, 28 Jan 2021 14:54:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611874456; cv=none;
        d=google.com; s=arc-20160816;
        b=XB0z60ua2livxeBYsMnnsqIMiWOV3Qsheob2HajvkTfLHHwnocDVoiuywEf8MBSer1
         XvjBRfoFYZl32C0PP6p4atolxL4uGzO+h8DA4sr65XpP1HD2F1NGBUdZi0Yx4hpD0nw5
         0kgwdPGU4NLMTQYeyV/77xyDRpSUte/54pWhtMi/bGZOXiWg4fO0gIEud/GM2cABm16P
         g60UM+rU7RiS04och25JjIUkkxkMMedF5WEUinZunWmGIgMuEhXT8SrGEoqfB6evTddj
         BctAunObVot9R7eGt56MyqnC+TfMp6tTcnkjnYgVwSuM9xNwCNtsIiPs/UpaCJzm4ebs
         PzEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=3ZJGnXzF/NMDb1ycGSuuM5DTXpfVPEQ3f0lC4BF0AxI=;
        b=sejSN2PV6d4APVPTRMEjWYHXfY6OVDVB2872eZ3esYBSUWWrXfVw36DuGqHXc5D+4k
         gyF6OWGagJP6ZzedAdlLwl0hX2dkEJ7xIxaw3anzIi+GtGk9gRugAE5HprL1l/ukQggO
         Xxx/Brhh3dZQth4o5EsEIWdod9ty3BK8zMXL9FNuWPd7AgwV/SonidtlhCBH+oovmrW1
         PjUxAm3mqkCisjmwbk8lUnSgS9OLFKl5QoAyxSDBadcXyLi6QS41tIdwDJC/yOYbzvrg
         B6TDMOtYbxBLqJaYR6iJMQ9Aff/MNsVknRA/NgvbqZTM5qss9Ks8NZ3ZSbi0qdXZIhwR
         MjKg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pbRkK3Ia;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d66si7919101ybi.187.2021.01.28.14.54.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Jan 2021 14:54:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pbRkK3Ia;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l5GB5-0001AA-Ds
	for alex.bennee@linaro.org; Thu, 28 Jan 2021 17:54:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5FzY-0005cc-CT
 for qemu-arm@nongnu.org; Thu, 28 Jan 2021 17:42:24 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:43019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5FzM-0008A9-17
 for qemu-arm@nongnu.org; Thu, 28 Jan 2021 17:42:20 -0500
Received: by mail-pg1-x532.google.com with SMTP id n10so5269306pgl.10
 for <qemu-arm@nongnu.org>; Thu, 28 Jan 2021 14:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3ZJGnXzF/NMDb1ycGSuuM5DTXpfVPEQ3f0lC4BF0AxI=;
 b=pbRkK3IaVOuCPYjmdn+qbJWZnZgI2Vlttcs3pu6ylmrf1y/64VpXi4t4gaEQM24GvZ
 UdMXOjgPcTYCt+LFPBIJ/4yrufITKEwp0RGkyumSrwa/YFiua2QBX/oEnd7c81LyvdWv
 W2Z8weYXAGOtMABscklC8UtbqUXw2EzANfMpKkcMtgwJS4CkstXyt0cThA9fEXnRVFWw
 BdMrz3EmnXIKlccxWr4/PxU+dcp5gYWfYzAI16D5WDpe5tRhhwNMZn/Tx3F9aBc0c0ls
 QEWFLldga2q4QtMkVVL29PB799q0io14N86sLuffUu20kvkN0yI4Cool7DzVvB0Pu9EL
 7Krw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3ZJGnXzF/NMDb1ycGSuuM5DTXpfVPEQ3f0lC4BF0AxI=;
 b=guzI6fbXCt0v5C4fPTj11EsdCE1PIojwUu0+coW/aaU+pfXKksNm7SAqZ9ZioOBghd
 imudb6XC9b/Yfg6HB5Tr5x4z9pa+Q7mZosX7G287n6vHepdgenX85Oee9vfZ/W1quyx2
 aQtKuZWyV9Xwpz9qsirzX3xHezaIRm5qIumPxgDbAFQCwc1cnJufWP9JcCGrcoBIYfqf
 GsmO3McMSZL5Fs9IKh/DPA0SrGqM97241C1l2m/gqdnfjfg6puNE134bHdxYCWmcglPf
 815SBfN9PhMMFTspbzLJBlHUVJPBSCtZL+aQ4H8cr0iflWWuFfKNPaU6ab60aOEEwt9C
 oltg==
X-Gm-Message-State: AOAM532fUOSsYZF2DSxLzMjTyqkTmMr11hLrjVd8duNTTGWghCLU/vKR
 mQV96n55cVO3rrC/Juc2G0WIlQ==
X-Received: by 2002:a63:1865:: with SMTP id 37mr1595347pgy.206.1611873726197; 
 Thu, 28 Jan 2021 14:42:06 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id m10sm6042358pjs.25.2021.01.28.14.42.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 14:42:05 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 13/23] target/arm: Improve gen_top_byte_ignore
Date: Thu, 28 Jan 2021 12:41:31 -1000
Message-Id: <20210128224141.638790-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210128224141.638790-1-richard.henderson@linaro.org>
References: <20210128224141.638790-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: b+ywb9BYqwO5

Use simple arithmetic instead of a conditional
move when tbi0 != tbi1.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index ffc060e5d7..3ec0dc17d8 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -183,17 +183,20 @@ static void gen_top_byte_ignore(DisasContext *s, TCGv_i64 dst,
         /* Sign-extend from bit 55.  */
         tcg_gen_sextract_i64(dst, src, 0, 56);
 
-        if (tbi != 3) {
-            TCGv_i64 tcg_zero = tcg_const_i64(0);
-
-            /*
-             * The two TBI bits differ.
-             * If tbi0, then !tbi1: only use the extension if positive.
-             * if !tbi0, then tbi1: only use the extension if negative.
-             */
-            tcg_gen_movcond_i64(tbi == 1 ? TCG_COND_GE : TCG_COND_LT,
-                                dst, dst, tcg_zero, dst, src);
-            tcg_temp_free_i64(tcg_zero);
+        switch (tbi) {
+        case 1:
+            /* tbi0 but !tbi1: only use the extension if positive */
+            tcg_gen_and_i64(dst, dst, src);
+            break;
+        case 2:
+            /* !tbi0 but tbi1: only use the extension if negative */
+            tcg_gen_or_i64(dst, dst, src);
+            break;
+        case 3:
+            /* tbi0 and tbi1: always use the extension */
+            break;
+        default:
+            g_assert_not_reached();
         }
     }
 }
-- 
2.25.1

