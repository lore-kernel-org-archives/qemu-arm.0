Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp710635ejc;
        Sat, 11 Mar 2023 06:43:26 -0800 (PST)
X-Google-Smtp-Source: AK7set+jHYBvVRiGg1Z2b7onjONyfBFVfSy1hNzCOdFXeZUKQ12EyGD79K9HDwFKGyqYZB7sWdZ4
X-Received: by 2002:a05:622a:1aa7:b0:3b9:bc8c:c210 with SMTP id s39-20020a05622a1aa700b003b9bc8cc210mr9310212qtc.27.1678545806184;
        Sat, 11 Mar 2023 06:43:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678545806; cv=none;
        d=google.com; s=arc-20160816;
        b=k538yw+AG0KmnXFehDMl9JkDghnoc2tdB6UsoPmzmDqy5HnJbFl1YuGmP+TgyCk6xp
         UCWtXUPr97sqLj8+volsA/ZVK5fGocwSRzDMzAhlP/BztAj7HnwGZyg4bvSyOrQFWVLW
         9963fgLrpCa3Tjf9VnuobKJo2AzAsr0od3YEn46W6UH3c/k6HyTl8wLVmbqjB/xio49x
         tXZQ9CSVHy5VHsOvu8vSun9Xa5IxcRUJlgB2AsXuyIdKm7sOnptKoFjrVe2UxO4iYK8M
         yCZVtDP4r00Zn5ykqaeAAfiM7gUzooMciEdAf+L8mu0iYv08UwW49i3LGYVsUNi/WD09
         gZhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=05gxZng6cM0+++4MWfWu/fgzS6pU8/MchkJ/uXLX1ZU=;
        b=dDFOhfmHNAYkPZFIB0qJvKndvixXF2VaY3KWWuLonxVuPOIfX0Tx3QpBbcLLiaMwTh
         5nP8sfU8ItkuS3aorlcfq7MyHzMg640XEd0o5gSEHfI+G4D7uBTxnaQRDYXWoDZR/s90
         eemf6G+mOp/hqugT8XAOfBJ9CYxprRorOdJZ8RkFkUA7ON0JhkFunr3e9MS5w6Rk9G1d
         bo/sbrWK30FmWpIYsWFVce065LW/5+wNYLKSy7ImK4s29iBhU38ugK0CMMg0Ph3ZA6Ph
         DlWWc6SBkSY1VDXQU/tIv63AdngpQJkAmdE/Qnk6f4I42+rr26OkikUzhlMPuVW4C+s0
         ylmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=Lj4iNaMz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s3-20020a05620a0bc300b0073baab85585si1900672qki.297.2023.03.11.06.43.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 11 Mar 2023 06:43:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=Lj4iNaMz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pb0QH-00044V-Ay; Sat, 11 Mar 2023 09:42:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1pb0QF-000447-PY; Sat, 11 Mar 2023 09:42:11 -0500
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1pb0QE-0002oV-Aj; Sat, 11 Mar 2023 09:42:11 -0500
Received: by mail-lf1-x12f.google.com with SMTP id g17so10345143lfv.4;
 Sat, 11 Mar 2023 06:42:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678545728;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=05gxZng6cM0+++4MWfWu/fgzS6pU8/MchkJ/uXLX1ZU=;
 b=Lj4iNaMzqa/v/A+STR+Dj5nnJr+XvEVcFc90JaILI9RZP2QRybu6AP6WXWCK5vhRX+
 wQ4sX0mqcYvmVytXH55ACcIm8kfbk+BCTnwRg+lgaqrUrIjLB8wsGE4yRUT1TGSD6+Bg
 hk2tP6ljEPLflJ974OqPUujJeO9kMKWIKGAcJRzVmRi01wTRv7zo0JssThQW3Ybi5NE4
 uICF3wMLDKbU6GrFpmJuSQLMLqOYE9cOtnXbBCn+JBZrtw0ZrZvnGm2G4pTu/ItsT6PD
 +R+uwVXKeb0Beea5y036M+RQFB8r95aMqZnuQ4CByNEK60PW2qVGtjbhiv95q13fs0lO
 ID+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678545728;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=05gxZng6cM0+++4MWfWu/fgzS6pU8/MchkJ/uXLX1ZU=;
 b=YPQIuOwCKBIT8eST8oMqbSv8tye39ZuBprUlLkIgaAB6Sdm+bgVaKNrLVPO1/L3TAi
 V6XGM1Xv5YiToKxm+xwFoiSu30SLcUFC5ZKJ0NnpA1PzvMRiNXXIC3fbJCguzxBBNyc/
 fAtbcjZjSaseXL6BxTx/UYmstUFSkxFvhCvpugWUxVz6jtes/lZ/Fom/nAwGidFWExrE
 rgdFQAKWsYVYIrtALObZm6r/GRUAnaydMPBu3d8FpMb5OT1Bdk2gKBJTOfT0fC0w/a2P
 CZ0N+sY0jaZafKmmM6J/EFz0h1xtcUuL6UqEjNGjYk3EzfzWCVTAjcGe4PAcUn3OZ1ov
 PjLg==
X-Gm-Message-State: AO0yUKWnJfraH6SWYu0wMX84HT4eiicVQD4BY8hQW2ADwIOLI3RHsLcQ
 QpXdSoog6+fz7AzICbcBH9s=
X-Received: by 2002:ac2:532c:0:b0:4bb:9415:38a2 with SMTP id
 f12-20020ac2532c000000b004bb941538a2mr7985705lfh.51.1678545728311; 
 Sat, 11 Mar 2023 06:42:08 -0800 (PST)
Received: from penguin.lxd (213-67-202-254-no43.tbcn.telia.com.
 [213.67.202.254]) by smtp.googlemail.com with ESMTPSA id
 g15-20020a19ee0f000000b004d887e0e9edsm333320lfb.168.2023.03.11.06.42.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Mar 2023 06:42:08 -0800 (PST)
From: Strahinja Jankovic <strahinjapjankovic@gmail.com>
X-Google-Original-From: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Subject: [PATCH 4/4] tests/avocado: Add reboot tests to Cubieboard
Date: Sat, 11 Mar 2023 15:41:11 +0100
Message-Id: <20230311144111.30468-5-strahinja.p.jankovic@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230311144111.30468-1-strahinja.p.jankovic@gmail.com>
References: <20230311144111.30468-1-strahinja.p.jankovic@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=strahinjapjankovic@gmail.com; helo=mail-lf1-x12f.google.com
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
X-TUID: JpQOZ8UQOLnP

Cubieboard tests end with comment "reboot not functioning; omit test".
Fix this so reboot is done at the end of each test.

Signed-off-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
---
 tests/avocado/boot_linux_console.py | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
index 574609bf43..c0675809e6 100644
--- a/tests/avocado/boot_linux_console.py
+++ b/tests/avocado/boot_linux_console.py
@@ -581,7 +581,10 @@ def test_arm_cubieboard_initrd(self):
                                                 'Allwinner sun4i/sun5i')
         exec_command_and_wait_for_pattern(self, 'cat /proc/iomem',
                                                 'system-control@1c00000')
-        # cubieboard's reboot is not functioning; omit reboot test.
+        exec_command_and_wait_for_pattern(self, 'reboot',
+                                                'reboot: Restarting system')
+        # Wait for VM to shut down gracefully
+        self.vm.wait()
 
     def test_arm_cubieboard_sata(self):
         """
@@ -625,7 +628,10 @@ def test_arm_cubieboard_sata(self):
                                                 'Allwinner sun4i/sun5i')
         exec_command_and_wait_for_pattern(self, 'cat /proc/partitions',
                                                 'sda')
-        # cubieboard's reboot is not functioning; omit reboot test.
+        exec_command_and_wait_for_pattern(self, 'reboot',
+                                                'reboot: Restarting system')
+        # Wait for VM to shut down gracefully
+        self.vm.wait()
 
     @skipUnless(os.getenv('AVOCADO_ALLOW_LARGE_STORAGE'), 'storage limited')
     def test_arm_cubieboard_openwrt_22_03_2(self):
@@ -672,7 +678,10 @@ def test_arm_cubieboard_openwrt_22_03_2(self):
 
         exec_command_and_wait_for_pattern(self, 'cat /proc/cpuinfo',
                                                 'Allwinner sun4i/sun5i')
-        # cubieboard's reboot is not functioning; omit reboot test.
+        exec_command_and_wait_for_pattern(self, 'reboot',
+                                                'reboot: Restarting system')
+        # Wait for VM to shut down gracefully
+        self.vm.wait()
 
     @skipUnless(os.getenv('AVOCADO_TIMEOUT_EXPECTED'), 'Test might timeout')
     def test_arm_quanta_gsj(self):
-- 
2.30.2

