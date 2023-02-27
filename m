Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4296374ejc;
        Sun, 26 Feb 2023 21:41:47 -0800 (PST)
X-Google-Smtp-Source: AK7set/dx06uVtvDerS89lquvuYA6fT2A+1v1zHAPnP1k7dHnPEh8rmi9knah7WC8H1CXHWJxUSi
X-Received: by 2002:a05:622a:1998:b0:3bf:bb92:76bb with SMTP id u24-20020a05622a199800b003bfbb9276bbmr17813215qtc.40.1677476507278;
        Sun, 26 Feb 2023 21:41:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677476507; cv=none;
        d=google.com; s=arc-20160816;
        b=JHg8i8+qPDX0DvJXiBp48LIwssy122pCGleUBpbA3sNaW0tC4trDmsUfMavGr2Y+hE
         FJL1wjLoT34d3KeAvPHbQRViTH+GwaXEX1wJdUn6PyMXZT7m1vD9Ql1HAcp08ztuKmTt
         rsEzkYtlu/JXTbcY+jog4l6QVTcEmHxv5YXEbgNKGyBZ7FriogQqDYQaptn9AlEdwHrg
         4+SwfIB8j86kYImOlo4ap/Z9FLEA/o99i1BfB0tWGH4UfP7uGg/sNp9lAa7Bjv4QcUvs
         w/Ybwu+QcLYdGd6c8dnblrT0ReroRa+wb46z7QNpKOLde0z1O/YTW5iUUWzTHI7q+4a/
         58qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=VjZP4LY1Wxefy+0rLrks1q4QR8IjH+TMsA5bjteWWKA=;
        b=BidALTWlI3KV90goSIh3KnOoeGRSEG4hv6oCqckgVKD12qRpc5hUfMwvOQUVxMhLpD
         UVYySazrf+Gnz+PxNhVJzIAKvYuFqm2b4uiXVHgqgoq02tgIA3xsptSoT7y2bliwZU08
         JeL60/SSh6b8AG+r0XhrV5201DgH0uzbFiUI5RUeAR513X6aoPKTLpJRbYNSwpx3NH5O
         mnQbMEZV49jzS03MEev7tUA4rSRwda4psqwdRIcvS2l6j8fSUPGUe6bePF3tID01izkQ
         zxqOHQygcirdsUV0HPR3zd3E2AjfKXV9HT5LhcIOBKPxaDhNGwkI5Gc2F0UR5oUqMi6B
         surA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ysgcfs9r;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s2-20020a05622a1a8200b003b86aa56ae9si5957767qtc.635.2023.02.26.21.41.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Feb 2023 21:41:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ysgcfs9r;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWWE2-0006y7-7a; Mon, 27 Feb 2023 00:39:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWCm-0003Ar-8t
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:37:44 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWCj-0002Oe-2j
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 00:37:43 -0500
Received: by mail-pj1-x1036.google.com with SMTP id c23so4867547pjo.4
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 21:37:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VjZP4LY1Wxefy+0rLrks1q4QR8IjH+TMsA5bjteWWKA=;
 b=Ysgcfs9rzRtL/UfwmholIWix5qpAaif42x5oQNvsRF1ffo9R4gFXRAbIdPablttr+h
 EM2MxebuFqq3Oi+Ywm0wJZADqJb+TDVf8TRv4hYRvd6pxXd4EXCPTIUwmZlVHZgpc2SF
 9LeWU41hukxSy30xY1hgdjEXD6gQNXyRazYFSbCNyrF0uciAuYgtoT0eyiXyG+1kHX4l
 iCIcALqQNti2kDM8DJ3n7UsEb09q+foVRcnqcjHumbxM09uc1lYR5O7dLy/iD+GujUdW
 6sfFFznlSkrYTvDgdAMXAsNRyysT74+03WctOEv82dxiYvxdOAf9aeSyCNp1wHI3pAlo
 rSYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VjZP4LY1Wxefy+0rLrks1q4QR8IjH+TMsA5bjteWWKA=;
 b=NgZ1nh+Vp1ucguEs3jdvmfI+J7R+BUxgDN4oiXHG+rSSr+HBrxXXkF0JNy1sHOuZzE
 aSzNIMqZe5sC5jttAOurheoTZoR3LMpELiSsQpVgxcxpgeflJ2rTfeimDw5c780t6g7s
 xgZaL1rs3fwFM+IaeVT72/nbyAopWK361V2dpaDmNO2pOKlcBJ8bnKm9QBND9CLjpGBy
 EArZKaeMoSmmW5fFP0vbyYO6Ko5dVaREE5tA9bk5GtPKFnLttuSGzNGJ10CguKF+pb4l
 OL2udM+1FInH1gvi/ctvYoXPGK/sdoat3NdlVIyO4kOTZYr9BDAvhfc3gtRhgEIy5I9L
 OnQQ==
X-Gm-Message-State: AO0yUKVPUHbLz0/2RdV9VlWrhbZXgCVqRVhPaE3vmsBSfSRYHVUpIJp3
 niNhe8cY+fFGU19O81Rux2zX4kxBpB9Qbht0+2E=
X-Received: by 2002:a05:6a20:3d18:b0:bd:17a4:c35f with SMTP id
 y24-20020a056a203d1800b000bd17a4c35fmr27404534pzi.23.1677476259344; 
 Sun, 26 Feb 2023 21:37:39 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 k12-20020aa792cc000000b005a7c892b435sm3342137pfa.25.2023.02.26.21.37.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:37:38 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 12/31] tcg: Add tcg_temp_ebb_new_{i32,i64,ptr}
Date: Sun, 26 Feb 2023 19:36:42 -1000
Message-Id: <20230227053701.368744-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227053701.368744-1-richard.henderson@linaro.org>
References: <20230227053701.368744-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FUZZY_BITCOIN=1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: vY1qU52yHJOK

TCG internals will want to be able to allocate and reuse
explicitly life-limited temporaries.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 8d896bcbf4..0c2041bcf7 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -892,6 +892,13 @@ static inline TCGv_i32 tcg_global_mem_new_i32(TCGv_ptr reg, intptr_t offset,
     return temp_tcgv_i32(t);
 }
 
+/* Used only by tcg infrastructure: tcg-op.c or plugin-gen.c */
+static inline TCGv_i32 tcg_temp_ebb_new_i32(void)
+{
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I32, TEMP_EBB);
+    return temp_tcgv_i32(t);
+}
+
 static inline TCGv_i32 tcg_temp_new_i32(void)
 {
     TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I32, TEMP_EBB);
@@ -911,6 +918,13 @@ static inline TCGv_i64 tcg_global_mem_new_i64(TCGv_ptr reg, intptr_t offset,
     return temp_tcgv_i64(t);
 }
 
+/* Used only by tcg infrastructure: tcg-op.c or plugin-gen.c */
+static inline TCGv_i64 tcg_temp_ebb_new_i64(void)
+{
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I64, TEMP_EBB);
+    return temp_tcgv_i64(t);
+}
+
 static inline TCGv_i64 tcg_temp_new_i64(void)
 {
     TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I64, TEMP_EBB);
@@ -923,6 +937,13 @@ static inline TCGv_i64 tcg_temp_local_new_i64(void)
     return temp_tcgv_i64(t);
 }
 
+/* Used only by tcg infrastructure: tcg-op.c or plugin-gen.c */
+static inline TCGv_i128 tcg_temp_ebb_new_i128(void)
+{
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I128, TEMP_EBB);
+    return temp_tcgv_i128(t);
+}
+
 static inline TCGv_i128 tcg_temp_new_i128(void)
 {
     TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_I128, TEMP_EBB);
@@ -942,6 +963,13 @@ static inline TCGv_ptr tcg_global_mem_new_ptr(TCGv_ptr reg, intptr_t offset,
     return temp_tcgv_ptr(t);
 }
 
+/* Used only by tcg infrastructure: tcg-op.c or plugin-gen.c */
+static inline TCGv_ptr tcg_temp_ebb_new_ptr(void)
+{
+    TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_PTR, TEMP_EBB);
+    return temp_tcgv_ptr(t);
+}
+
 static inline TCGv_ptr tcg_temp_new_ptr(void)
 {
     TCGTemp *t = tcg_temp_new_internal(TCG_TYPE_PTR, TEMP_EBB);
-- 
2.34.1

