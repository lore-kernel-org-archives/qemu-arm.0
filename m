Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5118232ejc;
        Mon, 27 Feb 2023 15:02:46 -0800 (PST)
X-Google-Smtp-Source: AK7set9ayw5ReVVH/tkLcZGGRv1M9+WazzJR1GsMdN6E0yyAiPz1ZUbJge1+xtwrrPRSrfMp6Tad
X-Received: by 2002:ac8:7d4c:0:b0:3b8:3a7c:d204 with SMTP id h12-20020ac87d4c000000b003b83a7cd204mr1425019qtb.58.1677538966599;
        Mon, 27 Feb 2023 15:02:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677538966; cv=none;
        d=google.com; s=arc-20160816;
        b=lgNCKzc7ZosAobueloTShsKdHy5Z2hs2NszTsVMB3xpEAly92whbRuw/wucop9X7XM
         Vu4LjhPUA2pMIFs4P+PoZfog7zMnKv2ThzEIuIIuCZKjBV/M0BMOP7u5C5Qb0xN9lBxU
         bkFufsB3EDKwCNG7mc5Ac0WVDmBlrYt/KORRW6cDi+jJEXDHzF9Yz1Bn1KTGd0JYtGi2
         99FgN9vk1ijX6PIbWLFaG5nG5sXglPpQoMuoPqFUFIiI6o/rryM9RlPfv+TJdhV/uVtY
         u6hXiX/+9Jf1NxZr3bayPpa3E3XeIofxTwxDxDlaLG1QiASu3gEa8q3gBaSc4AopKrtw
         Qghg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=0zAr88doy4l35/U8kOUIKFNAL46N655Bwwt/mOy9kK4=;
        b=kjqms2/Otu7LkNu7HYJO+rlWDfygzN7p7C5ABAUAcbAJcdmcM0Z6naenNeb1ryDYQ0
         hs3WO33CiiMaRRghu/KjZkE/letSRIkqzfA4s/qoukguclAv83GgfskMKpHApx3Nu1mj
         d6ROPtiCxwCkHqe+TcrcRpS7KCklh5ogSUHeZwqO7yrTbNjQNyLnUWtdd22smZBAiuF4
         fw8w7UKEbJMtBHs9bElDBwRkzKN00R0ZAQuEiJ3ZtV5c/l1Vs/QZrgsHoExFS0gsd37e
         6KnObvffZpAQXwg/hjqdVLDlFc6w8vbQHAfHi2Tq+3zknWnHUMA4IA/OjLNZGKmPObCu
         xxqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eQwXhSOu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y21-20020a05620a25d500b007051669f37esi7236347qko.257.2023.02.27.15.02.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Feb 2023 15:02:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eQwXhSOu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWmV1-0007im-Lw; Mon, 27 Feb 2023 18:01:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWmUz-0007fe-9e
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 18:01:37 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWmUx-0000yv-Ov
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 18:01:37 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 k21-20020a17090aaa1500b002376652e160so7817444pjq.0
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 15:01:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0zAr88doy4l35/U8kOUIKFNAL46N655Bwwt/mOy9kK4=;
 b=eQwXhSOu+8gMc5xT2K+KqPEWL1foo5Vd2FpZhZEeSEQxqVjBfdYnXzXtHbgprTAUao
 jQPSQu/lIvTFMBsMxsxjqDV2qh1nqlarXZ+2YmkERd5cUU6MF0la14/qNQiiukKVg2D0
 BcWKgxb44Pa7ecSuUxksfwv5peCSDnI08ZozPWFGLkVKfhybVvcUyRMDeuWBNuMGEK5D
 1cftzHb7n2sDsO92pcIgV3827dz4ySGlrtEfuZJvO/d0cI/VRh/O4wBfkoiBpiFpK0F+
 a/0WjnmLVmRETGNieRclVYOgzkSm3EZqT80G2Rcr/kXJNg9dv/U/FoLRFq0uAjRoqvcj
 abRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0zAr88doy4l35/U8kOUIKFNAL46N655Bwwt/mOy9kK4=;
 b=8Bu/4yP286HvD4zJjjkPSwM+eYbelpsXgFaNNjFk2Jt2jYtEXPU2GzVp/50awSlRNB
 7nXBv/c+JrRrxULHKWjfBKMHGfiprFNUGeYUR76R33ZsLOlIRcZjxr3l9mHVXnpXaE1t
 eEoINMBMsTNp41fPtThircdeL+2krKIvgRrsZm1FCDo2+eukQHKebZyqQNGmJ8MGrrGQ
 5dni9YQNKHAepyccsroUmAHiHABB4vrCZzBjIj6f/E3K9rVsp6x96LhKkeyUASv56zS/
 LFd0UAadvbiRplyPM2FRUuZW+OS1y5veRfomQxKHqOrPfrodUrWL33RIEbqap7ubQQUp
 yanQ==
X-Gm-Message-State: AO0yUKVDh6QgBgOq2Q91QgfNbfWIPp8R+WRlmtk15GCpSNg3umYQV5HH
 hyr8o4f2f14Ek9RnUpy7yVnF7plC8EEYGBzFyWQ=
X-Received: by 2002:a05:6a20:7343:b0:b5:a231:107f with SMTP id
 v3-20020a056a20734300b000b5a231107fmr1199691pzc.12.1677538895002; 
 Mon, 27 Feb 2023 15:01:35 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a637902000000b0050301745a5dsm4406130pgc.50.2023.02.27.15.01.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 15:01:34 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH for-8.0 v4 06/21] include/exec/memattrs: Add two bits of space
 to MemTxAttrs
Date: Mon, 27 Feb 2023 13:01:07 -1000
Message-Id: <20230227230122.816702-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227230122.816702-1-richard.henderson@linaro.org>
References: <20230227230122.816702-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: MU4VqUcX6ASe

We will need 2 bits to represent ARMSecurityState.

Do not attempt to replace or widen secure, even though it
logically overlaps the new field -- there are uses within
e.g. hw/block/pflash_cfi01.c, which don't know anything
specific about ARM.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/memattrs.h | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
index 9fb98bc1ef..d04170aa27 100644
--- a/include/exec/memattrs.h
+++ b/include/exec/memattrs.h
@@ -29,10 +29,17 @@ typedef struct MemTxAttrs {
      * "didn't specify" if necessary.
      */
     unsigned int unspecified:1;
-    /* ARM/AMBA: TrustZone Secure access
+    /*
+     * ARM/AMBA: TrustZone Secure access
      * x86: System Management Mode access
      */
     unsigned int secure:1;
+    /*
+     * ARM: ArmSecuritySpace.  This partially overlaps secure, but it is
+     * easier to have both fields to assist code that does not understand
+     * ARMv9 RME, or no specific knowledge of ARM at all (e.g. pflash).
+     */
+    unsigned int space:2;
     /* Memory access is usermode (unprivileged) */
     unsigned int user:1;
     /*
-- 
2.34.1

