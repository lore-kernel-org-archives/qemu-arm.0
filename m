Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AA15CFD376
	for <qemu-arm@archiver.kernel.org>; Fri, 28 Nov 2025 12:42:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vOxo9-0002BE-AT; Fri, 28 Nov 2025 07:42:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1vOxo1-0001xo-EF
 for qemu-arm@nongnu.org; Fri, 28 Nov 2025 07:42:35 -0500
Received: from mail-vk1-xa30.google.com ([2607:f8b0:4864:20::a30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1vOxny-00037L-U0
 for qemu-arm@nongnu.org; Fri, 28 Nov 2025 07:42:32 -0500
Received: by mail-vk1-xa30.google.com with SMTP id
 71dfb90a1353d-55b302b8369so1324338e0c.0
 for <qemu-arm@nongnu.org>; Fri, 28 Nov 2025 04:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764333749; x=1764938549; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u2+w7aKeM4mn6IUIq7PiZicrN3KwLnQcc+QlfR75hvY=;
 b=FAahTJDvZDOJi8pH598gbhliuHmCsPbZUbxc4bebao+wZQU7tNLUED9NPTW/drHcDb
 plOM/B6dwwEZQNE42F4w7H1ZdbrzDea7iDSjFDiS/lTjokwdxKuzoBUguUy8as/Krz11
 gS4M9RydQdzpQ+1XO4F4fF7JjUNLlV+K3yw50nBOBUvMGre43J1c98AS7Kgy7GSDWnwl
 pd0f82k1j1jM6D8k/eGoU8wEobMhFQJxrJ3cnN1d4HSKRTbBr1eiugS11PNIesFDKm7Z
 RBFZarQ1+FCpjOQhCrFOjzBdgBCpc+NiXzOjIvxOX3+fvibgcBbvc3h60Jhwvy1pg6S5
 8v4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764333749; x=1764938549;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=u2+w7aKeM4mn6IUIq7PiZicrN3KwLnQcc+QlfR75hvY=;
 b=wOUomww1NVUt2J2j9u4bCSL6pGdBcTbnWdHi58+5IMDc4kela1xn5I7yGWP2nZ/XUH
 /1sv0vVPFHHD+uXnyzIXWXIY5a99eAOuFfv6ulOvnlq6niOAnRPf6ishPIf6iPHYuoz9
 4mVNi9xJ4WysPxIIXA0osuMR9RfC3I89ria3LvW0ejpttmqD1Y+W++3f7D+dYeh0hupU
 OSyphDV3KZOKv2bR5SzL96tUUFQT2mmDJiTSeLv09TMmEVShwKNwwQbeVEM+EqMKREWB
 zKl/CGfjYZTpBVmKGAIStSjZyxG3BXvcVvmg472ycmbz/oLILTxIszTT47hFkfVLHznL
 IGZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmV83QJMLVckZUP6rLeuovV3t2zrBFrTOZs+bQpUyQiF8oncBnc/STpAOqtAc2qJWfXsLeVV5a6w==@nongnu.org
X-Gm-Message-State: AOJu0Yxrdm9XF0G1met4DOaKDDj6rhCX4npDq7DWrLkYZYw8OO5y1Fxx
 P2CsSjyr7q6Yn9tmzLm+iGmi7FUeTIXFAYM3pnJCWBzRWeOlSCeaSqn0RRM3mAopkEQ=
X-Gm-Gg: ASbGncsUWRbtyUgG3cO6Rye1Mz2DdLG6vdDOPmdlAksVE1FDLjx4pCwhyg4/kze1f20
 ZZ51Jj9xRSopSin1kCw+YcqFfH0JgaR0NeSs/QBFqPOo1TwGo1nWtRmqevguqCUU8C7h6hBL6pG
 /Mg4xk/CLubnfcCsyWHChUZsrdf5YsbzQkaefYWF+SfQwCWFM8P5JS4Zm5pYyB6iA8ucQatHqGj
 tCAOwJ0xyDcjMtFfsZqP7SEuYq4XDD83zpf3DW8a3ntQtdyYIwUSQVcTQ0LMP8bkVCkTdVoCPkC
 SqAAORPVsPUt3keiotSO++piFddIWcUkkKqZxhABOVOfkqX4DJs757nzpokjTYnVsLMw52Nxz27
 jQkeTpB7MDKzFM8wPqWlaFnrUZ6YEMxA2kYbJUOtCXG29Md8aad4xs/YmjN/yEozIwRxKeAav6N
 tFX/49sh8UvWooWYUE4ytol8dm/A==
X-Google-Smtp-Source: AGHT+IFkEOO1HxrrFhHSwQQNPPj4Qz3a19ayGVICN9yh2joO63JaDcXWtGBCWeTJTQPUFQsbSXaOHw==
X-Received: by 2002:a05:6122:3d06:b0:55b:9c2d:1147 with SMTP id
 71dfb90a1353d-55cd761e433mr5654983e0c.1.1764333748670; 
 Fri, 28 Nov 2025 04:42:28 -0800 (PST)
Received: from gromero0.. ([177.139.2.175]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-55cf4e1d56asm1776930e0c.4.2025.11.28.04.42.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Nov 2025 04:42:28 -0800 (PST)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org, richard.henderson@linaro.org,
 alex.bennee@linaro.org, philmd@linaro.org
Cc: peter.maydell@linaro.org,
	gustavo.romero@linaro.org
Subject: [PATCH v1 3/6] target/arm: Add a _MAX sentinel to ARMASIdx enum
Date: Fri, 28 Nov 2025 12:41:07 +0000
Message-Id: <20251128124110.1272336-4-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251128124110.1272336-1-gustavo.romero@linaro.org>
References: <20251128124110.1272336-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a30;
 envelope-from=gustavo.romero@linaro.org; helo=mail-vk1-xa30.google.com
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

Add a sentinel to the ARMASIdx enum so it can be used when the total
number of address spaces is required.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
---
 target/arm/cpu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 39f2b2e54d..00f5af0fcd 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -2336,6 +2336,7 @@ typedef enum ARMASIdx {
     ARMASIdx_S = 1,
     ARMASIdx_TagNS = 2,
     ARMASIdx_TagS = 3,
+    ARMASIdx_MAX
 } ARMASIdx;
 
 static inline ARMMMUIdx arm_space_to_phys(ARMSecuritySpace space)
-- 
2.34.1


