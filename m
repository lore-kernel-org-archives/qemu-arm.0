Received: by 2002:a17:505:57c2:b0:1be9:327d:8ee3 with SMTP id yd2csp2377199njb;
        Mon, 16 Dec 2024 09:56:32 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWHVYkt00DXeooKII3wPwDEjZvKrjaQdwj575/nP+mKqQ4QeyOCwURK05WkGxDExfeCmlH5IdDQtbICFQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGZPqDSGEtE2ZS61RkMp2qBhS2XEG6yx4LqmKKO6ca6KZCYZcnI22LXUDHp/D/fHgnV3UxV
X-Received: by 2002:a05:6102:3f12:b0:4af:c5c8:bb4c with SMTP id ada2fe7eead31-4b25d9e13a4mr13574818137.16.1734371792627;
        Mon, 16 Dec 2024 09:56:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734371792; cv=none;
        d=google.com; s=arc-20240605;
        b=XYxGQkhkjp7SGdJAsXKZsGKwyQWJo9Itu1oD/NoyJ3UIOnmhmi5ifuthAji63xecHk
         GR0yLxpQnNKk0y21VXSydl/KwSYGTkcgOvfKL2aCvl6DPLnanRt9z6NhGR4Xvq8/o8W9
         9YaxAFunj7Rmy5AtaoUs8AYPMUhZBJToOmIfg8Ezk6K8Ey7nukCgDLsXzz/z7SWckN25
         SgIFSwwa26s/gQRWrycZtSn5sYexAk50Mi3wKgcVV6vjDjfcUea3PbTAN3yRqdcdnY91
         iejUo8DfQybnK3x0DvUyK0wPjkX0El1ngGGdI9zcc8lAO7/itXWxJLNnkbj59ajtesUS
         ezRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=T7Eankj5oqHZZifInGArnkMVTz5eVNOe7xiVANfYbVI=;
        fh=c7lTQ2T/jPhEzE80GPIxSP+9lCsnxripCSj/Zu0zUXM=;
        b=KuIWgysg/E3L3s7CJUh9mHPL+cOZTa+Wmp+BCz0StPqJ8RUP0SNW1hCZvZ1LSafpzz
         R1DhEwlVanJIX1i07j8w17BzV5C2rXjZCPrSuIxMepVDKmIOOHQbv5uBcb07Tce39xsD
         DuIKJlei0ecF6Mp5ExlkvrI8nedcZia7kGd7xKhL4I03oEuxjza5vPb8rAeyuNY6uPhA
         RR1gULwKsynbJ7ycbEmGPdmSnU3P0/xkCBXorAJ8AYWyDjmcWIk+ceLSSv1WIJKml0Tf
         pQnf3WKlrMR382naVcoUkl7hqmxRfSqJ5wd7xiGwStD6TR3DB5mwEcuwdcSR6IOWVXLe
         /2tQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4b2703e86b4si1397740137.280.2024.12.16.09.56.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Dec 2024 09:56:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tNFKX-0002G1-Hl; Mon, 16 Dec 2024 12:56:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1tNFKW-0002FM-Dt; Mon, 16 Dec 2024 12:56:28 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1tNFKU-0006SG-Hn; Mon, 16 Dec 2024 12:56:27 -0500
Received: from mail.maildlp.com (unknown [172.18.186.31])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4YBnYt0XD2z6K6Np;
 Tue, 17 Dec 2024 01:51:30 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
 by mail.maildlp.com (Postfix) with ESMTPS id 0B9A114010C;
 Tue, 17 Dec 2024 01:56:24 +0800 (CST)
Received: from a2303103017.china.huawei.com (10.47.64.21) by
 frapeml500003.china.huawei.com (7.182.85.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 16 Dec 2024 18:56:22 +0100
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <zhao1.liu@intel.com>, <zhenyu.z.wang@intel.com>,
 <dapeng1.mi@linux.intel.com>, <yongwei.ma@intel.com>, <armbru@redhat.com>,
 <farman@linux.ibm.com>, <peter.maydell@linaro.org>, <mst@redhat.com>,
 <anisinha@redhat.com>, <shannon.zhaosl@gmail.com>, <imammedo@redhat.com>,
 <mtosatti@redhat.com>, <berrange@redhat.com>, <richard.henderson@linaro.org>, 
 <linuxarm@huawei.com>, <shameerali.kolothum.thodi@huawei.com>,
 <Jonathan.Cameron@Huawei.com>, <jiangkunkun@huawei.com>,
 <yangyicong@hisilicon.com>, <sarsanaee@gmail.com>
Subject: [PATCH v4 4/7] bios-tables-test: prepare to change ARM ACPI virt PPTT
Date: Mon, 16 Dec 2024 17:54:11 +0000
Message-ID: <20241216175414.1953-5-alireza.sanaee@huawei.com>
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
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-to:  Alireza Sanaee <alireza.sanaee@huawei.com>
From:  Alireza Sanaee via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: HDmu4euI0+TY

Prepare to update `build_pptt` function to add cache description
functionalities, thus add binaries in this patch.

Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..ba2a8180e9 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,2 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/aarch64/virt/PPTT.topology",
-- 
2.34.1

