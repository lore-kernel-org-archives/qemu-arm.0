Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp3986715lfp;
        Mon, 4 Oct 2021 08:49:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz4NoGFWRCsKRVP+K8fX2l2mtc7n9vsSGH586cyj9K4iw61XlJlG/rrjTj/oMByNldDF1zI
X-Received: by 2002:a0c:b45a:: with SMTP id e26mr22988767qvf.59.1633362599656;
        Mon, 04 Oct 2021 08:49:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633362599; cv=none;
        d=google.com; s=arc-20160816;
        b=lu2uWDcOrV/ly4sTcb51Xd8uXXGBwA8kMAT722B1UzDNQKB44C90AzYZszEKHbXGxL
         yNmKIQnZHGff9iTxyUgTrv1srEA2Mn1GsOmHqDnw5tufntjUXQhsBTKrNyYO9kVZ2mRf
         HykIWKjeYymDjujnaHD18NfmZj3jPz9bDHhnBZ73HuKgBzJCXnyOmSYXFpwp+rDDY3FB
         /192M9ssAsJuJzCFWwXiqlvWwqk2OLFXmv4fBLh36B98Q3Z4QeA1Y9VHQmtO9XNeBu5T
         VVKT3aw9dssiK7tp8fsvMSqkj8RK01zV01Sz2Q8DTVQpj21+jadlrmOv7i4wEORr3RZh
         f2nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=IHxXKmdZiM25M8+LadVnNyCn2ViQHsoW2yAL1WzZyV8=;
        b=TGT+2T9xzSqiF+2ypO4cXCi5fGgRwxplnWWDHoJBIneAOhf9oayqzqgCSJmwe+GRnd
         4La+VxVjheogowCu/6G1VbthXFVEa1X6DCrU4Mmo/ebuan9RxWPl9twxBwpd5HU4JzD2
         6/k427XrF5225we8hmyOmqa+sbzT2RT13qbRNErIoe1ilVcnKUp0feUziU7UsLaL1/8Z
         RKC9Otmp5KwfkIp51l1kgIfWtyjl8hYLUzvZ5AojBO2KO712LMKMt5s41ERfVpO1iu+V
         SnAxWLg9l9HTPBYc8Cu8GbBip3KCzYoBfg8Is0vVieV5F0SktqBL5KVDyorB6PayKath
         mnDA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 16si10154975qtr.305.2021.10.04.08.49.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Oct 2021 08:49:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mXQE2-0003by-T2
	for alex.bennee@linaro.org; Mon, 04 Oct 2021 11:49:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mXQB0-00019w-Jv
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 11:46:50 -0400
Received: from 8.mo552.mail-out.ovh.net ([46.105.37.156]:47297)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mXQAx-0001Ce-My
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 11:46:50 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.17])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 21F7D21B65;
 Mon,  4 Oct 2021 15:46:38 +0000 (UTC)
Received: from kaod.org (37.59.142.98) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Mon, 4 Oct
 2021 17:46:37 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002688db4f2-5256-4221-84f5-25f6fcc3fa1a,
 32296DFA07ABF8CFA5B750E6C0B5925FEAD98EF4) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 2/4] aspeed/smc: Dump address offset in trace events
Date: Mon, 4 Oct 2021 17:46:33 +0200
Message-ID: <20211004154635.394258-3-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211004154635.394258-1-clg@kaod.org>
References: <20211004154635.394258-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: bf878faf-e389-4046-99d3-0e7758334c5d
X-Ovh-Tracer-Id: 2440106576663251750
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudelvddgledtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfhisehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheehfeegjeeitdfffeetjeduveejueefuefgtdefueelueetveeliefhhffgtdelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=46.105.37.156; envelope-from=clg@kaod.org;
 helo=8.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-TUID: SSzAy3TuTWcV

The register index is currently printed and this is confusing.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/ssi/aspeed_smc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index 7129341c129e..8a988c167604 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -728,7 +728,7 @@ static uint64_t aspeed_smc_read(void *opaque, hwaddr addr, unsigned int size)
          addr < R_SEG_ADDR0 + asc->max_peripherals) ||
         (addr >= s->r_ctrl0 && addr < s->r_ctrl0 + asc->max_peripherals)) {
 
-        trace_aspeed_smc_read(addr, size, s->regs[addr]);
+        trace_aspeed_smc_read(addr << 2, size, s->regs[addr]);
 
         return s->regs[addr];
     } else {
@@ -1029,10 +1029,10 @@ static void aspeed_smc_write(void *opaque, hwaddr addr, uint64_t data,
     AspeedSMCClass *asc = ASPEED_SMC_GET_CLASS(s);
     uint32_t value = data;
 
-    addr >>= 2;
-
     trace_aspeed_smc_write(addr, size, data);
 
+    addr >>= 2;
+
     if (addr == s->r_conf ||
         (addr >= s->r_timings &&
          addr < s->r_timings + asc->nregs_timings) ||
-- 
2.31.1

