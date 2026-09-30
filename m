Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B4FCCA5FC4
	for <qemu-arm@archiver.kernel.org>; Wed, 30 Sep 2026 19:26:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xBzwP-0004OX-Fx; Wed, 30 Sep 2026 15:26:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dominic.plunkett@gmail.com>)
 id 1xBzOy-0000pg-67
 for qemu-arm@nongnu.org; Wed, 30 Sep 2026 14:51:36 -0400
Received: from mail-wm2-f12.google.com ([74.125.225.140])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dominic.plunkett@gmail.com>)
 id 1xBzOv-000818-MD
 for qemu-arm@nongnu.org; Wed, 30 Sep 2026 14:51:35 -0400
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-4a003bd18e5so20872795e9.0
 for <qemu-arm@nongnu.org>; Wed, 30 Sep 2026 11:51:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790794290; x=1791399090;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=1dOQKJr6jIAlX3myoLASqWM+1eX+YsM40ILKtC5LWAg=;
 b=DSYmeEN06G9HIa+HOk+9Pgl6feWH1Gs28zhTSH4mL0doyc7EjDVpf01XxzimJuVxXj
 qA57d+w5nsCtGe7CapsSwtTMKQqwZhAAavTC/uvhaWhA3czTYS6ni7a8D0XqBn92jXck
 drZEWlvT9sVAJuvdmIKXVE4gCMvfwSvu44o4E/jGPga43COBmWAhL8qr0hihN+KzfKw0
 w6KT/oI660ww4HYW2CoA0jaiQ4cCjbd0BxG/82XAd2D2nqSYpcQOWa1uWd9NGwljeQJ5
 kyViGOU4yfDkD00QKzZxkM3fhw2n+bnmYXLkSHvlsBNN75DBne8T8sFOKTK+lwB9aXgU
 hP/Q==
X-Forwarded-Encrypted: i=1;
 AKwUvBzflgorE4DyBasG37DIV+UNnF+BFjdtMjuTUrWTnjj6IAWbklM3plXMHPYb/fq8KrchM2xQvKY9rg==@nongnu.org
X-Gm-Message-State: AFuF++meyxwEmY9r1+4ApAJ9MIq9ALhUp6kFIq02Bgg69wiiCE+IgRFG
 jmZu1s0efAQ0kEHQTtPENrG22DhdvwO22/clq7A6GgRU+i4lnI5FI7ft
X-Gm-Gg: AYBFou25/yyAVTyccvYk/EXKXc5qkqsDxc/Wcs7KP2W9PyFPP7CvmeC+SsKnXGEU16B
 fg6DuyQjJCEKWAHvEa3rVom4KvJv+hcK9B+lN8jbgd3y0FunXbACVPifj/finG0F7fCd2F1bb/q
 tnRhPNP6eXVeifm0/I+kOvX1Sfpqa+EzmQd2DU8D+NKrGjjgSwBbqUeHSSV3V+KkYVbWfbRs6AU
 W7maW9/FFMpPB1O0lAQEZCrWrqhuOmMmnJvcEgBT1EvgEGV+2zmgSm0RpyL1om5iwF4aSYRO57v
 nAsaPLJ/Yay5M7h+5P5rdfcJBkvJjdfCsJ9ubf+ixBcB7//hgamwV2dQAMU6/9Jwt9yYh2rSI9j
 WErqFHTSUevx1kCfXgfl5G7zNL6wcznn9a5N/1FLIRTgbO75jJdzn46kNcWx14R8Sezyo8VsvIM
 VVv9QxZez7fY1LSy2OVaT1TjIp3lT5JtjcS3snakHnc0Dru4d5rCzv79c=
X-Received: by 2002:a05:600c:354f:b0:49d:2536:402e with SMTP id
 5b1f17b1804b1-4a01b11a05cmr40627305e9.30.1790794290390; 
 Wed, 30 Sep 2026 11:51:30 -0700 (PDT)
Received: from tower ([185.182.52.52]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48b068ff96dsm1162790f8f.8.2026.09.30.11.51.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2026 11:51:29 -0700 (PDT)
From: Dominic P <gcc@gcc.dp11.uk>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, peter.maydell@linaro.org,
 pbonzini@redhat.com, qemu-arm@nongnu.org
Subject: [PATCH 3/3] tests/tcg/i386: Build test-i386-opt-shr
Date: Wed, 30 Sep 2026 19:51:24 +0100
Message-ID: <20260930185124.3036980-4-gcc@gcc.dp11.uk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930185124.3036980-1-gcc@gcc.dp11.uk>
References: <20260930185124.3036980-1-gcc@gcc.dp11.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=74.125.225.140;
 envelope-from=dominic.plunkett@gmail.com; helo=mail-wm2-f12.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 30 Sep 2026 15:26:08 -0400
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

The old Makefile.target built every tests/tcg/i386/*.c.  The meson
conversion lists the tests explicitly and missed test-i386-opt-shr.c,
which 5fe51606146 had added in the meantime, so it is no longer built.

Fixes: b4e3e90d61 ("tests/tcg/i386: user tests")
Assisted-by: Claude Opus 5 (Anthropic)
Signed-off-by: Dominic P <gcc@gcc.dp11.uk>
---
 tests/tcg/i386/meson.build | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/tcg/i386/meson.build b/tests/tcg/i386/meson.build
index 4152371a3f..26bd85c05e 100644
--- a/tests/tcg/i386/meson.build
+++ b/tests/tcg/i386/meson.build
@@ -28,6 +28,7 @@ tests += {
   'test-i386-fxtract.c': {},
   'test-i386-fyl2x.c': {},
   'test-i386-fyl2xp1.c': {},
+  'test-i386-opt-shr.c': {},
   'test-i386-opt-rol.c': {},
   'test-i386-pcmpistri.c': {'cflags': ['-msse4.2']},
   'test-i386-pseudo-denormal.c': {},
-- 
2.55.0


