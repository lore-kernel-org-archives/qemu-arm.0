Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp2595110njn;
        Tue, 14 Jan 2025 10:09:03 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW/KBvg3sprAYArNzK83wY7lz0z4qxD1P5TlDtTOrN4k6b7A07L3B0a0B70HTJNgzCH/8ltvWTxwauOAw==@linaro.org
X-Google-Smtp-Source: AGHT+IHLxsO06Uq7yIu39mhP+Q6e5+Iq+jB9xoAkv4HPQpvumswDucrxvQNQ2R4E7RyoySs42vaE
X-Received: by 2002:ac8:5e10:0:b0:463:1577:2412 with SMTP id d75a77b69052e-46c710038fbmr351439521cf.20.1736878143420;
        Tue, 14 Jan 2025 10:09:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736878143; cv=none;
        d=google.com; s=arc-20240605;
        b=fkjYmQHe8xoEYTndbLm5ULYLfLCHIeZfBvvG5GWTJnNJ89DJ833tEGuuSUQUZHDoB3
         +ux1/0+6YxbsNRNHwUadMsnsW+vONt8Qhqwe8I3QG+PqKrs2/xSAMqzpMCTpsnbeD4Kh
         RZzUdmme3kg/0bX63WZwPbLH4LfOYgJfzaqcOvqpUlyzrf5f+LP7nKkHy6CTfaLBQG7s
         GVsnAazm+MKlktPho9gG8xg96gAF9wxmX7z2NUE33UjTeccmboVmmOWVZkFpB+Jo/yJM
         js/m2AjcAX66rJ/hfs9OpyuAmvJER2U2w11Fg6lk/wUUcg2LwFvvM3yYENwfF8s1SX3a
         Rrjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=WT86oW4Ia2crL0IN0KiTwB+wOtod2Aw+nAN+Pz4EeCs=;
        fh=Wf0GlacBGpCQs5iWSoQ3UH/vHFiXBQskvCF6xl6SVII=;
        b=jUQnYvWq5YHrdtLicTs+6POL8h8iqHDeXRP46Sm5oFmC6APPYR9VN2ncMPO/aFSs/1
         QDfKiaPq7GCudW2NfkhHKGWkkbC75in+NDdo3JIM8WF8UkZN2DspHPdTqunCjv3CqmzF
         7Kp/InSnwtRxQHgXxaxkWreqtXmDjCw4dubQ/qkh+tTXr/sHZgIdWFf38jaYyzB9RXom
         KJCA9DTtcgCMacRfDKFWkRzoA3yJnYNUiWZqFGyG7rLjhmkXayQrntqPQXYdnZj+V8/S
         lc/sJGubzOGbKL+wk7/gvd7irmcKWkHw2vVqcslpzfzGJjLjiAHxrPL5PSFJ2BJdi5M2
         sraQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46c8735055asi129755571cf.191.2025.01.14.10.09.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jan 2025 10:09:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tXlLY-0006Bp-Jp; Tue, 14 Jan 2025 13:09:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1tXlLU-00067f-Qg; Tue, 14 Jan 2025 13:08:57 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1tXlLT-0001k2-8B; Tue, 14 Jan 2025 13:08:56 -0500
Received: from mail.maildlp.com (unknown [172.18.186.231])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4YXcXs5bckz6L5B1;
 Wed, 15 Jan 2025 02:07:25 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
 by mail.maildlp.com (Postfix) with ESMTPS id 697311402C6;
 Wed, 15 Jan 2025 02:08:53 +0800 (CST)
Received: from a2303103017.china.huawei.com (10.47.72.65) by
 frapeml500003.china.huawei.com (7.182.85.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 14 Jan 2025 19:08:52 +0100
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <zhao1.liu@intel.com>, <dapeng1.mi@linux.intel.com>, <armbru@redhat.com>, 
 <farman@linux.ibm.com>, <peter.maydell@linaro.org>, <mst@redhat.com>,
 <anisinha@redhat.com>, <shannon.zhaosl@gmail.com>, <imammedo@redhat.com>,
 <mtosatti@redhat.com>, <berrange@redhat.com>, <richard.henderson@linaro.org>, 
 <linuxarm@huawei.com>, <shameerali.kolothum.thodi@huawei.com>,
 <Jonathan.Cameron@Huawei.com>, <jiangkunkun@huawei.com>,
 <yangyicong@hisilicon.com>, <sarsanaee@gmail.com>
Subject: [PATCH v6 5/6] tests/qtest/bios-table-test: testing new ARM ACPI PPTT
 topology
Date: Tue, 14 Jan 2025 18:06:10 +0000
Message-ID: <20250114180611.353-6-alireza.sanaee@huawei.com>
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
X-TUID: HcoRS5lCPSD3

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

