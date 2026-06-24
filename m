Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AD0ECDB481
	for <qemu-arm@archiver.kernel.org>; Wed, 24 Jun 2026 13:39:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wcNoT-00029H-6l; Wed, 24 Jun 2026 09:38:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1wcNnV-0001fu-KO
 for qemu-arm@nongnu.org; Wed, 24 Jun 2026 09:37:47 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1wcNnU-000178-3D
 for qemu-arm@nongnu.org; Wed, 24 Jun 2026 09:37:45 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4924e6fda5dso5554365e9.0
 for <qemu-arm@nongnu.org>; Wed, 24 Jun 2026 06:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782308263; x=1782913063; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Ee6Ws6ilv9tNM/LvFU3bwJGyeQM+X3lbEmSo0Osct8k=;
 b=TFMATFQKo/5SYtVdHKwgfFw+X6cPvmQdNTHacmZnGKx/NBQBJP4CQRq5A1+T4c2A8Z
 23C0uAEvD38g+Q/i6NSeVLhjez2bGAKy9SPcdPBakLRKmZQ6D7L2ATmgbEk1WgYExCyw
 v3zuT3jNrSx93LKjvptRbFxEoT7HepqQdGSV7n1Hl3y7gL8LTKIzkzPq+Iw9jv//zMeE
 vab3kQxdMXXRNnniDsJhLDOvOYi6DYONbmmszhCaX8dqr6f8IVm9vccaljIFxI7LRgIW
 +8OwapGIRVeaucp4aHDo8Q0rhXJccHjQwZcEAiy78Di8Zt5BmSKaY1i7uEYkJ6jtmCC9
 XeBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782308263; x=1782913063;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Ee6Ws6ilv9tNM/LvFU3bwJGyeQM+X3lbEmSo0Osct8k=;
 b=YCOmjdbCX4eZ+l54+YOnK4QdujODPMAWxPevCB++NFmeV41yrmR2MPM0vrtjk7Y4Ys
 c3PNVecowBSjw52bBk1PKluLAZKuae8ROhSHQT5Nb7CJ8anVAghXVhzi2fEKicxVeMuc
 oOkE7jq0KXIvqgJ4C8d/3poAimHgjVj1GrDnT4FRK5ApqI1YbwDZo2L+gkfLdHaFeJ7s
 E7oILxsvx08WOGNpGTuLfD1oc7pEKvDSiY5MqZlfRZGlrTEs5dEhzj/ZFEu6ddtsa7JP
 byNGlsCzr+pgPAXCYipI2AcKenTncm9l+BSYdEILE9X/x64gNZifbMwj1jhAwR4QwSUf
 4e3Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ8KmOPv8vaHOGa0fQ/RK/qL9Eu7yAgzNpyFYdKbq3TL8qlv6NWCMKzJW/2lOZ7OZrV2UVXS1MQb+Q==@nongnu.org
X-Gm-Message-State: AOJu0Yyi6uufVDP+Xh2tDTRVaIXTZ6958xniSMNW7PeVw2dHzwRUuBQd
 PnaC7Nl0xuKpGxVibIyVlGmUmYfULZnTvJNMJTKfOeRY1ctQmBJgP4s/Uoe1VRmr7Ow=
X-Gm-Gg: AfdE7clIuzG9h0xagh0bpIfaGLVErMCKYAjVKaI9vfd56wc7zSPl4kbhXfAjQU4880N
 I/v631EaYLlWXP5do3BwQTJOKFxyHb74WQlSlUAfyoAoVlXKvoATvD4Dy9WyguIR+qg2iQJzYio
 0ZwhKxV8qZppFNLOKsKk3kZXgfB2b90eDx4Sh+R8SGbQM31LqWQGw94uhlfXK0HZduKYIloWAHK
 ZQZE9ZJOo9MLNJmaIwPDGFwDX15sj9f30ymQ161hGq1l/M8hnxALcFtaXDjkwv+kY9IS5SQRFlS
 9wqZ5MbHAfGeqlOZpXI1QeEYeJf3X29jcqiHHh+lokZK5Fydp9rAxb3bwSneotwt4a/XwAq0V/V
 ugObnYrirWvje14DUCH2XzYRIr7UmF4EY7WjtThtFwICWNeJFqWxEH79iBH6984EZtUhIyQjDw5
 1RpNHWj9hlyjrQDAw=
X-Received: by 2002:a05:600c:8b03:b0:492:45a0:dcef with SMTP id
 5b1f17b1804b1-49249083cb4mr270896595e9.5.1782308262621; 
 Wed, 24 Jun 2026 06:37:42 -0700 (PDT)
Received: from [127.0.1.1] ([2a10:d582:31e:0:2e21:1ee8:260f:9a76])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46c1e840efdsm6646334f8f.5.2026.06.24.06.37.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2026 06:37:41 -0700 (PDT)
From: Jim MacArthur <jim.macarthur@linaro.org>
Date: Wed, 24 Jun 2026 14:37:29 +0100
Subject: [PATCH v2 5/6] docs/system/arm: Add FEAT_FPRCVT to A-profile support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260624-jmac-fprcvt-v2-5-dc6cf8e512b6@linaro.org>
References: <20260624-jmac-fprcvt-v2-0-dc6cf8e512b6@linaro.org>
In-Reply-To: <20260624-jmac-fprcvt-v2-0-dc6cf8e512b6@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Alex Bennee <alex.bennee@linaro.org>, 
 Jim MacArthur <jim.macarthur@linaro.org>
X-Mailer: b4 0.13.0
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=jim.macarthur@linaro.org; helo=mail-wm1-x329.google.com
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

Signed-off-by: Jim MacArthur <jim.macarthur@linaro.org>
---
 docs/system/arm/emulation.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index a8072ddb67..98c028f6a6 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -85,6 +85,7 @@ the following architecture extensions:
 - FEAT_FPACCOMBINE (Faulting on combined pointer authentication instructions)
 - FEAT_FPACC_SPEC (Speculative behavior of combined pointer authentication instructions)
 - FEAT_FPMR (Floating-point Mode Register)
+- FEAT_FPRCVT (Floating-Point to/from Integer in Scalar FP register)
 - FEAT_FRINTTS (Floating-point to integer instructions)
 - FEAT_FlagM (Flag manipulation instructions v2)
 - FEAT_FlagM2 (Enhancements to flag manipulation instructions)

-- 
2.43.0


