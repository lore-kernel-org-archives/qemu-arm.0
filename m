Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp2230914lfp;
        Mon, 20 Sep 2021 09:26:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZlMgLcySm7zeMJFLvW1b/WIfXWxTU1FXemik4//o/py9Pmp06BDc9Ju08GQ30llP4f0a+
X-Received: by 2002:a37:f911:: with SMTP id l17mr24102361qkj.513.1632155200898;
        Mon, 20 Sep 2021 09:26:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632155200; cv=none;
        d=google.com; s=arc-20160816;
        b=lC2umcT1/XcI6FxOO1WuE4u1mzOVqfZdMHH3htMQgjh2yRWbf8pwCkrpHeG7W1qPTs
         c7fG7FIGe0e/U5FShuBi9MUNJp47WADjLUlPTac9wSp2gUQyYlcl3ZBtZSYO7Z2U318K
         6yCsVjym9/gH70UHcDEbmHhrRsgFERcKrVVG6XSGSSBwlxFtREVP7OhjrhnQGbM45qOG
         pAZkqvKyDNZNDdccWBKGS5RLaWCThC2JUv+S45xMsJy7E+/bG+r8XVk1t8LNO1ri4t4V
         Agr/8CEsVhLi9snjOEwncjfKVeO+A+ELb/3sMn5xw5+2KG3/5uoWqbkUY8d2wO+ctUYd
         by9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=2VnojTo9Zk1jksGDo8T+0GADVp8GbvLc1/IdHAaJZX8=;
        b=xZsvmKcOqqGIs+fcrbcUvac2R9SM4I/oqOzenqqQChGPn8r8u4P5oA1N+WWE6WLa58
         24VDbXsjFxw1cTzNuj9RgND4JFbmyLdEqp9Z4GzYwV2XHF/00Lkf9QGagYstx4fwmkS6
         a/tiMMyAa+qkJVDFxFDKo/pKPX2htLXJyqoYKLlx23BkHYqjugJjHQL+0ugZpN6vOR5f
         lyZK2aoaHbXkGTt9LcYCtUbh/w1+l1fghqfuQQ7YtXCDyNc35B+K0sO2rGUjvFbBjUJB
         +XkbpAwziWyQL9530vRhS/2ayptDjYJKfBihGrlRZrdGOJQE5YEv5aNdk0ES/pKPvPnk
         pdOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t13si8693432qtq.435.2021.09.20.09.26.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Sep 2021 09:26:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mSM7s-00018L-6l
	for alex.bennee@linaro.org; Mon, 20 Sep 2021 12:26:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mSM4l-0005tz-1y
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 12:23:27 -0400
Received: from 1.mo552.mail-out.ovh.net ([178.32.96.117]:58401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mSM4e-0004ER-VO
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 12:23:26 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.252])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id B84D521002;
 Mon, 20 Sep 2021 16:23:15 +0000 (UTC)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Mon, 20 Sep
 2021 18:23:15 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G00516d1b409-dc89-4d3a-aa92-6fd9c6c2b84e,
 C584E5EC745A9DFF7B561FC81DF43D5934FDEC9F) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 11/12] aspeed/smc: Remove unused attribute 'irqline'
Date: Mon, 20 Sep 2021 18:23:08 +0200
Message-ID: <20210920162309.1091711-12-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210920162309.1091711-1-clg@kaod.org>
References: <20210920162309.1091711-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 4e08bec1-14e8-4254-b483-640116865735
X-Ovh-Tracer-Id: 13074794144856509222
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudeivddgleelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfhisehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheehfeegjeeitdfffeetjeduveejueefuefgtdefueelueetveeliefhhffgtdelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgepgeenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=178.32.96.117; envelope-from=clg@kaod.org;
 helo=1.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
X-TUID: uZeuOaAxzEpr

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/ssi/aspeed_smc.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
index 8dc81294988e..75bc793bd269 100644
--- a/include/hw/ssi/aspeed_smc.h
+++ b/include/hw/ssi/aspeed_smc.h
@@ -56,7 +56,6 @@ struct AspeedSMCState {
     MemoryRegion mmio_flash_alias;
 
     qemu_irq irq;
-    int irqline;
 
     uint32_t num_cs;
     qemu_irq *cs_lines;
-- 
2.31.1

