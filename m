Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp796754lfg;
        Wed, 24 Mar 2021 15:39:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz0Dw+KPEKvjeFoOIa5Z9WTIq1AfbgUVi0jRZv4nmSGrMgsLrLW/x1WIk9mbpz+XPf9LIuv
X-Received: by 2002:a92:194c:: with SMTP id e12mr4458650ilm.292.1616625584457;
        Wed, 24 Mar 2021 15:39:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616625584; cv=none;
        d=google.com; s=arc-20160816;
        b=UDN/Q61qFXujSXV7tCesuuuGJNXyL6HZD85lHWray10oR8ul989QuCLgJLsO/ku1WY
         MCrHviY+xhO1JJ8aeBZyaXSE46hjeI/ZNY0uI1QUyPS/tumPr+1mgAtARIFgqMGhe3Rh
         G/AwirYmyxkdte6NS6NXQvDGkII2eJCPDKHJBVin4ENT9HweG2A7uKP/F0U94qgWbB1G
         m18nojloGvmYWbEGQL3zJcZyO6nmj0Y1660KusDKJMLZn2jXSovOv4TcqxRBw3zQ3drR
         GihUG8GiCYLsUZP0wR3dId2mJdcxV8w7Bqp1U5iOoy2sXbE2w+5uNAhUG6foz81Te29A
         /crw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=NYoNUd7YDsykkYHf2aml8u42BPG48iPwlx9Nkz7ImNY=;
        b=LUdDObpDxAWktZ+Vr2p6cV4uEcis4jTXCQ9d2w6ay36Ejbk64sbPvHFbUKg+qyhBKh
         dv0EXWfw5UYdM0u3LDCBLLmQyOfMlf7VWCOltcorlrNDVaGRSEVlfixsGjuKcIlfquuQ
         yrwlsTynU+Xkxk33RmM01xlvALs/47edrVFo5H+/DUENwJyKZMLsHzOg0ZNciHM+5nSi
         DyZVWKdaA2BcT7H1lRP73HQIoHn4x/v88froJvmFoUIQcEVQTtKDX44JXyfGbQ12atz8
         GD51ra2v+f0MRWFnC72sdB3Kg/FN75CeqWfR4P+v+LiSZ5rieOvlScQWhd0ODtLSYGqM
         5crQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ibm.com header.s=pp1 header.b=RnDojjOl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k15si3015684jan.49.2021.03.24.15.39.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Mar 2021 15:39:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ibm.com header.s=pp1 header.b=RnDojjOl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1]:39434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lPCAB-0001cB-KF
	for alex.bennee@linaro.org; Wed, 24 Mar 2021 18:39:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <klaus@linux.vnet.ibm.com>)
 id 1lPC9v-0001a4-4C; Wed, 24 Mar 2021 18:39:27 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:50812
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <klaus@linux.vnet.ibm.com>)
 id 1lPC9r-0002jw-83; Wed, 24 Mar 2021 18:39:26 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12OMYNFM014427; Wed, 24 Mar 2021 18:39:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=NYoNUd7YDsykkYHf2aml8u42BPG48iPwlx9Nkz7ImNY=;
 b=RnDojjOluwV6KCY6bpFPhBEew/absfzwYr7czq63iNAdVRxE3McW15zCk1aK7XaZz1BW
 AkAsjwiswJ2XlVoePfs4tkwXFfuMvUKtG02joa77dutjDwPRbQr1I1PJNki/R0NG4HG4
 eXo92xr9RsJLB5gz4pAT7PKST4GU+BKkkm+qXGvC0VcEfVpJIGADURj6RSuktjpXKOGK
 O7Zpc5SlThebwiXK66eRUGj7qEE4U4caHSTcw2nF1L0oC2g8oTYM1haq8QLvCEWVl/qA
 5SJSB/CmG3usekjoJx1LrMPtv0tfE9pk7TLnANlJ1MUjhgFfGTne8HN8jz89sWd8lHQn fA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37g8m0h89r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Mar 2021 18:39:16 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12OMZ5aw016224;
 Wed, 24 Mar 2021 18:39:15 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37g8m0h89h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Mar 2021 18:39:15 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12OMcPIk006193;
 Wed, 24 Mar 2021 22:39:15 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma03dal.us.ibm.com with ESMTP id 37d9bf9d76-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Mar 2021 22:39:15 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12OMdEUC31130018
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 24 Mar 2021 22:39:14 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F08CCC605D;
 Wed, 24 Mar 2021 22:39:13 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4511FC605F;
 Wed, 24 Mar 2021 22:39:11 +0000 (GMT)
Received: from T480-KlausKiwi.localdomain (unknown [9.85.133.239])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 24 Mar 2021 22:39:10 +0000 (GMT)
From: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 1/3] aspeed: Coding Style cleanups on do_hash_operation
Date: Wed, 24 Mar 2021 19:38:44 -0300
Message-Id: <20210324223846.17407-2-klaus@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210324223846.17407-1-klaus@linux.vnet.ibm.com>
References: <20210324223846.17407-1-klaus@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-24_13:2021-03-24,
 2021-03-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 clxscore=1015 impostorscore=0 mlxlogscore=999 priorityscore=1501
 suspectscore=0 spamscore=0 bulkscore=0 mlxscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103240161
Received-SPF: none client-ip=148.163.158.5;
 envelope-from=klaus@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VdZynKmwzZfy

Basically using camelCase for some variables...

Signed-off-by: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
---
 hw/misc/aspeed_hace.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
index 6e5b447a48..93313d2b80 100644
--- a/hw/misc/aspeed_hace.c
+++ b/hw/misc/aspeed_hace.c
@@ -86,24 +86,24 @@ static int hash_algo_lookup(uint32_t mask)
 
 static int do_hash_operation(AspeedHACEState *s, int algo)
 {
-    hwaddr src, len, dest;
-    uint8_t *digest_buf = NULL;
-    size_t digest_len = 0;
-    char *src_buf;
+    uint32_t src, len, dest;
+    uint8_t *digestBuf = NULL;
+    size_t digestLen = 0;
+    char *srcBuf;
     int rc;
 
     src = s->regs[R_HASH_SRC];
     len = s->regs[R_HASH_SRC_LEN];
     dest = s->regs[R_HASH_DEST];
 
-    src_buf = address_space_map(&s->dram_as, src, &len, false,
-                                MEMTXATTRS_UNSPECIFIED);
-    if (!src_buf) {
+    srcBuf = address_space_map(&s->dram_as, src, (hwaddr *) &len,
+                               false, MEMTXATTRS_UNSPECIFIED);
+    if (!srcBuf) {
         qemu_log_mask(LOG_GUEST_ERROR, "%s: failed to map dram\n", __func__);
         return -EACCES;
     }
 
-    rc = qcrypto_hash_bytes(algo, src_buf, len, &digest_buf, &digest_len,
+    rc = qcrypto_hash_bytes(algo, srcBuf, len, &digestBuf, &digestLen,
                             &error_fatal);
     if (rc < 0) {
         qemu_log_mask(LOG_GUEST_ERROR, "%s: qcrypto failed\n", __func__);
@@ -111,14 +111,14 @@ static int do_hash_operation(AspeedHACEState *s, int algo)
     }
 
     rc = address_space_write(&s->dram_as, dest, MEMTXATTRS_UNSPECIFIED,
-                             digest_buf, digest_len);
+                             digestBuf, digestLen);
     if (rc) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: address space write failed\n", __func__);
     }
-    g_free(digest_buf);
+    g_free(digestBuf);
 
-    address_space_unmap(&s->dram_as, src_buf, len, false, len);
+    address_space_unmap(&s->dram_as, srcBuf, len, false, len);
 
     /*
      * Set status bits to indicate completion. Testing shows hardware sets
-- 
2.25.1

