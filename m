Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2544219ejf;
        Tue, 27 Feb 2024 00:44:00 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV0YMyYclYyM0nVqxmm2IRIrR+0a2LkEEXH95oaHtqt2hIVn7UqnxF3Dth8Y2H6p1WCY0HfBzPjeFQj+5cjQHWFqjzw5wfb
X-Google-Smtp-Source: AGHT+IG0UdofxmDMd+/ngmIcdXC4o5rrHvFinwjmZ5tn2zQhaHAJxm9c9s2rYdTs/efzQ89BcjaN
X-Received: by 2002:a37:f512:0:b0:787:ebb1:4a79 with SMTP id l18-20020a37f512000000b00787ebb14a79mr20595qkk.35.1709023439940;
        Tue, 27 Feb 2024 00:43:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709023439; cv=none;
        d=google.com; s=arc-20160816;
        b=tNDYbtOxfH0wP7+8eB9RRjggbBaNCvoxCAdjLmuWlqC3z0iaNMYAWvaZkkpZr6cVzI
         lAaQKfXQgv/24dO1enqWnVlreEYaggFhvRf7nBDRgiQMpYdv+q6AWxdlJR5f8VjdLYz4
         /h8xaJ7pBCpexeOrbeWXigNmSDIz95fUC4eqYR3HOAP9jSy7rUHwjBGLRawhcXRwWO7x
         r79TDmLLtAaUm7jQpZBGySNxEbs8jvEQA7Ga97kcWT3dSjxzcrI0Ar6+rNACHtHUc31D
         Hq7l//2NO3BZwDnJlDl92GMBJka4i/dRscK/LgK9PPrZweg/5YtJeHAWaUkI+bMMELfT
         F0pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=SMgxNB+QPGXCEfWk+9rOGkNmwlpFY1sXlU4z6trziko=;
        fh=bxkaLlZ1JDenhvoxCyBF+zKQ87OvrSWsu6A24O+vhPc=;
        b=pE9/M1F3b+mGBSc7qX5PcFgZG+qvBZ37cMUxN8mE9NKdG4ovmDGe+Rn0qk7ITeOWsO
         PINPfB5juBPrfeZmoYQtGJZUh1HcVjY0XWDh8X6ofr8VDuqfdoOCunUiOeOoqB2N1O0p
         qyq/TWMw5Gh0ezvyK/QDJSBF7rn/nS7ug/Hj7kCmyQh4dRtj27zbYedoV6HodfvBmxKu
         uNzQex/uOqRKgIFI48LFUl+IQW/dx3a8riwrA7TS0u2OUzSlGG2Ti4jb4lNGXSFCePxC
         QPApQbBcFLysIWPXnioG0v5lS0OZB1AVZ2J122/LiZFsEhlEdgiVfvKeLj61MEjPQ+wA
         g2Xg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Um9Gm5mK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v19-20020ae9e313000000b00787b81532d8si6957579qkf.417.2024.02.27.00.43.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Feb 2024 00:43:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Um9Gm5mK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ret2c-0003TH-90; Tue, 27 Feb 2024 03:42:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ret2a-0003Ne-Rk
 for qemu-devel@nongnu.org; Tue, 27 Feb 2024 03:42:20 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ret2Y-0008MP-56
 for qemu-devel@nongnu.org; Tue, 27 Feb 2024 03:42:20 -0500
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a3122b70439so482055266b.3
 for <qemu-devel@nongnu.org>; Tue, 27 Feb 2024 00:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709023336; x=1709628136; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SMgxNB+QPGXCEfWk+9rOGkNmwlpFY1sXlU4z6trziko=;
 b=Um9Gm5mKbkYa9S+8ajIcML0zxcgRN4VOKd6aAmzZSGARRzyrOlgJQwhCmCd8prmvM4
 Mqt061HBFkuzrInGsAS4pJwkhyBR2OambTXWAQB5ftVB5kTVbqU/cxxpey0FKGuy25/U
 RibjKHLNO1k5LjtpDqNqNBdR9/vosdTqWOIWtaoScz7IrzJ2ffpQ6LYkIMINEyzmL3u/
 MsNgFy61JuqhAX8M7dwpNwnvH0qDjPXw22ttNhZOFiwQPqLdatMr0iKE1LWCV+7vIzWA
 Z0TKojRXYiIySiSZsUmLLlGUKgB2eh6CeZOGYYG0t2Xx9dVV0K7kND9W1v0TAtxIa+IE
 z16A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709023336; x=1709628136;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SMgxNB+QPGXCEfWk+9rOGkNmwlpFY1sXlU4z6trziko=;
 b=iPTd45ErBZQ0BXPNQUNVQBVDBJkannJK4WBsUiU4/o+Whlf7MBCaK3n5i69bgDtvUX
 +6Kfxg+RdqSqoH/q7gTKPhVKlwhhXk4lC2A1DuuWTD0mih87cY7HW43/HRv+dYDfhDU7
 UmCotTKXYYmMeJ7QhXv4UP8h19kJ2QG2V7iOv/vXYfZiL0nY/69kGgTyvf9W4/SJ+8qO
 R+tk2TGVSA2CKHbTUwhZ0zbYZrBr92nYy7GLketTuTp1SSXtGEANaP+jy0KIRPshWbYP
 3OjdtXUk0hZ93NbuP7OJMN+W4f32kjnSyDp2hRU3kQXkKH1rdNCBCmRzFHTIEKZsOGDg
 vK+A==
X-Gm-Message-State: AOJu0YxbbKFTBhgDHRq1k3cGa4lphLoG5ihY1WNokT5GDnCwc7gG7fMp
 hG3eJ0Ah1TL/J/6FJ7rS/mrmA2kAPFZq4ISohELkr4N2cp7+T3EcZxSAeStOlJW6ULEylmb2Xrw
 t
X-Received: by 2002:a17:906:1854:b0:a3e:b726:20ef with SMTP id
 w20-20020a170906185400b00a3eb72620efmr5739587eje.34.1709023336228; 
 Tue, 27 Feb 2024 00:42:16 -0800 (PST)
Received: from m1x-phil.lan (mic92-h03-176-184-33-214.dsl.sta.abo.bbox.fr.
 [176.184.33.214]) by smtp.gmail.com with ESMTPSA id
 lt16-20020a170906fa9000b00a3d99415705sm539438ejb.73.2024.02.27.00.42.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 27 Feb 2024 00:42:15 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-block@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Zhao Liu <zhao1.liu@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PULL 23/30] hw/i386/q35: Include missing 'hw/acpi/acpi.h' header
Date: Tue, 27 Feb 2024 09:39:39 +0100
Message-ID: <20240227083948.5427-24-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240227083948.5427-1-philmd@linaro.org>
References: <20240227083948.5427-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: sb7DxFwblF7n

"hw/acpi/acpi.h" is implicitly included. Include it
explicitly to avoid the following error when refactoring
headers:

hw/i386/pc_q35.c:209:43: error: use of undeclared identifier 'ACPI_PM_PROP_ACPI_PCIHP_BRIDGE'
                              ACPI_PM_PROP_ACPI_PCIHP_BRIDGE,
                              ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
Message-Id: <20240226090600.31952-3-philmd@linaro.org>
---
 hw/i386/pc_q35.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index c89ff63579..3c80f37ead 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -30,6 +30,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/units.h"
+#include "hw/acpi/acpi.h"
 #include "hw/char/parallel-isa.h"
 #include "hw/loader.h"
 #include "hw/i2c/smbus_eeprom.h"
-- 
2.41.0

