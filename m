Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8691BCD5BAA
	for <qemu-arm@archiver.kernel.org>; Wed, 20 May 2026 18:25:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPlZC-0007VP-Ox; Wed, 20 May 2026 14:22:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPlYo-000701-A3
 for qemu-arm@nongnu.org; Wed, 20 May 2026 14:22:26 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPlYm-0000Vx-67
 for qemu-arm@nongnu.org; Wed, 20 May 2026 14:22:25 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-367d88b9940so3411977a91.1
 for <qemu-arm@nongnu.org>; Wed, 20 May 2026 11:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779301342; x=1779906142; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6CH8sn0raFot2c6HYSuCv/vuUo7CdYLWHtN+GrqCIxQ=;
 b=yiWTWx5Ndj55Ol9VATBTmGDLF2qLigUx3E0wQPzmQ876FPFjzWRxAkX+tioH206lkm
 Ri38H1TzyQorYV3+zxmZNfkXlBMlfdDnA2feOXA5uYedgM8JvukGv1H6yXSyHDRdc4MI
 1sQKFlPHlcfDCWxLFHFNHRzzEKKZTmKZezMMolLLgtK415Gh3YGDHXJFPo+GUBJNeVkP
 0GQW9dRu8JDZybCRahraCuUPQ7g4L4sCFvqU2m5A8L4G+EO7DMaNE2XhuSBCCwI73V8f
 zG0KYT/j7FgGtamcwJT5bgq2W6FA7oku3LrY3L7uJ+mxSJlvLqY0lSSCP5DAVdcFFFg6
 uK3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779301343; x=1779906143;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6CH8sn0raFot2c6HYSuCv/vuUo7CdYLWHtN+GrqCIxQ=;
 b=T6lu7YWMjDY2mMinE0/ne8cA1mDaK9fWn3+ofpXsNH4B0jWNppX7viifHXBok5xEBH
 rr5dewoiz3Hx0d9EsCZzzDi5b4THFvyYUto2kOtJzViTJAwGfKGLTe6X6ghwiazWuLlo
 nwqylDl9UXFD6ai4U0gpBEY82fWuyVOcf6H6wPkp3qwmHk70bEBdXdgmkg84Z5KV1gDq
 sQwx/Xqqgpa+OknaTzLd0p0lSxHdX5dIuRCmptUXgFOvMpGh2OGk7b8o0caV2RMacnaZ
 ZIMn3a9clfSFHyFJd/GCl5Gl9FgCmw3ELDr9tUvaSoFhv4hwafQpI+hXRJAVtcVx0UMP
 gJsQ==
X-Gm-Message-State: AOJu0YxpV/VIa6blhJsxwAxkgSdNkJ1DGS/f26tG/Kip33BzIOIcxyt2
 Y0o3TuA95pM7Z+SJHP/dj1mG7GicNQNYiG2avD7F2EAaAMShmw4U0Bsg3hlU0XBWWxU=
X-Gm-Gg: Acq92OGN1N0qz0+g/oeyqrWxD3cKM5uKXr1gEGIjixFAzFs/8FNFVV0Ldbl8o3CpUv+
 SLWBohlGg4/d1g+B3vMLuLdysyx1tOYmfNI/Frhugc+BmV+zezI+tcK4Tayz4O6qRSKtb/xwPZ8
 cDMaVvLDcUpBJy34iVDDWB4oono4UDcWmLmCIP2joS+DZ6fiJq+VF66EVKbTunRg75X3CPukHq1
 laL9ry8sgD9FkyMdxz2q13W2s3bx36AEJZ0IYtRXY9j2DiKpEr1ugv6EnntzqVUQIM1vRk8UffO
 QQHL6Td2Iak9dcsbUAPzJrxCWM7iOThBaFakMMtcxKWMcVSABXdnNW+KCAABVTpuIPcelUhV5Uo
 8Ywi5kETEtSdEZJBi0HMQmEF6fqw8yDf1S8It0mr5DbK/Q08AAR+IiGHGOXzPMKPIZQPYhuHZQ/
 W1iD2eeruS/bElJB9cilBToUMBaCkQ
X-Received: by 2002:a17:90b:33c4:b0:35d:9c32:6219 with SMTP id
 98e67ed59e1d1-369519e8faamr24467915a91.9.1779301342447; 
 Wed, 20 May 2026 11:22:22 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36a3d210b4esm274764a91.17.2026.05.20.11.22.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2026 11:22:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v6 11/64] target/arm: Clear FPMR on ResetSVEState
Date: Wed, 20 May 2026 11:21:20 -0700
Message-ID: <20260520182213.872945-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520182213.872945-1-richard.henderson@linaro.org>
References: <20260520182213.872945-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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

FPMR is cleared when entering or exiting Streaming Mode.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7eb7031294..3d6e7f1ccc 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4856,6 +4856,7 @@ static void arm_reset_sve_state(CPUARMState *env)
     /* Recall that FFR is stored as pregs[16]. */
     memset(env->vfp.pregs, 0, sizeof(env->vfp.pregs));
     vfp_set_fpsr(env, 0x0800009f);
+    env->vfp.fpmr = 0;
 }
 
 void aarch64_set_svcr(CPUARMState *env, uint64_t new, uint64_t mask)
-- 
2.43.0


