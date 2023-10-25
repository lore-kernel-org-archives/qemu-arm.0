Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2540644ejb;
        Tue, 24 Oct 2023 23:55:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGX/I8o4HmwKf7zaRflk0vUBouuLsxbYfAsUUwsXZOFX0SI5Eh4aR8Bk0EiVckIYVQ82hsD
X-Received: by 2002:a05:622a:104b:b0:41e:21c9:fefa with SMTP id f11-20020a05622a104b00b0041e21c9fefamr7658866qte.37.1698216916043;
        Tue, 24 Oct 2023 23:55:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698216916; cv=none;
        d=google.com; s=arc-20160816;
        b=aDd0qAuC5FB3Uw/QAa5s7tkT5iVmNim1RFCDcRYTkN8TRkalDqfng0o21Ika8a/cN/
         pFPDmz5AoCHRCqVuP136UR6H5nitPeD8uIVDFS+abigq48ImskdoW2vZm9gufqZX1Ren
         RYFJe44hWdSWgaaR3k+8hS8RolXpkZg78yEhMKrDLjzCz5CQV2UwK5z/MI+By5AIzh7H
         vq3thOVXbDW2Ht3oXHr0m9pyR1tR8QNV1YAdgTdbE+P+mfZQ9G2G0nQntjgQzYfnoMJ3
         mtm3izpcyq18hMOIGvyrxDKxMCG5qjph9mXLWz5rZ+mnteRgO1sGpLbzLgPPmEdfvUdB
         Aidw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=eqPNYapoHabm/VWRpga1kGUl+2jHRCqpJOCNvX0dn3s=;
        fh=lRRVOPoYb3+cZ29hqum0HLITbt48LVEaefnM2mDse8w=;
        b=t8OWJuOrUN5FU8pinGSp9dgUP9C1pw49VE6WOc6xWZhEq98h99lEUpC3r+/W1uElB/
         S6EXm0pbW0v3NqGJpoHLkmmFOYs61tLGZudy+0FLAz0UhqieXdN1+KkO3Vk1T5nvDVY5
         5kWvhfzlWJ8u0eg94yELja8gKnz4qLPwJ/lpBwJA2MCkZJyGShPRtDys8LL86sJIEzLH
         CfNsGgxs64Ldl6vYJ6aoN0p9DkiqjhY+WWnRA/jyNmw8U9y6SA2Apzj5YN7wTH8jpJa+
         CmFSeEYS+BH6IATCYmtMZh7hlrTyHlU+tUaBVfaEtcoJ+ve6imdqNnVet/a4whAXXK5h
         3irg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CsYfI7JL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gd6-20020a05622a5c0600b0041e39ff6b37si8410qtb.296.2023.10.24.23.55.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Oct 2023 23:55:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CsYfI7JL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qvXmk-0000cn-EP; Wed, 25 Oct 2023 02:54:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qvXmc-0000Gm-OT
 for qemu-arm@nongnu.org; Wed, 25 Oct 2023 02:54:28 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qvXma-00075Y-Oq
 for qemu-arm@nongnu.org; Wed, 25 Oct 2023 02:54:26 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-408382da7f0so43235615e9.0
 for <qemu-arm@nongnu.org>; Tue, 24 Oct 2023 23:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698216861; x=1698821661; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eqPNYapoHabm/VWRpga1kGUl+2jHRCqpJOCNvX0dn3s=;
 b=CsYfI7JL3pcuKoYOwruhKDwDhHtsh1vwbX68s9oI85dexDNdO6rdxNC59WtC3uYwyq
 fx9rIqEY9GUunVOM5UhN796b3e/H/fAcfqvkxTzRNwcjrKs7hUmE1Rve215euX0bHqkz
 vGE3g8PQOIFoV1LzN/T0IYC5WZwUf7itHzZ/euT6yUoNBDrvyg0MLuMR24tVbD9KzPkJ
 Dw/gzaLMLl2w+azcYN38nCBUZd1GwGs5Uxc3dQbPLkmwFzJcPvAhZ/OB2pfdOI9d2ZlF
 PLabTsxmPJBnIeDkmtE/04bRRFmncreE5x8qxYlfIQ+auk8Z5Gg0mei9kvjj4/qXUgAm
 J9Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698216861; x=1698821661;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eqPNYapoHabm/VWRpga1kGUl+2jHRCqpJOCNvX0dn3s=;
 b=QWtafmpM5BHKDe1RT4zM1youzOjVCuFro4ghrcKrfdsFm1FGIcG3K8Vx3GUUjoVvN6
 p1vHPfW94YsgjVggQPvRnDBK0/97g8suE6WNNRbBy4uK8TBXA5v8y8FhHNbpawa6rgC2
 TX4c9Rptagips+CzAzIj3p80jC8Uqt3jd8rOSfqbFHdRmDYaOR+dJIpFPp9VpEFotODH
 2StcBrWBucZl6egZKKH2/lPmSsrL58ZTD423+rldMDj1G7iDFI1t+tjg6rxVOxer6I6D
 dso3hRawKvoig2mQCGLNwlmhhJySjE5tqnW849Cto0AJfw4GqBZEdHUOjZSOe7jP+S+v
 Dn3g==
X-Gm-Message-State: AOJu0YzaPa6q6CK1sDWEJopQcmwFiAYV6WolZfU5QuP9+NuH4ic2x92b
 7x6GS5jMCtsEiUesSxg9NrWoug==
X-Received: by 2002:a05:600c:4e91:b0:408:4551:fade with SMTP id
 f17-20020a05600c4e9100b004084551fademr11646248wmq.38.1698216861494; 
 Tue, 24 Oct 2023 23:54:21 -0700 (PDT)
Received: from m1x-phil.lan (ghy59-h01-176-171-219-76.dsl.sta.abo.bbox.fr.
 [176.171.219.76]) by smtp.gmail.com with ESMTPSA id
 r9-20020a05600c158900b0040776008abdsm13659452wmf.40.2023.10.24.23.54.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 24 Oct 2023 23:54:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
 qemu-arm@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 10/10] hw/arm/xlnx-zynqmp: Remove 'hw/arm/boot.h' from header
Date: Wed, 25 Oct 2023 08:53:16 +0200
Message-ID: <20231025065316.56817-11-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231025065316.56817-1-philmd@linaro.org>
References: <20231025065316.56817-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: R95ATlkKE5FG

"hw/arm/boot.h" is only required on the source file.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/arm/xlnx-zynqmp.h | 1 -
 hw/arm/xlnx-zcu102.c         | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
index 687c75e3b0..96358d51eb 100644
--- a/include/hw/arm/xlnx-zynqmp.h
+++ b/include/hw/arm/xlnx-zynqmp.h
@@ -18,7 +18,6 @@
 #ifndef XLNX_ZYNQMP_H
 #define XLNX_ZYNQMP_H
 
-#include "hw/arm/boot.h"
 #include "hw/intc/arm_gic.h"
 #include "hw/net/cadence_gem.h"
 #include "hw/char/cadence_uart.h"
diff --git a/hw/arm/xlnx-zcu102.c b/hw/arm/xlnx-zcu102.c
index c5a07cfe19..4667cb333c 100644
--- a/hw/arm/xlnx-zcu102.c
+++ b/hw/arm/xlnx-zcu102.c
@@ -18,6 +18,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "hw/arm/xlnx-zynqmp.h"
+#include "hw/arm/boot.h"
 #include "hw/boards.h"
 #include "qemu/error-report.h"
 #include "qemu/log.h"
-- 
2.41.0

