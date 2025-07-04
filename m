Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1261113dyc;
        Fri, 4 Jul 2025 07:41:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW11x+CYahoT8ZCWOZkEB3VcXTj3DuEPkX+/GyfzPpqjZXRsHLAhbafVP0iMOk1YVyEil7BQNKGew64Fw==@linaro.org
X-Google-Smtp-Source: AGHT+IGLc34FZDk37bsuBDoMSVNkqzfjqiT5nOr3pCb8YjIdw/Pen8vbOgEdCugWXb7QtuF3nGOc
X-Received: by 2002:a05:6102:30c7:20b0:4f3:1d:6b49 with SMTP id ada2fe7eead31-4f3001d7066mr531583137.20.1751640062963;
        Fri, 04 Jul 2025 07:41:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751640062; cv=none;
        d=google.com; s=arc-20240605;
        b=kfXTeuUmnEtEiDvoPR0UlCw4xu+dy7q2q8rCxlBlpIfi/B8bx6Pex/n4ck8zxA7rK/
         0KqMTZCo2zZvr5g9OTE2Qo23QntpGaCgi1UAchOp2ZStwWuSmTc1J0X7+ybubKWkUhe6
         Q2zxmcKiWgAtxd2NSitNjWPEzUkdx+G7WTUYOaNchYfWH/cHi+NzgHZsgc9PSFmuku5m
         LyZbZrBUq5KACt4/muyt2Q4zXf35yoJGVN6512yE8fIcwFt1L2GUWElXmJcFerweggne
         c1a1XSA4qMqk0fa55SxOx13+2GzAwDOMKuMIMrlhAdGbWFlHpJhXQwXctnR3mEhVBa5q
         PEUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=AxAxIZ6VFbRMgHTAjv0FjgNRbnxh2+Wy+VDRxyj4mIo=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=a9J17VZHy5hDTvW5JQxvz4yL2Yw1+EuKfU94aNhYLQdwN4GXvrBUWIgl+j+tgA7Nqo
         8LgCbohChhhOe6whnjMJQa9x2PpBW3JYP0Cw65LmgkWX6xcmUKbglHs2o39gxttHrwdm
         Chmk38Q/nVKaEzkMZz994VOYUX/aa4NiwIO2GY1fHE+aZX3KfrlCAJanUK92q2WhGcKb
         rRog/03bAWh0ZNE3iU+7vMiuS44f7k/p8fLcv+gbmkqidCJSzBfXrkco53AayV0WczUG
         F6+N/ka56+KJSUNFZIJqh0A7vQ1jmkEVRo4Wjkm+9qz4Ia1MBIlUe8imHq6nQ9Jqv2zE
         APdA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mQidaMWv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4f2ea782a30si799486137.642.2025.07.04.07.41.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 07:41:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mQidaMWv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXhUM-0003Sx-S8; Fri, 04 Jul 2025 10:34:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhPG-0002WM-U6
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:28:52 -0400
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhPD-0001Sb-Nc
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:28:50 -0400
Received: by mail-ot1-x32f.google.com with SMTP id
 46e09a7af769-72c09f8369cso381135a34.3
 for <qemu-arm@nongnu.org>; Fri, 04 Jul 2025 07:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751639326; x=1752244126; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AxAxIZ6VFbRMgHTAjv0FjgNRbnxh2+Wy+VDRxyj4mIo=;
 b=mQidaMWvw2HT0j05e7FES9Y+lshRgPTRVofTEQzFgMTmTzm16IB3H4FYnP4NDNHyM3
 EXcDGL10hkCTM7oso98YG+OqMuM+FTqv6PD0GwwiUMoC+kPp1kLXW3N7LwDGWHnPuTo/
 kelv5YlSLEhcfbFHH0mxBtGGzZd4anMnJRI2D3lnbpZwNmFWrkfdpybKaIxiJcjZl7ID
 0WnQOav5jJOLetw9P9iE2O6hcIztyqi5aXsWbuC17QuH7rqbe4XrTvJxN63ZmICg1kQo
 9/Z1c3xr6K6lls66JklCtCmdJzToKVzY57fcjgFj898qTcS2/ow7k+xSn77CtP8m6OKr
 vjig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751639326; x=1752244126;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AxAxIZ6VFbRMgHTAjv0FjgNRbnxh2+Wy+VDRxyj4mIo=;
 b=WSrXCT0jw7NC2O+VlrmMceJHMNZTuQaaW44dYkSAqIPBFhlArPnG7HKLzDpF2i1wNy
 2+3ecvLYJyf/bP5x/iOgwBEgGIxd8+1GSgdTJt2f2+WsTIrBUOF+YWY5HkfcGrtWGecy
 hjjTcZTrGy3wnR2IXraJIkTCzvDr8VonUNaexsOqe4LNu1eKC5E78CukxM3wAF6gAxlW
 a/iE4QXd+rxs3MR64x3V92QuEcy58gAjnJIg+SpgPqf5O2al5oNd7OhmYsyiAUwTJF3V
 2lNjmF7m0UFQk6nu6YX5CmhXhKgdGylPVE6lck6dOeBn7qaYsfAQt3LrNDh71UdPsFEj
 rJ0Q==
X-Gm-Message-State: AOJu0Yy4cwLkb3GY2MPwWZ3qpkwNCJaD8FV1qlwpYkgpjtrgzNvBL9Y7
 6gYi/WNaYJtI5SfNv3jzQpxct4sV/EPF4yHvCD5ELP2dWZ5bPye14PqEj1VRUfKAuxzHpTftv0I
 WVHdXzdg=
X-Gm-Gg: ASbGncuRp4GsubSA8EkldC/6qzlm7g6OhOkBXt38iUXltr0scSiMyw2ZNIVrkCbbrXt
 ySwievWHF2puR5qVbuKENYUjCdqVOQGLUc64KdCjt/BiPbscIoLCW6yfHIEIVTdsf1oDLRWs5rE
 aflSvQmi+n25+yZRM3nHUfP9xbolnZgjQVQIJ8WWN/jGOo2wwbQnVpAo5jeuOM61wvQ4/PfAOMD
 SSERMm7hPY4x5GhCE7te+wRGqRxdn8LNZ6/1XkGnfzQPM5F0ugLKvQID/XAp4ncf9h4cyVgk+ZJ
 pWQWMMH9UTUS48W648PSMamIzxr8ZEHRHOhHOS3Cw2HLWNN1u/cUoBzy4OC0pX5/Q44WtQTudiQ
 XzUT7n6lY06L+3l3okc+fYs3+JbZfiJpk2xC17N7JRfKvKAM+
X-Received: by 2002:a05:6871:69c4:b0:2d6:af0:8d8e with SMTP id
 586e51a60fabf-2f79696b293mr1780664fac.2.1751639326490; 
 Fri, 04 Jul 2025 07:28:46 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2f78ff55633sm531448fac.20.2025.07.04.07.28.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 07:28:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v4 087/108] target/arm: Implement CNTP (predicate as counter)
 for SME2/SVE2p1
Date: Fri,  4 Jul 2025 08:20:50 -0600
Message-ID: <20250704142112.1018902-88-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704142112.1018902-1-richard.henderson@linaro.org>
References: <20250704142112.1018902-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: LsapdxQUPMv3

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/helper-sve.h    |  1 +
 target/arm/tcg/sve_helper.c    | 21 +++++++++++++++++++++
 target/arm/tcg/translate-sve.c | 30 ++++++++++++++++++++++++++++++
 target/arm/tcg/sve.decode      |  3 ++-
 4 files changed, 54 insertions(+), 1 deletion(-)

diff --git a/target/arm/tcg/helper-sve.h b/target/arm/tcg/helper-sve.h
index 906da384dc..733828a880 100644
--- a/target/arm/tcg/helper-sve.h
+++ b/target/arm/tcg/helper-sve.h
@@ -937,6 +937,7 @@ DEF_HELPER_FLAGS_4(sve_brkn, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
 DEF_HELPER_FLAGS_4(sve_brkns, TCG_CALL_NO_RWG, i32, ptr, ptr, ptr, i32)
 
 DEF_HELPER_FLAGS_3(sve_cntp, TCG_CALL_NO_RWG, i64, ptr, ptr, i32)
+DEF_HELPER_FLAGS_2(sve2p1_cntp_c, TCG_CALL_NO_RWG_SE, i64, i32, i32)
 
 DEF_HELPER_FLAGS_3(sve_whilel, TCG_CALL_NO_RWG, i32, ptr, i32, i32)
 DEF_HELPER_FLAGS_3(sve_whileg, TCG_CALL_NO_RWG, i32, ptr, i32, i32)
diff --git a/target/arm/tcg/sve_helper.c b/target/arm/tcg/sve_helper.c
index 6512df54e6..def841fd52 100644
--- a/target/arm/tcg/sve_helper.c
+++ b/target/arm/tcg/sve_helper.c
@@ -4178,6 +4178,27 @@ uint64_t HELPER(sve_cntp)(void *vn, void *vg, uint32_t pred_desc)
     return sum;
 }
 
+uint64_t HELPER(sve2p1_cntp_c)(uint32_t png, uint32_t desc)
+{
+    int pl = FIELD_EX32(desc, PREDDESC, OPRSZ);
+    int vl = pl * 8;
+    unsigned v_esz = FIELD_EX32(desc, PREDDESC, ESZ);
+    int lg2_width = FIELD_EX32(desc, PREDDESC, DATA) + 1;
+    DecodeCounter p = decode_counter(png, vl, v_esz);
+    unsigned maxelem = (vl << lg2_width) >> v_esz;
+    unsigned count = p.count;
+
+    if (p.invert) {
+        if (count >= maxelem) {
+            return 0;
+        }
+        count = maxelem - count;
+    } else {
+        count = MIN(count, maxelem);
+    }
+    return count >> p.lg2_stride;
+}
+
 /* C.f. Arm pseudocode EncodePredCount */
 static uint64_t encode_pred_count(uint32_t elements, uint32_t count,
                                   uint32_t esz, bool invert)
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 079d310960..53db8851bf 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -3052,6 +3052,36 @@ static bool trans_CNTP(DisasContext *s, arg_CNTP *a)
     return true;
 }
 
+static bool trans_CNTP_c(DisasContext *s, arg_CNTP_c *a)
+{
+    TCGv_i32 t_png;
+    uint32_t desc = 0;
+
+    if (dc_isar_feature(aa64_sve2p1, s)) {
+        if (!sve_access_check(s)) {
+            return true;
+        }
+    } else if (dc_isar_feature(aa64_sme2, s)) {
+        if (!sme_sm_enabled_check(s)) {
+            return true;
+        }
+    } else {
+        return false;
+    }
+
+    t_png = tcg_temp_new_i32();
+    tcg_gen_ld16u_i32(t_png, tcg_env,
+                      pred_full_reg_offset(s, a->rn) ^
+                      (HOST_BIG_ENDIAN ? 6 : 0));
+
+    desc = FIELD_DP32(desc, PREDDESC, OPRSZ, pred_full_reg_size(s));
+    desc = FIELD_DP32(desc, PREDDESC, ESZ, a->esz);
+    desc = FIELD_DP32(desc, PREDDESC, DATA, a->vl);
+
+    gen_helper_sve2p1_cntp_c(cpu_reg(s, a->rd), t_png, tcg_constant_i32(desc));
+    return true;
+}
+
 static bool trans_INCDECP_r(DisasContext *s, arg_incdec_pred *a)
 {
     if (!dc_isar_feature(aa64_sve, s)) {
diff --git a/target/arm/tcg/sve.decode b/target/arm/tcg/sve.decode
index 0df3312739..db16849731 100644
--- a/target/arm/tcg/sve.decode
+++ b/target/arm/tcg/sve.decode
@@ -784,7 +784,8 @@ BRKN            00100101 0. 01100001 .... 0 .... 0 ....         @pd_pg_pn_s
 ### SVE Predicate Count Group
 
 # SVE predicate count
-CNTP            00100101 .. 100 000 10 .... 0 .... .....        @rd_pg4_pn
+CNTP            00100101 ..    100 000 10 ....     0 .... ..... @rd_pg4_pn
+CNTP_c          00100101 esz:2 100 000 10 000 vl:1 1 rn:4 rd:5
 
 # SVE inc/dec register by predicate count
 INCDECP_r       00100101 .. 10110 d:1 10001 00 .... .....     @incdec_pred u=1
-- 
2.43.0

