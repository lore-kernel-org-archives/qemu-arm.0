Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp3973562wrs;
        Mon, 26 Aug 2019 07:28:31 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyXNmtG/wTiNCOICZMAdmNU3I77jF8SjiHWl46qRfHp9LggvRjS5xHP8ADWheufdm2RsvGP
X-Received: by 2002:a0c:b355:: with SMTP id a21mr15824327qvf.73.1566829710925;
        Mon, 26 Aug 2019 07:28:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566829710; cv=none;
        d=google.com; s=arc-20160816;
        b=qaTUg+EObmWAO/PHUwkBpFAM4g3nzhc1i0yl9UJlHSyBpVXBu53Uwj5C3qp1hyimbC
         5JN0TrxA1hNLRNctWH8O/5bcJrhvTr/SKiAJArN49JthW2RmnCW1Vb5zlJergFz4p4k3
         38AYCk/ZHUvHWI2fKKk/pRKTDNjhHK82gF3c9vzsazhxbxtUtXPWXOHZTtuZ8x2gLmQm
         1kBh2wnLcYBgKZmFmcG+DkmC5JM+BF9zHEnfsej7EvE9lix8yNs1ajVPNZTEa3kOQY9f
         gQFCVMnj7mBRBjZ0efSR4iK9KbKV3eKM/941ODvvo49+IuWIBquOSLTgITqOjctLlZKL
         QhHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=EJIXn35PjHtBllneyNN6fz+jZFei7F9KtICryr+7GDw=;
        b=T4hAH7sVZQs7679hE0n4DcC1opNiW0MIoQHqvDPkdUSZTFKycQOH6Pajk1TSLGutOA
         sgd3BCSa63IS7sY6w16ZqRTcBEK9WpcFcWPykfY1VoaOzbS3o/Ieay3Z2bR0e+CJHiow
         WVhrLFty6taUCcoXgHXuGg6qye1iLmF/+xGsTDVJsDu5OAjgR4hbjE8kdvb/TSgWFkcE
         nsLXNjAi03CZIoxHJA2yljE5GMj+3f4J4TqkCUagJs6qZbOKxlMu9NNUycS/XtEhB8c8
         w5/xBo2RIbvMvdoX7MPwL5CrWU+vMQ7TPcoE1Rll8k6W4ahVzIIu/n5RI4yPyzGcqc1+
         RoJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q7si7759600qve.26.2019.08.26.07.28.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Aug 2019 07:28:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Received: from localhost ([::1]:53634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i2Fyv-00048H-UJ
	for alex.bennee@linaro.org; Mon, 26 Aug 2019 10:28:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42956)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tony.nguyen@bt.com>) id 1i2FqF-0004hJ-AW
 for qemu-arm@nongnu.org; Mon, 26 Aug 2019 10:19:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1i2FqE-0000pN-98
 for qemu-arm@nongnu.org; Mon, 26 Aug 2019 10:19:31 -0400
Received: from nsstlmta10p.bpe.bigpond.com ([203.38.21.10]:52373)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1i2Fq9-0000iU-Lu; Mon, 26 Aug 2019 10:19:26 -0400
Received: from smtp.telstra.com ([10.10.24.4])
 by nsstlfep10p-svc.bpe.nexus.telstra.com.au with ESMTP id
 <20190826141920.RFIB6772.nsstlfep10p-svc.bpe.nexus.telstra.com.au@smtp.telstra.com>;
 Tue, 27 Aug 2019 00:19:20 +1000
X-RG-Spam: Unknown
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgeduvddrudehgedgjeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuuffpveftpgfvgffnuffvtfetpdfqfgfvnecuuegrihhlohhuthemucegtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepvfhonhihucfpghhuhigvnhcuoehtohhnhidrnhhguhihvghnsegsthdrtghomheqnecukfhppeehkedrudejfedrleekrdeikeenucfrrghrrghmpehhvghlohepuggsiidrthgvlhhsthhrrgdrtghomhdrrghupdhinhgvthepheekrddujeefrdelkedrieekpdhmrghilhhfrhhomhepoehtohhnhidrnhhguhihvghnsegsthdrtghomheqpdhrtghpthhtohepoehpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrgheqpdhrtghpthhtohepoehqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgqedprhgtphhtthhopeeoqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrgheqpdhrtghpthhtohepoehtohhnhidrnhhguhihvghnsegsthdrtghomheqnecuvehluhhsthgvrhfuihiivgepud
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
X-RG-VS-CLASS: clean
X-Authentication-Info: Submitted using ID tony.nguyen.git@bigpond.com
Received: from dbz.telstra.com.au (58.173.98.68) by smtp.telstra.com (5.8.335)
 (authenticated as tony.nguyen.git@bigpond.com)
 id 5D3692920D8AE26B; Tue, 27 Aug 2019 00:19:20 +1000
From: Tony Nguyen <tony.nguyen@bt.com>
To: qemu-devel@nongnu.org
Date: Tue, 27 Aug 2019 00:21:42 +1000
Message-Id: <6872c03a28301c3e421b9ae8b1aa9555c5c26f90.1566829168.git.tony.nguyen@bt.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1566829168.git.tony.nguyen@bt.com>
References: <cover.1566829168.git.tony.nguyen@bt.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 203.38.21.10
Subject: [Qemu-arm] [Qemu-devel] [PATCH 16/19] hw/sd: Declare device little
 or big endian
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
X-TUID: z/93YDxTz8ym

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
 hw/sd/pl181.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/sd/pl181.c b/hw/sd/pl181.c
index 8033fe455d..f19d8764e8 100644
--- a/hw/sd/pl181.c
+++ b/hw/sd/pl181.c
@@ -451,7 +451,7 @@ static void pl181_write(void *opaque, hwaddr offset,
 static const MemoryRegionOps pl181_ops = {
     .read = pl181_read,
     .write = pl181_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
 static void pl181_reset(DeviceState *d)
-- 
2.23.0

