Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp1693802lfc;
        Fri, 28 Aug 2020 11:43:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyVrLDSaMlpQQ7FPT2rWxJvCHtOT+NiDycq9mn7W2numXYBr+NNvKsJ6TKvIKnA+8vwnya3
X-Received: by 2002:a25:db11:: with SMTP id g17mr4537564ybf.37.1598640237604;
        Fri, 28 Aug 2020 11:43:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598640237; cv=none;
        d=google.com; s=arc-20160816;
        b=yFsHzxk4TqXC3wVJU54BA710CaUsCtsmuhokNyBdeqsv/00KZ/gmORXC5dR3QKGdiq
         sDRASh4YaclI2NFzbnaWCkwltlwc+H/1BKQvQwxQ0BUq7DTyFkRmXbouWmLJpLwsCrmy
         5eJ/gGT2HldCqDCRgK5G+vrxauoouhZj2E7VWaC1wkoEQoYxKWjNofmRhVFuK4p+Q2/F
         et6VU/BKyk+wpFxx0ebkixRjYQEDBZcxubse0+OZbWXDWhEUFYH0/wHIHdQB7xDkfSsf
         NLUL/U1DC9HtSU1Q2i3eT4MSTFzhZwkgsaBXT75weJ8fD9aVuL5uEyaALcbmUVPxK3sF
         W52A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=xRS9Xs/A7cPVwavP2/d7CO6TOTh4dxr4Fh4pdaLz/eQ=;
        b=bYi13jepvzw6ODN6FGX9c5QxYSfAvHFuf12rv/Z82f1oEIaDaaqd0ekhlNyZNnt2m+
         kwEqAHVHeQTxEH+Tjaccuvsw3vkG9Q/3c/lzoQKLmQhXLpr85Idu4v6AxV+mMy0FqHmp
         h/PDoq+Zml2BDOC9QTrn+nbTXCFt1bnOsdGr0o/CLrEayuBLIWkRko40waIkK2zAxLoh
         UC9wAW4pqTLV2Qb3FV4yIMllGmJXmn25S5AT9XwCgRHx/dYAxor84cOsbjbGoYLhM6dk
         naotNvnEHOjGNigqD+0duy5DHaABsYfZz8kUnifvcmm2XUvWLELHsMquPW+7iRL363Q7
         lRgg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A8HfjYAZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l131si88357ybf.213.2020.08.28.11.43.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Aug 2020 11:43:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A8HfjYAZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kBjLw-0008UQ-Uw
	for alex.bennee@linaro.org; Fri, 28 Aug 2020 14:43:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kBjCn-0002ha-D7
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 14:34:29 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:38679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kBjCi-00060w-QP
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 14:34:28 -0400
Received: by mail-wm1-x342.google.com with SMTP id t14so114711wmi.3
 for <qemu-devel@nongnu.org>; Fri, 28 Aug 2020 11:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=xRS9Xs/A7cPVwavP2/d7CO6TOTh4dxr4Fh4pdaLz/eQ=;
 b=A8HfjYAZwLPq0tRJ5qS8TzXe1/JhbJHag5h1dm2XNuM7VjCHSnFOIgjy1ehFf3+pvg
 RQhd8DekjEFX2I9k/97I+d6nkusgG+mSY+p68Eo/H5OwUn8qHVZQSom6XurqQwLhAQkg
 /lKBMDOu+GNpsRWWTjSNhqQrbVhKa3f5P9TaIaTBpQZaOtA0ibLroXfU7uuJLPHV3NWY
 m4CGt7v0CXrwtFLSkTzg7Yb8KR4mkP4c70yK+3o3D5fn7TAlkngLmVQ6b0G1D7XHyUgx
 G7aLhRPr0cR4jOTwPaz1uTCrk9ma3FT8Y5ZBnfA6QQIkIGu50RobUT8CDMA3A263XgLr
 TmtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xRS9Xs/A7cPVwavP2/d7CO6TOTh4dxr4Fh4pdaLz/eQ=;
 b=I0CGUXWioQYtG1XcjNp8cd28vJwJJjDhxQPgSKw8C6RTcGBl2kfapKrD25/8kElpUo
 yjTPOlW98A06mgNiwQ3cNqgfUcofBc+7Zxp73yglKw7MXuxfL8UjxbTg0EK64e567GAc
 Zb2e4yZXqLmXn6cRb8H/2rC3V0iVNb6hbGPczS9iPKJN1uba5jEuheUhvoCWT7Vx/cim
 0hx+nMDXDdMwstMcscqRGrjXk9bTEp2qCw48QaH1DjtMw+cWNjvL26Mmt5Lqx4GADsPn
 blfgr2zNbf6lSHajC1NJNPKMznoKCKYIzM2AkhC7rAXCB9BmqFZGSygfOK8fte9s2bji
 SuUg==
X-Gm-Message-State: AOAM531ufjvLs7fyTZugx4Quvt9Yb5LvZa2dbWtvAjPwdxEA+ltSnptq
 Enn/Tep9QrTQ3x4riLeogl+H/A==
X-Received: by 2002:a7b:c925:: with SMTP id h5mr52680wml.28.1598639663462;
 Fri, 28 Aug 2020 11:34:23 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id s20sm356251wmh.21.2020.08.28.11.34.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 11:34:22 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 22/45] fpu: Add float16 comparison functions
Date: Fri, 28 Aug 2020 19:33:31 +0100
Message-Id: <20200828183354.27913-23-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200828183354.27913-1-peter.maydell@linaro.org>
References: <20200828183354.27913-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 279jX267Tb7e

Add comparison functions for float16 to match the existing float32
and float64 ones:

 float16_eq()
 float16_le()
 float16_lt()
 float16_unordered()
 float16_eq_quiet()
 float16_le_quiet()
 float16_lt_quiet()
 float16_unordered_quiet()

These are all just convenience wrappers around float16_compare() and
float16_compare_quiet().  We will want these for AArch23 fp16
support.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/fpu/softfloat.h | 41 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/include/fpu/softfloat.h b/include/fpu/softfloat.h
index 659218b5c78..573fce99bc6 100644
--- a/include/fpu/softfloat.h
+++ b/include/fpu/softfloat.h
@@ -285,6 +285,47 @@ static inline float16 float16_set_sign(float16 a, int sign)
     return make_float16((float16_val(a) & 0x7fff) | (sign << 15));
 }
 
+static inline bool float16_eq(float16 a, float16 b, float_status *s)
+{
+    return float16_compare(a, b, s) == float_relation_equal;
+}
+
+static inline bool float16_le(float16 a, float16 b, float_status *s)
+{
+    return float16_compare(a, b, s) <= float_relation_equal;
+}
+
+static inline bool float16_lt(float16 a, float16 b, float_status *s)
+{
+    return float16_compare(a, b, s) < float_relation_equal;
+}
+
+static inline bool float16_unordered(float16 a, float16 b, float_status *s)
+{
+    return float16_compare(a, b, s) == float_relation_unordered;
+}
+
+static inline bool float16_eq_quiet(float16 a, float16 b, float_status *s)
+{
+    return float16_compare_quiet(a, b, s) == float_relation_equal;
+}
+
+static inline bool float16_le_quiet(float16 a, float16 b, float_status *s)
+{
+    return float16_compare_quiet(a, b, s) <= float_relation_equal;
+}
+
+static inline bool float16_lt_quiet(float16 a, float16 b, float_status *s)
+{
+    return float16_compare_quiet(a, b, s) < float_relation_equal;
+}
+
+static inline bool float16_unordered_quiet(float16 a, float16 b,
+                                           float_status *s)
+{
+    return float16_compare_quiet(a, b, s) == float_relation_unordered;
+}
+
 #define float16_zero make_float16(0)
 #define float16_half make_float16(0x3800)
 #define float16_one make_float16(0x3c00)
-- 
2.20.1

