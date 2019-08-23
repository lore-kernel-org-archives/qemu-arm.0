Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp966493wrs;
        Fri, 23 Aug 2019 12:22:30 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzPTeGdhvIegb55mlkmbX0FE4e3XtzP7GFG14VjkzVs57Aj7E/t7mztHIHPpwCgtZXEtd2l
X-Received: by 2002:a17:906:135b:: with SMTP id x27mr5729638ejb.291.1566588150791;
        Fri, 23 Aug 2019 12:22:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566588150; cv=none;
        d=google.com; s=arc-20160816;
        b=dsvRWUg02nKGE8+HN7IS1tr4HJkKbybp/uRk4XA5mu16SnE0ZrdFVh3Pd02v7I/s2E
         WFKqvwvHEgFbdvkRcsnF/GkJdpuPT/wCyczunJKUXtx94WZyqGjhVM+oQDAjzSN4R2BM
         7jO2/tLO4MZ8bz6PVGwUQgaItD3oY8tFUuM1IOaB1/fHWTTkmp0J7OvlgksShm8SFZ+6
         DNqWvq5bdqXTC8gM8ZgL9HJiNWFI+enW/7koDXzH5gpuvH/zklpLO4zgXL6bsiGw1MT1
         dnl5p+pMlD1aoFnG3wICVQ8mJgMml1m7AKpZIgGTDC/6cXzmzeSn6cxnzQXaPouclFOU
         DzcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=orZ2MSWmcfHETfgMBr5N+2cZ99iJ3wAPnptkKIV2BMU=;
        b=J3vi7KlGwkDfb+3pH0ccE9kw+wIn+2EKU6WgjGB10q/INE0vGi1+qR73gBVvuEPU7T
         Doo+B6UKg7UsqdyG7IisUeUnn6+//pEmhMQEfyTv53gIZcqJ5Y23LAt/BDGlRb43RWrh
         ofdnG2RQZS8VKrjKDF9urS0yd29eQi9sX4eGdwidF6l7cuLz9kwCp90nkasju6S3DZef
         qEw1SofQGZk9yj+AVY1YXo4LiD6PQOEGApNkUUNXzDYWOxbSpcxytU1o99ukCvuLU8vb
         Ror38nt4nOKoLGOnTDtDANy9uH0XXLGHI5BVw9Tmy+iLk+QyLLRzsO8vZqKASGAAs62h
         sbEg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cx18si1977257ejb.366.2019.08.23.12.22.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Aug 2019 12:22:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Received: from localhost ([::1]:33270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i1F8n-0006az-Pl
	for alex.bennee@linaro.org; Fri, 23 Aug 2019 15:22:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43102)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tony.nguyen@bt.com>) id 1i1EhB-0003Of-Lh
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 14:53:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1i1EhA-0003He-Iy
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 14:53:57 -0400
Received: from nsstlmta03p.bpe.bigpond.com ([203.38.21.3]:57441)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1i1Eh9-0003Fi-Vs; Fri, 23 Aug 2019 14:53:56 -0400
Received: from smtp.telstra.com ([10.10.24.4])
 by nsstlfep03p-svc.bpe.nexus.telstra.com.au with ESMTP id
 <20190823185351.VYAN11604.nsstlfep03p-svc.bpe.nexus.telstra.com.au@smtp.telstra.com>;
 Sat, 24 Aug 2019 04:53:51 +1000
X-RG-Spam: Unknown
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgeduvddrudegkedguddvkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfupfevtfgpvffgnffuvffttedpqfgfvfenuceurghilhhouhhtmecugedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefvohhnhicupfhguhihvghnuceothhonhihrdhnghhuhigvnhessghtrdgtohhmqeenucfkphepheekrddujeefrdelkedrieeknecurfgrrhgrmhephhgvlhhopegusgiirdhtvghlshhtrhgrrdgtohhmrdgruhdpihhnvghtpeehkedrudejfedrleekrdeikedpmhgrihhlfhhrohhmpeeothhonhihrdhnghhuhigvnhessghtrdgtohhmqedprhgtphhtthhopeeophgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgqedprhgtphhtthhopeeoqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrgheqpdhrtghpthhtohepoehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgqedprhgtphhtthhopeeothhonhihrdhnghhuhigvnhessghtrdgtohhmqeenucevlhhushhtvghrufhiiigvpeek
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
X-RG-VS-CLASS: clean
X-Authentication-Info: Submitted using ID tony.nguyen.git@bigpond.com
Received: from dbz.telstra.com.au (58.173.98.68) by smtp.telstra.com (5.8.335)
 (authenticated as tony.nguyen.git@bigpond.com)
 id 5D3692920C8C1DD2; Sat, 24 Aug 2019 04:53:51 +1000
From: Tony Nguyen <tony.nguyen@bt.com>
To: qemu-devel@nongnu.org
Date: Sat, 24 Aug 2019 04:56:35 +1000
Message-Id: <53234db1986b616fc458392fc71408ad2a3526d3.1566467963.git.tony.nguyen@bt.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1566467963.git.tony.nguyen@bt.com>
References: <cover.1566467963.git.tony.nguyen@bt.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 203.38.21.3
Subject: [Qemu-devel] [RFC PATCH 14/17] hw/sd: Declare device little or big
 endian
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
X-TUID: jZNw20JdGwlZ

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

