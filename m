Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1283222lfm;
        Wed, 17 Jun 2020 22:06:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxPszhblZAb0xGGYxkyH1/xuOZIxXWj4mlEI3O6fjkjEu+hgQtr4KZfH0vUmM8Bu4cV+neO
X-Received: by 2002:a5b:18d:: with SMTP id r13mr3432143ybl.235.1592456813025;
        Wed, 17 Jun 2020 22:06:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592456813; cv=none;
        d=google.com; s=arc-20160816;
        b=tJ5pfkJ4/NUhhU5QI/+13HqDaKfwtrCG98Cg/T+9EwWpMNa5EaR+hvUn/vDqb95+zV
         hwFb9XeRdb/lS8kosQUc7lbTP7lNbb9Gjf+co8BwyTwDAjT6AWoKUuDDIF/kCaOrrkJS
         8GgIIvrvquF+bsVluFVaB6tkABhKs5DV+S3M2twl7K4+oC5sXk3/CMJosxRSBZEPrJtr
         f4x9ZqRHsBPk7K8fAJlZ3k8GvytUbncFY6CPQekZ89aXnq/2V3o5DBCmDTHh5dDR5VwZ
         cylt1J2GwSqOgACjjgCOgt6TN6QVZrsicAmHIFLK5yn9ZQbyJcEQTCcSXmsah1Sss2qw
         W2Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=h0utKIwCKTuggRlCHgceRrXUBl35CiLU8leCzjyjWWY=;
        b=RH71IdK8fJMSCFBHMKGnBhYmo1nWEqmCof/1hUjVR+JqqWXsj96N8xyut/2SNE4El2
         GcoTnxuGKlICcbpK5nsbjSwGloJuO8pejeCbcWBg4KBzPeBJr/zAZCOeLCq9Ai09KafI
         Mysv7TYCdk0zWEBBingtI5SV96o4Y5eBWEZ0npDEmCS40mWh02H6M1Y7lrAA3pfl334w
         +th6mKg7wFI9kXSgY0OB6ESXC98vAMiU4swfjtO0SokIdeknSlgiZPMzWpBTHnqsM2UG
         eP2HlH2yOelCQFQfzTn4uH/gv83WBauucsB5O2Whx5KyaZ/iRmMXzGbxalunOI8wTOe2
         r+jA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iFSgBMdq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j74si1497727ybj.390.2020.06.17.22.06.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jun 2020 22:06:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iFSgBMdq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlmlI-0002bD-Cj
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 01:06:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmDb-00052J-3x
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:32:07 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:43181)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmDZ-0003QN-Et
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:32:02 -0400
Received: by mail-pl1-x643.google.com with SMTP id g12so1903026pll.10
 for <qemu-arm@nongnu.org>; Wed, 17 Jun 2020 21:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h0utKIwCKTuggRlCHgceRrXUBl35CiLU8leCzjyjWWY=;
 b=iFSgBMdqnJdmi5kpFjyfZCBQN9woj3F68bRlZvAkjtgzJ1sYm0vY3I9SHabFKMuqdf
 qgalhN7xZv2jYZtwAvSrIshGt+svMWcZpn2nSv0rl+sK3RSQ/qMggPq3c78udhcwuaDa
 Yox+vpBWgaagnhJ+G/HxJwd10556d7bLvOqDvXyHZCx52xDqpDjILBH4wtPefTfIzM7/
 2asCqxxtABHQeKd2fruNqkdCx+LcM/dqwiA0ODc9HEMTBgNl/lxclQg/YB6hJGGnV3/7
 0vHFQ+9wgY0FS2OV9kguVOXVkupX9X3byn8u7Y/Iqje7oeCeeWq1Ox5Iteg1f4K5bVB5
 /vKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h0utKIwCKTuggRlCHgceRrXUBl35CiLU8leCzjyjWWY=;
 b=T5t/a7IeOBzFflyiFMK72l2ozp/M1q4km71DBpoE3Oz6ccJgrta4mhLnkvfXa3ghO0
 FovQCiIAgA7V2s8hl/54mx+AH4GWeU2oV5+DU6XENKf0shRUaLxwUjCgG5NNvb3QBvnb
 G/CQLSE/DyWRRzBOTOZX9Z0Qk2aN3g2HjI1okZcEV/HCdpjsObSBZdCbRCUZwmEWmZjH
 EZcF87y2yA51gUlANmbl3F4nj6BVuwP0IFoIga2t8n2+3S5aPTijGhL6pJB8sDzwR5Mo
 Vb5C8Ixtv7o2KODiU8olrvA/zSRjPTl9Qr8EFRW5kszClBrEZDmqgl83w579e70PuUaD
 dzpw==
X-Gm-Message-State: AOAM533T71/Sh7OaAShGPlkQC6qQxhSAfpQ8MjlDLqQCUXbY51g0l/5A
 p6TtVWAyQxXwwwLWuUz4z6TRpA==
X-Received: by 2002:a17:90a:e50b:: with SMTP id
 t11mr2417984pjy.109.1592454720220; 
 Wed, 17 Jun 2020 21:32:00 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id s15sm1162840pgv.5.2020.06.17.21.31.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 21:31:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 074/100] target/arm: Use helper_gvec_ml{a,
 s}_idx_* for aa64 advsimd
Date: Wed, 17 Jun 2020 21:26:18 -0700
Message-Id: <20200618042644.1685561-75-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618042644.1685561-1-richard.henderson@linaro.org>
References: <20200618042644.1685561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x643.google.com
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
Cc: qemu-arm@nongnu.org, steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: V5gN+guVGUir

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index a3135754ce..5ef6ecfbf1 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -13053,6 +13053,40 @@ static void disas_simd_indexed(DisasContext *s, uint32_t insn)
             return;
         }
         break;
+
+    case 0x10: /* MLA */
+        if (!is_long && !is_scalar) {
+            static gen_helper_gvec_4 * const fns[3] = {
+                gen_helper_gvec_mla_idx_h,
+                gen_helper_gvec_mla_idx_s,
+                gen_helper_gvec_mla_idx_d,
+            };
+            tcg_gen_gvec_4_ool(vec_full_reg_offset(s, rd),
+                               vec_full_reg_offset(s, rn),
+                               vec_full_reg_offset(s, rm),
+                               vec_full_reg_offset(s, rd),
+                               is_q ? 16 : 8, vec_full_reg_size(s),
+                               index, fns[size - 1]);
+            return;
+        }
+        break;
+
+    case 0x14: /* MLS */
+        if (!is_long && !is_scalar) {
+            static gen_helper_gvec_4 * const fns[3] = {
+                gen_helper_gvec_mls_idx_h,
+                gen_helper_gvec_mls_idx_s,
+                gen_helper_gvec_mls_idx_d,
+            };
+            tcg_gen_gvec_4_ool(vec_full_reg_offset(s, rd),
+                               vec_full_reg_offset(s, rn),
+                               vec_full_reg_offset(s, rm),
+                               vec_full_reg_offset(s, rd),
+                               is_q ? 16 : 8, vec_full_reg_size(s),
+                               index, fns[size - 1]);
+            return;
+        }
+        break;
     }
 
     if (size == 3) {
-- 
2.25.1

