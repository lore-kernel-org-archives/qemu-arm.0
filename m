Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp540519ejb;
        Thu, 16 Feb 2023 06:24:03 -0800 (PST)
X-Received: by 2002:a05:600c:4f07:b0:3df:7948:886b with SMTP id l7-20020a05600c4f0700b003df7948886bmr5179263wmq.31.1676557443878;
        Thu, 16 Feb 2023 06:24:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676557443; cv=none;
        d=google.com; s=arc-20160816;
        b=NT3T1jML0YXDAAQjvcI4g2Bfm8qWK8nfd4cr7OqxF7XpbfPeVR3ye6g8Gr+rY6az/N
         uGQNUI1zsY/NnRXQUBbGTPB1b6tdJqsSNUS/GRXZJC4OnQAP3092txWZ9fAHVpRISehp
         4coZHVcYE70V0UFM97xllOG2OArAvWgfWsKre0/xJdDvjpBBJ1+tqaH7jOgguc0JE0y+
         TPP5OQ98AljHXkMjB0AEONprF+KdfWQeiZzToQxPztCbSC9VvUfVIrOeJKqk8kXNx3t+
         d3dyqiwIa8m3tR84LOMpZoweVJ4LB1EpKcfohR2H8ynRseybvxDv0HfhZ6lmRWJxjsXC
         GGSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=pkUuoVsPO7rj7crjxhqsXkiJdIbOheCDQODQm6zJmAM=;
        b=RKCJIIyzmCKMQtfz3+gBmIcdKkqG6EKIlYYrpowLDlE+mfRa+tE75F09wFsZAf40YL
         cya6QHudWjM93czSstl95HeUqa3fQqInUZ0plUDXmLpwraa/v3/iTHkcZW+ly5Qcjbya
         NovypRqKU9qcDoubWXoFKh5yKO+Jes8pjrKDAzAF/t/FGGD+ZPIcXEuIbTjj+Oy0R/Hu
         Lx8XKlYyoOC0A5Pu3cSP3xau2pOO3NpJRmfmbr3GzDvn0jsAcYUoBXmEvXix8D+C5py9
         hJEjEp1kmHm/fhFJGAyGhpCQrYrN62ygRYget1oQM8TDAxgFbkwXmluz4Loookqv1jic
         CLpA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZqFCD2Vt;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a10-20020a5d456a000000b0028224098333sor748488wrc.61.2023.02.16.06.24.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 16 Feb 2023 06:24:03 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZqFCD2Vt;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pkUuoVsPO7rj7crjxhqsXkiJdIbOheCDQODQm6zJmAM=;
        b=ZqFCD2Vt7XIixCiEhyyMNWbzBgC8/HWEe+DOP06G+8TrOcJBda7INaA/bVB6RhrgCd
         LrtcEBayKQv8INfLZFqbWJhM6Xx8RXiG1wNaTEjGOXFmM8YNp3iDjJptWWIQC5n45VFH
         GWiC711mj3mCdWj0Q1rgdhgxxhgm5Sc7otLmossU+z1o/QjFEwcEUCOtgbjLndYG/zzp
         XB3k7+uahOIsOip9ktuHl6WxtYugfwoB5yY7Jdo1o2dSZMF0WTau3Ubh9aKGXMFE7nlY
         0nQUbmGPLVfa8olOB3oMdu9NqgjruurtmHIa3OzUD0IKp+5RZ77yStwI69xQ3hI6QJT7
         XpMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pkUuoVsPO7rj7crjxhqsXkiJdIbOheCDQODQm6zJmAM=;
        b=F8d3N6cfmpEFPWYRlzTjLP3sWLG4tiLrNnx6UiHvHazN1R/BWdhn2Vy0EdWZQJdcJs
         s9r5F2jnFUXcTsB5FkneDWbLWn+42k4PteWh8oyyKDiGHmgvU0eVzFeS7o8Q3sUAcJMk
         mchosne/JJHOICaqEylftASIKazdKS9d/2w1BhSV73no6tSoi+jfe+/Nrg9xGuvoXNkc
         E7IvCthyPPxbKJbD/iVuTvvSdLgsQVZ43PyALm2X82NxS0kgujBy7Jol7+deIrxEMO3M
         YoH6QDobN9sw/FTC2I9RUkxFUxqolDvZiGZLVGPLUTqKv1sd6BzmmraUvb1EaoGpOMa1
         A5xw==
X-Gm-Message-State: AO0yUKVHRcC2tKQ4JTOicXZWiV4mpEjZqZCokqawAMZ9WGlZfkrRgX/R
	1PQWzt+g6yraCRuPzN7eV3e9njEg
X-Google-Smtp-Source: AK7set8iFVTfWWtS0zz8hF6MkQRG2xZr+tuqJQq4uuIeMSrvbduTuuD6ndgNwYZp+yjdL+XvAVI6Kw==
X-Received: by 2002:a5d:414f:0:b0:2c5:5048:8a6a with SMTP id c15-20020a5d414f000000b002c550488a6amr4395007wrq.60.1676557443658;
        Thu, 16 Feb 2023 06:24:03 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id r8-20020a5d4e48000000b002bfd524255esm1545552wrt.43.2023.02.16.06.24.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 16 Feb 2023 06:24:03 -0800 (PST)
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
Subject: [PATCH 4/5] hw/arm: Restrict CPU clusters to the expected type
Date: Thu, 16 Feb 2023 15:23:37 +0100
Message-Id: <20230216142338.82982-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230216142338.82982-1-philmd@linaro.org>
References: <20230216142338.82982-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: rssCq/EEy31X

ARM SSE expects v7-M cores; the ZynqMP SoC expects Cortex-A53/R5F.

Do not allow any other CPU type by setting the cluster 'cpu-type'
property.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/armsse.c      | 1 +
 hw/arm/xlnx-zynqmp.c | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index 0202bad787..1132fdcbe2 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -715,6 +715,7 @@ static void armsse_init(Object *obj)
         name = g_strdup_printf("cluster%d", i);
         object_initialize_child(obj, name, &s->cluster[i], TYPE_CPU_CLUSTER);
         qdev_prop_set_uint32(DEVICE(&s->cluster[i]), "cluster-id", i);
+        qdev_prop_set_string(DEVICE(&s->cluster[i]), "cpu-type", TYPE_ARMV7M);
         g_free(name);
 
         name = g_strdup_printf("armv7m%d", i);
diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 335cfc417d..e45cf88625 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -224,6 +224,8 @@ static void xlnx_zynqmp_create_rpu(MachineState *ms, XlnxZynqMPState *s,
     object_initialize_child(OBJECT(s), "rpu-cluster", &s->rpu_cluster,
                             TYPE_CPU_CLUSTER);
     qdev_prop_set_uint32(DEVICE(&s->rpu_cluster), "cluster-id", 1);
+    qdev_prop_set_string(DEVICE(&s->rpu_cluster), "cpu-type",
+                         ARM_CPU_TYPE_NAME("cortex-r5f"));
 
     for (i = 0; i < num_rpus; i++) {
         const char *name;
@@ -381,6 +383,8 @@ static void xlnx_zynqmp_init(Object *obj)
     object_initialize_child(obj, "apu-cluster", &s->apu_cluster,
                             TYPE_CPU_CLUSTER);
     qdev_prop_set_uint32(DEVICE(&s->apu_cluster), "cluster-id", 0);
+    qdev_prop_set_string(DEVICE(&s->apu_cluster), "cpu-type",
+                         ARM_CPU_TYPE_NAME("cortex-a53"));
 
     for (i = 0; i < num_apus; i++) {
         object_initialize_child(OBJECT(&s->apu_cluster), "apu-cpu[*]",
-- 
2.38.1
