Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3592821lfb;
        Mon, 16 Nov 2020 02:46:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw3FjuDq9zJ0uI1XsntBboTCh7PhJAp+BC2ipLor80Ei7R01K69FTGMf4AHS7p4CydcmxYL
X-Received: by 2002:a25:61c9:: with SMTP id v192mr20904557ybb.354.1605523574503;
        Mon, 16 Nov 2020 02:46:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605523574; cv=none;
        d=google.com; s=arc-20160816;
        b=EB6uKelX/wIFB0jlactIozmniUJYyRpPdX4p/2SToE8R2v8U8cfBKSNHglOzDXaf4q
         nPwQAJAxWtyHnoLoefhJ9JpzEByUz0TpDd1kFIdx6jL5vOardO4tQ5CTMzAaxDwbeVLC
         WmnnyiNkkymj+9qgkUOcE+iBojzOjLML3q51nHhfim61IInnn7uaxOQkNOM4JP8UGvNo
         OMIh10q/ZneFgXecneOhZ1sCGlQifX5Bmc4QwK9aWELbkkRf2f47l2TqMVt16yqUEYDx
         ZzhZ+4N+5pCwA7w64HXVx+9+ETMYSO4MRBRpWaqzHNzEpsTD5tFu1TXUg/iP9aHGkmHi
         96LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Akn9LGrGk6tBq28UL+Pz3bJjrsPgeQbBktjNf7mK+B0=;
        b=WTjg3VsfKLOK1dnOxlITPKYaYFUoFsG+zK33RpF4SZYiU/j9BGs56y+1c7a4kQ/Dw5
         URxh4v/ce31IgKH5TIOkgcBFQiSCAMez5vN9poBZ9qs1FtWovgo2LMQ77ROVu+preTGA
         1xSSmZaeAiPLdlxWsTOeLDx/WfI6/DqOpiHf8U8gOOsFiBh7piD42Rn94LO+5+xLpqGp
         ut2goOl6p/btZ9iz/XwRKXt8WCPToqnI8tK3eYfh4XRkVn3KkY1+8Ev2Jo8gI4tdqSnw
         hLj5CcMfjT8NNc14hgkoG1JLsdswYqFC8RLNlPgTo2EuUigYMkfck5WHPccnBMiBKfcc
         VaDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@oracle.com header.s=corp-2020-01-29 header.b="CD/bSpUg";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=oracle.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y65si12468109yby.421.2020.11.16.02.46.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Nov 2020 02:46:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@oracle.com header.s=corp-2020-01-29 header.b="CD/bSpUg";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=oracle.com
Received: from localhost ([::1]:50208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kec1V-0003xZ-Ut
	for alex.bennee@linaro.org; Mon, 16 Nov 2020 05:46:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1kebxw-0007u4-6q; Mon, 16 Nov 2020 05:42:32 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:54736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1kebxs-0000X6-V2; Mon, 16 Nov 2020 05:42:31 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AGAdXE4021434;
 Mon, 16 Nov 2020 10:42:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=Akn9LGrGk6tBq28UL+Pz3bJjrsPgeQbBktjNf7mK+B0=;
 b=CD/bSpUg/D3O7XRI2dUF9dv/nMUKJ4XjvqgC1zOvKthBToGrvTz9cMfVNsvpOmR3/ri1
 f9SWH3CyakdEryexFcrQ7nEmT4Rm98Bi1ijQjoW5tkrtNeQWl+qti2rjgrkpbHG36FIc
 rROeUNL+i5Y4q1K28RLaKqpmFE6WdkIbf3b52Vopch3vSKBBa8CoYXXknF4zIk2H3WeJ
 ujyRzIa1Cfrhcha8yKo9PUXJs8/xUU+v26wfJb8QtcRnFCsrmVNxiYKmuwBxSdcFDN4/
 Ou84woqdeRTT+uVAPqREOshXLOBT0U3Vax2+j5JdeIXINMaTZFVsRdW8fEiQQdqMr/xr sA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 34t7vmvb29-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 16 Nov 2020 10:42:22 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AGAf9YT068418;
 Mon, 16 Nov 2020 10:42:21 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3020.oracle.com with ESMTP id 34umcwp45h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Nov 2020 10:42:21 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0AGAgK1C004731;
 Mon, 16 Nov 2020 10:42:20 GMT
Received: from disaster-area.hh.sledj.net (/81.187.26.238)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 16 Nov 2020 02:42:20 -0800
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 4b331949;
 Mon, 16 Nov 2020 10:42:16 +0000 (UTC)
From: David Edmondson <david.edmondson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 1/5] hw/block: blk_check_size_and_read_all should report
 backend name
Date: Mon, 16 Nov 2020 10:42:12 +0000
Message-Id: <20201116104216.439650-2-david.edmondson@oracle.com>
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
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 suspectscore=1
 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 mlxscore=0 priorityscore=1501 phishscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011160062
Received-SPF: pass client-ip=156.151.31.85;
 envelope-from=david.edmondson@oracle.com; helo=userp2120.oracle.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 05:42:24
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
X-TUID: teBDhazASIpu

If there are problems examining or reading data from the block
backend, the error messages should include an appropriate identifier
to assist in diagnoses.

Signed-off-by: David Edmondson <david.edmondson@oracle.com>
---
 hw/block/block.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/block/block.c b/hw/block/block.c
index 1e34573da7..8b284e1f14 100644
--- a/hw/block/block.c
+++ b/hw/block/block.c
@@ -20,9 +20,6 @@
  * BDRV_REQUEST_MAX_BYTES.
  * On success, return true.
  * On failure, store an error through @errp and return false.
- * Note that the error messages do not identify the block backend.
- * TODO Since callers don't either, this can result in confusing
- * errors.
  * This function not intended for actual block devices, which read on
  * demand.  It's for things like memory devices that (ab)use a block
  * backend to provide persistence.
@@ -32,17 +29,19 @@ bool blk_check_size_and_read_all(BlockBackend *blk, void *buf, hwaddr size,
 {
     int64_t blk_len;
     int ret;
+    const char *name = blk_name(blk);
 
     blk_len = blk_getlength(blk);
     if (blk_len < 0) {
         error_setg_errno(errp, -blk_len,
-                         "can't get size of block backend");
+                         "can't get size of block backend %s",
+                         name);
         return false;
     }
     if (blk_len != size) {
         error_setg(errp, "device requires %" HWADDR_PRIu " bytes, "
-                   "block backend provides %" PRIu64 " bytes",
-                   size, blk_len);
+                   "block backend %s provides %" PRIu64 " bytes",
+                   size, name, blk_len);
         return false;
     }
 
@@ -55,7 +54,8 @@ bool blk_check_size_and_read_all(BlockBackend *blk, void *buf, hwaddr size,
     assert(size <= BDRV_REQUEST_MAX_BYTES);
     ret = blk_pread(blk, 0, buf, size);
     if (ret < 0) {
-        error_setg_errno(errp, -ret, "can't read block backend");
+        error_setg_errno(errp, -ret, "can't read block backend %s",
+                         name);
         return false;
     }
     return true;
-- 
2.28.0

