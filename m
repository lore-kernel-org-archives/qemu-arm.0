Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 622BCD116F3
	for <qemu-arm@archiver.kernel.org>; Fri, 28 Nov 2025 12:44:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vOxo7-0002AR-AP; Fri, 28 Nov 2025 07:42:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1vOxnz-0001ri-8L
 for qemu-arm@nongnu.org; Fri, 28 Nov 2025 07:42:31 -0500
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1vOxnv-00036N-GG
 for qemu-arm@nongnu.org; Fri, 28 Nov 2025 07:42:30 -0500
Received: by mail-vk1-xa2e.google.com with SMTP id
 71dfb90a1353d-559836d04f6so1319499e0c.0
 for <qemu-arm@nongnu.org>; Fri, 28 Nov 2025 04:42:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764333746; x=1764938546; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ux7V/vcnfKVnQVQzXuR5cKKTLtK6T4UuaelCSQB/P7E=;
 b=si3MJAc/yCGXyhXydOp7QVjyOFg+wl71mMH5NW7+PF+VaPD0FGwZVgxYLXjuzqMT7p
 1Y0/UvIH813YHUiyEVTTs+soidgSIcssgA9eYpIcplB3ELh6O/f2IhHbscIu+gO68MHm
 M5FJIcF1lGK4+4RXTqDsSwO2z5Ct/2vUsxAfBqnuz0V8/n5k6KXO45bpuioDNsJSEPpW
 lMWYOUjANFRg214cIVS/FgJVdpdDQx8ZNa8hoTrybslK9q+fgkvfX58nQLOLCX5naHfG
 657gMFMK4pwLIDIJr8lgAGD5Vc/KbCwnO71UbaG6XceyBIoLuMvgLd9QOZRsF2vc+kfz
 HSqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764333746; x=1764938546;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ux7V/vcnfKVnQVQzXuR5cKKTLtK6T4UuaelCSQB/P7E=;
 b=aHYYl+pBMQQMrhzTCH8Zm8run1NWxIngwA5PS6AhzfjR4zV5ZL5CeGfNcOai0c1y24
 AQ8vygPBk7UY6G9CvWE1sq1MFJOYPJnhA9OiFKhSNvuqzUg/b4UTG+chdGs+ofubD9KX
 l+jMawybObb4qa+hv+sBHDsZFwep2xV8Uzm7sf411HX1wKzc17ew0KFDf9HZpnNSbHwR
 jp//zWqFMyW4S19RbIJwhQ+hWH7HEMzT/ZjTuheaUqEgC+Z4NZD0wSEg/5XYvl4RqeJZ
 TkONGV5T2hMewB3TLm90/homU5k8ojsrgRo3OvujNLMZXzV+YtdS7BKOscoXwzgD+FyA
 8Ifg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSwaNbaOguZHh7g+P1OZtIGmoJ4k4Oac1ig42Hpu1aGAOT87XnnjsxgO30lPy3iP/2QIV77cXp+g==@nongnu.org
X-Gm-Message-State: AOJu0YzowvHoHuCPRI3axhPMWaqIWGbbjylJrLkHtTumDg1laBeApS+t
 KerFalVbfs5pI51Hy4WqtO4snbaN5rdsF6iPcavL/1aSMNxL+y8XZdbuIjQoDy0xapg=
X-Gm-Gg: ASbGncu5vG33KqcIP8di4AbXdDwamKgl03YV6j+X8ygGJKWuV6W+stBwpaiW6lc2DjD
 fbrB5tUals66QIHl9MIBwVb2st3SEqTgyZDUA+WA5tQKy6OmEiI81vIsIBlZePbIzhGNxMJJq3g
 Yo4qRSnRDzZbQZJKLYHhYF2gvTwoZt2Cucy3B0aisZdi7q6DhCGRMjTsG+A5KejPZp/xsk+GVHB
 j/7x3XCcVWvjnCvCckchYFF7/ZuCekfMGbO5KdvPGpO6ahwF1uz55Wv3dG2IyqeXfGA8RYDy+9d
 iMjJ/qxqU58gGYiQq2QB+EHYWJapSJ3LC3bm42DIpOc1wfSVqw01kUp002lawb46MgN8yTj1gms
 nQt/fXx3Cri8pxPw1hPGE7Mz6hsP2WrUuZ0JJtSDfLnyZVUUoqPOui0c8VYebcz69UsXN4vQelT
 STuVlzZDL880AI0js=
X-Google-Smtp-Source: AGHT+IHlzQ57t4dcBZK6NHRL2f5576mqrLpy4QrKB9k4lPeKHAYQOHUVFPBq4iB8CQgiCSiBYcMoXA==
X-Received: by 2002:a05:6122:6602:b0:559:ed61:4693 with SMTP id
 71dfb90a1353d-55b8eff01fcmr10420434e0c.10.1764333746328; 
 Fri, 28 Nov 2025 04:42:26 -0800 (PST)
Received: from gromero0.. ([177.139.2.175]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-55cf4e1d56asm1776930e0c.4.2025.11.28.04.42.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Nov 2025 04:42:25 -0800 (PST)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org, richard.henderson@linaro.org,
 alex.bennee@linaro.org, philmd@linaro.org
Cc: peter.maydell@linaro.org,
	gustavo.romero@linaro.org
Subject: [PATCH v1 2/6] target/arm: Initialize AS 0 first
Date: Fri, 28 Nov 2025 12:41:06 +0000
Message-Id: <20251128124110.1272336-3-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251128124110.1272336-1-gustavo.romero@linaro.org>
References: <20251128124110.1272336-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2e;
 envelope-from=gustavo.romero@linaro.org; helo=mail-vk1-xa2e.google.com
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

Move the initialization of AS of index 0 (ARMASIdx_NS) so it happens
before the initialization of the other address spaces. This is purely a
code organization change with no effect on behavior.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
Suggested-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/cpu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 39292fb9bc..1640b20b4d 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2158,6 +2158,8 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         cs->num_ases = 1 + has_secure;
     }
 
+    cpu_address_space_init(cs, ARMASIdx_NS, "cpu-memory", cs->memory);
+
     if (has_secure) {
         if (!cpu->secure_memory) {
             cpu->secure_memory = cs->memory;
@@ -2175,8 +2177,6 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         }
     }
 
-    cpu_address_space_init(cs, ARMASIdx_NS, "cpu-memory", cs->memory);
-
     /* No core_count specified, default to smp_cpus. */
     if (cpu->core_count == -1) {
         cpu->core_count = smp_cpus;
-- 
2.34.1


