Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp1490919lfb;
        Mon, 19 Apr 2021 13:33:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy3CxR0kkVo5WWryXViNA7GiANXmwoYuuoOLtDVism7VwDmpL1DCzgsmhDv+1cVWnm8n111
X-Received: by 2002:a02:3304:: with SMTP id c4mr18174739jae.68.1618864385733;
        Mon, 19 Apr 2021 13:33:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618864385; cv=none;
        d=google.com; s=arc-20160816;
        b=0cDbYE9sL8fHtChdyne4vh3MQGjeUZ5zKRT8mDNbJjLJIYswj6TCNIKFmKqL3MUk4k
         MlyGRsk2znwIG/BFM0YgWwlKek41NbEFrIUPUnmiC5WPExHKzdD7xWvKKEQ/O6xcMKSb
         HKtJaGmAX5FhEEuVdYqduKgcHy/mD1+GAO8dzJpGtuGB9LOcY7D21SoRbBOD1gS4bhux
         wa7n/JuSwdE+jhbtJG4ZCu4srvAE9NW659jVtisieTi3R5KRZwBhvUkwjuMcr0XqiR5P
         8bXZ0vF8ZKjNRyJFqUS0UUmC46el/mwtLx14S3BM8HnepJajU3Syl+Lpb4Ml+qHqP5sL
         FbIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=87tkM79RXw2jAAFt1MoYIFV/bLOV6oXFWJrSZPGm2LM=;
        b=k9Pgn+aocOJPV9XcJBIxNS4BmgfmtS2nAuFXlzU7wFBSvXMVPKPEmUGpoINQDWjvI6
         8CJzJ4/SZjrGYgxxJXYNIafGKsIoEVXXM17GLbl4d/NFONXrVy5ZN7U0mWlq/M2qerpi
         MHsa5LYMHE1dBKwIuFXbfdL09En/kLSe3Pu1M6U8hprsHv97PenaDAgpAT+hFzZ2N4Kx
         xNCHWYNoUDNy2LoYErDonAKcLfSfzcRLo/SHD8u+jkroD14Nhawdy+sC7Z/PYQijY7MF
         vfdlAUkQkyl7GXWJQLGt6PMBgU9+WWgpmfG6LpGTm2MvjOUuxETgnpt7vHBCmuQ6+CY1
         ncHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=edXaEMdn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h2si14186221iow.79.2021.04.19.13.33.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Apr 2021 13:33:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=edXaEMdn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lYaZt-00084R-1P
	for alex.bennee@linaro.org; Mon, 19 Apr 2021 16:33:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYaQT-00078y-34
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 16:23:21 -0400
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a]:39718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYaQR-0002Vc-8Y
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 16:23:20 -0400
Received: by mail-qt1-x82a.google.com with SMTP id 18so13706091qtz.6
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 13:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=87tkM79RXw2jAAFt1MoYIFV/bLOV6oXFWJrSZPGm2LM=;
 b=edXaEMdnEfrQiDIGGFkCDj6B/uOHLXyjh3cn+94Puev9fJjPnsexowWGeHTX98T1jz
 6/L+jVl3BRQFKmN2azuG+hs3sRYWfjQiTW2SQUWyd/bdWp7zjhKUvSEtVwudfZXyRHMJ
 /qjg2udccDL054YRjoMUI3O/Gaf38Y/l7IsiVih6wUyy631Umx4Ku28Ptx9wGsbb93Mj
 U0Ban8frjBkf8Qz9L2V1xGwJCuv5qaj0tkL3EM432L4OWr9bwmLtPKWycYcRnDuME0t0
 mNdEMnaege+GWO1BWWffhliY3bfghY9K2w0nVlCdfy2kS7V+r5GxnuhchexFkbfJ98nu
 fsOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=87tkM79RXw2jAAFt1MoYIFV/bLOV6oXFWJrSZPGm2LM=;
 b=I0pTT30i/5z4i1oLls8iVRRd6+9wLfiBHpiE7SGmDAaWfT1WhVc+XvUBruLQu4CoXt
 Gd8ndQX/ajdgW5zaX/ubsX+BlHGXV3ZRnazmGghfzMUr0wKTWPxvajsOWnwn/tsgEcDe
 UUlS+BZ/+ldZZxLYTflZWULbEmJ0Nv4VmB5HZ/LGquBsQekyCdNuPnyVNHsRFwnCgOkz
 1umLb/lYnmtZGlq7WAoIz3Etty0geG8kXVT+/t9sGYR5kgH/NP+HIFO6GP+9iNtvYjjH
 aFHL1MBbhViUklNMl3/9DmNRwO0JvT70LLkLyNW5TNXXDJzNKy0iWnqFyiQ72PmpSanj
 e/gA==
X-Gm-Message-State: AOAM5301FEq1OvZRVBRfBFgz0p8g84O7nS/j/dofOMliPz3CmzNWggn7
 neXxVV1qglTAbUwiEx0fGGR2DfEO7nqVkcHZ
X-Received: by 2002:a05:622a:148f:: with SMTP id
 t15mr13760684qtx.191.1618863798329; 
 Mon, 19 Apr 2021 13:23:18 -0700 (PDT)
Received: from localhost.localdomain ([2607:fb90:80c7:aba4:3594:91a:8889:c77a])
 by smtp.gmail.com with ESMTPSA id c23sm10007835qtm.46.2021.04.19.13.23.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 13:23:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 09/31] target/arm: Move TBFLAG_ANY bits to the bottom
Date: Mon, 19 Apr 2021 13:22:35 -0700
Message-Id: <20210419202257.161730-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210419202257.161730-1-richard.henderson@linaro.org>
References: <20210419202257.161730-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FiDbetaP8GdT

Now that other bits have been moved out of tb->flags,
there's no point in filling from the top.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 15104e1440..5e0131be1a 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3405,15 +3405,15 @@ typedef ARMCPU ArchCPU;
  *
  * Unless otherwise noted, these bits are cached in env->hflags.
  */
-FIELD(TBFLAG_ANY, AARCH64_STATE, 31, 1)
-FIELD(TBFLAG_ANY, SS_ACTIVE, 30, 1)
-FIELD(TBFLAG_ANY, PSTATE__SS, 29, 1)    /* Not cached. */
-FIELD(TBFLAG_ANY, BE_DATA, 28, 1)
-FIELD(TBFLAG_ANY, MMUIDX, 24, 4)
+FIELD(TBFLAG_ANY, AARCH64_STATE, 0, 1)
+FIELD(TBFLAG_ANY, SS_ACTIVE, 1, 1)
+FIELD(TBFLAG_ANY, PSTATE__SS, 2, 1)      /* Not cached. */
+FIELD(TBFLAG_ANY, BE_DATA, 3, 1)
+FIELD(TBFLAG_ANY, MMUIDX, 4, 4)
 /* Target EL if we take a floating-point-disabled exception */
-FIELD(TBFLAG_ANY, FPEXC_EL, 22, 2)
+FIELD(TBFLAG_ANY, FPEXC_EL, 8, 2)
 /* For A-profile only, target EL for debug exceptions.  */
-FIELD(TBFLAG_ANY, DEBUG_TARGET_EL, 20, 2)
+FIELD(TBFLAG_ANY, DEBUG_TARGET_EL, 10, 2)
 
 /*
  * Bit usage when in AArch32 state, both A- and M-profile.
-- 
2.25.1

