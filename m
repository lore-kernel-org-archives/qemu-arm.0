Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2453494ejc;
        Mon, 9 Jan 2023 09:33:48 -0800 (PST)
X-Google-Smtp-Source: AMrXdXugXkYko+LeRWVrYncqDjgxyqBt+veD+bppsPINqp47Ie1u5NVli10PJwWDl97+RVXjHsQ5
X-Received: by 2002:ad4:41ce:0:b0:531:bea4:a9f1 with SMTP id a14-20020ad441ce000000b00531bea4a9f1mr41829181qvq.36.1673285628134;
        Mon, 09 Jan 2023 09:33:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673285628; cv=none;
        d=google.com; s=arc-20160816;
        b=E9e4O65SIezFPBDP8cYPNo3c/CbqcoFu/4Xcltn1mCNRqlFpakSGjl3T4yzE0/0nu0
         JjH3YDy1ymuGvPfmj7dTWZTzeHepex1wtbrrLPoInA0EWSj4Fmu02OzRvvsoum+3njgr
         GS6BkchHdgG7yZI81y5sThKV4MCTobl5p1cj4/rULSFQ360fy9X21TZgGaQDWaLzbiqX
         5q0Eah3JXDeHqEpS1FkRK5AODV5eEKfXEB6VM4e17//BdVyFJ0hNa2M1xmJ2rsZaD48z
         4iN+6CKN4U+ErcBdWsMUY8qEu1lqmnudeXEmQdhXqsFg/hZvORA0w3J4INt9YiWz4l0H
         HR7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Rii9ZmdKPNRYuyNGcUNUU8qirt/EB9vaI3Aqh3cPmU4=;
        b=oY2rmbWz5XhykspggZ0RcXPHCRXDArVmM5r8FWNlGxQJHtj3OHiPe0MlMyJHEjas8P
         CjVuXBTfhAyipFb+OZBWuhksnkCe7tbf0oErPXzDLaMl1nkDAbODnFSEKERaSel2wcut
         V/HLPoZxgRWIR7L84CW6YrbDrh0AZWYPn+am2D8XqrprrkAtowiNyNaA3LZB8vopYg8q
         y7e6q3+ws7xtn0EyXPL1Qe47eXw0/P09DDCdkuDEuIqn11jb7kbIkPufYjDXLa5TtV+m
         q65o6VEXpFD3OdGcLfdu20OmhinFMbKN9XuKJUfHM5G8F1aybfAvHJWzP8GCJb7n2xZE
         Vq9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=jMO5dniN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id hr6-20020a05621423c600b0053216c5b0d7si4378707qvb.111.2023.01.09.09.33.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Jan 2023 09:33:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=jMO5dniN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pEvuS-00041d-Eq; Mon, 09 Jan 2023 12:26:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pEvtf-0002jH-6z; Mon, 09 Jan 2023 12:25:19 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pEvtc-0000zU-NF; Mon, 09 Jan 2023 12:25:18 -0500
Received: by mail-ej1-x62e.google.com with SMTP id vm8so21932003ejc.2;
 Mon, 09 Jan 2023 09:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rii9ZmdKPNRYuyNGcUNUU8qirt/EB9vaI3Aqh3cPmU4=;
 b=jMO5dniNOV4HmJ0wX2sKj+vPCdeA8KDiRUFmPPxH7Dq7o7Zophnd/3epwNXS4VlwZp
 rbbpi+40oLWkYceYGQOD6/6xSceD7ZiR05CEOxZSbTMppqJqnmy/2wo3rET8YK221/KL
 MofmUFTgpfsMn734Fl5oCxKfk8IwNtvtAEzUREFIl7RR+zf0urH+pxUlOTTUgcSV2JJZ
 1nyiTpgHgB0Ee9Hf4lpO/t/AMXf+KWHZMnYim65xlrDS2xtK+6BBT63kiqM204XeOUXj
 TR+zALdv63OQQu2YXpA9MNeH7B8HPGupzaNAKx8hBHlYBsja6UDTik7sP5ZPeuiHRDRD
 KHoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Rii9ZmdKPNRYuyNGcUNUU8qirt/EB9vaI3Aqh3cPmU4=;
 b=JghTV0D2TkCc3bfLIeOdavMHGMYEWfOIJFpByf82/FPP0F1P9RGI0VmrIrXPYNR46N
 82jK25b/5v7WdYDwLISG1n2sEPzCYjabuDFyvQ2lR1jAF/PV18JBI29aZS3JlrV9JGzb
 gGtWUjjJa082lxEYAZKb+a1haDUrW0eDNt5M8brigavB7mHuCMGvZjcfeeEZ8v7mNEAy
 7aLPjjoKWC25i684k8kNk3k4Hi4uiFU3pPYkFjxpv/9+zo4AMt8VSjgS9r+I6VRz3q+j
 7rjMFldVLKE6+ODtutPX1e5yaezABLp0a/jN3XswVYCrm9APn2hNNhPnkenNU/MEo5cf
 Pgug==
X-Gm-Message-State: AFqh2kr9VoIGlu3+PBEYF+8by9ZMTDfiugGLUm5czKEgsGnBFbigNklK
 TwmUI+of8vlV2ecZ5vszIcTkt91wMRNGtg==
X-Received: by 2002:a17:907:a50f:b0:7c0:d609:6f9b with SMTP id
 vr15-20020a170907a50f00b007c0d6096f9bmr61290488ejc.27.1673285113104; 
 Mon, 09 Jan 2023 09:25:13 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 18-20020a170906201200b00846734faa9asm3925625ejo.164.2023.01.09.09.25.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 09:25:12 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: John G Johnson <john.g.johnson@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, Ani Sinha <ani@anisinha.ca>,
 Eduardo Habkost <eduardo@habkost.net>, Gerd Hoffmann <kraxel@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-ppc@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v6 18/33] hw/isa/piix3: Wire up ACPI interrupt internally
Date: Mon,  9 Jan 2023 18:23:31 +0100
Message-Id: <20230109172347.1830-19-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109172347.1830-1-shentey@gmail.com>
References: <20230109172347.1830-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-TUID: 9/5cGY2VcdV+

Now that PIIX3 has the PIC integrated, the ACPI controller can be wired
up internally.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20221022150508.26830-18-shentey@gmail.com>
---
 hw/i386/pc_piix.c | 1 -
 hw/isa/piix3.c    | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 4675981021..92d9dd1ae2 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -329,7 +329,6 @@ static void pc_init1(MachineState *machine,
     if (piix4_pm) {
         smi_irq = qemu_allocate_irq(pc_acpi_smi_interrupt, first_cpu, 0);
 
-        qdev_connect_gpio_out(DEVICE(piix4_pm), 0, x86ms->gsi[9]);
         qdev_connect_gpio_out_named(DEVICE(piix4_pm), "smi-irq", 0, smi_irq);
         pcms->smbus = I2C_BUS(qdev_get_child_bus(DEVICE(piix4_pm), "i2c"));
         /* TODO: Populate SPD eeprom data.  */
diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index a549b1a8a5..6d2ffd449c 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -343,6 +343,8 @@ static void pci_piix3_realize(PCIDevice *dev, Error **errp)
         if (!qdev_realize(DEVICE(&d->pm), BUS(pci_bus), errp)) {
             return;
         }
+        qdev_connect_gpio_out(DEVICE(&d->pm), 0,
+                              qdev_get_gpio_in(DEVICE(&d->pic), 9));
     }
 }
 
-- 
2.39.0

