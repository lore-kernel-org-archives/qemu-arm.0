Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp8949913lfc;
        Fri, 19 Feb 2021 03:47:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwOdns2tV+NuUclHVOlgdSft30+MwQVjDxoswOtR+/K22g8nLlVLmGsX8oTjv1PdwAwL7VC
X-Received: by 2002:a25:dc8:: with SMTP id 191mr14545989ybn.246.1613735232480;
        Fri, 19 Feb 2021 03:47:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613735232; cv=none;
        d=google.com; s=arc-20160816;
        b=C6hg7v0twb2MKrjowVP/czwQ2YGmEUq/qYBCK13vbAZi/lzX+F6kej3SENRS1uYZLE
         mzoLeiU/NKMxsytLs0Q1+zpjLa4t/AXDl8DXDOK2sm1f1dd+xl1Pcmjgg/BjOeJBiYyf
         UZb4MM4Y7sr/g97r0ofjqyeUxtLMFckbW7js2pJPLqFxA+CnaDHi3SKvxIziBSJPJQFq
         4g8vB/OdqKVxtrlEXPp+rB7idi7ICSBSzF3tqkaldYX1lcnnp/1Cip9K4xI+2fVcf8Ty
         60VmlTzp28Hec6ZO+7XyIW8rel8ceqV8k9MHaJZzNvnk7DDZSxAfDMSxlexDmRiuKuhs
         A5qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=0R9Vee28fdo2aFv1gdPK3UOKRB7Gj2iTxIGnYkVmUYc=;
        b=I73jeC4y6pkElYkE0JpGBZOkT2ZfO0/FdlBiPUNtoXt1OH6r5+LognoIxNwDuqYIFi
         irk4ivCe5EDqtaCDG5JPs5tO4N2JKkuIbrObvkVcMM+/M4JZdTZxlXyKyomBBxyx5rn/
         9xLsmBkEFWwxNbtbPIGa0l4stZhPFPiKalsFIUTyxZjvmBBPSbyT7n1swXMqZO62jK9c
         biD3P7c0nEGJeRx77gp62/16upevkwihoRinlVPGStMeGtKWMMndBySp05sje7/dbhK3
         s/sh3J9ywvOnUEWkGBW/1hIjZjX4azg7L6GHFMUS61kO1pg1PgCQ4zWS4+7Q3Wk6LOX7
         rFbA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=AoHQ4PLZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d12si7525879ybn.481.2021.02.19.03.47.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Feb 2021 03:47:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=AoHQ4PLZ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lD4Fb-0004T8-Qa
	for alex.bennee@linaro.org; Fri, 19 Feb 2021 06:47:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lD4De-0002zI-Ci
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 06:45:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lD4DY-00026o-M3
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 06:45:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613735103;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0R9Vee28fdo2aFv1gdPK3UOKRB7Gj2iTxIGnYkVmUYc=;
 b=AoHQ4PLZ/EHe2CB1OGVS4D2mjAn63KhwL9ecpe14qFsh5+0PiDMD2Ivn+8qQ6yJrHYEZdr
 ROswG1h9QiWaLS79EgVwyFBJtae2m/2wMsfZwQu0HbHeVPRy83M6qvdJVpsZbo4d22AMDo
 K/72uBtGX4mZei37yK30yyEINvfZ81E=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-474-bN3sYciLNp6yQJHI9R5Ctg-1; Fri, 19 Feb 2021 06:45:02 -0500
X-MC-Unique: bN3sYciLNp6yQJHI9R5Ctg-1
Received: by mail-wr1-f71.google.com with SMTP id s18so2365349wrf.0
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 03:45:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0R9Vee28fdo2aFv1gdPK3UOKRB7Gj2iTxIGnYkVmUYc=;
 b=arMJu5LXxZXORY/nsJ5MUVGI6edhxrodEhhNS2xp8Ckw4mwCEeJr5u8eLPw8iOW71G
 srKZ8HmpW0OS9RUvdGtSr048NpT+1kCCiBjU042bAX31bCxVCM8/qvxUivdII39172Yq
 zIYvggWPxAoT/ygBZq/DIRrwNZ0r8EFrzGdOCLYi8V8bqcRpw4BQ183a6fgIn8lqw3yA
 Jw4c8+u3xQGhIfPpQQxpLXZREGIBBNq7x42U2urk+/DEtRsmpKigjnD2A8D4A2Rb0qSv
 XCB+jWdgMEKblTmjJIE1m1YpR5hfI0ylcv4o+zGwzcPa33VDbGZZvgHr72Uqv0GRVSzh
 Gk3A==
X-Gm-Message-State: AOAM5320q/KFaoM3zFbKmWtzycKTlOrqXoLiT8rhwzIk562mZJ6ak5dS
 1IkEXTpB4tGuILyw/rGFK/7h504jXPVuamVCUR78SllXWvl6Lz1ipnlHeX8swz0cdf9tV1vbIO0
 UdZkeRtkVy2HLL7xrjnw7BsXBpPUgpBSm7ElVjVvgllJgkPHG6m8tjmYRoz7kELRH
X-Received: by 2002:a7b:c348:: with SMTP id l8mr7731719wmj.72.1613735100889;
 Fri, 19 Feb 2021 03:45:00 -0800 (PST)
X-Received: by 2002:a7b:c348:: with SMTP id l8mr7731669wmj.72.1613735100571;
 Fri, 19 Feb 2021 03:45:00 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id o13sm15918266wrs.45.2021.02.19.03.44.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 03:45:00 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 5/7] hw/ppc: Set kvm_supported for KVM-compatible machines
Date: Fri, 19 Feb 2021 12:44:26 +0100
Message-Id: <20210219114428.1936109-6-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210219114428.1936109-1-philmd@redhat.com>
References: <20210219114428.1936109-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>, kvm@vger.kernel.org,
 David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Thomas Huth <thuth@redhat.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Huacai Chen <chenhuacai@kernel.org>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Leif Lindholm <leif@nuviainc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>, Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VvESiI5IWwGz

The following PowerPC machines support KVM:
- 40p
- bamboo
- g3beige
- mac99
- mpc8544ds
- ppce500
- pseries
- sam460ex
- virtex-ml507

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
RFC: I'm surprise by this list, but this is the result of
     auditing calls to kvm_enabled() checks.
---
 hw/ppc/e500plat.c      | 1 +
 hw/ppc/mac_newworld.c  | 1 +
 hw/ppc/mac_oldworld.c  | 1 +
 hw/ppc/mpc8544ds.c     | 1 +
 hw/ppc/ppc440_bamboo.c | 1 +
 hw/ppc/prep.c          | 1 +
 hw/ppc/sam460ex.c      | 1 +
 hw/ppc/spapr.c         | 1 +
 8 files changed, 8 insertions(+)

diff --git a/hw/ppc/e500plat.c b/hw/ppc/e500plat.c
index bddd5e7c48f..bf95b68bc03 100644
--- a/hw/ppc/e500plat.c
+++ b/hw/ppc/e500plat.c
@@ -98,6 +98,7 @@ static void e500plat_machine_class_init(ObjectClass *oc, void *data)
     mc->max_cpus = 32;
     mc->default_cpu_type = POWERPC_CPU_TYPE_NAME("e500v2_v30");
     mc->default_ram_id = "mpc8544ds.ram";
+    mc->kvm_supported = true;
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_ETSEC_COMMON);
  }
 
diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
index e991db4addb..573502f7b5b 100644
--- a/hw/ppc/mac_newworld.c
+++ b/hw/ppc/mac_newworld.c
@@ -595,6 +595,7 @@ static void core99_machine_class_init(ObjectClass *oc, void *data)
     mc->max_cpus = MAX_CPUS;
     mc->default_boot_order = "cd";
     mc->default_display = "std";
+    mc->kvm_supported = true;
     mc->kvm_type = core99_kvm_type;
 #ifdef TARGET_PPC64
     mc->default_cpu_type = POWERPC_CPU_TYPE_NAME("970fx_v3.1");
diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
index 44ee99be886..4b34106919d 100644
--- a/hw/ppc/mac_oldworld.c
+++ b/hw/ppc/mac_oldworld.c
@@ -444,6 +444,7 @@ static void heathrow_class_init(ObjectClass *oc, void *data)
 #endif
     /* TOFIX "cad" when Mac floppy is implemented */
     mc->default_boot_order = "cd";
+    mc->kvm_supported = true;
     mc->kvm_type = heathrow_kvm_type;
     mc->default_cpu_type = POWERPC_CPU_TYPE_NAME("750_v3.1");
     mc->default_display = "std";
diff --git a/hw/ppc/mpc8544ds.c b/hw/ppc/mpc8544ds.c
index 81177505f02..4b750ca0555 100644
--- a/hw/ppc/mpc8544ds.c
+++ b/hw/ppc/mpc8544ds.c
@@ -56,6 +56,7 @@ static void e500plat_machine_class_init(ObjectClass *oc, void *data)
     mc->max_cpus = 15;
     mc->default_cpu_type = POWERPC_CPU_TYPE_NAME("e500v2_v30");
     mc->default_ram_id = "mpc8544ds.ram";
+    mc->kvm_supported = true;
 }
 
 #define TYPE_MPC8544DS_MACHINE  MACHINE_TYPE_NAME("mpc8544ds")
diff --git a/hw/ppc/ppc440_bamboo.c b/hw/ppc/ppc440_bamboo.c
index b156bcb9990..f3258a1f229 100644
--- a/hw/ppc/ppc440_bamboo.c
+++ b/hw/ppc/ppc440_bamboo.c
@@ -304,6 +304,7 @@ static void bamboo_machine_init(MachineClass *mc)
     mc->init = bamboo_init;
     mc->default_cpu_type = POWERPC_CPU_TYPE_NAME("440epb");
     mc->default_ram_id = "ppc4xx.sdram";
+    mc->kvm_supported = true;
 }
 
 DEFINE_MACHINE("bamboo", bamboo_machine_init)
diff --git a/hw/ppc/prep.c b/hw/ppc/prep.c
index 7e72f6e4a9b..96b6f68d663 100644
--- a/hw/ppc/prep.c
+++ b/hw/ppc/prep.c
@@ -441,6 +441,7 @@ static void ibm_40p_machine_init(MachineClass *mc)
     mc->default_boot_order = "c";
     mc->default_cpu_type = POWERPC_CPU_TYPE_NAME("604");
     mc->default_display = "std";
+    mc->kvm_supported = true;
 }
 
 DEFINE_MACHINE("40p", ibm_40p_machine_init)
diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
index e459b43065b..43cccad1591 100644
--- a/hw/ppc/sam460ex.c
+++ b/hw/ppc/sam460ex.c
@@ -513,6 +513,7 @@ static void sam460ex_machine_init(MachineClass *mc)
     mc->default_cpu_type = POWERPC_CPU_TYPE_NAME("460exb");
     mc->default_ram_size = 512 * MiB;
     mc->default_ram_id = "ppc4xx.sdram";
+    mc->kvm_supported = true;
 }
 
 DEFINE_MACHINE("sam460ex", sam460ex_machine_init)
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 85fe65f8947..3f83c2ce2ca 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -4426,6 +4426,7 @@ static void spapr_machine_class_init(ObjectClass *oc, void *data)
     mc->default_ram_size = 512 * MiB;
     mc->default_ram_id = "ppc_spapr.ram";
     mc->default_display = "std";
+    mc->kvm_supported = true;
     mc->kvm_type = spapr_kvm_type;
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_SPAPR_PCI_HOST_BRIDGE);
     mc->pci_allow_0_address = true;
-- 
2.26.2

