Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp1026305ejo;
        Tue, 12 Dec 2023 08:32:07 -0800 (PST)
X-Received: by 2002:a7b:c7d3:0:b0:40c:366a:598e with SMTP id z19-20020a7bc7d3000000b0040c366a598emr3760424wmk.109.1702398726857;
        Tue, 12 Dec 2023 08:32:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702398726; cv=none;
        d=google.com; s=arc-20160816;
        b=SbUZC7CQtWWFZCXKlWFuGxJ4Eb3EoA8I9xu4o1nBYXH+2l+aGj3eQxstOAjl5BTUiu
         jP+R1u/MzC7aihbpl9wbiWAW0G10arv30zKrakWgxrAead5LQ6dDQhbmiVu8LGmHyF+7
         0blKOnGYfFcVzb6ruZMLJgsF5w0JDiGxMa9KoZaua38wCt1REBqqN6aOJx82pt87ryT0
         V+fuCvbYxBlw9yGsSSZcBnrwwVoa9qqT+fj/7qhw6Ft9FVK4vYd8ZXXTxRs5ctLXc7Oc
         JyaNwqB4yqRZNdMC0l1/N4iW+k0LBy9hAaJNf3D0ytzCGoQIX0AG10rAjSuln4NVUjk/
         ocAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=LN5LIzaAXoHQp7eEvorlIZRES+1O6/1DEdlrH2EDvwo=;
        fh=CkupYgn1Qmdh7jizui9HJgGegpqbRR5NXz1VyjRE1Hs=;
        b=rpgkVUSFhemYFxd2KuvYjkF0KZMV+JqlKTBAIlrSVsBvUHUXUDtErSr5PQCBaovVqA
         bWd+wApntdG8bFQS46uZmaZ3i83s4wRG3sophMY5zzZlIkePtZVrtbgNFLzNBj6mP1Ow
         DHpAMgg3r70ISKmoVzQLaFeUjwsz5hu2y1VdLkyPZpP+dU9/wfgBBhWP4cTkRRzLwvnx
         +RXn8agqUQ6ylj6HU8a1T3gJCg02lVTLzoa1ZdPmL0OYb//QNOPQf8qVA9qzansw1Buv
         CM0/xKTKmfffI4ij3VJ6mml2B6sW/49+KWUUhWW8wwKaMKqbpDUlmB5CNOoGER4XXv1y
         ozHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gHv5SuO4;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id n34-20020a05600c3ba200b0040c48fbea04sor696289wms.2.2023.12.12.08.32.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 12 Dec 2023 08:32:06 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gHv5SuO4;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702398726; x=1703003526; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LN5LIzaAXoHQp7eEvorlIZRES+1O6/1DEdlrH2EDvwo=;
        b=gHv5SuO4xUiT0FEfxBTMjX7XJDGm9HcuuZQ4/Rw+IO8Zqmag3yXsepYuzUItCm2+Rb
         xi1u6J75WJjdPtHZKDQiPmFQT2a7xE6aJT6g1hYUEMM0eS4R287/PyrezlR4n6urkrDv
         VvjCI2uJ2LQFU2L3qYga0G7jBbxKBj6/qxmoHL9Ps2n7b+AlNsxG0djZuVRJf3HE3V4k
         4lJDokpR+ATH4cWuJQBWu0B27/5Jcj9Bj13p09gDUmaUjK1PayYi+2d+tCw71H+Sez2Q
         HCr3LQashWPEbetTGl+Jzlq9CTtRaJ8YE5xQZtxQZCDH7Lizdd2vRe/s3DVcvDpoMU2d
         INMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702398726; x=1703003526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LN5LIzaAXoHQp7eEvorlIZRES+1O6/1DEdlrH2EDvwo=;
        b=KfZzVQI5S/DSUfgtiaD0W8rLTUi8282/ce/uo/xlNr5JgXYjr2eJZh+YqBD/VDxedk
         qpU3VNxZBH0k5IBDKt+FIpKnxIQJsIVuEHKSQuNzGLKjy1rpuzFVQdrSoiQ4vlrBJjDZ
         9rwc79nYDkW//RTnOilxXnGMkdk+S3i3lC/x1A1xKfh2qOFCt4muN7JCr90ey2o55wZ4
         pbsSgH+kEeR1/c7BwEKy1iXhzwEp4aK8vgyIVQjP6ccgStWA7elu7lNw5X0blwtiZfKl
         8EiZmnxmG8ol1MMIpL1AWp/vAFqC8cLQrrQfhl3kcvXI3h93KSeXePbHF7jG7PTAbMIT
         JoDQ==
X-Gm-Message-State: AOJu0Yx1hL50B13akQban5suNJdb/0Iq/sq/x5wQfRYWXc6SxtSw5YS2
	wPciRPZGqya/6wuO8fkzXEjGuktS
X-Google-Smtp-Source: AGHT+IGlvAoOiNx8wiI6Rl0Nash3b1odgtW+hNOm4vN5KcMa6y26/s300+JY0XpjXdM68mwgGrLijg==
X-Received: by 2002:a05:600c:6997:b0:40b:5e59:ccb9 with SMTP id fp23-20020a05600c699700b0040b5e59ccb9mr3593558wmb.154.1702398726582;
        Tue, 12 Dec 2023 08:32:06 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.175.193])
        by smtp.gmail.com with ESMTPSA id uh17-20020a170906b39100b00a1d5063b01csm6483712ejc.190.2023.12.12.08.32.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 12 Dec 2023 08:32:06 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Tyrone Ting <kfting@nuvoton.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Joel Stanley <joel@jms.id.au>,
	Alistair Francis <alistair@alistair23.me>,
	Anton Johansson <anjo@rev.ng>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Hao Wu <wuhaotsh@google.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Rob Herring <robh@kernel.org>,
	qemu-arm@nongnu.org,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 20/33] hw/cpu/arm: Consolidate check on max GIC spi supported
Date: Tue, 12 Dec 2023 17:29:20 +0100
Message-ID: <20231212162935.42910-21-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231212162935.42910-1-philmd@linaro.org>
References: <20231212162935.42910-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: nFM1PBAk2JL2

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/cpu/cortex_mpcore.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/cpu/cortex_mpcore.c b/hw/cpu/cortex_mpcore.c
index c9ba254818..75324268fa 100644
--- a/hw/cpu/cortex_mpcore.c
+++ b/hw/cpu/cortex_mpcore.c
@@ -43,6 +43,13 @@ static void cortex_mpcore_priv_realize(DeviceState *dev, Error **errp)
     CortexMPPrivClass *k = CORTEX_MPCORE_PRIV_GET_CLASS(dev);
     DeviceState *gicdev = DEVICE(&s->gic);
 
+    if (s->gic_spi_num > k->gic_spi_max) {
+        error_setg(errp,
+                   "At most %u GIC SPI are supported (requested %u)",
+                   k->gic_spi_max, s->gic_spi_num);
+        return;
+    }
+
     qdev_prop_set_uint32(gicdev, "num-cpu", s->num_cores);
     qdev_prop_set_uint32(gicdev, "num-irq", s->gic_spi_num);
     if (k->gic_priority_bits) {
-- 
2.41.0
