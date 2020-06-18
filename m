Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1287849lfm;
        Wed, 17 Jun 2020 22:14:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxiQeqFxxJmJHLyIjfDKWq20CnyhAW67Nm9RVIrLlp0l3sVhPPfjEohQklO4zBwZwhRsvqF
X-Received: by 2002:a25:69c3:: with SMTP id e186mr3896215ybc.445.1592457286170;
        Wed, 17 Jun 2020 22:14:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592457286; cv=none;
        d=google.com; s=arc-20160816;
        b=GmFnyXBiGRL9/Y2BQxhy5c6n9Q1DmEh1rfUGdDAkRm0LgkcHtEdb3zKgHFpzXKXLVm
         mh85ZiFD7YNg60yr2SedWOUDSvTe5vMaD05RfhJYFGPZKvavoTxq3i+v6jO38IdfJk6t
         eXdvWKhOAxmkI/JLQZrjKeJTDnu54B8vC+tuafr0KSNGmhOl73KDMT9rvgU7THl30kDA
         lAw7DZGAUhKZtpFsvcl7JIKmsfRc6Je4Xe90WCRso6bG6bb80e/ZaS05McrcYuxGUEaz
         TCqWwU9tv4udUyMEZP5RaOkWLNCM1XTEa9ob9ooc1rKS/UyChS1eNUL468sXc809MtAH
         IGKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=2AEaqRGHie4sLJAa7vfg8ZzQs441Z5qTKGSMgtm3xJ8=;
        b=jAdd8+4VQD9IwrPpNq0zgKZPu0JeqpirueuaDzSLakEVyKiVYayYVMQPzk5t1r8K6J
         uV7r4PcVfEvzaOlcteNUFUiPsGJmHgfSHkzoxjTT5QdCgVtPor0riS+xkfR08VzuT6nb
         N03O7fGINBoIk+mDAhDgUSRC3YWje/c+zeUBaIO+BRIriBnrbAaUK7oRg3tUG1gOi0ww
         4qsDhmgSVNw9Chbbp+YLaHwzZOhiisIXZQwnCMWCR/gEpYz4W4V+KLxk1Xye16SMMihw
         +OIqdKQnih+AswVB1vAKrBmgXySohR9mq2DQI+NSCtS9srjcjZStzv/tSY/382e09vG0
         t8Ww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=B0FXXzwt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y4si1709926ybk.397.2020.06.17.22.14.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jun 2020 22:14:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=B0FXXzwt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlmsv-0003aF-Ek
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 01:14:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmEx-00074z-FP
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:33:27 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:32889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmEv-0003ez-NC
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:33:27 -0400
Received: by mail-pf1-x433.google.com with SMTP id b201so2217562pfb.0
 for <qemu-arm@nongnu.org>; Wed, 17 Jun 2020 21:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2AEaqRGHie4sLJAa7vfg8ZzQs441Z5qTKGSMgtm3xJ8=;
 b=B0FXXzwt7Z/UgkgydWQKdyo7NKCXQ9Oj0eKbnvGjQbRIg2WXcZKpXiQXkE+9SLxWRL
 5Dl9JxhuJwyQeqOl+gj8tgxH+5fai6F116y3b97RtcctIIhP8q/G9tbyV9A0AZhfz9dh
 R6snUYqXsa9zUnJ8ORoQn3ZTu2nGXNapxlx/IJ6uoMVocqvChl/9R+PgudDUwxiYjVV0
 3MTT4ZpAgn6gOEUXggqWpgv8Ztgt6dQJ/U5UCLydjAq+StrqJKUoIpItM6sBU0fmMWy8
 ey9Y3TpWeoOf+uw57TISKB3NckIc4Sghfba/2LGTNUNakmDQCDgreD1foJDMdxJ5Kni3
 8JYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2AEaqRGHie4sLJAa7vfg8ZzQs441Z5qTKGSMgtm3xJ8=;
 b=oRTW7IYPzWvIdUEzfEXWjT9QUxxtRbGTLN2VmKjomIpCWxB5h6Tm7Qib0FW/J/dAfX
 tKnJwNZ5xt2H9cIEg89Nq0/UizC1pQ/jXMjkOWAUy59Sm0HFbGGBZbXQt4fm/w2HoWtw
 VzrL76pYsUP7XMLTenXyNCig2Jjcuz7aFd0KYcpDT5AeJ7Iq4jWaQYU0RuZp5t1FbGnS
 5S438NnsbPY8t6hZqe6nM7/yIvET0Hl5u5ou0kdBvw5v3S7Bt81KlzQVMEF+UbEWSkn8
 mumvhddZPpfzV/P8saap2D34k0+9PFy6C8DUGpPp/RIGRwAVqVh2pmB+trO5e12CII90
 vJ/Q==
X-Gm-Message-State: AOAM531ecSQBO23cYfODY5ekzU93E7OOoeSafVdMRPlLLkvlMz1sVFo/
 Gvk6ZipUM1AtUmBoCEp7m06/Jg==
X-Received: by 2002:a63:925a:: with SMTP id s26mr1835530pgn.21.1592454804200; 
 Wed, 17 Jun 2020 21:33:24 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id q22sm1288212pfg.192.2020.06.17.21.33.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 21:33:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 091/100] target/arm: Implement SVE2 FCVTLT
Date: Wed, 17 Jun 2020 21:26:35 -0700
Message-Id: <20200618042644.1685561-92-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618042644.1685561-1-richard.henderson@linaro.org>
References: <20200618042644.1685561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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
X-TUID: FSrhzHNF+iAE

From: Stephen Long <steplong@quicinc.com>

Signed-off-by: Stephen Long <steplong@quicinc.com>
Message-Id: <20200428174332.17162-3-steplong@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    |  5 +++++
 target/arm/sve.decode      |  2 ++
 target/arm/sve_helper.c    | 23 +++++++++++++++++++++++
 target/arm/translate-sve.c | 16 ++++++++++++++++
 4 files changed, 46 insertions(+)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 252344bda6..935655d07a 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -2251,3 +2251,8 @@ DEF_HELPER_FLAGS_5(sve2_fcvtnt_sh, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_5(sve2_fcvtnt_ds, TCG_CALL_NO_RWG,
                    void, ptr, ptr, ptr, ptr, i32)
+
+DEF_HELPER_FLAGS_5(sve2_fcvtlt_hs, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
+DEF_HELPER_FLAGS_5(sve2_fcvtlt_sd, TCG_CALL_NO_RWG,
+                   void, ptr, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index 9ba4bb476e..abe26f2424 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1576,4 +1576,6 @@ RAX1            01000101 00 1 ..... 11110 1 ..... .....  @rd_rn_rm_e0
 
 ### SVE2 floating-point convert precision odd elements
 FCVTNT_sh       01100100 10 0010 00 101 ... ..... .....  @rd_pg_rn_e0
+FCVTLT_hs       01100100 10 0010 01 101 ... ..... .....  @rd_pg_rn_e0
 FCVTNT_ds       01100100 11 0010 10 101 ... ..... .....  @rd_pg_rn_e0
+FCVTLT_sd       01100100 11 0010 11 101 ... ..... .....  @rd_pg_rn_e0
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 7a5b0d37c5..8bfc9393a1 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -7194,3 +7194,26 @@ void HELPER(NAME)(void *vd, void *vn, void *vg, void *status, uint32_t desc)  \
 
 DO_FCVTNT(sve2_fcvtnt_sh, uint32_t, uint16_t, H1_4, H1_2, sve_f32_to_f16)
 DO_FCVTNT(sve2_fcvtnt_ds, uint64_t, uint32_t, H1_4, H1_2, float64_to_float32)
+
+#define DO_FCVTLT(NAME, TYPEW, TYPEN, HW, HN, OP)                             \
+void HELPER(NAME)(void *vd, void *vn, void *vg, void *status, uint32_t desc)  \
+{                                                                             \
+    intptr_t i = simd_oprsz(desc);                                            \
+    uint64_t *g = vg;                                                         \
+    do {                                                                      \
+        uint64_t pg = g[(i - 1) >> 6];                                        \
+        do {                                                                  \
+            i -= sizeof(TYPEW);                                               \
+            if (likely((pg >> (i & 63)) & 1)) {                               \
+                TYPEN nn = *(TYPEN *)(vn + HN(i + sizeof(TYPEN)));            \
+                *(TYPEW *)(vd + HW(i)) = OP(nn, status);                      \
+            }                                                                 \
+        } while (i & 63);                                                     \
+    } while (i != 0);                                                         \
+}
+
+DO_FCVTLT(sve2_fcvtlt_hs, uint32_t, uint16_t, H1_4, H1_2, sve_f16_to_f32)
+DO_FCVTLT(sve2_fcvtlt_sd, uint64_t, uint32_t, H1_4, H1_2, float32_to_float64)
+
+#undef DO_FCVTLT
+#undef DO_FCVTNT
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 3c145857db..7b20c65778 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -7796,3 +7796,19 @@ static bool trans_FCVTNT_ds(DisasContext *s, arg_rpr_esz *a)
     }
     return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve2_fcvtnt_ds);
 }
+
+static bool trans_FCVTLT_hs(DisasContext *s, arg_rpr_esz *a)
+{
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve2_fcvtlt_hs);
+}
+
+static bool trans_FCVTLT_sd(DisasContext *s, arg_rpr_esz *a)
+{
+    if (!dc_isar_feature(aa64_sve2, s)) {
+        return false;
+    }
+    return do_zpz_ptr(s, a->rd, a->rn, a->pg, false, gen_helper_sve2_fcvtlt_sd);
+}
-- 
2.25.1

