Received: by 2002:a05:7022:510:b0:92:a90b:6588 with SMTP id 16csp3171675dlj;
        Wed, 15 Jan 2025 09:12:24 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUDw0oGD+0csHhP4m07KsJf4k7fQS8US9fnirseews3CSJn3zgTH/IRMA5MNZgkRERdcgXDs/uPEJF5aQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHk7lE4y2sjBahAHhMKgksB29PgwGxj03kpyoC7EoyOK+48FIF+QpikbI+IiO9+564s5Q4s
X-Received: by 2002:a05:6214:3112:b0:6d8:a1b4:b591 with SMTP id 6a1803df08f44-6df9b232915mr520225756d6.23.1736961143924;
        Wed, 15 Jan 2025 09:12:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736961143; cv=none;
        d=google.com; s=arc-20240605;
        b=NIk2zXZ/d39J6P05SZ3MLFt3/GIr9V/h71CewYGRUZQng+3WG0uB1DyX8iOBNpVTwr
         /ucQOd5OQFF0t9pqjkpt2L6VnMqBk0d3LvnQmSfm4l0YzGZ5rS/XK/rhHnItgn5spvV2
         7oqUpnl3DS9WNA3MtQzsOVPLxojEYJmgn8mqCb3/RzHY3/e+5QGPxX61QoVZwQemjSif
         SWSmyMUviHZrolBPCNDiudiT70eRaHv0YB6hmjLL32/OLDUN3msU96h2IEi7U0bR3+w6
         +f04Ldibjp1g8CpUfUMKgD+GsNfI+jfyooXWaTDNxY8ITwPb2HyDgeVIlxB/vGXf9KEU
         T7lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Pa1qCoN+HFadRplHhWS5olMOGiE0VGbusTWsCAk4+KA=;
        fh=DYO7lvo0pmpa6OTpkwLp+pCOjKL1ZOB7HGHm9vr83wk=;
        b=OCMvpTKVMu42n1mp2XZ87f5RxBJqfHHGiNXaeop2hAAJOHlsiRm6tCIper77qiKetZ
         /cuw0l9xAaQa0vfMNYRN3TfHyNKoro1EtLVUsy0j9wyq462BkTGAvZdsNT/Fz3ntsntX
         bGCioplZNTCt95PK6cBGif7yZAsRL6fx+6BwCcYDWg2z1MlOshRGneg0gvCvfvIQwznX
         0bUarsbaYmOmEBw3uIm52rOJ0YM4NF69jZOgfimVRIGzL6S0fpXXDQB6x8KMo2GOqeD0
         /zd4pqU2MpEuLFtwNj+fKZAu0yJt+aVxsP26WqgKKshp5huMrbWaHaVHIC8BB9RYrkMq
         uixA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HctiuCNc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6dfad8aac9bsi153873296d6.37.2025.01.15.09.12.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jan 2025 09:12:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HctiuCNc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tY6v5-0007id-M0; Wed, 15 Jan 2025 12:11:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tY6v4-0007iP-PD
 for qemu-arm@nongnu.org; Wed, 15 Jan 2025 12:11:06 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tY6v3-0006cg-B4
 for qemu-arm@nongnu.org; Wed, 15 Jan 2025 12:11:06 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-436637e8c8dso71996435e9.1
 for <qemu-arm@nongnu.org>; Wed, 15 Jan 2025 09:11:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736961064; x=1737565864; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Pa1qCoN+HFadRplHhWS5olMOGiE0VGbusTWsCAk4+KA=;
 b=HctiuCNckYM0/rmBwP5kYRJydkDSY8Db61NzhG0iebv4PUzmcyk2YooA+wHsf3K/Y4
 WrIxHQ6BCddHYimGq/pZGXTw7WfGpQSj3ef4/VxiC3NaygKmfS0m8dfxPXz3qKkeJweM
 1f4aWOqpZm3qfSs6sU2cn0FjVz4Zcdacvj3Y+hoa5Hvr3EPsa/xpFIOSMhrbfJZE0V4N
 AxtUHR8sN3AIp4d9lS5Z8m329fD0dJcbJUxJHejcOYFxaUsR1UWIVlaQk4zVxkqPfneL
 pQ746uNSxDqXGsebIdQESo06rkuZvlDi4csvbkzHbMTpVw+3VsikNxYY3NHLp/0p2o83
 57GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736961064; x=1737565864;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Pa1qCoN+HFadRplHhWS5olMOGiE0VGbusTWsCAk4+KA=;
 b=C6zHza4jkPf/V/4Mv4AfDeRQBxLnJ1YTqN2Z1WscU5RXeUPWUEXI/LWp82mVWuXLNu
 huwv2AIrbkXpOggRmucjNz7DOQRfNGbSYHDJZJg0Xl0rezwUN3ItDV7GLmOlAeUFga+z
 CSJ0R6447WpvLlbQZaxGYCGHzw3fwj07ewuzV1yFcPq5pc+Y26rROVRisd629VosnkPx
 M7sv76UoRKelmX3EUuRr2fSY4lherJBq8yddA3QU3Tvg49/fDRxP+I01SGKnUgRZxW10
 83qQ2nCS22XVrEfEUXhc0F2nEVkPtZF9viLXGdQuCwrGrgE7BtC5ZrYXgqxO5wCDJNEB
 wAlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU385GdOMyl6p9gkkE/MVi0nfGhgYsKJguM9uqfGJ9p/+lGk5UNBbFyqHmSx5i8KuJJFWFl/N2B+A==@nongnu.org
X-Gm-Message-State: AOJu0Yz/5w+soxD8pMDvNB5krqW5OJ1hcUHt3Ao/i9PMcJtmoNg7rcRl
 x4S73jf3d8wZFVgeqYIlgFPSb92s5u3DtssPGepGXkPSfE0UC7wdAeEC0+9x19Y=
X-Gm-Gg: ASbGncvLbRCqjfSgTy2k67HrdhijnzklHwiw6ZoSHdihBVthcMMPAkpCko62u3/opiR
 kuAvHD2lJWAR+ECnkh9OvUUFNrTrmk68gm5hHyt0EWqdANX4R7yrp8yUCB1Ir9HRbyvee4tD4Gy
 bzw/HPcV8Va/4u4O1EO5EuMoeWzVdi9ryg8OkbnGV42ZILjFzPGWegnDC8GiDBtFA6ZZQV+WFgd
 3R/4qSsqKLrasFm6alB0YX9OgTTqkEDW73JN3r2buMVykqbYLNF4bGJwevurGFgaZXw6qJvDbLz
 KkJA6c250q0SRK1Lz6njUBaSZf2UK7VQhT9i
X-Received: by 2002:a05:600c:4704:b0:436:469f:2210 with SMTP id
 5b1f17b1804b1-436e267f796mr222655705e9.1.1736961063756; 
 Wed, 15 Jan 2025 09:11:03 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-437c74f9ccasm29530045e9.39.2025.01.15.09.11.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Jan 2025 09:11:03 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ani Sinha <anisinha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jones <ajones@ventanamicro.com>, qemu-arm@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 11/13] hw/arm/virt: Remove
 VirtMachineClass::smbios_old_sys_ver field
Date: Wed, 15 Jan 2025 18:10:07 +0100
Message-ID: <20250115171009.19302-12-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250115171009.19302-1-philmd@linaro.org>
References: <20250115171009.19302-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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
X-TUID: JlWESc61It30

The VirtMachineClass::smbios_old_sys_ver field was
only used by virt-2.11 machine, which got removed.
Remove it and simplify virt_build_smbios().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/arm/virt.h | 1 -
 hw/arm/virt.c         | 4 +---
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 9c531e28d04..b2cc012a402 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -118,7 +118,6 @@ typedef enum VirtGICType {
 struct VirtMachineClass {
     MachineClass parent;
     bool no_tcg_its;
-    bool smbios_old_sys_ver;
     bool no_highmem_compact;
     bool no_highmem_ecam;
     bool no_ged;   /* Machines < 4.2 have no support for ACPI GED device */
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index ae331df9349..08117b396a6 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1688,7 +1688,6 @@ static void virt_build_smbios(VirtMachineState *vms)
 {
     MachineClass *mc = MACHINE_GET_CLASS(vms);
     MachineState *ms = MACHINE(vms);
-    VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
     uint8_t *smbios_tables, *smbios_anchor;
     size_t smbios_tables_len, smbios_anchor_len;
     struct smbios_phys_mem_area mem_array;
@@ -1698,8 +1697,7 @@ static void virt_build_smbios(VirtMachineState *vms)
         product = "KVM Virtual Machine";
     }
 
-    smbios_set_defaults("QEMU", product,
-                        vmc->smbios_old_sys_ver ? "1.0" : mc->name);
+    smbios_set_defaults("QEMU", product, mc->name);
 
     /* build the array of physical mem area from base_memmap */
     mem_array.address = vms->memmap[VIRT_MEM].base;
-- 
2.47.1

