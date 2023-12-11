Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp363350ejo;
        Mon, 11 Dec 2023 09:32:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG0PWGBH0FIxvQLbOWnlLlZGW4HEF9CKdcbbNjrydtrvnzM3qTjxpHarUmJxOQ53HjsEgBN
X-Received: by 2002:a05:6122:12d4:b0:4b2:c573:ed57 with SMTP id d20-20020a05612212d400b004b2c573ed57mr3748786vkp.9.1702315923867;
        Mon, 11 Dec 2023 09:32:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702315923; cv=none;
        d=google.com; s=arc-20160816;
        b=K+uWK6C8rrWhWgtKPkVHBbfzd5aWs+A66xZJC2VIJ7uE+Qyyq7BZaP/ajmyjB6HNzp
         PJH+uv4rNe46zRgsKQXzeMyOMDvNRWAX+VyRN9FC35u2v3S25v/xmOs3pK5iOho2iPHy
         MBqei9zBfjBw7TDHOkekFizVpxCYzbVQqRtiEs7DuVPdFzS2VU+pZ/7LRjk0Vz1xOWuu
         q/TC6GhfK3GjR4XLKtaHiVF0r/LbeVCIEtbNratdHzybLjbcq3NiJAzjbYu+DpqI9zGM
         dA4dZqoeUUVPWJG3vqg9rjCNlPjX4EKAxhuJFzvQI7rcEUKpWhOZomrYueXHgi+6Hwyj
         xQQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=czz3Zfvoxdae3NXNp3p/OgH+zhwbT8/Zm49O7RMD/rA=;
        fh=jnbnc+JA8os8BNrWArfY9mDntgDud8nPmN5Do23zP6g=;
        b=CFxjAUUSmTBUi0aoZJn0eLAs8VSF3CWBvKOfxeZ/x1NdWyoBlAZvPZOVrw7o+ao9rM
         ExMviNbyqK0SfMzucpeYnCyrEJoyiz45NCxKcgaQE+4RGBqLsFMyfdZ5hscSjC9Aw9JZ
         nnxVbo6uA3HIIM+gVkMDKSyTrE1G8PJ/GMhejqV8qjEWX4M0Dlor3M4O0uNmSmZUj5wc
         LfGBlH42tdvXahCO5K/V3QFw9852VxZ1jzaIB2etNtKJcjCW8VpfzZYbjsdeqZtCPZgC
         h8/0GBRk6TBXwyH7RcZHMk/KLKIfy68a8GtF6D2uB30jy0p0JTzj9rwIgYIZOJGkurjE
         jLsw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="qm/u8byV";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a2-20020ab07a42000000b007c5f03b28absi1497089uat.215.2023.12.11.09.32.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Dec 2023 09:32:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b="qm/u8byV";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rCk6t-0000dk-Hk; Mon, 11 Dec 2023 12:30:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3Hkd3ZQwKCLsobcjiftufgbohpphmf.dpnrfnv-bsnopohov.psh@flex--nabihestefan.bounces.google.com>)
 id 1rCk6p-0000bw-Ji
 for qemu-arm@nongnu.org; Mon, 11 Dec 2023 12:30:24 -0500
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3Hkd3ZQwKCLsobcjiftufgbohpphmf.dpnrfnv-bsnopohov.psh@flex--nabihestefan.bounces.google.com>)
 id 1rCk6j-0004kO-Ic
 for qemu-arm@nongnu.org; Mon, 11 Dec 2023 12:30:23 -0500
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-5e175c8b326so5203547b3.2
 for <qemu-arm@nongnu.org>; Mon, 11 Dec 2023 09:30:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1702315807; x=1702920607; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=czz3Zfvoxdae3NXNp3p/OgH+zhwbT8/Zm49O7RMD/rA=;
 b=qm/u8byVWgv419YbW5MgZToNmO0JL2ImAus7P5F0KC8JCCn++ZvIFTmQtz9nwxSHfW
 5AaNIw+iowLFAJE02srD+48f0cVqdpidbc3FVzhehdkvVhbcvfoMXeFJmTKQVLnxVVZ1
 /CiX5ex3u3xYmJ8uocMCY3WlfrHcEJu7fmH7NmSwpBR1i58YJHFcKz8fJybmhkwMEu1a
 Y8iugP0oQgAJN2A1H65x4z5whHgFM68DadCxeSHNzesheOY54MvTFccTWhrSH5pi/meB
 kbHj9Woz/zB8cgpsVslgrHdIUITYZmRUw4PwGCtQgL5iN66g9Q6WJU2vbok7cIGaD0+y
 WC4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702315807; x=1702920607;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=czz3Zfvoxdae3NXNp3p/OgH+zhwbT8/Zm49O7RMD/rA=;
 b=XcmLZ6v/3R2wPFgfSVv1e7EKZ95ZPUXCIKcndVQDx2QQ3yWsTVFr6vxJvETeW++a+P
 leAF9AkkDLmfmeTDH83RJ1WeH9mv9DPvwgWet/wFl9Le+6kHtPFLjFWbfgr+KwzCsfm/
 FuHJT8vY9wRnJRqa7xxJBbXsURdmdEXqIdA0x71vgmuoxAp+Cq+zXc+gzx17RBpzrzgW
 LdCyTIk8hSwois8cgSC03n2QVA+rV6+EQrmuvJEMJ1IfQ3ZpNWNdVf7kSVCnHGOdL/ZC
 DEglZt/FiIM8nZXZ3kH41lqTL/FTgxigpuyHD/e6RuibYNAsOS03MR1b2srvoBQ3Pbkb
 EF4A==
X-Gm-Message-State: AOJu0Yx7gnmwj/9oWwoLufLrx0HTj2dQH52VAWKRbkr6R4u+4aRTFMMa
 xdWaRJTKp15Zn1wElIbs5/g0gwSNXH8uD70MkAA=
X-Received: from nabihestefan.c.googlers.com
 ([fda3:e722:ac3:cc00:20:ed76:c0a8:2737])
 (user=nabihestefan job=sendgmr) by 2002:a05:690c:891:b0:5de:7c16:1f18 with
 SMTP id cd17-20020a05690c089100b005de7c161f18mr48277ywb.0.1702315806726; Mon,
 11 Dec 2023 09:30:06 -0800 (PST)
Date: Mon, 11 Dec 2023 17:29:43 +0000
In-Reply-To: <20231211172953.3164357-1-nabihestefan@google.com>
Mime-Version: 1.0
References: <20231211172953.3164357-1-nabihestefan@google.com>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
Message-ID: <20231211172953.3164357-3-nabihestefan@google.com>
Subject: [PATCH v6 02/11] hw/arm: Add PCI mailbox module to Nuvoton SoC
From: Nabih Estefan <nabihestefan@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 wuhaotsh@google.com, jasonwang@redhat.com, avi.fishman@nuvoton.com, 
 nabihestefan@google.com, kwliu@nuvoton.com, tomer.maimon@nuvoton.com, 
 Hila.Miranda-Kuzi@nuvoton.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1149;
 envelope-from=3Hkd3ZQwKCLsobcjiftufgbohpphmf.dpnrfnv-bsnopohov.psh@flex--nabihestefan.bounces.google.com;
 helo=mail-yw1-x1149.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: 1Of1o5QmgWOh

From: Hao Wu <wuhaotsh@google.com>

This patch wires the PCI mailbox module to Nuvoton SoC.

Change-Id: I9421ff6bc7d365b0559c0a1f6b98cfd24b6f2d9f
Signed-off-by: Hao Wu <wuhaotsh@google.com>
Signed-off-by: Nabih Estefan <nabihestefan@google.com>
Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
---
 docs/system/arm/nuvoton.rst | 2 ++
 hw/arm/npcm7xx.c            | 3 ++-
 include/hw/arm/npcm7xx.h    | 1 +
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/docs/system/arm/nuvoton.rst b/docs/system/arm/nuvoton.rst
index 0424cae4b0..e611099545 100644
--- a/docs/system/arm/nuvoton.rst
+++ b/docs/system/arm/nuvoton.rst
@@ -50,6 +50,8 @@ Supported devices
  * Ethernet controller (EMC)
  * Tachometer
  * Peripheral SPI controller (PSPI)
+ * BIOS POST code FIFO
+ * PCI Mailbox
 
 Missing devices
 ---------------
diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c
index c69e936669..c9e87162cb 100644
--- a/hw/arm/npcm7xx.c
+++ b/hw/arm/npcm7xx.c
@@ -86,7 +86,6 @@ enum NPCM7xxInterrupt {
     NPCM7XX_UART1_IRQ,
     NPCM7XX_UART2_IRQ,
     NPCM7XX_UART3_IRQ,
-    NPCM7XX_PECI_IRQ            = 6,
     NPCM7XX_PCI_MBOX_IRQ        = 8,
     NPCM7XX_KCS_HIB_IRQ         = 9,
     NPCM7XX_GMAC1_IRQ           = 14,
@@ -463,6 +462,8 @@ static void npcm7xx_init(Object *obj)
         object_initialize_child(obj, "pspi[*]", &s->pspi[i], TYPE_NPCM_PSPI);
     }
 
+    object_initialize_child(obj, "pci-mbox", &s->pci_mbox,
+                            TYPE_NPCM7XX_PCI_MBOX);
     object_initialize_child(obj, "mmc", &s->mmc, TYPE_NPCM7XX_SDHCI);
 }
 
diff --git a/include/hw/arm/npcm7xx.h b/include/hw/arm/npcm7xx.h
index 273090ac60..cec3792a2e 100644
--- a/include/hw/arm/npcm7xx.h
+++ b/include/hw/arm/npcm7xx.h
@@ -105,6 +105,7 @@ struct NPCM7xxState {
     OHCISysBusState     ohci;
     NPCM7xxFIUState     fiu[2];
     NPCM7xxEMCState     emc[2];
+    NPCM7xxPCIMBoxState pci_mbox;
     NPCM7xxSDHCIState   mmc;
     NPCMPSPIState       pspi[2];
 };
-- 
2.43.0.472.g3155946c3a-goog

