Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6071555wrv;
        Wed, 31 Jul 2019 13:38:52 -0700 (PDT)
X-Received: by 2002:a62:642:: with SMTP id 63mr49622129pfg.257.1564605532317;
        Wed, 31 Jul 2019 13:38:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564605532; cv=none;
        d=google.com; s=arc-20160816;
        b=AztAYU1nzfsb1U56YWcOfu59mT82kpCNRFSnPsLFWe9BbJ1WsY33szprnmu/FRkTm9
         IAfIWNxVZw/lwCmus1LwKql38JgM0VMCvIHhQep9uuDwiDjOJE62bRi/joIrF8d9zTwe
         cbhLvzTPcK5KSaZqgWQ1VzLksHPfjDgFHe+G3zI6HuNhJZVqAnYin9DgYqQVUETcpud1
         jxjGUYoXvx43dGwoc++ZMMuMHnk942cWsgZLuL2DP3aHujWEqFC+wYuzS4tb/HxXGEzo
         Q/ezXJnpxuu1EcLDVwp5XCcTwF1MtO89pcGsZpalgHtXwDgHzlehoO4DyBRmnJV14yTK
         ua/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=JBDZxP60+vIjwwzQbC3L2o1kpMj6601b/tqCyxFOHVI=;
        b=kslxMnxv91aOFt06Skc/O6Fq+pdZk52a5hKknIYCL4BOkkB4TUAA5/y22y5vdtNbxd
         pK9HIPAsg1nrSaEFT6QtOMJveopAretDoKadQrqlGX8o3Wl3m4WPI6jx+1quNZLZImnN
         xYYID3lPMBgu4RtU3RBxwEyKvrJM5Hh0lpvJzGgjNNdCRtRuuhGpO19HuN3g9I8MM4Tt
         9kYpm70ydqHK6aJ57SGt5ulGxpidE2uO2dWWsJdqIStzovkMXQprbYKiEFcuIuSfB/4b
         UC4uBjKQI9dkqPH3YhQYRSRBlm1DQgxPsSa1l9PbChpgLvwGBTiCy0bY8/dfrvhTy4Zw
         6sgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZjRzASgX;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id x7sor35208949pgt.44.2019.07.31.13.38.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 31 Jul 2019 13:38:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZjRzASgX;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=JBDZxP60+vIjwwzQbC3L2o1kpMj6601b/tqCyxFOHVI=;
        b=ZjRzASgXz9DHZDSakRRsbVZIa9HlbQkZ8AqjWSJkkeFevKt5uLRm331a/WkVz39op/
         CB6q2klZZaPbEc2XLGOxHnS/mh+mc5M2xOn3bcBXCXFLTcpG9+SEtLd+8N2MCeaGpuzq
         LXRpTEUhfVQ2tvE0uyUgrNugAwMgokamsNJEhQgCDKlqxbZKt1vZSG0qKYZbnFV2Eh2E
         cnRAi7Lp5ikJf2zs9BMsU5Bztq+dFR2DX2iI4YTZaVnU7RpBidquoeviL2v5//k9ng0V
         NsbU9V+eI2e5HbF5pNX1eJ6hS2eDTOFdiHyiW+VIBuo3wg/8bIL31q2nCObFvyKt+TQF
         nmUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=JBDZxP60+vIjwwzQbC3L2o1kpMj6601b/tqCyxFOHVI=;
        b=JO3M9jCNeKlJzgPIyqXSeVcaNuGULczTIKHCuHPfzsTFNfv8+vAXcvle40PKHIJABV
         AbqRmfph2NhfUM1a4rnReJ4RP1JB6/MklYXEYnER4T+roQt85PbAtoOv/FoyOO26zoW4
         PQWowTyGdZI8KIqIm/y5P+PIHWpHCjk6zLor6W9QFXzm76InA6tC+v8CnaPxNuuKivSx
         r6I/Ebns7hnapy0KS3qXKarisHv/zI/aYicAYqUEVg6XrwbzYAZRGQawaiiRHA4Nh+DR
         dCbjSAiWXpi+Z4kx8DvG1xNbqcZFejFyb1e0ABZXP/pU6t4j6P5fNW8dkR3xAooYRawq
         ow8Q==
X-Gm-Message-State: APjAAAWR2ESds5vZQYT/CG2ozw67lOv9b26eYOvNlhrDKkNKT92OBVNn
	QLgYVNxf44yw1hYJ1uAtB9hYoYip1bqKsw==
X-Google-Smtp-Source: APXvYqzoTV2iYyHbnFTznIJE1DRJopw832qhH+KMSW0UM1VaT8p8NpINLgsIQ64bhh0jkTh0rzld5A==
X-Received: by 2002:a63:7a06:: with SMTP id v6mr116890815pgc.115.1564605531837;
        Wed, 31 Jul 2019 13:38:51 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id g4sm84054164pfo.93.2019.07.31.13.38.50
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 31 Jul 2019 13:38:51 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	peter.maydell@linaro.org
Subject: [PATCH v2 30/32] target/arm: Enable ARMv8.1-VHE in -cpu max
Date: Wed, 31 Jul 2019 13:38:11 -0700
Message-Id: <20190731203813.30765-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190731203813.30765-1-richard.henderson@linaro.org>
References: <20190731203813.30765-1-richard.henderson@linaro.org>
X-TUID: aE5Y8ciIn77i

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu64.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 1901997a06..b1bb394c6d 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -337,6 +337,7 @@ static void aarch64_max_initfn(Object *obj)
         t = cpu->isar.id_aa64mmfr1;
         t = FIELD_DP64(t, ID_AA64MMFR1, HPDS, 1); /* HPD */
         t = FIELD_DP64(t, ID_AA64MMFR1, LO, 1);
+        t = FIELD_DP64(t, ID_AA64MMFR1, VH, 1);
         cpu->isar.id_aa64mmfr1 = t;
 
         /* Replicate the same data to the 32-bit id registers.  */
-- 
2.17.1
