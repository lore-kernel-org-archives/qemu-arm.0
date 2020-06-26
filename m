Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp50742lfm;
        Thu, 25 Jun 2020 20:37:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwixd7bpf3uy4gntrtADKEmu8BhND4au0hoqHJZ7iSd/rem1ScvmgpRMlDza0EFK2/4ycdL
X-Received: by 2002:a25:6d02:: with SMTP id i2mr1753171ybc.365.1593142670788;
        Thu, 25 Jun 2020 20:37:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593142670; cv=none;
        d=google.com; s=arc-20160816;
        b=sxvrn60ZSa4gmA4gT01JgupwX4zzJQvGVYAGQxqctl4FnA6lgBOIqBQVarHnwC4UOp
         4C79fSQX7Bwmfa7fFoFeCjmi4Y4Z3f/HLxWo4n+JbgivEwkUTp7njnO2PUESsA368MaP
         7isI5RN9fx6ysJGpKSouseHzzRN8xqb4HNgdSx4/imncOeoZxOJi5tnNP5NYzyKw8R0k
         96tRql3VQJg6m/4+sCvaTH8C6eldetRicc8CrkDlP16DQ5b355qXyITOtqb8niNRgZSL
         PxeRWZLIPTf+fUeElsNdIdByKmLNbP4rf7fL1WMwPs70AZsDeuyUDuxjNNXMGa3aa9+r
         l5sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=6v/qRXRyfIYhGyb3e1JHgjhX613ps7MlxvVRRfe3ZMk=;
        b=cZURgkRbWOx/HH0wW3fDOx7jF7GEqUsILiQ+8tYIfWrtclZcnwcjjAzAyr12Iuxxp7
         UyUGUHtBCeAwwPrlY9cGVyiamBC/FjjPkb2jUJf8WtutXoLtINS2FmCWK1fy7Egrrxqh
         ZKP7nMzWUgGqnUR9yMX7e1GvTtn+2jA+QdSnYcWx5mT9OQZmFOm4jMYgTls9BcRAaI7u
         LOcsIb5qUusAH2rxcv/7GIfNWVrsR1/6746zHJzEjo8X6uCx08gbpcRp+kIb0ecPNkiD
         NPa/bJkwSjO5D/QFjqxZG8AjkvLqepbsdSJz3/5mVN0+wu6UFXQe6apaDbKIfbluUDW2
         VFYw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=H36lrNaY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x4si1256131ybt.310.2020.06.25.20.37.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jun 2020 20:37:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=H36lrNaY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jofBW-0002Mq-78
	for alex.bennee@linaro.org; Thu, 25 Jun 2020 23:37:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jof5y-0008Do-Ff
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 23:32:06 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:34453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jof5v-0001oa-Uj
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 23:32:06 -0400
Received: by mail-pl1-x644.google.com with SMTP id d12so3770065ply.1
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2020 20:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6v/qRXRyfIYhGyb3e1JHgjhX613ps7MlxvVRRfe3ZMk=;
 b=H36lrNaYx9Q+qHL+r01PBHtgMG8XDrT7cZiQE5+ue2u9YhOoMMA+2MurqoMMB2EPWf
 OdHxMs5WzX3u7M0lfj4XImqNWdfPZE+ZXLfwZWa5/ScdqB8Qk36Iw6cxuOgzeexwVoQ+
 +uGqKRKNe/4rPoj/LAaQz+qdgGsdXW3arcV5ZJTcJMVVo9cRdHoPhg31Dvxon/q/CvH8
 WkZiCTLCjlW23EGreV2ihia2XCtxkiRdsFfB7oasFKywlSZvPPU0jhIwpbqCYdZDvJku
 A1K4Qv8nrutMjh6+iiyKvgJ+JKHwvqTqei6a9oAX/4it2w7QkITGknz5yrP+22leVxQ9
 BrdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6v/qRXRyfIYhGyb3e1JHgjhX613ps7MlxvVRRfe3ZMk=;
 b=s7hTHiFfEbQiQXylXp940fUTZbDyVE+yQc8Ht19wSeu0nHuQRwcj2Npo+9iBHLqsgp
 GaIJyX8WB63X6z9SBP8uFUitW3CLZ9IgwyBcnfXBV6l3m5yQh4o9JOsPQJLkNszPC8Ck
 Ieomyp91cysTvxvP3b8o87Ryl+XZfSEXcHNUEcowkkLwqYZdFfyMSwxWcfLBHiU9V5n/
 MuZzdPGJ22YdMjoUzKOTebrxQ63iHatk7+uzKQPSzBeWhr1ghbKx6mNHrM3aj245MHrc
 n5mdvFWDJYk+4u6Lk/wVJESZGEIqQDndpxZCuZwC7MZf/EVdsYmWn1vHervD5Nf9ClmJ
 8Mpg==
X-Gm-Message-State: AOAM532RS89o9lbBZXXRdMbAE7QBJwiyseS65zuqrrZzEqYYe/kYPg1W
 KYUkAtyZ0evPViLZS9ucs/RlPjrXno0=
X-Received: by 2002:a17:90b:358e:: with SMTP id
 mm14mr1273118pjb.54.1593142322584; 
 Thu, 25 Jun 2020 20:32:02 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id y27sm1605256pgc.56.2020.06.25.20.32.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jun 2020 20:32:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 12/46] target/arm: Implement the GMI instruction
Date: Thu, 25 Jun 2020 20:31:10 -0700
Message-Id: <20200626033144.790098-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200626033144.790098-1-richard.henderson@linaro.org>
References: <20200626033144.790098-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::644;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x644.google.com
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
X-TUID: C6cJ6T3sgJKs

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v6: Inline the operation.
---
 target/arm/translate-a64.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 2ec02c8a5f..ee9dfa8e43 100644
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

