Received: by 2002:a17:504:1f11:b0:1be9:327d:8ee3 with SMTP id z17csp1433142njl;
        Thu, 10 Oct 2024 04:20:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWh9Eu/Cw7+5RokcrOfh0ECr7EkKEJlEc45Xj6DC7pm6VHsQ9In8ut6EWO3gaLT6cK+Rsi2gMbdJ8R/Fw==@linaro.org
X-Google-Smtp-Source: AGHT+IHqMmPJpWHTFHE0w9VNFS7X4oG5/3NDgCisjQ8t0qD2uQuuZqGfFZyUkab+599Na4icNYrN
X-Received: by 2002:a05:622a:1e92:b0:45d:8513:f29d with SMTP id d75a77b69052e-4603ed2adf7mr46586091cf.20.1728559204391;
        Thu, 10 Oct 2024 04:20:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728559204; cv=none;
        d=google.com; s=arc-20240605;
        b=WVbTDKEv5bfaN/CFAuTgojgjaf0OS2y899DG7Ez/IkEV6uFipsBAhXSd7EtTPNSlQx
         z6e5ceSotR2r+TVQjpDNOD0e/0HbGRppIoHls2tknN9YHxVh7KvFD29mCsGCxg5NAunI
         TPZHBTW6kCJYSmjQSyEoGmD3rXDj4HDOQQPQ1HWHXqdjmomsTGJWnoMf7/vIvr4wWtyx
         rsyf+gHeC/oxSkeGDrx6GMkOXqSrD57a8aRIi6YSgukmOpb2jpaN6Pef9SfVLhEumoVe
         pxtLtOumg/B5IfhPExRujGw4JqsJ+i+A2Ev5BesnlqCY7piOQ0zU+8F+kGipRzVRSMAc
         biiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=Lo8RffmdMxwayqakr9LRRD5IPAGPIFeYyOq3H6MR2hQ=;
        fh=rWf9XuWQsI9arb3S/1QVkVJRzitX9+a8CSyR5OF0OEQ=;
        b=cGSa000Fd7qf4KE7l++lyBHIBD6ma0WWF/g7Y2GQFboZhw6YN64lAMTyY/BNn8Xik5
         gsDLaw0SFKAUnXVM+CQehunrDAKa8U1jSRqyLvPzkaKloVv/0I8VlzgVn2GHfh9h7GOX
         OXCSV5d1aQEs+LKn/YokXjjqqje0LCywNl8eE6xK4niHfGKBsqVBihpHn+o9hBwEQwT8
         IU1h/ptvrGyb+720pbznSZ8rcCNRw2NhETjgF6Dv2Nq706DKAVMb8MdFI18yzQ87t8nr
         BySyXMk9IHW80CuLj2ardb43D3ZGB7Gvbdi48pfLv2cnD9fHcH2QIkNWs0iCzSJoj/qz
         VltA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-460428814f0si11660781cf.326.2024.10.10.04.20.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Oct 2024 04:20:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1syrCn-0001cs-R7; Thu, 10 Oct 2024 07:19:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1syrCi-0001Uv-Rx; Thu, 10 Oct 2024 07:19:36 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1syrCf-0004s8-Dh; Thu, 10 Oct 2024 07:19:35 -0400
Received: from mail.maildlp.com (unknown [172.18.186.31])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XPRxR667tz6LD3l;
 Thu, 10 Oct 2024 19:15:07 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
 by mail.maildlp.com (Postfix) with ESMTPS id 8462F140391;
 Thu, 10 Oct 2024 19:19:28 +0800 (CST)
Received: from a2303103017.china.huawei.com (10.126.168.143) by
 frapeml500003.china.huawei.com (7.182.85.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 10 Oct 2024 13:19:27 +0200
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <zhao1.liu@intel.com>, <zhenyu.z.wang@intel.com>,
 <dapeng1.mi@linux.intel.com>, <yongwei.ma@intel.com>, <armbru@redhat.com>,
 <farman@linux.ibm.com>, <peter.maydell@linaro.org>, <mst@redhat.com>,
 <anisinha@redhat.com>, <shannon.zhaosl@gmail.com>, <imammedo@redhat.com>,
 <mtosatti@redhat.com>, <berrange@redhat.com>, <richard.henderson@linaro.org>, 
 <linuxarm@huawei.com>, <shameerali.kolothum.thodi@huawei.com>,
 <Jonathan.Cameron@Huawei.com>, <jiangkunkun@huawei.com>,
 <yangyicong@hisilicon.com>
Subject: [PATCH v3 2/6] i386/cpu: add IsDefined flag to smp-cache property
Date: Thu, 10 Oct 2024 12:18:18 +0100
Message-ID: <20241010111822.345-3-alireza.sanaee@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241010111822.345-1-alireza.sanaee@huawei.com>
References: <20241010111822.345-1-alireza.sanaee@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.168.143]
X-ClientProxiedBy: lhrpeml500001.china.huawei.com (7.191.163.213) To
 frapeml500003.china.huawei.com (7.182.85.28)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=alireza.sanaee@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Alireza Sanaee <alireza.sanaee@huawei.com>
From:  Alireza Sanaee via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: PKh38XH1PPaJ

This commit adds IsDefined flag to the object and this helps in avoiding
extra checks for every single layer of caches in both x86 and ARM.

Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
---
 hw/core/machine-smp.c | 2 ++
 include/hw/boards.h   | 1 +
 2 files changed, 3 insertions(+)

diff --git a/hw/core/machine-smp.c b/hw/core/machine-smp.c
index 9a28194676..5a02bbf584 100644
--- a/hw/core/machine-smp.c
+++ b/hw/core/machine-smp.c
@@ -371,6 +371,8 @@ bool machine_parse_smp_cache(MachineState *ms,
         return false;
     }
 
+    ms->smp_cache.IsDefined = true;
+
     return true;
 }
 
diff --git a/include/hw/boards.h b/include/hw/boards.h
index db2aa2b706..2883a57084 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -373,6 +373,7 @@ typedef struct CpuTopology {
 
 typedef struct SmpCache {
     SmpCacheProperties props[CACHE_LEVEL_AND_TYPE__MAX];
+    bool IsDefined;
 } SmpCache;
 
 /**
-- 
2.34.1

