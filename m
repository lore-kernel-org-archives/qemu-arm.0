Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp1883225njc;
        Tue, 11 Mar 2025 07:14:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVYW/MQE6ryhokz6bSaNRK4ALXQqtQBv2L+RxLWRWkJFTn7Kk0HcQJArP9yXZVHpM9A4a/riLM+8bs9dw==@linaro.org
X-Google-Smtp-Source: AGHT+IEA0461TQS1siqsHhlqdLBY6WPDUGVevw7vwwpvxV0mJmP+msiA+GS4sKKCZfzhrPPSBPdT
X-Received: by 2002:a05:6402:1e88:b0:5e5:cb92:e770 with SMTP id 4fb4d7f45d1cf-5e75de575cfmr4567302a12.1.1741702466463;
        Tue, 11 Mar 2025 07:14:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741702466; cv=none;
        d=google.com; s=arc-20240605;
        b=F5K1rwkmNtFgiHP0eaAG86ipqSS6T3K+1kCO9ESQPQLLZr5gnhYZVAqScKvRoGiecZ
         m21ldnAI59HMYWycYEK7st9SkG0SdmgBCCUStELSjs4lsp/rROEs1XpAu9cXrKxNqOAn
         Q8/gkGS9ncI8VDsz32vQ1qdOSC0nSuqyU1orQLL5AhdMqoRj771Kk6aGaLeeE2UV8Qub
         furtj2giz2oLtxEAy1IF2sk8s9SnZEY8GLz19jURIQebzNr40WU8u7iEKtdh+FT6rUDR
         JMjkxWjDun1YiHetKNMmxyn0sG42387Jno6cr+tgH6mJyahj8iYlqB7bOfxvysZNuVxT
         ImgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to;
        bh=QSmj17fJs5isJ7Fs6a824Wwz+3mO/vX9p1nqrJlx27M=;
        fh=PnSw404jJ+s1m+rSaKsD+X9lt69JOcV3ATg/BWbrXZg=;
        b=BYCoPbR/lI8sO8U0NP1rmtlEFfId3Jj7NY8kJnDp5d4FqKfTPy272maMlOO8odAtY+
         1K9RQwa1KAtcifxGPqLM3UV0lNtavGDdI2TeHJQVTNzj04OufrfDDttFg1nW9CjCdICi
         S9CkBUVMjektLSLSyvaQP9tXClRSrh0PDo7U8Vcl/2DNgwv8zZcGqz6BXDm7NhKWUh9l
         eaEys435VatsENjcGRqhLPibcRZCbK8qpJSvAOWZkUP6qlBGsr6mW7sfSJ7ik0B89ips
         CpWiqoJ4ErYXF4Wi7in/ptHW1Q7jK376tYQe/5FKh0c53WSfqItQf7TsemHZ5HUEu49z
         Np8A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 4fb4d7f45d1cf-5e5c7472910si10663410a12.159.2025.03.11.07.14.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Mar 2025 07:14:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ts0N2-0007Uh-Iq; Tue, 11 Mar 2025 10:14:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1ts0Mz-0007Bh-7v; Tue, 11 Mar 2025 10:14:09 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1ts0Mw-0007At-Px; Tue, 11 Mar 2025 10:14:08 -0400
Received: from mail.maildlp.com (unknown [172.18.186.231])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZBwf96gGNz6D9js;
 Tue, 11 Mar 2025 22:10:57 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id C5DCF140DB0;
 Tue, 11 Mar 2025 22:14:04 +0800 (CST)
Received: from A2303104131.china.huawei.com (10.203.177.241) by
 frapeml500008.china.huawei.com (7.182.85.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 11 Mar 2025 15:13:57 +0100
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
CC: <eric.auger@redhat.com>, <peter.maydell@linaro.org>, <jgg@nvidia.com>,
 <nicolinc@nvidia.com>, <ddutile@redhat.com>, <berrange@redhat.com>,
 <nathanc@nvidia.com>, <mochs@nvidia.com>, <smostafa@google.com>,
 <linuxarm@huawei.com>, <wangzhou1@hisilicon.com>, <jiangkunkun@huawei.com>,
 <jonathan.cameron@huawei.com>, <zhangfei.gao@linaro.org>
Subject: [RFC PATCH v2 14/20] hw/arm/smmuv3: Install nested ste for CFGI_STE
Date: Tue, 11 Mar 2025 14:10:39 +0000
Message-ID: <20250311141045.66620-15-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20250311141045.66620-1-shameerali.kolothum.thodi@huawei.com>
References: <20250311141045.66620-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.203.177.241]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 frapeml500008.china.huawei.com (7.182.85.71)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=shameerali.kolothum.thodi@huawei.com;
 helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=0.001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Reply-to:  Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
From:  Shameer Kolothum via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: gRV9D9ILStmt

Make use of smmuv3_accel provided _install_nested_ste() for CFGI_STE.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 hw/arm/smmuv3.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index ea63731d61..83159db1d4 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -1286,6 +1286,7 @@ smmuv3_invalidate_ste(gpointer key, gpointer value, gpointer user_data)
     if (sid < sid_range->start || sid > sid_range->end) {
         return false;
     }
+    smmuv3_accel_install_nested_ste(sdev, sid);
     trace_smmuv3_config_cache_inv(sid);
     return true;
 }
@@ -1353,6 +1354,7 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
 
             trace_smmuv3_cmdq_cfgi_ste(sid);
             smmuv3_flush_config(sdev);
+            smmuv3_accel_install_nested_ste(sdev, sid);
 
             break;
         }
-- 
2.34.1

