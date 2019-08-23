Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp949510wrs;
        Fri, 23 Aug 2019 12:06:04 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy7a7dbeH2NLcMQQV6CLl73iV+9hg93J5dYFxuelpUiGlCV+DfuQJWx4QSxIJ1XU3i7Yb4x
X-Received: by 2002:ad4:4752:: with SMTP id c18mr5425797qvx.69.1566587164212;
        Fri, 23 Aug 2019 12:06:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566587164; cv=none;
        d=google.com; s=arc-20160816;
        b=HonchgI/N2FHjTYSgNZujbG81PPAyBb8Jl0d6wO8LBKGURc3dqCUlfdItOV5MNo7Gy
         L8TNZ5uumypd6AwRwMQ5Op1lrgbd01g16JqfAimKcQWcAs1EwYGNcPn6A5PGskzsivxL
         gPQvlY27KsKiABcR1716U1oKeY8K4pRSmlIGpt21rn42FJDk/T6Zon7M+njmmKgoYkl/
         Ei70k1MMJi2MA0lpq7JqKBuAy6l7Sgl+Z+zZsBQpWjf4ATpFlJmH4yMIWJ/9LynMgT9n
         LvmU7TT9NVqw5lgLTWQRyDbujS5tgbUNDAB3w2v0gAVHiqnyOr6doYuhZRerx6xyCytO
         5Lxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=FMk2aWrXI9HiP57Jc8QOkTYverfNQF6AIT5bI3KD/Tw=;
        b=RU6Xfyhy1U8M9+TkYo5FxVFDHdoqD06UgEKExxXxFMZR80O4b6AUM1HeBSeUFtMDNj
         JBREnJ1pR+exvBPdtyJRepOuvQC5+UqarWmkWRL3uC2ZGmRwa7WFW6ycs8Zx6O6YrfYz
         Iizq4/9vAuL8e5eh4WfiP3lUlF0FOqA+eIqTiWAzKmOMScnGwamAMH011SyYQr1X3DeO
         tYEN6mep3ttulprAv3YqPVTbjRMBRjgXXzp0S/wPH83Kb3MmqO80kSYn/VIv0qKTsefE
         EzMRGAnncraTW6K+sItO15oK8uL00Gxj5HLJqjn2uf8NnUhCO0HCi22lbSODRIvh2614
         FZMw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s35si2836031qvc.145.2019.08.23.12.06.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Aug 2019 12:06:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Received: from localhost ([::1]:33042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i1Ess-0005pk-QX
	for alex.bennee@linaro.org; Fri, 23 Aug 2019 15:06:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42951)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tony.nguyen@bt.com>) id 1i1Egt-0002ti-8w
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 14:53:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1i1Egs-00039S-68
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 14:53:39 -0400
Received: from nsstlmta32p.bpe.bigpond.com ([203.38.21.32]:48914)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1i1Egr-00037C-Iv; Fri, 23 Aug 2019 14:53:38 -0400
Received: from smtp.telstra.com ([10.10.24.4])
 by nsstlfep32p-svc.bpe.nexus.telstra.com.au with ESMTP id
 <20190823185333.FAAV21924.nsstlfep32p-svc.bpe.nexus.telstra.com.au@smtp.telstra.com>;
 Sat, 24 Aug 2019 04:53:33 +1000
X-RG-Spam: Unknown
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgeduvddrudegkedguddvkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfupfevtfgpvffgnffuvffttedpqfgfvfenuceurghilhhouhhtmecugedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefvohhnhicupfhguhihvghnuceothhonhihrdhnghhuhigvnhessghtrdgtohhmqeenucfkphepheekrddujeefrdelkedrieeknecurfgrrhgrmhephhgvlhhopegusgiirdhtvghlshhtrhgrrdgtohhmrdgruhdpihhnvghtpeehkedrudejfedrleekrdeikedpmhgrihhlfhhrohhmpeeothhonhihrdhnghhuhigvnhessghtrdgtohhmqedprhgtphhtthhopeeophgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgqedprhgtphhtthhopeeoqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrgheqpdhrtghpthhtohepoehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgqedprhgtphhtthhopeeothhonhihrdhnghhuhigvnhessghtrdgtohhmqeenucevlhhushhtvghrufhiiigvpeef
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
X-RG-VS-CLASS: clean
X-Authentication-Info: Submitted using ID tony.nguyen.git@bigpond.com
Received: from dbz.telstra.com.au (58.173.98.68) by smtp.telstra.com (5.8.335)
 (authenticated as tony.nguyen.git@bigpond.com)
 id 5D3692920C8C1968; Sat, 24 Aug 2019 04:53:33 +1000
From: Tony Nguyen <tony.nguyen@bt.com>
To: qemu-devel@nongnu.org
Date: Sat, 24 Aug 2019 04:56:29 +1000
Message-Id: <8d3f60f5d558d5ea1c9cc8c93d35791b41e67f74.1566467963.git.tony.nguyen@bt.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1566467963.git.tony.nguyen@bt.com>
References: <cover.1566467963.git.tony.nguyen@bt.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 203.38.21.32
Subject: [Qemu-devel] [RFC PATCH 08/17] hw/input: Declare device little or
 big endian
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
Cc: Tony Nguyen <tony.nguyen@bt.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: e9dtZVTqirdH

For each device declared with DEVICE_NATIVE_ENDIAN, find the set of
targets from the set of target/hw/*/device.o.

If the set of targets are all little or all big endian, re-declare
the device endianness as DEVICE_LITTLE_ENDIAN or DEVICE_BIG_ENDIAN
respectively.

This *naive* deduction may result in genuinely native endian devices
being incorrectly declared as little or big endian, but should not
introduce regressions for current targets.

These devices should be re-declared as DEVICE_NATIVE_ENDIAN if 1) it
has a new target with an opposite endian or 2) someone informed knows
better =)

Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
---
 hw/input/pl050.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/input/pl050.c b/hw/input/pl050.c
index 1123037b38..873f44abad 100644
--- a/hw/input/pl050.c
+++ b/hw/input/pl050.c
@@ -139,7 +139,7 @@ static void pl050_write(void *opaque, hwaddr offset,
 static const MemoryRegionOps pl050_ops = {
     .read = pl050_read,
     .write = pl050_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
 static void pl050_realize(DeviceState *dev, Error **errp)
-- 
2.23.0

