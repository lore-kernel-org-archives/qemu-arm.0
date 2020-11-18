Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp433020lfb;
        Wed, 18 Nov 2020 03:22:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzSbSbgPKTTsZmsC4cqkunnZhnGQ+CPC1NMHJ8m9kBndkcGAT5x2qIMvqv6bCyGKosOQTRT
X-Received: by 2002:a25:7243:: with SMTP id n64mr7310606ybc.86.1605698551408;
        Wed, 18 Nov 2020 03:22:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605698551; cv=none;
        d=google.com; s=arc-20160816;
        b=Zr0Ha1h2Z4YdLvzXgZ3x0EPlFtHUE6Kb2GsvHTKsDTTRJsU0rrXmpymnqjuknRpdER
         U5kEwM/owb24DohGVAqAdXWnKklOLcnQyFO5wyXGQFR1C2hmlo/YKYZavh/wzcxO8E9s
         eIrJrf8jMVPl44Ui+UA9rYmJeI1y0n9OtLclTnHZD4vnKUFtm3HopXwIbZrM/YMYCIuD
         5YPo6e5/Sx8bO6JPkLkdgAbNuwwu2BcBeNeQGutDaOI/1oHG3sP86DafL2QObYgjkltq
         IllfgbtuB6YbEN4Usr/m8oJguqpflfNzJ9z+dlo4fyg9nQfkIorTugH8lWwN88K1Czi2
         KsHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=06UD4IipE8zFWX6hce0WqlRmuIcYrUN59Q3b6eed6To=;
        b=otl38ryceL9rilbW3wUcxidu5EtcNYwQ3hw93HyT6ArkXi/GPOC8IG1anqZukglOZy
         qqE3sfZ4lYp7RaasA7tkkljE32xq8PLCLztw4D8Sl6DcMb9Qf4VdYHdX2lPz3m8s4IYs
         Isp0HP2tCnY/zylGShWlAWA7oV4zxDKKhyERBLnmgoZAtC6480XlMxnBLm5Jb2qIM3r5
         hPFaw2N65V1tcJhjjDe+epOHmbf4W05xXYDJgvodpW8GIlY+C0zn63UFXUNUb70dHL+x
         BdmbF5Q8lc25uUsY43dvf11PrhnFTufQ6dBup5FAxAGbUmJqBp8YbupkPyZVbcPwGRb8
         EGxA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@oracle.com header.s=corp-2020-01-29 header.b=VTbm5gsP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=oracle.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y66si73587yby.259.2020.11.18.03.22.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Nov 2020 03:22:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@oracle.com header.s=corp-2020-01-29 header.b=VTbm5gsP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=oracle.com
Received: from localhost ([::1]:43694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kfLXi-00040V-Pd
	for alex.bennee@linaro.org; Wed, 18 Nov 2020 06:22:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1kfLU3-0000EP-DT; Wed, 18 Nov 2020 06:18:43 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:49764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1kfLTv-0002xX-5P; Wed, 18 Nov 2020 06:18:43 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AIBDe6G168729;
 Wed, 18 Nov 2020 11:18:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=06UD4IipE8zFWX6hce0WqlRmuIcYrUN59Q3b6eed6To=;
 b=VTbm5gsPW++paC1OIUKk2TKZbA1y0hsNIlSZqXPQSNgSvEI549RB7YiUYO3FKwg/UgwO
 6QtzGqwGIj3FTQGXVnIFCDYkjfqwsz4ghG49B3Q3WYGMfkz9lfQQ9efAV6upsMvXbElF
 Fq2evCKaxJswuOPQRhHDCG7HY/wwEFmz+og0ckxe8RsBaWrkvP/Ipcbr5Coy/lx3hSsu
 hleRRdSOX4tNOvnVajQ8pPR27EUYthuS3vMWrNHYtqXx61cCtwbBp1H5jR38kYCgoTjw
 ma03ZFyom8MNd9GQsmz0VA1p4Y2+q1ugSA9VWXVqKiXBMCr2zrcLi6JnHIdai1HFPVCT YA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 34t7vn7g42-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 18 Nov 2020 11:18:26 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AIBFOeZ136147;
 Wed, 18 Nov 2020 11:18:26 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3020.oracle.com with ESMTP id 34umd0f4hg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Nov 2020 11:18:26 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0AIBIPuf003392;
 Wed, 18 Nov 2020 11:18:25 GMT
Received: from disaster-area.hh.sledj.net (/81.187.26.238)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 18 Nov 2020 03:18:25 -0800
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 61aaad1d;
 Wed, 18 Nov 2020 11:18:19 +0000 (UTC)
From: David Edmondson <david.edmondson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/5] hw/block: Flash images can be smaller than the device
Date: Wed, 18 Nov 2020 11:18:16 +0000
Message-Id: <20201118111819.4588-3-david.edmondson@oracle.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201118111819.4588-1-david.edmondson@oracle.com>
References: <20201118111819.4588-1-david.edmondson@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9808
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 mlxscore=0 phishscore=0
 spamscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011180079
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9808
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 suspectscore=1
 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 mlxscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011180079
Received-SPF: pass client-ip=156.151.31.85;
 envelope-from=david.edmondson@oracle.com; helo=userp2120.oracle.com
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
X-TUID: GBGbE6AObnhI

When loading a flash image into a device, allow the image to be
smaller than the extent of the device.

Signed-off-by: David Edmondson <david.edmondson@oracle.com>
---
 hw/block/block.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/block/block.c b/hw/block/block.c
index 5fa0f352e3..8512d752c3 100644
--- a/hw/block/block.c
+++ b/hw/block/block.c
@@ -16,8 +16,8 @@
 
 /*
  * Read the entire contents of @blk into @buf.
- * @blk's contents must be @size bytes, and @size must be at most
- * BDRV_REQUEST_MAX_BYTES.
+ * @blk's contents must not be more than @size bytes, and must be at
+ * most BDRV_REQUEST_MAX_BYTES in length.
  * On success, return true.
  * On failure, store an error through @errp and return false.
  * This function not intended for actual block devices, which read on
@@ -38,10 +38,10 @@ bool blk_check_size_and_read_all(BlockBackend *blk, void *buf, hwaddr size,
                          name);
         return false;
     }
-    if (blk_len != size) {
-        error_setg(errp, "device requires %" HWADDR_PRIu " bytes, "
-                   "block backend '%s' provides %" PRIu64 " bytes",
-                   size, name, blk_len);
+    if (blk_len > size) {
+        error_setg(errp, "block backend '%s' is too large for device "
+                   "(%" PRIu64 " > %" HWADDR_PRIu ")",
+                   name, blk_len, size);
         return false;
     }
 
@@ -51,8 +51,8 @@ bool blk_check_size_and_read_all(BlockBackend *blk, void *buf, hwaddr size,
      * should probably rework the device to be more like an actual
      * block device and read only on demand.
      */
-    assert(size <= BDRV_REQUEST_MAX_BYTES);
-    ret = blk_pread(blk, 0, buf, size);
+    assert(blk_len <= BDRV_REQUEST_MAX_BYTES);
+    ret = blk_pread(blk, 0, buf, blk_len);
     if (ret < 0) {
         error_setg_errno(errp, -ret, "can't read block backend '%s'",
                          name);
-- 
2.29.2

