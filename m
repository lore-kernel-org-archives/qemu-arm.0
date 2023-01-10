Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp3316706ejc;
        Tue, 10 Jan 2023 08:44:32 -0800 (PST)
X-Received: by 2002:a05:600c:5101:b0:3d9:f806:2d26 with SMTP id o1-20020a05600c510100b003d9f8062d26mr2534225wms.7.1673369072522;
        Tue, 10 Jan 2023 08:44:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673369072; cv=none;
        d=google.com; s=arc-20160816;
        b=MQua60Oyg6ilLdgMJV/KgBBPpmKzIVvT5XTq/K5lLQkeZHIjivW6RqvhEvAQQMsJH5
         zmNIAnrydcWWeBY78GEWbFPEZAUnHpBH7VC4ejP+KtnsAVj3xIr1q8lEtZr7FMHcU78Y
         TyfeyhLYjiZ6lEn6l1teQLbx/QYXr1Kmbby6PL6u5+EKsHzFCS5jXVYrgzdjFC2i2ZRW
         zEg76EeQyN0hcFcphLFyTW4xsXUR661vNhJrXU294cjIpml1BE8g2I5VUNWBVVejEvIC
         Ouds7pmXcWarcvybv1AMg3a5q88L3U/SP9EnyJZzfFW0c/rk5bosJPCMpn5sKgypeR0k
         n7nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=djWjHp1PKVzuHPGY/PIVLhSBEcAmWoL71xzvCOJIpjc=;
        b=ABM4Vzf+fjl5HpLYS0BOI/H11kYJjJWVBzPGk8WQvj862GefslogZ7f2udmumpOcSZ
         pHLhCLJsoUOHryu+rbgFW4ZL3wTQJaLClVw9FJ5Zptnd393SBPd/UGz8JgDun3e7UfW0
         s/q+dx4ItV5ietbesekaQgBQFS8otW4h7utzldgZD1Wq0rfL0uP+fmtA2xhWD5cD+JjR
         QIumxww0WgphScIFe6QKtOrudYxI+vvq4Zwy7+SnKwVs8GDLMU+e8/amMgKNBn7dKEiw
         Y9lg1moFqu4zaDYoUyVOwFozIPCR9nGVSem3SsfurM6XdModo8U+ZNZ7xFpc/VYA8oOT
         RkPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TuKlboWP;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id iz10-20020a05600c554a00b003d1ce248663sor3762841wmb.36.2023.01.10.08.44.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Jan 2023 08:44:32 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TuKlboWP;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=djWjHp1PKVzuHPGY/PIVLhSBEcAmWoL71xzvCOJIpjc=;
        b=TuKlboWPbvposCOlgrcg/KtwgV7jHLYx+hFvF4LOl9zNKz1818Qe1lc9bidbuyNIUt
         pFVoxgPqm5IisID+FIwou32Oz9NwA3VzngIm6WzJ6nnwElJlEzlyy9ue97dtOXrMJ9WW
         g3hslvZe4IXrXe4nFrZaZ91/Q4zyn6dEVXYj0vnsdpPkxRxdOD3h6jGUaZkNi21cHdUp
         cU8bAlIJjfIKEdVmStkrtVVHPrWG9igsJMCDuw/5gbI99xDq8QvNyzS66wnVyieIjybO
         xtloNwF+GpzX5qK3EahOHfJ0fn0Ehjowosw+fm/uPqaIWhOzx2uM1exlTK5n4+/9SVax
         g5DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=djWjHp1PKVzuHPGY/PIVLhSBEcAmWoL71xzvCOJIpjc=;
        b=beF71iNqmyFxbXe3vat8G2LYFvaGTm4ekFp1HsP0k+3tmaunV5aHRFhcqZJU7+2IcA
         ZZIxU2TjoAX0Bs6UVv2GXZlHYWMvuNrbH5XAsgaTCrBBBKBwrxJkQ9yZ4QDz1jrz43uY
         Iils1kVPILOFogYDB8zFGvHcnNXxiz8ED4eHMd45xOun+CmI1GbfGHcg0VzjZJGx1/SD
         q50jl5m2hyTU5GtWyfE1+eXAKy+tG5aO1k05wE728nZRBDt8Hmoe5zIePjuGldCemjt+
         zriHPLIG/H96kvZ/WP77n9Zg5vGqYk8hsvwqy86SQ+yzu1j9aSFW0D7KFMyOR+Yt+b7p
         qh3g==
X-Gm-Message-State: AFqh2krRT+QL/WI6RMC5fD1HKjUYP6mwOrTB8Rkptu10tHmQKPmNCfCK
	53zqmiknuwVKRwlIMj1Fu2fltqiI
X-Google-Smtp-Source: AMrXdXujPhEd18uM6h37MjYfydsUbn/lQFdDS1699jE+ilIpEh3QV6TRVmuyM6+ruYeD0FkCa3UUWw==
X-Received: by 2002:a05:600c:3c87:b0:3d9:e8b3:57f9 with SMTP id bg7-20020a05600c3c8700b003d9e8b357f9mr8522703wmb.8.1673369072346;
        Tue, 10 Jan 2023 08:44:32 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id 2-20020a05600c228200b003d9e00dfccfsm12905306wmf.8.2023.01.10.08.44.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Jan 2023 08:44:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: ale@rev.ng,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Niek Linnenbank <nieklinnenbank@gmail.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Antonio Caggiano <antonio.caggiano@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Jan Kiszka <jan.kiszka@web.de>,
	Beniamino Galvani <b.galvani@gmail.com>
Subject: [PATCH 04/18] hw/arm: Use full "target/arm/cpu.h" path to include target's "cpu.h"
Date: Tue, 10 Jan 2023 17:43:52 +0100
Message-Id: <20230110164406.94366-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230110164406.94366-1-philmd@linaro.org>
References: <20230110164406.94366-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 8TBmSP7E1gHf

First we want to introduce a new "cpu.h" header in the "hw/arm/"
namespace; second we would like to get rid of '-I target/$ARCH/'
in the CPPFLAGS.
Use the full path to "cpu.h": "target/arm/cpu.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/arm/digic.h      | 2 +-
 include/hw/arm/fsl-imx6.h   | 2 +-
 include/hw/arm/fsl-imx6ul.h | 2 +-
 include/hw/arm/fsl-imx7.h   | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/hw/arm/digic.h b/include/hw/arm/digic.h
index 8f2735c284..646802806e 100644
--- a/include/hw/arm/digic.h
+++ b/include/hw/arm/digic.h
@@ -18,7 +18,7 @@
 #ifndef HW_ARM_DIGIC_H
 #define HW_ARM_DIGIC_H
 
-#include "cpu.h"
+#include "target/arm/cpu.h"
 #include "hw/timer/digic-timer.h"
 #include "hw/char/digic-uart.h"
 #include "qom/object.h"
diff --git a/include/hw/arm/fsl-imx6.h b/include/hw/arm/fsl-imx6.h
index 83291457cf..9d24d98189 100644
--- a/include/hw/arm/fsl-imx6.h
+++ b/include/hw/arm/fsl-imx6.h
@@ -33,7 +33,7 @@
 #include "hw/usb/chipidea.h"
 #include "hw/usb/imx-usb-phy.h"
 #include "exec/memory.h"
-#include "cpu.h"
+#include "target/arm/cpu.h"
 #include "qom/object.h"
 
 #define TYPE_FSL_IMX6 "fsl-imx6"
diff --git a/include/hw/arm/fsl-imx6ul.h b/include/hw/arm/fsl-imx6ul.h
index 7812e516a5..4f42fe4192 100644
--- a/include/hw/arm/fsl-imx6ul.h
+++ b/include/hw/arm/fsl-imx6ul.h
@@ -37,7 +37,7 @@
 #include "hw/usb/chipidea.h"
 #include "hw/usb/imx-usb-phy.h"
 #include "exec/memory.h"
-#include "cpu.h"
+#include "target/arm/cpu.h"
 #include "qom/object.h"
 
 #define TYPE_FSL_IMX6UL "fsl-imx6ul"
diff --git a/include/hw/arm/fsl-imx7.h b/include/hw/arm/fsl-imx7.h
index 4e5e071864..ed8c1ec813 100644
--- a/include/hw/arm/fsl-imx7.h
+++ b/include/hw/arm/fsl-imx7.h
@@ -38,7 +38,7 @@
 #include "hw/net/imx_fec.h"
 #include "hw/pci-host/designware.h"
 #include "hw/usb/chipidea.h"
-#include "cpu.h"
+#include "target/arm/cpu.h"
 #include "qom/object.h"
 
 #define TYPE_FSL_IMX7 "fsl-imx7"
-- 
2.38.1
