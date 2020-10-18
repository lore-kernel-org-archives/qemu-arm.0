Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp3328564lfa;
        Sun, 18 Oct 2020 13:40:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxB0shVmsGQbHSniET3FgrkX8QRXJUEu9dQdzaJF8QEgsUFpWWeMIdu6KQQawMyo+/iS0dq
X-Received: by 2002:a25:2e01:: with SMTP id u1mr17581739ybu.461.1603053619283;
        Sun, 18 Oct 2020 13:40:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603053619; cv=none;
        d=google.com; s=arc-20160816;
        b=VSyF1MyRPSuBfqqluoB0VLSMSzHbwsbJniidcnbq3dA3Mkcg3DC+4Jb99l42pm/s20
         VcB72vE11/WIGkVeiRiTt/1XbpfCpXqdDoNhJxeD5AgNB21FZ7x9rBM7A3lRgckRTCuz
         tyYvJ3hUi6O6s1oSpxqAThPGNa4cJJBcEzagMdyf/Fm/GXP5ZDtlFH7Bs0m/GoaE0Zit
         99jq87dXbGjTuaeiwrGLhbPSYdei9OyZ4OkX/AvvjOBJiP+JguMxfMYfvEebZIpuQsVS
         6cL3j+a1pekNpqaoMzkqtqKVofYOnjCaSv02zAVpp7DV/ARs9Ngx4QB9RAfzo7LdB42D
         Lfqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=T+AjHLV6TbQto2ptPmPM4vzjwRMfK43yR9xTQuzop2M=;
        b=hKvelYsAujS1Xvhk3I+G1fl0ljFFjZvEMq+Yj/V2uAun9D8HukWXioZ3WZBvILa6UR
         W3p1lBf4vgidv3jBRM9F+gVwagVzOz8GAPa+pcv5NXfIyPrXPL7b9OKcGAA1RUQ3jTec
         THjjOPy/WQDNez4fQy7x69TU3gNz/QoT6aChqbh1ucxg1aIuMOtk/GeHtfNkl/PaNNI4
         Ag+pu4+MrxbPp/jhvyoJU7Wg2sH+g9C+JZ4M6Pj92j/cIW+ODSgKpxk8v1gpd6AZ8l+X
         d7H9jHXF2i8bJ7s14u/PmCh/7BTfuooX8w7ic1lqTyc6Ku3GI3UpqPXGmIwl2fLKv8Bs
         Y+ig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=gMCc+q6S;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l189si8742490ybb.223.2020.10.18.13.40.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 18 Oct 2020 13:40:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=gMCc+q6S;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:59078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kUFTW-0000tS-LQ
	for alex.bennee@linaro.org; Sun, 18 Oct 2020 16:40:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kUFO6-0002I9-9m; Sun, 18 Oct 2020 16:34:42 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:44318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kUFO4-00010g-Hg; Sun, 18 Oct 2020 16:34:41 -0400
Received: by mail-wr1-x441.google.com with SMTP id t9so9098735wrq.11;
 Sun, 18 Oct 2020 13:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T+AjHLV6TbQto2ptPmPM4vzjwRMfK43yR9xTQuzop2M=;
 b=gMCc+q6SdNQ3Y5/Lz5suHD7Sacqw2KW33mm+3gmrGycb3IJ5VTTWGu0E5skFyEW2g2
 9K595vduWOx6Hv4dGn4hCMCKKJhmRj21Oib5JKCsOjgLcfWerhlqxzW8wMOKexfgo6ii
 pXo9HXyLmgcU7PZlCAJP0kr/P4RoWX653itwEob05mGTtOta64SAIspDplmIKcD7VIxC
 kRAq+sLVklt44uoJpkajtkP3UB/6/SdL4aUYYnC2YvZLerZXvfa6rfnZTXvtI3H7j8bL
 ZeaNiMFpBNgS1T2y6MYZVy/cjC/roGiB+W4yNxTJjB6kQ8tt6MIc0jTkcNAngG3WHjDL
 QsMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=T+AjHLV6TbQto2ptPmPM4vzjwRMfK43yR9xTQuzop2M=;
 b=Jj8cBXKJxq8dXmOpFwhRqViZ1agHtrO4EWhxkdq8zCEgigBx01QM4G4enHHmSZKJM7
 euS0c414L6GgpxLTlSEoLAnGvQJA9U/2nPdnnlWnMErXR6341gk8DO7UGbw9qgYN/Zm7
 QwOMkD6ugG0fgYFjtIOuRg4NAF9oCTkt9grKV1pH3SA7Gz1rl0KVdQBV/qLtr0P0DeEm
 LWi42156yh21zJ0Xsnn3RSl/sQs1NHp9hWxCnKwb1o80wjk8lYJwI2Cr1j7xeZILeDNt
 YXU3mZL/efBhIzvPwYaZmL8RGZ0x3skl6ULK4zug93mVrXXkCwEUe28gHQ32MCK8Z9kT
 yqQw==
X-Gm-Message-State: AOAM531ua0gRV4qYIFFLmtL4twKOL8r7uzCDCJUpONFg6cDfT3iDXh5S
 HR4MY3aaLRxc4Tlr4IB4meYxIeq75xQ=
X-Received: by 2002:a5d:6a49:: with SMTP id t9mr15964543wrw.194.1603053278522; 
 Sun, 18 Oct 2020 13:34:38 -0700 (PDT)
Received: from localhost.localdomain
 (117.red-83-52-172.dynamicip.rima-tde.net. [83.52.172.117])
 by smtp.gmail.com with ESMTPSA id g5sm13452489wmi.4.2020.10.18.13.34.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Oct 2020 13:34:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 8/9] hw/arm/raspi: Add the Raspberry Pi Zero machine
Date: Sun, 18 Oct 2020 22:33:57 +0200
Message-Id: <20201018203358.1530378-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201018203358.1530378-1-f4bug@amsat.org>
References: <20201018203358.1530378-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Luc Michel <luc@lmichel.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-arm@nongnu.org,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bVoVqwwEpZ6j

Similarly to the Pi A, the Pi Zero uses a BCM2835 SoC (ARMv6Z core).

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
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/raspi.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 91a59d1d489..1510ca01afe 100644
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
+    rmc->board_rev = 0x900092;
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

