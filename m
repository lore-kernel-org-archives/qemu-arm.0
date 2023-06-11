Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp1541137ejb;
        Sun, 11 Jun 2023 09:04:08 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4zRuuyiDkMKqrhQQyvESHjyXOJFOWlDAlKivbkWXHJNp1eJrhGOWvn2v1YRb4r04HApxDn
X-Received: by 2002:ad4:5ccf:0:b0:628:8012:bee7 with SMTP id iu15-20020ad45ccf000000b006288012bee7mr9193321qvb.20.1686499447847;
        Sun, 11 Jun 2023 09:04:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686499447; cv=none;
        d=google.com; s=arc-20160816;
        b=epI4/cFlvXuesf66bSNGtnj6lAVP2D6rw0zuUkUgsS+BLBr4QFmMMIlc2Ma+LeQ1d7
         iDxkSlyFyoNZdT30fradNZ85ob2jZQNlXsgE6oVmZQjJFJv3usu9peyxuir8z5NHhKgb
         4rpXf/m97ZWosrqG/Ausf3RI80RfFozRnAZBuzqHx3/inInmbu2vlxBaZMGM6yZ2xi8x
         GKR72BcM47WrFZVT4EcTA4SjxdrAaa5t7JSlK9N52M6tuWzEEhB4LOnMYIcPtweOvb/H
         GhMteUCXojAesiwtDLnS6QoS5Lw8TZprrm+WOHtzI+tJkJ7CuKe5Jup6CP0ZDi0s4via
         8FXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=QYoLjQUBzDtsQLiewQeHZyMx2G0pXSiMumiEHL4MRBM=;
        b=l9nD4hIiNTcPjwtpct/qlzdIXvrdVmHauzNfgyFUl4mtc63fgZU95RRJv35l7De/aT
         FhHdOh9143eebW8Dqupap7LoEobxp7c7rvW6vf27gxhkq9dMFstdnfeGKOLynw0JyOTk
         exY2YTGm3rfCu0RopcD+JVdLDS4AUewseRAq9K3MhsE/gcNZzh93kGCpWW2k9clKwrFc
         6zVRipsFt+ajIYAG1CBUzVfJKfxlEedOP4/NKF0xvKskdMtZCZKESXExHyCs22/h2Ubt
         cpSWUFzdCvGN2e6BjT63uqlRdC+M9mdE1lnzFlc+dn+lrNp8+LPqtotpokICYXR7hvfr
         aX3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mcCaaGOR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o11-20020a0562140e4b00b006286abef06asi4928020qvc.63.2023.06.11.09.04.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 11 Jun 2023 09:04:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mcCaaGOR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q8NVV-0006Id-6L; Sun, 11 Jun 2023 12:01:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q8NUe-0005ow-EK
 for qemu-arm@nongnu.org; Sun, 11 Jun 2023 12:00:49 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q8NUa-0000R4-Uv
 for qemu-arm@nongnu.org; Sun, 11 Jun 2023 12:00:39 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-30fb7e668c8so619037f8f.1
 for <qemu-arm@nongnu.org>; Sun, 11 Jun 2023 09:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686499234; x=1689091234;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=QYoLjQUBzDtsQLiewQeHZyMx2G0pXSiMumiEHL4MRBM=;
 b=mcCaaGORXLo8u5KAwAVL5dLyFA6eMej5XUaOFzf6IxmKNQOB5DKtc3BgaYWNqz8k1G
 02Yb44mXos0nErkqy7h9llSFN2L9nxPLOIeNGdvedR7748a6Tpn+Ie2RjsNqBkNuUxT3
 Oa0JVh8SlpFjzVFD0OthX2Ek2ZgPuDqlRZgO/1oyfJGJ/jl0YNmMdhHsngA6Yo3sTRcs
 QxQDP7u1Ai/fjrXeIrEFLuwodnvFI4voNWMYax/F3CEnaUsAm1010AHoHLEST6i5st2i
 EqX33OSdOZczgw1hTfkmB0Cm6LsGnB6MDKIGwLVlRDO2ukn9CxLvS0H3oJudPxinbg33
 D1JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686499234; x=1689091234;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QYoLjQUBzDtsQLiewQeHZyMx2G0pXSiMumiEHL4MRBM=;
 b=KuG2GQ1aA0rL2UoB5e7jYTgBpUZipeEpF2kAlodmjrH8nBAlYr6bdC9j7oErx7zghr
 4KV1u/KRDtdD0LJrtrIAPv42zcguv10fOozFSHbRPwt+JLKyKGcO457x/+uxNxWpEo5L
 4dbKmYt5oqLnQDJdDrhjMM+S0Q2iyfAN3ywEeweofKBNx5C6A+hWhswRp/M0UcIfy7TP
 Vtl4rUZHnj6betdeUaqOl1gcUWi9qb8RbPl0snKh7DPh+bAg5l+CGNh7faoIGPrDdnzw
 CfTwNB0PFcrnlbYqRNHC6HagqwWu8+w0/RhocezbOmsZrWFH9zbJ/ELi4Lv1zWHsaNdO
 mtrA==
X-Gm-Message-State: AC+VfDyyYfXt6FGzeyTUHtmLfHFJfex2Pq2GFE89fXQdtSv+bXhuVgcm
 fRzjjJIHI5i6vFing9Ensc/tmE/sRzz4smxXxfk=
X-Received: by 2002:a5d:5265:0:b0:30f:b0de:f100 with SMTP id
 l5-20020a5d5265000000b0030fb0def100mr3240746wrc.23.1686499234418; 
 Sun, 11 Jun 2023 09:00:34 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 m9-20020a056000008900b0030ae499da59sm9923022wrx.111.2023.06.11.09.00.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jun 2023 09:00:34 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 01/23] target/arm: Fix return value from LDSMIN/LDSMAX 8/16
 bit atomics
Date: Sun, 11 Jun 2023 17:00:10 +0100
Message-Id: <20230611160032.274823-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230611160032.274823-1-peter.maydell@linaro.org>
References: <20230611160032.274823-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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
X-TUID: yUb4a4y20oFo

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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230602155223.2040685-2-peter.maydell@linaro.org
---
 target/arm/tcg/translate-a64.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index aa93f37e216..246e3c15145 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -3545,8 +3545,22 @@ static void disas_ldst_atomic(DisasContext *s, uint32_t insn,
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

