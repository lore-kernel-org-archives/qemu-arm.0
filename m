Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp552759ejs;
        Tue, 9 Jan 2024 10:09:53 -0800 (PST)
X-Received: by 2002:adf:ec89:0:b0:336:c876:a413 with SMTP id z9-20020adfec89000000b00336c876a413mr944030wrn.90.1704823793438;
        Tue, 09 Jan 2024 10:09:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704823793; cv=none;
        d=google.com; s=arc-20160816;
        b=XK1Rivm97aNMSY6BarugRqV3qVfUpKuGRhMU39oKN44cADk4JefhEoAiEJzFIcYgPr
         zE8UKLdZCkctvcdejgis744sj3ThMm61lVqHAU3T6J7Gx9UGiLAFMDVHzqXAbYgwa+eR
         KVjB/s+8Ghu11jzcgQXvTI3AAYPCk90DputnmQ0+IJMCZLr268lsYZV2W1TM0fvWFW0d
         T+Bf+enMSyTi0zcC5MDlpcQiHZ+ywCya9kyZSfuX+Z9N9N81QNol7sVxyEENjmO2yy4b
         G8tseEPWcdVRwGCbLESPdRKzbXsSywsN2m/Ih/tu1dIo+wmRwFOrPWvFd9fPTb5TGRdq
         5cyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=mdirajlt6qC945MCVDYIpUTSXSVbweTZjiyf2mppVOc=;
        fh=v69mdd+nxs/0WeTIWzLZOPCx0ynE2o0vtvId2fSwkBY=;
        b=s5bVktPagsQO/lH9SHqdYgpJ7WK70eU2ItlgdUBq9qqHkDQNxD/9Fh1JpVgPsRhjxf
         crPrFy9gJCaBMklEtN5JcMbKOcVQdujmy5G3iHgJJq+wxCqSbLTkG2Ljysfccd5j06Gt
         K29pElihyFNDk4LjfoMzp2FkpNKy8veymlUiLEINWuhdoRXrTA3yg/12w4MXVB8yguI5
         6d2c5VAgLA17KKbXECLUEvaxpvpnJCsE0KrQ7sTEoogr1YP2ZXahXHrQG+ubwiNgzNy6
         RFTV64kQ8j3Ryn5hiV36J6lXqw+N/qKKu1FKI7+7zCe/CYq9qWB5LHnbc/88B/Z3qvwr
         ZbQA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UN9VAAyO;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id r18-20020adfb1d2000000b00336843aacbcsor735076wra.0.2024.01.09.10.09.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Jan 2024 10:09:53 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UN9VAAyO;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704823793; x=1705428593; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mdirajlt6qC945MCVDYIpUTSXSVbweTZjiyf2mppVOc=;
        b=UN9VAAyOdHPXGv4zq9jYGXh3Vcf9iGGKaWzx/REqwg6EMG4jCS5ulJaZUeuTBAKbCh
         Gm8UtdWntLU5cLNF4BCDnnZ3NIXP0cKcBHvbOqnu1RxWa8u1Llm8pdkT943v4+5+Xtuz
         6cNGW9ZuEeASnTAHI93O1IP67sF0efqzgcFwVO4DE+dqHWtp4JJCo2zS/uDORs9itrtW
         5ihLRkwjKsrNTrLYS9cQ4vEXkIMQBXbLj2sL61Bn2CNiL+0KLBc1iPSKmp3Lu0a77guj
         3K9OkraFWnhkSN6CE9FNvj+qL1wwKc6BO15XxSDT3cWSj6B7ichEMWkDzvB7VtMCBJWi
         5vPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704823793; x=1705428593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mdirajlt6qC945MCVDYIpUTSXSVbweTZjiyf2mppVOc=;
        b=wR66NdgQOTlTgEPrtq9ygg9Mz3xi6waJ/xJ18QCsioAa9RS4w3pvK793c26bthCDXr
         PapELL/qQ1+eqLzcpVptBnDJr8ecvHdR2zjX4NzDqUdVaDnkfwS+Y/pRs5oQEwQysy1f
         Bmax+xTPprrhcdwnZPXzNzzTCB4Rydm9FB0jeMZyzydFpsphRQg3y3pc9THQtTcNXYRa
         Y8J3wn0PF7lMzLKPV3NPg1VvH3v8bEamE7bKSCuxuyxplMqMmIwqb4yGOdzNcE1iiaV5
         lwPSCL+6gsd4GGi4HUY35/rXTY1GclZiS6vImoIpyHiq45T6JL1oATYqdcHBDZxYzlgx
         lYDA==
X-Gm-Message-State: AOJu0Yx+VrMaZJ3CLtm4LUc+XN8me9s1Em75DMXD6YoUPuYdFuHeB6t0
	VWquHrDp8eAOuygDp4zgYZahaGYClTqjOdri
X-Google-Smtp-Source: AGHT+IGSlfD/AASYnIgmejOk0iHyGJgsd+FqsvLLK6i9yqyWGoarP2azSOwVLiLLMDO0R2QtEouk/w==
X-Received: by 2002:a5d:4569:0:b0:337:509c:f1c0 with SMTP id a9-20020a5d4569000000b00337509cf1c0mr933765wrc.46.1704823792796;
        Tue, 09 Jan 2024 10:09:52 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (rsa59-h02-176-184-32-47.dsl.sta.abo.bbox.fr. [176.184.32.47])
        by smtp.gmail.com with ESMTPSA id c2-20020a056000104200b0033642a9a1eesm2995571wrx.21.2024.01.09.10.09.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 09 Jan 2024 10:09:52 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Alistair Francis <alistair@alistair23.me>,
	Peter Maydell <peter.maydell@linaro.org>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 03/14] hw/arm/armv7m: Ensure requested CPU type implements ARM_FEATURE_M
Date: Tue,  9 Jan 2024 19:09:18 +0100
Message-ID: <20240109180930.90793-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240109180930.90793-1-philmd@linaro.org>
References: <20240109180930.90793-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: k/M8Z6F+jQpQ

ARMV7M container can only accept M-profile CPU types.
Check requested type is valid once to allow further simplifications.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/armv7m.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index d239468558..8900730e53 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -300,6 +300,10 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
         error_propagate(errp, err);
         return;
     }
+    if (!arm_feature(&s->cpu->env, ARM_FEATURE_M)) {
+        error_setg(errp, "armv7m: CPU must be of Cortex-M family");
+        return;
+    }
     cpudev = DEVICE(s->cpu);
 
     object_property_set_link(OBJECT(s->cpu), "memory", OBJECT(&s->container),
-- 
2.41.0
