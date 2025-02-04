Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp408739njb;
        Tue, 4 Feb 2025 10:31:33 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWWbMgpZKlZquMnXpDGDQJdjL3j8+avXRcCyrNUtk8AB8jJWspmvFB3FhQ2PBGED97/zpQEuld0S4qLOA==@linaro.org
X-Google-Smtp-Source: AGHT+IE47kA41ab0uveutQkGOkJH2swRMPDCzyWORWoLW3lnZUIcIORgHu0ED+ToXL8Hdi+2Iths
X-Received: by 2002:a05:6122:ca9:b0:516:dc0f:c925 with SMTP id 71dfb90a1353d-51ef9dd6350mr3280856e0c.6.1738693892972;
        Tue, 04 Feb 2025 10:31:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738693892; cv=none;
        d=google.com; s=arc-20240605;
        b=GZhmzaNiS8bY2N9c+7MMenzN117tulzEJXE/nF6kQ9zNO2xh+2L5iLIVaTzEQroIME
         zsgYjYU1HSFwf8XAVznV3jg4UXxNQxq9qC1nfsIR0l4V+W5F/S+mXBaF5lLTRukuceyD
         lWxfYvFnhH/gHbfqA+tKhSrXbMlB/vaJdMZFHWpBOmmpNFVz3oi7/5TjZCUTYKZsf1zt
         08rfkaOY2P9G5+eIRpSUxuAR3GIKsE+guWElJ5elwzXCgjKX4/D+/dGyxWSbZt7t7pJ0
         xH2wRLvKljlcVInC4VzYUWVOxHTQ4lmbx3xb7HKxdr/ZxmBykYhJWt3ldAdfG/PdXocT
         ybgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=bMSMAcw63WhCEzylD0QLkcsjYvnfbTQfvq7nklxvlvM=;
        fh=6Ac7rd1sqNQYQ3AOFuZ9LS+akvNNGJF/e3vLwfEFzzU=;
        b=E9+VG1/XhkVAPRJlgHzr0qSyBbr6abYzKqtLX80DXvIaRmYTIZunZZGrxRHcBS4cbw
         GfrycmjAzfLUrcFk8+KgL8er4rj7M8fIUhk8zjSei/hfbsKzBemOLyIx6NGsKQudLWnT
         /AOo+qZoGZ92ADMAWKyrGHJXMzaf6ZtsiwH4ur7aVMuOTh67xJ/QtbP+6kDmDbMvLk6R
         fr/fp/SPhwNTWVWLxOLO8YdzyxmY8Mg+971lkiJsjsEZjko699G5pKP9F0IafppoqJpP
         sRQQW6AJIEVM4pPGBYj01W+Ubz2qTe35nOKcpcOuWB6RprhBFWcEMYHjGwYsSn+E6Zfw
         gPJw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nz61vyz7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-51f092afeebsi287841e0c.260.2025.02.04.10.31.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Feb 2025 10:31:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nz61vyz7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tfNgG-0000zh-S3; Tue, 04 Feb 2025 13:29:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tfNg8-0000cQ-Nw
 for qemu-devel@nongnu.org; Tue, 04 Feb 2025 13:29:44 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tfNg2-00050n-BP
 for qemu-devel@nongnu.org; Tue, 04 Feb 2025 13:29:43 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43690d4605dso41202875e9.0
 for <qemu-devel@nongnu.org>; Tue, 04 Feb 2025 10:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738693775; x=1739298575; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bMSMAcw63WhCEzylD0QLkcsjYvnfbTQfvq7nklxvlvM=;
 b=nz61vyz712M3Oy51dR2sfzwtlP0B9zaXcdKAASXE4/FRRoJnYLKlSaWYbBASQIkMdU
 q0EKgDV0UUMDUdhYhQDMsiqVn2/YKm8iRXK9iyHUQJ8UQ/0F0H4Jg/tIwxBTyUeWp1x4
 GpBA1vGX4r8Dn0OAQPrlb4Qs1Cu1SG1LCKuW2gfFLp5r27O3KXJTxPfNgI1vk18L5IzW
 9QB8WJtZnxaEwJbz+8DS8j/Jrbso/gEnrbcLVzuEiM3cCIkEKAqk78QUHKpUe1aX1l0x
 aQMjqw5UCpej0Cd63KFVH7JiPzlPBjEJcHJLi7NZqKcQFdbAropRi+htZJZevmwSSxlI
 ATTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738693775; x=1739298575;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bMSMAcw63WhCEzylD0QLkcsjYvnfbTQfvq7nklxvlvM=;
 b=HqpNrm1j411wO7YdZPs0MYSySznUSDPbn9r/8xGnq8A5KI80GkNCv3j4lOokKNmsQ5
 XwkR4qMECpruNQsyjAytvqtF8Bo9XQlaabWXT2AQrANtMDKRRqk/dCoXzEb3eriQJKvq
 UDWBz0kAuqt706/nSXMQlvdZW+UIz0QTsvEgxyoScfjSG/+7AKU+A8rpWImFbHA2xmbO
 MjVcJeUlW3Xucm5shE2fxrtqv5BonUu7R4R1gsdtvLbrzbUGpzzSp1298Yj8rTmNIRrj
 6lhHi+MJvHFU5jgMXiiZuSOLW9/qu3CQvPo2g2Ln0Y4VvatAulNmKqYPwnWjgg/wSEZ4
 pCvw==
X-Gm-Message-State: AOJu0YyRwfZDql/TaSHYHAeAic4OetwHPV9Mj8ZxLQnXyDmL6qZLl3WT
 nqwqhhSctw+AOQ52dssEkUp/NphHGYLBhY/9tirZ37qVN55l/x4ArCyZZ1v4Z9F8U4B8nGDBp0q
 SBIw=
X-Gm-Gg: ASbGncvswNI5WQMSCNol4rM7BJ9SCepK14RF4FxPSVZ8DjVlrvSasRcRaJcpuqsDSMt
 dJ1PiKErdQIIHlyc7PZo3bYt+6nn3XbdLasn1dH5Fvn6V64KTdZqMMMh7W9fVPm1O9XBY61fWnJ
 XaJifyKpQaYzCKaihZ++CULUxIbBu4G6ImSAi8xTtvFFyTi2WUJ2XS4d12F4tawU1laM+uYQVoJ
 X6riKJWfrjEDl+I4tFcSX50qVYMs5phmKk9+nPzlkl5X4eatljmu9zth0We3KXw+2hw/XA2BIBe
 BchJ9QwV+O2EmgbZ4O2sgkx1H833wpKbFtsXwnKbbGJnKujYwr17zdxcsGAJUjLZcA==
X-Received: by 2002:a05:600c:5486:b0:434:a525:7257 with SMTP id
 5b1f17b1804b1-438dc410b0bmr212790495e9.21.1738693775230; 
 Tue, 04 Feb 2025 10:29:35 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc2f17dsm233343285e9.23.2025.02.04.10.29.33
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 04 Feb 2025 10:29:34 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 6/7] hw/riscv: Remove all invalid uses of
 auto_create_sdcard=true
Date: Tue,  4 Feb 2025 19:29:02 +0100
Message-ID: <20250204182903.59200-7-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250204182903.59200-1-philmd@linaro.org>
References: <20250204182903.59200-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: UQZmxc9mdJxj

MachineClass::auto_create_sdcard is only useful to automatically
create a SD card, attach a IF_SD block drive to it and plug the
card onto a SD bus. None of the RISCV machines modified by this
commit try to use the IF_SD interface.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/riscv/opentitan.c | 1 -
 hw/riscv/shakti_c.c  | 1 -
 hw/riscv/sifive_e.c  | 1 -
 hw/riscv/spike.c     | 1 -
 hw/riscv/virt.c      | 1 -
 5 files changed, 5 deletions(-)

diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
index d78a96c5354..b9e56235d87 100644
--- a/hw/riscv/opentitan.c
+++ b/hw/riscv/opentitan.c
@@ -121,7 +121,6 @@ static void opentitan_machine_class_init(ObjectClass *oc, void *data)
     mc->default_cpu_type = TYPE_RISCV_CPU_IBEX;
     mc->default_ram_id = "riscv.lowrisc.ibex.ram";
     mc->default_ram_size = ibex_memmap[IBEX_DEV_RAM].size;
-    mc->auto_create_sdcard = true;
 }
 
 static void lowrisc_ibex_soc_init(Object *obj)
diff --git a/hw/riscv/shakti_c.c b/hw/riscv/shakti_c.c
index efe814b5868..e2242b97d0c 100644
--- a/hw/riscv/shakti_c.c
+++ b/hw/riscv/shakti_c.c
@@ -84,7 +84,6 @@ static void shakti_c_machine_class_init(ObjectClass *klass, void *data)
     mc->default_cpu_type = TYPE_RISCV_CPU_SHAKTI_C;
     mc->valid_cpu_types = valid_cpu_types;
     mc->default_ram_id = "riscv.shakti.c.ram";
-    mc->auto_create_sdcard = true;
 }
 
 static const TypeInfo shakti_c_machine_type_info = {
diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
index 164eb3ab83b..73d3b74281c 100644
--- a/hw/riscv/sifive_e.c
+++ b/hw/riscv/sifive_e.c
@@ -153,7 +153,6 @@ static void sifive_e_machine_class_init(ObjectClass *oc, void *data)
     mc->default_cpu_type = SIFIVE_E_CPU;
     mc->default_ram_id = "riscv.sifive.e.ram";
     mc->default_ram_size = sifive_e_memmap[SIFIVE_E_DEV_DTIM].size;
-    mc->auto_create_sdcard = true;
 
     object_class_property_add_bool(oc, "revb", sifive_e_machine_get_revb,
                                    sifive_e_machine_set_revb);
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 1ea35937e15..74a20016f14 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -358,7 +358,6 @@ static void spike_machine_class_init(ObjectClass *oc, void *data)
     /* platform instead of architectural choice */
     mc->cpu_cluster_has_numa_boundary = true;
     mc->default_ram_id = "riscv.spike.ram";
-    mc->auto_create_sdcard = true;
     object_class_property_add_str(oc, "signature", NULL, spike_set_signature);
     object_class_property_set_description(oc, "signature",
                                           "File to write ACT test signature");
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 2aa420f6e55..241389d72f8 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1918,7 +1918,6 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     mc->default_cpu_type = TYPE_RISCV_CPU_BASE;
     mc->block_default_type = IF_VIRTIO;
     mc->no_cdrom = 1;
-    mc->auto_create_sdcard = true;
     mc->pci_allow_0_address = true;
     mc->possible_cpu_arch_ids = riscv_numa_possible_cpu_arch_ids;
     mc->cpu_index_to_instance_props = riscv_numa_cpu_index_to_props;
-- 
2.47.1

