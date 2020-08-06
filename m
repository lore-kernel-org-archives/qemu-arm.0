Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp1627626lfy;
        Thu, 6 Aug 2020 06:21:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyG7LVK/0mum70/e6+ltHU9jjI7N9uaarkpIrvxbB7Cog/BiPz7kKw9koQIUvJs3lZaboJi
X-Received: by 2002:a25:8491:: with SMTP id v17mr13075531ybk.227.1596720086960;
        Thu, 06 Aug 2020 06:21:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596720086; cv=none;
        d=google.com; s=arc-20160816;
        b=Ska1udPEm/H9mG8txLi/ZnXxlQsYsr/1JqWlqPE7iVY6C9oUzfvij9CnaJPQoOjdLJ
         6gpgAhoazSUpz/X9oWpvdm/weRrys9PpcpAMMrKmamiGL+Xzm+5+YkcPJ71d/1/XfKk2
         GZRNYr+bgT1p0UEBXD7pGO10BYXoG57jILTrpOZHAFb7DRiUTgnF26nAeOCJV9ttCFCg
         uYap44IDiM7JIa1C/L2FkM2q9pPkeNxmGEC7Rn0VKh4XFV+R7hyNFzNC5vf0l/9HuDVW
         Id9li8u19tx/xNqA1qHYfAbzIltq0qGbtZmVVr4LVLbCzQju4czpYHsKc5EwCAFjI6c4
         +jkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=cnJn0Ue02zTzkKFntgMMDwdBtaBbfgddpsVBrzu2kG4=;
        b=DO4ZXdOju1ZszJlWB4gQcgTHOcpoyeS/I0XbVddtCDs+nnohbIpRoMq8VaiDI5tJUA
         8p/A7Cjb5J40nCqPzjDlFYh/eDOu2bNHuoIZ6Yy4aRs/ZAvN0d7gle1JpHouuG4MQx2i
         gan2Sktodv2IKsCefXP22kOx0UlvrsjQ6qrRET5eaQPwod8tIBBkD3sT7LcruFKSevj9
         99DSKbFlxU56mcrWqDNRPF4EoLSAa7WMZgAMchyv+/vu8xXwrD8cjUTfbQinquACsplc
         bj2vfVmPL5TCKmb3xYzduXZ6QwGfbu0UZzsHS0CgWsjHQVrIyM2yCjsn5YOqrcPevVai
         PUTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i141si4702229yba.180.2020.08.06.06.21.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Aug 2020 06:21:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:48772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k3fpm-0001Er-8r
	for alex.bennee@linaro.org; Thu, 06 Aug 2020 09:21:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1k3fpb-0001EG-Pa; Thu, 06 Aug 2020 09:21:15 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:37045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1k3fpZ-0000tX-9G; Thu, 06 Aug 2020 09:21:15 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.52])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 041E24DAE2B3;
 Thu,  6 Aug 2020 15:21:10 +0200 (CEST)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Thu, 6 Aug 2020
 15:21:09 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G00550c22927-463b-4e73-a8cb-35790e80fceb,
 96EDEDBD7B7627A0205C40E9E2B74F8D513A659B) smtp.auth=clg@kaod.org
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH for-5.2 02/19] m25p80: Add support for mx25l25635f
Date: Thu, 6 Aug 2020 15:20:49 +0200
Message-ID: <20200806132106.747414-3-clg@kaod.org>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200806132106.747414-1-clg@kaod.org>
References: <20200806132106.747414-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: ce55ef1c-6170-42a2-a4be-8644554c151f
X-Ovh-Tracer-Id: 271623353857968934
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedrkedtgdeihecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofgjfhggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeiueetjedvgfehkeekjeeiheehfedvtdegtdevfeeihfekieekffdvieelleefkeenucffohhmrghinhepmhgrtghrohhnihigrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: z7csD1v0t3y6

The mx25l25635f is an extenstion of the mx25l25635e. It includes QPI
support, 4-Byte Address Command Set and faster transfers. See this
document for more details :

https://www.macronix.com/Lists/ApplicationNote/Attachments/1892/AN0200V1_MGRT_MX25L25635E_25735E%20to%20MX25L25635F_25735F.pdf

Both devices have the same 3bytes JEDEC ID: 0xc22019. They can be
distinguished with the QPIID command which is only available on
mx25l25635f. The mx25l25635f also has a longer JEDEC ID that we can
use for the model.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/block/m25p80.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 605ff55c6756..1696ab1f7821 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -218,6 +218,7 @@ static const FlashPartInfo known_devices[] = {
     { INFO("mx25l12805d", 0xc22018,      0,  64 << 10, 256, 0) },
     { INFO("mx25l12855e", 0xc22618,      0,  64 << 10, 256, 0) },
     { INFO6("mx25l25635e", 0xc22019,     0xc22019,  64 << 10, 512, 0) },
+    { INFO("mx25l25635f", 0xc22019,      0xc200,  64 << 10, 512, 0) },
     { INFO("mx25l25655e", 0xc22619,      0,  64 << 10, 512, 0) },
     { INFO("mx66u51235f", 0xc2253a,      0,  64 << 10, 1024, ER_4K | ER_32K) },
     { INFO("mx66u1g45g",  0xc2253b,      0,  64 << 10, 2048, ER_4K | ER_32K) },
-- 
2.25.4

