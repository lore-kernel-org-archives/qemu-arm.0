Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp493065lfg;
        Fri, 30 Apr 2021 14:04:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxXXhOA6QscczJvyqqtlnmC6NE84CTn/DBPE8SUvJQuHv/Md3WFMv4ypdwU0ri0g8JUTvCx
X-Received: by 2002:a05:6e02:1526:: with SMTP id i6mr5602095ilu.270.1619816673415;
        Fri, 30 Apr 2021 14:04:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619816673; cv=none;
        d=google.com; s=arc-20160816;
        b=V2vctqhp+9WtaQhKU+o83G9grZ9IWWZs0PTixSb/o1CXIr3BLUmCSN3CA4gGX5rlpF
         6mPKgZ+VoAvZCCIT9p+RlsvK9taR+fp3GQ2e0YfP/wUgmG/LSKTjC7uxNwpq14t/TSWO
         qoaeNNEv63LPiCpvaFMd6+1QvvXR0gBWd2AjAb+2enuH7y7ohVxKs2eIiVW4kq29rdW+
         Pje7DxJpN+Gw3Hv5NtAsiwTArI7GEZH+uZeCreAaanRSVhDPh5hQ1XHscOqsWKOx63w5
         Z1zFiO7F9FZ3mL+/nSQhkfh3s0wmLSMjCp1Fa2Cw5NHmZ+1m/knetfoI/uGKKmMGmTUd
         D8VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=4LOZdC1ItbQynZDOtyUtTS7T/flVKohWME+t/j4leKo=;
        b=SfwJY4crQpcGNCHjeNcBfQcVnhbBhLxPh0+vk4Jszq7YcoXdbY3+MJ7wAAkHjL6fl2
         bxY4GR9Mz3zxqwHYoDCQWJrVHkmBRpxhcBsSqCf9pRgIBQsNJiKlAFbKCCWzL99035bC
         iC6GK5bQpTEPPSVI0fqzQZ6JTXpiHYNVwT5jx0E717WY7wrcjJMebar2LKmVxfZWnP0G
         C7U954+iVe075/+h+ktHkdFOfEPHKWLZ/JETBSY9FxY6Niu4v0wCyXuHKnZm+orRMb78
         nQiWzZ9fxbGu6vWsbIKWFsMvHcTD2Rg2rwnWad1jyW6QNyl4kUK3Bb1QByPqEMfchIBW
         icIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OqouuTZe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y3si1243685iom.73.2021.04.30.14.04.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Apr 2021 14:04:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OqouuTZe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lcaJM-0005PJ-Nr
	for alex.bennee@linaro.org; Fri, 30 Apr 2021 17:04:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZmJ-0004Sv-FO
 for qemu-arm@nongnu.org; Fri, 30 Apr 2021 16:30:23 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:40551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcZlm-0007ir-A7
 for qemu-arm@nongnu.org; Fri, 30 Apr 2021 16:30:23 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 l10-20020a17090a850ab0290155b06f6267so2343343pjn.5
 for <qemu-arm@nongnu.org>; Fri, 30 Apr 2021 13:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4LOZdC1ItbQynZDOtyUtTS7T/flVKohWME+t/j4leKo=;
 b=OqouuTZeYzkZmv5DeNtksNqG4mz7iKqSX6Ko8pGmHfkOk0jEZ8Z5HdQQv/F8lixylw
 H6u79bTGyH1mEuew9lHwdfeiJfloFEwcHIeC8BC5mg7x8UMC+PiIIkQ3Pri652Fc4GH2
 lb2XfnuMPnh0n5BE6A18t1JwHNsVRs1mFAhEeOiDlOlhhuv9N6Eo6vkk7QoT506zfYOO
 21s+rcr8oz8HUNpcg7KNZdlQs6lssLO1Hs0j4YxEIlS4rVTMA+AR97UkmC2KClyzZ1mH
 27SJ5BShemlJCE2XRe2Ratql3rnKaJkFj9aeU6Ts9ZulkbwSM1WjZdcX/0UBDZ6h+Cqm
 hnOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4LOZdC1ItbQynZDOtyUtTS7T/flVKohWME+t/j4leKo=;
 b=ZaXJQ7J9Ds7k9gTy4rD70bGtilpC/ZYoSHE3X1Gj5THgYU7ilajmhBn70pyeKba7IG
 hwRjpXxbFH9bVBwsJiqwV4+StgNN1kbtegpmt/h3D51H4f+XOHK/V4PnyOItPyXWJD4+
 0Yxu0qj3vpX9Yz08LKtSdPc9tTxzlNqaQ0hF2vZd11IwB04dTKjPcsrz5g6POLKHyiBA
 R2AaM82PB9QMiS9Yxr4Wi58nGVPh1FcrrX9ABTVMcF5LmUmDafd+fUcAkCv8IUYL5iEN
 +wC5G5Vug4ciAISc2WeBwjguJqYzWAtrkJbFy6zKlO0tZvfEQxt0cAQ+uD4y8F3apK87
 7d9Q==
X-Gm-Message-State: AOAM530xXSxbHUZ6WBSuRFSM/86S+EDryoNjI+0lde9Cwzb4d8FtXHpU
 LAPMoLkeHFjXCR4g3eQwlJs9qw==
X-Received: by 2002:a17:90a:f491:: with SMTP id
 bx17mr15463073pjb.176.1619814584204; 
 Fri, 30 Apr 2021 13:29:44 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id q23sm3788781pgt.42.2021.04.30.13.29.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 13:29:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 53/82] target/arm: Implement SVE2 integer multiply-add
 (indexed)
Date: Fri, 30 Apr 2021 13:25:41 -0700
Message-Id: <20210430202610.1136687-54-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430202610.1136687-1-richard.henderson@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +DOHj1zDgxTL

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve.decode      |  8 ++++++++
 target/arm/translate-sve.c | 23 +++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 65cb0a2206..9bfaf737b7 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -783,6 +783,14 @@ SDOT_zzxw_d     01000100 11 1 ..... 000000 ..... .....   @rrxr_1 esz=3
 UDOT_zzxw_s     01000100 10 1 ..... 000001 ..... .....   @rrxr_2 esz=2
 UDOT_zzxw_d     01000100 11 1 ..... 000001 ..... .....   @rrxr_1 esz=3
 
+# SVE2 integer multiply-add (indexed)
+MLA_zzxz_h      01000100 0. 1 ..... 000010 ..... .....   @rrxr_3 esz=1
+MLA_zzxz_s      01000100 10 1 ..... 000010 ..... .....   @rrxr_2 esz=2
+MLA_zzxz_d      01000100 11 1 ..... 000010 ..... .....   @rrxr_1 esz=3
+MLS_zzxz_h      01000100 0. 1 ..... 000011 ..... .....   @rrxr_3 esz=1
+MLS_zzxz_s      01000100 10 1 ..... 000011 ..... .....   @rrxr_2 esz=2
+MLS_zzxz_d      01000100 11 1 ..... 000011 ..... .....   @rrxr_1 esz=3
+
 # SVE2 integer multiply (indexed)
 MUL_zzx_h       01000100 0. 1 ..... 111110 ..... .....   @rrx_3 esz=1
 MUL_zzx_s       01000100 10 1 ..... 111110 ..... .....   @rrx_2 esz=2
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 3f54636e11..4fdec08f46 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3866,6 +3866,29 @@ DO_SVE2_RRX(trans_MUL_zzx_d, gen_helper_gvec_mul_idx_d)
 
 #undef DO_SVE2_RRX
 
+static bool do_sve2_zzxz_ool(DisasContext *s, arg_rrxr_esz *a,
+                             gen_helper_gvec_4 *fn)
+{
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    return do_zzxz_ool(s, a, fn);
+}
+
+#define DO_SVE2_RRXR(NAME, FUNC) \
+    static bool NAME(DisasContext *s, arg_rrxr_esz *a)  \
+    { return do_sve2_zzxz_ool(s, a, FUNC); }
+
+DO_SVE2_RRXR(trans_MLA_zzxz_h, gen_helper_gvec_mla_idx_h)
+DO_SVE2_RRXR(trans_MLA_zzxz_s, gen_helper_gvec_mla_idx_s)
+DO_SVE2_RRXR(trans_MLA_zzxz_d, gen_helper_gvec_mla_idx_d)
+
+DO_SVE2_RRXR(trans_MLS_zzxz_h, gen_helper_gvec_mls_idx_h)
+DO_SVE2_RRXR(trans_MLS_zzxz_s, gen_helper_gvec_mls_idx_s)
+DO_SVE2_RRXR(trans_MLS_zzxz_d, gen_helper_gvec_mls_idx_d)
+
+#undef DO_SVE2_RRXR
+
 /*
  *** SVE Floating Point Multiply-Add Indexed Group
  */
-- 
2.25.1

