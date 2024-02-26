Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp1911612ejf;
        Mon, 26 Feb 2024 00:07:12 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUy58hn+mJlLYuQ/aZsEJImJ2v7M78NB4P8YEXpKnMcf8GP+fXDmT+laJAM4GWRmojbJIgUSxsJOX+MAwUBENw1O255qiQe
X-Google-Smtp-Source: AGHT+IGPM+cKnKm4FImBf5WtY4nPyIij7eogz632KfaISUHmuY1NhkCHiGrDe/K8nZu8vq+Lfxh3
X-Received: by 2002:a67:b904:0:b0:471:e02e:1a40 with SMTP id q4-20020a67b904000000b00471e02e1a40mr2513471vsn.14.1708934832286;
        Mon, 26 Feb 2024 00:07:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708934832; cv=none;
        d=google.com; s=arc-20160816;
        b=oTuclUY7EswZohoWQ48UBh8Q0K+NE24cwe9xEUc9N0VZlP7GqGRccdQmYrwdylecvl
         zoYhn8RDkAcj++ZUhC8J+RmZqROs4xRjvQP5c2GNegkgrBwI7WzW3QUiJxesNWVrOhmT
         IufC3q32sWzMrB8UjDI8XEAkwHarh6Myc2Fri38ph3wCVjJg2OT//WMzmvNuOTBDaDqs
         1fZFn+Xhr0H6ELwlLLok9heEYQhcVPAbRDnni/MEroxGowBZOJGS9/OXS6vko18ShR+/
         NWX8tZbUamysyVzziHOrH7IS3Dvt61EDgK8lHL6UgZF2eihZIt7g21AQvS4fC0i3kGEy
         H7jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=scR0cVRlUQ+FFZFfcolEQrGBOQjFaxkZH3KxNR75t0E=;
        fh=aca9rmgxlinIxdMK28VrYARx0UGg95c8ASgjU1Eo5Ds=;
        b=YPYOwIsGNhDZRS1qYR346EDjTQzfe99ZKURT5G8tNemGYsIQHyte2a0REljD0SPkTl
         ufnDelibiJuMxJDTsYKYGnSlXoiCHZOgV/tg1I1TKRePHv7x/924t6aSdgvtbL/QnR+j
         jPi4NnuVcj7g7JTaBfMFNOUhzFqEsO9503Zuf3OdwSOcWDWUkFH4VLB982dIbWTHe6j3
         SbmZUUvUT6OddvCLK8/R3eNVsPd8i+jXtLv04ba4jS7p/Bvqs6dCU2dM+knATAelSZ83
         4fxC3hMCuYOD4tpMjwaTRRbSIBnbpgHQ1RaaPF8OMa65rlbSui9CPgAmuK0VUBNRp1cz
         vBQw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eYZzuphj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id de41-20020a05620a372900b00787bd084369si4977923qkb.364.2024.02.26.00.07.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Feb 2024 00:07:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eYZzuphj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1reW0l-0004f1-Q2; Mon, 26 Feb 2024 03:06:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1reW0k-0004dU-64
 for qemu-arm@nongnu.org; Mon, 26 Feb 2024 03:06:54 -0500
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1reW0i-0001dB-KE
 for qemu-arm@nongnu.org; Mon, 26 Feb 2024 03:06:53 -0500
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-512e568607aso2474934e87.1
 for <qemu-arm@nongnu.org>; Mon, 26 Feb 2024 00:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708934811; x=1709539611; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=scR0cVRlUQ+FFZFfcolEQrGBOQjFaxkZH3KxNR75t0E=;
 b=eYZzuphjZKw3vm3Rf8/6HUtXUzPpf6O1Y/rIvn3QmnlaSKM8PRADxCIU2psatcc667
 MuYVgjp3lf38Kn8NaWbzpDaHAIy1vFiS/AdTHOZyOxUIwwVc1ZtbA4yzoat34yKIkPvU
 g8GDjxGmZNlQu6/9yhiQbm7pG1gMXDeF3WyzcoN1BLN7U17klCnRKM4F/AqIztP7iHd7
 tvYK1wUDo9koPgyU3ysu2qh0xzHcsO6qPRi8tUfvP2j5/5ZyGGna7B3kndBuKipduFDK
 UuxKulDKV1jRFiGudE7t0Gq3AlO1exCEu+kIFfgeEOeZBaj3f/ORr7OQAunBllxwK2Kt
 1L+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708934811; x=1709539611;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=scR0cVRlUQ+FFZFfcolEQrGBOQjFaxkZH3KxNR75t0E=;
 b=V5LcBjXt4FjoI9bjWvlJPTZN6pxxCxs/t4JXZFm7VeCderaeHL/9rl5JxYDgscgxpn
 8FKknt065OijVamw6LWbdWP8JwH2ZifR3hfRulgoxajEeDRaojkyOfS4vGD7+fryxGwQ
 SNnIKmQHZIj0OJQ0QySNRuBhcCsQVtsufkUEmYU/jsUoXWWD+jrU4ubohRKY4hL7Uffa
 1clL2wSjxIZCxZSvsOjf8tVfDRUge+lqmDVNoOrtnswp4okVV8xy1Q58Cidm1fVgcu7Z
 ycpxpChyDmVovG1EztUQs8jhFESjorAf2pZUYMloVx7/SYLazgOKLSPwYNbVf2bhY5Z2
 ewqA==
X-Gm-Message-State: AOJu0Yz2f75D/qZIuE0jwEyN6wBywrqlGzNMFl8UX1Dk8LQi6Atg01SY
 hAv6z2Oe3TGAhq06nhTzMuV0vnjMkHCGxAVxXCIDaZRfG79Nprj5ackv93SSZ24mHQ6bL3CHkfL
 z
X-Received: by 2002:a05:6512:3290:b0:512:dc3d:6bf8 with SMTP id
 p16-20020a056512329000b00512dc3d6bf8mr2955095lfe.56.1708934811087; 
 Mon, 26 Feb 2024 00:06:51 -0800 (PST)
Received: from m1x-phil.lan ([176.176.164.69])
 by smtp.gmail.com with ESMTPSA id
 z1-20020a056512376100b00512d252759bsm756622lft.212.2024.02.26.00.06.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 26 Feb 2024 00:06:50 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 John Snow <jsnow@redhat.com>, Leif Lindholm <quic_llindhol@quicinc.com>,
 qemu-block@nongnu.org, Radoslaw Biernacki <rad@semihalf.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, qemu-ppc@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH v3 2/3] hw/ide: Remove last two uses of ide/internal.h outside
 of hw/ide/
Date: Mon, 26 Feb 2024 09:06:30 +0100
Message-ID: <20240226080632.9596-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240226080632.9596-1-philmd@linaro.org>
References: <20240226080632.9596-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: YaNoBispBSGe

From: BALATON Zoltan <balaton@eik.bme.hu>

Remove last two includes of hw/ide/intarnal.h outside of hw/ide and
replace them with newly added public header to allow moving internal.h
into hw/ide to really stop exposing it.

Fixes: a11f439a0e (hw/ide: Stop exposing internal.h to non-IDE files)
Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-ID: <20240223142633.933694E6004@zero.eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 {include/hw => hw}/ide/internal.h | 0
 include/hw/misc/macio/macio.h     | 2 +-
 hw/arm/sbsa-ref.c                 | 2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename {include/hw => hw}/ide/internal.h (100%)

diff --git a/include/hw/ide/internal.h b/hw/ide/internal.h
similarity index 100%
rename from include/hw/ide/internal.h
rename to hw/ide/internal.h
diff --git a/include/hw/misc/macio/macio.h b/include/hw/misc/macio/macio.h
index 86df2c2b60..2b54da6b31 100644
--- a/include/hw/misc/macio/macio.h
+++ b/include/hw/misc/macio/macio.h
@@ -28,7 +28,7 @@
 
 #include "hw/char/escc.h"
 #include "hw/pci/pci_device.h"
-#include "hw/ide/internal.h"
+#include "hw/ide/ide-bus.h"
 #include "hw/intc/heathrow_pic.h"
 #include "hw/misc/macio/cuda.h"
 #include "hw/misc/macio/gpio.h"
diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 4a59e2fd37..13dde50cba 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -36,7 +36,7 @@
 #include "hw/arm/smmuv3.h"
 #include "hw/block/flash.h"
 #include "hw/boards.h"
-#include "hw/ide/internal.h"
+#include "hw/ide/ide-bus.h"
 #include "hw/ide/ahci-sysbus.h"
 #include "hw/intc/arm_gicv3_common.h"
 #include "hw/intc/arm_gicv3_its_common.h"
-- 
2.41.0

