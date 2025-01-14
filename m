Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp2582462njn;
        Tue, 14 Jan 2025 09:50:02 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWRE/CkmxAAdHGAh0ty4M6eIj6cHyxxfSHt1W3qIwG/bdLKYT2bqJXCC+D5SMBZ7//beAO0xQquZ3OGyA==@linaro.org
X-Google-Smtp-Source: AGHT+IHM5wkYP6RNgM2Q6TJe2pgzUnZaE8SnP9khmT9uuOArSksnI9gOMGM3n86zgfP9ZAjpBxpZ
X-Received: by 2002:a05:620a:3943:b0:7a9:9f44:3f8 with SMTP id af79cd13be357-7bcf3643230mr2788086585a.5.1736877002683;
        Tue, 14 Jan 2025 09:50:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736877002; cv=none;
        d=google.com; s=arc-20240605;
        b=amMVw8xnxvW1o9l0O6+keDf8Fn5UGxKYkFmNWVMLewY4Id0uTiFxDk4QfMmYjX/+t4
         kSUCuwptsWljwAD246HJ3wwyd1S6dDqzan2WmVxOaSWIsxP0keYl6ft2Jg67nz49nldP
         GA2mp/wKvUL0NX70/p/pPKvgDAODUquVE2ruJCswVMUjXQTUXp+JH6SrP0r78zBZEFQH
         km5Kd81CRYpNPtcWEDDGvAMU7hL8xkOTTfK1GvBUe1iS5zX3Tq4zNXHwiGSfWVjr3z6/
         mPteyytE5cTcm04f7g3ll0vMFxO5yA+a9em2ocmIDaEefIstlnD2nBTxORSY5/EaHvo0
         tokg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=WT86oW4Ia2crL0IN0KiTwB+wOtod2Aw+nAN+Pz4EeCs=;
        fh=u35wjCyBUalnTisuY87AvAhLybom2PQyiZZ8ckjJPsw=;
        b=jnjTliZFUnp5m4s8q2XrGr8EU4Ipxew7SejTTMJqR9jb6gQUa2Ay1mkay+cQTBnq/y
         q/xXmfEUqsdJuGyUfrTjrj876DtTo/hUQPKfNr+2brqflQ6MUb4N6E+pxuhnZ9CfoXmj
         ljxgN8DlYRSG7Osv1KQvdMmvqvi4HD8fyTMzNFQuZ/r0Vltx07wImdMh5PZ7wPxT5xkt
         HTMNm+HWhmGq8raaF7pS21Zw32rvAzdqgyq5yMuRwLR2hYPu5CQuf5jy7Xv5JGjD+Tca
         hmQo4JvvaulH5Ic6cLFZG9d638rqcdFew30dRYRud07/SqV79sT5ddPgfeZ7QtsbfO4E
         IEfw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7bce32360b6si1359488785a.159.2025.01.14.09.50.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jan 2025 09:50:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tXl30-0006JC-IV; Tue, 14 Jan 2025 12:49:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1tXl2g-0006Ft-3T; Tue, 14 Jan 2025 12:49:30 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1tXl2e-0005bt-Md; Tue, 14 Jan 2025 12:49:29 -0500
Received: from mail.maildlp.com (unknown [172.18.186.216])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4YXc670N1Yz6M4Jq;
 Wed, 15 Jan 2025 01:47:43 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
 by mail.maildlp.com (Postfix) with ESMTPS id 005A4140B35;
 Wed, 15 Jan 2025 01:49:27 +0800 (CST)
Received: from a2303103017.china.huawei.com (10.47.72.65) by
 frapeml500003.china.huawei.com (7.182.85.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 14 Jan 2025 18:49:25 +0100
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <zhao1.liu@intel.com>, <zhenyu.z.wang@intel.com>,
 <dapeng1.mi@linux.intel.com>, <armbru@redhat.com>, <farman@linux.ibm.com>,
 <peter.maydell@linaro.org>, <mst@redhat.com>, <anisinha@redhat.com>,
 <shannon.zhaosl@gmail.com>, <imammedo@redhat.com>, <mtosatti@redhat.com>,
 <berrange@redhat.com>, <richard.henderson@linaro.org>, <linuxarm@huawei.com>, 
 <shameerali.kolothum.thodi@huawei.com>, <Jonathan.Cameron@Huawei.com>,
 <jiangkunkun@huawei.com>, <yangyicong@hisilicon.com>, <sarsanaee@gmail.com>
Subject: [PATCH v6 6/7] tests/qtest/bios-table-test: testing new ARM ACPI PPTT
 topology
Date: Tue, 14 Jan 2025 17:46:00 +0000
Message-ID: <20250114174601.23-7-alireza.sanaee@huawei.com>
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
X-TUID: tPLmTRhzU6W/

Test new PPTT topolopy with cache representation.

Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 tests/qtest/bios-tables-test.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 0a333ec435..6bdc25f4df 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -2142,6 +2142,10 @@ static void test_acpi_aarch64_virt_tcg_topology(void)
     };
 
     test_acpi_one("-cpu cortex-a57 "
+                  "-M virt,smp-cache.0.cache=l1i,smp-cache.0.topology=cluster,"
+                  "smp-cache.1.cache=l1d,smp-cache.1.topology=cluster,"
+                  "smp-cache.2.cache=l2,smp-cache.2.topology=cluster,"
+                  "smp-cache.3.cache=l3,smp-cache.3.topology=cluster "
                   "-smp sockets=1,clusters=2,cores=2,threads=2", &data);
     free_test_data(&data);
 }
-- 
2.34.1

