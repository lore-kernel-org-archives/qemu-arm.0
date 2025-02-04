Received: by 2002:a05:7023:b15:b0:92:a90b:6588 with SMTP id qd21csp437025dlb;
        Tue, 4 Feb 2025 10:11:40 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWC4qvlz0+Z6rqx+dRW4S+mQ7j1pJjQvwErTlWbdLjh2TpD0q5ghe1GLPachbfuLgTmRkFdlSOmE0EvIQ==@linaro.org
X-Google-Smtp-Source: AGHT+IE0fUvsy+vkSnRVCjA7dJo4YkWCtKA+CPY678+sR+yLVffbZq3kpo7XVfMq4Q9BkFsPWLgb
X-Received: by 2002:a05:622a:5e0e:b0:46f:d928:2dc7 with SMTP id d75a77b69052e-46fd9283081mr255939711cf.12.1738692700503;
        Tue, 04 Feb 2025 10:11:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738692700; cv=none;
        d=google.com; s=arc-20240605;
        b=AWL1OyBQ++spIvURj6I7mid0UT/S1GkWrPApq6z2Km4lX+Bu2BCOadcWnwM9yOKnZJ
         BXXfLhxtVWTFFrWdZdRFSqYCmWE1INUje+9QETm1BFL4ThOKeuPPirf3iN35ARFVb16c
         2STwgOZlT9CyQJgTnwdWop32yoD4Z9h0S1V+B0cwO/0bg9mBWm8FmoNM9nSEciWwcxY2
         m6W918O2MbstM58vct00MbTcE28R/vVzk5EynKNOJyTso/ej9FOolp9MnGlLuHDAZcUX
         7VHUiYkavm9RPWsNLVZtTuxmmvwk4xTYhISfhnwu21A0YTwD1vJMSG5qwTWOEoQ3ZTDi
         752Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=bMSMAcw63WhCEzylD0QLkcsjYvnfbTQfvq7nklxvlvM=;
        fh=03eTL/CCmWiXPZpN5dUSjILiDWQMdlAkko+Y0SsMkSk=;
        b=hJD0U0bTQXXp09TS3VRxZN4oshyzO9A8fSnTixHm1FvhlnwZGJKgd6vWT6a5UZlxqh
         uIWEJsTDaZFF9t/RseBDcoHe5g3+5u2ARkEFJpiv6lW3+6LK8Gm2QllpQZW4e5WGhc66
         Gt2fW9lRJQk17cagCPgsVWVhYeyBY9xAyOxBql673H6IqdEeFdctrLq2mYNk7IBdWcBR
         pQ5d1UMVtUcNbMragkyHWS6cJZDZLDbPtE2Ckt3jwelBHP/KjtRC+WMTs3JYpOcvCoet
         fZiGrk0wEs1PmOaCJ8jebufOEZPrXO1uTIeUJUXiRczjqlOK3kcK/EM+RDkufh5XRijw
         Q1Qg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p0QNvU83;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47016b7eca9si30139891cf.290.2025.02.04.10.11.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Feb 2025 10:11:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p0QNvU83;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tfNN5-0006YQ-CA; Tue, 04 Feb 2025 13:10:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tfNLY-0004WF-6a
 for qemu-arm@nongnu.org; Tue, 04 Feb 2025 13:08:31 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tfNLV-0007EI-Si
 for qemu-arm@nongnu.org; Tue, 04 Feb 2025 13:08:27 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43624b2d453so69982265e9.2
 for <qemu-arm@nongnu.org>; Tue, 04 Feb 2025 10:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738692503; x=1739297303; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bMSMAcw63WhCEzylD0QLkcsjYvnfbTQfvq7nklxvlvM=;
 b=p0QNvU83H3p+tcrSSgTyNs8LWmSz7YGir1NpF76mAZEeiveNhrTGoepDUwtYNuHNMC
 Q/TIOWYYIn1EMjITv0mW6YvPzFaoukS0h4/Z4Bg2NOPnobRNZFSlo483wEegT6l1/ovJ
 jR+l5S7wm42k7Ym7Z/ex2bkRH9huWPeT0dIXJ0YJCv+lW3Mc23WhOYJVxwUlP/GjnXen
 b42Dh3kM0w64gzV1THOkKT6xil9cQSuLRCP5SxwallUfIebuqB6aFkGPb6uN8haDtVxS
 TfcY+gc3WEOL9Q5AUt1dwUeTmBsNNxbsHpQASRa6dgs8KpzeTWRnBzG7rMYUkBOxFTAo
 CUbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738692503; x=1739297303;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bMSMAcw63WhCEzylD0QLkcsjYvnfbTQfvq7nklxvlvM=;
 b=nEC9s9z5/w/dpocztgB7XBB2hNgFr6k6vzTrYV7O/hd2Ela2MVZ+qRiHMCaZAxutdo
 AL3MhvOMuYTZhC226X72dyL+cwrzbw9msHQKAQMynqnlvz4nAXlBRavAMofzyvdjMiUz
 hG1O75GH4J8neGh9i4mgFynK6fulGq591w54jqokGFcCS9Sokr/YrOZMz/YxAKHULIqt
 ScL9l94TSyVnjQu9AkGF22tAHvjBLtpS84QRaa4H08clg6D8CZv/K4YazrxEqdarO0H6
 nnqh6+8Pp2KtJ49nrxt9COs5Xd+3ZFloaJUjPSW5ikixM/7RmWK5X5m/PToxGFaN5hIf
 dChg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6srrBs5ZCfKI5XBmwBU1zeNZHjIgFgzZU6oYKVNBBmf8pWd297c9QU2VMu5l4VlvMuNKE2+Y/9w==@nongnu.org
X-Gm-Message-State: AOJu0YxjHjeuFdbc2svPMXyu6dRK2HeicIpR8CG6ckqZUtKE0mgr0LK7
 fChg9mMSSTL4ojbK2nu1x7EVPycAoimvvV42LmtBwhRt7qA5umFdVDzOavq5aSd2MhePOadDw5S
 csJQ=
X-Gm-Gg: ASbGncuxmJRRAGQxGZ5fQk+tPBCkrVjmQGj1FztkwqcTjAeGriPzUStXkFQjKnWzbb+
 Mc5Oudda1uMs8Idp7pHggQ7Nes7KScFhVDShhO1AO76sG5dF9QUx3JMPJuKRlpgbey8zdHyzs9V
 bR1pUpTkGtB8LQDh+cnuxMNnIry2fDp5nJzyFJ1A4xKVJIwZDcAJ/2O8PqlDgFQcXM2Tm6LAneU
 b9PCmIBPjuFAje7r3if6T1anq8KmQBrE0P1zPGG5SwNGrsSHNZhQg3MczbBfM/TVDfo/7fD4dsn
 znmVkgG17sp5K/v8rWZWKPEryEHjIxajaoG5hW7tA9QS1lF4UAfRBnr1oyVFHCGZsA==
X-Received: by 2002:a05:600c:3b94:b0:434:ff45:cbbe with SMTP id
 5b1f17b1804b1-438dc3cba35mr284144205e9.18.1738692503020; 
 Tue, 04 Feb 2025 10:08:23 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439069290c7sm23368375e9.0.2025.02.04.10.08.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 04 Feb 2025 10:08:22 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 7/8] hw/riscv: Remove all invalid uses of
 auto_create_sdcard=true
Date: Tue,  4 Feb 2025 19:07:45 +0100
Message-ID: <20250204180746.58357-8-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250204180746.58357-1-philmd@linaro.org>
References: <20250204180746.58357-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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
X-TUID: 5Uw7sSxHM1RJ

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

