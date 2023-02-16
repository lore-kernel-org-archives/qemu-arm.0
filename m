Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp540581ejb;
        Thu, 16 Feb 2023 06:24:09 -0800 (PST)
X-Received: by 2002:a05:600c:1c11:b0:3db:331b:bd57 with SMTP id j17-20020a05600c1c1100b003db331bbd57mr4977832wms.23.1676557449554;
        Thu, 16 Feb 2023 06:24:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676557449; cv=none;
        d=google.com; s=arc-20160816;
        b=l92VJ7Rner7OZGP1UcXS4lbbeAxx2OVaifQ6opj+HnX5cWUnQXrnMC0kW7r4jqDfDh
         gKDpZK+IEIlhbG7YU/N3Rzm+hOnvGZJeLUR7QiejTabo7iJpDbpYVWnb7Qb/fhHsASsg
         B8Z38ULbAyNhCfSi0cEUZdjFxjupm8vNnWntxTWATIpN9yc7dO6dm4lsBfGXd0qrc5+R
         mYkSGXkAlK0wp9UFfjADlh780kScdF51TAr60UR+K5w0GKwg96WZ5IFMf69zMt9zX+6S
         VH6gSCX2j3Mwb88263MTB/KePe7SFaRO1ISpejK/P+8nlpc7fQEVj2a5IGjqRy2EmcKd
         9sHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=AgNv7jvYIv3Rzz9yuX+hevsRvmOvV3oj8SZGxY0IVW0=;
        b=xI9yB/FPqBw3I4Qfw1G35JrWWAQMuINlZIVnd4sVVPAa43eoi92Nanqg4lbF2t/4Dq
         LAxgXuMr/qibDokm0nPAx+Kb0fHQLfs20NmZDN9UTzy/zeJPTFST2Pq/75xfgKpcyonN
         HTXP6SE88Fu1xfqz/lPaEE1aBM3/bi6L5Wo+DX19P8UV5qKZHSQZp64zqCAhpFovKjQ6
         eYigxslvUrFCkC6B/KdaTUV7Y9jdiIGA6rUOwUXQON8tXNZlsKt4kkPUhFRA0BM2fMG8
         k5tTcgFbTBlXrBLBQu4fFeCAHGPW7P+LNOtK9C5OAklL4fx1EagWlBO8QcDRz/mtO+s1
         Ak/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=l+8FD4H3;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m7-20020a7bce07000000b003e206dbe3bcsor1525352wmc.33.2023.02.16.06.24.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 16 Feb 2023 06:24:09 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=l+8FD4H3;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AgNv7jvYIv3Rzz9yuX+hevsRvmOvV3oj8SZGxY0IVW0=;
        b=l+8FD4H3zVooq0SzPC/ib6S6JI3vQSFaDYPJYAWNN0G+qHz7Jf5NpxUWs1mf+Vgdmq
         pomqy0+Uj9oETTzlrdROIrXgwM9MjfW/lBzRRmVHfc1YBuyoiZ3TP/yFOsCpp2scjQii
         YntcrG6Lr09VS/vtBKjYh0GpV/ZLKyidKdXCvYURsiNdPAXL55vXMQ6Drq4cD2PUoYIy
         7aWBBzM9fej+amgrmRIDGjjI+ejfs3jaYbuEMNctFL7vkgwrCtzUrQmcAIoH+DPrX4OL
         7tAJCuzH5ZKYfdZi3yGO6rB53deKCLJmiktbTijzDwYb/l/C5dLrCzLNS12iZidBxcl4
         8UoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AgNv7jvYIv3Rzz9yuX+hevsRvmOvV3oj8SZGxY0IVW0=;
        b=xdhdOvozNMFZ2Tt07LOG+j7eAAkxNynWlg/Akxrirf8ZnWC4abakUO3kXqsf3YmEbF
         UJBHt8EVI77Mhh1/bBIs/xl8tUvtmLvkijwyVD6zl7rFutUbqniKI7hF98Wt0onN2epX
         HkiClH/axzSiz1cyaKRWgb9+UIn0YcBPtj30CQZrHHTLC079eE5nU4EToNDyXVXMctDC
         eNjsbk4BTIJrqcD+cMqGAES2qCiV9BatGqcu2BQQ/QM0X47KSuzjNWIyayHEPvCaXuRr
         5MHLg9QIwgPP/u7onL1snyiCkjWSBt2+1tRhd59wNmxG5p3GXxjcTIPZ6RivU1x25TdL
         LFGA==
X-Gm-Message-State: AO0yUKUaX5XhSPDxU6wosj25c+n5VaQd4NCIxNQGSYkoZOPNl40dtQ9c
	nZzqkC+q6110IeTLl5lEHa5SQyMa
X-Google-Smtp-Source: AK7set/UWYHmFPqEOMIV//qApgjFDnwnf390ffK0+E8AnuyibGwHyodYaDcVG/wvJsI1eeeqsteqlA==
X-Received: by 2002:a05:600c:4f52:b0:3df:d431:cf64 with SMTP id m18-20020a05600c4f5200b003dfd431cf64mr4667921wmq.39.1676557449269;
        Thu, 16 Feb 2023 06:24:09 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id bd27-20020a05600c1f1b00b003e20cf0408esm1908939wmb.40.2023.02.16.06.24.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 16 Feb 2023 06:24:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Dapeng Mi <dapeng1.mi@intel.com>,
	Sean Christopherson <seanjc@google.com>,
	Bin Meng <bin.meng@windriver.com>,
	Zhuocheng Ding <zhuocheng.ding@intel.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Zhenyu Wang <zhenyu.z.wang@intel.com>,
	qemu-riscv@nongnu.org,
	Alistair Francis <alistair.francis@wdc.com>,
	Zhao Liu <zhao1.liu@intel.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Robert Hoo <robert.hu@linux.intel.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Like Xu <like.xu.linux@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Zhao Liu <zhao1.liu@linux.intel.com>,
	Eduardo Habkost <eduardo@habkost.net>
Subject: [PATCH 5/5] hw/riscv: Restrict CPU clusters to the expected type
Date: Thu, 16 Feb 2023 15:23:38 +0100
Message-Id: <20230216142338.82982-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230216142338.82982-1-philmd@linaro.org>
References: <20230216142338.82982-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: hzr02IEUZnEc

Microchip PolarFire SoC expects U51/U54 cores,
the SiFive Freedom board: the E31/E51 and U34/U54.

Do not allow any other CPU type by setting the cluster
'cpu-type' property.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/riscv/microchip_pfsoc.c | 4 ++++
 hw/riscv/sifive_u.c        | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index 2b91e49561..658307fdfb 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -150,6 +150,8 @@ static void microchip_pfsoc_soc_instance_init(Object *obj)
 
     object_initialize_child(obj, "e-cluster", &s->e_cluster, TYPE_CPU_CLUSTER);
     qdev_prop_set_uint32(DEVICE(&s->e_cluster), "cluster-id", 0);
+    qdev_prop_set_string(DEVICE(&s->e_cluster), "cpu-type",
+                         TYPE_RISCV_CPU_SIFIVE_E51);
 
     object_initialize_child(OBJECT(&s->e_cluster), "e-cpus", &s->e_cpus,
                             TYPE_RISCV_HART_ARRAY);
@@ -161,6 +163,8 @@ static void microchip_pfsoc_soc_instance_init(Object *obj)
 
     object_initialize_child(obj, "u-cluster", &s->u_cluster, TYPE_CPU_CLUSTER);
     qdev_prop_set_uint32(DEVICE(&s->u_cluster), "cluster-id", 1);
+    qdev_prop_set_string(DEVICE(&s->e_cluster), "cpu-type",
+                         TYPE_RISCV_CPU_SIFIVE_U54);
 
     object_initialize_child(OBJECT(&s->u_cluster), "u-cpus", &s->u_cpus,
                             TYPE_RISCV_HART_ARRAY);
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index d3ab7a9cda..d0535746ca 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -763,6 +763,7 @@ static void sifive_u_soc_instance_init(Object *obj)
 
     object_initialize_child(obj, "e-cluster", &s->e_cluster, TYPE_CPU_CLUSTER);
     qdev_prop_set_uint32(DEVICE(&s->e_cluster), "cluster-id", 0);
+    qdev_prop_set_string(DEVICE(&s->e_cluster), "cpu-type", SIFIVE_E_CPU);
 
     object_initialize_child(OBJECT(&s->e_cluster), "e-cpus", &s->e_cpus,
                             TYPE_RISCV_HART_ARRAY);
@@ -813,6 +814,7 @@ static void sifive_u_soc_realize(DeviceState *dev, Error **errp)
      * CPU must exist and have been parented into the cluster before the
      * cluster is realized.
      */
+    qdev_prop_set_string(DEVICE(&s->u_cluster), "cpu-type", s->cpu_type);
     qdev_realize(DEVICE(&s->e_cluster), NULL, &error_abort);
     qdev_realize(DEVICE(&s->u_cluster), NULL, &error_abort);
 
-- 
2.38.1
