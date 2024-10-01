Received: by 2002:a17:504:959a:b0:1be9:327d:8ee3 with SMTP id e26csp236745njl;
        Tue, 1 Oct 2024 07:53:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWlUXm+CmI4zt3TQJkCYgcAEeT/io1G931nkapayUh3ApUR51kLRU8yMNFstjEM8xSJxyDYzYP4KxbSIA==@linaro.org
X-Google-Smtp-Source: AGHT+IGioYjG5aWEYaiBPS2Odr/7dnAYavP4gWcoW6qjJmD7B07cBvV3i+t5Zr+da48x6b/CZunB
X-Received: by 2002:a05:620a:4087:b0:7a9:b2d6:7fa5 with SMTP id af79cd13be357-7ae3782e4c4mr2968690185a.26.1727794402695;
        Tue, 01 Oct 2024 07:53:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727794402; cv=none;
        d=google.com; s=arc-20240605;
        b=VjnSYyOAYqrQERy92OOwJUNqNYZbJH7pio1VfhZ8fldhnvdGJKjJFibfs4zPqxhRo6
         ng8RcBbvS5kG0XIQCyA86yvwfpvaqpMUFypcAEeswoMS4lmjtaiUTHwIFS7y0YQV5qTh
         UHi0OMbhPh2BhHzbWPHQLy1Lt089RypFETagd7cEBFXGcbuC1cpNkNytvZ+uDAFQf6Dg
         LsInT926yiVr9squ72wgMYOLjYKTxcvhcFmjM5Fb5wSmBRZaFjnn64YC01akL1uLCND1
         3L1Rmy3qfw4IhKfap5ZSn49wRlgZgiIZOskMZBL1F+BNiCCxG5Y9jvAVjPwg3zz77/Ci
         +SuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=gzdjRQ2MjC0GMqRnvIfHBurwucvzpTSHlgKQQqBGeHM=;
        fh=ABklJQq7KO4nQ4dmhroInuk7feazkA6WNnIOsatc/xo=;
        b=eRFwc3i165MkTYWPaARSh6AcFKprspeotuSIGd6mFiqs4B5Vgr7m6DT8zq95kY2Tyr
         otdM4Oo7zr3ZbqnVxdtD/yJTfja8Ij5qDD2HmfnCHP2gYtOB6ybPafV699MhojD39n1s
         zSXyBNiHC/S0oZ/n5YvOXCppKdzDqV/JCnnW7tbX0oIPzFz7ozNyQJLG5Dxb887L3xGo
         x4bTGGwyFkkhyUury8hw9A89ms5YDV3Nn04X7uEhG92+1fyU/QZc6ratXjB3eK4RkhGe
         667gEf0+tsL/gKDyXW3gYz2sGPO2+RkOm7kmn4QByT/LXg2kfSjhV8XzJH6EgDVwM6jj
         kFlw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7ae37837de6si1107087785a.285.2024.10.01.07.53.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Oct 2024 07:53:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sveE4-00041M-Q4; Tue, 01 Oct 2024 10:51:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adiupina@astralinux.ru>)
 id 1sveCm-0001uU-4e; Tue, 01 Oct 2024 10:50:26 -0400
Received: from mx.astralinux.ru ([89.232.161.68])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adiupina@astralinux.ru>)
 id 1sveCk-00058E-1X; Tue, 01 Oct 2024 10:50:23 -0400
Received: from [10.177.185.109] (helo=new-mail.astralinux.ru)
 by mx.astralinux.ru with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <adiupina@astralinux.ru>)
 id 1svZWG-00FsZP-O8; Tue, 01 Oct 2024 12:50:12 +0300
Received: from rbta-msk-lt-302690.astralinux.ru (unknown [10.198.11.47])
 by new-mail.astralinux.ru (Postfix) with ESMTPA id 4XHtWP30KLzkWwW;
 Tue,  1 Oct 2024 12:51:45 +0300 (MSK)
From: Alexandra Diupina <adiupina@astralinux.ru>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Alexandra Diupina <adiupina@astralinux.ru>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, sdl.qemu@linuxtesting.org
Subject: [PATCH 2/3] hw/intc/arm_gicv3_cpuif: Add cast to match the
 documentation
Date: Tue,  1 Oct 2024 12:51:24 +0300
Message-Id: <20241001095125.26043-2-adiupina@astralinux.ru>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241001095125.26043-1-adiupina@astralinux.ru>
References: <20241001095125.26043-1-adiupina@astralinux.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DrWeb-SpamScore: 0
X-DrWeb-SpamState: legit
X-DrWeb-SpamDetail: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehuddgtddvucetufdoteggodetrfcurfhrohhfihhlvgemucfftfghgfeunecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeetlhgvgigrnhgurhgrucffihhuphhinhgruceorgguihhuphhinhgrsegrshhtrhgrlhhinhhugidrrhhuqeenucggtffrrghtthgvrhhnpeefkedufedvkeffuedtgfdugeeutdegvdffffejfffgleffieduhfejvdelffdvudenucffohhmrghinheplhhinhhugihtvghsthhinhhgrdhorhhgnecukfhppedutddrudelkedruddurdegjeenucfrrghrrghmpehhvghloheprhgsthgrqdhmshhkqdhlthdqfedtvdeiledtrdgrshhtrhgrlhhinhhugidrrhhupdhinhgvthepuddtrdduleekrdduuddrgeejmeefleelledvpdhmrghilhhfrhhomheprgguihhuphhinhgrsegrshhtrhgrlhhinhhugidrrhhupdhnsggprhgtphhtthhopeehpdhrtghpthhtohepphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdhrtghpthhtoheprgguihhuphhinhgrsegrshhtrhgrlhhinhhugidrrhhupdhrtghpthhtohepqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhrtghpthhtohepshgulhdrqhgvmh
 husehlihhnuhigthgvshhtihhnghdrohhrghenucffrhdrhggvsgcutehnthhishhprghmmecunecuvfgrghhsme
X-DrWeb-SpamVersion: Dr.Web Antispam 1.0.7.202406240#1727772118#02
X-AntiVirus: Checked by Dr.Web [MailD: 11.1.19.2307031128,
 SE: 11.1.12.2210241838, Core engine: 7.00.65.05230, Virus records: 12191152,
 Updated: 2024-Oct-01 08:11:54 UTC]
Received-SPF: pass client-ip=89.232.161.68;
 envelope-from=adiupina@astralinux.ru; helo=mx.astralinux.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: kDeypS5IhE7X

The result of 1 << regbit with regbit==31 has a 1 in the 32nd bit.
When cast to uint64_t (for further bitwise OR), the 32 most
significant bits will be filled with 1s. However, the documentation
states that the upper 32 bits of ICH_AP[0/1]R<n>_EL2 are reserved.

Add an explicit cast to match the documentation.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: c3f21b065a ("hw/intc/arm_gicv3_cpuif: Support vLPIs")
Signed-off-by: Alexandra Diupina <adiupina@astralinux.ru>
---
 hw/intc/arm_gicv3_cpuif.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index bdb13b00e9..b7bb4bc2d6 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -793,7 +793,7 @@ static void icv_activate_vlpi(GICv3CPUState *cs)
     int regno = aprbit / 32;
     int regbit = aprbit % 32;
 
-    cs->ich_apr[cs->hppvlpi.grp][regno] |= (1 << regbit);
+    cs->ich_apr[cs->hppvlpi.grp][regno] |= (1U << regbit);
     gicv3_redist_vlpi_pending(cs, cs->hppvlpi.irq, 0);
 }
 
-- 
2.30.2

