Received: by 2002:a17:504:959a:b0:1be9:327d:8ee3 with SMTP id e26csp236161njl;
        Tue, 1 Oct 2024 07:52:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUChuMqifY4PUhFI/nhdAd1IT4H/Nq4iFc/iaCXGU2syDNNiXvhUX0bVSoVDl0R1mKBaF/vbhtzgPqvoQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHq812yl41glHmrkmZV8EvWN4jA4G6PuQHUoHCgUg+tZmZ2mGApwk/D4/fjJS2lU9S9H09Z
X-Received: by 2002:ac8:7d82:0:b0:458:3986:1970 with SMTP id d75a77b69052e-45c9f1e788fmr267395591cf.14.1727794339074;
        Tue, 01 Oct 2024 07:52:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727794339; cv=none;
        d=google.com; s=arc-20240605;
        b=gBut0F7zyh3UR+RTD9x1vIhLUxVLHYtsBH1WKD/26E3yVFzNVZjKPfbC2B928HZdXl
         pNDyyqbQnBnbpdiwBGM6hZaoID8t/tPiraeeeYeIP9E/V06JcoqNWP1hOoQQ4nzbZ6nN
         tt+zdJXTlzkoocTPahPJV28s4r/zIJ8nvedJK579AWRQiDBhaAaQOQM/YOSuhJQE1cRw
         +rT84+OvTr3spGx1zo/keJFRmqXzQSYu9CC/Mr57sOAfkELv1glvtwEgjq5KWxsJk2Wu
         ArgtcSLywF6fPvduaYkJ364XKYJMqyjNpsN03m8aVPaOVztGMyO4jtCSQsUtH6nhPX84
         Rfjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=w79EkDvfRiL5EKU++5a+kLG8kDirtahJclZLW1DjbMs=;
        fh=ABklJQq7KO4nQ4dmhroInuk7feazkA6WNnIOsatc/xo=;
        b=GUaabbtk+nc9hQ2Dvbnus6fv2m6s9JQfbs6nKi9wXwbNXnQ307rcPuiFs+6R92f3sk
         5gP3khX/rg2F2nzyPMdNcd8ysS5kQL4MfrnJgi0xM4IVvCyyZNb4gwYstKICFfMFviAQ
         B/amPcZQb/c4sq9Lxh50blfaJCLvmA9gL9RfpQn5f2en8lUUYguRteXqpbXAyBjv0SgF
         XecGF/djU6w+LlG7Fx6m5wNL/PNG/2ESF9grqx5IwMETrcnfwI1lzEeI8BbW6ur+FoY4
         wKjIMOLkZv6OW89C2NOguXmhYhj8ztFwjMB4D8eMuuo6H7u/2WYMvJeMhJiin0bG7sJu
         Ywtw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45c9f34cb17si109322261cf.516.2024.10.01.07.52.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Oct 2024 07:52:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sveDQ-0002R7-4E; Tue, 01 Oct 2024 10:51:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adiupina@astralinux.ru>)
 id 1sveCb-0001eW-RH; Tue, 01 Oct 2024 10:50:14 -0400
Received: from mx.astralinux.ru ([89.232.161.68])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adiupina@astralinux.ru>)
 id 1sveCZ-00058E-O5; Tue, 01 Oct 2024 10:50:13 -0400
Received: from [10.177.185.109] (helo=new-mail.astralinux.ru)
 by mx.astralinux.ru with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <adiupina@astralinux.ru>)
 id 1svZWC-00FsZE-Ma; Tue, 01 Oct 2024 12:50:08 +0300
Received: from rbta-msk-lt-302690.astralinux.ru (unknown [10.198.11.47])
 by new-mail.astralinux.ru (Postfix) with ESMTPA id 4XHtWK1y8PzkWwW;
 Tue,  1 Oct 2024 12:51:41 +0300 (MSK)
From: Alexandra Diupina <adiupina@astralinux.ru>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Alexandra Diupina <adiupina@astralinux.ru>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, sdl.qemu@linuxtesting.org
Subject: [PATCH 1/3] hw/intc/arm_gicv3: Add cast to match the documentation
Date: Tue,  1 Oct 2024 12:51:23 +0300
Message-Id: <20241001095125.26043-1-adiupina@astralinux.ru>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DrWeb-SpamScore: 0
X-DrWeb-SpamState: legit
X-DrWeb-SpamDetail: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehuddgtddvucetufdoteggodetrfcurfhrohhfihhlvgemucfftfghgfeunecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeetlhgvgigrnhgurhgrucffihhuphhinhgruceorgguihhuphhinhgrsegrshhtrhgrlhhinhhugidrrhhuqeenucggtffrrghtthgvrhhnpeduleetfeehffekueeuffektefgudfgffeutdefudfghedvieffheehleeuieehteenucffohhmrghinheplhhinhhugihtvghsthhinhhgrdhorhhgnecukfhppedutddrudelkedruddurdegjeenucfrrghrrghmpehhvghloheprhgsthgrqdhmshhkqdhlthdqfedtvdeiledtrdgrshhtrhgrlhhinhhugidrrhhupdhinhgvthepuddtrdduleekrdduuddrgeejmeefleelledvpdhmrghilhhfrhhomheprgguihhuphhinhgrsegrshhtrhgrlhhinhhugidrrhhupdhnsggprhgtphhtthhopeehpdhrtghpthhtohepphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdhrtghpthhtoheprgguihhuphhinhgrsegrshhtrhgrlhhinhhugidrrhhupdhrtghpthhtohepqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhrtghpthhtohepshgulhdrqhgvmhhuse
 hlihhnuhigthgvshhtihhnghdrohhrghenucffrhdrhggvsgcutehnthhishhprghmmecunecuvfgrghhsme
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
X-TUID: +OdTF1cT9QEY

The result of 1 << regbit with regbit==31 has a 1 in the 32nd bit.
When cast to uint64_t (for further bitwise OR), the 32 most
significant bits will be filled with 1s. However, the documentation
states that the upper 32 bits of ICH_AP[0/1]R<n>_EL2 are reserved.

Add an explicit cast to match the documentation.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: d2c0c6aab6 ("hw/intc/arm_gicv3: Handle icv_nmiar1_read() for icc_nmiar1_read()")
Signed-off-by: Alexandra Diupina <adiupina@astralinux.ru>
---
 hw/intc/arm_gicv3_cpuif.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index bdb13b00e9..ebad7aaea1 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -781,7 +781,7 @@ static void icv_activate_irq(GICv3CPUState *cs, int idx, int grp)
     if (nmi) {
         cs->ich_apr[grp][regno] |= ICV_AP1R_EL1_NMI;
     } else {
-        cs->ich_apr[grp][regno] |= (1 << regbit);
+        cs->ich_apr[grp][regno] |= (1U << regbit);
     }
 }
 
-- 
2.30.2

