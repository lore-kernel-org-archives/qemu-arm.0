Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2544290ejf;
        Tue, 27 Feb 2024 00:44:11 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXu7PGxRHhwdxF+vizqj6gaTLokVLCo5DzzULs7hbygdwVuth2JEZUlWxbbCo/NOgfuYt/whtLXmb909HVc+LtT5Vqao6U6
X-Google-Smtp-Source: AGHT+IHWGanmvcF8l15OAp9YbBlOEHrGgvIZrL3ESIvpDhxP1WFd0hNzTDv2Ap0ynQjLzZYz8RKi
X-Received: by 2002:ac8:5f0c:0:b0:42e:7cdc:d787 with SMTP id x12-20020ac85f0c000000b0042e7cdcd787mr9621046qta.3.1709023450831;
        Tue, 27 Feb 2024 00:44:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709023450; cv=none;
        d=google.com; s=arc-20160816;
        b=k1i1/HBnYxC8OFlC18JoY2Dfp/u6WV5f9SIpOeZ57CKm3uIMy64onNXu3tQXrkf8dZ
         eoYInoJ1qTcet3b3UaM+kgfeTeCRiLgUSUgx263tJIyfJrSSOvqMryQDHpUkXt9Rasx6
         LPiEk7La8OC2pft+bXdvef9MuW72jgjkMdwQ7H4ER+YfgeeUS3D3i7Za6ejNt7BBAW5C
         3INTaTJqaZ9HcNKnphxlHUXIOy2c5ayWwmYar1uHhl8X84V4yrO7h9Dt3H/bpEHttRV3
         2/hruEozrZi41t0/EgKeDPRaSUDE6Y09j7lWVxz2z1fJeFZw1PdhY9fPZPbbDZLacrcU
         RyRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=8FdaM9hjFygoV+600zSMTUb6h8PNn83HRuFk/DcEkWM=;
        fh=vj94J8qh3CGrhi7wBRVD1bvyiAakbskuwh+4EElFC0o=;
        b=qzCQmE8YQPaMX+fhvQdDi7Y1BNADnLoZ8d1zLWZdF6Hfyq2weNCDeagZ6AEPvGCSLw
         hZjQNsmZvy40rEHWV9Vam7CDqJnwZByVPxZ7c/12ZFIk1/GZ7FD/vwzABZLSxE/aHFNx
         9mn5PAKzSkBHadOVIscS3rASPN41NEbsj3RNpyTEN3y05EUAgu2eiqv6GN1Y0hcxqzTk
         Ih0kKNpYaFdTEv8fQHxlLUm90diDhFgXGWVUKb+H+H+iM3kUa82cf8eIlC+mDpGGkV8D
         vlAtSoOLkkXJid9MaFkkoGETLBB7emJgErHAZMJWq8nntrYQG4nKedJU59/XANDuPpff
         K5aQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wiGf60xI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h9-20020ac87d49000000b0042dc7d56c01si7744128qtb.60.2024.02.27.00.44.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Feb 2024 00:44:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wiGf60xI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ret2y-0004s5-Dq; Tue, 27 Feb 2024 03:42:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ret2w-0004g7-Hn
 for qemu-arm@nongnu.org; Tue, 27 Feb 2024 03:42:42 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ret2s-0008QK-BD
 for qemu-arm@nongnu.org; Tue, 27 Feb 2024 03:42:42 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40fd72f7125so31964595e9.1
 for <qemu-arm@nongnu.org>; Tue, 27 Feb 2024 00:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709023355; x=1709628155; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8FdaM9hjFygoV+600zSMTUb6h8PNn83HRuFk/DcEkWM=;
 b=wiGf60xIDbVToLcQFzBWI7nENk8qMq/gTW+K85iPXD9u84dFociocAIL8/7fO2CLiV
 bshQ+P00e7wSXudAuA2zoyiZM2dlDK1bSNDpS7KPiN79qmfqKAjWHcXYCLx7t7w6XWOv
 0AdJPUd+F2ts7Vz6x1TEn/thnO1xeVW/yUkfkI3KRHz8KaFqmudA0gJ34wFba0XF2bSW
 C0JRDS2qG7VXDan7/FzNUaJF7RjcFc4dj1af4PrBqEX8q1UTPjv3MtyMCqbpiySGR0Qp
 n5ZjtpPDi03tYciZEFnB79sR1LnXAIpmtZgMXUOjaA5vz4rxQTwyTRYK5NxejN2WkqLU
 XgFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709023355; x=1709628155;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8FdaM9hjFygoV+600zSMTUb6h8PNn83HRuFk/DcEkWM=;
 b=fqGNE49E9bFgwbLd3T1lGXLni7D9FMGi+4YqT+2RqxVNtGJSd2kYTtuouD+OqVuAag
 X//pIstqcAZMnTTHRQnxLy0EFMxT/sHCRlHGy5kBkm+omzc9k6iU87X/sTno595FrpGD
 wdi56G91x1TMwUu09cBfLkvl34qgKnisvFsXNqOK1AGQxmRE6naNd2MQCLuB6qVkTYgI
 No4OQEQut8nXzGBlnJ9ihnsyjWy1e+13k71bQGapV2TmDhXxpUFU2XoLtqxZZPJcCz+x
 nI8EoXiAHXjeBd8uSC9HfJpYQlZcmhpADJLt07hlfWiPWJ/XEvEVSC+WhSmt4Kw5tHA7
 0/8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcVrj7aZ7rconLtchBOv38Hi0SzZaW0XeNMkfLj93T4wFcjL25M9hAK5jfqBPmNCCz3NTGfMJYpdMSXcfC9cQWIPGy
X-Gm-Message-State: AOJu0Yy4X7Hov0yKJuY0kJGCFndBhIdhqsxjpXFwevq7BAzB14ZWwHck
 bsTdaNpJNj94hAnPp0ih/ghed/So8fLMBmt0w/XGdNmdHOXJrhdIqNhxnk6xrKY=
X-Received: by 2002:a5d:4109:0:b0:33d:701f:d179 with SMTP id
 l9-20020a5d4109000000b0033d701fd179mr5574325wrp.19.1709023355631; 
 Tue, 27 Feb 2024 00:42:35 -0800 (PST)
Received: from m1x-phil.lan (mic92-h03-176-184-33-214.dsl.sta.abo.bbox.fr.
 [176.184.33.214]) by smtp.gmail.com with ESMTPSA id
 bq8-20020a5d5a08000000b0033b684d6d5csm10815918wrb.20.2024.02.27.00.42.33
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 27 Feb 2024 00:42:35 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-block@nongnu.org, qemu-arm@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Zhao Liu <zhao1.liu@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 26/30] hw/i386/pc: Remove unneeded class attribute
 "kvmclock_enabled"
Date: Tue, 27 Feb 2024 09:39:42 +0100
Message-ID: <20240227083948.5427-27-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240227083948.5427-1-philmd@linaro.org>
References: <20240227083948.5427-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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
X-TUID: DfN6VKC2r3dk

From: Bernhard Beschow <shentey@gmail.com>

PCMachineClass introduces the attribute into the class hierarchy and sets it to
true. There is no sub class overriding the attribute. Commit 30d2a17b46e9
"hw/i386: Remove the deprecated machines 0.12 up to 0.15" removed the last
overrides of this attribute. The attribute is now unneeded and can be removed.

Fixes: 30d2a17b46e9 "hw/i386: Remove the deprecated machines 0.12 up to 0.15"
Cc: Thomas Huth <thuth@redhat.com>
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
Message-ID: <20240224135851.100361-5-shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/i386/pc.h | 1 -
 hw/i386/pc.c         | 1 -
 hw/i386/pc_piix.c    | 2 +-
 3 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 27834043c3..4bb1899602 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -92,7 +92,6 @@ struct PCMachineClass {
 
     /* Device configuration: */
     bool pci_enabled;
-    bool kvmclock_enabled;
     const char *default_south_bridge;
 
     /* Compat options: */
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 353edeb2ea..a80f809b83 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1799,7 +1799,6 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
     pcmc->smbios_uuid_encoded = true;
     pcmc->gigabyte_align = true;
     pcmc->has_reserved_memory = true;
-    pcmc->kvmclock_enabled = true;
     pcmc->enforce_aligned_dimm = true;
     pcmc->enforce_amd_1tb_hole = true;
     /* BIOS ACPI tables: 128K. Other BIOS datastructures: less than 4K reported
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 814d24326d..49d5d48db9 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -184,7 +184,7 @@ static void pc_init1(MachineState *machine,
     pc_machine_init_sgx_epc(pcms);
     x86_cpus_init(x86ms, pcmc->default_cpu_version);
 
-    if (kvm_enabled() && pcmc->kvmclock_enabled) {
+    if (kvm_enabled()) {
         kvmclock_create(pcmc->kvmclock_create_always);
     }
 
-- 
2.41.0

