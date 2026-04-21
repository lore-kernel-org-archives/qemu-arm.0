Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECEAFF8FA78
	for <qemu-arm@archiver.kernel.org>; Tue, 21 Apr 2026 14:23:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wFBzz-0006DV-Hu; Tue, 21 Apr 2026 10:22:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1wFBzx-0006CQ-JJ
 for qemu-arm@nongnu.org; Tue, 21 Apr 2026 10:22:45 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1wFBzt-0007On-Fq
 for qemu-arm@nongnu.org; Tue, 21 Apr 2026 10:22:45 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-488e1a8ac40so55055505e9.2
 for <qemu-arm@nongnu.org>; Tue, 21 Apr 2026 07:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776781360; x=1777386160; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=dQM2HEP97233tEtaNH4+9B/jRgcZaPr8e0DRwAenRrQ=;
 b=dmP1FJQp+l4xcx5/Edhm1gXzc6PeAzeP+Atg8b1MyHkSz1CcF569HSoL+4ip/qzfMw
 e7PcmE5/ZgPAqHGtHHBvttaDC5SnjOxCf2ZwyZHhhcKda39T9eyu/uqyl0ppD+1Ak1iw
 A5ELt2gfXWK6zRaRNrcF4KYXyLXtpHwRW/ZRUzWAVj9B1uvwdosE0c0RvbkTjOmqAWuo
 mU0GFqSxBjcUKR8/GTRmO6fZUDqi/cUizR2NEu8OyCPzOvDBFeQD7h6PwcQGwosRLdee
 jXErvJu2C+PsN7Pfhex46ngvJYPA+8uXdxec5NxJXO1tEoWmTjwMyhv9YLGYjr5H+DmJ
 ZwZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776781360; x=1777386160;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=dQM2HEP97233tEtaNH4+9B/jRgcZaPr8e0DRwAenRrQ=;
 b=BghBNVU+JuvTtUiFwsouRK7DG4DUwSx/r7YcxBGjv5Qr9a62DRuq0yqphEatUw1JT4
 kZB4728r136g0B3Pq8tK+ArjAqK5EjFsDqKia50u2vJBnx33/Y+x1zkhw5ZzLKgPKHJc
 C8B1ivc3wuMF2Ip2157ZHoJn/+Ot/fDo+HRbIB+pdymV7LPiehLprEe0jcW6ztuxzTpW
 ACrKQbMXjetSrhmHMdNC3pMWcHeiTlnh0yn/5g/MZu7oZQkEMUUqCgKyS4QfXe9krL/6
 fPXN5GOcx8ujmmpNJdnZ3UDt1mTroYq2YcLxDlMGgz9XMxKYyat/XJ1J+1t5/u/oMdNo
 RzvQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+saviSESpFSwWiZqlQYqDKBO3MdXyg6aajZIP6BB7Fa8wLiH6LvolOIwAAlI2jOa8CthbfKSslYw==@nongnu.org
X-Gm-Message-State: AOJu0Yzm3dVbNV/CbpX6NaMlSINCrriP7Ytr/8cLZyoNdORcLxU8FFB3
 ExZ0rgAtCt0W3T6pNUoQFBgU2AgGnuXY4WiZiGqkMUiVkY0IFNQ1Dd5LfWETu1NR7ds=
X-Gm-Gg: AeBDievs3KcjkNO17oA/6FU1k7GQqHkJG3OrwTKZaZn/B8neGu/+wLTir5x0xth062X
 fggglVFjvV6oEHdqGGaMYNo+QomZRRAylFTUKdpP/OsVcDD50pxUzk7nb0jb6Ac8k2V66EebPCf
 TQdx5545qg8O8fK9n3beGMPrm10kt26tCxyiDxzo9IX0NUbpM+9o65weA6rxdM8CtKRCrjGNNyT
 1imL0xfvalCTgdlc5C2AxoW2tBgmO/HnR/QPMR2X2qWpC9ehFin+2e4DJdhEYcF32+A9Vc/DLGi
 bRQpBmLfY2rtm1HYb+m7WZYQE9kdnq7I340D0Klolz5N/lIICyhw2VJznHKQdcDLXJgTRSE5yYv
 CTKksvf81+Vhc2w2XStT5cqVOidL7r5byGG82bx2S9/wSP80DVGxMegmr+CVbM7v0dRpmiimmLj
 PWXBrdz7hv9b831Pp5IwfiV245wUvrOJL3KMT43Q==
X-Received: by 2002:a05:600c:c090:b0:488:9e54:94c0 with SMTP id
 5b1f17b1804b1-488fb74e130mr189084085e9.8.1776781359688; 
 Tue, 21 Apr 2026 07:22:39 -0700 (PDT)
Received: from [127.0.1.1] ([2a10:d582:31e:0:5364:f814:f749:9bf5])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4891cca5743sm164250465e9.9.2026.04.21.07.22.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2026 07:22:39 -0700 (PDT)
From: Jim MacArthur <jim.macarthur@linaro.org>
Date: Tue, 21 Apr 2026 15:22:36 +0100
Subject: [PATCH v3 3/4] target/arm/ptw.c: Add GDI spaces to the granule
 protection case
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260421-jmac-feat_rme_gdi-v3-3-ecd20c77eae1@linaro.org>
References: <20260421-jmac-feat_rme_gdi-v3-0-ecd20c77eae1@linaro.org>
In-Reply-To: <20260421-jmac-feat_rme_gdi-v3-0-ecd20c77eae1@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
 Jim MacArthur <jim.macarthur@linaro.org>
X-Mailer: b4 0.13.0
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=jim.macarthur@linaro.org; helo=mail-wm1-x331.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

System Agent, Non-secure Protected and two other GPI field encodings.

These are explicitly denied access for any processing element when
the relevant GPCCR bit is set, and reserved values when the relevant
GPCCR bit is zero.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Jim MacArthur <jim.macarthur@linaro.org>
---
 target/arm/ptw.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 7b993bb5b3..316e201cfe 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -510,6 +510,26 @@ bool arm_granule_protection_check(ARMGranuleProtectionConfig config,
         break;
     case 0b1111: /* all access */
         return true;
+    case 0b0100: /* system agent only */
+        if (FIELD_EX64(gpccr, GPCCR, SA) == 0) {
+            goto fault_walk;
+        }
+        break;
+    case 0b0101: /* non-secure protected */
+        if (FIELD_EX64(gpccr, GPCCR, NSP) == 0) {
+            goto fault_walk;
+        }
+        break;
+    case 0b0110: /* reserved if NA6==0, otherwise no access */
+        if (FIELD_EX64(gpccr, GPCCR, NA6) == 0) {
+            goto fault_walk;
+        }
+        break;
+    case 0b0111: /* reserved if NA7==0, otherwise no access */
+        if (FIELD_EX64(gpccr, GPCCR, NA7) == 0) {
+            goto fault_walk;
+        }
+        break;
     case 0b1000: /* secure */
         if (!config.support_sel2) {
             goto fault_walk;

-- 
2.43.0


