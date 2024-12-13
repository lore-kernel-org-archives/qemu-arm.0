Received: by 2002:a17:505:57c2:b0:1be9:327d:8ee3 with SMTP id yd2csp442916njb;
        Fri, 13 Dec 2024 05:35:29 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUpoB/qS3JwwviaBdzpibmcI2IaOV4KWwv0bwMZc2NIZmzO3OID+cINzsFqKt4Y4zGODcmdKsXz/iledQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFoESiJ78Oj51n4kQlFGjZ4sAbygRDKvSOv9mPwGWJr0jaSdYWqubCT4+m/NC7YxMsp9nxb
X-Received: by 2002:a05:6214:19c7:b0:6d8:7a7d:1e6b with SMTP id 6a1803df08f44-6dc7e642413mr45096896d6.10.1734096929155;
        Fri, 13 Dec 2024 05:35:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734096929; cv=none;
        d=google.com; s=arc-20240605;
        b=XO85Ko3dEzXLWqS5pFW1vhuXRmaIAWTlg3rN91Pr6hRyzegrgJ5/InoDYM7SzwuAaF
         OGCDZZjfVaFsmF5HSplz/bTYQt18em4Ax4HDY/3/D/LXYNVVCBrt4yR/RH2zZa87x9LE
         tF4l+cekhODRUx4nFMs2YljJkcaq0kRC0vSHxkA3gwe+zFBmphsam1n4DD63YdXKPuqa
         I+hGs3psvvQGoeHT1VPgVOENczBo0b17LxdvlidqwoN99A4ji77UxkZdKmsWeoaEDKzN
         rzFf9B/1YDASg7ItLBbF/LrMDHtGzlOL4vNDAQxYe8MU/Nl4fbXZiSQLBkLbH0No/Gt4
         1v2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=hLaEA7eBzqJ7BvxdEYXe8LSu5E5jEsYMhIQgut2X7lQ=;
        fh=5/bEEfneXpYiCSLu1RRtIdWOVpk1SgQYYFlk2zFRZHo=;
        b=ZAN6b9A9BSJpk4EatcdTpiHb1jKeU/iZMEjGZ8aSrYhnxhEx3kKcdUbBNiNIENEhgA
         33IMHpWG9BSe3pUb/5o5LzuhJ0MJwqY3HnF081cTVm9qk2PFaFUXPLBh6uI6vGqndrCk
         C+WBSN2UNtLThURD3GH4BUQ0HrtoH8eVbufLW7ndGx+k7na7Cp5lkr7jVaEojOhWdqn0
         4WvpWxtQvmDKF1RhQroXKijvGncUFBZa2JpXRrrEftHgcprjO87H6xusx1t9r0T+5bOz
         qWaaw+wWQTefRBiOcMDclPZZIR8skSRIFY+MRE/EonPSheK59Aqee52jW3FWir71FJ8y
         MR1g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MHN9wF8A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d912ec80f0si131692226d6.547.2024.12.13.05.35.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Dec 2024 05:35:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MHN9wF8A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tM5os-0005Qv-5o; Fri, 13 Dec 2024 08:35:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tM5oT-0005MY-UG
 for qemu-arm@nongnu.org; Fri, 13 Dec 2024 08:34:38 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tM5oG-00018D-Jz
 for qemu-arm@nongnu.org; Fri, 13 Dec 2024 08:34:25 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-435004228c0so21170255e9.0
 for <qemu-arm@nongnu.org>; Fri, 13 Dec 2024 05:34:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734096863; x=1734701663; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hLaEA7eBzqJ7BvxdEYXe8LSu5E5jEsYMhIQgut2X7lQ=;
 b=MHN9wF8AE42JLqa6DAC8bZOiIArK+rDphhCIigShCqRbYOUKoYVAj4CWCdY6ZnwfeE
 MX3NMo2cDfJRDSmHI+byArIHivKOwrIsvqPz3is0dDknGQ8EGMe6pyX642KMbMakPDFg
 KrmHTtEzbhVTux14YYw8YfiD3U9OtW1C1uVk6g296n/MLxAw9QLsfUL0KmK52aEJHJlP
 mzIiuPE8MKKy08R1ByZiOJNts53AbgS2NUAJvu99UzNIC24Y70OITP0eCIVEK/jMXZFQ
 +/KEhg/fMbCYXXYyuepu6/51mbqR4EdXwSySyzUSdCbVIB/Cl2xKkZJDkaozZRd5/zfU
 8pfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734096863; x=1734701663;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hLaEA7eBzqJ7BvxdEYXe8LSu5E5jEsYMhIQgut2X7lQ=;
 b=Jh1mKbxtzG7oO320T+4et9bBgGa0JAYHp5OqY2oskQNDvVnHy+7xHCjcWdlby+c9oU
 nOyYvMcdDnUS/aZeF7YCUOSIZzDRAnxaElcHJv7q2cPyt0sHexwaRseauiRgzy8EkrnE
 XZGIATsa4wgmsL9My4/MA6VE7a7rYP/bfa000ZALDzczkinm8ytMkypWwKRVyv1Wbsd7
 t0riIt9kt+UAB7Hz624Q4ZaAnCV3S0PsD7idqKlaELxMbDbsERM8TecC9T3fw3I2njJS
 C4bfldfcpHZOGu1xW+WLG45SIXZCRd55g/G7ah0PlkjSwFOqCcvg/1rL4TC88y5C8Puf
 s+Gg==
X-Gm-Message-State: AOJu0YxTZW9jzzR0HvB3iPa2rVSc4I2JDWb84TX6hiQNT7cqMT+Qtp/F
 uE7ZlnJMfKpYqFshv8KHJ3TQER0NtPHkz6MxtKuPX7uy3gVosmCG1AhU083a2ZGFkEpSQPQZf2u
 1
X-Gm-Gg: ASbGnctyGkJ9Gp6dRJpMIo/7Wu1I+VS7GhPhENN6Tx8mm23tf0s8rgPzjSkNjh8pnRz
 1Rouhx6AN8IN+kRxSjMBOBT+hBDIsRb6bIisl5+MnGyQtt1mPM6OU9Xk2cht8K2o4Wv/Awj3EAH
 cfqcD8kNV9AzStzgjos8M02YxJs9hrm/9q9l7bjkEMK9ot3aXXN4U1UCecMjV4bJ0d7KGSBxYXO
 JrYTAoxIv7L4QiP6qZ7PDa1ZXKcor6O69l454JdTlNpzar0MYGStjCnJIxYbQbQJNIOMSRdOvYQ
 e6HYYvA6V2fgXJRbTwBESBdtJDhr55pe0YTD
X-Received: by 2002:a05:600c:83cf:b0:436:1ac2:1acf with SMTP id
 5b1f17b1804b1-4362aa9901cmr21719385e9.20.1734096863269; 
 Fri, 13 Dec 2024 05:34:23 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43625706caesm49386565e9.32.2024.12.13.05.34.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Dec 2024 05:34:22 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 6/7] hw: Use pci_bus_add_fw_cfg_extra_pci_roots()
Date: Fri, 13 Dec 2024 14:33:51 +0100
Message-ID: <20241213133352.10915-7-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241213133352.10915-1-philmd@linaro.org>
References: <20241213133352.10915-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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
X-TUID: 6eMM/JoMLMG8

We want to remove fw_cfg_add_extra_pci_roots() which introduced
PCI bus knowledge within the generic hw/nvram/fw_cfg.c file.
Replace the calls by the pci_bus_add_fw_cfg_extra_pci_roots()
which is a 1:1 equivalent, but using correct API.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hw/arm/virt.c     | 3 ++-
 hw/hppa/machine.c | 2 +-
 hw/i386/pc.c      | 3 ++-
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 3bd9dd0f863..333eaf67ea3 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1750,7 +1750,8 @@ void virt_machine_done(Notifier *notifier, void *data)
         exit(1);
     }
 
-    fw_cfg_add_extra_pci_roots(vms->bus, vms->fw_cfg);
+    pci_bus_add_fw_cfg_extra_pci_roots(vms->fw_cfg, vms->bus,
+                                       &error_abort);
 
     virt_acpi_setup(vms);
     virt_build_smbios(vms);
diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
index a31dc32a9f7..4e673353225 100644
--- a/hw/hppa/machine.c
+++ b/hw/hppa/machine.c
@@ -240,7 +240,7 @@ static FWCfgState *create_fw_cfg(MachineState *ms, PCIBus *pci_bus,
                     g_memdup2(qemu_version, sizeof(qemu_version)),
                     sizeof(qemu_version));
 
-    fw_cfg_add_extra_pci_roots(pci_bus, fw_cfg);
+    pci_bus_add_fw_cfg_extra_pci_roots(fw_cfg, pci_bus, &error_abort);
 
     return fw_cfg;
 }
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 99b9b105e26..92047ce8c9d 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -631,7 +631,8 @@ void pc_machine_done(Notifier *notifier, void *data)
     /* set the number of CPUs */
     x86_rtc_set_cpus_count(x86ms->rtc, x86ms->boot_cpus);
 
-    fw_cfg_add_extra_pci_roots(pcms->pcibus, x86ms->fw_cfg);
+    pci_bus_add_fw_cfg_extra_pci_roots(x86ms->fw_cfg, pcms->pcibus,
+                                       &error_abort);
 
     acpi_setup();
     if (x86ms->fw_cfg) {
-- 
2.45.2

