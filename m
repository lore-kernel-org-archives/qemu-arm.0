Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1283445lfm;
        Wed, 17 Jun 2020 22:07:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxrCCIcZbU6oAtv28woYochqo1bsxmu5Vf2//xH4DRfYRWfMeBNs57mlR+78mhl4L0IJsOK
X-Received: by 2002:a25:230a:: with SMTP id j10mr3867119ybj.148.1592456834832;
        Wed, 17 Jun 2020 22:07:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592456834; cv=none;
        d=google.com; s=arc-20160816;
        b=ml04jeWdNgI9DdQR+djRSbNhdqP3GNs3qNQT5RwjPI2IJk3NVg4OcV0UMuFMoLMtOC
         uIGn5O+2ghLEsLNPI2utw9/lB8RHMsgWOUgBg1BJmtOs+YTrrY1bt5/I5FhvElnNrZoM
         J3IEaRX6AGR/BIeGFnlqvAYKg1PRoIo+sHcbJygNNH0M2do9eOrHy2vpzAjFsvRJ5MTB
         gnKJjy+bLThtNc4+YQRjbXctmGIyIf1y1CeaRqtEnMNYBx3NqKe9WXO2IE9B/pEb60v9
         ZQT0yD2vquFEXqD6dgoxXMfktA0oq/zMAo5LyuY+A/MbJR9GSGwyTj7LNtCw08JthqSn
         rxvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=YCsgMvDUkLQfkvMrS1S9YZCH09MUZPcC76XkbF1ShJY=;
        b=FWliGUisbMP2T9RzS9E0BCPKP2yEzWMHs0hh5M4nPyYUXze5k9NB8leN9sefjDPJru
         E9OP+qLCi7eLPxW84GNhCQXf3GN0ZAIqnC+ixwb/X7cN3Ce4GZ5tFLYYjFW08TNUGtKn
         1ZxNml9XmOEcontLtU52taZ5JTq8/sBWxgyt8nUtC/qZDM636Th2x3h2zpRTGMB3Rc0S
         xsj53GnVeOrJjhSKB7bmQs8dYIh+iuIVsLvkI/kdjxCBSOMBvZTlu988BxQoQRX8Tdxb
         WILB0JNw7OP6JQaBYq/IWfv7o/w2+91yN0Lik3/jIcpbeABOvcHQjaUb4cc42B3EyaZ9
         GBgA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=z7dqeTT1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q3si1525324ybo.115.2020.06.17.22.07.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jun 2020 22:07:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=z7dqeTT1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlmle-0003ir-6M
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 01:07:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmER-0006Ds-Gj
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:32:55 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:43595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmEN-0003ck-UV
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:32:55 -0400
Received: by mail-pl1-x62f.google.com with SMTP id g12so1903751pll.10
 for <qemu-arm@nongnu.org>; Wed, 17 Jun 2020 21:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YCsgMvDUkLQfkvMrS1S9YZCH09MUZPcC76XkbF1ShJY=;
 b=z7dqeTT1RyM4jAUGgyd/cg0pHkfJ4fd551BS+0kYVFuLLj5QUaglE4GXu66PAyzTbm
 BMHylgHvaoNWFo2sWYwMYEO+rxgN/7nGEVf/DbMPZcLAnEc73/L7Se6kNq2+N/Rdodv1
 OAgEFVzlktnrUrLdq96H4QTfEPNPFVeZoHbi4rdWqKWLXFQa2iuOGGD6iu0fiiR2wA/2
 u03NMg5sq/ZSnbxGCJHhAG46s743kFeSo+lswkqTLTJzmkWQL8Y9WuQbnMTTyfytb9jr
 A29H1JwKI+r8nT+ZqxbhUiH6zpYAKhbxvh7UXU+piAx8GixzpFiU4ghKzPbpOT+MjxCz
 +U6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YCsgMvDUkLQfkvMrS1S9YZCH09MUZPcC76XkbF1ShJY=;
 b=AyBOosiFDZl/3N8m/SMfVzP4rYGUnF/xK2cSvR2j/PoYkL6FoAikMF0TfJX1puSf0I
 r5ZrXFRRhYJtTIXqqnYYwhcz76VFMaeHVfisjJOo341eVz4sfpq8LNSgP27bdjPZQhkU
 Jsm4h70Tbqh2zqTsgWoi2/5O4vu4xMFzKvI6zFMUyyXESB5d3jbxUr59dyZDaFxiFc/s
 9uwaNpgv/PRmEjrEkOjBzt5zFmNigQZazvCzF1pEVksD6MGbR9tw3qpsTWzZ3bORD598
 ZMEtrNIaqd0Y6qQnnJoVuzQHZJUuqM6bXa6ymnJdyceaxhth0fG8NBXxxIWNpwVnyzKG
 Rcig==
X-Gm-Message-State: AOAM533ML/b9kYNWAaXkH7Md/tVtv7a2IdVug3v8C1ro8rvng+IGkLtc
 AA4Q5r1S5kKrhgE/oCEm/7yalw==
X-Received: by 2002:a17:90a:8b98:: with SMTP id
 z24mr2460982pjn.159.1592454769781; 
 Wed, 17 Jun 2020 21:32:49 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id d2sm1165766pgp.56.2020.06.17.21.32.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 21:32:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 088/100] target/arm: Implement SVE2 crypto constructive
 binary operations
Date: Wed, 17 Jun 2020 21:26:32 -0700
Message-Id: <20200618042644.1685561-89-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618042644.1685561-1-richard.henderson@linaro.org>
References: <20200618042644.1685561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
X-TUID: f8bD8RDBEm3D

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h           |  5 +++++
 target/arm/sve.decode      |  4 ++++
 target/arm/translate-sve.c | 16 ++++++++++++++++
 3 files changed, 25 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 37fc866cf8..1be8f51162 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3877,6 +3877,11 @@ static inline bool isar_feature_aa64_sve2_bitperm(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, BITPERM) != 0;
 }
 
+static inline bool isar_feature_aa64_sve2_sha3(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, SHA3) != 0;
+}
+
 static inline bool isar_feature_aa64_sve2_sm4(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, SM4) != 0;
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 2ebf65f376..5f2fad4754 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1564,3 +1564,7 @@ AESMC           01000101 00 10000011100 decrypt:1 00000 rd:5
 AESE            01000101 00 10001 0 11100 0 ..... .....  @rdn_rm_e0
 AESD            01000101 00 10001 0 11100 1 ..... .....  @rdn_rm_e0
 SM4E            01000101 00 10001 1 11100 0 ..... .....  @rdn_rm_e0
+
+# SVE2 crypto constructive binary operations
+SM4EKEY         01000101 00 1 ..... 11110 0 ..... .....  @rd_rn_rm_e0
+RAX1            01000101 00 1 ..... 11110 1 ..... .....  @rd_rn_rm_e0
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 92140ed2fa..3da42e2743 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -7731,3 +7731,19 @@ static bool trans_SM4E(DisasContext *s, arg_rrr_esz *a)
 {
     return do_sm4(s, a, gen_helper_crypto_sm4e);
 }
+
+static bool trans_SM4EKEY(DisasContext *s, arg_rrr_esz *a)
+{
+    return do_sm4(s, a, gen_helper_crypto_sm4ekey);
+}
+
+static bool trans_RAX1(DisasContext *s, arg_rrr_esz *a)
+{
+    if (!dc_isar_feature(aa64_sve2_sha3, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        gen_gvec_fn_zzz(s, gen_gvec_rax1, MO_64, a->rd, a->rn, a->rm);
+    }
+    return true;
+}
-- 
2.25.1

