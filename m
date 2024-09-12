Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp522774nji;
        Thu, 12 Sep 2024 06:39:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWZmOIvBPD5nNrHlrEiiUUU7NwKAjwA2g4QEKmh66Z+l/9Ba271ckKD/GQeRkWxrGVlI4dPedh4r0J0yA==@linaro.org
X-Google-Smtp-Source: AGHT+IEk5NEycRA2/YeYqIC1iej9Q2sPeBuuJKX2n98w9nTYhOf/1hTagwWBQt9O9nwH2Th9x3xW
X-Received: by 2002:a05:622a:64f:b0:458:5070:e758 with SMTP id d75a77b69052e-458603cc372mr35660221cf.42.1726148378008;
        Thu, 12 Sep 2024 06:39:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726148377; cv=none;
        d=google.com; s=arc-20240605;
        b=RgwqfJKMGPwuw9kamNuIY0capFAWkvk/b632/vpNeHQuophLwhfnd8dBf3WYbeNhUR
         U/LvtCuCTAaz9oR4CjYJHyLqgRcaFm6CH762z2SCBrnf9N8i4dYKJjogkVH2if9Cb04X
         Mtxl2mNoRYp4k9+1TO/hZ4qb/Eog1Kos15kxkmKjHBJ65GzntMdDipJMGiNSMGlNDyHR
         NY7jLKE7rYDMvKIC/GpSE65OGH/pncrR5v4D4CyDmbIp0vCzyQ1KBmIivI0qgsJLm2Rq
         auYkqazaoeYftfP9s8fW3kkLq1dJE8vd6mJw4TKwoeH9/1J2a0e7QWZTQSElQr7Rm6yb
         0BTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=H8YINF3RJAxReZYCofb3kfUhFmFgQu31SMBdX+FCwPU=;
        fh=FkJWaune7hMuK+jemAGcJmHRm42IOkVpZLD1KexBaC8=;
        b=QG7IOj/bQQioUJp4hxE/mm+uJUqCfPkBG4SMeVt7mgScTsrJRLInNzUcWHBrz5bYnn
         7X974DnNYe1bu+WDUFTxk9fejwPsnI0yPzPk6O13UjneudHMn3huz31ZmA5E0/vzbyEy
         D5vbF0NZxLtzY/NCRxiJJ1t7O07Nyr3a12+l2Fak1abnm49N3jm69nf7nTy+BBSZMp6c
         I5xqz7TAW7godNhZlmxVFFVJLpcAd2iUoounVglBNgWBn4MboYeM3UYngfzCBCv0G9Hl
         Ppwcfqrfg4vZflFOeFIGBGhtKr16gUdJfe2JmWuzAM+CMyQFVU8VZ9h94BV8MxEywjIc
         FFBQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45822f8275fsi130583411cf.503.2024.09.12.06.39.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Sep 2024 06:39:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sok2i-00027d-2z; Thu, 12 Sep 2024 09:39:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1sok2c-0001uX-Vd; Thu, 12 Sep 2024 09:39:24 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1sok2a-0008Uo-DA; Thu, 12 Sep 2024 09:39:21 -0400
Received: from mail.maildlp.com (unknown [172.18.186.31])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4X4JM61QcPz6K75P;
 Thu, 12 Sep 2024 21:34:26 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
 by mail.maildlp.com (Postfix) with ESMTPS id D52B91400C9;
 Thu, 12 Sep 2024 21:39:16 +0800 (CST)
Received: from a2303103017.china.huawei.com (10.48.147.42) by
 frapeml500003.china.huawei.com (7.182.85.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 12 Sep 2024 15:39:15 +0200
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <zhao1.liu@intel.com>, <zhenyu.z.wang@intel.com>,
 <dapeng1.mi@linux.intel.com>, <yongwei.ma@intel.com>, <armbru@redhat.com>,
 <farman@linux.ibm.com>, <peter.maydell@linaro.org>, <mst@redhat.com>,
 <anisinha@redhat.com>, <shannon.zhaosl@gmail.com>, <imammedo@redhat.com>,
 <mtosatti@redhat.com>, <berrange@redhat.com>, <richard.henderson@linaro.org>, 
 <linuxarm@huwei.com>, <shameerali.kolothum.thodi@huawei.com>,
 <Jonathan.Cameron@Huawei.com>, <jiangkunkun@huawei.com>
Subject: [PATCH 1/5] bios-tables-test: prepare to change ARM ACPI virt PPTT
Date: Thu, 12 Sep 2024 14:38:25 +0100
Message-ID: <20240912133829.400-2-alireza.sanaee@huawei.com>
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
X-TUID: p0Eawh8tZqRm

Prepare to update `build_pptt` function to add cache description
functionalities, thus add binaries in this patch.

Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..e84d6c6955 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,4 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/aarch64/virt/PPTT",
+"tests/data/acpi/aarch64/virt/PPTT.acpihmatvirt",
+"tests/data/acpi/aarch64/virt/PPTT.topology",
-- 
2.34.1

