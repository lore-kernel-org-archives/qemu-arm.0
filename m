Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp522895nji;
        Thu, 12 Sep 2024 06:39:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXxhzg5lU7QvQKOnCMJjtp5dkPbSKYFBliaJ1XEUI8/9SjqnZn/jENkkKEWmtdPLDn/Jn1ZI/G70oeocQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHLsbgjjqJabJB6PPPAdR7futNDHGbnW9+NAXV44TiyO5HQfDE1ppn8dkBld5hAEbsXNgfS
X-Received: by 2002:ac8:5703:0:b0:458:2ce1:26f8 with SMTP id d75a77b69052e-45860464431mr35268481cf.60.1726148397852;
        Thu, 12 Sep 2024 06:39:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726148397; cv=none;
        d=google.com; s=arc-20240605;
        b=GV4EQ/IcmKaQJB5JTJ2SiOGS8jXk76NGIzPPJd9oYHajguECf1TZHBLnHHjRDMM/r4
         MC8CElVlk9zK5heJpNlOAoorFUPTaWIQ9cBMiH3vBA16QxhA2VV/b+cQI46ZEdwazv/o
         QPIBVnCv9SCLLWQHHkjtWTCRmtIpHyVGGULlf6bvGI8ujzOvyWp1WLY8igpdrtEq+lpq
         eUuk5CgSz13ck7y5JxV8JeIwVtmeJLGrbs/Qto92cIQ/AZqFdSpZmqmpJyU4Rt3BYMjg
         03dL2oTMzs7h6UenfrDoLAMMu1fbZKLHgMbgKf1QBJb6vCn4Dpzs9Bp5pCtiKwExqMhf
         47xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=Lo8RffmdMxwayqakr9LRRD5IPAGPIFeYyOq3H6MR2hQ=;
        fh=FkJWaune7hMuK+jemAGcJmHRm42IOkVpZLD1KexBaC8=;
        b=LkGry/y3xVWIso74hashsTV3cqsJb01iAGKiRH4/8LGUBnH4qzuLJCdI0GnaK54u22
         mJC3I6Dw6v8AlPoruvj6pEeC3kZDhPb4G0Kc6cpfteKXV4n38hDfl3/8CxwEhOLNEboQ
         MT/IttMhltnL9FG2ANoiKEhR+hJrr4rZKNr17QjmNw6ZnFZhjXdy709Ue/7aHcKy2nR6
         T1SrWD/qoGFsFA5Dyyeg39MSSqKTU8NQ2r9lRgNr5TjFvVyLmXw1ZFDxJMmwA8ayUfZ+
         YJ5Kmk4oF0Zn5tvLS4dWQbJmxtEGjrZs7Sny9fbUU6sg8uNntngLN/cUxrslQNWt22es
         nNAw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45822f3e268si131278191cf.382.2024.09.12.06.39.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Sep 2024 06:39:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sok38-0004JU-II; Thu, 12 Sep 2024 09:39:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1sok35-00045a-Ot; Thu, 12 Sep 2024 09:39:52 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1sok34-00005X-8j; Thu, 12 Sep 2024 09:39:51 -0400
Received: from mail.maildlp.com (unknown [172.18.186.231])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4X4JMj63RKz6K6lR;
 Thu, 12 Sep 2024 21:34:57 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
 by mail.maildlp.com (Postfix) with ESMTPS id 915F2140B38;
 Thu, 12 Sep 2024 21:39:48 +0800 (CST)
Received: from a2303103017.china.huawei.com (10.48.147.42) by
 frapeml500003.china.huawei.com (7.182.85.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 12 Sep 2024 15:39:47 +0200
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <zhao1.liu@intel.com>, <zhenyu.z.wang@intel.com>,
 <dapeng1.mi@linux.intel.com>, <yongwei.ma@intel.com>, <armbru@redhat.com>,
 <farman@linux.ibm.com>, <peter.maydell@linaro.org>, <mst@redhat.com>,
 <anisinha@redhat.com>, <shannon.zhaosl@gmail.com>, <imammedo@redhat.com>,
 <mtosatti@redhat.com>, <berrange@redhat.com>, <richard.henderson@linaro.org>, 
 <linuxarm@huwei.com>, <shameerali.kolothum.thodi@huawei.com>,
 <Jonathan.Cameron@Huawei.com>, <jiangkunkun@huawei.com>
Subject: [PATCH 2/5] i386/cpu: add IsDefined flag to smp-cache property
Date: Thu, 12 Sep 2024 14:38:26 +0100
Message-ID: <20240912133829.400-3-alireza.sanaee@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240912133829.400-1-alireza.sanaee@huawei.com>
References: <20240912133829.400-1-alireza.sanaee@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.147.42]
X-ClientProxiedBy: lhrpeml100003.china.huawei.com (7.191.160.210) To
 frapeml500003.china.huawei.com (7.182.85.28)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=alireza.sanaee@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-to:  Alireza Sanaee <alireza.sanaee@huawei.com>
From:  Alireza Sanaee via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ZK+dI8o9hqLf

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

