Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp3139637lfm;
        Sun, 12 Apr 2020 15:41:40 -0700 (PDT)
X-Google-Smtp-Source: APiQypJX3Ql/CllBSYvtl4BKkkz4ojxLAvypY+3zuyKSKV+4e9RI3py4IvDwt3mbRuCLk7ybntnN
X-Received: by 2002:a0c:aee5:: with SMTP id n37mr14113154qvd.173.1586731300189;
        Sun, 12 Apr 2020 15:41:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586731300; cv=none;
        d=google.com; s=arc-20160816;
        b=M5i8cppkK+Sy1/uoMBgo3hfn++xMXfg/CRGFkpjClTsBpGt2DciQzbz0J5o0Z7VHwb
         qdRadnhvmh+khEYafElEw4z6Wplf0pfIuMz30DgChW4zVH/Fj/HwvHLYCc6Gm4sBUAVt
         qYB9ykYQGNuTsE86ncUt9dNngLuofS6IjyzxS6LXC9a9K5vEPE6+tyVB8HeSxDyXyc/n
         //mTfaGO7LUgKGtxkgzYWFI/jNZz372aGniqRbUGQE7m9teciy8bRkuudd2WL9cwNNm3
         u0G/FyIZ/Hylf3WPw7x1E13NS9lJK1/Ujk79A682y8QsHZBQymsQh+PFSa9xBYOY1LGt
         CM7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=8naS2wy7z7r5ZHMslOR/F6A89KH9g2Da3djfcOFUQbw=;
        b=B3b8RoPl4R0k/IyAjYX8PDe3DREoQ+xPzUX4XQbKAqcFUwZvWZ2ggpZ9PCbC06myLa
         Ileo+lhZX3BmNrCCHKiUNBVDRcFeQZ+r/QJ+MoECn5Yz9CI9FvM/5s8AtTvCm7V4KEOJ
         H0CXftklmIoY9GPUYfQ9PxGyPajgrT7p8mnNbr8IA51y/5CBE5EhE307sq/LkzBMfxHg
         yPHUOsqnpBzghlA9xjVxl72TFlgIlt1eGh7mzNKI9FFHpCONLBBvOjZTB9clg2TgV1IB
         5IxTBqDKPWl9MYpcxIBZRygOcOr5mAUu8e3ynDyQnmA3IwPtOzyAUi+7J62MRVnqDFDJ
         hMAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ZopGHA5h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p16si4946320qkp.235.2020.04.12.15.41.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 Apr 2020 15:41:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ZopGHA5h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:37808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jNlIJ-0007VW-KM
	for alex.bennee@linaro.org; Sun, 12 Apr 2020 18:41:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47575)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlDn-00065r-Rw
 for qemu-arm@nongnu.org; Sun, 12 Apr 2020 18:37:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlDm-0002et-Ms
 for qemu-arm@nongnu.org; Sun, 12 Apr 2020 18:36:59 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:39217)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jNlDh-0002VS-9D; Sun, 12 Apr 2020 18:36:53 -0400
Received: by mail-wm1-x32d.google.com with SMTP id y24so8373506wma.4;
 Sun, 12 Apr 2020 15:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8naS2wy7z7r5ZHMslOR/F6A89KH9g2Da3djfcOFUQbw=;
 b=ZopGHA5hPnTx8sNF2c5SGckaNTBGwPnkbtYAxja2/xP+2Q1PskQL6Z0KC9zTeVmVp2
 J5vV0yzKRL+S29+OMS63qITufgzDCbChemcpzgPth3HYg1iEOasTt5FAIV6lMHp8Ymcs
 +qywRHXNlgawOIU3WMzs5t/XjiKywX00cPzZDs9ckHENzcnMl6KrvQQ4C5y/O4CpB6cz
 7+EQMfUCWq2xGbsT+bt3dh+71+7dFFfSSrpWrlEx6AWXwxPIPRWLEoCkHVe9kPMK/zqP
 mSAKbIl2mFbkK/0udjP3UNoFTLFDdQrXnzwTLEf3L9ErgUZCOWYuwgohv2DRDoVvb6/F
 b2uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=8naS2wy7z7r5ZHMslOR/F6A89KH9g2Da3djfcOFUQbw=;
 b=BW/9bbpnHjhCmTWMo149N8u+u0/AblYs9YC5zfpcDD/DXlm160Mkj2JKS0mguo+Bat
 NSo0PZePQDl3ENNVMAzP++NvqKaL6Jeb4r7p66W8Ue4FRqGM+aPOTUA6DhNk1YEet+4I
 vWR2Z5R8yap5BP3WabhDoZG9UGMjyMP1Y0Wr1DofkXzYeasy/iYZtzifb8DseYGyH0mn
 1LI6nt4isUziwGivCxjkQfedZr/uhQm0xYV9//PquQHuXn9EXbylz3nwVaOuzEsgDlgU
 vz91efiiQVTgTBy0mkvZCbLzaZG9SOVUhuaSwzTQZYLWB+Qkc8ybhD9lNAgHN7yXTLT1
 H0Bg==
X-Gm-Message-State: AGi0PubhXiL4Fs5CWikhLb/unci88MjtFyUiMW4CXuMb5yH+XAHd64Mh
 CslBltCx0/lBfi4F9ILSbTEqu4dtC/m9BQ==
X-Received: by 2002:a1c:195:: with SMTP id 143mr15945607wmb.0.1586731012068;
 Sun, 12 Apr 2020 15:36:52 -0700 (PDT)
Received: from localhost.localdomain (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id d13sm12563559wrv.34.2020.04.12.15.36.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Apr 2020 15:36:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.1 v3 08/24] hw/arm/fsl-imx6: Simplify checks on
 'smp_cpus' count
Date: Mon, 13 Apr 2020 00:36:03 +0200
Message-Id: <20200412223619.11284-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200412223619.11284-1-f4bug@amsat.org>
References: <20200412223619.11284-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::32d
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jeff Cody <codyprime@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 qemu-riscv@nongnu.org, Andrew Jeffery <andrew@aj.id.au>,
 Wen Congyang <wencongyang2@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-ppc@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: l/99FHZUGpUn

Coccinelle failed at processing this file:

  $ spatch ... --timeout 60 --sp-file \
    scripts/coccinelle/simplify-init-realize-error_propagate.cocci
  HANDLING: ./hw/arm/fsl-imx6.c
  Fatal error: exception Coccinelle_modules.Common.Timeout

While reviewing we notice the smp_cpus count is already limited
by MachineClass::max_cpus:

  static void sabrelite_machine_init(MachineClass *mc)
  {
      mc->max_cpus = FSL_IMX6_NUM_CPUS;
      ...
  }

So remove the check in realize(), but still assert in init().

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/fsl-imx6.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/hw/arm/fsl-imx6.c b/hw/arm/fsl-imx6.c
index 13f1bf23a6..3d37352b08 100644
--- a/hw/arm/fsl-imx6.c
+++ b/hw/arm/fsl-imx6.c
@@ -37,10 +37,12 @@
 static void fsl_imx6_init(Object *obj)
 {
     MachineState *ms = MACHINE(qdev_get_machine());
+    unsigned int smp_cpus = ms->smp.cpus;
     FslIMX6State *s = FSL_IMX6(obj);
     char name[NAME_SIZE];
     int i;
 
+    assert(smp_cpus <= FSL_IMX6_NUM_CPUS);
     for (i = 0; i < MIN(ms->smp.cpus, FSL_IMX6_NUM_CPUS); i++) {
         snprintf(name, NAME_SIZE, "cpu%d", i);
         object_initialize_child(obj, name, &s->cpu[i], sizeof(s->cpu[i]),
@@ -121,12 +123,6 @@ static void fsl_imx6_realize(DeviceState *dev, Error **errp)
     Error *err = NULL;
     unsigned int smp_cpus = ms->smp.cpus;
 
-    if (smp_cpus > FSL_IMX6_NUM_CPUS) {
-        error_setg(errp, "%s: Only %d CPUs are supported (%d requested)",
-                   TYPE_FSL_IMX6, FSL_IMX6_NUM_CPUS, smp_cpus);
-        return;
-    }
-
     for (i = 0; i < smp_cpus; i++) {
 
         /* On uniprocessor, the CBAR is set to 0 */
-- 
2.21.1

