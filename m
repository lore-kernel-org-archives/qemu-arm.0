Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E8B4E7DEF2
	for <qemu-arm@archiver.kernel.org>; Mon,  2 Feb 2026 15:37:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vmvya-0008UQ-NO; Mon, 02 Feb 2026 10:36:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vmvyY-0008Ti-Oi
 for qemu-arm@nongnu.org; Mon, 02 Feb 2026 10:36:30 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vmvyX-0005Eg-8c
 for qemu-arm@nongnu.org; Mon, 02 Feb 2026 10:36:30 -0500
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-435f177a8f7so3517818f8f.1
 for <qemu-arm@nongnu.org>; Mon, 02 Feb 2026 07:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770046588; x=1770651388; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a4bJBIFXqDuMigdL/O55+VSdt0bBjeOO3ki6haMaoLo=;
 b=HgwLqbLnm17OdtSTiLvJEybo/jkXq+oEEvMBu+fKE0I3fXsZszsW+wXDXeh7DwTRJ5
 +rhJimgqaRW8v61rQo5LUbZDCaM0OIS8EC/3ppEArrKqnJVaKfSTk4U66177SrvA2HUQ
 eFoVKeFjmtQZ3VVBTrTaXJen25vwStlbIBxjNHv7iyl8otONXYLuReJmNvvAIFIBju+y
 /619pIYJkZGkoL3YlWm92W+W9Pi6QUs//GWTLYYis6sSIHqQCYIFUsQqy5i6C0K6PYGL
 huw0LKIk1LazWycbY7Jht6Pv5xekw1GwYyJZ+eb9leyS8XPoXg0atCMn0+BmBDJzmBpR
 Rd3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770046588; x=1770651388;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=a4bJBIFXqDuMigdL/O55+VSdt0bBjeOO3ki6haMaoLo=;
 b=DwsLR3Xps4QkDweXEaxYdP10LRRGmF9+mG9UXx+taTHN3eW9J3w9o5Zazd0qvFnchi
 AuwT8YxUrprGaAtbuGUbX/0Td3JNkPLbaRpEtizPIBElAXbPlvV1c0FuHUM+OtF0j4I8
 TDNh3YGm5wJiwWX+/N+GPJ9ivBZY98Xw/rQsFaUJwTAASIsbIrCby2VoHU2mk++EOElc
 e15qK6ceaRbs8yAmrGrUyWqQDLeDeO3jwuMvYpMNdpWOP6HktET5z7WELUIz5UzVFaTy
 KRjD7coDPbTHThBbhOIkC2xwJIODS32v7pdqTQ76EZtI74WHQV2jsNGalDy4A+wh7lwk
 TCcQ==
X-Gm-Message-State: AOJu0YzyF2sJ0vP9fTDsFak/6V5O7a7VFzFRwe8kBzPcZ70tj7/Q6e6E
 vaf1YPWfvIce9Cnk7aHh7Sd/Pmk1BbPUcsuQYvk18JMRHNzXFK+ianbmj16F7+r1qzbaNK+COoM
 iDzD5PFU=
X-Gm-Gg: AZuq6aKdNjuMhdjlXsij4qzwDAdw2TAV5lytjHyMuWZoWkbM4CoStSCra1E+XBct+3W
 mBgonViE7oO97Y6wEbqid7nhWuR1FDHV9kLmC6XpGR2vsYB978YNmPJMHCoqzwrU+flQUg630jF
 dmstwrUZuDUF3P9dMTsW3W4Ji3+gFTj0fZAJvrvJ7nUiuX8T85pykRVOfM6GOKUk5/wArg/14dO
 RhBpbuP1dGhkO4cqvFinpy6+6VuEdHBfGfS+ANQqlJzB6D+OC26WCGxpuek5vzjl/MnLKR+i72s
 RBOG7pkuyov5Cb8hC2l6IBIKcGVUb0E1tZq16JRb8cRRC422+wWsyXtsaGnYgGcYvAN6gBGhDow
 xMiTOYatT1Y2g4yvI7h7bLtUNrTfDOxSNo2jU2NdOFZ7yQSzX/NjBoVNR3O0Ss6Jnxzttusq7kx
 U2KXV3gxim9H57wY1oD80ALdS77CEPN2AM6y4mBfHKXy0aVplgrwkyeqrVPCKo
X-Received: by 2002:a05:6000:24c9:b0:435:9223:bfda with SMTP id
 ffacd0b85a97d-435f3a7bb22mr15257428f8f.21.1770046587280; 
 Mon, 02 Feb 2026 07:36:27 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e131ce70sm46250066f8f.27.2026.02.02.07.36.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 02 Feb 2026 07:36:26 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 devel@lists.libvirt.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 1/2] target/arm: Remove dead code
Date: Mon,  2 Feb 2026 16:36:17 +0100
Message-ID: <20260202153618.78675-2-philmd@linaro.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260202153618.78675-1-philmd@linaro.org>
References: <20260202153618.78675-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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

Since commit a0032cc5427 ("target/arm: Make 'any' CPU just
an alias for 'max'") the 'any' entry is never used (we use
'max' instead): remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/cpu32.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/target/arm/tcg/cpu32.c b/target/arm/tcg/cpu32.c
index 0b0bc96bac2..2127d456ad6 100644
--- a/target/arm/tcg/cpu32.c
+++ b/target/arm/tcg/cpu32.c
@@ -897,9 +897,6 @@ static const ARMCPUInfo arm_tcg_cpus[] = {
 #ifndef TARGET_AARCH64
     { .name = "max",         .initfn = arm_max_initfn },
 #endif
-#ifdef CONFIG_USER_ONLY
-    { .name = "any",         .initfn = arm_max_initfn },
-#endif
 };
 
 static const TypeInfo idau_interface_type_info = {
-- 
2.52.0


