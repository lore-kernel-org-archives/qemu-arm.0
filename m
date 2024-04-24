Received: by 2002:a17:906:c0c2:b0:a52:4db9:938b with SMTP id bn2csp810977ejb;
        Wed, 24 Apr 2024 11:14:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVxooYe7F20p/LTNyLf7TwA20DY7tmrvMTjQ8iS2gbLq7/UDTkozCjkd4/o843FLA49Ndq748jlNEDcEWQCzGV0YRXS0MyV
X-Google-Smtp-Source: AGHT+IEGGvzgiHP4E9bMGQDobUCFx8hZkKRGxeHsqdMjCKTtwo2xG08bjETVah7MmwNZw2iG8aY4
X-Received: by 2002:a05:6358:848c:b0:183:861a:a6ff with SMTP id e12-20020a056358848c00b00183861aa6ffmr3055751rwk.1.1713982478753;
        Wed, 24 Apr 2024 11:14:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713982478; cv=none;
        d=google.com; s=arc-20160816;
        b=VAHsgUBpS6Vd1ni2h7yY80JGSNcTZfrrmssivpNFrOApdosqFojv9ObaMXGRjF6HI2
         B6kBWwC3Klia0i7LKHTdrOehaaxnEVcC6rxu1Ahb2p0tQ51Mekljd1pFswpxkpNZeWwo
         0YZXQlp7CPHt5ctcjEk4C6F8djGH+0V2M8fjDqBVjEz54MlK5b77Nk6KSXlr6OvsLvQe
         tnpM6JSVXSM2bYuksTHypFvLkiYEbFh2sXVjwRe4jy+LNB9UrHQqztwJIyAixfent7ei
         qot3m1d+bUObgNMlbE/aNR/YxRj2JvmOGf/J/LmZb+KKG2Z+wppZWz4+KdnnO6qhAhoE
         nqcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=UHWs8LIrG1WYH9nhj3Pr1HnfysQlYX7vDPjTs+rne84=;
        fh=/0MHjUAmI/wL40Gy3mvvC19IqtVRkTQxODnHjMieUFU=;
        b=Xr+c4WhfH0Mxo3HWr4StEYKf+TwZRmhNsGK3xYdoq/Ekt+1AwlETizIuwRT/S8Z1Uz
         3t4g/qC6Osp2/WL8c8yjuXvzE4vo7VgrT2JOVdyP2AYiGBpZwrVa8ACLr0niaUWt7O3G
         LCnvBW6CPM9G/0tvG2j2jUTNU6y6z8gtUevZO/u9uT7wQc3sjxJLyPytcXjzWwHmY6NA
         Z5I7N0n6np4DrsXBQaflPL2RcmXeVysdfm1KHqI648DpjrmRXJq/2Nl2BfFKWZR9ZiZ/
         OQAYDBCfZLzDqztEqkRxUnNkPtq0RmvJeVXzGOVReCBBn1tTn1aqnWvYMC5nyGcoI/3y
         aKUw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bm6-20020a056102510600b0047bab06ed08si2804160vsb.300.2024.04.24.11.14.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Apr 2024 11:14:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rzh7z-0007LM-VP; Wed, 24 Apr 2024 14:13:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adiupina@astralinux.ru>)
 id 1rzh7v-0007KB-IS; Wed, 24 Apr 2024 14:13:51 -0400
Received: from new-mail.astralinux.ru ([51.250.53.164])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adiupina@astralinux.ru>)
 id 1rzh7s-0005QZ-S7; Wed, 24 Apr 2024 14:13:51 -0400
Received: from rbta-msk-lt-302690.astralinux.ru (unknown [10.177.232.60])
 by new-mail.astralinux.ru (Postfix) with ESMTPA id 4VPnDS4tVszqSSK;
 Wed, 24 Apr 2024 21:13:44 +0300 (MSK)
From: Alexandra Diupina <adiupina@astralinux.ru>
To: Alistair Francis <alistair@alistair23.me>
Cc: Alexandra Diupina <adiupina@astralinux.ru>,
 "Konrad, Frederic" <Frederic.Konrad@amd.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, sdl.qemu@linuxtesting.org
Subject: [PATCH] fix bit fields extraction and prevent overflow
Date: Wed, 24 Apr 2024 21:13:21 +0300
Message-Id: <20240424181321.20844-2-adiupina@astralinux.ru>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <CAFEAcA-=kk_TQVRLLQvH96DC-ffmDqd_hU5=z=Og8ntYGxPUeg@mail.gmail.com>
References: <20240424181321.20844-1-adiupina@astralinux.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DrWeb-SpamScore: -100
X-DrWeb-SpamState: legit
X-DrWeb-SpamDetail: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehuddgtddvucetufdoteggodetrfcurfhrohhfihhlvgemucfftfghgfeunecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeetlhgvgigrnhgurhgrucffihhuphhinhgruceorgguihhuphhinhgrsegrshhtrhgrlhhinhhugidrrhhuqeenucggtffrrghtthgvrhhnpeefkedufedvkeffuedtgfdugeeutdegvdffffejfffgleffieduhfejvdelffdvudenucffohhmrghinheplhhinhhugihtvghsthhinhhgrdhorhhgnecukfhppedutddrudejjedrvdefvddriedtnecurfgrrhgrmhephhgvlhhopehrsghtrgdqmhhskhdqlhhtqdeftddvieeltddrrghsthhrrghlihhnuhigrdhruhdpihhnvghtpedutddrudejjedrvdefvddriedtmeehieegjedvpdhmrghilhhfrhhomheprgguihhuphhinhgrsegrshhtrhgrlhhinhhugidrrhhupdhnsggprhgtphhtthhopeekpdhrtghpthhtoheprghlihhsthgrihhrsegrlhhishhtrghirhdvfedrmhgvpdhrtghpthhtoheprgguihhuphhinhgrsegrshhtrhgrlhhinhhugidrrhhupdhrtghpthhtohephfhrvgguvghrihgtrdfmohhnrhgrugesrghmugdrtghomhdprhgtphhtthhopegvughgrghrrdhighhlvghsihgrshesghhmrghilhdrtghomhdprhgtphhtthhope
 hpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrghdprhgtphhtthhopehqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdprhgtphhtthhopehsughlrdhqvghmuheslhhinhhugihtvghsthhinhhgrdhorhhg
X-DrWeb-SpamVersion: Vade Retro 01.423.251#02 AS+AV+AP Profile: DRWEB;
 Bailout: 300
X-AntiVirus: Checked by Dr.Web [MailD: 11.1.19.2307031128,
 SE: 11.1.12.2210241838, Core engine: 7.00.62.01180, Virus records: 12628730,
 Updated: 2024-Apr-24 16:23:42 UTC]
Received-SPF: pass client-ip=51.250.53.164;
 envelope-from=adiupina@astralinux.ru; helo=new-mail.astralinux.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Gm/ZdnKi8Lxt

Add a type cast and use extract64() instead of extract32()
to avoid integer overflow on addition. Fix bit fields
extraction according to documentation.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: d3c6369a96 ("introduce xlnx-dpdma")
Signed-off-by: Alexandra Diupina <adiupina@astralinux.ru>
---
 hw/dma/xlnx_dpdma.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/hw/dma/xlnx_dpdma.c b/hw/dma/xlnx_dpdma.c
index 1f5cd64ed1..52e8c594fe 100644
--- a/hw/dma/xlnx_dpdma.c
+++ b/hw/dma/xlnx_dpdma.c
@@ -175,24 +175,24 @@ static uint64_t xlnx_dpdma_desc_get_source_address(DPDMADescriptor *desc,
 
     switch (frag) {
     case 0:
-        addr = desc->source_address
-            + (extract32(desc->address_extension, 16, 12) << 20);
+        addr = (uint64_t)desc->source_address
+            + (extract64(desc->address_extension, 16, 12) << 20);
         break;
     case 1:
-        addr = desc->source_address2
-            + (extract32(desc->address_extension_23, 0, 12) << 8);
+        addr = (uint64_t)desc->source_address2
+            + (extract64(desc->address_extension_23, 0, 12) << 8);
         break;
     case 2:
-        addr = desc->source_address3
-            + (extract32(desc->address_extension_23, 16, 12) << 20);
+        addr = (uint64_t)desc->source_address3
+            + (extract64(desc->address_extension_23, 16, 12) << 20);
         break;
     case 3:
-        addr = desc->source_address4
-            + (extract32(desc->address_extension_45, 0, 12) << 8);
+        addr = (uint64_t)desc->source_address4
+            + (extract64(desc->address_extension_45, 0, 12) << 8);
         break;
     case 4:
-        addr = desc->source_address5
-            + (extract32(desc->address_extension_45, 16, 12) << 20);
+        addr = (uint64_t)desc->source_address5
+            + (extract64(desc->address_extension_45, 16, 12) << 20);
         break;
     default:
         addr = 0;
-- 
2.30.2

