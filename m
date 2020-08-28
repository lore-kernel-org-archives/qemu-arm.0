Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp1694158lfc;
        Fri, 28 Aug 2020 11:44:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJygQWoBPLq74px9S1PinbHQqp+6Z43Il0TJ3IdnmTLyVV8hORbBBEklbUYDMMB6dq955FNW
X-Received: by 2002:a25:8250:: with SMTP id d16mr4420185ybn.402.1598640276698;
        Fri, 28 Aug 2020 11:44:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598640276; cv=none;
        d=google.com; s=arc-20160816;
        b=D1cRS5yG8cOf/Lstm+cDQwhSQsC3mCjWDewaVi875Zv2T16H5JVJ88b5YsbWBsbGqs
         z+tGpzLiBvXnXHquKXinU2QSbIjn7Dv7GqRJH27Ymj5t18ChQbL95qHFLfxnlKg2pxbr
         dsXgzmc5Jkw7SoyER2sD+LFjVN13h6oeAD7XUErY9XD2gH1Ove34N4SwQuATC5skXOBG
         VkWKCnBca5WFMSYJT3lAtBQu4Z3BnpRcWQ4JWrb+Z7cwiNNsd+iR5qyiCL94yfPhneu9
         Nva+rzdnXnymjJ0uH+FuFh7BZw/liJHG0Oitt478FXsLe2Ep5BwELsbiW1fpEzPiuQq0
         8nsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=cOh7GY0pCWe5s/t9AlUFMrvjleZvUswRo8NiK3ZWQJY=;
        b=Y2daBBZzBvu3JZzN0rsGWRkbYSyVFsORjxpVP1j4hrae3P4lzXOtjvYk/dZsBzLBsH
         t3i98wwtC3crsHtmHVdy7oLaBXl7v9oLAhKagDEvR8/BvaUSHQwXYH57qgCn12uC0Qrw
         Q2gkZdUlNWeLF9xfQ4114E6ZR5S7xjRm9/7L/PTmRqAnLSpGKSYL1c572gN/fNiCnsEM
         R9Mvqdeb/rAg/b8afiuMuxYdbiZ0Rsx8WMhX34Sq0zY5h7KBLrLSCgifAceTn/sjXQh1
         A2lL8A2V8QroGeRfd46sAkjU4uP4+rg+DzvElWrBqVURiHbY+TZbbKx3IpRWNHNetjdm
         Yzew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VJD8IUlk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r17si79233ybb.447.2020.08.28.11.44.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Aug 2020 11:44:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VJD8IUlk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kBjMa-0001ns-3H
	for alex.bennee@linaro.org; Fri, 28 Aug 2020 14:44:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kBjCn-0002hu-Df
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 14:34:29 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:32823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kBjCg-000608-Og
 for qemu-arm@nongnu.org; Fri, 28 Aug 2020 14:34:29 -0400
Received: by mail-wm1-x343.google.com with SMTP id y8so186628wma.0
 for <qemu-arm@nongnu.org>; Fri, 28 Aug 2020 11:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=cOh7GY0pCWe5s/t9AlUFMrvjleZvUswRo8NiK3ZWQJY=;
 b=VJD8IUlkhn6qJWaoowXbizmhXMnBHttNlMzj1KvM2qd0m1U2tli3ZMI/7DUWFqI4gC
 39lGyEODXGJJP3jitEObWf017Lq+sKw8S4nSaYkLxT3nfVfYnOTwS2FkFSVjRHy5o5lM
 QGUmX1XGuClMnUsMBUJ+wwJEvxmTjtdcUQ5b12cHEi+9Icbq68grjJw0SgU8U+rQYwm3
 RHvAKCn4FOjAXmBO5IuYbQc6uNCk02T7ySU7qwW5s3s6hVBNn6m0dh0Nreu6Te1wOHrI
 RHdWfNry4lE1Vpfv+xlp2YgmGbTeATqF5zeGf6z0faA/WLU/9+NeLuattmSvgxXJNmgh
 X/VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cOh7GY0pCWe5s/t9AlUFMrvjleZvUswRo8NiK3ZWQJY=;
 b=kjMZmLpHpFlALbRkj8e775Pl7CpUNyJ7aVfjAJto4i1Pu48Jf39P/JBt38/qJ9dktF
 77d7pWHD/8gehXUfw8QuiQPVZ+qfRL07STENbN8JW/vsbeL0xHN1ndp3mZ7ypHBm/drd
 Vd8qfxuIgSvGekT3FCTa7beWYvxEGd3VygcD1s5/M2YcrP1vWXdxE68/oZmLs3b8iALK
 zYg8gfOMgwTW2IUc8Nr9pldVV6ujMq6B19AyEz6863OKRqMugmWEqWc6UoJu1zvzFx27
 IoYZ4eBXydyE+mYwdtOuBizHLwkK/lFyFrYz4rkC5zGhNTF3FLYIBRy6f2nWlsxupyy6
 YAyA==
X-Gm-Message-State: AOAM532Bg246EMEIUysVTEV73/bNTmps8/QuyRp6Rpwbfv2ljbPqu9uu
 y14xZFMc/0PIkZOZEpFA3C+IfIIz2xw2FFQ1
X-Received: by 2002:a1c:f70e:: with SMTP id v14mr45064wmh.74.1598639660995;
 Fri, 28 Aug 2020 11:34:20 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id s20sm356251wmh.21.2020.08.28.11.34.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 11:34:20 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 20/45] target/arm: Implement new VFP fp16 insn VMOVX
Date: Fri, 28 Aug 2020 19:33:29 +0100
Message-Id: <20200828183354.27913-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200828183354.27913-1-peter.maydell@linaro.org>
References: <20200828183354.27913-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FPr2XPioLu93

The fp16 extension includes a new instruction VMOVX, which copies the
upper 16 bits of a 32-bit source VFP register into the lower 16
bits of the destination and zeroes the high half of the destination.
Implement it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/vfp-uncond.decode   |  3 +++
 target/arm/translate-vfp.c.inc | 25 +++++++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/target/arm/vfp-uncond.decode b/target/arm/vfp-uncond.decode
index 39dc8f6373a..8891ab3d549 100644
--- a/target/arm/vfp-uncond.decode
+++ b/target/arm/vfp-uncond.decode
@@ -75,5 +75,8 @@ VCVT        1111 1110 1.11 11 rm:2 .... 1010 op:1 1.0 .... \
 VCVT        1111 1110 1.11 11 rm:2 .... 1011 op:1 1.0 .... \
             vm=%vm_dp vd=%vd_sp sz=3
 
+VMOVX       1111 1110 1.11 0000 .... 1010 01 . 0 .... \
+            vd=%vd_sp vm=%vm_sp
+
 VINS        1111 1110 1.11 0000 .... 1010 11 . 0 .... \
             vd=%vd_sp vm=%vm_sp
diff --git a/target/arm/translate-vfp.c.inc b/target/arm/translate-vfp.c.inc
index bda3dd25136..4b26156eccc 100644
--- a/target/arm/translate-vfp.c.inc
+++ b/target/arm/translate-vfp.c.inc
@@ -3482,3 +3482,28 @@ static bool trans_VINS(DisasContext *s, arg_VINS *a)
     tcg_temp_free_i32(rd);
     return true;
 }
+
+static bool trans_VMOVX(DisasContext *s, arg_VINS *a)
+{
+    TCGv_i32 rm;
+
+    if (!dc_isar_feature(aa32_fp16_arith, s)) {
+        return false;
+    }
+
+    if (s->vec_len != 0 || s->vec_stride != 0) {
+        return false;
+    }
+
+    if (!vfp_access_check(s)) {
+        return true;
+    }
+
+    /* Set Vd to high half of Vm */
+    rm = tcg_temp_new_i32();
+    neon_load_reg32(rm, a->vm);
+    tcg_gen_shri_i32(rm, rm, 16);
+    neon_store_reg32(rm, a->vd);
+    tcg_temp_free_i32(rm);
+    return true;
+}
-- 
2.20.1

