Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp502591lfo;
        Wed, 3 Feb 2021 11:33:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwP8Bz86EqLF3c9STZH5kclmq4GSmvlfF1Gddi+FrKHQaXKf+pM1r0wdhNW7Ainvlg8sEye
X-Received: by 2002:a25:e6c9:: with SMTP id d192mr6639082ybh.211.1612380831693;
        Wed, 03 Feb 2021 11:33:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612380831; cv=none;
        d=google.com; s=arc-20160816;
        b=lWHvzvq/ODkXUZX624WI97cXRJ85f9z41clTjbLTXFmVxMQSAmhorK0bMPFfjK+/oE
         Md+Gxwqp8CnUcaDiHDKrjiaJYPXDq+/lUXlzBnRLKktNlyixJgOHwcwEKH+USoaKwuTE
         VTU8ZxRu9KfnaztQzOpKrkbxASCoZDhoRAQ/yB4fcQ1tj2pB67TN5TdXxBdZKeMkrxIG
         96CrBN5GVd8ejmovNDQZBAjPFb8wo9uT64ee4CeD9lf8viKIN0zT/S2RATzc8X/o0iwr
         D/5236RZYrhQLzk9+4Z2/E08eZn02mVSHSni8Z6gJsSsGEHh6zdm+3Hn2YV9yS/WNaO9
         kTCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=SkjTW1pp/pIbKp346VjcRf6VolQKu6II4bAjUu2eCt8=;
        b=b1G//HWZFCeHKbNDbfnmM8MtmGvPGjNW0LN0d5nWLMDrsGZ97h/nvKWM6N33yVALbl
         ODDwn/aPcxuyqBzsxgGCjDFKmrnSJJ8pIWrbjWVqWcY1KH5V/Zh8gGt6DbwEokG5SWYZ
         LsKk2puU8E8PFQm0jhwrha3Fpkb1Y9+i6d3LUAa6cZrrSOV4eeaolCYPLWhn+pfVrBAJ
         AolZtneTOi+DjlsC722Mp0hvQbHNBXYb5H5+x6L0z96z13BLilZSFrYs+dk4xl5PKMkA
         z+cdGuCelgrWnZGdYaj3i+0k376UNGOQc/6xI0x4HB89s2ei6pkLyBfTtAJnWxL2IKDm
         s2jg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qFeHPRMx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q188si3351989ybc.262.2021.02.03.11.33.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Feb 2021 11:33:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qFeHPRMx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l7NuQ-0001Q7-Uj
	for alex.bennee@linaro.org; Wed, 03 Feb 2021 14:33:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7NOu-0007ZD-9S
 for qemu-arm@nongnu.org; Wed, 03 Feb 2021 14:01:16 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:54094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7NOf-0001nL-Qg
 for qemu-arm@nongnu.org; Wed, 03 Feb 2021 14:01:16 -0500
Received: by mail-pj1-x102a.google.com with SMTP id nm1so228289pjb.3
 for <qemu-arm@nongnu.org>; Wed, 03 Feb 2021 11:00:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SkjTW1pp/pIbKp346VjcRf6VolQKu6II4bAjUu2eCt8=;
 b=qFeHPRMxlcpT2KlB//VFyuTtcEgqAHIobWVCrMJdmQq2HDeTC617JLZ9l2vSzeoFCl
 w0A+cK8PSzQZ7ZLKtDyA5dC/4wiOE0ryyisIsANqPshC038nXqSJA6eIXPatWCRp0N3Q
 1qBVa5JzuxynuKAcQG7pKYXk7Q2VDFQt1HkdxCBlxpuQyPScd+3PTnN42Si8AiIHN+1Q
 9ZDnAfICvByJLxv0qLAwd7sprnM4ejiXkZC1eJD72LrhLOqjgV7avOWiV8xVQ5ENMqJC
 W1kxjiw7Rq/waknV8pF5tWpPugn+Vkp1V1q+JXQnftzAqOl7hKvPPtCEBOIN8BHKYZa5
 uryg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SkjTW1pp/pIbKp346VjcRf6VolQKu6II4bAjUu2eCt8=;
 b=KFhepU+VsMmMDetDvZN1cmPE61vWGNlXUwoTG9uGJzZzOxpWUUuHdgsRGH2EnhcxAP
 oh2tu5qhc/eki/sWidXgvdlPtHyCnHfgjf9WqIn6takaq743sc2mNmrYGHpHb0ZEqOpb
 YtzpX9D+5NbndwzTdzCCGVkioBvFQMjdkzpzTuSHcrXAERNzQQ580vihngPZRnY5emPN
 72lp03+DWsYYxIVkB7Y3QBJwL+Wngg7YiEQjrIcu/IAwlVIwkTNYWWv8TSdU20wEGzRT
 A0mkxbWhkmemDTW6OJTJFoLvUd6CYthQUcnwpZLYhD9gPWpFCK+gslediA4G74+AkvA9
 gosQ==
X-Gm-Message-State: AOAM532fSMeD3xMjDseMOqlCTKU0XdpJCm4XKpleBl9Wb1dPbe78YPhV
 LCm1YWnp+CNpMBGTpzHaiUDBVJX531dLRJry
X-Received: by 2002:a17:90b:350b:: with SMTP id
 ls11mr4405302pjb.166.1612378857424; 
 Wed, 03 Feb 2021 11:00:57 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id l2sm2906666pju.25.2021.02.03.11.00.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 11:00:56 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 21/31] target/arm: Improve gen_top_byte_ignore
Date: Wed,  3 Feb 2021 09:00:00 -1000
Message-Id: <20210203190010.759771-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210203190010.759771-1-richard.henderson@linaro.org>
References: <20210203190010.759771-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
X-TUID: rmAv2zTDaFng

Use simple arithmetic instead of a conditional
move when tbi0 != tbi1.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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

