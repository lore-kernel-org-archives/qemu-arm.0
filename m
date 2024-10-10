Received: by 2002:a17:504:1f11:b0:1be9:327d:8ee3 with SMTP id z17csp1432719njl;
        Thu, 10 Oct 2024 04:19:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX5IQdHcg44Xl1Qvhe0akWPSkieQ2ZHQDAWCXgbUVExtTYdRsdnb2DGlDRvv4rveDs9qXhOqG/azLdQig==@linaro.org
X-Google-Smtp-Source: AGHT+IEchnDFakxMdBlBx1816dPF9lPEpsugkekJKAM7Oj3lcz+MbtANFADOxevPN+25pr/R/cZW
X-Received: by 2002:a05:6902:2681:b0:e1d:acf3:126c with SMTP id 3f1490d57ef6-e28fe47d980mr5117882276.28.1728559150962;
        Thu, 10 Oct 2024 04:19:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728559150; cv=none;
        d=google.com; s=arc-20240605;
        b=Dt8ubrwrzZI07jHId6xhAzbrlDiGKOvdCQCZP5mQQHSVP62dJp4+P+7dyqOUTNtX6F
         0o3KlzMyT7iuoioIIkYY8GJsEEaS6NZdIZFqQL5qtqYFS05/pE1dM6aFJ+1dQfZXrCBz
         mtl/9qpBo+e5XHUHewnAXFh+3K0rtr6fk2jvxLwkYUPPvgwAlbfs7Q6qHCR3s/mLtoux
         rr0/+WPDIY7yg2BtUCLSrWTtUC/wLuZ6F9p6I7dDlEeam4O23XboYiltbwGwHuN2bGe/
         O39cybXqed5K5wyDGDUfWlQiOqd3eqxrCdvoNcbschOflpjp8/MvhkdqOND7HGLkf8ix
         vljQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=T7Eankj5oqHZZifInGArnkMVTz5eVNOe7xiVANfYbVI=;
        fh=rWf9XuWQsI9arb3S/1QVkVJRzitX9+a8CSyR5OF0OEQ=;
        b=IrR6/S/3vupg/pQBNt/wCeYHN6ehlVTQVZuexSCwv/DC6D/jpRKd0ft6Liy7oROEi0
         zd2DE2TreWU5MoaoJ1OtQ/XDgSU5JIY4JpbvH25OMsCTjFs6i3JHwmInDkZdKJF6HLlY
         RekB9m72iMf7vI6+/dFRAlb9tkZ676x5GCuenoaL7lnAPR3xNx8CJYQs2KJuSmI4HbDH
         UHh6TQ/e7AuX/0t/KKSJbe2OQMRYpyZ7gsUsGP5F2wllhp0Swnq+k8kq5C8y8Vc8ArG/
         CtVONp5mb9UUIwZsX0dojh/jDYR5aA9I/wNUt8wV93vrKz/GXgHl1gLkhu5P9dYGI47q
         8SuQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b114998e9csi115020785a.277.2024.10.10.04.19.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Oct 2024 04:19:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1syrCG-0000nA-ET; Thu, 10 Oct 2024 07:19:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1syrCE-0000mH-1o; Thu, 10 Oct 2024 07:19:06 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1syrCC-0004q4-Ch; Thu, 10 Oct 2024 07:19:05 -0400
Received: from mail.maildlp.com (unknown [172.18.186.216])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XPS1S1Y7Zz6K8lN;
 Thu, 10 Oct 2024 19:18:36 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
 by mail.maildlp.com (Postfix) with ESMTPS id A13EC1400D9;
 Thu, 10 Oct 2024 19:18:56 +0800 (CST)
Received: from a2303103017.china.huawei.com (10.126.168.143) by
 frapeml500003.china.huawei.com (7.182.85.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 10 Oct 2024 13:18:55 +0200
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <zhao1.liu@intel.com>, <zhenyu.z.wang@intel.com>,
 <dapeng1.mi@linux.intel.com>, <yongwei.ma@intel.com>, <armbru@redhat.com>,
 <farman@linux.ibm.com>, <peter.maydell@linaro.org>, <mst@redhat.com>,
 <anisinha@redhat.com>, <shannon.zhaosl@gmail.com>, <imammedo@redhat.com>,
 <mtosatti@redhat.com>, <berrange@redhat.com>, <richard.henderson@linaro.org>, 
 <linuxarm@huawei.com>, <shameerali.kolothum.thodi@huawei.com>,
 <Jonathan.Cameron@Huawei.com>, <jiangkunkun@huawei.com>,
 <yangyicong@hisilicon.com>
Subject: [PATCH v3 1/6] bios-tables-test: prepare to change ARM ACPI virt PPTT
Date: Thu, 10 Oct 2024 12:18:17 +0100
Message-ID: <20241010111822.345-2-alireza.sanaee@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241010111822.345-1-alireza.sanaee@huawei.com>
References: <20241010111822.345-1-alireza.sanaee@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.168.143]
X-ClientProxiedBy: lhrpeml500001.china.huawei.com (7.191.163.213) To
 frapeml500003.china.huawei.com (7.182.85.28)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=alireza.sanaee@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 2oKy1bXIhkNS

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

