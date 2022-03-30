Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp919232lfb;
        Wed, 30 Mar 2022 05:56:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxFBsmibu3RH06LRNcofMoZfUZyFSWz1lZXEyeQxOBGrqrozWd2gqGcXzFzdxHRT6pI2h7V
X-Received: by 2002:a7b:c30d:0:b0:381:4bb9:eede with SMTP id k13-20020a7bc30d000000b003814bb9eedemr4318600wmj.74.1648645018598;
        Wed, 30 Mar 2022 05:56:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648645018; cv=none;
        d=google.com; s=arc-20160816;
        b=0OJ3BNkcbx3JkhEzm/61a85N0m+vcuwkEa1n8d+O7PeGOUVD1/Yf7cMuWpn/91Li/d
         ar0MaIPWmXSon0htEX0NkDPWYHZcmI4D6MCpisBxQEjcR30+ckcPbgyID1nmtgtrTiQ0
         Z2NFz4mzuUmN66/dT3uo2xX22jWl/u5A8pziPWfR+tjA+F4OFELOAy/L8m8xrVs1D4nl
         8IURajOoZhkDYL6UGdRe7ZtvPOHoYlDf5lGGXkHZox873P0Te72QdSn4R24H3E78O+xC
         3nB9TbmzkNRVI8+ZByhY4doW+LeC3QBRitvv71MD1oHC19sNKvEzQTX1PsopSY0ePKc9
         l7qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=AEeV3pdJjggFAgny3pSiPS5I29jbbs1q3Rp1FOMlriU=;
        b=Mvkx40/QiNWgKe5xavNjuaf/V/auw3+b3Q/1/OWhYWHiY6I25bSSn3bwzV/HvdC3gm
         6j2AelxmSDYl7v8Cigwb/SawD8S0INRCHxcCWYYZgitv76Yxx0MZZGE/ElDsyRlm1QgJ
         rdh9fWVdLUEL+DMpkAewijSNELsMAmOEbRRZtILvKc3qWJlQe5H7IFACiOHLHq2CN52O
         4A/B2U/gcMeYWoA+Rh1eD5xZc4SEuLYyQzHrJHLw/1IBU7/EXwzQ6JyXNFOvMXI9NkTM
         LfqsNJroUsrvn0fIZgIOHMSvIqi1VKuBmCkKu4/DYpeZuMPgBgkXzQDqPCDZEmArwbE+
         Adpg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@greensocs.com header.s=mail header.b=fxJqFatK;
       spf=pass (google.com: domain of damien.hedde@greensocs.com designates 5.135.226.135 as permitted sender) smtp.mailfrom=damien.hedde@greensocs.com
Return-Path: <damien.hedde@greensocs.com>
Received: from beetle.greensocs.com (beetle.greensocs.com. [5.135.226.135])
        by mx.google.com with ESMTPS id r188-20020a1c2bc5000000b0038c992c6ad3si5458629wmr.223.2022.03.30.05.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Mar 2022 05:56:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of damien.hedde@greensocs.com designates 5.135.226.135 as permitted sender) client-ip=5.135.226.135;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@greensocs.com header.s=mail header.b=fxJqFatK;
       spf=pass (google.com: domain of damien.hedde@greensocs.com designates 5.135.226.135 as permitted sender) smtp.mailfrom=damien.hedde@greensocs.com
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
	by beetle.greensocs.com (Postfix) with ESMTPS id 3F4B321EDD;
	Wed, 30 Mar 2022 12:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
	s=mail; t=1648645017;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AEeV3pdJjggFAgny3pSiPS5I29jbbs1q3Rp1FOMlriU=;
	b=fxJqFatKOJHc36kZtOyuEeFeIyYA3RKJqT30O49+s/4Y/q90h48PLenwDNPQ7ohljjHR51
	w7v70xdZ+A3+RpFy+J+K0vG3/BoTfFHfTUXh1FUS2NN4MsaejBsNVNUbw8Z1RipjqC7AIH
	KpdHBDYcVp0hSC9v1JsahcuR65OutIo=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Cc: mark.burton@greensocs.com,
	Damien Hedde <damien.hedde@greensocs.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair@alistair23.me>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Bin Meng <bin.meng@windriver.com>,
	Vijai Kumar K <vijai@behindbytes.com>,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [RFC PATCH 17/18] hw/riscv/riscv_hart: remove temporary features
Date: Wed, 30 Mar 2022 14:56:38 +0200
Message-Id: <20220330125639.201937-18-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220330125639.201937-1-damien.hedde@greensocs.com>
References: <20220330125639.201937-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
X-TUID: +RFeVzZIlFNI

Now that we updated all riscv machines, we can remove
the temporary realize helper and the alias property.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 include/hw/riscv/riscv_hart.h |  3 ---
 hw/riscv/riscv_hart.c         | 14 --------------
 2 files changed, 17 deletions(-)

diff --git a/include/hw/riscv/riscv_hart.h b/include/hw/riscv/riscv_hart.h
index 65ac0d2bc4..acf5ee8575 100644
--- a/include/hw/riscv/riscv_hart.h
+++ b/include/hw/riscv/riscv_hart.h
@@ -56,7 +56,4 @@ static inline unsigned riscv_array_get_num_harts(RISCVHartArrayState *s)
     return CPUS(s)->topology.cpus;
 }
 
-/* Temporary function until we migrated the riscv hart array to simple device */
-void riscv_hart_array_realize(RISCVHartArrayState *state, Error **errp);
-
 #endif
diff --git a/hw/riscv/riscv_hart.c b/hw/riscv/riscv_hart.c
index 1b4ff7e3c6..ea798de5d5 100644
--- a/hw/riscv/riscv_hart.c
+++ b/hw/riscv/riscv_hart.c
@@ -27,13 +27,6 @@
 #include "hw/riscv/riscv_hart.h"
 #include "hw/cpu/cpus.h"
 
-void riscv_hart_array_realize(RISCVHartArrayState *state, Error **errp)
-{
-    /* disable the clustering */
-    cpus_disable_clustering(CPUS(state));
-    qdev_realize(DEVICE(state), NULL, errp);
-}
-
 static Property riscv_harts_props[] = {
     DEFINE_PROP_UINT32("hartid-base", RISCVHartArrayState, hartid_base, 0),
     DEFINE_PROP_UINT64("resetvec", RISCVHartArrayState, resetvec,
@@ -52,12 +45,6 @@ static void riscv_harts_configure_cpu(CpusState *base, CPUState *cpu,
     cpuenv->mhartid = s->hartid_base + i;
 }
 
-static void riscv_harts_init(Object *obj)
-{
-    /* add a temporary property to keep num-harts */
-    object_property_add_alias(obj, "num-harts", obj, "num-cpus");
-}
-
 static void riscv_harts_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -73,7 +60,6 @@ static const TypeInfo riscv_harts_info = {
     .name          = TYPE_RISCV_HART_ARRAY,
     .parent        = TYPE_CPUS,
     .instance_size = sizeof(RISCVHartArrayState),
-    .instance_init = riscv_harts_init,
     .class_init    = riscv_harts_class_init,
 };
 
-- 
2.35.1
