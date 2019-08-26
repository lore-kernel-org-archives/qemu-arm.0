Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp3973909wrs;
        Mon, 26 Aug 2019 07:28:54 -0700 (PDT)
X-Google-Smtp-Source: APXvYqweo1b2vt9Bq1qJvqstTbTHSZbA3rD7I43FDSMHyLz5hxiy6klBpdQkoPZBYjTbmayawym9
X-Received: by 2002:ae9:ee07:: with SMTP id i7mr16819440qkg.410.1566829734580;
        Mon, 26 Aug 2019 07:28:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566829734; cv=none;
        d=google.com; s=arc-20160816;
        b=02Wm3FtawN9Mw5YwoiXkWH1bepPsQq5gsaTE5w47sLoKr4HPNKAWibIqgzd5JoUiTO
         Ar1OMlMndJtBBsTkfYSe2Cm5YlH3t8NGSVyTNOxhWu3MFvMEPBT7j3i4cGYZLI4NS0t0
         K4acu87BID5UX81a4pCxg49Hu59DmKqha/sq/n/rw7uc4j891FbtpQMv1dyK6sq3IBCi
         mT9/ZzveCbXUV6NMdl31JThDmb5YRF38HqSxD4sxQbQ3v05WP87BbPGZwaZv3Oh7vGcG
         VYJ6Ijasf9SCBHean39a83qNyJkwwvIQct7qqOA+2G8O6OV8e31WIBYyGAoeBaaYiIRA
         wZ1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=reHtVeSwApHYyI+WU+yS7YrPYUH30WcGB+MT+R1CEls=;
        b=InOR0mF+XJKjtgznoknNCEh1kmNBzsgaMELfIb617utIJPX3NyRIel9/CIrK9VtuCP
         Ji5zNraKghJLmJMKkriWtzaSN7Gad4Egm5dSNl9g/3EZNsVP9Z0YCrtNa/HNhaKkrWbt
         D5SxKK/kQaMDBfeKVOKXlsUmbF+fSpqn28uRe8qACLpskYOq2qBU+V9ZwYljqeI0qWXe
         C9rgTGG9m2jEkTMnvzFOO+J2wXudy0iV/IV8Mtjwm/Eo/pzzz2sjwz0EBROzAvF5FWKm
         vxDOJSuOFiEct1T8wnm+sS0y4LHNf4aXbWs2mYXc8XEl62OYoBMz1we02hSf9k6heHIV
         wlZw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m20si7410584qka.276.2019.08.26.07.28.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Aug 2019 07:28:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Received: from localhost ([::1]:53636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i2FzJ-0004Os-ES
	for alex.bennee@linaro.org; Mon, 26 Aug 2019 10:28:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42716)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tony.nguyen@bt.com>) id 1i2Fpe-0004U8-Qd
 for qemu-arm@nongnu.org; Mon, 26 Aug 2019 10:18:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1i2Fpd-0008U6-QW
 for qemu-arm@nongnu.org; Mon, 26 Aug 2019 10:18:54 -0400
Received: from nsstlmta26p.bpe.bigpond.com ([203.38.21.26]:48695)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1i2Fpa-0008Kg-JE; Mon, 26 Aug 2019 10:18:51 -0400
Received: from smtp.telstra.com ([10.10.24.4])
 by nsstlfep26p-svc.bpe.nexus.telstra.com.au with ESMTP id
 <20190826141843.PLVP7601.nsstlfep26p-svc.bpe.nexus.telstra.com.au@smtp.telstra.com>;
 Tue, 27 Aug 2019 00:18:43 +1000
X-RG-Spam: Unknown
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgeduvddrudehgedgjeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuuffpveftpgfvgffnuffvtfetpdfqfgfvnecuuegrihhlohhuthemucegtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepvfhonhihucfpghhuhigvnhcuoehtohhnhidrnhhguhihvghnsegsthdrtghomheqnecukfhppeehkedrudejfedrleekrdeikeenucfrrghrrghmpehhvghlohepuggsiidrthgvlhhsthhrrgdrtghomhdrrghupdhinhgvthepheekrddujeefrdelkedrieekpdhmrghilhhfrhhomhepoehtohhnhidrnhhguhihvghnsegsthdrtghomheqpdhrtghpthhtohepoehpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrgheqpdhrtghpthhtohepoehqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgqedprhgtphhtthhopeeoqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrgheqpdhrtghpthhtohepoehtohhnhidrnhhguhihvghnsegsthdrtghomheqnecuvehluhhsthgvrhfuihiivgeptd
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
X-RG-VS-CLASS: clean
X-Authentication-Info: Submitted using ID tony.nguyen.git@bigpond.com
Received: from dbz.telstra.com.au (58.173.98.68) by smtp.telstra.com (5.8.335)
 (authenticated as tony.nguyen.git@bigpond.com)
 id 5D2D117510588FB3; Tue, 27 Aug 2019 00:18:43 +1000
From: Tony Nguyen <tony.nguyen@bt.com>
To: qemu-devel@nongnu.org
Date: Tue, 27 Aug 2019 00:21:35 +1000
Message-Id: <b3c1b28f728b1f50a2898c25e0371ad1cf869c23.1566829168.git.tony.nguyen@bt.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1566829168.git.tony.nguyen@bt.com>
References: <cover.1566829168.git.tony.nguyen@bt.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 203.38.21.26
Subject: [Qemu-arm] [Qemu-devel] [PATCH 09/19] hw/input: Declare device
 little or big endian
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
Cc: Tony Nguyen <tony.nguyen@bt.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 10ZXiRsecl5I

For each device declared with DEVICE_NATIVE_ENDIAN, find the set of
targets from the set of target/hw/*/device.o.

If the set of targets are all little or all big endian, re-declare
as DEVICE_LITTLE_ENDIAN or DEVICE_BIG_ENDIAN respectively.

Then, on inspection:
- if not used, re-declare as DEVICE_HOST_ENDIAN.
- if max/min size=1, re-declare as DEVICE_HOST_ENDIAN.
- if just a bit bucket, re-declare as DEVICE_HOST_ENDIAN
- if PCI, re-declare as DEVICE_LITTLE_ENDIAN.
- if for {ARM|unicore32} only, re-declare as DEVICE_LITTLE_ENDIAN.
- if for SPARC only, re-declare as DEVICE_BIG_ENDIAN.

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

