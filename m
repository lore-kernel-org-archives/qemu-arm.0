Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp130176wrp;
        Thu, 5 Sep 2019 18:53:38 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwZdNxDr7/wly32e8m602mQ5/pQ4SNi6LYL0OrRVrFzPNRkb6GNtt9XuFlir/SikBrqVpIf
X-Received: by 2002:a17:906:fcc9:: with SMTP id qx9mr5356460ejb.32.1567734818495;
        Thu, 05 Sep 2019 18:53:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567734818; cv=none;
        d=google.com; s=arc-20160816;
        b=bLEXTaDnIfG4xHeg0C/rXKXazoQVMBD+f0rP1bpKjjmxhoDbrvj/b4M5Wn9rId2wBd
         RCdDr/JesUmNLD95xcm0ifkg97TtsDhAhAaRoVgU6HGQEBtvvkYNMwGDdNGVgkHFiXNN
         2J2SiOF0FX4upDtAcSA6n73dg84UlZ6GU28+diqmjFECkAos8+yowyW/sAROmoRGLlWJ
         gutmv8w1OFdpAyt7JvaQ/zcWaXka5UpsdTuKSdvtnAXWfw5LJlcyCPoVDDhAAAPHYQgW
         +j2aTXnU/iXIRduQdDVVASlicBMlYufOyU/WjzEIWQ7++ZStBWWIjVhszEb0WtLKhd6S
         qABw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:message-id
         :date:smtp-origin-cluster:to:smtp-origin-hostname:from
         :smtp-origin-hostprefix:dkim-signature;
        bh=mphrkCK8PHgknx4G4mNf76pijc2fJDXD3SASQAgFHkM=;
        b=EOLIAMLRkax8QqLxhzY3IaJG99X3IsmqmATM2hUC7CMcXvZxu7KmUhJ40zVJlAW8YL
         HJyYmmHlxTeIBqRgace+05ZUPf99wG5Eae0me9fBWgxlii0XXPOdS/pmjVi/ciJpKgyK
         lhf2T2xhpeJa+EeRYkolBWk4J3NkLDv8Ptm5Bu7/u2g6/V/QUmSn8t34SN2Qq93EZPNm
         lct2UdL0/UcyPdNhzziK+7A6TnhcVd7DWYSDq3whncsIqtdOQpHAjhQsbA7h7DuEuzwH
         7oYlazGA8iIzbfX8cBWYNm5fiFtUKjeRiUY6I9ueKfynYKvAobm+AloLVVquz/kwqEin
         CDtA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@fb.com header.s=facebook header.b=Rl3UlQ6B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=fb.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x54si1665136edb.267.2019.09.05.18.53.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Sep 2019 18:53:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@fb.com header.s=facebook header.b=Rl3UlQ6B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=fb.com
Received: from localhost ([::1]:51298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i63RR-0000J0-Jt
	for alex.bennee@linaro.org; Thu, 05 Sep 2019 21:53:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53332)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=4152e791a2=amithash@fb.com>) id 1i62lf-0002wr-Kn
 for qemu-arm@nongnu.org; Thu, 05 Sep 2019 21:10:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=4152e791a2=amithash@fb.com>) id 1i62le-00011m-FM
 for qemu-arm@nongnu.org; Thu, 05 Sep 2019 21:10:27 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:64228)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <prvs=4152e791a2=amithash@fb.com>)
 id 1i62ld-0000xZ-Tj
 for qemu-arm@nongnu.org; Thu, 05 Sep 2019 21:10:26 -0400
Received: from pps.filterd (m0109333.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x861AJDZ014230
 for <qemu-arm@nongnu.org>; Thu, 5 Sep 2019 18:10:20 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : subject :
 date : message-id : mime-version : content-type; s=facebook;
 bh=mphrkCK8PHgknx4G4mNf76pijc2fJDXD3SASQAgFHkM=;
 b=Rl3UlQ6BHaP8kGuB4LStl4oOQKzQjIOmUNYcsvY5n7aekrl8U3znEZwlTAckRobwrJVz
 K4MWsHf7DAXhUhInn+lYuSKaG9uX50Mx1pijarVQBrBPJf4pBRowYIKMCK39kdIVwupV
 2YcGeEellSMq28Eaz3PbDHbRay0mVgPkvqY= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2uu8mds8k7-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
 for <qemu-arm@nongnu.org>; Thu, 05 Sep 2019 18:10:20 -0700
Received: from mx-out.facebook.com (2620:10d:c081:10::13) by
 mail.thefacebook.com (2620:10d:c081:35::126) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id 15.1.1713.5;
 Thu, 5 Sep 2019 18:10:14 -0700
Received: by devvm1607.vll1.facebook.com (Postfix, from userid 122613)
 id F022F2A1CDDE; Thu,  5 Sep 2019 18:10:12 -0700 (PDT)
Smtp-Origin-Hostprefix: devvm
From: Amithash Prasad <amithash@fb.com>
Smtp-Origin-Hostname: devvm1607.vll1.facebook.com
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>, <amithash@fb.com>,
 <clg@kaod.org>, <joel@jms.id.au>
Smtp-Origin-Cluster: vll1c12
Date: Thu, 5 Sep 2019 18:10:10 -0700
Message-ID: <20190906011010.1135084-1-amithash@fb.com>
X-Mailer: git-send-email 2.17.1
X-FB-Internal: Safe
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-05_11:2019-09-04,2019-09-05 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 adultscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 mlxlogscore=790 clxscore=1011 mlxscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1906280000 definitions=main-1909060010
X-FB-Internal: deliver
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 67.231.145.42
X-Mailman-Approved-At: Thu, 05 Sep 2019 21:53:30 -0400
Subject: [Qemu-arm] [PATCH] Check correct register for clock source
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: O18/qQsa11tm

When WDT_RESTART is written, the data is not the contents
of the WDT_CTRL register. Hence ensure we are looking at
WDT_CTRL to check if bit WDT_CTRL_1MHZ_CLK is set or not.

Signed-off-by: Amithash Prasad <amithash@fb.com>
---
 hw/watchdog/wdt_aspeed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
index 9b93213417..f710036535 100644
--- a/hw/watchdog/wdt_aspeed.c
+++ b/hw/watchdog/wdt_aspeed.c
@@ -140,7 +140,7 @@ static void aspeed_wdt_write(void *opaque, hwaddr offset, uint64_t data,
     case WDT_RESTART:
         if ((data & 0xFFFF) == WDT_RESTART_MAGIC) {
             s->regs[WDT_STATUS] = s->regs[WDT_RELOAD_VALUE];
-            aspeed_wdt_reload(s, !(data & WDT_CTRL_1MHZ_CLK));
+            aspeed_wdt_reload(s, !(s->regs[WDT_CTRL] & WDT_CTRL_1MHZ_CLK));
         }
         break;
     case WDT_CTRL:
-- 
2.21.0

