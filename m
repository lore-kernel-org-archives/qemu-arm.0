Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp2581143njn;
        Tue, 14 Jan 2025 09:47:34 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWI4X7805OVVCuXyGaqsJJxYTvhlV0Qy/+ebOzz4zaIKnh+uVKtd5jawL8KlOVBtrke/KQ3ThY0IbyH3g==@linaro.org
X-Google-Smtp-Source: AGHT+IFTt10xxK31Ntl+XMea4F4BCj0hbe+E+mDqXN4UgRMFhZfO2/PY6Z8BySEyxItWUTBPQidF
X-Received: by 2002:a05:622a:11d4:b0:467:451b:eba3 with SMTP id d75a77b69052e-46c70fd2146mr372194031cf.8.1736876853899;
        Tue, 14 Jan 2025 09:47:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736876853; cv=none;
        d=google.com; s=arc-20240605;
        b=ikfdvF2Zg967DO79/a/2Qsohzrj4rcBA4MqIx8yhKj4w20u5xBhRAtajKCuf9HCras
         kMj/L+dLw6u5U1r6PZ3u3iq8Evs56u5QTSao3S6A/RYGM53CgLDBB4/Eqf4X8VFF7zVP
         d7y4GWZ+aJVJ+waSkLIu32h9ahUK+bvVAZVEBbcGJKV0Ygn4+WVQxxqthyvZtYuhQTJx
         sn8Riri3ZESw6dhv35LZ5x2AxaH+B62CS+ZY+VFqFTm2nKZQfz/TpmnnTCyomjaGonR3
         EQ8DdoFf9AZkWrXWz7kpVNHLilBxvnbSXo2xPGwC+p/+k0qK4GJTyjpSPZ0ts7AjrEnT
         B3rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=y7WfmvUQyFsZaAiynCJPZg9yiunHbGv5puqcXrNH1hY=;
        fh=u35wjCyBUalnTisuY87AvAhLybom2PQyiZZ8ckjJPsw=;
        b=K8ryDMHqdsStktb3IFI0RJSqFpMjWpRv2Wvs8lShHHz6jQWRf73PTnNQSGh0TqECCr
         bQGFbLWDg3NQuNEflmuMu15hFNLo5uztJfQSDdS75XmJWaPPodqu8PwrN58oA7j5DOiA
         ig+IUTUJKmHXyMrONGxqscShSugJABmzr5CJ9vTyVBVF2Zy50k09BRL8PDClYU2heBPc
         WEhmiwwvmiGXHFaN+w3V3VfYlXROu6kAzScTB7yqAZevo7RRdfIaVLwodBjzEr0z9zvo
         mNCw62cmWFtS1puTG0aTbhM0v5ydkDSWua9b0xE0mPyoZTNLnF/ITjlBYsGXj2FygPu2
         0YlA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46c87350bd5si129703161cf.200.2025.01.14.09.47.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jan 2025 09:47:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tXl0k-0002Da-Kl; Tue, 14 Jan 2025 12:47:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1tXl0Y-00027H-WF; Tue, 14 Jan 2025 12:47:20 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1tXl0W-0004wo-2u; Tue, 14 Jan 2025 12:47:18 -0500
Received: from mail.maildlp.com (unknown [172.18.186.231])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4YXbzx2Rttz6K8kL;
 Wed, 15 Jan 2025 01:42:21 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
 by mail.maildlp.com (Postfix) with ESMTPS id 40FF11409EA;
 Wed, 15 Jan 2025 01:47:14 +0800 (CST)
Received: from a2303103017.china.huawei.com (10.47.72.65) by
 frapeml500003.china.huawei.com (7.182.85.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 14 Jan 2025 18:47:13 +0100
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <zhao1.liu@intel.com>, <zhenyu.z.wang@intel.com>,
 <dapeng1.mi@linux.intel.com>, <armbru@redhat.com>, <farman@linux.ibm.com>,
 <peter.maydell@linaro.org>, <mst@redhat.com>, <anisinha@redhat.com>,
 <shannon.zhaosl@gmail.com>, <imammedo@redhat.com>, <mtosatti@redhat.com>,
 <berrange@redhat.com>, <richard.henderson@linaro.org>, <linuxarm@huawei.com>, 
 <shameerali.kolothum.thodi@huawei.com>, <Jonathan.Cameron@Huawei.com>,
 <jiangkunkun@huawei.com>, <yangyicong@hisilicon.com>, <sarsanaee@gmail.com>
Subject: [PATCH v6 2/7] target/arm/tcg: increase cache level for cpu=max
Date: Tue, 14 Jan 2025 17:45:56 +0000
Message-ID: <20250114174601.23-3-alireza.sanaee@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250114174601.23-1-alireza.sanaee@huawei.com>
References: <20250114174601.23-1-alireza.sanaee@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.47.72.65]
X-ClientProxiedBy: lhrpeml500010.china.huawei.com (7.191.174.240) To
 frapeml500003.china.huawei.com (7.182.85.28)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=alireza.sanaee@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -59
X-Spam_score: -6.0
X-Spam_bar: ------
X-Spam_report: (-6.0 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-1.794, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
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
X-TUID: f828WdTFJV9F

This patch addresses cache description in the `aarch64_max_tcg_initfn`
function for cpu=max. It introduces three layers of caches and modifies
the cache description registers accordingly.

Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 target/arm/tcg/cpu64.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 93573ceeb1..9434804061 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1086,6 +1086,19 @@ void aarch64_max_tcg_initfn(Object *obj)
     uint64_t t;
     uint32_t u;
 
+    /*
+     * Expanded cache set
+     */
+    cpu->clidr = 0x8200123; /* 4 4 3 in 3 bit fields */
+    /* 64KB L1 dcache */
+    cpu->ccsidr[0] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 64 * KiB, 7);
+    /* 64KB L1 icache */
+    cpu->ccsidr[1] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 64, 64 * KiB, 2);
+    /* 1MB L2 unified cache */
+    cpu->ccsidr[2] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 8, 64, 1 * MiB, 7);
+    /* 2MB L3 unified cache */
+    cpu->ccsidr[4] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 8, 64, 2 * MiB, 7);
+
     /*
      * Unset ARM_FEATURE_BACKCOMPAT_CNTFRQ, which we would otherwise default
      * to because we started with aarch64_a57_initfn(). A 'max' CPU might
-- 
2.34.1

