Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp745589lfr;
        Fri, 16 Apr 2021 14:37:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyjhn9kCzYf8BX+KZywcO4F7e6z0MtrotsWc/n2OZx8mH5S7LSBxJ4OJ0epWWA1Z6kDU3lT
X-Received: by 2002:a05:6e02:214e:: with SMTP id d14mr8772364ilv.142.1618609071924;
        Fri, 16 Apr 2021 14:37:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618609071; cv=none;
        d=google.com; s=arc-20160816;
        b=qtBTdF0kjuaQb1wRp96I3qeLpLV4pMz3A9xG70Xyo+naJ1atrvEYc54wP5ua+3VV6x
         t45XsOYA/WH5Zd/C2l5fM0I8T+obnTsoXytPL4QgWYzE3K1uQ/MSCYEdPCaFBo8R0uKF
         YXcSNcV4lBHHXDkq/ypl0KdkdArPGQa95RXbXkZiMIM+JYT3fbhFngTf76+gWy64iyXQ
         +4zpAYs3k6PINFwVAvYS+MImJovpiUPd57ocJY3PoJZrfjBpbV+c+oYvA8zNBlNd1j1A
         VSrvWyXIbvvRFU6SJxQMRrDx/GyD/+8iQSGgpVu9WTbGW1vpQMl4VQENANqCZAzwOHA6
         fWEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=mJ6X3+A6T4zH0IAmYnnf1DVj8KtUnubpSuPtkLtMp7I=;
        b=YjE0YSGn8or7IDRwRidWPongokSsXZcGpfDdkpmXDjnWjZ8uI2mwCtoB5D6k521E1c
         dfkIDX3s8+PHt00nIq/PFzPshFhxlgkNBJEBoPBEP/7rqkLCKUdXzxCa5mlOMGVTnTqF
         4/3j3DGAqIs7Tu7hYaBiBzJAKX54dDr0IPOIlVCi2M/0BKAJbjpltHRIFzmeOCXlF9Em
         CBG2jVJ2mf+xFiNClgzKURe1noDAyNcEBgbcBhUOljpUGA0DhwUmdl/n5oV+1JS04a/u
         hvrFcki9eXWLYLVF/TW7Mnz5oo0EQcDp8jRNBuBsGa4nIl2+Zt0B3x04xpjRqqTVHNr1
         LoPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tVyo3NjO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i20si3184229ila.16.2021.04.16.14.37.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Apr 2021 14:37:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tVyo3NjO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lXW9v-0006Vq-9f
	for alex.bennee@linaro.org; Fri, 16 Apr 2021 17:37:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVdZ-0005so-RA
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 17:04:25 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:33327)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXVdF-0001hv-A4
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 17:04:25 -0400
Received: by mail-pf1-x42f.google.com with SMTP id h11so1491825pfn.0
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 14:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mJ6X3+A6T4zH0IAmYnnf1DVj8KtUnubpSuPtkLtMp7I=;
 b=tVyo3NjOiKE8IS9oP/C9Cq66AmOGvskS6gtIic9iLnLxwb9gObsZ08fzDs4dh15h6m
 Lk2jL8UTK4n1cTlQ7dSoLdMLWaeIugKis91nqWSSDcBFwzXjMbZ9w/uePioP+JnNMuoz
 cRbczMs41Aq0RV4GXvph0R22Fn7EzrxMQC1nJWLJLv1zpXRHEiX94g+Ab3Nn6+SDC4G5
 7fDs+AqQrErNpqS2xPS9hQSKIqRnPPXPOlms8W5+jrSjM5UJ0DPaI/TMonkEuAnjEP6c
 9lABorKCkWFQCkdJGc7Tw4MrUHDfZcvqQv4KkODp5j4gyIXIlumrLHL7sPKg8rK3JSdg
 Hl0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mJ6X3+A6T4zH0IAmYnnf1DVj8KtUnubpSuPtkLtMp7I=;
 b=eq26Z0mawdJXgbLrv/9d0pYSVHsq3u2P+MMZLhEvt+J740vjPJi3P2XA4p7FgBParg
 8xiorMknctFV7IBZ3s9Fd9K4pR+W9FPAPvKEPqHnhCXTZC2LcS641E2Hs2xG8LdK/2hB
 /10qCbTgfiYyL6VPOR4KNNrPdmqPObiZhAm/LkJTraOwbWkCoysAt8tsF8s3Qw3vkIMc
 EiAoIRJQNY1sbgzaMWt8mtWmUsFRU8pIXgL/xQnso3bQtcTPctjOrBT4RGuEasfytnfW
 KeCWVqTzLxqtJTArSsDSTYM3oEbD6oIIFaxW4T7BHaIp7xhJC7sm6xUalUKtECHSZ3LS
 x06A==
X-Gm-Message-State: AOAM530k6Pj1jdPutHFGSPoByEt6HiQSdKUekjh1HtRzbgQNdhDo3hzN
 RTCFNn0dsdLyYwHMdCMXhus0eeXk3GFoeQ==
X-Received: by 2002:a05:6a00:15c6:b029:24e:9dd1:8813 with SMTP id
 o6-20020a056a0015c6b029024e9dd18813mr9342198pfu.80.1618607043668; 
 Fri, 16 Apr 2021 14:04:03 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id m9sm5766734pgt.65.2021.04.16.14.04.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 14:04:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 52/81] target/arm: Implement SVE2 integer multiply (indexed)
Date: Fri, 16 Apr 2021 14:02:11 -0700
Message-Id: <20210416210240.1591291-53-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416210240.1591291-1-richard.henderson@linaro.org>
References: <20210416210240.1591291-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4cpsYBucxAVb

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
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
index 2eb21b28e1..0de8445fb4 100644
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
 
+static bool do_sve2_zzx_ool(DisasContext *s, arg_rrx_esz *a,
+                            gen_helper_gvec_3 *fn)
+{
+    if (fn == NULL || !dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    if (sve_access_check(s)) {
+        unsigned vsz = vec_full_reg_size(s);
+        tcg_gen_gvec_3_ool(vec_full_reg_offset(s, a->rd),
+                           vec_full_reg_offset(s, a->rn),
+                           vec_full_reg_offset(s, a->rm),
+                           vsz, vsz, a->index, fn);
+    }
+    return true;
+}
+
+#define DO_SVE2_RRX(NAME, FUNC) \
+    static bool NAME(DisasContext *s, arg_rrx_esz *a)  \
+    { return do_sve2_zzx_ool(s, a, FUNC); }
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

