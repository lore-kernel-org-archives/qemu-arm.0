Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp1628841lfy;
        Thu, 6 Aug 2020 06:22:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzzT33X0HSSVTD+4HI5wNt8zFAHV1XaUcHNixtGlQPY1i59q+q+ejg9hBGSodUAZWumjyqm
X-Received: by 2002:a25:bfcc:: with SMTP id q12mr11446725ybm.166.1596720161021;
        Thu, 06 Aug 2020 06:22:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596720161; cv=none;
        d=google.com; s=arc-20160816;
        b=uzMeudgjAT7eUVneKoG0e7LziD1VKWT9Pi8U8BR+wNc5kh7MqzuJJezQlDAfeNvSpb
         TPtIvnsK9Qb0DwregLr4Prhtg/vffAiouJok4ZCeHtcD/TtBKj376lt8D9YCTrNPFSto
         wL8dBnZ4BZ87I32YWuUX4o78i0qulmTbIvXANmWTLkiNoLIgP8Qj4yjTxQ7eeiGEGiW1
         /IzMsNAdAhsQhW47lV0xwcSMIZDFaPB/dtiBL2ALfL3k60K88Ti/rUDKkoXb26f8Gs7l
         i6eSkOTjqLuKD8ztZdJZNbR1x9mHAAJtaBoMmvNkImZZwgu4j+BC6AKvfpkqGxlcXisb
         gkxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=KwuOmRJVhTFLxLSEudQQZ5O9gQ7pEvZ7L8KbEBqxKwc=;
        b=KU0mrSddKtTdnceh0W8zvrAGWJTfnsd3p9MND4dBVkDHAKOL3C4ixjJUkI3yEX7d8h
         Hr9Sx0759s/TWy1upQQuQq3odnpUdYmX2MIptrDsqI78LbdnQOg68tvGeXOsBHD+jsDa
         VH6/1vy80O5zoNQTlmvkmTD1cpGw+pgTg8dKHL+EBUVdUXUhhgrVkj+1GEKrF5LkvapF
         q4aEm/e5H3Zn/hlSTYxLCfh2AySjEiv5km9utVP1z/p4J0PLFWHLqWeGIkJV9Q0OFGGj
         iYepi4sAlQv/jH2z7J7lgHKVDk3cFlIDsL0H8y3PjI+FkivzF5N/SeMUuL0T9/8Lh0BE
         vQ5w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m73si4546043ybf.163.2020.08.06.06.22.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Aug 2020 06:22:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k3fqy-0003FU-Aq
	for alex.bennee@linaro.org; Thu, 06 Aug 2020 09:22:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1k3fpd-0001Ep-3t; Thu, 06 Aug 2020 09:21:17 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:44977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1k3fpZ-0000tY-9r; Thu, 06 Aug 2020 09:21:16 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.51])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 2BB7D4DAE2B4;
 Thu,  6 Aug 2020 15:21:10 +0200 (CEST)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Thu, 6 Aug 2020
 15:21:09 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G0059d889e9f-622a-47dd-b532-b714954ea881,
 96EDEDBD7B7627A0205C40E9E2B74F8D513A659B) smtp.auth=clg@kaod.org
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH for-5.2 03/19] m25p80: Add support for n25q512ax3
Date: Thu, 6 Aug 2020 15:20:50 +0200
Message-ID: <20200806132106.747414-4-clg@kaod.org>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200806132106.747414-1-clg@kaod.org>
References: <20200806132106.747414-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 1697bcc8-51f8-4e89-b728-9217570f9e9a
X-Ovh-Tracer-Id: 271904829361261350
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedrkedtgdeihecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefhkeevueeihedvvdegfefhveeiieeiheeuudettdeuhfeuhefhtddtheegieegheenucffohhmrghinhepmhhitghrohhnrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/06 09:21:10
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
X-TUID: B8xlRTRWXJJV

Datasheet available here :

https://www.micron.com/-/media/client/global/Documents/Products/Data%20Sheet/NOR%20Flash/Serial%20NOR/N25Q/n25q_512mb_1ce_3v_65nm.pdf

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/block/m25p80.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 1696ab1f7821..8a3fd959e218 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -238,6 +238,7 @@ static const FlashPartInfo known_devices[] = {
     { INFO("n25q128",     0x20ba18,      0,  64 << 10, 256, 0) },
     { INFO("n25q256a",    0x20ba19,      0,  64 << 10, 512, ER_4K) },
     { INFO("n25q512a",    0x20ba20,      0,  64 << 10, 1024, ER_4K) },
+    { INFO("n25q512ax3",  0x20ba20,  0x1000,  64 << 10, 1024, ER_4K) },
     { INFO_STACKED("n25q00",    0x20ba21, 0x1000, 64 << 10, 2048, ER_4K, 4) },
     { INFO_STACKED("n25q00a",   0x20bb21, 0x1000, 64 << 10, 2048, ER_4K, 4) },
     { INFO_STACKED("mt25ql01g", 0x20ba21, 0x1040, 64 << 10, 2048, ER_4K, 2) },
-- 
2.25.4

