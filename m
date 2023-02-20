Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp2706548ejb;
        Mon, 20 Feb 2023 15:27:18 -0800 (PST)
X-Google-Smtp-Source: AK7set9rnHGrKdZsrJhxJMYZaFlnJ76M8m/yGnnm91AGpWwcs97MjVQqVU0xr08EtLF/UpitVjnh
X-Received: by 2002:ac8:58d2:0:b0:3b8:61df:1c2 with SMTP id u18-20020ac858d2000000b003b861df01c2mr21014078qta.56.1676935638560;
        Mon, 20 Feb 2023 15:27:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676935638; cv=none;
        d=google.com; s=arc-20160816;
        b=mp8JdyXy721KNGIDDdgtsOd3HE58ikRvdkEvf0t4hdx3BU1m/+TXX0/0ElgN+k0Hue
         Fj5D6IoPg9bDUW50GYLNLC6A2skurfI2RUWDQ3CpRG6ZjRjBbClYphypZhToCt+QfzBK
         5cnwkzJbaeumjmNAl9X/aoj0KvEO1fOf/xtHa7cCcJykZK/LvGblwjYXwSDV7glyFzoN
         lQy0PrhwdP9HH5iLWW9evGGYOry1VZeIMXPcEOX1CE7gLx1FIaB+shG7daG/VN2CPcTu
         usP4ct05yCR3nuEBQRpLsuHTPabwQ6X5LMEjvz26jz+ZL9Mhay5v1zcXVNMJSxAZI5Qy
         /h1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=0zAr88doy4l35/U8kOUIKFNAL46N655Bwwt/mOy9kK4=;
        b=do90XyaTgq4rMqIv5ALKwdpNUYH8iQakwBb3jR+Mm+aIHsW+S5otp5+K72RDrao69N
         GBP2zp26QfTGQPzsO9SozZmbOwaH9jUHzzW23bokUmq7/rjKdGulqF267LWt6H03ciNi
         zsQL6RnSZi1htvArCx/8AnHbvu837HWWLIv79GfRAAU1ctzs1fHCyQA4QfwE4Slc/Tm+
         oIEY9iTFc9tXx5HUm/XTk4ZbDWuJkQ+AYM8tKUh+hIiS2Pd38cBCF3aN+v65ff3uldvC
         YWhlTkR4G/GgE3SgpzESiWMvHc/vu26FEbCxPwAr1tvK/eQFWlf68qRdeaIJCnBZXxwO
         BykQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S6sEYxzG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i9-20020a05620a404900b0073b338a9ad7si11136327qko.572.2023.02.20.15.27.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Feb 2023 15:27:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S6sEYxzG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUFYU-0003tT-OM; Mon, 20 Feb 2023 18:26:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUFYS-0003ns-Uo
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 18:26:44 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUFYR-0000LG-A5
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 18:26:44 -0500
Received: by mail-pl1-x629.google.com with SMTP id z2so3269948plf.12
 for <qemu-arm@nongnu.org>; Mon, 20 Feb 2023 15:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0zAr88doy4l35/U8kOUIKFNAL46N655Bwwt/mOy9kK4=;
 b=S6sEYxzGxO3bfpesCdh8SoyA0w8Nm+dMMgqv79oqg0RDkdwJjOTil9JPT1AYe84ZfJ
 8uFmlk38dM+iwRR8uf3a/sbjebwSrt2ssGewg89oYl5uC+hcKAaXoN34UJT616QEIJi/
 Apx6uKufuN0zUtOiLGE/84w921NlCwj3BT3rXBwyAgEvAR1I1Wj5HFY4SJaWFmu10VvP
 uo1J4+J01t8e4cZTg/fUCeLq3Mbg90DMJ6Cj1dqgaI+2cKB/H9ragb9IITl3TEb6D8xK
 JtgyOiLnEtSTZ0Q+2ICVic+p0wxn1Wl307BUP39tz1zoCGb++2jOaYVUaRTQEQSl6Mba
 odFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0zAr88doy4l35/U8kOUIKFNAL46N655Bwwt/mOy9kK4=;
 b=ZtYoKplcwD9rWMvU1Hb3wUTDitNNy3DgveaYjM/4o2UbYr3XHt+0EEdhXh8qg4n4XB
 V2dT0heTeWUDP6+RzRQ5acEN85tQVteb5/BylVKImizWJH45Zzc2kScfvx4PyvqZjXqY
 spD046ZqzJf6W+jf9ku3vHWQOuHJf4754zLipQVgeCVImblJjR6QQFef9lqtErRRrDG6
 x5zG/DoJZ+mxk/IKjYecHyPDUWj8uoFBSSL5dK37zNjTwMRgvQH3FG28EYTdczw4foKZ
 jjvfB2/CMbcB1xwSDe+v40LPshLiU9xzBlfe2v6W2sUXtG7msA8LwHNSpw7JwNjcH0SZ
 nItg==
X-Gm-Message-State: AO0yUKXqFzgDkfdAy7SHAYKYqRitm1Of5LSUTWUI19ZAmxnwyMdIzt51
 dg8IShWiMczzmFmqRJDnCDj4dHJtup3R4g0NgHI=
X-Received: by 2002:a17:902:d2c3:b0:19a:80c9:2cd7 with SMTP id
 n3-20020a170902d2c300b0019a80c92cd7mr3138209plc.47.1676935601902; 
 Mon, 20 Feb 2023 15:26:41 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 j10-20020a170902690a00b001992e74d058sm2665348plk.7.2023.02.20.15.26.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 15:26:41 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 07/21] include/exec/memattrs: Add two bits of space to
 MemTxAttrs
Date: Mon, 20 Feb 2023 13:26:12 -1000
Message-Id: <20230220232626.429947-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230220232626.429947-1-richard.henderson@linaro.org>
References: <20230220232626.429947-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: hL7yPOjtsMfB

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

