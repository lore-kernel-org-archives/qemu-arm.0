Received: by 2002:a17:504:1dd4:b0:1be9:327d:8ee3 with SMTP id b20csp1417518nji;
        Sat, 13 Jul 2024 09:37:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUFlMk/asmeK2FsRtcbEyJdJX0ins9MLtvlF+kj+xKotzdXyQt7hAAegPzVBEg2xT/f3MwL1IJ5ai+e+dDi/RC0jsADypVa
X-Google-Smtp-Source: AGHT+IGrS8m1Ddvw8K3eGNYoPcXC7AAa+bcA4BYlZbrXOnVtyOe7mi0QNmBahttUe38y51Cp0GY2
X-Received: by 2002:a05:620a:22a:b0:7a1:62d3:b9a3 with SMTP id af79cd13be357-7a162d3be6emr199838785a.17.1720888638205;
        Sat, 13 Jul 2024 09:37:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720888638; cv=none;
        d=google.com; s=arc-20160816;
        b=vAXuDNqdoacw41Wdc/mFMNx7AmduMoG77Q8dw47O8YbTx4Kq+cAOjBKh/ABWfpqfcj
         7E4Rq91GXoOIMwGa5N0IVYcH8EnumrExf5riuUusOPU6dE552N27R52j54/5NhWKzLSU
         b0rs5XGGb3R5s1VnmWRsZ4yyOqv19fw4N++f5zUed1Kq/pEjYbmaDbDBKpuxfNiwMEop
         RuGMo9zwfR8ypyl4V/r4pr0yDtvzo2ovcBBJHu4tAGjOtaq5Y1aTcSSl+FDM/5O/igeI
         OSlRwMxUBp4QnyFlUAksXm7uOrD0D0P0k1IdnWopfUlGg/9gfijuBajQFODFTPHH1VEZ
         oq3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=Pm4YVouzr7AEZLWE6riErvbFYoXYD6jFvtrjxHqNMOI=;
        fh=uf9ECceijx8oaIE+vQiw9tl2ioBb9CR4zV+inDGNTBg=;
        b=TOWt6CkgQp160FgR3f6QCgFMCLNNwaivPuy2oTZttLURR5/8/EU72QrkoNhv5ybbUh
         jXo44MTgo8hxP9L2aRwESOvkk49WV8ljiA32Z681gLCSODkCE/O4UqozuugIw5p+x25M
         fuj15gWnqbaHW0x5iisYarHVsa9rgZvKHAxl9STUIxT8YJMZCr6+83EEnjqIcMTWYx5q
         bLbareJErQ0LBTxtDpYutMm8AOwliXuqa9tbFm8YDyc1neEr7uZtwCa+27PMsNH6mbVw
         fUwmRo6mwV0LQetE5fZ7O9F/+xsAv97xtJpKuFUbAzhOVIIkQhFk5a/YiFF2y6NmD14g
         2xcg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@samjakob.com header.s=sig1 header.b=F8174Ain;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=samjakob.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a160c49b22si152307085a.256.2024.07.13.09.37.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 13 Jul 2024 09:37:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@samjakob.com header.s=sig1 header.b=F8174Ain;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=samjakob.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sSfjx-00085h-0E; Sat, 13 Jul 2024 12:36:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <me@samjakob.com>) id 1sSf7Y-0005XI-Cn
 for qemu-arm@nongnu.org; Sat, 13 Jul 2024 11:57:12 -0400
Received: from qs51p00im-qukt01072701.me.com ([17.57.155.16])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <me@samjakob.com>) id 1sSf7W-0001pu-WB
 for qemu-arm@nongnu.org; Sat, 13 Jul 2024 11:57:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samjakob.com;
 s=sig1; t=1720886226;
 bh=Pm4YVouzr7AEZLWE6riErvbFYoXYD6jFvtrjxHqNMOI=;
 h=From:To:Subject:Date:Message-ID:MIME-Version;
 b=F8174AinkWyyXPihzH/Grqvz+kYUb5zfg4FOlobM+8a8yUf1lJH+TuVYjCWjFpDud
 4cDwqXNE+b/K2ofHGMVe0EWOyiCmkGkei58x6Zzr1XdOjTwxqP/ze6PPBIozsLXLYb
 gFwrjylR//EOv3nkz0hwX02IYZB8BJe3z3a44CL/yQR7OdqdQce5pVVJOIotyovsR1
 +JulXymH0EK0m9NUgkPtCilhLKWfT+aOOfEZ2+eELnC80anlZKr1fk1aZC98myt8nn
 H9KoMn/Dyq25tBmmtTdORF1mN5yMUps8X9e7djf6Lsw4xGLqZCdy3D9/zQRCNtMJTG
 k8E/o6XyhOVzA==
Received: from localhost.localdomain (qs51p00im-dlb-asmtp-mailmevip.me.com
 [17.57.155.28])
 by qs51p00im-qukt01072701.me.com (Postfix) with ESMTPSA id B2CA615C0243;
 Sat, 13 Jul 2024 15:57:03 +0000 (UTC)
From: SamJakob <me@samjakob.com>
To: qemu-devel@nongnu.org
Cc: SamJakob <me@samjakob.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org (open list:Raspberry Pi)
Subject: [PATCH] hw/display/bcm2835_fb: fix fb_use_offsets condition
Date: Sat, 13 Jul 2024 16:56:56 +0100
Message-ID: <20240713155656.59431-1-me@samjakob.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 2eJ-EL2OyfU5RyD_g6C6xxE4WbBr_uhS
X-Proofpoint-ORIG-GUID: 2eJ-EL2OyfU5RyD_g6C6xxE4WbBr_uhS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-13_12,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 phishscore=0
 adultscore=0 clxscore=1030 mlxlogscore=955 mlxscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2407130119
Received-SPF: pass client-ip=17.57.155.16; envelope-from=me@samjakob.com;
 helo=qs51p00im-qukt01072701.me.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 13 Jul 2024 12:36:49 -0400
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
X-TUID: snYf6aZ87hB/

	It is common practice when implementing double-buffering
	on VideoCore to do so by multiplying the height of the
	virtual buffer by the number of virtual screens desired
	(i.e., two - in the case of double-bufferring).

	At present, this won't work in QEMU because the logic in
	fb_use_offsets require that both the virtual width and
	height exceed their physical counterparts.

	This appears to be unintentional/a typo and indeed the
	comment states; "Experimentally, the hardware seems to
	do this only if the viewport size is larger than the
	physical screen". The viewport/virtual size would be
	larger than the physical size if either virtual dimension
	were larger than their physical counterparts and not
	necessarily both.

Signed-off-by: SamJakob <me@samjakob.com>
---
 hw/display/bcm2835_fb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/display/bcm2835_fb.c b/hw/display/bcm2835_fb.c
index e40ed2d2e1..650db3da82 100644
--- a/hw/display/bcm2835_fb.c
+++ b/hw/display/bcm2835_fb.c
@@ -145,7 +145,7 @@ static bool fb_use_offsets(BCM2835FBConfig *config)
      * viewport size is larger than the physical screen. (It doesn't
      * prevent the guest setting this silly viewport setting, though...)
      */
-    return config->xres_virtual > config->xres &&
+    return config->xres_virtual > config->xres ||
         config->yres_virtual > config->yres;
 }
 
-- 
2.45.2

