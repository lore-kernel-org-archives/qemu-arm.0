Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp1524919lfc;
        Tue, 12 Oct 2021 00:44:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy2x/jxaFX2u2GSIc5hWwZi6MgoDdO14LSAvO2n1GjqbWdiuhLEuI5NKw58PG/2EDC/YRsK
X-Received: by 2002:a05:6214:b30:: with SMTP id w16mr22770333qvj.61.1634024695194;
        Tue, 12 Oct 2021 00:44:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634024695; cv=none;
        d=google.com; s=arc-20160816;
        b=vvDF0P9qDARXo/cyO+8+ndLoG1tXB4Qo8JcqplN0s3o4GVDgfqN4Ctl2yYrDQXYeg1
         j2ia5J2D6k8nPnvFoemOxNp45u+VpCLHued3DqCMWDB924JTHJweILeEBxBRnqR3Eukk
         Pc543oV8FKKO6WPQGD6k7gtOt6ep5ooBpkrtVBR2Oij/wwlJ3lAnpYzps9sv6eYDowgQ
         y5yUcTjNWvmeVkW8wNB8vVIrAjly1S/Q5Z3UWR51VeIweU8ZN+nZQFElKBHu4mkyeX03
         35hQT+3mdlUbPg//jbTt3Y7gI59vpF4xFn1SjyVlHYU7ah394jWO64xRE8Yc/JBu6ftH
         RAJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=StAJIT8mltpcff+z9TLCYNV8rICTQUDOWi99J6saoUw=;
        b=di9GzUpqHPDAUW9lV3izPFgcTJZ6qUMZee9EMWS4opi56+ImvGqQUGX9NNbulGX5m5
         idEqoEvw5Wqkm5JCv408+ekJh+qNcOmQvxUjRv8C8YgI+BItF89BXKuL76Pqf65Hg8D4
         ftONUaHJ7KFad/yjwadSc/4tY3mGT5L2YJYgnwxc6hV7Rc3s8/wgmpjbs64+xLYMpuRH
         e2dmfpX/BluM0maChQ1cnMrCampVUnFJYwyqFJyKCWTmLzPjxEerJkt4vu4AgUYoq0qu
         qX7wERfPHQZffa6Gide7PLrzKF/at2M/F8I+nvfzcV0vbKTWnrQCoCjXX2gTJCKRC5Ij
         qSNw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t128si6325128qkd.245.2021.10.12.00.44.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Oct 2021 00:44:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1maCT0-0006C6-HF
	for alex.bennee@linaro.org; Tue, 12 Oct 2021 03:44:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1maCMG-0000Xa-Ij
 for qemu-arm@nongnu.org; Tue, 12 Oct 2021 03:37:58 -0400
Received: from 10.mo548.mail-out.ovh.net ([46.105.77.235]:33037)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1maCM3-0004xR-8u
 for qemu-arm@nongnu.org; Tue, 12 Oct 2021 03:37:56 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.177])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 6EE402110F;
 Tue, 12 Oct 2021 07:37:32 +0000 (UTC)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Tue, 12 Oct
 2021 09:37:30 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R00674b7f126-e028-4693-95cf-565727b05996,
 B93E5558764F88B003587FF4B0B721A638511A69) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 01/18] aspeed/smc: Add watchdog Control/Status Registers
Date: Tue, 12 Oct 2021 09:37:11 +0200
Message-ID: <20211012073728.257748-2-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211012073728.257748-1-clg@kaod.org>
References: <20211012073728.257748-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: a23552ed-bd73-4413-932a-93b73127ab26
X-Ovh-Tracer-Id: 4268005075868617577
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrvddtjedguddvtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=46.105.77.235; envelope-from=clg@kaod.org;
 helo=10.mo548.mail-out.ovh.net
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Delevoryas <pdel@fb.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SpWteGfX5lCO

The Aspeed SoCs have a dual boot function for firmware fail-over
recovery. The system auto-reboots from the second flash if the main
flash does not boot successfully within a certain amount of time. This
function is called alternate boot (ABR) in the FMC controllers.

On AST2400/AST2500, ABR is enabled by hardware strapping in SCU70 to
enable the 2nd watchdog timer, on AST2600, through register SCU510.
If the boot on the the main flash succeeds, the firmware should
disable the 2nd watchdog timer. If not, the BMC is reset and the CE0
and CE1 mappings are swapped to restart the BMC from the 2nd flash.

On the AST2600, the ABR registers controlling the 2nd watchdog timer
were moved from the watchdog register to the FMC controller and the
FMC model should be able to control WDT2 through its own register set.
This requires more work. For now, add dummy read/write handlers to let
the FW disable the 2nd watchdog without error.

Reviewed-by: Peter Delevoryas <pdel@fb.com>
Reported-by: Peter Delevoryas <pdel@fb.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/ssi/aspeed_smc.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 331a2c544635..715f85007d5e 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -124,6 +124,13 @@
 /* SPI dummy cycle data */
 #define R_DUMMY_DATA      (0x54 / 4)
 
+/* FMC_WDT2 Control/Status Register for Alternate Boot (AST2600) */
+#define R_FMC_WDT2_CTRL   (0x64 / 4)
+#define   FMC_WDT2_CTRL_ALT_BOOT_MODE    BIT(6) /* O: 2 chips 1: 1 chip */
+#define   FMC_WDT2_CTRL_SINGLE_BOOT_MODE BIT(5)
+#define   FMC_WDT2_CTRL_BOOT_SOURCE      BIT(4) /* O: primary 1: alternate */
+#define   FMC_WDT2_CTRL_EN               BIT(0)
+
 /* DMA Control/Status Register */
 #define R_DMA_CTRL        (0x80 / 4)
 #define   DMA_CTRL_REQUEST      (1 << 31)
@@ -263,12 +270,18 @@ static void aspeed_2600_smc_dma_ctrl(AspeedSMCState *s, uint32_t value);
 
 #define ASPEED_SMC_FEATURE_DMA       0x1
 #define ASPEED_SMC_FEATURE_DMA_GRANT 0x2
+#define ASPEED_SMC_FEATURE_WDT_CONTROL 0x4
 
 static inline bool aspeed_smc_has_dma(const AspeedSMCState *s)
 {
     return !!(s->ctrl->features & ASPEED_SMC_FEATURE_DMA);
 }
 
+static inline bool aspeed_smc_has_wdt_control(const AspeedSMCState *s)
+{
+    return !!(s->ctrl->features & ASPEED_SMC_FEATURE_WDT_CONTROL);
+}
+
 static const AspeedSMCController controllers[] = {
     {
         .name              = "aspeed.smc-ast2400",
@@ -388,7 +401,8 @@ static const AspeedSMCController controllers[] = {
         .segments          = aspeed_segments_ast2600_fmc,
         .flash_window_base = ASPEED26_SOC_FMC_FLASH_BASE,
         .flash_window_size = 0x10000000,
-        .features          = ASPEED_SMC_FEATURE_DMA,
+        .features          = ASPEED_SMC_FEATURE_DMA |
+                             ASPEED_SMC_FEATURE_WDT_CONTROL,
         .dma_flash_mask    = 0x0FFFFFFC,
         .dma_dram_mask     = 0x3FFFFFFC,
         .nregs             = ASPEED_SMC_R_MAX,
@@ -1019,6 +1033,7 @@ static uint64_t aspeed_smc_read(void *opaque, hwaddr addr, unsigned int size)
         addr == R_CE_CMD_CTRL ||
         addr == R_INTR_CTRL ||
         addr == R_DUMMY_DATA ||
+        (aspeed_smc_has_wdt_control(s) && addr == R_FMC_WDT2_CTRL) ||
         (aspeed_smc_has_dma(s) && addr == R_DMA_CTRL) ||
         (aspeed_smc_has_dma(s) && addr == R_DMA_FLASH_ADDR) ||
         (aspeed_smc_has_dma(s) && addr == R_DMA_DRAM_ADDR) ||
@@ -1350,6 +1365,8 @@ static void aspeed_smc_write(void *opaque, hwaddr addr, uint64_t data,
         s->regs[addr] = value & 0xff;
     } else if (addr == R_DUMMY_DATA) {
         s->regs[addr] = value & 0xff;
+    } else if (aspeed_smc_has_wdt_control(s) && addr == R_FMC_WDT2_CTRL) {
+        s->regs[addr] = value & FMC_WDT2_CTRL_EN;
     } else if (addr == R_INTR_CTRL) {
         s->regs[addr] = value;
     } else if (aspeed_smc_has_dma(s) && addr == R_DMA_CTRL) {
-- 
2.31.1

