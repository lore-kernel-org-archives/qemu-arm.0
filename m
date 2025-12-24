Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ACF8E75458
	for <qemu-arm@archiver.kernel.org>; Wed, 24 Dec 2025 13:49:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vYPDO-0006WW-1M; Wed, 24 Dec 2025 08:47:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vYPDA-0006Kf-PE
 for qemu-arm@nongnu.org; Wed, 24 Dec 2025 08:47:34 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vYPD9-0003jB-D8
 for qemu-arm@nongnu.org; Wed, 24 Dec 2025 08:47:32 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-47bdbc90dcaso38733335e9.1
 for <qemu-arm@nongnu.org>; Wed, 24 Dec 2025 05:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1766584049; x=1767188849; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vEDW4pEiOQF8aZTfRkTnnN7IXm4k0EgK0HcgihEUm50=;
 b=XrhVX0ttzGoUcaMV8zurqxZEZ16jNyjqtSICZY9/hwZ3yvcb0ILHRhvNqNEMPc5OZn
 1GQY2TIA2CbWlc2WkCf6AWKtnoVUsP/Oc8AGQTvDK0TuISCkma/sqWoHygRxWhXFCnHv
 MGr6Y1zeoELCsSu1+e1rex4GJuO+wEFM5YzhehTqeVeCAWhz++x9JTJMz9uQ1mbPmvGS
 iFSHDB6JmPyRGBw5N0XlUdIB1FR0BjkzFJGix4jxY0SqGMNgETjtdBeTU2OLi37WF4jB
 QtFvCHsKUtWuI58vLpiAyWJRdnKTy17MbISxQPYXBW0/v7vbmhni1xGZF9iHjpBKYA4/
 HxRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766584049; x=1767188849;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=vEDW4pEiOQF8aZTfRkTnnN7IXm4k0EgK0HcgihEUm50=;
 b=EnhDjwO5Np/Au6t4tEZpM/j9NYJ7FMyZwBbnVR9fZDfDZPbOA3cRdsrU3iFV8arVdQ
 322GbU8o7d0HcVMl8ODzlVgn0jO7/lmssiAGj4hAMAZ/iwb5LyFOr+KEBl2QYFjtBZHg
 JxtZ46On/z2MWYaFr+SJ48xi9RVAu1V22FShUD4hsYH78pLoEl+ZzOI89rY6sxlJcz/R
 1xofpTRrB4571FD+itov8+RyCPkgnm092GnEk64LGkPic82UJy9X2CRSzC/dK+iWjT3V
 LUoF+qfH7XhWmhuVfL0zmne6qZhGXshC/dcoKZm19/yB8EEESLrDTbWLnOiVIyTRsRqX
 AzvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWqlsKc5AvmlboNF+YXXzt3R77Y6UvInmF/8Bk9RwA3i8xyHT7njRsUERUaFY8/gNjdkrhkBOkRg==@nongnu.org
X-Gm-Message-State: AOJu0YxQbSVDq/0WNp12DDr46HSPM7QESuT/p82/CFUJgSpv7jugxFem
 8ucztT7LqKYmmzZYIwcKcHubzfx8497s2gPWQmtToNBgEnxl471bnUFEV81AZeBX4X4=
X-Gm-Gg: AY/fxX58/YAeaaNz4ZVoGRCxX/yPIVYSfD8D5HCOU8Tco7kyqL2J1DrMXcxx3PU5dvr
 PBx3TR7S/1rOVXBpb5kCKEv5c2cbz/8MwZCPEz3IumtLVtQLOdGF3zO/uu0uXW+kqfTIKIFVu7G
 X3yCYBa+J7T+eGYfOm73N/conRlLNt0RPI7psztHIz/pkw0hycCCm3WBYWU3w77bZas6gTMIpKN
 uOqSOKZ0s1QClRDFWe7nHfDPCH4PuHswGoj81tfd3AQSiRCBOS3hJxVWogEXW+hOBZr5JGjT6cK
 5lVz4v6tE7dPOdkEAf5bxr3BreAR380EoSaw+OPFdu+zaltBXWlKAwf78XQNJ4B1DTuiXxXkA8A
 /tpN4B807TZXQ1kus741omu4KKtzFmiIIm/7fa8Y6u3JMaLJqQ6dgzQ56RzMhLibt3llpMCOezQ
 NsD7PXGFax+oxD4dC+SUjYNZ3xVY7m95qul63uKYOiyYbLa89cQlZatHqaOigd
X-Google-Smtp-Source: AGHT+IHnqJsRELm10jBU2RIDVAqxKRtc3Jq/rf5twmbfPMauJFhpRv+bid2csAak0epOYGPiW2VxtQ==
X-Received: by 2002:a05:600c:4ece:b0:477:6d96:b3c8 with SMTP id
 5b1f17b1804b1-47d19576da2mr172053595e9.23.1766584049207; 
 Wed, 24 Dec 2025 05:47:29 -0800 (PST)
Received: from localhost.localdomain (218.170.88.92.rev.sfr.net.
 [92.88.170.218]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d193cbc0bsm300874335e9.11.2025.12.24.05.47.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 24 Dec 2025 05:47:28 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, qemu-rust@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Anton Johansson <anjo@rev.ng>,
 Max Filippov <jcmvbkbc@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 5/8] hw/timer/hpet: Mark implementation as being
 little-endian
Date: Wed, 24 Dec 2025 14:46:41 +0100
Message-ID: <20251224134644.85582-6-philmd@linaro.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251224134644.85582-1-philmd@linaro.org>
References: <20251224134644.85582-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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

The HPET component is only built / used by X86 targets, which
are only built in little endianness. Thus we only ever built
as little endian, never testing the big-endian possibility of
the DEVICE_NATIVE_ENDIAN definition. Simplify by only keeping
the little endian variant.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/timer/hpet.c                  | 2 +-
 rust/hw/timer/hpet/src/device.rs | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/timer/hpet.c b/hw/timer/hpet.c
index 1acba4fa9db..bfad626d5e1 100644
--- a/hw/timer/hpet.c
+++ b/hw/timer/hpet.c
@@ -648,7 +648,7 @@ static const MemoryRegionOps hpet_ram_ops = {
         .min_access_size = 4,
         .max_access_size = 8,
     },
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
 static void hpet_reset(DeviceState *d)
diff --git a/rust/hw/timer/hpet/src/device.rs b/rust/hw/timer/hpet/src/device.rs
index 3564aa79c6e..4f4be84115e 100644
--- a/rust/hw/timer/hpet/src/device.rs
+++ b/rust/hw/timer/hpet/src/device.rs
@@ -708,7 +708,7 @@ unsafe fn init(mut this: ParentInit<Self>) {
             MemoryRegionOpsBuilder::<HPETState>::new()
                 .read(&HPETState::read)
                 .write(&HPETState::write)
-                .native_endian()
+                .little_endian()
                 .valid_sizes(4, 8)
                 .impl_sizes(4, 8)
                 .build();
-- 
2.52.0


