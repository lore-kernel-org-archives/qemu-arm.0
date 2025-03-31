Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp2412085njd;
        Mon, 31 Mar 2025 15:14:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXWN7uYNEoHJ/XufY4LNL6XAZbUFxRnuDY5Q7p3nlBK6yyPr2ZPvT082NXiquNr1S7TXN9OjxD37z4LNA==@linaro.org
X-Google-Smtp-Source: AGHT+IGWAM+E308zSc7f2cOJrhEenKvXp/jSYd6W2sp4D37OVTh5DBBKiEkxlA9fq7ZfOIulR3x4
X-Received: by 2002:ac8:5751:0:b0:476:b56d:eb46 with SMTP id d75a77b69052e-477ed72426fmr131523191cf.15.1743459276830;
        Mon, 31 Mar 2025 15:14:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743459276; cv=none;
        d=google.com; s=arc-20240605;
        b=XZJej1j9FnIALcMyHdvE5mTUw1QT4gT86i1ScGvS/FYU5KxnxxDXA5uDkPBJR+KCxc
         wBBdNTTKBQwsvp853OySXZtp2wCzmReaFYX2hZkf39mZFlW0l7T8CYcNZjNcPBF9Y5cT
         uP44Wf62iKryJSNQ4Bf1C+7nLLNonthZrSOcRCxMHQk69qt6PkODEvj2R6wt4nmuD/9h
         yLsnfvL9mYUYDBHIhKAGjsKvS89eiamFa6I1D0spwe4VuVgXnY6xvtcvywP1vWI9PeXY
         95Ajl0IjNc5yGV98n9R2h+cybpapgCWfmUL90jl3upDN3HKwU1SlB64cYDfueuVfiD1q
         9Bkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=/KLJrDvoh1faXMk+CdmP0dMnMEwSNEMM0AJfQ5Q45FQ=;
        fh=Y/kC1Q4d41u7Pz/wAUfEwBq+31HZHI5q1O9R6m6NfSM=;
        b=B/j3dSlVf8YQ8CNHPwrDyDuiqErN/9isMJw0JCj6Sq3l+M3ieS4rP0lvY6XyqpIdPS
         MnAQIbo0Vmxl5okdODydKe+zMrBkxsekfSz1tTuPQWFJBKWOTDbKLaT3WcbEcXORqsH7
         I7gR/lvV/ohifTxF1DNWj1rmIMfK9JIAjGRM6fJrNY3hIaQlEJqCMYoCd/0aIHALH1Fg
         C1ejH6DIg9SSBwZND788YDB/d9lGGPvBDUWjIXbBXUCwmGS9mGxxZHqbGFEjRoA8+E/2
         68w+LAvSDy1XUp3AgXNA0N4+jLVAnr/7l8exGi2A1gNu0vLXqk3dB4EEIbWxZxQ+7N8V
         kFAA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gWsE2kxb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-477831669efsi72702871cf.429.2025.03.31.15.14.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Mar 2025 15:14:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gWsE2kxb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tzNNP-0000b7-Qo; Mon, 31 Mar 2025 18:13:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tzNNN-0000ZJ-RT
 for qemu-arm@nongnu.org; Mon, 31 Mar 2025 18:13:01 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tzNNM-00076F-64
 for qemu-arm@nongnu.org; Mon, 31 Mar 2025 18:13:01 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-39c14016868so1689096f8f.1
 for <qemu-arm@nongnu.org>; Mon, 31 Mar 2025 15:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743459179; x=1744063979; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/KLJrDvoh1faXMk+CdmP0dMnMEwSNEMM0AJfQ5Q45FQ=;
 b=gWsE2kxbR348jSf67ACN5MUeMdZrzZbCfcaLi91wnIPYrIF3T12jeeLYreS3Gy2qdS
 vxRc1cPa5MIK7MUR1Dromjp8cYyWQ/wFZeJIaZN/mzccm76Zsmbb9Dl6Fs2gy0rto0P6
 dpZJnKx/nrH3mQK9r4MI/A8fvcIQYMDlAsVG1L/jpmTt7ROPCY4yx+15/oD8b4MiGpCa
 hpVycVYFzFPIu7KAPJiaNI2GuHsiNRVIyJQ4+TiD6mW4GgdUY5NSYAe+oxTaZaYlfDQ4
 TNJItKSfm7+PpuECKYvxkuuHVS1dB2snxBopXaZMJbZ38rb3bLFEhyYjjGwGq2UGJk7a
 7qtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743459179; x=1744063979;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/KLJrDvoh1faXMk+CdmP0dMnMEwSNEMM0AJfQ5Q45FQ=;
 b=Gz1Hyx6EBxsgWC2xENcmqEhwi0KgPGd4V2ZnGIM6D4FxXamsbDh/yPf3z9njyOeika
 vW5Dm+KiPlsCMd7fvmjVLuALzdJ29BKjFtMYlf0ReZjbpadrex+Z+ADQr8wKp3J/flcP
 2x8wAHwQhYiUZgSxKBl6O5SO13P/C3OIVAWkBTy+VXLuGejEPz30aW63K9Gwxb1BECoU
 nJ3x+aZI2Rkg1Vj/YECz/pD/pT8WJlUa1ayYx5l10gQVq2xkSQVzayxMnTNjEcBHAptC
 YGPCpsRwR1xt5QGGgfwiqgmOlSgKrW78KTeUI1GD021SU4hC1IE6crBrNMvVU+d6bWtz
 5nuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBKsWaoku308IDRPzoVjXPyeCqGjdFg7If7AHG/1/w7cXMfn9WzSyLlWZXLBpwxOtb1pV8+ZKGAQ==@nongnu.org
X-Gm-Message-State: AOJu0Yw/+A8Di+076wzjNMbqHg82M5a76/+bx1+fGpd/dPQ48mx90Vr9
 OqmXs7qODi7xeTiqjSQM8H3QURruPIs1YGwbW8+8Fiulo0C9H6qUZzHi7W4oG0A=
X-Gm-Gg: ASbGncvUc9RZXxYfaxIJpZUfxIJHEXOM/2MyC4ukuSiLt9EB4w6ee6RnD+Hn95z4zut
 WfFWUIU7sM0zuw+nSlf+qMdhXnvK1Nn16IMeSslaOOvclZ5p8ybqlNb0Iw3qYFqnQPBoA2Af+JX
 GBg4SXc9x4mQIDSb0AllKsDU2tN2DqGMEiTuG/k3NckLPw5xxNWTS1wcj/FbW6rsF+hRXviTBKB
 pMYLNudv5//1UIrDu7Lx78CmVInyTY/w76CQRwQ4egCxsstx+gx9jG7VFnbN2NWmPa2/W/34Lzk
 lHfyrPRLt8Hr/R7+o32AGXiuHLLohv3/OQdJN6qMrURDO5dmE2oZgLNn50MogKl7yof92PngRBt
 tYbffqbc+4HRWeo6stVk=
X-Received: by 2002:a05:6000:188b:b0:390:f0ff:2c11 with SMTP id
 ffacd0b85a97d-39c120cb546mr8952099f8f.2.1743459178856; 
 Mon, 31 Mar 2025 15:12:58 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d8835e627sm164459555e9.29.2025.03.31.15.12.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 31 Mar 2025 15:12:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Udo Steinberg <udo@hypervisor.org>, qemu-arm@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Gustavo Romero <gustavo.romero@linaro.org>,
 Ani Sinha <anisinha@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-10.0 3/5] hw/arm/virt-acpi: Factor its_enabled() helper out
Date: Tue,  1 Apr 2025 00:12:37 +0200
Message-ID: <20250331221239.87150-4-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250331221239.87150-1-philmd@linaro.org>
References: <20250331221239.87150-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
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
X-TUID: QQCo5+UKvh+I

GIC ITS is checked for the MADT and IORT tables.
Factor the checks out to the its_enabled() helper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/virt-acpi-build.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 3ac8f8e1786..fdc08b40883 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -208,6 +208,13 @@ static void acpi_dsdt_add_tpm(Aml *scope, VirtMachineState *vms)
 #define ROOT_COMPLEX_ENTRY_SIZE 36
 #define IORT_NODE_OFFSET 48
 
+static bool its_enabled(VirtMachineState *vms)
+{
+    VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
+
+    return its_class_name() && !vmc->no_its;
+}
+
 /*
  * Append an ID mapping entry as described by "Table 4 ID mapping format" in
  * "IO Remapping Table System Software on ARM Platforms", Chapter 3.
@@ -670,7 +677,6 @@ static void
 build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
 {
     int i;
-    VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
     const MemMapEntry *memmap = vms->memmap;
     AcpiTable table = { .sig = "APIC", .rev = 4, .oem_id = vms->oem_id,
                         .oem_table_id = vms->oem_table_id };
@@ -741,7 +747,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
                                           memmap[VIRT_HIGH_GIC_REDIST2].size);
         }
 
-        if (its_class_name() && !vmc->no_its) {
+        if (its_enabled(vms)) {
             /*
              * ACPI spec, Revision 6.0 Errata A
              * (original 6.0 definition has invalid Length)
@@ -973,7 +979,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
                           vms->oem_table_id);
     }
 
-    if (its_class_name() && !vmc->no_its) {
+    if (its_enabled(vms)) {
         acpi_add_table(table_offsets, tables_blob);
         build_iort(tables_blob, tables->linker, vms);
     }
-- 
2.47.1

