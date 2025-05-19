Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp4199647njb;
        Mon, 19 May 2025 08:37:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVZI/+gf2OoFIRvBhs++eCRbW2+SiVz7oNe231nAyxGqUEUgwLnseplBMuJztGmtbIx/fK+1zbab4QcZg==@linaro.org
X-Google-Smtp-Source: AGHT+IGq8PhYV0vNzRsS30Q9AuXM12iVgSFwNIDibw03dV1TdI04H95EH9PwGIpxj7oc/zkIpooO
X-Received: by 2002:a05:6214:202e:b0:6e8:9dfa:d932 with SMTP id 6a1803df08f44-6f8b0836cc1mr229981306d6.15.1747669047606;
        Mon, 19 May 2025 08:37:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747669047; cv=none;
        d=google.com; s=arc-20240605;
        b=TueimY5eSELMv1hq/AT8Ts+YXmoCvP2DMqyl0/RzkHLiIuAWhp+PInfumrfzEBp44+
         frUBNkNllzxIu+t+xQwbgwul3bd4eD55RA22OihsG+XFojO5qEFiyeLXNBaCJYKWi1oM
         U4G60bp/SSfL46WtxXaa1fxjwnTOJJNAkc4ekx+8zhW+cFUzCw3UinjVFb5QknHuipLf
         T0eqjADIGGh4YUX8eMuUGJcLuxqlaEdEOzHvX3LZokazcz80hcNkiTzBS783gLsVQRYu
         oS2lsr6HNuXPe0flX1/M6p28YgmMGwuzHSW0nIkg+4ynZJhL/Ns4sxx49O1klYgz1eIX
         ICOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=/B0LH41rGXaDKJHoyfXvIhVQFb95sBQeE1fhfGSHocU=;
        fh=7CBlhCm8rPguwA6q+glmdL309TG5LEE0NmARedT2V+Q=;
        b=R32bKedn0qMj6iQG0QayeIXG+zC+5W06ZuU53vt6BYM69boRz1X0gQbNHkOMa7xUX3
         KOgsDJW69K6LYQE+ID6pYQuQv2DOSZlJbDzOH+BSmmMhAvwfNWGhiBFWfv10snkDRKHK
         qJn1RnMNe7hKVxIjKe5lroZtlI7AE+0YnuZbtPcDojLjdUJKSROvEmR1DrLey1xZSmRn
         0NizqFu0DvuQd0FcKMEBxMCzmwtCPF55U4vPg+eaYghuNdb1/RAsKnIzfMJqrx6zhTG+
         Q+pMArXFzunCf7aCenMhb/ELdC7I9haM40vkLZqyeYjs4uH/IIU4y50J8gErl63eUXgW
         HtAA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f8c4b6c485si59522736d6.308.2025.05.19.08.37.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 May 2025 08:37:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uH2YP-0006Jp-2S; Mon, 19 May 2025 11:37:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1uH2YE-0006I7-12; Mon, 19 May 2025 11:37:19 -0400
Received: from [185.176.79.56] (helo=frasgout.his.huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1uH2YB-0007Pa-SX; Mon, 19 May 2025 11:37:13 -0400
Received: from mail.maildlp.com (unknown [172.18.186.216])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4b1MB81XJxz6M4Gv;
 Mon, 19 May 2025 23:32:16 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
 by mail.maildlp.com (Postfix) with ESMTPS id CFB4A1402EF;
 Mon, 19 May 2025 23:37:04 +0800 (CST)
Received: from a2303103017.china.huawei.com (10.203.177.99) by
 frapeml500003.china.huawei.com (7.182.85.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 19 May 2025 17:37:03 +0200
To: <mst@redhat.com>, <imammedo@redhat.com>
CC: <qemu-devel@nongnu.org>, <anisinha@redhat.com>, <armbru@redhat.com>,
 <berrange@redhat.com>, <dapeng1.mi@linux.intel.com>, <eric.auger@redhat.com>, 
 <farman@linux.ibm.com>, <gustavo.romero@linaro.org>,
 <jiangkunkun@huawei.com>, <jonathan.cameron@huawei.com>,
 <linuxarm@huawei.com>, <mtosatti@redhat.com>, <peter.maydell@linaro.org>,
 <philmd@linaro.org>, <qemu-arm@nongnu.org>, <richard.henderson@linaro.org>,
 <shameerali.kolothum.thodi@huawei.com>, <shannon.zhaosl@gmail.com>,
 <yangyicong@hisilicon.com>, <zhao1.liu@intel.com>
Subject: [PATCH v11 1/6] target/arm/tcg: increase cache level for cpu=max
Date: Mon, 19 May 2025 16:36:27 +0100
Message-ID: <20250519153632.537-2-alireza.sanaee@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250519153632.537-1-alireza.sanaee@huawei.com>
References: <20250519153632.537-1-alireza.sanaee@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.203.177.99]
X-ClientProxiedBy: lhrpeml500005.china.huawei.com (7.191.163.240) To
 frapeml500003.china.huawei.com (7.182.85.28)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 185.176.79.56 (deferred)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=alireza.sanaee@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: DTj7YYY7UH8Y

This patch addresses cache description in the `aarch64_max_tcg_initfn`
function for cpu=max. It introduces three layers of caches and modifies
the cache description registers accordingly.

Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 target/arm/tcg/cpu64.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 29ab0ac79d..1405506594 100644
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

