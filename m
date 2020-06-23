Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp4344012lfm;
        Tue, 23 Jun 2020 12:42:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw0SoLAMj/AvhspUn0kIVfyjxrB1a2zhdYW8I2BF/gAmxc7oq+Z1yovw6y811YxjHY+5dyT
X-Received: by 2002:a25:688:: with SMTP id 130mr13638047ybg.466.1592941345414;
        Tue, 23 Jun 2020 12:42:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592941345; cv=none;
        d=google.com; s=arc-20160816;
        b=eZRTIaDM+/khoq2a71xj/yjdJ7N9OwEo1QOPHEkJcsh85Jsm+zskrW7hoOph1H+B3R
         xSnEWGgeHAxv05tMNgRFGiME3C4vHiYekOJlSpkfFfAHqGP67bBhHtk68PSS8XZpY79K
         eSbSdLoFBmeV/Kmb32NM4KjbeEHgPyhVG9M15cYmbZx6T9tEHZpPZtfe0sKR4qFVZUjo
         Ny3BxFcWpM78Az8BPsouOL2v1oiaSD+ed1PW7BcU8wEi4OWSVpvgIsabO6KsrWdS7io9
         3mbSZBh8FmB7DYo6xeHEUHG4zcAa6IzZEIfmH57yylItH6y9jikv/wdJtAIgRE8poTkz
         Qz9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=j9052jJr3KmnjYv00hnljbuK29UeNui26+Zt9JfEPLY=;
        b=i+iGItE8UtMHSr+NJL+xVjXdaiZHWogqzuC+DIoh6ehIfcn9cdbZR1F3+Aav+h/lrs
         tx5j9qKh4UknlCkq6c0hWMTTJ3Fkz78vToZuEn5ltVW4knTyp35Qg+JMRU26NBTi2fy5
         4jnMnzm8m1QRK9D8OkHDg6iJtarnb9Wd+09IXMyNq1sqlucBmk3CHG22MoBV0TWHq4JQ
         FB8/YeU4ed1njSMcwDAM/6NOOAIvYqefNgFrnONKi/Aef8LfnTnT7OQ9n7t5cpkEseNH
         S4RV2b5d64GiT9iyASz4mFE3bcpMaU/gOqXZGTieC9CaZOhPdTStQFoiYywoGzWlw/Zg
         ddpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mjM7rw4f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v12si16092069ybm.487.2020.06.23.12.42.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jun 2020 12:42:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mjM7rw4f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jnooK-00051a-Nh
	for alex.bennee@linaro.org; Tue, 23 Jun 2020 15:42:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jnojP-0003cP-Rf
 for qemu-arm@nongnu.org; Tue, 23 Jun 2020 15:37:19 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:42520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jnojN-0005c5-VF
 for qemu-arm@nongnu.org; Tue, 23 Jun 2020 15:37:19 -0400
Received: by mail-pf1-x443.google.com with SMTP id b5so10549758pfp.9
 for <qemu-arm@nongnu.org>; Tue, 23 Jun 2020 12:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j9052jJr3KmnjYv00hnljbuK29UeNui26+Zt9JfEPLY=;
 b=mjM7rw4f1Jmd4a7uiswEjHHpsmY1la2ambYehWS/V1AiKpzqsN7Bf0wk5Myh+VtpkL
 vRxSpGe8+DAw/6B8CBrzP86aTBlxHYdZaqUKB7RDqMiDV5SV8a/j+doCEgLi1h2J4y4N
 jdwcIb/ZRsB0ntEWRlFuLDWWe2GY3dpxLDOWWC2BgirbJHerie7zJ7RbI/cGqQyeXehp
 1ox35pvkTAcPltlxCmh/Iqx9U9mPQlPqmeOceoHhuT0BSUa5rE7ivRpNgMr8OGH2tKdR
 i7e3QnB1F8ivlUx+VhXUAfB8MTS5K0P45tcKVZ0l+EdjM4jLbVfLp5/WburJoraqSFLX
 YXNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j9052jJr3KmnjYv00hnljbuK29UeNui26+Zt9JfEPLY=;
 b=ZkHWYV4h5y/H8QS8l3h0Fs162FxYg8IXiJplkkoe7aQP+h1qzEGVifxGEZOWNwqEBD
 9T+lQSlF03JegI1WHEVXaznd8CJ/UkzIouYnAf0pE2lTUtfq01l71wHBoeWGFqLoXq4l
 iMq3ee5mA85eubm0h5S97XRN6keW8T4ww6qoFBAG/ddS+Vm52yxq6bIlepNlN8hULC9v
 WJcU02Yt3hPChabre182rsQ51a8zhr+t7o0iZb75i0CMzRdwIVvN74j1mz0Povvk1Bih
 /XdxseN+P7I0TCk4NHdsIJSr7ULKNW7ZZ3czSuoeA8TxgGoU0S79UZgg3KDd6bnvmd7j
 EW2w==
X-Gm-Message-State: AOAM532+623o9BZ02YAF0WnLlO3w10yBgpT9xJaU+7GkZyW3w78Bx16C
 wczD53r1UvvJZz6/9Eb+O5bIS+//8SU=
X-Received: by 2002:a63:5a60:: with SMTP id k32mr18367293pgm.73.1592941036592; 
 Tue, 23 Jun 2020 12:37:16 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id p12sm17927642pfq.69.2020.06.23.12.37.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2020 12:37:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 12/45] target/arm: Implement the GMI instruction
Date: Tue, 23 Jun 2020 12:36:25 -0700
Message-Id: <20200623193658.623279-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200623193658.623279-1-richard.henderson@linaro.org>
References: <20200623193658.623279-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, david.spickett@linaro.org,
 steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: beTEv7K6iA+E

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v6: Inline the operation.
---
 target/arm/translate-a64.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index e9bc7e90af..255365e76c 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -5346,6 +5346,21 @@ static void disas_data_proc_2src(DisasContext *s, uint32_t insn)
                                              cpu_reg_sp(s, rn));
         }
         break;
+    case 5: /* GMI */
+        if (sf == 0 || !dc_isar_feature(aa64_mte_insn_reg, s)) {
+            goto do_unallocated;
+        } else {
+            TCGv_i64 t1 = tcg_const_i64(1);
+            TCGv_i64 t2 = tcg_temp_new_i64();
+
+            tcg_gen_extract_i64(t2, cpu_reg_sp(s, rn), 56, 4);
+            tcg_gen_shl_i64(t1, t1, t2);
+            tcg_gen_or_i64(cpu_reg(s, rd), cpu_reg(s, rm), t1);
+
+            tcg_temp_free_i64(t1);
+            tcg_temp_free_i64(t2);
+        }
+        break;
     case 8: /* LSLV */
         handle_shift_reg(s, A64_SHIFT_TYPE_LSL, sf, rm, rn, rd);
         break;
-- 
2.25.1

