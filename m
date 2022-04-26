Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp368168lfu;
        Tue, 26 Apr 2022 09:50:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyE6nCS0Fmqi+Z53kRvraGluvDQyCTT8CyVrxlN6GS7NklmKwk0jSqbqJcUfYc+RYSUE3Z2
X-Received: by 2002:a81:ad1f:0:b0:2f4:da5b:5133 with SMTP id l31-20020a81ad1f000000b002f4da5b5133mr23473914ywh.105.1650991820076;
        Tue, 26 Apr 2022 09:50:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650991820; cv=none;
        d=google.com; s=arc-20160816;
        b=mcrjjl21055+W4/CQWBEcSWJgmwzaE87JQ7Jyewh4XHOf0/mEFNpndSrfRuM9cTFN5
         1LqtYgc9RllPaAhoRyGpAQtJsQCSqmiS1iD+Q+8chP3Sy4Wf1fGPJFHVSD0UFaCanAvF
         N8/7VVFAIQ9HurpsQ36T9po9TDRvlt7kN39w/6iXq+MZ61J5AKKiLXDCceReN36CyBsQ
         xFKt6ebdS3Iwb+JzWqopsw3Dsr751qep+KQhufnJBoYiWn91Qp6/MMtROTWI8jfG5IjD
         +CDSA2ikrdXN0giDyg0ssCpYQ2tH0YDI/sDYCQfZBeZbB78KP8qEJPbLiEYIgibKNX8o
         ttYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Wz/sQ3opM+63UBKCObMqywBPZke4KVXsahzdcx00DUk=;
        b=LS0GwiAVce7OZCK8UJng4RVcbXwh5pd6goV9fbe4LBtdeuyJ4mcUs6OXZnKQXDVhiH
         RmcMalh+7zOudeo8Wtb/koOD5tbLCD7yBZtlqhAG9/NkpcouGiQYKC/t1HgkUcCqqQm+
         MbR45/+ryY9AG0FJxc7nbDpTgFtfCMA/KljdiCzTNXlEuVtAZpy7EPl3snRnHz9oLXYc
         pi1QLQSgWnQ49dSJRvjr/rW8ivA3UrrLGE5JbVF8QWfsbXgAC8NPj65Vn2GaPNuyRtNe
         BFSi2wT1RrIDFaCa+CDYAPAqiGlSBn76xfDLGIgEkJt7WtqQKmMJENW99EwCtpKgmwsW
         x9IA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y9lEghH8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n2-20020a254002000000b00647b31ffe75si8615471yba.566.2022.04.26.09.50.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Apr 2022 09:50:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y9lEghH8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1njOOJ-0007Kc-FJ
	for alex.bennee@linaro.org; Tue, 26 Apr 2022 12:50:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5t-00035e-75
 for qemu-arm@nongnu.org; Tue, 26 Apr 2022 12:31:21 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:43766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5n-0003sw-VT
 for qemu-arm@nongnu.org; Tue, 26 Apr 2022 12:31:15 -0400
Received: by mail-pf1-x42c.google.com with SMTP id y14so17663680pfe.10
 for <qemu-arm@nongnu.org>; Tue, 26 Apr 2022 09:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Wz/sQ3opM+63UBKCObMqywBPZke4KVXsahzdcx00DUk=;
 b=Y9lEghH8yifuMykg/i4TZSaD8tQWOqq6PSAVXLaLfaqfjKmhaQMlTdmzTbxv5nwEao
 nl3s40rkL2hZFJSPu+ji5EtzMb7cUfxkvTAXRm8io02wnNOdGYn/XBQG0ja22Wr5oJQu
 blqprpnz3g8A4aImSWl+3QyAg2ic/yErkmZUK8PmoOpwXk0kVc8E2Qg8kwr3ZEbtmtoN
 2EbScE0ZttHOPaDS8/ztLumLkjLa+8ET5dF56v6QGPm+fPSrky+NsRH1TwHNjL4pU/Mm
 YygR1MeiA8gDhcerzbNE+Oa9NkpizT89Zxw3ZxASMUD9UAc040HtI4Z5ILIDINvrI13p
 5PQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Wz/sQ3opM+63UBKCObMqywBPZke4KVXsahzdcx00DUk=;
 b=AupKQ9oq8lELHAl9TVuYFIjBMOmBJYLFzaOkpYPjYk/PnEPuUeXtvNPaFqvdLmgr5C
 WKkn9B4iCdD89UtbNtST0334VK6qRZ23F0fCtySoe9ZPqGlnZBNh5Jw/hnSKHc5W1PBe
 Sg4NZZZlM9c7LvYQ+K44Vq1rBKSKQQyIqG0Nb5342Tni319K95KQoBYT1o+ClpJQ7z5S
 IzYApT/PQWD6ykyvm/rvYneqwfPI7Jbism1O7gMZljSKT86Mj5QTK+fDkLxSNy7qjYVq
 vv1hHB7FQsJ1Z7z/xqKoWDN2sraGgkcnSxgex84GsFE4ziWFnNFNy6Ys0VbyaA25ESsY
 YjRQ==
X-Gm-Message-State: AOAM530dzM5GBiZFjm16xRGll/2g/wxDQBUuew8XTvE9Xp/8T5TpVcwB
 FyeKRBd3GPAcQ2lDwptIu1hDQOKpzpQH9w==
X-Received: by 2002:a63:cf0c:0:b0:380:fb66:fa2a with SMTP id
 j12-20020a63cf0c000000b00380fb66fa2amr20486873pgg.273.1650990668680; 
 Tue, 26 Apr 2022 09:31:08 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 y131-20020a626489000000b00505a8f36965sm15655813pfb.184.2022.04.26.09.31.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:31:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 25/47] target/arm: Use tcg_constant for vector shift expanders
Date: Tue, 26 Apr 2022 09:30:21 -0700
Message-Id: <20220426163043.100432-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426163043.100432-1-richard.henderson@linaro.org>
References: <20220426163043.100432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DVex2JA1LJw3

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 27 +++++++++------------------
 1 file changed, 9 insertions(+), 18 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 2e4165be3d..9539d2e8ca 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -2996,9 +2996,8 @@ void gen_gvec_sqrdmlsh_qc(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
     }                                                                   \
     static void gen_##NAME##0_vec(unsigned vece, TCGv_vec d, TCGv_vec a) \
     {                                                                   \
-        TCGv_vec zero = tcg_const_zeros_vec_matching(d);                \
+        TCGv_vec zero = tcg_constant_vec_matching(d, vece, 0);          \
         tcg_gen_cmp_vec(COND, vece, d, a, zero);                        \
-        tcg_temp_free_vec(zero);                                        \
     }                                                                   \
     void gen_gvec_##NAME##0(unsigned vece, uint32_t d, uint32_t m,      \
                             uint32_t opr_sz, uint32_t max_sz)           \
@@ -3988,8 +3987,8 @@ void gen_ushl_i32(TCGv_i32 dst, TCGv_i32 src, TCGv_i32 shift)
     TCGv_i32 rval = tcg_temp_new_i32();
     TCGv_i32 lsh = tcg_temp_new_i32();
     TCGv_i32 rsh = tcg_temp_new_i32();
-    TCGv_i32 zero = tcg_const_i32(0);
-    TCGv_i32 max = tcg_const_i32(32);
+    TCGv_i32 zero = tcg_constant_i32(0);
+    TCGv_i32 max = tcg_constant_i32(32);
 
     /*
      * Rely on the TCG guarantee that out of range shifts produce
@@ -4007,8 +4006,6 @@ void gen_ushl_i32(TCGv_i32 dst, TCGv_i32 src, TCGv_i32 shift)
     tcg_temp_free_i32(rval);
     tcg_temp_free_i32(lsh);
     tcg_temp_free_i32(rsh);
-    tcg_temp_free_i32(zero);
-    tcg_temp_free_i32(max);
 }
 
 void gen_ushl_i64(TCGv_i64 dst, TCGv_i64 src, TCGv_i64 shift)
@@ -4017,8 +4014,8 @@ void gen_ushl_i64(TCGv_i64 dst, TCGv_i64 src, TCGv_i64 shift)
     TCGv_i64 rval = tcg_temp_new_i64();
     TCGv_i64 lsh = tcg_temp_new_i64();
     TCGv_i64 rsh = tcg_temp_new_i64();
-    TCGv_i64 zero = tcg_const_i64(0);
-    TCGv_i64 max = tcg_const_i64(64);
+    TCGv_i64 zero = tcg_constant_i64(0);
+    TCGv_i64 max = tcg_constant_i64(64);
 
     /*
      * Rely on the TCG guarantee that out of range shifts produce
@@ -4036,8 +4033,6 @@ void gen_ushl_i64(TCGv_i64 dst, TCGv_i64 src, TCGv_i64 shift)
     tcg_temp_free_i64(rval);
     tcg_temp_free_i64(lsh);
     tcg_temp_free_i64(rsh);
-    tcg_temp_free_i64(zero);
-    tcg_temp_free_i64(max);
 }
 
 static void gen_ushl_vec(unsigned vece, TCGv_vec dst,
@@ -4132,8 +4127,8 @@ void gen_sshl_i32(TCGv_i32 dst, TCGv_i32 src, TCGv_i32 shift)
     TCGv_i32 rval = tcg_temp_new_i32();
     TCGv_i32 lsh = tcg_temp_new_i32();
     TCGv_i32 rsh = tcg_temp_new_i32();
-    TCGv_i32 zero = tcg_const_i32(0);
-    TCGv_i32 max = tcg_const_i32(31);
+    TCGv_i32 zero = tcg_constant_i32(0);
+    TCGv_i32 max = tcg_constant_i32(31);
 
     /*
      * Rely on the TCG guarantee that out of range shifts produce
@@ -4152,8 +4147,6 @@ void gen_sshl_i32(TCGv_i32 dst, TCGv_i32 src, TCGv_i32 shift)
     tcg_temp_free_i32(rval);
     tcg_temp_free_i32(lsh);
     tcg_temp_free_i32(rsh);
-    tcg_temp_free_i32(zero);
-    tcg_temp_free_i32(max);
 }
 
 void gen_sshl_i64(TCGv_i64 dst, TCGv_i64 src, TCGv_i64 shift)
@@ -4162,8 +4155,8 @@ void gen_sshl_i64(TCGv_i64 dst, TCGv_i64 src, TCGv_i64 shift)
     TCGv_i64 rval = tcg_temp_new_i64();
     TCGv_i64 lsh = tcg_temp_new_i64();
     TCGv_i64 rsh = tcg_temp_new_i64();
-    TCGv_i64 zero = tcg_const_i64(0);
-    TCGv_i64 max = tcg_const_i64(63);
+    TCGv_i64 zero = tcg_constant_i64(0);
+    TCGv_i64 max = tcg_constant_i64(63);
 
     /*
      * Rely on the TCG guarantee that out of range shifts produce
@@ -4182,8 +4175,6 @@ void gen_sshl_i64(TCGv_i64 dst, TCGv_i64 src, TCGv_i64 shift)
     tcg_temp_free_i64(rval);
     tcg_temp_free_i64(lsh);
     tcg_temp_free_i64(rsh);
-    tcg_temp_free_i64(zero);
-    tcg_temp_free_i64(max);
 }
 
 static void gen_sshl_vec(unsigned vece, TCGv_vec dst,
-- 
2.34.1

