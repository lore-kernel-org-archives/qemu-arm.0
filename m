Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp1488479lfa;
        Sat, 24 Oct 2020 10:03:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwrwHVgd6ROGb8GiXTmirehNuk/hwyxWQ/WjW7SmBacAB2d1503xipV/2BC9B7BrXU1PXxy
X-Received: by 2002:a05:620a:a90:: with SMTP id v16mr7516440qkg.377.1603559008071;
        Sat, 24 Oct 2020 10:03:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603559008; cv=none;
        d=google.com; s=arc-20160816;
        b=k8hUhByliSVJABRtSK+zWcrNn+tNKXGEx5cNdVmD3HcdbRFb0Mn2SG1Dyk0N3rJB5z
         uwzbDbsjqyDg3lBgziC6+G3Kxbop+Qtl9c7J5i5vjnxiPzRvrrL6De9P+WCSBvXUJDqx
         v+jkYi0yldwMV0vYKI5zMIzjFreesYpQp/Lr4pUvuEVDQNXYDPp3q9O7Oix3NpiJEqXM
         8Mrwm53U7JRR12TgbpJYqMtNj6TFLnn2R5ftdHSNiXrbYMcN5JwarQwMCBRKy3dC4rDa
         GmDbhuyU4oEk70hXZnSkhzTZVAYOyfmEUfhujYuRCcc7/j8Bt6VngsvaBKHP90Co1Q61
         wwAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=cuBUbDkqPu7YN9qL1F67Qvxpg+vH+NzaO82nHRsjbP8=;
        b=zfavgU8JlXsyZ0n4RI/n3zUSlCBJDVJjHpAn04O2BX23YSjn2rwuBXSBOSf35tWgEL
         jW9pv1L3UGltUnYMecDs6QB2lZ+JAPDLqUlQKh3HPzEdRDaBdryDe5iJ5FH+NOE2C6nE
         kh0AgJNgTAylGl5kevDmNvnTwz7NNoL7rJqA+1qlJkdIHFY/3aXaOlHDCq1W/fZIxPQr
         jscAH7doiKSFlw4oJDhVfS23UVTj9GC1K09vvQb9ZYTKKQAz0puK8hMegBxKvfFgHUen
         bt9sBRt6ceOsEyioGLAkHBimqffQbZaAI9XYzE0g1RVLJCClRStYFrjD772DKmtYQuRE
         RRMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=TfGvL36i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t5si3303146qkj.77.2020.10.24.10.03.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 24 Oct 2020 10:03:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=TfGvL36i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:56530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kWMwx-0000VA-EX
	for alex.bennee@linaro.org; Sat, 24 Oct 2020 13:03:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kWMvl-00088P-OO; Sat, 24 Oct 2020 13:02:13 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:54978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kWMvj-0005kH-RW; Sat, 24 Oct 2020 13:02:13 -0400
Received: by mail-wm1-x335.google.com with SMTP id w23so4616210wmi.4;
 Sat, 24 Oct 2020 10:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cuBUbDkqPu7YN9qL1F67Qvxpg+vH+NzaO82nHRsjbP8=;
 b=TfGvL36iVj4ewkGzPw2CN8ilyExWJPmYDd/PL5yYUsBzMoToxRVUfsRr8x58AG/HmJ
 UfrhOUM8wCOhp++v0nzVlBWD8E/qf6uWQ5Rm8iW054GrFKffeH7yx/i89hZYHk2C4Gfl
 rd4CPkux6Y12CmLyGGj8RUxzyQ15u81pnTzp0D4G2uOiJYuzIOivsDNvXfyJq2kqcmX2
 +fz1esr1Bq8D6OA+nhTO+ZXgtlvQXb37SYQyYGlHbkIzekCmDfpioKJ8CS4Uxzy5Tars
 /s4jj2AQLqgyAC/b8lKsrBTB97MfcldSpOOyynt5JBzhqyPKKsozvvEYJkE/rXBZRp8J
 C46w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=cuBUbDkqPu7YN9qL1F67Qvxpg+vH+NzaO82nHRsjbP8=;
 b=kXFz/fHnq3BHNBmPuvTWchh2V4n/+2BbuauY0H//UePIaH+IOxeNNL1I4mxjromG0r
 XnlptC+qC08ZTUTQ/cQ+u0gZ+njHX/cswCXobVLQYqGpFAkiQJ0fSmro4EPJVGiohcIU
 /aNMMGN4+Utf/HOlgxhrZe6G78zpcczxMEs17LUeI5oGjpkaI5q36JvXXHSPOR0GHF7t
 RQx1ZqMgq909pCb3QLTwGThSFu4hBUhZigca7ep1h3ZLWXFNrwdsBl4ADtJP6E8ncCvn
 DQcr40H7Z/LAUOwWCDnobCOs58ds2cHJaRhYNMMaK5le+DtxdTbfSPvJkvo0Ydt1VTKY
 V7sw==
X-Gm-Message-State: AOAM531x/Sxz7QLoemuWNwoxE+cFf95x+hQDRacyRX0fQpVGDFpRD/6/
 D8EWVnJd4lf4MtpRw69b6Epz2H6WMEg=
X-Received: by 2002:a1c:3243:: with SMTP id y64mr7692111wmy.175.1603558929862; 
 Sat, 24 Oct 2020 10:02:09 -0700 (PDT)
Received: from localhost.localdomain (237.red-88-18-140.staticip.rima-tde.net.
 [88.18.140.237])
 by smtp.gmail.com with ESMTPSA id g5sm10992116wmi.4.2020.10.24.10.02.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Oct 2020 10:02:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 8/9] hw/arm/raspi: Add the Raspberry Pi Zero machine
Date: Sat, 24 Oct 2020 19:01:26 +0200
Message-Id: <20201024170127.3592182-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201024170127.3592182-1-f4bug@amsat.org>
References: <20201024170127.3592182-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Luc Michel <luc@lmichel.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JSM01rdZpplU

Similarly to the Pi A, the Pi Zero uses a BCM2835 SoC (ARMv6Z core).

The only difference between the revision 1.2 and 1.3 is the latter
exposes a CSI camera connector. As we do not implement the Unicam
peripheral, there is no point in exposing a camera connector :)
Therefore we choose to model the 1.2 revision.

Example booting the machine using content from [*]:

  $ qemu-system-arm -M raspi0 -serial stdio \
      -kernel raspberrypi/firmware/boot/kernel.img \
      -dtb raspberrypi/firmware/boot/bcm2708-rpi-zero.dtb \
      -append 'printk.time=0 earlycon=pl011,0x20201000 console=ttyAMA0'
  [    0.000000] Booting Linux on physical CPU 0x0
  [    0.000000] Linux version 4.19.118+ (dom@buildbot) (gcc version 4.9.3 (crosstool-NG crosstool-ng-1.22.0-88-g8460611)) #1311 Mon Apr 27 14:16:15 BST 2020
  [    0.000000] CPU: ARMv6-compatible processor [410fb767] revision 7 (ARMv7), cr=00c5387d
  [    0.000000] CPU: VIPT aliasing data cache, unknown instruction cache
  [    0.000000] OF: fdt: Machine model: Raspberry Pi Zero
  ...

[*] http://archive.raspberrypi.org/debian/pool/main/r/raspberrypi-firmware/raspberrypi-kernel_1.20200512-2_armhf.deb

Reviewed-by: Luc Michel <luc.michel@greensocs.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/raspi.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 79fdd354603..0f5ea7e99b5 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -319,6 +319,15 @@ static void raspi_machine_class_common_init(MachineClass *mc,
     mc->default_ram_id = "ram";
 };
 
+static void raspi0_machine_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    RaspiMachineClass *rmc = RASPI_MACHINE_CLASS(oc);
+
+    rmc->board_rev = 0x920092; /* Revision 1.2 */
+    raspi_machine_class_common_init(mc, rmc->board_rev);
+};
+
 static void raspi1ap_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -352,6 +361,10 @@ static void raspi3b_machine_class_init(ObjectClass *oc, void *data)
 
 static const TypeInfo raspi_machine_types[] = {
     {
+        .name           = MACHINE_TYPE_NAME("raspi0"),
+        .parent         = TYPE_RASPI_MACHINE,
+        .class_init     = raspi0_machine_class_init,
+    }, {
         .name           = MACHINE_TYPE_NAME("raspi1ap"),
         .parent         = TYPE_RASPI_MACHINE,
         .class_init     = raspi1ap_machine_class_init,
-- 
2.26.2

