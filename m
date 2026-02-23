Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02C41EC1113
	for <qemu-arm@archiver.kernel.org>; Mon, 23 Feb 2026 17:12:49 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vuZMh-0005FI-85; Mon, 23 Feb 2026 12:05:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuZLD-0002uT-Jw
 for qemu-arm@nongnu.org; Mon, 23 Feb 2026 12:03:30 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuZL9-0000QT-Bq
 for qemu-arm@nongnu.org; Mon, 23 Feb 2026 12:03:27 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-483703e4b08so36485895e9.1
 for <qemu-arm@nongnu.org>; Mon, 23 Feb 2026 09:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771866195; x=1772470995; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=cwI7KECXfXNz5KI7P3D4TAbbo3v+8W/zQ7gFbJfb+Z4=;
 b=oEh9X+SZMbhnsOSo/S09eriZbqI2Tv+F6wJIRtRRpdZ0znaIRGa5ulZ8KSYnKlGpbk
 xkCJAIPSdmOyELBvheKN9N1KjiT00YaVG4BwRBzPiKQWUInArZ/4S+KuDqMtL7ROr9aC
 Ys3NoLuzRdFtSamSozVzwkWzkGgVFKl522x5UcVBTBFZeVSsSYrZYPwzyQTB0apu/o8e
 GRC8tkpTJI5/nhBRal0iqJxeXcQ0XVLa4LaWsQEGvQWIc8vbeb99piVmay6rBx8zIZbL
 DjKus3b7eIqiG0dhJLcbbXX57xy0cOnNWVaBGPm+08C83C1FHpjNXphrXTGvYZhoPISJ
 yYbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771866195; x=1772470995;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=cwI7KECXfXNz5KI7P3D4TAbbo3v+8W/zQ7gFbJfb+Z4=;
 b=cD/B6MIbBWLKTqqeLPXvsVzkyZ8j0Fa9tBrdukXmh3ANfflKcM2X05uHVuiO/hlS0c
 /Eb30ehRXMxHnkqDX80w2fAvp2zjcFewE1JbEeeCdYN1xE+aPzo4F+orQkNcagxw4WsF
 AfOGocIggfEpTahJOB5Tkz8gWMO/Yem8Tsz3qXmRY/9eSeG+VlsKcyb47QrfwtmLK6RY
 Ow8chWCQhgImk1jU2BLbJrpeluQYPHXMm3u3ajVSuRzK7nL0gd7yFz/C3AmgPMDpU/wD
 PCSUgGhKRRXDG/i7GEQZ4LjRtgwC8QpyWEftX4l2fXWRRGdVJWI/9eFWzCll+zrypcMY
 XoBg==
X-Gm-Message-State: AOJu0YylExwaiS9q8A7UclitywMC76Su3cOc5B27FeUS0wn/XNLlScUS
 qp6F1eMV8EIlWYhNZS4SJeQubRoPSX4kLlXR7CBHyitMYV4WvpyQWt5+dmGVPfad7vsnsjsQ1/E
 ARNrX
X-Gm-Gg: AZuq6aIv0M10A3nLre2BK93LogrZq72vsVAhohVzwQJKGigzTIn/9QNEJ47MH7q/1Pn
 Nb/tiZG2dzZLD0aaJ0XxfLVhrouL2enqQpcboGhIFDV+sWBBfgBmwAYkdV/zDOADSa+SAz75YyM
 lu1SpWsGpMVCy6raPcU1mAFwK4V02BTq6MO26EIJDmNPriIBY1hlv+C8I9hpb+dh2Sir+aVSqPV
 SnG8hHVEUvObsNlS5Xk3Ksjikldaf+jUSJ/IvCiD827tW36cmDhZq+gSFdZ6OtwDrIvchLdAxow
 uyhW7W8u0k+eggnNrR2GxozRZ/R89lSjqjQSU6MA+E3qJZ3Dxbfb2t/DjX7ys1oy9gPk2vuvCjf
 Hgi1ki91TGubfGJuZHaQQXWFGGnB8mQEpUDrse82MWVqol3h/3BHtIHVfttj07t8xOJBcxjcdZl
 RwoNCgMfjs6/EUssUlU/aKtWVPi3fSUJHj1PQ7L/bdRiCaX+TWzQs04rPdZ7kCv6NTG03dMW/Ft
 /jlIrbZ/toc7CM86HToeOZgVFb0458=
X-Received: by 2002:a05:600c:1989:b0:479:1348:c63e with SMTP id
 5b1f17b1804b1-483a94c99admr175517055e9.9.1771866195261; 
 Mon, 23 Feb 2026 09:03:15 -0800 (PST)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a9b21ceasm200155625e9.0.2026.02.23.09.03.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 09:03:14 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 55/65] hw/arm/virt: Update error message for bad gic-version
 option
Date: Mon, 23 Feb 2026 17:02:02 +0000
Message-ID: <20260223170212.441276-56-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260223170212.441276-1-peter.maydell@linaro.org>
References: <20260223170212.441276-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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

As we added different valid gic-version option settings,
we forgot to update the hint in the error message produced
when the user specifies an invalid value:

$ qemu-system-aarch64 -M virt,help | grep gic-version
  gic-version=<string>   - Set GIC version. Valid values are 2, 3, 4, host and max
$ qemu-system-aarch64 -M virt,gic-version=bang
qemu-system-aarch64: Invalid gic-version value
Valid values are 3, 2, host, max.

Update the error string to match the one we use in the help text
for the option.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Mohamed Mediouni <mohamed@unpredictable.fr>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 50865e8115..8dc999712c 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2971,7 +2971,7 @@ static void virt_set_gic_version(Object *obj, const char *value, Error **errp)
         vms->gic_version = VIRT_GIC_VERSION_MAX; /* Will probe later */
     } else {
         error_setg(errp, "Invalid gic-version value");
-        error_append_hint(errp, "Valid values are 3, 2, host, max.\n");
+        error_append_hint(errp, "Valid values are 2, 3, 4, host, and max.\n");
     }
 }
 
-- 
2.43.0


