Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp2175102ejb;
        Wed, 21 Feb 2024 13:21:47 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWaFKIMphy88nF5dewpEY2BC1jQm7aBTVX7rdQwGGY+evFLcrmNfG0D8Pr1RqMD6gxtPP9eicMHNENtfcxpXnC+pEUWGW8F
X-Google-Smtp-Source: AGHT+IE/5Ze7GFbuTMemUX9j7P6xM1pHZeIzo2ZThe4ToCByDNM4CaypIqk9R80DymRa0MJMnr5t
X-Received: by 2002:a05:6808:211a:b0:3c1:5f25:1447 with SMTP id r26-20020a056808211a00b003c15f251447mr9143941oiw.57.1708550507760;
        Wed, 21 Feb 2024 13:21:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708550507; cv=none;
        d=google.com; s=arc-20160816;
        b=WszWQoZ/9dPiIz6Hpw0q6uE7Nq3aU6PMXVVuToa2M8qBkFc8DnY4l5yCMWMj1Z05DE
         1qxpLHYyH1fmrjHyiXFfeIDuhBh/vMlbLOfisGTpT1Du2cl3S7bL0t9L9WPu0ZOKVyzU
         ZM2ezyhxlHRejvJUofOE6Syxl36CdePx+/qwtu2Zqicn/6wEEpAtG6mYaLL6nkB3QkL1
         wTPWsjUNDyOJBxuai/nY7XN7ty0LUN4njjlGA/vdHCci0bOaJ7HgcBKxRNqXQH9jRPNP
         Z33Ii4rK0KSnnC5G5bPfwyKKz/YqTu+SbVmODTrdydsVOCv/b+BnksPyMz4s9GTJrnPr
         jlxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=TS/v5N8VdhzRmhkYhnKkjLky4Kvoae1G5ndSJvSbSPI=;
        fh=TBkf8G+Ez4Eaw6VUUzH52/Tgi6ZRMzC+7d8Wa9UKRjk=;
        b=lQVH+Twif/jNqWxL9tUgQs4c/QO7G4+XHEq4q2WpCz/9ZRANDk+Mg5Yafq21Dwlbri
         j/EYY2hYAc4lcG5EkLxruyx1vWhtm2/0OZOcaigAwYR4xTg2K+rjD47+uI+/YXGSA11U
         m47RE7v1/cFwUzqvM2YRlQDgPwOJA28W/XdYzxDIuFH7caCQanMKHgvCiJpxXTiqZbtr
         oGUTotSLXnZZMNaV4hNI0rtomb6RVPb+gCsRpSrkfYMeUCpFL48j7ts8eO4rDf8qm6ZC
         Ww3GWXOunOmJExejRfcxxzn2kA9CxN7IirtNfI8uQ03EQhFzDKME30LAiuGpZx0XfbVM
         yfOw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qe8mzHBk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u18-20020ac87512000000b0042c66f982dasi11400311qtq.358.2024.02.21.13.21.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Feb 2024 13:21:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qe8mzHBk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rctyX-0004N9-Jt; Wed, 21 Feb 2024 16:17:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rctyO-0003W8-JG
 for qemu-arm@nongnu.org; Wed, 21 Feb 2024 16:17:50 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rctyL-0000yo-Vt
 for qemu-arm@nongnu.org; Wed, 21 Feb 2024 16:17:48 -0500
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-33d2710f3acso139274f8f.0
 for <qemu-arm@nongnu.org>; Wed, 21 Feb 2024 13:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708550264; x=1709155064; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TS/v5N8VdhzRmhkYhnKkjLky4Kvoae1G5ndSJvSbSPI=;
 b=qe8mzHBkyj6O/Omp2SsxsOjnG1sBVQRdEBzjCBFGHCIm29qXDuHR0hCpUd68Ki/Cbp
 nMxIMdYLvRjNvECbzOBEjd0oUiRii244jH720dTlMLxYQuhU8MoTTyCWeYY7YH3cQ5Ii
 lLR00QW83OHR1u+uHQVxkI7KkNHZyTmNnN8a/ZkCAdehFOeJ64GUc6fglig71E/uVqnH
 AQXNnB8qVRVtDCbnNmTu/0vTKkbydtHr3s9j2xXIuaSYKtqXOHD7owsXVr89rtOlfD0D
 3vSYjkwBzqZgW952fwZS5hkLUwKyK1fR+w9odJ7zFzZJ+7BUyn4c89aD/7mQmdBh9iPB
 rFmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708550264; x=1709155064;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TS/v5N8VdhzRmhkYhnKkjLky4Kvoae1G5ndSJvSbSPI=;
 b=EFGg6r3oQIVNV6kKofUNcPUkhyPbtk+BIbBrIGGYzXSaCVFPOP1H3rIx7ZrVRwGRbF
 MH1tcqbP57Ju4FgnQ4f3zcL166rkpLu4b4MXsfkeYNuZJyYNWhX/E4p1oz3V1SIRxCFy
 Q+AyPIL/qI1jEb8uV3cAr0TZBht8b3caZNw9JU7V9BZ+TYYN63NV7uIlKSl+z6rGx6p1
 sLVvpFZh1VlzPs5m6qLr+v8vNzZ0ka83vllshBlviC1UZ6dPY+CkJQ9HMpi8tScwSLU2
 u/KWwmkMyVUhs8yPqXgsOHTolfuuoHeRyg5MU4i+6Sb2c3pGBQ7NzLm6EbALGdHJVD4S
 3MEg==
X-Gm-Message-State: AOJu0YxAL8/qKBdjFITxhqT94eOAGZWe2cArTGS2xdc933hodPCoUGvs
 HZ1DSNNlto5PIztxKTv0RNi58KiH9XScOXYE+xyqHIsv2UD6peo6F6sCxeRzd+A=
X-Received: by 2002:a5d:4fce:0:b0:33d:27c3:9f47 with SMTP id
 h14-20020a5d4fce000000b0033d27c39f47mr480220wrw.35.1708550264622; 
 Wed, 21 Feb 2024 13:17:44 -0800 (PST)
Received: from m1x-phil.lan ([176.187.211.34])
 by smtp.gmail.com with ESMTPSA id
 q17-20020a05600c46d100b0041249ea88b9sm18846364wmo.16.2024.02.21.13.17.43
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 21 Feb 2024 13:17:44 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-block@nongnu.org, qemu-ppc@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 08/25] hw/i386/pc_piix: Share pc_cmos_init() invocation between
 pc and isapc machines
Date: Wed, 21 Feb 2024 22:16:08 +0100
Message-ID: <20240221211626.48190-9-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240221211626.48190-1-philmd@linaro.org>
References: <20240221211626.48190-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: +CqcQ3JYIDa8

From: Bernhard Beschow <shentey@gmail.com>

Both invocations are the same and either one is always executed. Avoid this
redundancy.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-ID: <20240208220349.4948-3-shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/pc_piix.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 999b7b806c..9064511507 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -341,11 +341,8 @@ static void pc_init1(MachineState *machine,
 
     pc_nic_init(pcmc, isa_bus, pci_bus);
 
-    if (pcmc->pci_enabled) {
-        pc_cmos_init(pcms, idebus[0], idebus[1], rtc_state);
-    }
 #ifdef CONFIG_IDE_ISA
-    else {
+    if (!pcmc->pci_enabled) {
         DriveInfo *hd[MAX_IDE_BUS * MAX_IDE_DEVS];
         int i;
 
@@ -363,10 +360,11 @@ static void pc_init1(MachineState *machine,
             busname[4] = '0' + i;
             idebus[i] = qdev_get_child_bus(DEVICE(dev), busname);
         }
-        pc_cmos_init(pcms, idebus[0], idebus[1], rtc_state);
     }
 #endif
 
+    pc_cmos_init(pcms, idebus[0], idebus[1], rtc_state);
+
     if (piix4_pm) {
         smi_irq = qemu_allocate_irq(pc_acpi_smi_interrupt, first_cpu, 0);
 
-- 
2.41.0

