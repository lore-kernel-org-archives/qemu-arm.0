Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp431871lfb;
        Wed, 18 Nov 2020 03:20:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwPFFptR37jBphYn92zXAmZSYm9Jwi5UlXUpI/ixdr7s1Cf0390T2KQUTcWfnIBlPvQQL0R
X-Received: by 2002:a25:b804:: with SMTP id v4mr7720765ybj.371.1605698442325;
        Wed, 18 Nov 2020 03:20:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605698442; cv=none;
        d=google.com; s=arc-20160816;
        b=lhzNZdbaDw7aPOOcM5f8EK/RNZ+Jk3B20HTK3ptdXxo8FnO1vJgKg/zZuajGU2v5MK
         5X8cChlrz8Cnu6KG86xIhOZKlk1n0r0rcsaFuU0rCWuKK5DUkd+5jx/4UmTU0yC09nZY
         tC42vUr9XYV6OOswyckk8KQwsEPSlHJRvvpa0nxZ/aNhB94Km/l6iglmsORIb2XM1jYx
         DPAgBE+noz0lIvXoZAdCuWzhHNm5RBKOqA8ZimCZnC7X1XuvN1jhp2BMhx/0JDUuwkNJ
         b6IFSEOYOLfmRYO1sHxQHaIvqHgTPdf6pip+zT2QZROh/QmOXSRaIrwBP5/KFhiUissh
         CWXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=mOZRb0TVML8lkdBIwyyuKUfuQFNr/qyPHyqy5IashS8=;
        b=w/OK6tWkrkVSLB9iF3snJ+n73PLttkevNazDH6MUCb1bnuHOnWJBsHaDslz10COzIX
         COzjxLbjTVoEz3oE5Okaeh4S2leZI64r+VoQrYHlS0Zp9ISIz6ERGXvGyZ4KoSFlzzKp
         Bm0HCuog+ugPt4zNYK0Dq0DY2NF2Xc4g71UBMtMuKUFbSd1KoWWhoYNoyZJfWY9z9jWn
         DPpsqLI5GT6awUMNi2e1l1D7ZKqzW4JFaCUHRZ1kVflGhUfEQmfWqa6ibLKcopV1JxyJ
         2hd/WttNe4Q0J1AWl9W1A6hwTywvcxj0bbjO4Gv/tnYUoPTagNgtAPvUDZSNHS5atO8W
         VksA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@oracle.com header.s=corp-2020-01-29 header.b=XLBbMbQO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=oracle.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m17si25184207ybm.232.2020.11.18.03.20.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Nov 2020 03:20:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@oracle.com header.s=corp-2020-01-29 header.b=XLBbMbQO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=oracle.com
Received: from localhost ([::1]:39444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kfLVx-0002CD-NK
	for alex.bennee@linaro.org; Wed, 18 Nov 2020 06:20:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1kfLU2-0000AD-1e; Wed, 18 Nov 2020 06:18:42 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:35682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1kfLTv-0002xc-5R; Wed, 18 Nov 2020 06:18:41 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AIBEN9k116758;
 Wed, 18 Nov 2020 11:18:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=mOZRb0TVML8lkdBIwyyuKUfuQFNr/qyPHyqy5IashS8=;
 b=XLBbMbQOkqnsUzaypygiNOspyvHcQUYwXoYfQ/OV/XHuiWaF0hSUbh5E7kWSYPiy6ztS
 OKo8Q3ia7cCspfGyb5NCB/t6JagM5mw4Y8DPdGoDnCvNNglGenXzCm2VpnlsB0HZSuR0
 WoZ4+88SP2ZpCrXGLzYUdA+LWu7NFctjx4Jo/19vaqwJSOZEmvq6f5xhaq3FNjcPmfvf
 BHbEB8CwN8XwYxZFup2Y3vWDD14PBGgqFrEA+w7aelWIflUISq2XQwr4FwMIeGc3cHuD
 1KTjGXW4r+6H0L2hmBKSCeh4YxBoBXINlfV1vK2NCfndaYdjMdVMuAlmlGRHMQB5c8Ac CQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2130.oracle.com with ESMTP id 34t4raynvy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 18 Nov 2020 11:18:28 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AIBFdJU110868;
 Wed, 18 Nov 2020 11:18:28 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 34uspun9m6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Nov 2020 11:18:27 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0AIBIRt5026213;
 Wed, 18 Nov 2020 11:18:27 GMT
Received: from disaster-area.hh.sledj.net (/81.187.26.238)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 18 Nov 2020 03:18:26 -0800
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 7ef66c49;
 Wed, 18 Nov 2020 11:18:19 +0000 (UTC)
From: David Edmondson <david.edmondson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/5] hw/arm: Convert assertions about flash image size to
 error_report
Date: Wed, 18 Nov 2020 11:18:17 +0000
Message-Id: <20201118111819.4588-4-david.edmondson@oracle.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201118111819.4588-1-david.edmondson@oracle.com>
References: <20201118111819.4588-1-david.edmondson@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9808
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 malwarescore=0
 mlxscore=0 bulkscore=0 suspectscore=1 adultscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011180079
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9808
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 clxscore=1015
 malwarescore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=999 adultscore=0 phishscore=0 suspectscore=1 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011180079
Received-SPF: pass client-ip=141.146.126.79;
 envelope-from=david.edmondson@oracle.com; helo=aserp2130.oracle.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 06:18:29
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Max Reitz <mreitz@redhat.com>, David Edmondson <david.edmondson@oracle.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CpYr74xRVqvQ

Rather than throwing an assertion, provide a more detailed report if a
flash image is inappropriately sized or aligned.

Signed-off-by: David Edmondson <david.edmondson@oracle.com>
---
 hw/arm/virt.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 27dbeb549e..2ba83dd18b 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -967,9 +967,21 @@ static void virt_flash_map1(PFlashCFI01 *flash,
                             MemoryRegion *sysmem)
 {
     DeviceState *dev = DEVICE(flash);
+    const char *name = blk_name(pflash_cfi01_get_blk(flash));
+
+    if (size == 0 || !QEMU_IS_ALIGNED(size, VIRT_FLASH_SECTOR_SIZE)) {
+        error_report("system firmware block device '%s' has invalid size "
+                     "%" PRId64, name, size);
+        info_report("its size must be a non-zero multiple of 0x%" PRIx64,
+                    VIRT_FLASH_SECTOR_SIZE);
+        exit(1);
+    }
+    if (!(size / VIRT_FLASH_SECTOR_SIZE <= UINT32_MAX)) {
+        error_report("system firmware block device '%s' is too large "
+                     "(%" PRId64 ")", name, size);
+        exit(1);
+    }
 
-    assert(QEMU_IS_ALIGNED(size, VIRT_FLASH_SECTOR_SIZE));
-    assert(size / VIRT_FLASH_SECTOR_SIZE <= UINT32_MAX);
     qdev_prop_set_uint32(dev, "num-blocks", size / VIRT_FLASH_SECTOR_SIZE);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
-- 
2.29.2

