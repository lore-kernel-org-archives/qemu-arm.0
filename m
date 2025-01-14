Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp2594179njn;
        Tue, 14 Jan 2025 10:07:39 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW16WKvhijprfFoK+TZd42jRbytwJ3tp87k5KMWS5MPmRJ2RnV+7XCr7kNxnNDZ2q1n5fz+Slv7iaWKMQ==@linaro.org
X-Google-Smtp-Source: AGHT+IErNl1cklOTKZqXPlpqkTBE5VjwAJApvmhCc9/UYwreCbucRa9ltu6/HH0P9ZbI0u33/QYc
X-Received: by 2002:a05:622a:1a0d:b0:466:99a9:c354 with SMTP id d75a77b69052e-46c71005c9emr438074611cf.22.1736878059300;
        Tue, 14 Jan 2025 10:07:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736878059; cv=none;
        d=google.com; s=arc-20240605;
        b=jBSEtolNSV3oaxX/Vym000Jq4JzXpRk/tTqD90EGrMxJhreNT+l5iaDW1fJHh6sSRY
         trII8Vq6ETDhZ3jgE8z1TOfEXOCe5LDKqMPLQ/QtfHbO1vOakENNfJcBxwTnJyZD8Ucq
         89aYF/Kb6BxUbm1NHgMCH+DwOh092znJ0sRxZjIQBOTDZ2AWMPDNRnaBgitvXlh869ew
         jo2vfP/krgTkveSLC6sq4mta0Up/JBDxbjpttPmfCdqt34rp0pzKl/3i7AyTRvXcdvyk
         zTpcGDYWiAj1eCwsSXgqR4yd1pmeLp9NiHJX2yNxAdyzkXU6ksyOtC5TwPGHoaS/BMBh
         e0Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=y7WfmvUQyFsZaAiynCJPZg9yiunHbGv5puqcXrNH1hY=;
        fh=Wf0GlacBGpCQs5iWSoQ3UH/vHFiXBQskvCF6xl6SVII=;
        b=jtl6XzpT53AIHb9XGZw+FNFQZI8iTBPsAyoJH05p0jl8nZ4/MZIwK6iPVGmLDnrJJZ
         Std8I5lH5lH940C2RNksBj9lKDykg1YJsztjiTilWVPkS/9SSo6CftQYIJ2E9NzfF7eq
         3DnmUrVby2bPvz8HsETfW4poHGHMbMAsISbgd+UrKVGOxYMH0ilNUICY+k4rvpqLWVt2
         2nh5pnFjiz7VIAhIIVKDriLmtKF6FXo3Wx18GSukshs37eBQP22a7qmp9Dck0um+LTT9
         DbxNNg3J/MKXv6lG1tThsAYW4w8uH9dU4exxra9RdWQHwF5cMML0zR4oGM+81nVAkRrp
         zerQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46c873e51cesi115778411cf.308.2025.01.14.10.07.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jan 2025 10:07:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tXlJc-00037C-31; Tue, 14 Jan 2025 13:07:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1tXlJX-00036v-Lo; Tue, 14 Jan 2025 13:06:56 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1tXlJQ-0001S2-Uy; Tue, 14 Jan 2025 13:06:53 -0500
Received: from mail.maildlp.com (unknown [172.18.186.31])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4YXcQS3xkBz6K5my;
 Wed, 15 Jan 2025 02:01:52 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
 by mail.maildlp.com (Postfix) with ESMTPS id 81605140391;
 Wed, 15 Jan 2025 02:06:45 +0800 (CST)
Received: from a2303103017.china.huawei.com (10.47.72.65) by
 frapeml500003.china.huawei.com (7.182.85.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 14 Jan 2025 19:06:44 +0100
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <zhao1.liu@intel.com>, <dapeng1.mi@linux.intel.com>, <armbru@redhat.com>, 
 <farman@linux.ibm.com>, <peter.maydell@linaro.org>, <mst@redhat.com>,
 <anisinha@redhat.com>, <shannon.zhaosl@gmail.com>, <imammedo@redhat.com>,
 <mtosatti@redhat.com>, <berrange@redhat.com>, <richard.henderson@linaro.org>, 
 <linuxarm@huawei.com>, <shameerali.kolothum.thodi@huawei.com>,
 <Jonathan.Cameron@Huawei.com>, <jiangkunkun@huawei.com>,
 <yangyicong@hisilicon.com>, <sarsanaee@gmail.com>
Subject: [PATCH v6 1/6] target/arm/tcg: increase cache level for cpu=max
Date: Tue, 14 Jan 2025 18:06:06 +0000
Message-ID: <20250114180611.353-2-alireza.sanaee@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250114180611.353-1-alireza.sanaee@huawei.com>
References: <20250114180611.353-1-alireza.sanaee@huawei.com>
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
X-TUID: zFdsyXN8nZ2f

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

