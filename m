Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp308055njc;
        Fri, 13 Jun 2025 07:48:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWdWRpwaTUbGfCFeoINQOI4Y3aG94PrFB0URns/jPmIkJUBxdC8H97YKNRKWYwqcKQI52Fln4QdqHTo2g==@linaro.org
X-Google-Smtp-Source: AGHT+IF9WbDq5fzzNogSAibewY4kpTsywH+xrdkUH3Cfa0R5EBCd5C9hXAWBRg5LShjhleOp/GDi
X-Received: by 2002:a05:622a:5988:b0:4a4:3186:5682 with SMTP id d75a77b69052e-4a72fe5999amr57008491cf.5.1749826124204;
        Fri, 13 Jun 2025 07:48:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749826124; cv=none;
        d=google.com; s=arc-20240605;
        b=OGD77u+0qjWy9QnQb1W2D6dZEtk2m5dKhhDtiOhMLV4TZbQUebFdCzoNKsYrZeekZ0
         6PIGnG6q2XScpd2VGHRAhFRKsjtg1IvlgpiEihZTQttXHzNNLaBOIwI0rCBra5lhQc8M
         /7l7pBl5KRRXLNwzY1iIK2AxibKjHo8UE8dzFORyZ/1ZXhwc2TPJZVdNKm4c9/dDKXRJ
         TA8DKXG3/Y25gKW/PVZbZab/hugE0LnFNElNC4fDGnOqy90OwUfibiQcEAHJNwAFtgy8
         XEcHxLpzg4xTbqWlvShqI0RXF2/6uEIuEHalcWZHmSKpla2a5ZcLnhvjcC63BnQvIU9R
         5ZAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to;
        bh=F8qlzuYIW3FehOA2i906cr0iQyN35Rs4kT4E2uV/u3o=;
        fh=12ij1D0xizeHJ+1WEqwo/9QFN2xwslWS8h/2oI6OPA8=;
        b=c9KOVs/iqP9qZNFMu2Q9tfWei94NwdpmBxCYyvTGW+X9BGEcz3epg8dYWgzYPYlPcq
         0T7rtpUrILLUmL0Suk2+kZ9e4rPB2J/g2g+uCmVUjXqbjZtsfrAtD8BbIdNiq8g+G3OE
         Fpi0UsRCaxCsn4R9RSLnZWeBsmyp/NxSyKA1bsfDLXVR45Sx/Lji0l3vWQZz4BCazXOL
         2OZ3OCZxn9yoPmR5amVP8hETDoFYan26VOZ42H1t1XFd2eZ+XXiXx1ZJ9eViNImBhL4+
         LqZwQ45BPtrzy09PBBThFweqNu7qZNNe+UoIj85j1WbxQZK/7bQDWLxMe6okYdDrpVRk
         za5A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a72a4b1c91si32261511cf.334.2025.06.13.07.48.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Jun 2025 07:48:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uQ5gi-0008LR-Ja; Fri, 13 Jun 2025 10:47:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1uQ5gg-0008Kv-Hn; Fri, 13 Jun 2025 10:47:22 -0400
Received: from [185.176.79.56] (helo=frasgout.his.huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1uQ5ge-0006mr-Ou; Fri, 13 Jun 2025 10:47:22 -0400
Received: from mail.maildlp.com (unknown [172.18.186.216])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bJj0B32hlz6M4h6;
 Fri, 13 Jun 2025 22:46:50 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id CB45B14033C;
 Fri, 13 Jun 2025 22:47:17 +0800 (CST)
Received: from A2303104131.china.huawei.com (10.203.177.241) by
 frapeml500008.china.huawei.com (7.182.85.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 13 Jun 2025 16:47:09 +0200
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
CC: <eric.auger@redhat.com>, <peter.maydell@linaro.org>, <jgg@nvidia.com>,
 <nicolinc@nvidia.com>, <ddutile@redhat.com>, <berrange@redhat.com>,
 <imammedo@redhat.com>, <nathanc@nvidia.com>, <mochs@nvidia.com>,
 <smostafa@google.com>, <linuxarm@huawei.com>, <wangzhou1@hisilicon.com>,
 <jiangkunkun@huawei.com>, <jonathan.cameron@huawei.com>,
 <zhangfei.gao@linaro.org>
Subject: [PATCH v4 7/7] qemu-options.hx: Document the arm-smmuv3 device
Date: Fri, 13 Jun 2025 15:44:49 +0100
Message-ID: <20250613144449.60156-8-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20250613144449.60156-1-shameerali.kolothum.thodi@huawei.com>
References: <20250613144449.60156-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.203.177.241]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 185.176.79.56 (deferred)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=shameerali.kolothum.thodi@huawei.com;
 helo=frasgout.his.huawei.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-to:  Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
From:  Shameer Kolothum via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ZsNDzHSeZV1a

Now that arm,virt can have user-creatable smmuv3 devices, document it.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 qemu-options.hx | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/qemu-options.hx b/qemu-options.hx
index 7eb8e02b4b..3edbde45bb 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1226,6 +1226,12 @@ SRST
     ``aw-bits=val`` (val between 32 and 64, default depends on machine)
         This decides the address width of the IOVA address space.
 
+``-device arm-smmuv3,primary-bus=id``
+    This is only supported by ``-machine virt`` (ARM).
+
+    ``primary-bus=id``
+        The PCIe Root Complex to be associated with.
+
 ERST
 
 DEF("name", HAS_ARG, QEMU_OPTION_name,
-- 
2.47.0

