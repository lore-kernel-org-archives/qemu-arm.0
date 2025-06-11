Received: by 2002:a17:505:790d:b0:1cc9:4ad0:aa2 with SMTP id xu13csp2930379njc;
        Wed, 11 Jun 2025 08:57:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXltwNvrQU+zPytgsNp9nYxuGMArtp0YCe0breZORLyvblvUzvpUOP8FSoU9n+Ry4xdO1o7z2ibqbideQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGXxZWKb5Xio0oc0qcWx8oBbpcuKQ8zyXvxX+N5bXlGS/WmPvC3xTMDhikCqxDnxdTgFJXg
X-Received: by 2002:a05:620a:f05:b0:7ca:f447:c676 with SMTP id af79cd13be357-7d3a887d47cmr583822885a.43.1749657441974;
        Wed, 11 Jun 2025 08:57:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749657441; cv=none;
        d=google.com; s=arc-20240605;
        b=F89S4VOgaGFOYsqEYj5m6EX/RTIo4dOxzyxdfmHkHQW4kaGSr4M3FP8PMBHOoLv8/V
         76nE1oyzh+88NEQ10B45D4N43loEObNKYO6EEAHOXXWOI7dBflOPw784NUhwiwGpaf4i
         R1uILUHfvs4N+ia8fuPUu7oy7ddoYXi7yqhmtGOiyAvEcoeUUN5EcdKXuvPLltlDKWVV
         pLAmbBDXEQNp5OS0js+BXEtWavgtnkaanP26+tpZX41hbJqa0b8jUYIHoo+WJCevbsZZ
         jDLPlTpnIPP0/V+bNh3xSEEFbFQx6nlDKWQ5YLUdC87EdgHaOQIZgYgE6VL3QE382xSV
         ojvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=vbTxCAh8ATwZ09SuqvSm7aqGFIsjlIr0fZMTLhMztaA=;
        fh=BSTR0mN5riEHgpfDGU+Y04a8hUWGOTfFmwR91Qdx2Nw=;
        b=HDMlYCNqSPKUgQ3MUEseOzMqdPvQQeV6Dd8XMTW02D+SC866GCobsv611jNvdnPt5C
         rXgfjBHRxSTkY3sLRjLA3lSjhJE0zEB9cleq8x7xgubBQMmsToZp+dK1cbBxnuaRfbHr
         lPsRPIbdar+haLEXW253UpCQXXGn5UnZ/5S1NVX7HRe82RDU6luqluZDfwGe8WXMbBPs
         J5uNnxJAwDSsY0PrCcG7CisAPT6eTmWNaARj8vOScjeu0S297rUYUC8yQKavx/jHxly1
         jfRJbADgDb7sEAN+f2l9nsfsI7WcW4hEqD43LK916/8P2WAMawVmfDLdTE8posPoFX/g
         CtoA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d24b3cba56si1247355385a.82.2025.06.11.08.57.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Jun 2025 08:57:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uPNox-0000x5-DX; Wed, 11 Jun 2025 11:56:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1uPNov-0000wF-Fj; Wed, 11 Jun 2025 11:56:57 -0400
Received: from [185.176.79.56] (helo=frasgout.his.huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1uPNot-0008On-Lf; Wed, 11 Jun 2025 11:56:57 -0400
Received: from mail.maildlp.com (unknown [172.18.186.216])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bHVXx5ZTbz6L5ZF;
 Wed, 11 Jun 2025 23:52:33 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
 by mail.maildlp.com (Postfix) with ESMTPS id 8585B140370;
 Wed, 11 Jun 2025 23:56:52 +0800 (CST)
Received: from a2303103017.china.huawei.com (10.203.177.99) by
 frapeml500003.china.huawei.com (7.182.85.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Jun 2025 17:56:51 +0200
To: <qemu-devel@nongnu.org>, <mst@redhat.com>
CC: <anisinha@redhat.com>, <armbru@redhat.com>, <berrange@redhat.com>,
 <dapeng1.mi@linux.intel.com>, <eric.auger@redhat.com>,
 <farman@linux.ibm.com>, <gustavo.romero@linaro.org>, <imammedo@redhat.com>,
 <jiangkunkun@huawei.com>, <jonathan.cameron@huawei.com>,
 <linuxarm@huawei.com>, <maobibo@loongson.cn>, <mtosatti@redhat.com>,
 <peter.maydell@linaro.org>, <philmd@linaro.org>, <qemu-arm@nongnu.org>,
 <richard.henderson@linaro.org>, <shameerali.kolothum.thodi@huawei.com>,
 <shannon.zhaosl@gmail.com>, <yangyicong@hisilicon.com>, <zhao1.liu@intel.com>
Subject: [PATCH v13 1/7] target/arm/tcg: increase cache level for cpu=max
Date: Wed, 11 Jun 2025 16:56:12 +0100
Message-ID: <20250611155618.351-2-alireza.sanaee@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250611155618.351-1-alireza.sanaee@huawei.com>
References: <20250611155618.351-1-alireza.sanaee@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.203.177.99]
X-ClientProxiedBy: lhrpeml100005.china.huawei.com (7.191.160.25) To
 frapeml500003.china.huawei.com (7.182.85.28)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 185.176.79.56 (deferred)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=alireza.sanaee@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
X-TUID: M7jzwsXEtufK

This patch addresses cache description in the `aarch64_max_tcg_initfn`
function for cpu=max. It introduces three layers of caches and modifies
the cache description registers accordingly.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
---
 target/arm/tcg/cpu64.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 5d8ed2794d..87e68b10c3 100644
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
2.43.0

