Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp2071722lff;
        Mon, 14 Jun 2021 08:26:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyrp2jUUcolPFf8XDZ4QHl9KKuFDgFl0R5iUkQFV5odKEgnQfW0wg2zZxjMk98HoW0ekgEg
X-Received: by 2002:a50:afe2:: with SMTP id h89mr18147936edd.308.1623684392288;
        Mon, 14 Jun 2021 08:26:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623684392; cv=none;
        d=google.com; s=arc-20160816;
        b=l/r09YeEamzBXYbWFtNqX7Z0YetSdUa2fxzIoncGMOKxUlWhj0TgZ6P0Dwi5YIUVSE
         lQ/udKNLWVeyFGGaWghFxqTNqiRPN4i/7X4mdNeIoyThqgAZRVI7nWYdD9F/Hfu/iwYZ
         tnz1VMeEkMzhuS+aQJQ2UK2uXDxFAaII6j8wU3YdYnUX3797vz+RMw/wS73QFSBRPfAr
         pdxB87/rqoz1ew87dQr42nGLBTdv7kehR2x1kpYBDAD5FmySI4lX+ilhoN/k7UrxhcZT
         TX/4VsfVPiU4+tXyly+ZGuBvvsozXir1JfnrpxlHDrIyJc4n/MUsS8/4Am61UYxsc7pB
         f5Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ZdmOS0+SAUIu2ioqPfNiZdOBVip69Wg1K/eKjCptxlY=;
        b=edEcBuGXniXWWYoGDwMU6QKVK8IZZCnxe5mWyjqwaBQ5a+UN2Rst7WRqlZtRL+Tnua
         cLq4ulV3tYjPzWEfRyLokPtiZa2yAruXcMrjYO4bOQWHBqsUUkIBqZSGaiDJ5e4CnMd1
         fTYjQhq+vj4CYZx3NdORMymnJ5a1F8aGZIO5k2wdKnGUfJRsBq1PLTDrQ0wiLSjdn+Sk
         jn6lX/SY7BzYmbq96R6Qx4v/DgB+6MZvmQpyL3UF0O1D9mq6ToBK052Z6FlEKgDtbIKn
         TqQFQH5i+RY964ZNQpZ5BronCdEouqwQVTUl9iuZiU5lQZ3Da/gW1LxJi9Ui5GSHWizQ
         R8lA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NCkZI0Ed;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a14si11437579ejy.671.2021.06.14.08.26.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Jun 2021 08:26:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NCkZI0Ed;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lsoTv-0002Oq-88
	for alex.bennee@linaro.org; Mon, 14 Jun 2021 11:26:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEb-0001BY-SE
 for qemu-arm@nongnu.org; Mon, 14 Jun 2021 11:10:41 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:41707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsoEP-0000LX-HH
 for qemu-arm@nongnu.org; Mon, 14 Jun 2021 11:10:41 -0400
Received: by mail-wr1-x429.google.com with SMTP id o3so14938753wri.8
 for <qemu-arm@nongnu.org>; Mon, 14 Jun 2021 08:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZdmOS0+SAUIu2ioqPfNiZdOBVip69Wg1K/eKjCptxlY=;
 b=NCkZI0EditlgppF1SKM1jiKnxWdS9aPT8TI13FEJfPv7O/3kmyApI/c80rqLmDTuMN
 y/QdCc1HCAY+mReXiGxNbQMY7RnjQOw8/vhPF4DbOPbPQ/RHHYtOm5hdypP04exNd090
 hwoeA0OL0wxiKL4IGR80qG8bySHuSFFmc/01eo4l7M97WHasAeXis69zuLXHozIPTodF
 9jk58k74vDwGo/cOfIM+OV86nI1Ve/IfFM/6gfKGfvGMlIBNRjK9IVqWKfMR9VnLi7bY
 fV430AfKHxTBu6ujDStmmaaTG8nCY8CSP5HWLK3RcNTMrQC+vDkoJsZalrQVladXJ8wF
 u7ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZdmOS0+SAUIu2ioqPfNiZdOBVip69Wg1K/eKjCptxlY=;
 b=ji0Q+2gv3sIgW4hEXPE7TFRDNo5lTzg1Q3So0E5SKR3s9qoe84PgQEvtDokCNvU8Y/
 DVZ9fvS0WjZaOsy0N/U9csUV+r116YQ3oywJ6D1EFSaHU2sUidMjfhGyzBg8TnoOey+w
 75dUN0fZLdQ0f8ergrlUgXoMipK81oB9hHHY7c2CTLhLlPJcjnYUouNqjFvXS6ebek/U
 y3Ovg2/6r0odoHvd87gI/zOkUjzHGBRbiyVH073ZR+2lN+hroe1CoUkd0Vkku2TQaD/6
 C7tJ2Lbng0a2SZfJHgTdMwp+nzuK16DKyEdQDMSrCuSEvJWoTHP8uyd0jTsXoVOHmxR/
 wUvA==
X-Gm-Message-State: AOAM5315P/+mFhoZf1IF9MpJPPECodIOjuVOCKjT85fDBTPDVh7YE/q1
 86oL8Kq9m+TKEvbczjY3lBxAgfoyhtjjTg==
X-Received: by 2002:a5d:6a02:: with SMTP id m2mr19420397wru.77.1623683428173; 
 Mon, 14 Jun 2021 08:10:28 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b8sm20865639wmd.35.2021.06.14.08.10.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 08:10:27 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 21/57] tcg: Make gen_dup_i32() public
Date: Mon, 14 Jun 2021 16:09:31 +0100
Message-Id: <20210614151007.4545-22-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210614151007.4545-1-peter.maydell@linaro.org>
References: <20210614151007.4545-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: l3ntnyj0OsZ4

The Arm MVE VDUP implementation would like to be able to emit code to
duplicate a byte or halfword value into an i32.  We have code to do
this already in tcg-op-gvec.c, so all we need to do is change the
function from static to global.

For consistency, expose both the _i32 and _i64 forms.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I picked tcg.h just because that's where dup_const (defined
next to gen_dup_i32() and gen_dup_i64()) has its prototype.
Happy to move the prototypes elsewhere.
---
 include/tcg/tcg.h | 3 +++
 tcg/tcg-op-gvec.c | 4 ++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 064dab383bc..018f8965f81 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -1331,6 +1331,9 @@ uint64_t dup_const(unsigned vece, uint64_t c);
         : (qemu_build_not_reached_always(), 0))                    \
      : dup_const(VECE, C))
 
+/* Replicate a value of size @vece from @in to all the lanes in @out */
+void gen_dup_i32(unsigned vece, TCGv_i32 out, TCGv_i32 in);
+void gen_dup_i64(unsigned vece, TCGv_i64 out, TCGv_i64 in);
 
 /*
  * Memory helpers that will be used by TCG generated code.
diff --git a/tcg/tcg-op-gvec.c b/tcg/tcg-op-gvec.c
index 498a959839f..abe9e07116d 100644
--- a/tcg/tcg-op-gvec.c
+++ b/tcg/tcg-op-gvec.c
@@ -386,7 +386,7 @@ uint64_t (dup_const)(unsigned vece, uint64_t c)
 }
 
 /* Duplicate IN into OUT as per VECE.  */
-static void gen_dup_i32(unsigned vece, TCGv_i32 out, TCGv_i32 in)
+void gen_dup_i32(unsigned vece, TCGv_i32 out, TCGv_i32 in)
 {
     switch (vece) {
     case MO_8:
@@ -404,7 +404,7 @@ static void gen_dup_i32(unsigned vece, TCGv_i32 out, TCGv_i32 in)
     }
 }
 
-static void gen_dup_i64(unsigned vece, TCGv_i64 out, TCGv_i64 in)
+void gen_dup_i64(unsigned vece, TCGv_i64 out, TCGv_i64 in)
 {
     switch (vece) {
     case MO_8:
-- 
2.20.1

