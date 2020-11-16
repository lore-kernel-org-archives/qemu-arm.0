Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3591415lfb;
        Mon, 16 Nov 2020 02:43:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw2jxouNrcR96UpegTwIVuWmaqiK5XamUNJuKB0pLkO05KqNPvRe7ypAZA+gOi7zRUzZkuq
X-Received: by 2002:a25:41cb:: with SMTP id o194mr25056189yba.420.1605523432414;
        Mon, 16 Nov 2020 02:43:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605523432; cv=none;
        d=google.com; s=arc-20160816;
        b=GoAf0mKdPLNtDC6ANv1xLkLKk6xHFaauBHM3CyiY1lXum+Ovhd0PHqMxtTQyPgBBNT
         tWJJ/b/MdL+KmAQaFmKrTKL3R3GKNCA3ed0ZBYU0CLRL0zQt0EVkuRl9PuIWXjk1x1ao
         2G+qjsyThobXGm73yv8vsZkmaRn6GELOH2dPskmSdhteJfJZdltt6NCFmcEb5vT9P4Jn
         n3f89Y0KZ/rHAwdmxaZNPqTQHMkAS2yd+rAHdCblb1q0yvlViuGU7z1ZvB4mLhPzvTFO
         bd8ilBp3VJ4c/Gyg8pe5/1cz0p2UgilAODVYDpvFgBX3en4M1j/c6EHQLLZ9upUo9dcf
         ojbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=1e4vV3wlhhx5BC8mV3U4uDQtSCmNzl4GULkfYr69znw=;
        b=a3k5KD+bj9OFOWG3mh4J3ucXjP3ttLCxPdt3Sc3Ord9HBSYPDsNVmZRqwSgoutNc7P
         XnIX0GT0Hpjq76bO5hDVYkuBep99dD+MQwBRsLTZYdp+6SP5O0QpVLVxxyaIRn+Fitef
         YIibnquuaqYMyVCjTfaICIOzVaHvosfVKPRoibNYssu5gr9E3PvXdSNfn60L2hvp3U7j
         Ds5Zhjq938SXbjP6qRnu9BcT34FA3t/X+Q6UoeNYJ/CDUkyg997G86O9DvSN6EvQ+uoc
         /qxH+kQlnvm1zhnndH/vgU2HrOEqK521enJhS6B99HYkgkizGmnmP9cwdIaT4zqmqiv5
         JraA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@oracle.com header.s=corp-2020-01-29 header.b="bD/pjXJd";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=oracle.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s9si17316493ybi.469.2020.11.16.02.43.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Nov 2020 02:43:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@oracle.com header.s=corp-2020-01-29 header.b="bD/pjXJd";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=oracle.com
Received: from localhost ([::1]:41766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kebzD-0000UR-PM
	for alex.bennee@linaro.org; Mon, 16 Nov 2020 05:43:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1keby0-0007zd-1a; Mon, 16 Nov 2020 05:42:36 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:35562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1kebxu-0000Y4-Kn; Mon, 16 Nov 2020 05:42:35 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AGAe6h2177707;
 Mon, 16 Nov 2020 10:42:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=1e4vV3wlhhx5BC8mV3U4uDQtSCmNzl4GULkfYr69znw=;
 b=bD/pjXJdHuaLgjhhAGpBJQrortX2z0F5N+Q7R0/EZOyzskH5q63kLXv9zHKTJaqJQdWR
 QrVBxdBO+4AYMSxs74oNYYqJ0VWYkoHZqJ/x7ZH6g3oRPv27ftIpkjbU1Al+wVeaYYHj
 A1yMHxpuj2vRc+kBhSNBm1kb7/4EjEHAH47IZ/yzstKcPBTvhpM9sZeYxu9psUKy+ufu
 hheMOEFHtnPf6SAnM2DLbhXkmSMAJGAM7W5nYxNWvTw/ZKs4gWhBjUMGlaqan6v95e9Z
 W/kn42UiuxeNZqagJs9ozSe8B+lIZbBsSVohn88WtBSzQiuI0trUOS1ba1P9jivLM6r0 kw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 34t76kmcw8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 16 Nov 2020 10:42:26 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AGAf9JE068409;
 Mon, 16 Nov 2020 10:42:25 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3020.oracle.com with ESMTP id 34umcwp46p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Nov 2020 10:42:25 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0AGAgOH1016868;
 Mon, 16 Nov 2020 10:42:24 GMT
Received: from disaster-area.hh.sledj.net (/81.187.26.238)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 16 Nov 2020 02:42:23 -0800
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 9e778f86;
 Mon, 16 Nov 2020 10:42:16 +0000 (UTC)
From: David Edmondson <david.edmondson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 3/5] hw/arm: Convert assertions about flash image size to
 error_report
Date: Mon, 16 Nov 2020 10:42:14 +0000
Message-Id: <20201116104216.439650-4-david.edmondson@oracle.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201116104216.439650-1-david.edmondson@oracle.com>
References: <20201116104216.439650-1-david.edmondson@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9806
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 mlxscore=0 phishscore=0
 spamscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011160062
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9806
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 phishscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 mlxlogscore=999
 malwarescore=0 mlxscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011160062
Received-SPF: pass client-ip=141.146.126.78;
 envelope-from=david.edmondson@oracle.com; helo=aserp2120.oracle.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 05:42:28
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
X-TUID: vfaKGI49MxLZ

Rather than throwing an assertion, provide a more detailed report if a
flash image is inappropriately sized or aligned.

Signed-off-by: David Edmondson <david.edmondson@oracle.com>
---
 hw/arm/virt.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 27dbeb549e..f9f10987dc 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -967,9 +967,21 @@ static void virt_flash_map1(PFlashCFI01 *flash,
                             MemoryRegion *sysmem)
 {
     DeviceState *dev = DEVICE(flash);
+    const char *name = blk_name(pflash_cfi01_get_blk(flash));
+
+    if (size == 0 || !QEMU_IS_ALIGNED(size, VIRT_FLASH_SECTOR_SIZE)) {
+        error_report("system firmware block device %s has invalid size "
+                     "%" PRId64, name, size);
+        info_report("its size must be a non-zero multiple of 0x%" PRIx64,
+                    VIRT_FLASH_SECTOR_SIZE);
+        exit(1);
+    }
+    if (!(size / VIRT_FLASH_SECTOR_SIZE <= UINT32_MAX)) {
+        error_report("system firmware block device %s is too large "
+                     "(%" PRId64 ")", name, size);
+        exit(1);
+    }
 
-    assert(QEMU_IS_ALIGNED(size, VIRT_FLASH_SECTOR_SIZE));
-    assert(size / VIRT_FLASH_SECTOR_SIZE <= UINT32_MAX);
     qdev_prop_set_uint32(dev, "num-blocks", size / VIRT_FLASH_SECTOR_SIZE);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
-- 
2.28.0

