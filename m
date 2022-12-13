Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4189104ejb;
        Tue, 13 Dec 2022 04:52:36 -0800 (PST)
X-Received: by 2002:a05:600c:4f85:b0:3cf:7925:7a3 with SMTP id n5-20020a05600c4f8500b003cf792507a3mr15703889wmq.24.1670935956741;
        Tue, 13 Dec 2022 04:52:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670935956; cv=none;
        d=google.com; s=arc-20160816;
        b=t2nc/YaLbBW1g0twT/G4rEqwXiLZptXuXMrgA6hy1eTRSQwt2We0O8/A+qG46/MS0C
         v0+CHV1BelL1EGwJ6+6fugvIONs2jx5IldIj1099uZ9EK0O2lOEk/UQH7NM+xsFnH12h
         hpwL183s9uLF5xaDdZFywr2VKdswqbct6csLeozRhby/S/x7AWaurfoC1/hfGC5RLNCa
         VhdLSJjgSjMSELGxKW9F3CRzCSjUIDt7kPzi7vaGZX8axLVF6IMNtHgyR1qXaF5/3Hsr
         H+aRVYJT33z9y/8kkiHMTZoL3ZpljL0Qi2tyRKaQTzNCOPjyZpyvKIXPvxrXD+NEh+bu
         ndpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=El4Mo4XJqlmSIoO5ETLFqRzBXVBkfAvXj3HufFMLDB0=;
        b=Qoq0rTSUAo1wgMQRhW8/2dBFNyqtHe9eALe9sdtSeilkzLHaDdvVS/3OHzdtBAzw1k
         /YcC6Q1wbxPyThVY6p2Rb/851jNlcZA5BH4U5MOnKIl+jJM+/OQRwtH6qUWhgscngKvb
         dvBXTp7+YA6qVSTxDTJ+nC+7Nt6dZNPSRFQovg76/Vf7vlEVjOWPPQB/VrekXkKKiEUb
         z/LFka3VaymqGCWC+GQ+x9KFpVsJXRXrpj6VgQChZj81SKBwQbAzPSxVsB/rl7V1tHOt
         GVUKw/baLxBvGviMD1ITbswLMmR4V5o5kFreEhC9EuDixJgTkCyqA+/mHqFYRZTR5WFi
         u5vA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Qpt4z6KO;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 4-20020a05600c248400b003cf3a64a430sor3197333wms.42.2022.12.13.04.52.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 13 Dec 2022 04:52:36 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Qpt4z6KO;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=El4Mo4XJqlmSIoO5ETLFqRzBXVBkfAvXj3HufFMLDB0=;
        b=Qpt4z6KOyGfmVHof3B8vjj9lmGlhjItvat/UYcHjdmfNQMhgrsdL+VrzB0l/zmH//7
         /6pcLu9hXSap6cUwQ4XaCougl+9jf3inXcaFwle4eP3ITO+LRPr7ZwwyUcClbOaZe8sb
         egtAnWT9nigfBN1gVL768oAzebQpbIlf3L5nRI6ihZGrO7wWCaxboEBbFGllo9vKFWXA
         Nhvm78YqDpdDSwpc1hRyMmcB71E9QAPs9rKCLDHtdI/qfAWdnMPGHsjmwwPx1bRW55yg
         5DXA4WLqAP+geC1u4WbdH1YB2gQpZtUKu4yGi9QmSNAyCqFOAapU/86gfIGcf9OWKOKV
         kmWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=El4Mo4XJqlmSIoO5ETLFqRzBXVBkfAvXj3HufFMLDB0=;
        b=GEdoqsN2BbQVsWKpqUvuEBzc0fLGCq4Myuf5NMx0x7/wkzqPwv2afvlhs+xibaMn/n
         UVLy1hDpxQ7yJAyRXjD2GBv5tUa9DHf/M8bcrUOWEe/5qoVGQYVOWhhy45n0WblTf9px
         xOHhY2sjT4hHe1yhjVM8zCbAlniy4NPOU23gZ74PBxL6MOQpzlwgY49rNko8spich1S9
         bHomKOVPt1Oi8qu6dxFHNYA7Hs0B5FkCSeMb+gt8V/i1EhT8yGmo8hqIA2pp8QUwbXI/
         JDfjLDVftG8RCC93CUdZGwUIvjNB+gKMX8HNQgHrNSKoW8KPEZ4OqO9+XN8i40X+RChR
         GZQg==
X-Gm-Message-State: ANoB5pkkGOL5wqG7KYHnQTxYIOFT3sQmH4em9Ebc5BWRfzyJKG+vrifa
	KanqJBxSnfZOm+RcEm0foa99p8CH
X-Google-Smtp-Source: AA0mqf7ApUqHFBFm7LoMDf1EQaoDfANzrNkuntotfUoPT+dt5bjRmbgXASwlJMLJQi9SIR/eKR55Lg==
X-Received: by 2002:a05:600c:538f:b0:3d1:d396:1ade with SMTP id hg15-20020a05600c538f00b003d1d3961ademr15602334wmb.9.1670935956487;
        Tue, 13 Dec 2022 04:52:36 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id g23-20020a05600c4c9700b003cf4ec90938sm12081630wmp.21.2022.12.13.04.52.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 13 Dec 2022 04:52:36 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
	BALATON Zoltan <balaton@eik.bme.hu>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Alistair Francis <alistair@alistair23.me>,
	David Gibson <david@gibson.dropbear.id.au>,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Greg Kurz <groug@kaod.org>,
	qemu-arm@nongnu.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	qemu-ppc@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH-for-8.0 3/3] hw/net/xilinx_ethlite: Replace tswap32() by be32_to_cpu()
Date: Tue, 13 Dec 2022 13:52:18 +0100
Message-Id: <20221213125218.39868-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221213125218.39868-1-philmd@linaro.org>
References: <20221213125218.39868-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: W8GCyEHtJY2t

This partly revert commit d48751ed4f ("xilinx-ethlite:
Simplify byteswapping to/from brams") which states the
packet data is stored in big-endian.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/net/xilinx_ethlite.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/net/xilinx_ethlite.c b/hw/net/xilinx_ethlite.c
index 6e09f7e422..efe627d734 100644
--- a/hw/net/xilinx_ethlite.c
+++ b/hw/net/xilinx_ethlite.c
@@ -24,8 +24,8 @@
 
 #include "qemu/osdep.h"
 #include "qemu/module.h"
+#include "qemu/bswap.h"
 #include "qom/object.h"
-#include "cpu.h" /* FIXME should not use tswap* */
 #include "hw/sysbus.h"
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
@@ -102,8 +102,8 @@ eth_read(void *opaque, hwaddr addr, unsigned int size)
             D(qemu_log("%s " TARGET_FMT_plx "=%x\n", __func__, addr * 4, r));
             break;
 
-        default:
-            r = tswap32(s->regs[addr]);
+        default: /* Packet data */
+            r = be32_to_cpu(s->regs[addr]);
             break;
     }
     return r;
@@ -160,8 +160,8 @@ eth_write(void *opaque, hwaddr addr,
             s->regs[addr] = value;
             break;
 
-        default:
-            s->regs[addr] = tswap32(value);
+        default: /* Packet data */
+            s->regs[addr] = cpu_to_be32(value);
             break;
     }
 }
-- 
2.38.1
