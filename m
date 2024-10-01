Received: by 2002:a17:504:959a:b0:1be9:327d:8ee3 with SMTP id e26csp236126njl;
        Tue, 1 Oct 2024 07:52:17 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXZajGaj6sCi22IzbtMOdZFrLTckkWQShZlTPJ+m6iLrRrC/AgztC2QgaKF4OIKQH/M27OGagmB3C+Llw==@linaro.org
X-Google-Smtp-Source: AGHT+IFrb3QWXIe78CkCSZ96JxdIH428rnX/91SGHfbf8w9ttDFOYeAXXaWCpglpLbpYnI6po8mB
X-Received: by 2002:a05:6358:10a2:b0:1bc:47b2:12e2 with SMTP id e5c5f4694b2df-1c0cecbea38mr11220255d.3.1727794337133;
        Tue, 01 Oct 2024 07:52:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727794337; cv=none;
        d=google.com; s=arc-20240605;
        b=jVrpEg0zD/IAB8jZ1PDBO1783dJcIbokwcZVHtsFHxXJKeKFrWBol13Bf3ae1sacEt
         6+wdP3EZhrldPSopMhUGv8nOdP1L0lqxAfshUrGQ2P2Tz8NrFeppiYyLMDJ4LwsZQ2jn
         HrvNB3yIILo7HT4ld1RA8+I7ttNTSFPriIqMTcwrqQ/dH4ji4HoqJOSuqwxyJ3WmzLKX
         WHIDCMVp17b+4NMsw7ZsnRcoK2Fwlu7HOze4BkXwm1mTsVBp/7Re/aYOWwqLOEiJaSAm
         SNXdinYQsrBqQjLDNVzzRVpz35SU7tLgQUbvl/rEraMKGO32ywgQzBEGBJ8o3b8sC2og
         jzRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=BLiBiKN01hsb0phSGHFvjawXrMSpAqC2onwGHUciPXY=;
        fh=ABklJQq7KO4nQ4dmhroInuk7feazkA6WNnIOsatc/xo=;
        b=fU9uK5tYLrJqb5Cofs+UmgtPjh8wPnqJ9dI4a7dBoeDzE0XY+KFamRCRTqMSvgXOtt
         Hr9I6uqM5DG11zG8A8r5ML4sh8qjKxds81HbX+0XPa45vUrFz7H8aN2XkGMihVFP060m
         erQT2GP/aRa00w8C53A8MYwcEerC/Yjg1OX638B1Ch2hDDhV140LFbON8fly0zywuH5w
         7RQ1fZ2fCd9YM53b+s6M/smv+NXxbmEkDqfcS8BDqc2yVQ5+cGjF3KgrX9lC3FchiJab
         1Z2c69lAJFPHjLrMA+FhMxIN1Dn+LP4BlhjuNLHsDPNWve1gtP3M2zuWDERPcVK9PALM
         I4nw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6cb3b60549asi118522666d6.9.2024.10.01.07.52.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Oct 2024 07:52:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sveDE-0002Da-Lg; Tue, 01 Oct 2024 10:50:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adiupina@astralinux.ru>)
 id 1sveCj-0001rf-GC; Tue, 01 Oct 2024 10:50:22 -0400
Received: from mx.astralinux.ru ([89.232.161.68])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adiupina@astralinux.ru>)
 id 1sveCc-00058E-DM; Tue, 01 Oct 2024 10:50:19 -0400
Received: from [10.177.185.109] (helo=new-mail.astralinux.ru)
 by mx.astralinux.ru with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <adiupina@astralinux.ru>)
 id 1svZWI-00FsZa-Jr; Tue, 01 Oct 2024 12:50:14 +0300
Received: from rbta-msk-lt-302690.astralinux.ru (unknown [10.198.11.47])
 by new-mail.astralinux.ru (Postfix) with ESMTPA id 4XHtWR1L3BzkWwh;
 Tue,  1 Oct 2024 12:51:47 +0300 (MSK)
From: Alexandra Diupina <adiupina@astralinux.ru>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Alexandra Diupina <adiupina@astralinux.ru>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, sdl.qemu@linuxtesting.org
Subject: [PATCH 3/3] hw/intc/arm_gicv3: Add cast to match the documentation
Date: Tue,  1 Oct 2024 12:51:25 +0300
Message-Id: <20241001095125.26043-3-adiupina@astralinux.ru>
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
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: fghzgLoERTE4

The result of 1 << regbit with regbit==31 has a 1 in the 32nd bit.
When cast to uint64_t (for further bitwise OR), the 32 most
significant bits will be filled with 1s. However, the documentation
states that the upper 32 bits of ICC_AP[0/1]R<n>_EL2 are reserved.

Add an explicit cast to match the documentation.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 28cca59c46 ("hw/intc/arm_gicv3: Add NMI handling CPU interface registers")
Signed-off-by: Alexandra Diupina <adiupina@astralinux.ru>
---
 hw/intc/arm_gicv3_cpuif.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index bdb13b00e9..00a2e78142 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -1170,7 +1170,7 @@ static void icc_activate_irq(GICv3CPUState *cs, int irq)
     if (nmi) {
         cs->icc_apr[cs->hppi.grp][regno] |= ICC_AP1R_EL1_NMI;
     } else {
-        cs->icc_apr[cs->hppi.grp][regno] |= (1 << regbit);
+        cs->icc_apr[cs->hppi.grp][regno] |= (1U << regbit);
     }
 
     if (irq < GIC_INTERNAL) {
-- 
2.30.2

