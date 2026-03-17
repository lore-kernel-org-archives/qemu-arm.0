Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF2F7FED9FE
	for <qemu-arm@archiver.kernel.org>; Tue, 17 Mar 2026 17:50:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w2YXo-0004mK-IV; Tue, 17 Mar 2026 13:49:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucaaamaral@gmail.com>)
 id 1w2YXm-0004lZ-PS
 for qemu-arm@nongnu.org; Tue, 17 Mar 2026 13:49:26 -0400
Received: from mail-dy1-x132c.google.com ([2607:f8b0:4864:20::132c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lucaaamaral@gmail.com>)
 id 1w2YXl-00078b-93
 for qemu-arm@nongnu.org; Tue, 17 Mar 2026 13:49:26 -0400
Received: by mail-dy1-x132c.google.com with SMTP id
 5a478bee46e88-2c0bcd8f194so4131812eec.1
 for <qemu-arm@nongnu.org>; Tue, 17 Mar 2026 10:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773769764; x=1774374564; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=530Uj1XxFv4n0VaFgxJ0F6ngR3XyAeVR0aKHfSOSPFg=;
 b=A6gath4Kc9Ecd1NYiYwsYR87R3HJAxSWAUfn3LM6Pc10y2zR53oSaEr4JNWuEif24i
 K5vYCGBftdKdfkigJxepznml37MhBolLdoSz65uqHAZUVx9iWLxkwAQsPiBq/Fuzp7g+
 xlDImdeT+hkZpT/ECKT59zMLJkWxruc9gNYlPD7GoY+kl4bFJzuwpZEmTibiQp+Mrc0z
 CRNhcK81e2Hhcoi9YewRyoCEvrQ5G8OWUDrsPBJYO3hG6c0wqoFSj9lbvb+tQgVk49pP
 xfw8N4SgNeDItnC11eIZgGaczvzGwI7WthvFYBby3poV7dJFdrELmEGy0vcx4fYhFKye
 ZKzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773769764; x=1774374564;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=530Uj1XxFv4n0VaFgxJ0F6ngR3XyAeVR0aKHfSOSPFg=;
 b=aDw/XIMbQ4HUHMoywvNSv+m9EXovzymE7f5FCObgxAVpQEyRxyJtO+kEQfDpPrWRPy
 CKdau/NTXA1xZBpOPUuBC9ikyvP0YZ+VZRuFkNCvhdhfrnf7mDMJ1wBvgalKZNRVgJw9
 oNfpFId3mU0o5rGyI2d1CPwuDS+KEh1UnCR1d6n+fy6YyKGR+JlgBu6mT93aznVJGSGC
 wZopvLZeFUgDl+ZfAbtF+F4bB3vqeUduTjm7Q8mt0e/Y01i76jiM7ufOIQb0W1eMCqWg
 +RL+QDse9svjljZ9gE6o28zs1amW52mVTNzWbCYRoSPUpqeRFMKKVRPvoFxSPSGlUxCL
 XNRg==
X-Gm-Message-State: AOJu0Yw7EBGDE7xgTM9eSB7h131ClqKy6+YDprK3JBUtIbtyMS9I0KqX
 Zvr6mhOXY6b92laCGk1QyC2Y252SHO+ieUvfDEw7xi9fltJvBpg5yYWw
X-Gm-Gg: ATEYQzwSyo9Ht65u4YflPX67s1fkwbV96tRETbeg0s0oiZoR+Dyd8SBABE6oRrPRVyS
 J1fbYHKqGddIAwNy26m8F4R6QxUeRvEwYx/IM3C6LAGMyBEVIO2Zr5t7ZapJ2Pw/AbQBOJLUhFx
 aHCh+SZlenHM/xBCPdIJW/smFEZebUj1Nt5UfVAMeRuU3kYI8w4f8YEHiXvgJbJRQCVpZLslURF
 NxrVQRXdMgpkSWWG2ipHrQBb8TXygD3VpvjTBV69ZJky5IZDVpvqYnJgtbGaAOSxQtlZejKT7Oi
 0fnXY28y3UHJi/4PR8rTOFaomD6iELlha7tPHS+X9vkl/hkHScyevUHCdyiJSlwmoHJL/d+3JtF
 UgijxRJfMD0jvPYDQ3I6cE/DQBzCsqbzH/Pn7dT5tQQ7FVt8g67FvxykvsNDZ8hUP8V79AJaIML
 qf5iF/kn7IObPCk+l1dYA/gNQN8s7GIqgRXVjNDgBPxBdKeRFiNoibZs44vLTXYy0=
X-Received: by 2002:a05:7301:168b:b0:2be:ca4:e13f with SMTP id
 5a478bee46e88-2c0e5085f7fmr121739eec.23.1773769763843; 
 Tue, 17 Mar 2026 10:49:23 -0700 (PDT)
Received: from localhost.localdomain ([143.54.78.51])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2c0e536896csm282115eec.3.2026.03.17.10.49.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 17 Mar 2026 10:49:23 -0700 (PDT)
From: Lucas Amaral <lucaaamaral@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org, dmitry.osipenko@collabora.com,
 marcandre.lureau@redhat.com, Lucas Amaral <lucaaamaral@gmail.com>
Subject: [PATCH v4 1/4] ui: introduce GRAPHIC_FLAGS_VK for Vulkan scanout
Date: Tue, 17 Mar 2026 14:49:12 -0300
Message-ID: <20260317174915.31829-2-lucaaamaral@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260317174915.31829-1-lucaaamaral@gmail.com>
References: <20260317174915.31829-1-lucaaamaral@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::132c;
 envelope-from=lucaaamaral@gmail.com; helo=mail-dy1-x132c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Define GRAPHIC_FLAGS_VK (bit 2) in the console flags for future
Vulkan scanout support.  The compatibility check currently returns
an error indicating the feature is not yet implemented.

This prepares the display framework for direct Vulkan scanout
alongside the existing GL and DMABUF paths.

Signed-off-by: Lucas Amaral <lucaaamaral@gmail.com>
---
 include/ui/console.h | 2 ++
 ui/console.c         | 7 +++++++
 2 files changed, 9 insertions(+)

diff --git a/include/ui/console.h b/include/ui/console.h
index 3677a9d3..19ac06e0 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -361,6 +361,8 @@ enum {
     GRAPHIC_FLAGS_GL       = 1 << 0,
     /* require a console/display with DMABUF import */
     GRAPHIC_FLAGS_DMABUF   = 1 << 1,
+    /* TODO: require a console/display with Vulkan scanout */
+    GRAPHIC_FLAGS_VK       = 1 << 2,
 };
 
 typedef struct GraphicHwOps {
diff --git a/ui/console.c b/ui/console.c
index f445db11..424ee195 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -594,6 +594,13 @@ static bool console_compatible_with(QemuConsole *con,
         return false;
     }
 
+    if (flags & GRAPHIC_FLAGS_VK) {
+        /* TODO: check for Vulkan scanout support in display backend */
+        error_setg(errp,
+                   "Vulkan scanout not yet implemented");
+        return false;
+    }
+
     return true;
 }
 
-- 
2.52.0


