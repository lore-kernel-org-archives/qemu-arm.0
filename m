Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp552993njb;
        Tue, 13 May 2025 07:16:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVGL6AfpqlpubhHyUTaGwkOXS/rXepu4nYpmF9M1BruStWgYjFUMkm2nmEthoHdrfuFuZmqROi/tWMRpA==@linaro.org
X-Google-Smtp-Source: AGHT+IGLm/Hp5wPag6rwKsZ2hTI0Y6SIiV0GfjuNR5dScW5AzHafiA9WDEPKLWo6P6PCDcfnNew4
X-Received: by 2002:a05:620a:bc5:b0:7c5:4c49:769c with SMTP id af79cd13be357-7cd010d525cmr2655764085a.6.1747145797887;
        Tue, 13 May 2025 07:16:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747145797; cv=none;
        d=google.com; s=arc-20240605;
        b=GoeWtgpju3aMIDtHOiOLHdo6Y3ZhhybfDp20C+B5g5bsqqg9gQks5sEMMsBLvMlRab
         DLtuMxAXeIxXlqvgbDE8E/yImh0d0UoUtzQejhyyCHQLvCnbAjKhBG9AMPLsJFZiz1Bm
         mjX2+KRN2NC2fd6P0r7MWqMHEIlW774ayNSALLdRys05vgExUUxD8PSdXuLJkiVH3hf/
         F8o79QjVFgtbxt7QvQV9el8IjCbpqvsE6ZM0DIkiNc3d/hxGJVA46aJiHuA63IeGpXCF
         NMgC08uI3GPKBOsbgotv7ViirhiO26yEKip0sa//QnyDe6ooKnxu41D/rtKKrdaiV2JE
         Hleg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=98OOmrWk25E/kwedxRasvOoS2mo+ShZuSOIhL7Rf3TY=;
        fh=ZZwLt5H82yHLOWpnvJwJfXwO1u4fGNY7kNtWC/UDUJc=;
        b=EVdsmo429+rq1yQzD8cXKQEDsVlaMZb/GsztQ9WrC5GbQKsQ/Vsn4s11CVsyX+ges1
         n9EZ1SDsUteu+uCr88ttBIX5+tZx4/FnOwOAmPF2fhlv06LjXthQWKudgz6GSPsmNBqB
         TSUWlSa36uD1PzXDn+brCK+BeQDMj4P8jvP7IFMk67On/R0ypPMsvOOYeO8rjPmGHS6c
         QZ2YbGiGGBviyUg1w4Vhs3y2KeVfXK1NODiyfOze/MczXpWncr2t9dU/tNQWWMTuG9sy
         Bpq4ztpzxLDBTKzTRt9oVoSkP70B9uxK/zsLoY3wqTzoT+PUY4A4zAHyh59GUgLEGQvT
         ztBg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@adacore.com header.s=google header.b=UbA1purc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=adacore.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7cd00fee752si1188343885a.545.2025.05.13.07.16.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 May 2025 07:16:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@adacore.com header.s=google header.b=UbA1purc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=adacore.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uEqQC-000450-Mx; Tue, 13 May 2025 10:15:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1uEqQ4-00043j-QT
 for qemu-arm@nongnu.org; Tue, 13 May 2025 10:15:47 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1uEqQ2-0005bT-DK
 for qemu-arm@nongnu.org; Tue, 13 May 2025 10:15:44 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43cec5cd73bso38704685e9.3
 for <qemu-arm@nongnu.org>; Tue, 13 May 2025 07:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=adacore.com; s=google; t=1747145741; x=1747750541; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=98OOmrWk25E/kwedxRasvOoS2mo+ShZuSOIhL7Rf3TY=;
 b=UbA1purcJ66oyDt1g9lAjt1woRnpsgNUKH0XeXK58Niy8zCqdYLFHO7WP53zMEFfmV
 MdcezDKEM1fD0ZZNJnStZX/sJfcAv+p3Rgh4u6rNAG1XBTvuOZwCWRJk/+EygJsCasIH
 mKCOrc8ihCONWH9SpI61oELGW9yvkvmLu1Se+6hsKnUfFXfmfpf8HH9ACvIMWTdGEDIZ
 MLQ47FYW/BrpBFS8+gEx7Z2XUXY44E8+iyj2VSm2aiY6AKQClzIydGocuxH8XOhMTlqD
 asVLDabsSxT72ICZSQam5YUjPOgI9UtKfWiHx2sCLNVIKDAYyodNrKpJ0OAOR92UWRxP
 XW0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747145741; x=1747750541;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=98OOmrWk25E/kwedxRasvOoS2mo+ShZuSOIhL7Rf3TY=;
 b=OC/9rTMpmjfzL75f9ElocTwOaviEkUYvpGNufcK/dZJ1zZDSs0BIQfmN9xfGN8nIPh
 garJinovabNjR+zJwBtz7UJFg7mqsqVMY2r9eCaYy60E4Hok199z6EcbH1EDfCBwo8kv
 bCBh/1qLirqWI92s3sQKJ1xo01zMyzT3b4+FxqlAO/unIvJnNDnIc1p+VF2OKbcKY+jO
 WutdEY34hoOeX8O5FfEx4Tg0bQUyLeViQ3WXv632PS9f8qRW/oaO7KGTrvtlko1CAf3K
 dYDPXTks+9ct6xdydtnt4D2CixPWktMwqA6sUkP1kSuDXKR5S2niT9pf6JYLO62eOe7k
 CnKg==
X-Gm-Message-State: AOJu0YwmM+N4LW1LJZ7Ks9y+VoPhoHbfQ5M5GLrhUGzbdQyhTqB//in6
 NNvZESvu3PAsQNnM1L68486881EjrV5JH9od/uj63LAlI/5ChkvYj1UrOvIUAw==
X-Gm-Gg: ASbGnctCT0J/SsJt8c8Y9l8WJP31d6XOA05f5xeZXD28XDEy0icTRT5DiZzHs3x0kPA
 Piv1hfEE9XzYdxiyk0S8etRS2x31T9ht6tvBWX1MWDcjkj+ssSVqWB0w9YggwX72qWH3Y8MViv6
 Y5t8+AUYGKfnKS6MD869C58WFZHon6xgEi3hAyq7vFtH69Hw+zcm9h3xU37BWKD6uaeK9ylw2x7
 4SlmdikeVEqAfxXbvvA4H+5seL75da9o2xd6FmjUnBr3WRAuadXQsjWPta818PU0eyaKI6Wtio9
 Cu1KJ0Nzi0EMBAjweh8xqyqB/8VZjeSHz8gd3iLdIVxhcud2GuUEeAgUwAEc1hKGSSDdwUyRSdj
 YP5+mr55sl+wtyB+gUYF6fI+CWajjQY5+qDnZFGy8SaJcHBxoFYw1TBurUsw=
X-Received: by 2002:a05:600c:4451:b0:43d:526:e0ce with SMTP id
 5b1f17b1804b1-442d6dc51e8mr128437535e9.21.1747145740789; 
 Tue, 13 May 2025 07:15:40 -0700 (PDT)
Received: from chigot-Dell.telnowedge.local
 (lmontsouris-659-1-24-67.w81-250.abo.wanadoo.fr. [81.250.175.67])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442cd3b7e7fsm213438805e9.39.2025.05.13.07.15.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 May 2025 07:15:40 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20Chigot?= <chigot@adacore.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, edgar.iglesias@gmail.com,
 alistair@alistair23.me,
 =?UTF-8?q?Cl=C3=A9ment=20Chigot?= <chigot@adacore.com>
Subject: [PATCH 4/4] hw/arm/xlnx-zynqmp: adapt cluster-id based on the boot cpu
Date: Tue, 13 May 2025 16:14:48 +0200
Message-Id: <20250513141448.297946-5-chigot@adacore.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250513141448.297946-1-chigot@adacore.com>
References: <20250513141448.297946-1-chigot@adacore.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=chigot@adacore.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: q04+bl3FXx55

When gdb is being connected to QEmu, it will be attached to the first
CPU cluster. However, the ZynqMP board has two clusters, those being of
two different architectures.
Therefore, when gdb is connecting to the ZynqMP, it receives the target
descriptor of the first CPU cluster. Up to now, it was always the APU
cluster, which is AARCH64.

When booting on a RPU, gdb will still connect to the APU. If gdb is
supporting only ARM32, it will receive the APU target descriptor,
resulting in:
  | (gdb) target remote :1234
  | warning: while parsing target description (at line 1): Target
  | description specified unknown architecture "aarch64"

Adjust the cluster-id based on the boot cpu will resolve the above
issue; allowing a pure ARM32 toolchain to debug programs running on
RPUs.

Signed-off-by: Clément Chigot <chigot@adacore.com>
---
 hw/arm/xlnx-zynqmp.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index be33669f87..f23ace6446 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -221,7 +221,13 @@ static void xlnx_zynqmp_create_rpu(MachineState *ms, XlnxZynqMPState *s,
 
     object_initialize_child(OBJECT(s), "rpu-cluster", &s->rpu_cluster,
                             TYPE_CPU_CLUSTER);
-    qdev_prop_set_uint32(DEVICE(&s->rpu_cluster), "cluster-id", 1);
+
+    /* In order to connect gdb to the boot cpu, adjust the cluster-id.  */
+    if (!strncmp(boot_cpu, "rpu-cpu", 7)) {
+        qdev_prop_set_uint32(DEVICE(&s->rpu_cluster), "cluster-id", 0);
+    } else {
+        qdev_prop_set_uint32(DEVICE(&s->rpu_cluster), "cluster-id", 1);
+    }
 
     for (i = 0; i < num_rpus; i++) {
         const char *name;
@@ -380,7 +386,6 @@ static void xlnx_zynqmp_init(Object *obj)
 
     object_initialize_child(obj, "apu-cluster", &s->apu_cluster,
                             TYPE_CPU_CLUSTER);
-    qdev_prop_set_uint32(DEVICE(&s->apu_cluster), "cluster-id", 0);
 
     for (i = 0; i < num_apus; i++) {
         object_initialize_child(OBJECT(&s->apu_cluster), "apu-cpu[*]",
@@ -475,6 +480,13 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
 
     ram_size = memory_region_size(s->ddr_ram);
 
+    /* In order to connect gdb to the boot cpu, adjust the cluster-id.  */
+    if (!strncmp(boot_cpu, "apu-cpu", 7)) {
+        qdev_prop_set_uint32(DEVICE(&s->apu_cluster), "cluster-id", 0);
+    } else {
+        qdev_prop_set_uint32(DEVICE(&s->apu_cluster), "cluster-id", 1);
+    }
+
     /*
      * Create the DDR Memory Regions. User friendly checks should happen at
      * the board level
-- 
2.34.1

