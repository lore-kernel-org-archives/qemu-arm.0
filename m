Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DF52CD3445
	for <qemu-arm@archiver.kernel.org>; Thu,  7 May 2026 23:50:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wL8On-0000mV-4s; Thu, 07 May 2026 19:44:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wL8Ok-0000j9-KZ
 for qemu-arm@nongnu.org; Thu, 07 May 2026 19:44:54 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wL8Oj-0001Dy-01
 for qemu-arm@nongnu.org; Thu, 07 May 2026 19:44:54 -0400
Received: by mail-ot1-x334.google.com with SMTP id
 46e09a7af769-7dcdaf06498so1087399a34.2
 for <qemu-arm@nongnu.org>; Thu, 07 May 2026 16:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778197491; x=1778802291; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7QG3SAWZXTLSfeqfkLdTcj+WQldu34LGY3+/Bb5YVXA=;
 b=mK01Swc+dorVWbFbg+aLhNTIn1Li/x6rFxB+Y6ZyJDuExjF3QEm4sPcWoA4VWGZRdK
 efrNeSdhmqc1z6JI1imafFTl1qbwWiLKZrHobLTFsL8nptEH0pWZtLYPt55BVBPTU8mE
 TKorS8F/Lzb2UEgUueA60Ipj/mDr8/8Fhfb5onsH8VGsuyTUyoaNUZ0SGY1ycV+pDfyN
 G2CgdjzNrwbUVFEhDp/qJ8eXDW+e1L8dag6lYOqR9m+KZEixhO+jf2IHxKuEkXrP+VuQ
 repuXGVRsEqFwaKwB/m7mNoLVHm9YIPnHmdV1xLwxVDwrP6sZRjNH0LRlYrQ+DW6UoSr
 wwnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778197491; x=1778802291;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7QG3SAWZXTLSfeqfkLdTcj+WQldu34LGY3+/Bb5YVXA=;
 b=l71C8qsuTvBtZnKFPZvhrkuO2qPtBMC8q7iW5XzzY8jY6eafq6MYco/ns8LAz/mVlN
 I/EPwbcDv3mnFmOWNg2EYlaBqthQ5uqMel2FB9MzG/Nu4AgDU/4xhRLAYoO9yBvRqfcq
 EqLG6095YpI2+yHSQqf9kCDSgprLfYvgcvjJfN/8La/ezYch2d/HYC/U1qLiz3Sg8Xcb
 UTjcHASQxuAW+LtY0+dop8873HzG+567MIuGZ2RW7/IWdCQStASZZXSnfng28KQ/FAv/
 Q5j41nUZ6zFXVWFVvkegOdy2+Jgsja7YLkZxhM2qTTDQgHu2em4YVKC9OcCjkP9Ei65x
 n+3w==
X-Gm-Message-State: AOJu0Yzsb5oDPy7ylXcXWz8hnJ9gmABKttnt5ng28Jnk6vi8kOZbcyHV
 FiJTBDbcneFVwSd+6pmaVUmdPehYuwAGCy5KHcpkeYIrO2JU1L+4kiM/ht2kdcmwWyI=
X-Gm-Gg: AeBDieu6KWajw/WrNX8fmKoOOirX5/jgmZz9Z3ptISwfZivnccvx58FX03FjevQakBh
 k6mqogW4qTm+32b7+4vy+EJbwNjm3nwtPLz1c8WKlMAp47dzDMAe23wBv+/3y5zfS+JlQip54C3
 daMJcU1n3UNGpo/ycldKndqPa/azyxs7MZfnpntvATlHdJMqTznpyYsHSgnSIbjKPIHkmeAlpj4
 fY4XXue5adGooS5xyWOD3nhHzZgH1ghlXmlR5Ur3mKmkFjNyH3/PhGg4LulYBVYalkdPp4aTQFa
 Nk0vwf58gksLZCSNOoMaD6ryHro494t/7wpnWJNcp0m0xofaVn4z3D5dD4yFyZJeUuSnWUCTvE3
 HPz/wmsGJPX1NAUNngnV6FjcF6fuBER5P0FtO3ND7DkDk4wjmPzR9nr6FPB4LI0e888SsoXS6R7
 cJh11u6oTkwlnoLCXXI5gHylcjya1L9rWszF1VugGyDP2TPg==
X-Received: by 2002:a05:6830:81c5:b0:7db:a8b7:c565 with SMTP id
 46e09a7af769-7e1df04b7d2mr5808004a34.20.1778197491451; 
 Thu, 07 May 2026 16:44:51 -0700 (PDT)
Received: from stoup.attlocal.net ([2600:381:c938:6375:9641:bbb2:a93a:bb4c])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7e367d8feb1sm84320a34.23.2026.05.07.16.44.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2026 16:44:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v4 38/60] target/arm: Enable FEAT_LUT for -cpu max
Date: Thu,  7 May 2026 18:43:51 -0500
Message-ID: <20260507234413.643512-39-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260507234413.643512-1-richard.henderson@linaro.org>
References: <20260507234413.643512-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x334.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/cpu64.c        | 1 +
 docs/system/arm/emulation.rst | 1 +
 2 files changed, 2 insertions(+)

diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index a377f67b9c..bc866c5a67 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1263,6 +1263,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64ISAR2, BC, 1);       /* FEAT_HBC */
     t = FIELD_DP64(t, ID_AA64ISAR2, WFXT, 2);     /* FEAT_WFxT */
     t = FIELD_DP64(t, ID_AA64ISAR2, CSSC, 1);     /* FEAT_CSSC */
+    t = FIELD_DP64(t, ID_AA64ISAR2, LUT, 1);      /* FEAT_LUT */
     t = FIELD_DP64(t, ID_AA64ISAR2, ATS1A, 1);    /* FEAT_ATS1A */
     SET_IDREG(isar, ID_AA64ISAR2, t);
 
diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 44c7196d09..cf8771d541 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -101,6 +101,7 @@ the following architecture extensions:
 - FEAT_LSE (Large System Extensions)
 - FEAT_LSE2 (Large System Extensions v2)
 - FEAT_LSE128 (128-bit Atomics)
+- FEAT_LUT (Lookup table instructions with 2-bit and 4-bit indices)
 - FEAT_LVA (Large Virtual Address space)
 - FEAT_MEC (Memory Encryption Contexts)
 
-- 
2.43.0


