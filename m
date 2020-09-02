Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp374469lfc;
        Wed, 2 Sep 2020 02:34:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxjBv2Zb1yd5SSLfrivAbCXTLkjDRJdesvsQnnxgTWzUV2OMHAQAwtsdTUMT7x7nNdYmW+X
X-Received: by 2002:a05:6902:6c8:: with SMTP id m8mr8337926ybt.153.1599039296774;
        Wed, 02 Sep 2020 02:34:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599039296; cv=none;
        d=google.com; s=arc-20160816;
        b=y6G12W4C6Z3YFTrYY+iA99EWEJ3y/6s5oRrY7SZCSX4Yxro3+HCKdJhhZDb6teBOwd
         LrmSR554m42di4lwjPHFPBOCiH5flP6EhwPlcQ7NyOUq6tSXM6tiDVuBDFhG1d6bM6Rb
         lf19O9q83QveR9sQ9i3fc8w8QyzQMXXwin7533/ZZUqCb+3LEKY+0fZk3CFMCgqdaNDG
         o1WRWXBJ/XWne5uzg0L1Bnt/hV85dVxQrTpyapQbTwyQq9w4jl9QMkaQYESevoE3eKwz
         30VmoCsBAkK6KMg0m+Bs4eoWYRRnxpbkgFP+IQMKenN4/tvnYAKNwTMjeyR+ub0o58C7
         Wu0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=vBzqWfr0nXh5snb96gJAFIsrteKzwCdgU0+s+n9YQ9A=;
        b=SY6IFeK9kqUVO5KqMYrPJfNLgCOZ4cqkv4YkwKH+Fni5lLFgi9TQZMaNwB6l6+38Mp
         J4gfHhbOH2of7iolsctULAOD27XrIN6RJ3SYIFIkIkDrM0bNPJSF024/mBZHpU03qPv/
         p5M2yQttmXPne3/KIgMYFJo/UhtovC5ic0Eola9TeRWzN/RipPN5ixEQ3QmXIlo06AdY
         jpOkA3Ek+L+DkxiW69nW3V3Tgbgeges1OYs18p31CIIitsb8tp3wppDfkrAycvc2WI7C
         TXCyuOrfKUgqH8qYgHW9mHf3yjeMz/t9GqpuWA5VJhPpHJbqgox//LACxqu0JjknqvWq
         IiVg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i199si3954517ybg.270.2020.09.02.02.34.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Sep 2020 02:34:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kDPAO-0007Ny-5O
	for alex.bennee@linaro.org; Wed, 02 Sep 2020 05:34:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1kDP6v-0001NB-95; Wed, 02 Sep 2020 05:31:21 -0400
Received: from smtpout1.mo804.mail-out.ovh.net ([79.137.123.220]:47811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1kDP6r-0004Yx-CS; Wed, 02 Sep 2020 05:31:20 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.217])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id 8EC1E5D1903C;
 Wed,  2 Sep 2020 11:31:14 +0200 (CEST)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Wed, 2 Sep 2020
 11:31:12 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R001ce88ab86-4e22-48a0-9d8a-6ba7b98f6063,
 725C0B02AD5EA5A9EE23B5614217EC25792C566F) smtp.auth=clg@kaod.org
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v2 9/9] aspeed/smc: Add support for RDSFDP command
Date: Wed, 2 Sep 2020 11:31:07 +0200
Message-ID: <20200902093107.608000-10-clg@kaod.org>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200902093107.608000-1-clg@kaod.org>
References: <20200902093107.608000-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: c2758f96-87f8-4361-8a7c-1be6f7f0f2b0
X-Ovh-Tracer-Id: 7376896193109461868
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedrudefledgudejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfhisehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheehfeegjeeitdfffeetjeduveejueefuefgtdefueelueetveeliefhhffgtdelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout1.mo804.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/02 04:59:26
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VkvGNzAXbksu

Modify the snooping routine to handle RDSFDP, 1 dummy and 3 bytes
address space.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/ssi/aspeed_smc.h |  1 +
 hw/ssi/aspeed_smc.c         | 21 ++++++++++++++-------
 2 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
index 6fbbb238f158..5f477eb9cf97 100644
--- a/include/hw/ssi/aspeed_smc.h
+++ b/include/hw/ssi/aspeed_smc.h
@@ -115,6 +115,7 @@ typedef struct AspeedSMCState {
 
     AspeedSMCFlash *flashes;
 
+    uint8_t snoop_addr_width;
     uint8_t snoop_index;
     uint8_t snoop_dummies;
 } AspeedSMCState;
diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 795784e5f364..594f34668e7a 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -778,10 +778,15 @@ typedef enum {
     PP = 0x2,           PP_4 = 0x12,
     DPP = 0xa2,
     QPP = 0x32,         QPP_4 = 0x34,
+    RDSFDP = 0x5a,
 } FlashCMD;
 
-static int aspeed_smc_num_dummies(uint8_t command)
+static int aspeed_smc_num_dummies(AspeedSMCFlash *fl, uint8_t command)
 {
+    AspeedSMCState *s = fl->controller;
+
+    s->snoop_addr_width = aspeed_smc_flash_is_4byte(fl) ? 4 : 3;
+
     switch (command) { /* check for dummies */
     case READ: /* no dummy bytes/cycles */
     case PP:
@@ -798,6 +803,9 @@ static int aspeed_smc_num_dummies(uint8_t command)
     case DOR_4:
     case QOR_4:
         return 1;
+    case RDSFDP:
+        s->snoop_addr_width = 3;
+        return 1;
     case DIOR:
     case DIOR_4:
         return 2;
@@ -813,8 +821,6 @@ static bool aspeed_smc_do_snoop(AspeedSMCFlash *fl,  uint64_t data,
                                 unsigned size)
 {
     AspeedSMCState *s = fl->controller;
-    uint8_t addr_width = aspeed_smc_flash_is_4byte(fl) ? 4 : 3;
-
     trace_aspeed_smc_do_snoop(fl->id, s->snoop_index, s->snoop_dummies,
                               (uint8_t) data & 0xff);
 
@@ -823,7 +829,7 @@ static bool aspeed_smc_do_snoop(AspeedSMCFlash *fl,  uint64_t data,
 
     } else if (s->snoop_index == SNOOP_START) {
         uint8_t cmd = data & 0xff;
-        int ndummies = aspeed_smc_num_dummies(cmd);
+        int ndummies = aspeed_smc_num_dummies(fl, cmd);
 
         /*
          * No dummy cycles are expected with the current command. Turn
@@ -836,7 +842,7 @@ static bool aspeed_smc_do_snoop(AspeedSMCFlash *fl,  uint64_t data,
 
         s->snoop_dummies = ndummies * 8;
 
-    } else if (s->snoop_index >= addr_width + 1) {
+    } else if (s->snoop_index >= s->snoop_addr_width + 1) {
 
         /* The SPI transfer has reached the dummy cycles sequence */
         for (; s->snoop_dummies; s->snoop_dummies--) {
@@ -1407,10 +1413,11 @@ static void aspeed_smc_realize(DeviceState *dev, Error **errp)
 
 static const VMStateDescription vmstate_aspeed_smc = {
     .name = "aspeed.smc",
-    .version_id = 2,
-    .minimum_version_id = 2,
+    .version_id = 3,
+    .minimum_version_id = 3,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32_ARRAY(regs, AspeedSMCState, ASPEED_SMC_R_MAX),
+        VMSTATE_UINT8(snoop_addr_width, AspeedSMCState),
         VMSTATE_UINT8(snoop_index, AspeedSMCState),
         VMSTATE_UINT8(snoop_dummies, AspeedSMCState),
         VMSTATE_END_OF_LIST()
-- 
2.25.4

