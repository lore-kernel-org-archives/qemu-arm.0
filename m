Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 866FECA0EE4
	for <qemu-arm@archiver.kernel.org>; Thu, 14 Aug 2025 13:02:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1umXXg-0001Tq-0J; Thu, 14 Aug 2025 08:58:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umXXa-0001Rc-8a
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 08:58:46 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umXXS-0004Ea-KU
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 08:58:45 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-32326e2f0b3so757772a91.2
 for <qemu-arm@nongnu.org>; Thu, 14 Aug 2025 05:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755176317; x=1755781117; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5pyV9I1ab5c29rW3qcGtq+wHa18CtHBS8e6ckAGh5og=;
 b=aBVmYSDTH90lnrn/Oamdh7ZVnLQDp+3V4qUxGr1HQSdag4vajOfz4y4KrWIFeMgbxi
 8979vaCETboj07CHjn4cDixEC0X8vDMbHyJnYo/lzOPqOofoTEJ1wPUal/y1xkFkWcCT
 St5W5EuTyrQRN+p4ol5KHGyLzV2LMwbQLr+CmjURdDiieRYGDn+mEvbCJwUAoJEHOCXV
 AjR0VFAGhVxVD05oexKKn16Y3XytPbZnAOtQ0lyOKcqpD4kGGLRsoAUxAGIyfyOvFgsT
 cea0xxR8dx0hwSVR3ZScqTxQ4vVSKtc5TFWi8JpJtEC5Wz4QyWkGXU4JAcIdQnd2+ADW
 pIMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755176317; x=1755781117;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5pyV9I1ab5c29rW3qcGtq+wHa18CtHBS8e6ckAGh5og=;
 b=r30xoOtWANy7ZtS39B/HGc9T2DO8MTD77By7pQQRjEkNKZBfDfCTOQe5xrRiDv8ij5
 szzg1K9WU3EaXqE9xe89M1gzlaq1I9DBoma++fz4cHkANoZsYS4ssi5fv5yHw3move36
 NB5AwG8GU7oZsMhcHlKHprQ+h/JxYWzEI/yIIZqhWxAcRtHUvHbk5b3Kz7e65I44QAPh
 X8qvxengIzWJb+jTSUD+jbTV7V7L/xHrFbHsoWDHSDMaRIG8ea+xe6CoR9G22pQXyMB1
 hLdX8zmHgwUb2HyN6rjcnQrdJKT1KVn30KPAdO5lj/h788GjXs8zggJyYGI7hxm+++w7
 /CEA==
X-Gm-Message-State: AOJu0YyBuOCXZAGrzEes82gHZhy3LeyUXw6Dhpkx5UiEveoDQVMuP7xB
 kDcjrHTOL4TNJzITINE+fanZQ9nwZTkdWcBFYHpUQpZc44pfBTyRNh/C6q/vPD0K+hcQp8LSISt
 P3lS6mfI=
X-Gm-Gg: ASbGncvYOvQrfQTW+xUaqbeWRleTdz5ZlqYD8bdfAxr6+AJ6z2KQyZTqDr/XK5UzHpp
 L+2HgGclYNhuxELzEtlSGAlGW2/Kd7bjMpeUYg/nQz0v6iRG+E+XnQFHsojOLPkzvVGLyqRlQL6
 Rkwm2ZivD8FbeQuOOJyQDbz7THyOPw646CAViUBkDgSGo8lvEajcP8hKTGkdSR7361rtrHH0dzv
 Wq+q1lOxOEX4nWWJGRJ2N/1AktQJjB7M5bAqUtu9ZuF1iyOCtt3NRHoOm9Fm3ujlIxJ5gBorpm6
 ZeTkjcN6OSqhgABsoQ+yKe08d84nrcuQ9xtDAom8mrEUnypezKY6sS3rsphHVfTo3wBJJSRncqK
 8szRD5tI0j4Xe9VmQlohWUYe2xtgVSxi6HWZyqN6Ndpvhcno=
X-Google-Smtp-Source: AGHT+IHw/SYpKLV0B8loiRS8XqqSKUM+uNoE2b+an8n5OSmL3dnr3c8Ey072KF1FAmXDzJQm/HDhwg==
X-Received: by 2002:a17:90a:d403:b0:321:752b:6c95 with SMTP id
 98e67ed59e1d1-323279d75ddmr5259238a91.10.1755176316630; 
 Thu, 14 Aug 2025 05:58:36 -0700 (PDT)
Received: from localhost.localdomain ([206.83.105.236])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3233100c994sm1766256a91.21.2025.08.14.05.58.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 05:58:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 11/85] target/arm: Remove outdated comment for ZCR_EL12
Date: Thu, 14 Aug 2025 22:56:38 +1000
Message-ID: <20250814125752.164107-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250814125752.164107-1-richard.henderson@linaro.org>
References: <20250814125752.164107-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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

The comment about not being included in the summary table
has been out of date for quite a while.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 20b69a12df..dc6c82b7e2 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4566,11 +4566,6 @@ static void define_arm_vh_e2h_redirects_aliases(ARMCPU *cpu)
         { K(3, 0, 14, 1, 0), K(3, 4, 14, 1, 0), K(3, 5, 14, 1, 0),
           "CNTKCTL", "CNTHCTL_EL2", "CNTKCTL_EL12" },
 
-        /*
-         * Note that redirection of ZCR is mentioned in the description
-         * of ZCR_EL2, and aliasing in the description of ZCR_EL1, but
-         * not in the summary table.
-         */
         { K(3, 0,  1, 2, 0), K(3, 4,  1, 2, 0), K(3, 5, 1, 2, 0),
           "ZCR_EL1", "ZCR_EL2", "ZCR_EL12", isar_feature_aa64_sve },
         { K(3, 0,  1, 2, 6), K(3, 4,  1, 2, 6), K(3, 5, 1, 2, 6),
-- 
2.43.0


