Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 441E7C87FD2
	for <qemu-arm@archiver.kernel.org>; Sat,  2 Aug 2025 23:38:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uiLkH-0006ee-0D; Sat, 02 Aug 2025 19:34:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLhb-0008Ky-0U
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 19:31:48 -0400
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uiLhZ-00055i-1E
 for qemu-arm@nongnu.org; Sat, 02 Aug 2025 19:31:46 -0400
Received: by mail-oo1-xc2f.google.com with SMTP id
 006d021491bc7-6195f7f9ad6so1224525eaf.3
 for <qemu-arm@nongnu.org>; Sat, 02 Aug 2025 16:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754177504; x=1754782304; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BgqEOYuQ75vNcJCSdrIzICkpbTEEoH2jCjP3tSq0CeU=;
 b=vYEPDy8ymaISDKW/roe8jb9kHAWtBxutjcnXWm9DklnZmPc52jEhhYxJT64nCvhV1e
 MWjzmAzRbb+IgiQR2OlKOXBdGC7PlofElNIRkO1IGUgOpfYwLQwTeal4remoDEh03b29
 dHuBEF6JGphffKfLr4ck0BflZQ8Jhl8RYrywx3Lja1oDd9ida4BJNXlFkPUdtBu3YWdc
 3ERrEPVCPjUOcmTSPhEQTfytOG/hBfIHTaBGp9RJTf/zY+YRd8edABml2pBGovilu59S
 HBvfA7jhgh6o11uXOceY6eQvXcFgDofztVCbgGC1xzMYglf1ojs83CTbls6NheDXaV+U
 RTbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754177504; x=1754782304;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BgqEOYuQ75vNcJCSdrIzICkpbTEEoH2jCjP3tSq0CeU=;
 b=vsHTC3wPNRlWIepOGbcbQlee1m5upGQ3qG8XWxbk6cR9OYA/iwBQJRN5CDJqEmGmx5
 ggONIrvB5Fw/SqbMlhKGihQMc1JMzF6+9u95W2TTTSMD92En3V0BclZW+Vw+Ch07y97S
 oUySxdsoOwJVYzOg9NUpz5ymHCCn+72W0Xf6q/ecwR2VCx97T2BtfthEhI/9zb4cw0zd
 j+MHTyds2V/O4MCg0CpRWGBSDkGxaEQbfgGzpUzWZzzOFwUNlB4pzT1+Y9csmYbIqVBF
 TlztS32D29RmHSmWvuS3kY60yYBL+ZhuVlM80z07Avc1s/FJWdHTJzIp5y3bsdgvPrXd
 9BAA==
X-Gm-Message-State: AOJu0YxEX0QTvKiCwG8o6PqhN9beLzN1aI4eVF0GImhBWgrODNrtffGm
 O+cegZt4qsMQLMmdt7l8Jp9xJYFBU2+KP82OCe3b96ZN5DdpJI7aRcCI0PpmVkq/HS8=
X-Gm-Gg: ASbGncsQVYwYCKaBKEK29wVTurNrf5GMSKiLc2unqTe4Xx+21fOx1u7GLSjg8EbQghu
 KYs1/WuZXx2TG8JDujy0Z5DXwROoEaHm+XD+YFryvzcNJicimL+nYr0I+lxnzP/IZwRKogmbYKx
 TU2aOM79excpgtywPOMKOMkfvWCo1qdeYaZBgXIV8Y4+4jfzibNkiwwn507HTWb9DEaF1pCJTtF
 gxpdDharkMW5AXVqhuU9NSlr8O4/hYtz4ox0m64A0mS3cqgxYENAs703SzBPQM0/MXpUP2gLVjt
 oEM9DmWLbyU2GzUs+UP35Qv/XczUqTGscBNOW0vuWJwiWZbtHZ9NzV6zyVjOwAIdokkGvO9Oamr
 1dI1GfwlOmnsTdWlSqur+A670AwBnVyXtuYn0HmW7BVEZ8K3LmdMm
X-Google-Smtp-Source: AGHT+IHtEOUAuUbj++75YcgF7NQQy2YnkbT0alq4xC5LV8Vs6/iw7qXg1Z2gSOyFd7RPZl8FM8oeAQ==
X-Received: by 2002:a05:6870:b027:b0:307:b2c9:9f99 with SMTP id
 586e51a60fabf-30b679b882fmr2242587fac.39.1754177503826; 
 Sat, 02 Aug 2025 16:31:43 -0700 (PDT)
Received: from stoup.. ([172.58.111.133]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-30b8e3c9b32sm71031fac.24.2025.08.02.16.31.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 16:31:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 21/85] target/arm: Do not migrate env->exception
Date: Sun,  3 Aug 2025 09:28:49 +1000
Message-ID: <20250802232953.413294-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250802232953.413294-1-richard.henderson@linaro.org>
References: <20250802232953.413294-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2f;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc2f.google.com
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

These are not architectural state, only placeholders
between identifying the exception and delivering it.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/machine.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/machine.c b/target/arm/machine.c
index 6986915bee..8dbeca2867 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -1085,9 +1085,9 @@ const VMStateDescription vmstate_arm_cpu = {
         VMSTATE_UINT64(env.exclusive_val, ARMCPU),
         VMSTATE_UINT64(env.exclusive_high, ARMCPU),
         VMSTATE_UNUSED(sizeof(uint64_t)),
-        VMSTATE_UINT32(env.exception.syndrome, ARMCPU),
-        VMSTATE_UINT32(env.exception.fsr, ARMCPU),
-        VMSTATE_UINT64(env.exception.vaddress, ARMCPU),
+        VMSTATE_UNUSED(sizeof(uint32_t)),
+        VMSTATE_UNUSED(sizeof(uint32_t)),
+        VMSTATE_UNUSED(sizeof(uint64_t)),
         VMSTATE_TIMER_PTR(gt_timer[GTIMER_PHYS], ARMCPU),
         VMSTATE_TIMER_PTR(gt_timer[GTIMER_VIRT], ARMCPU),
         {
-- 
2.43.0


