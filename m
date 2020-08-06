Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp1634375lfy;
        Thu, 6 Aug 2020 06:28:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJztoX7eeKldYlqInttqk0V+sqKyIi6m27Q7U+P5UENvvoT9hpDOs1WzzNTfE9DqVWrYlp10
X-Received: by 2002:a25:cfcc:: with SMTP id f195mr13605460ybg.490.1596720518947;
        Thu, 06 Aug 2020 06:28:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596720518; cv=none;
        d=google.com; s=arc-20160816;
        b=dcCZ2Qa2DE+tBYZL/pHuvSltjlMJfcZ21V06brF9zZVyRPzTRcRuvy646i+/vmCYCP
         AMDBUlxg43I8F8tvJpuRxqEg1LcatcnjF/ekOQx5EOn1zp2MH8l+e4SKEaFL0LMY0ogE
         CkwP9Mweb6b4q/7wWwQekt9i+OZLzGmPFDJCf9JTYz8JbOOOjIHLKhZxSchcmaTj49gd
         ENfeJPtiO4eCs/2aZxbeX1d3SXvAMmGw4Zjf/COL47WFGU3uIavTZoNQ0mrnBLRgQ6Ht
         h83N9vIK6vJ2veP/sTFW/WycNtCZUBT8kmZ8U4XoMS81Om4LqBHrsBPbLEJ8JM0J5fcL
         ur+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=88rtCuBiydX8f+fIA5XVfKX4YPTsMtUcsV8Lt9wg3mI=;
        b=cYWD8u5XOSrEUDTYAdej8b8gstIK8dCURU/kTkGNGZh6gzLI4acYrLKy8uefyyTr32
         VKH2Fqpju1LiV9BgICcwgaSgWPRnAnZbVFj80JVaWxQjJnpLGWMwJBKKF+1uNqYrqRr6
         IK9ZH7n//oXSWM4n0k72UaFJOJvi1CxVRkOtFH/11tiC2Qm6QKTQkOJalJ3U/iltvWvh
         LbaLXnVIxr4B5wTZAWk78tn9otiLtZQp/ixBvcsoDZak9n3tQCldd6A4kMJN7UqJm2Qd
         CBQBuGQ9iY6+aUjm2hMWY3A82/H4iycwC6ktGM9tVRefUm61teSkmskoR623wTu+pG9i
         Hl4A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a2si4688281ybi.478.2020.08.06.06.28.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Aug 2020 06:28:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k3fwk-0006CB-8c
	for alex.bennee@linaro.org; Thu, 06 Aug 2020 09:28:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1k3fq3-0002Cq-PD; Thu, 06 Aug 2020 09:21:43 -0400
Received: from smtpout1.mo804.mail-out.ovh.net ([79.137.123.220]:41577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1k3fq0-0000wV-VB; Thu, 06 Aug 2020 09:21:43 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.186])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id 0A09F545F8BA;
 Thu,  6 Aug 2020 15:21:17 +0200 (CEST)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Thu, 6 Aug 2020
 15:21:16 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G0053b259ba8-9061-43a1-ac9b-5d36f921febd,
 96EDEDBD7B7627A0205C40E9E2B74F8D513A659B) smtp.auth=clg@kaod.org
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH for-5.2 18/19] aspeed/sdmc: Simplify calculation of RAM bits
Date: Thu, 6 Aug 2020 15:21:05 +0200
Message-ID: <20200806132106.747414-19-clg@kaod.org>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200806132106.747414-1-clg@kaod.org>
References: <20200806132106.747414-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: ed9922f2-1659-4b09-b846-fdfae24301c8
X-Ovh-Tracer-Id: 273593679662844710
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedrkedtgdeihecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehheefgeejiedtffefteejudevjeeufeeugfdtfeeuleeuteevleeihffhgfdtleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpeelnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout1.mo804.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/06 09:21:12
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2eiF2EB48vyQ

Changes in commit 533eb415df2e ("arm/aspeed: actually check RAM size")
introduced a 'valid_ram_sizes' array which can be used to compute the
associated bit field value encoding the RAM size. The field is simply
the index of the array.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/misc/aspeed_sdmc.c | 79 ++++++++++++++-----------------------------
 1 file changed, 25 insertions(+), 54 deletions(-)

diff --git a/hw/misc/aspeed_sdmc.c b/hw/misc/aspeed_sdmc.c
index 81c73450ab5d..08f856cbda7e 100644
--- a/hw/misc/aspeed_sdmc.c
+++ b/hw/misc/aspeed_sdmc.c
@@ -159,57 +159,6 @@ static const MemoryRegionOps aspeed_sdmc_ops = {
     .valid.max_access_size = 4,
 };
 
-static int ast2400_rambits(AspeedSDMCState *s)
-{
-    switch (s->ram_size >> 20) {
-    case 64:
-        return ASPEED_SDMC_DRAM_64MB;
-    case 128:
-        return ASPEED_SDMC_DRAM_128MB;
-    case 256:
-        return ASPEED_SDMC_DRAM_256MB;
-    case 512:
-        return ASPEED_SDMC_DRAM_512MB;
-    default:
-        g_assert_not_reached();
-        break;
-    }
-}
-
-static int ast2500_rambits(AspeedSDMCState *s)
-{
-    switch (s->ram_size >> 20) {
-    case 128:
-        return ASPEED_SDMC_AST2500_128MB;
-    case 256:
-        return ASPEED_SDMC_AST2500_256MB;
-    case 512:
-        return ASPEED_SDMC_AST2500_512MB;
-    case 1024:
-        return ASPEED_SDMC_AST2500_1024MB;
-    default:
-        g_assert_not_reached();
-        break;
-    }
-}
-
-static int ast2600_rambits(AspeedSDMCState *s)
-{
-    switch (s->ram_size >> 20) {
-    case 256:
-        return ASPEED_SDMC_AST2600_256MB;
-    case 512:
-        return ASPEED_SDMC_AST2600_512MB;
-    case 1024:
-        return ASPEED_SDMC_AST2600_1024MB;
-    case 2048:
-        return ASPEED_SDMC_AST2600_2048MB;
-    default:
-        g_assert_not_reached();
-        break;
-    }
-}
-
 static void aspeed_sdmc_reset(DeviceState *dev)
 {
     AspeedSDMCState *s = ASPEED_SDMC(dev);
@@ -324,10 +273,32 @@ static const TypeInfo aspeed_sdmc_info = {
     .abstract   = true,
 };
 
+static int aspeed_sdmc_get_ram_bits(AspeedSDMCState *s)
+{
+    AspeedSDMCClass *asc = ASPEED_SDMC_GET_CLASS(s);
+    int i;
+
+    /*
+     * The bitfield value encoding the RAM size is the index of the
+     * possible RAM size array
+     */
+    for (i = 0; asc->valid_ram_sizes[i]; i++) {
+        if (s->ram_size == asc->valid_ram_sizes[i]) {
+            return i;
+        }
+    }
+
+    /*
+     * Invalid RAM sizes should have been excluded when setting the
+     * SoC RAM size.
+     */
+    g_assert_not_reached();
+}
+
 static uint32_t aspeed_2400_sdmc_compute_conf(AspeedSDMCState *s, uint32_t data)
 {
     uint32_t fixed_conf = ASPEED_SDMC_VGA_COMPAT |
-        ASPEED_SDMC_DRAM_SIZE(ast2400_rambits(s));
+        ASPEED_SDMC_DRAM_SIZE(aspeed_sdmc_get_ram_bits(s));
 
     /* Make sure readonly bits are kept */
     data &= ~ASPEED_SDMC_READONLY_MASK;
@@ -385,7 +356,7 @@ static uint32_t aspeed_2500_sdmc_compute_conf(AspeedSDMCState *s, uint32_t data)
     uint32_t fixed_conf = ASPEED_SDMC_HW_VERSION(1) |
         ASPEED_SDMC_VGA_APERTURE(ASPEED_SDMC_VGA_64MB) |
         ASPEED_SDMC_CACHE_INITIAL_DONE |
-        ASPEED_SDMC_DRAM_SIZE(ast2500_rambits(s));
+        ASPEED_SDMC_DRAM_SIZE(aspeed_sdmc_get_ram_bits(s));
 
     /* Make sure readonly bits are kept */
     data &= ~ASPEED_SDMC_AST2500_READONLY_MASK;
@@ -451,7 +422,7 @@ static uint32_t aspeed_2600_sdmc_compute_conf(AspeedSDMCState *s, uint32_t data)
 {
     uint32_t fixed_conf = ASPEED_SDMC_HW_VERSION(3) |
         ASPEED_SDMC_VGA_APERTURE(ASPEED_SDMC_VGA_64MB) |
-        ASPEED_SDMC_DRAM_SIZE(ast2600_rambits(s));
+        ASPEED_SDMC_DRAM_SIZE(aspeed_sdmc_get_ram_bits(s));
 
     /* Make sure readonly bits are kept (use ast2500 mask) */
     data &= ~ASPEED_SDMC_AST2500_READONLY_MASK;
-- 
2.25.4

