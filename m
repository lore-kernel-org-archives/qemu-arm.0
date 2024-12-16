Received: by 2002:a17:505:57c2:b0:1be9:327d:8ee3 with SMTP id yd2csp2377773njb;
        Mon, 16 Dec 2024 09:57:36 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWlCLwM6/3ANh1ZwSwtvAvGJSsUcKYdMQlqvJOLVN4IQzdVNIItP0Kisz7dwfkQmyf3vZUit2RJHAdAtg==@linaro.org
X-Google-Smtp-Source: AGHT+IG+nxx2oyzMjD5zKs+OP1VBEFQ4SjXfnBY9cm4xAcuC/tc/fF5EbF38G9FNGntGir4RaaTq
X-Received: by 2002:a05:620a:8014:b0:7b6:c543:7e54 with SMTP id af79cd13be357-7b6fbee8269mr2328369385a.22.1734371856691;
        Mon, 16 Dec 2024 09:57:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734371856; cv=none;
        d=google.com; s=arc-20240605;
        b=dhGWUw3fjmPoIdv624lR9A0SmyueknKPUpbTTZFO7Kzvjn3GdJLoQN+V2oU/bPrGez
         d9Si/UAoEao06g6pBPontn6YI1BXSGfbPnd1ri10JZKUStAB6T5rGLFoUpW1xYBamH9O
         SVRb1qiHdFh6o9b4k7OyNon+ZhH4gVTTIiuTikNEeL35ZrpRnQy6X9zSRPSIp1/ddH9i
         AxzSPMwCL9ckWmAWtQ7jNb7zJooNE7EObrdJK/C1xuR9+0cSJcagUPeLVAWb/dDcg1DU
         l8eFFlH33eEtxf5D2H8roa7ydUvjWXE2eClsshPEeBOepgeoqHE8UATCJvkt9y/OEuUR
         lwfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=xmyf1tN4c2tt4pu7ySpPR5ufDwsZL9YQ1mUsNEhLFEs=;
        fh=c7lTQ2T/jPhEzE80GPIxSP+9lCsnxripCSj/Zu0zUXM=;
        b=h3Umt/uoVcW7Pel9fEfMxvaIq/mjl9GReEsu0k7SIZeseLAAuIOMmcv6Bd7ZFIr1ZO
         0vLm2yzbAZHrGBXihgn/U7JrkfPbrtsucLNpAO/kiNMqXikFU+hwZQrok7fbsyJA44Z9
         wnZWnxIhMM5PvwfDDYCKmBsWUTT64gG/9BmlU43fceKaQ4wO3CCS6QRvox9CiSNr0Nl3
         6zV97xbKtQfxJFHd2W/hxXdZoFFcrHmCUYlCVPaXxlPfyIvMg/ou4aC/u6y+YAQdReFp
         dgwe4AUQGjauiDUsepil4uGSNT4sA/fHKBigm6bHi6XyIfseNa58bBP9JHgS6oPzLRGV
         P+9A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b7048cc804si785822385a.374.2024.12.16.09.57.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Dec 2024 09:57:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tNFLX-0003hi-Vc; Mon, 16 Dec 2024 12:57:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1tNFLX-0003fj-BV; Mon, 16 Dec 2024 12:57:31 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1tNFLV-0006ak-TY; Mon, 16 Dec 2024 12:57:31 -0500
Received: from mail.maildlp.com (unknown [172.18.186.231])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4YBngY5Df1z6L995;
 Tue, 17 Dec 2024 01:56:25 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
 by mail.maildlp.com (Postfix) with ESMTPS id E6106140B63;
 Tue, 17 Dec 2024 01:57:27 +0800 (CST)
Received: from a2303103017.china.huawei.com (10.47.64.21) by
 frapeml500003.china.huawei.com (7.182.85.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 16 Dec 2024 18:57:26 +0100
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <zhao1.liu@intel.com>, <zhenyu.z.wang@intel.com>,
 <dapeng1.mi@linux.intel.com>, <yongwei.ma@intel.com>, <armbru@redhat.com>,
 <farman@linux.ibm.com>, <peter.maydell@linaro.org>, <mst@redhat.com>,
 <anisinha@redhat.com>, <shannon.zhaosl@gmail.com>, <imammedo@redhat.com>,
 <mtosatti@redhat.com>, <berrange@redhat.com>, <richard.henderson@linaro.org>, 
 <linuxarm@huawei.com>, <shameerali.kolothum.thodi@huawei.com>,
 <Jonathan.Cameron@Huawei.com>, <jiangkunkun@huawei.com>,
 <yangyicong@hisilicon.com>, <sarsanaee@gmail.com>
Subject: [PATCH v4 6/7] tests/qtest/bios-table-test: testing new ARM ACPI PPTT
 topology
Date: Mon, 16 Dec 2024 17:54:13 +0000
Message-ID: <20241216175414.1953-7-alireza.sanaee@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241216175414.1953-1-alireza.sanaee@huawei.com>
References: <20241216175414.1953-1-alireza.sanaee@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.47.64.21]
X-ClientProxiedBy: lhrpeml500004.china.huawei.com (7.191.163.9) To
 frapeml500003.china.huawei.com (7.182.85.28)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=alireza.sanaee@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-1.13, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: k0oBaUVwesgA

Test new PPTT topolopy with cache representation.

Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
---
 tests/qtest/bios-tables-test.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 36e5c0adde..0f72520664 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -2019,7 +2019,11 @@ static void test_acpi_aarch64_virt_tcg_topology(void)
         .scan_len = 128ULL * 1024 * 1024,
     };
 
-    test_acpi_one("-cpu cortex-a57 "
+    test_acpi_one("-M virt,smp-cache.0.cache=l1i,smp-cache.0.topology=cluster,"
+                  "smp-cache.1.cache=l1d,smp-cache.1.topology=cluster,"
+                  "smp-cache.2.cache=l2,smp-cache.2.topology=cluster,"
+                  "smp-cache.3.cache=l3,smp-cache.3.topology=cluster "
+                  "-cpu cortex-a57 "
                   "-smp sockets=1,clusters=2,cores=2,threads=2", &data);
     free_test_data(&data);
 }
-- 
2.34.1

