Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp320412lfy;
        Wed, 19 Aug 2020 03:21:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJymgiPzmIynjs2R8MxwRx6j/B9DRBw3av6uJ3ubnHBqGl4X5aquDfwfdQjNsE6KhJPa7Bgy
X-Received: by 2002:a25:ae43:: with SMTP id g3mr9257709ybe.459.1597832476831;
        Wed, 19 Aug 2020 03:21:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597832476; cv=none;
        d=google.com; s=arc-20160816;
        b=rJigxRosIqzoVreRDPAAfEmoN87TaN2tdL8ZH2UNv2dlNIlr3VnxHwEJEESPg0DvWr
         vMbzJhiUt13cTRvRYpiMXB/sYb2IkgN9hPxhimctWxB6P9/9/Kudl6n3K8bhcdOp3vhD
         nYyYfrPDg6HFvFr9T7jR6pN4eX9WUrGRFv9+U+gXKE1TtjokkqFwIsOuZFluD0HXm/nE
         l1ILTeq1a7GhUrfgPu62shA+9FXIAqTv/nblmrzgHa0PYoQrhzCvJXzKNFTXWGzQ/2Om
         d2gI+mLTAJ3QddDOylttAsLjPUestiXm+yrdvnTi5pjLkgWh+llnB92d8E6d3O0bRShS
         Eg1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=Gu8O7dbwy8b6Rxm4PofTlelng/MmqqfZ7xdj1bAt1UA=;
        b=wseWqRdh6H0jxjCtoJkkwyb/DGaKQvOR/tXOc577v2Jzf3oKOjGac1xYN26LpHVSHJ
         cFV1/8wzIYJaZPTUhuASp+5SYR73HJq1rfOH29FOEUvDP5ORKtnVth+GueAsF63Eul8V
         BI7jaOEQgjpewaqRQbDRJvmXxosY2t64+hwJVUcHFgoHsVg8Sp3B+TukJPuiFOy+rS9d
         ruBJWDjwrtn1SByL+viqoD0RoUw69z8G7xXFzCxogQcq6ZxoWBkGbndDAyx4ijqSPXKe
         wJnnjKzu4hQ/jtd/Uz1PW9jdR/D9W+rFPzw2depICKhWDUuV4PCAY+ftdqoYfcbs1++p
         TMJw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l14si29662342ybt.321.2020.08.19.03.21.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Aug 2020 03:21:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k8LDY-0007F4-7y
	for alex.bennee@linaro.org; Wed, 19 Aug 2020 06:21:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1k8L3K-0002Re-A3; Wed, 19 Aug 2020 06:10:42 -0400
Received: from smtpout1.mo804.mail-out.ovh.net ([79.137.123.220]:45491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1k8L3E-0006a4-Vb; Wed, 19 Aug 2020 06:10:41 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.36])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id 112A6589285F;
 Wed, 19 Aug 2020 12:10:13 +0200 (CEST)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Wed, 19 Aug
 2020 12:10:12 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G004bfee9de4-ac8b-4030-a9f6-05bcb198b533,
 56ABA3BD09B5898CED80C8E013D4E39E9C6048D1) smtp.auth=clg@kaod.org
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 21/21] hw: add a number of SPI-flash's of m25p80 family
Date: Wed, 19 Aug 2020 12:09:56 +0200
Message-ID: <20200819100956.2216690-22-clg@kaod.org>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200819100956.2216690-1-clg@kaod.org>
References: <20200819100956.2216690-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 5f745152-8543-44e6-b456-df4629061f93
X-Ovh-Tracer-Id: 18051553209428183913
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedruddtkedgvdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfhisehtkeertdertdejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheehfeegjeeitdfffeetjeduveejueefuefgtdefueelueetveeliefhhffgtdelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgepheenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout1.mo804.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/19 06:10:01
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Igor Kononenko <i.kononenko@yadro.com>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 73Jk4MoXv8Iv

From: Igor Kononenko <i.kononenko@yadro.com>

Support a following SPI flashes:
* mx66l51235f
* mt25ql512ab

Signed-off-by: Igor Kononenko <i.kononenko@yadro.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20200811203724.20699-1-i.kononenko@yadro.com>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/block/m25p80.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 8a3fd959e218..d812e9fb6cfb 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -220,6 +220,7 @@ static const FlashPartInfo known_devices[] = {
     { INFO6("mx25l25635e", 0xc22019,     0xc22019,  64 << 10, 512, 0) },
     { INFO("mx25l25635f", 0xc22019,      0xc200,  64 << 10, 512, 0) },
     { INFO("mx25l25655e", 0xc22619,      0,  64 << 10, 512, 0) },
+    { INFO("mx66l51235f", 0xc2201a,      0,  64 << 10, 1024, ER_4K | ER_32K) },
     { INFO("mx66u51235f", 0xc2253a,      0,  64 << 10, 1024, ER_4K | ER_32K) },
     { INFO("mx66u1g45g",  0xc2253b,      0,  64 << 10, 2048, ER_4K | ER_32K) },
     { INFO("mx66l1g45g",  0xc2201b,      0,  64 << 10, 2048, ER_4K | ER_32K) },
@@ -239,6 +240,7 @@ static const FlashPartInfo known_devices[] = {
     { INFO("n25q256a",    0x20ba19,      0,  64 << 10, 512, ER_4K) },
     { INFO("n25q512a",    0x20ba20,      0,  64 << 10, 1024, ER_4K) },
     { INFO("n25q512ax3",  0x20ba20,  0x1000,  64 << 10, 1024, ER_4K) },
+    { INFO("mt25ql512ab", 0x20ba20, 0x1044, 64 << 10, 1024, ER_4K | ER_32K) },
     { INFO_STACKED("n25q00",    0x20ba21, 0x1000, 64 << 10, 2048, ER_4K, 4) },
     { INFO_STACKED("n25q00a",   0x20bb21, 0x1000, 64 << 10, 2048, ER_4K, 4) },
     { INFO_STACKED("mt25ql01g", 0x20ba21, 0x1040, 64 << 10, 2048, ER_4K, 2) },
-- 
2.25.4

