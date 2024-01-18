Received: by 2002:a17:906:2b99:b0:a2e:1324:ea5c with SMTP id m25csp519910ejg;
        Thu, 18 Jan 2024 12:08:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF/BxbOwJpPdoylIGABHNIz85HG1d1RHDG5yiRQPPCTkEI474GDIszOqHoeWUfZFzhf93vS
X-Received: by 2002:a05:6a00:178b:b0:6db:cb:205d with SMTP id s11-20020a056a00178b00b006db00cb205dmr1445159pfg.45.1705608537132;
        Thu, 18 Jan 2024 12:08:57 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1705608537; cv=pass;
        d=google.com; s=arc-20160816;
        b=yNxFYqozWzwWnHlNLZ4SLCVh82wHbcgmr4xSfgExh9xyajHaJFCKtyM8aQehsUueYh
         t7mu6v05sfwos+gTIn8ja2Q8CcfS89w9SDTaFZKwpc8T8G7t1EHMRs56jBrAW1JpiEvj
         T+D6mHKEACsukfCK7v7tj7Z5PkqRm2wI1/i8f5viGkfbE5pI2TAuTaJn7iEEVoYrChQR
         pSme1OWu+Y1tBi/Nx7/un7Y3ngtAPEpun4XyaUNRpnSBrESUyGhv9mR9zn8ls9A/M4p7
         PA/9n9wolrqwEmmgVadx0tj2YZAVlovya4qBJTUPJSGacPMhC7VTdjz1WoECAEVebe/9
         DFMA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=7i3W6cKZo6jUarGFVlLnFc+nsCmIDidPRgxq67roFM8=;
        fh=cUgEM3TMHOIH70RmHTmTZxZmItZJnKfBWHSaci49aLY=;
        b=m5nPHP0+v/pjjyVouJocLHurjkTe+7RlKgnWSczrX7dMqK1o8usI9OevRLFoUawe3e
         vYAUGDv2BS546fIMlVkVwN0IKjr+E+gYCcvoAxNp9riADN/8woRP7EpaqJ4wHf45Ig4h
         xNqj3+BB2wFIyLEcS+ATIeBWv9yD9pGONtCgRdLwmPK4+SZBmFi3IovVWEsqwpKIZ7Nj
         FFTXg7D9f0DGyh3LCkD2trs8ckdkbN7qkTCZ19wn2Y2A/0moaeDeR7yzVjdIQ2V4KH4c
         hlu9wtL4d7S722VG38y7uHegr1y2ro0jZMCVaZGWsTIyWqz+3HvnJnSWMiD0AS4w6anw
         rMTg==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oS2NhRLD;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-6447-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) smtp.mailfrom="kvm+bounces-6447-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-6447-alex.bennee=linaro.org@vger.kernel.org>
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org. [147.75.48.161])
        by mx.google.com with ESMTPS id r6-20020a63ce46000000b005ce24ee6a90si1953198pgi.342.2024.01.18.12.08.56
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jan 2024 12:08:57 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-6447-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) client-ip=147.75.48.161;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oS2NhRLD;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-6447-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) smtp.mailfrom="kvm+bounces-6447-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 01D06B270C2
	for <alex.bennee@linaro.org>; Thu, 18 Jan 2024 20:08:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 870882E62C;
	Thu, 18 Jan 2024 20:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oS2NhRLD"
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10AE2E62A
	for <kvm@vger.kernel.org>; Thu, 18 Jan 2024 20:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705608501; cv=none; b=aDP89HpcCc9Kz3kkHr5VCAUZ/5UH5pmP6gpApZzDqSKPvyUYNm7c0ppElHEs7ocUeub4BQwPF0E24Y9dWx1LVha7ssB4VqcUOlnw+/t1dYsG3glDi1zESs0IoMGyeWajQBaROW06EN5d/7XuA3uoPyOoCBQYD9fNLTyz4xMBngE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705608501; c=relaxed/simple;
	bh=vxM7rZgRIdZCOLEefBS8aM3zBBR/LN6UIE+U89tGxFo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kOTA6CZyWbL4wXlgKExwql9fbb1sxewmMnFUxZEsBBP212Fl3cK0vSHKCMiipATNNTHPyZQTSmucyzzy/oH9y0FIUAZYoNYZsJQ7RlDApL0IXo7wzetAuSXkYQ86Y1n9jjLG1EOY9ym7Nm56RA9IL8FbqftlcGW/NAxc5i82zeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oS2NhRLD; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40e80046264so440675e9.0
        for <kvm@vger.kernel.org>; Thu, 18 Jan 2024 12:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705608498; x=1706213298; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7i3W6cKZo6jUarGFVlLnFc+nsCmIDidPRgxq67roFM8=;
        b=oS2NhRLDO+tJWMbFweL0Gqi3SFN1h5jyFPjUmTFEJYfqT8/NZTYw1HptJf7Q1kJMRQ
         bhGmMnDV1E+NFxHtWfOgZwySFLBPEqk6cfNyFD0tiyOxAELlVh7zH/oGWTr1RmL+i1cs
         32tQ9CIkdoqYG3rNvFW/51jpVnRnXpy81TiHyj9hveLWvLQMy+0sqryfV4bFNPeI8pce
         Q0fJh5R7dALsBfMvhEjlENUGkKEo10VkPmuD+AIrdTG8KPVBAAq9PJMotztdK5TB/BPw
         U8AgDyM4t+L44gzAQl5zDIzeVnJeFa+7b8MY7x5KLJcznOdu2y22yJ65M9n79V5IlLyv
         VXag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705608498; x=1706213298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7i3W6cKZo6jUarGFVlLnFc+nsCmIDidPRgxq67roFM8=;
        b=ctixfJGB0iJ/IfNDFn8ajjBvrHspJCALwPRaNNq7nAzYTyJ8lqZ4tFFl5dTNfqVlad
         m3DU8BxzW53aKAGVUDvqjiQE275A+XLjx+F3EfFAc19Gf0p5rsznS3Yhifkt9IWAir0q
         Kk/lgoIHmyewh3nE/UCnQj2VTVSYG2ivpleYDQYwPWeYUBnyZ7LDwe05TZBkjzGhjR77
         Sa4T69vcoJ3Wyjk1jnUXMqsGDIDT2oKTpkMYnAdrFpTSMru6L/cSv3W48OhSW4/V46A9
         8i1NiFOsA2pkNoHOAHkHDYq6HDx4s3Q+lfrQJnkjlcH5zSiqnkwpJT70CM5KmlPwsbdi
         UaQA==
X-Gm-Message-State: AOJu0Yx6EZnhszmravi1y54CC4nNWrS4Al/4mKHwn+EoxZD52cG1bd6N
	Y2HVMirHfpuP8vpqbWAX4lUOtFEWNX4P++ckT0mYMeL8UeQWW7172+0D1cmpzTY=
X-Received: by 2002:a05:600c:46ce:b0:40e:5feb:699d with SMTP id q14-20020a05600c46ce00b0040e5feb699dmr926186wmo.164.1705608498089;
        Thu, 18 Jan 2024 12:08:18 -0800 (PST)
Received: from localhost.localdomain ([78.196.4.158])
        by smtp.gmail.com with ESMTPSA id s14-20020a5d69ce000000b00337478efa4fsm4783334wrw.60.2024.01.18.12.08.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 18 Jan 2024 12:08:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
	qemu-arm@nongnu.org,
	Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Eric Auger <eric.auger@redhat.com>,
	Niek Linnenbank <nieklinnenbank@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jan Kiszka <jan.kiszka@web.de>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Alistair Francis <alistair@alistair23.me>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	Tyrone Ting <kfting@nuvoton.com>,
	Beniamino Galvani <b.galvani@gmail.com>,
	Alexander Graf <agraf@csgraf.de>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Ani Sinha <anisinha@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Joel Stanley <joel@jms.id.au>,
	Hao Wu <wuhaotsh@google.com>,
	kvm@vger.kernel.org
Subject: [PATCH 16/20] hw/arm/armv7m: Make 'hw/intc/armv7m_nvic.h' a target agnostic header
Date: Thu, 18 Jan 2024 21:06:37 +0100
Message-ID: <20240118200643.29037-17-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240118200643.29037-1-philmd@linaro.org>
References: <20240118200643.29037-1-philmd@linaro.org>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: XjTfheLR+Kjr

Now than we can access the M-profile bank index
definitions from the target-agnostic "cpu-qom.h"
header, we don't need the huge "cpu.h" anymore
(except in hw/arm/armv7m.c). Reduce its inclusion
to the source unit.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/intc/armv7m_nvic.h | 2 +-
 hw/arm/armv7m.c               | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/hw/intc/armv7m_nvic.h b/include/hw/intc/armv7m_nvic.h
index 6b4ae566c9..89fe8aedaa 100644
--- a/include/hw/intc/armv7m_nvic.h
+++ b/include/hw/intc/armv7m_nvic.h
@@ -10,7 +10,7 @@
 #ifndef HW_ARM_ARMV7M_NVIC_H
 #define HW_ARM_ARMV7M_NVIC_H
 
-#include "target/arm/cpu.h"
+#include "target/arm/cpu-qom.h"
 #include "hw/sysbus.h"
 #include "hw/timer/armv7m_systick.h"
 #include "qom/object.h"
diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index 1f21827773..edcd8adc74 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -21,6 +21,7 @@
 #include "qemu/module.h"
 #include "qemu/log.h"
 #include "target/arm/idau.h"
+#include "target/arm/cpu.h"
 #include "target/arm/cpu-features.h"
 #include "migration/vmstate.h"
 
-- 
2.41.0

