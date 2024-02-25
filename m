Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp1643323ejf;
        Sun, 25 Feb 2024 09:17:42 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWGc8KWQGlXPQiboqgyIVzfy0S2GHut6aLEuv3CUIzL0IJyiPAKTQvGqqjpN9v3OJr1O25qyWzJ1nkwuOrU5QT5pjYmHQbu
X-Google-Smtp-Source: AGHT+IFjCPRKBKfru4Ib3pc0l6o9qXI0J9S+djaCJfRmuhU/qfehuxbApOSir/Vqjdm4FHG5Yw/W
X-Received: by 2002:a05:622a:120c:b0:42e:5f71:b9cd with SMTP id y12-20020a05622a120c00b0042e5f71b9cdmr6896057qtx.4.1708881462023;
        Sun, 25 Feb 2024 09:17:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708881462; cv=none;
        d=google.com; s=arc-20160816;
        b=uxxK/mbnaXVqEnWJ7Bdr9CuK2GuygsjLzxbC2r//npMQ5c3ZObRaNUiIa1TI4cYNY5
         zBjTr+c4yETzUwzoWYaCu0YUX0/kVOGtvx471K29LWDFishmyIrnHY7grqdBins8G7Ky
         U1n2XEL3sv+HbUm4oQDxQuAAzPHO8LGtp01mWaaN6ctHS31jVKd8A/74ByBn5ag6zwCC
         59BZf/GRnjmOomb3rVdauN7nznUj801qPh+VOXrX+i6lOzwTHO2SsUwwy+w8Lllm0kVL
         4rVKpVEtK8YF3kLtRDujh8A3nUl49ns+Pm0LAThE9K+5aoyIRVJlH1yqkp95AxEbTemZ
         LkjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=IB72GIQk4y7cG3O6ov/QP+e0zW2l/wpZpAki6K0Zz7Q=;
        fh=nzXvBMszblydwovzy+kZKW2cMFihepcjQ9QCMoq/1B0=;
        b=VTIqMqU7QWZ0fXAHv8RsmC1GiduCtvY+/dU//tz/4fPbtnmgVf6u/c5HbrYp2hWBG1
         KLm4RIqIbbTrMQXCBI76wZp+N2TfqQMEz0wlJTdO1qNKIrz68/vWnnenDrnAsfKAllSR
         DNpVrZnix6/4nrgByRoFl1hSf1xv3IYd9C82xdr+BylZoxPW/nSYPj47nSIPZZyNsTDP
         4Lf3+J3N8kfDlQ0D9HReFTfucLz5nY0q1r12EtzFXfoi1w2MT5AxvclliCEWtqoUXohH
         up3EpEDvJK5EuKhY6zpJG5gLHNEJf7rlQVlAdcDcU+sGt2ZLm2z4J96YzuMtVGm5151D
         iDEA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WSbB93Se;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j25-20020ac86659000000b0042e7e962ff3si1275146qtp.327.2024.02.25.09.17.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 25 Feb 2024 09:17:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WSbB93Se;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1reI7c-0001yh-2I; Sun, 25 Feb 2024 12:17:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1reI7a-0001y6-QY
 for qemu-arm@nongnu.org; Sun, 25 Feb 2024 12:17:02 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1reI7S-0003xQ-EG
 for qemu-arm@nongnu.org; Sun, 25 Feb 2024 12:17:00 -0500
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-33d146737e6so1719712f8f.0
 for <qemu-arm@nongnu.org>; Sun, 25 Feb 2024 09:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708881413; x=1709486213; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IB72GIQk4y7cG3O6ov/QP+e0zW2l/wpZpAki6K0Zz7Q=;
 b=WSbB93SeNjSIvuV00OzhhVRXy5l3Q+K218e9/ZOKNWzzUXkzXUjyY8cPBPCkekK5z2
 uzECSyQMJ/aLcn/X4cSywGxqPOE19BLbycLaavfApIMLcwJAIK5vK9IIfjFKN7dOoqGt
 8P0evkps/zfOdhS+7OFifHkKFN+/FIwlQb9eLyBmSdg9VL2ffCIdjkO4+COYA5LspLbZ
 SaJ3VZTKg/PwU7ej5dR3nqyspJBrgX05nUXFIagdidmzo0MH0jNdwrmuer8tU7+cGQhV
 fnpHj+srX1yAuSQdCape+I+SfhENp2I2PC9S5+9aGxpDqBtjTqLt6gXf2W00/qoN5Toa
 HjOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708881413; x=1709486213;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IB72GIQk4y7cG3O6ov/QP+e0zW2l/wpZpAki6K0Zz7Q=;
 b=U3HOuKaSUwgXx74v24HhB4aA8CVyR1qLIqYME88U1wUj1iVyE6UCZGsMAIzgN2nZu0
 qD7a+54IW2ai8MGmPbZ4DTaOGvZw/Y9eJkIT3sUR/RYoP+HZG3D1We6KJJPQhx0uaP5r
 v2wHJI6MfyPurMRkDCMRCyhTImyvOQ2yuQ9Gge9bcr1Be8pv1CtQupNfeWwSEFYH4NpL
 4jtkwpnhqZWRBEmh7BsNP3fT9KDHstSa7cHfpmsdRtubRHafE9GP7HvMF/W1bsHwRk5F
 RIM5e6bnzAFz6HRvj9trTdjLtHVmyrbw8fkdvRRNMObmAIB8XEn+hy28ygDufGBuF/2z
 KjOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtXgfG4ziMr6ue36tnkaGTjdCFR6YdyXsD2RffYloA+/POXVsP8hk9b1fP+uYL1RBGd2sM6tm5abyuB73HDbaQv0ua
X-Gm-Message-State: AOJu0Ywa6ho7C8wpc4GMzqQzew2iwiVSSm6i1O2ot+AloGonjkiQ+irB
 8/8kB6OjTMUvS1vX+rraH3j2469f52N/Vdx1sUQNBwcoAAvDUi3Y2MKFykQLHQ9OEtuEemRMEir
 I
X-Received: by 2002:a5d:6150:0:b0:33d:c5c7:4182 with SMTP id
 y16-20020a5d6150000000b0033dc5c74182mr2035191wrt.7.1708881413040; 
 Sun, 25 Feb 2024 09:16:53 -0800 (PST)
Received: from m1x-phil.lan ([176.176.164.69])
 by smtp.gmail.com with ESMTPSA id
 u16-20020a5d6ad0000000b0033b6e26f0f9sm5570567wrw.42.2024.02.25.09.16.51
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 25 Feb 2024 09:16:52 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, Radoslaw Biernacki <rad@semihalf.com>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH v2 2/3] hw/ide: Remove last two uses of ide/internal.h outside
 of hw/ide/
Date: Sun, 25 Feb 2024 18:16:36 +0100
Message-ID: <20240225171637.4709-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240225171637.4709-1-philmd@linaro.org>
References: <20240225171637.4709-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: IVddYmWz1mVY

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
index 995c7be23e..aa1eeecc94 100644
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

