Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp4049810lfm;
        Mon, 24 May 2021 19:04:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJywv69lawi73+m+/MSfPjVjd7/Hgp+BFu9mQ0Qruh9zDSVCqGvqoqonwUkW4q7YQsiomMtf
X-Received: by 2002:a05:620a:4090:: with SMTP id f16mr32812647qko.225.1621908268608;
        Mon, 24 May 2021 19:04:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621908268; cv=none;
        d=google.com; s=arc-20160816;
        b=Sy0U1amJf80rwtmFLL4pqAs+wceq2XW6ljpTjEWIKxr8CqsfMHnMgqa91GExGb9RS0
         RQ6sRBlnsUqNZnluart5eosIzeYpBFtWNmzkpDT8EwRErzDD1rUBGbrJoCBBcAs/4NfP
         NmUafBXbyW/S+v1SdOz1ny7yGvbMFKtuYcJCaN94qBE+Mb8BWLoy0zb9iVysPHBE4Nyu
         5ebqr0jYV4WbL26JDyqEhZKgsgxliFexWLpouN1PuzMp2GmMzHeNgPPBWLnr/U1TtWIV
         VSOvYQdeWg3cD0Gx077MgHwG4bmsRMPBxWp2ws24+dZjwC6yPN/QjtoOJckbVwZovAwI
         bbtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=gnLuFEuk0ImYugyY8pF7Rs4So+H1zk2c+Dqze+bYb5s=;
        b=soGxYyNgq319yy1skSy00/f2UQnUNXEjtG/9H9H54JVDWFqqu2rd36xToh+NtqYcbH
         rjDoXr8aAtzqtuMKlCUF9BsoMy59S1DUeR5EO0BobsWnVTesxWauswFFRGi7l8B9Yd8F
         OlfgRAewj7x2Fa02MWpypJab/ncFrwOPvR2gOBJ0pYFbm2M81ICTrSwfRF92qsaCKAo4
         h8CUlBrtujO1dgC5EgOf4pehhcmU5Eoux9vH2cOzujYBKAjIYMj9JweHtCmF2UcMpXfZ
         S6ys8hFTcr9L/LaRH36k5QZBPrdO2twqgVqTmO5OAOpFFYgbB7S+3WHEDLbIhPvclRrl
         Iiww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CrAgXX4x;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h3si10540595qko.40.2021.05.24.19.04.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 May 2021 19:04:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CrAgXX4x;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1llMQl-0003ir-Vi
	for alex.bennee@linaro.org; Mon, 24 May 2021 22:04:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLYT-0000sE-Ry
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:08:21 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:45855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llLXs-00043e-9o
 for qemu-devel@nongnu.org; Mon, 24 May 2021 21:08:21 -0400
Received: by mail-pg1-x52f.google.com with SMTP id q15so21396654pgg.12
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 18:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gnLuFEuk0ImYugyY8pF7Rs4So+H1zk2c+Dqze+bYb5s=;
 b=CrAgXX4xzWcVRFk4YJmEb1OHTmsc9y0jh082yYcylghbLtBFkX3IDimgERadfEznwm
 suzDRDu9KszKvUq3UvW5lYp6Arv9BuPNJUQFFTxYxhcWdtSYp/3oUgfbqudVLgORnqyD
 cvGrdgQ6VGm940vE0o/QdNMguU3979b4cEEU5xTLgu3pLvTKLLXvZNGng4LuAQQRsgCx
 zCI/6tzV2IWO8xWHpcgyzolrDQQ/LRu7PFQl19l2RAxBwJj8fLgF40UnPKkN6HcujQJw
 R2WSilsT72ytH7vcICPwnLyeymtt9CB7p12y4+wiGpwP0B1BxuCqpaMEVN/CcHG4v+10
 5AjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gnLuFEuk0ImYugyY8pF7Rs4So+H1zk2c+Dqze+bYb5s=;
 b=gqNfJVngG64MphfbN+2eQ7ktTkmNY25UkmC8OpEksUw470JucAaJ9/1sNH3psNntkd
 RnYqe5UbVJRKzjB8xn5Hzu5rL1QcdZv17o6nzB3gZ/awaIAFpfE/3HL804Ki/LgJ4/cz
 mWbFDVGbAXACWrBE2drfnIptESk7eBuI/ciDcnyZVD1zf3SSL9T9BZm5ObVdKwD73Bt1
 RIY+MJZjzugR7h+h4T2lwNlmPm6wkVaDSOHgE673e6IPg1LD52Z/JT5y53/mHW4Iw/V+
 Mwnvy3z1UNVf5KllSE1rEqBxy4N9/BTqoPrylKObIdgKrf3aeV87Hymf3p0knNIwq6X+
 1IMA==
X-Gm-Message-State: AOAM5321TQi3DB+nsVgslveMTNFDQy4Cw5IEFpaJxJrPcb3tQ7sXU6FD
 ckyljcKX0SQSdceOjFC3DvIpj0QY2G/rxw==
X-Received: by 2002:a05:6a00:b51:b029:2d5:874a:6bd7 with SMTP id
 p17-20020a056a000b51b02902d5874a6bd7mr27819381pfo.6.1621904852284; 
 Mon, 24 May 2021 18:07:32 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id b16sm11748176pju.35.2021.05.24.18.07.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 18:07:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 53/92] target/arm: Implement SVE2 integer multiply (indexed)
Date: Mon, 24 May 2021 18:03:19 -0700
Message-Id: <20210525010358.152808-54-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525010358.152808-1-richard.henderson@linaro.org>
References: <20210525010358.152808-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: H5j1j4oNDqPF

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v7: Split arguments to do_sve2_zzz_data.
---
 target/arm/sve.decode      |  7 +++++++
 target/arm/translate-sve.c | 30 ++++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 74ac72bdbd..65cb0a2206 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -775,12 +775,19 @@ MUL_zzi         00100101 .. 110 000 110 ........ .....          @rdn_i8s
 DOT_zzzz        01000100 1 sz:1 0 rm:5 00000 u:1 rn:5 rd:5 \
                 ra=%reg_movprfx
 
+#### SVE Multiply - Indexed
+
 # SVE integer dot product (indexed)
 SDOT_zzxw_s     01000100 10 1 ..... 000000 ..... .....   @rrxr_2 esz=2
 SDOT_zzxw_d     01000100 11 1 ..... 000000 ..... .....   @rrxr_1 esz=3
 UDOT_zzxw_s     01000100 10 1 ..... 000001 ..... .....   @rrxr_2 esz=2
 UDOT_zzxw_d     01000100 11 1 ..... 000001 ..... .....   @rrxr_1 esz=3
 
+# SVE2 integer multiply (indexed)
+MUL_zzx_h       01000100 0. 1 ..... 111110 ..... .....   @rrx_3 esz=1
+MUL_zzx_s       01000100 10 1 ..... 111110 ..... .....   @rrx_2 esz=2
+MUL_zzx_d       01000100 11 1 ..... 111110 ..... .....   @rrx_1 esz=3
+
 # SVE floating-point complex add (predicated)
 FCADD           01100100 esz:2 00000 rot:1 100 pg:3 rm:5 rd:5 \
                 rn=%reg_movprfx
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index ae443f3b20..dbab067a53 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3813,6 +3813,10 @@ static bool trans_DOT_zzzz(DisasContext *s, arg_DOT_zzzz *a)
     return true;
 }
 
+/*
+ * SVE Multiply - Indexed
+ */
+
 static bool do_zzxz_ool(DisasContext *s, arg_rrxr_esz *a,
                         gen_helper_gvec_4 *fn)
 {
@@ -3836,6 +3840,32 @@ DO_RRXR(trans_UDOT_zzxw_d, gen_helper_gvec_udot_idx_h)
 
 #undef DO_RRXR
 
+static bool do_sve2_zzz_data(DisasContext *s, int rd, int rn, int rm, int data,
+                             gen_helper_gvec_3 *fn)
+{
+    if (fn == NULL || !dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        tcg_gen_gvec_3_ool(vec_full_reg_offset(s, rd),
+                           vec_full_reg_offset(s, rn),
+                           vec_full_reg_offset(s, rm),
+                           vsz, vsz, data, fn);
+    }
+    return true;
+}
+
+#define DO_SVE2_RRX(NAME, FUNC) \
+    static bool NAME(DisasContext *s, arg_rrx_esz *a)  \
+    { return do_sve2_zzz_data(s, a->rd, a->rn, a->rm, a->index, FUNC); }
+
+DO_SVE2_RRX(trans_MUL_zzx_h, gen_helper_gvec_mul_idx_h)
+DO_SVE2_RRX(trans_MUL_zzx_s, gen_helper_gvec_mul_idx_s)
+DO_SVE2_RRX(trans_MUL_zzx_d, gen_helper_gvec_mul_idx_d)
+
+#undef DO_SVE2_RRX
+
 /*
  *** SVE Floating Point Multiply-Add Indexed Group
  */
-- 
2.25.1

