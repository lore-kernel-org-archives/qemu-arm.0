Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp1173570ejb;
        Fri, 2 Jun 2023 07:22:34 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7iRqMEZEO0dbE8xLyLgeO5ktzh/RLQJAG/yDYZL34G9BhX6qWaeHf67RIE67MaHITsGaKk
X-Received: by 2002:a05:6214:29e2:b0:628:6879:ee48 with SMTP id jv2-20020a05621429e200b006286879ee48mr3913342qvb.50.1685715753914;
        Fri, 02 Jun 2023 07:22:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685715753; cv=none;
        d=google.com; s=arc-20160816;
        b=McismffeE0CoThppfQun/3yLyIwz9bBj4dynIsMhZzPDvtjgPzr/+euxW7M87qZ1e6
         eaSC5gmGBfaRvYNW4et2uOzPku+HsHY7lbat+FxmXekkVKdVqYEjwlZ3p+SqR5uwp1yV
         RYkD1Z3M0i5Y4y8rJQj+qB8rgos5+OrX7zu8adFIpElSoOsdwRIinzqDGWcwZan97Gkm
         j9CbqbBYR5RYHETE/JOHPtiW9Pv6fQQ8iQM7MaXPAC8Njd1dIIMNBcXmxIUESjtxGGAd
         tJh+K9rhnU928ftRn+wPlGV6KppS5TTgiAe5fgVrWHmv14DGgcVHXg+rEW/wU0iJ9w0q
         lJeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=T5r/LpHJMg7TbmN47HlK1bNQm+yT4WVmfzXQIP2d3t4=;
        b=fh58QK5h0jhTrF/4ZLvxR2jrpS2JmQPLoY+Th+8BNs6F9byqkIFkVR8LjajED0+/Sz
         YbafGXel0vYUGffEXQOeeoQ4cRHOnYMwP5knkXM05yZmHglWVJQfhLeb0gOZ2f5IVg+Z
         FCx7WFO31icVli87OXXvWa4unJ6wNdU/1zSQrBSG2WxxOBDz6VjhH5/MdhSp/Wckh3rQ
         rBWsxhiH3NhHJldSMTlQFWCQK89x+q+nNOXpS/dBb3QhbFwSznxiFNZOJ2lzj/f2dgrL
         Ey+8qDGMnR+/3Du8er+8vdDkvGZPDVHcFMDZDkz2mg/Mzq6u2XGG3SAIAm5gi0jd7DQr
         CIHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rH3c9poL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bp6-20020a05622a1b8600b003ef3704f5dasi872681qtb.463.2023.06.02.07.22.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Jun 2023 07:22:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rH3c9poL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q55fd-0007Z0-Ts; Fri, 02 Jun 2023 10:22:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q55fc-0007Ya-BO
 for qemu-arm@nongnu.org; Fri, 02 Jun 2023 10:22:24 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q55fa-0001Xo-Ke
 for qemu-arm@nongnu.org; Fri, 02 Jun 2023 10:22:24 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-30af159b433so2092485f8f.3
 for <qemu-arm@nongnu.org>; Fri, 02 Jun 2023 07:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685715740; x=1688307740;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=T5r/LpHJMg7TbmN47HlK1bNQm+yT4WVmfzXQIP2d3t4=;
 b=rH3c9poL6+VxRMz0zrH9MEbijYE5irYGZvtD3v4zY/cAltbltJBSXGBB2D0sxSFMnf
 z9chXOb1GuN6KS+RGGQ+KHUBVv8BoYX9kUN9uZZXF+5yFbTF7y50QQAjopiahMJoExgz
 fE2uTl9hso99Qnv0DuSH6y06bVolrIL91XJ/AgE87cWsiHMZO/UbSrhvyjNdXfpeR+PK
 T8qgbASecb3vk3ipQgUh0VuW9eN61MkM0JJfuAYqBE+X8RBnIqtFvrxi6JUCl30MVlDE
 KD060NWpl74bmVBzDHuJtYmv6Yvb0t6hzLEOLE5HWpARL4sKw299ezM1DNUOlJ34LsLJ
 sr5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685715740; x=1688307740;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=T5r/LpHJMg7TbmN47HlK1bNQm+yT4WVmfzXQIP2d3t4=;
 b=UfBteVK5eUk0ySSNAlmwAzZ03TiVzJ0nPkTckCcGtJC/kfBt6JkwPy1r4mneuIR+FS
 c8+0xqpUfLDwNoho/hU/4THeF9B+ptawR9USOeMbrwp1Fdke8DqDiH2c/xoh802FFzdH
 bgn7kJrOatLtpW/stgrHPBDOe8xZ9tFopnROsZMjtB2COTKmoY2PtUh16dojQxxGOVnX
 KQCoKAEL7szikid0E9Pdd6A1UNjnue75oR88cI+zr9UFrFz0rV41H0sniYcLy4B3tbKy
 DFLWU1LXcDuAPI3CC9w5flcvcAaS9PpWkVNKVpAeYmZgPpwy6SEsLzyeJpKIJd7c6xbd
 bAzw==
X-Gm-Message-State: AC+VfDzHSfMOvbwp1jgQF31D46db+0J+reJRjlNP8A7YUrht9kPsVVmB
 wrQufGVYWvuxH9lJo7mhxPcQ2Jq2Dm8CE+MivfA=
X-Received: by 2002:adf:f08b:0:b0:309:3a60:d791 with SMTP id
 n11-20020adff08b000000b003093a60d791mr88693wro.54.1685715740643; 
 Fri, 02 Jun 2023 07:22:20 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e21-20020a05600c219500b003f17af4c4e0sm5753600wme.9.2023.06.02.07.22.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jun 2023 07:22:20 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	qemu-stable@nongnu.org
Subject: [PATCH] target/arm: Fix return value from LDSMIN/LDSMAX 8/16 bit
 atomics
Date: Fri,  2 Jun 2023 15:22:19 +0100
Message-Id: <20230602142219.1999756-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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
X-TUID: uSyPjEp+6ipQ

The atomic memory operations are supposed to return the old memory
data value in the destination register.  This value is not
sign-extended, even if the operation is the signed minimum or
maximum.  (In the pseudocode for the instructions the returned data
value is passed to ZeroExtend() to create the value in the register.)

We got this wrong because we were doing a 32-to-64 zero extend on the
result for 8 and 16 bit data values, rather than the correct amount
of zero extension.

Fix the bug by using ext8u and ext16u for the MO_8 and MO_16 data
sizes rather than ext32u.

Cc: qemu-stable@nongnu.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/translate-a64.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 741a6087399..075553e15f5 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -3401,8 +3401,22 @@ static void disas_ldst_atomic(DisasContext *s, uint32_t insn,
      */
     fn(tcg_rt, clean_addr, tcg_rs, get_mem_index(s), mop);
 
-    if ((mop & MO_SIGN) && size != MO_64) {
-        tcg_gen_ext32u_i64(tcg_rt, tcg_rt);
+    if (mop & MO_SIGN) {
+        switch (size) {
+        case MO_8:
+            tcg_gen_ext8u_i64(tcg_rt, tcg_rt);
+            break;
+        case MO_16:
+            tcg_gen_ext16u_i64(tcg_rt, tcg_rt);
+            break;
+        case MO_32:
+            tcg_gen_ext32u_i64(tcg_rt, tcg_rt);
+            break;
+        case MO_64:
+            break;
+        default:
+            g_assert_not_reached();
+        }
     }
 }
 
-- 
2.34.1

