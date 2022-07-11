Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp742743lfp;
        Mon, 11 Jul 2022 03:54:32 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t9J5MvXHmiPdzRvAID7xbGMCYtJzaLAtB+npcYZuVAp+0YP7s9fh+X3dr1yzx8PLLi8Udi
X-Received: by 2002:a37:5401:0:b0:6b5:5bce:e975 with SMTP id i1-20020a375401000000b006b55bcee975mr10782489qkb.289.1657536872592;
        Mon, 11 Jul 2022 03:54:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657536872; cv=none;
        d=google.com; s=arc-20160816;
        b=fLNuDW+Crnjnp95UOsZVcsf0JzdoYu40W2OvlpvSnCkopQXfoOR6NcuTruVCaa1VkQ
         lqWxsi09wKdNCVr9HWemN8rH0MBjbxqZWnVVP7QJJ8xOkr/a7Rn53iBhQXG8kZMCjhuS
         gfVF/PeEbHhXTKelkJc198gvn5az6wt0zBp0ZzKFmJAKJ6SRPl+lfgnEx0Y83uz9oSU3
         YEZvLw1lPDf8o1DG9OUF28fxGWFwfHqlv+OMexPirTDEX3DHlnfLB1AC6EALdq2F/b91
         qsMJvfBF4p468A3O798y5iFRBhXG1iomHVzoEMrtWyf/Ul1KmVMo/WlQ+k0dXeSnUUQb
         pHIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=5zKhcXloY3LQBzIFZiMuuZe5JpDFr1qqRTmYU+07pLA=;
        b=usqVyZ6HVi0ORvAnsynrc/+dOWrY2Kfoa4zp35sgE70u/Oou8mdlxcv0xhnMCOfqB2
         CkvjqBf5tVh4QMvgCW0paCd/He3B7UwGR24ugHBSLF+VLusfea8iTLdixFk32l5VfnzX
         NAivdb7rnlYJVNu9792jyv/Hg4Vk5ikySxUJmYoFb9a8NX0tlVg4gjhl1BAbB7fAbTvu
         iQzy+PdnygdoJSYk8LMtdfVk5v0NL+fjKPKEAkcLPZFk8iANiVPMjhemOTEFcXTJfe1R
         gOQ5NkapsoeL5CFRgk56er8iBuTDUO321+Su9CiRwtXYiP3kjz5AUUijorNnJ7c28cuv
         m9Pg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t21-20020a37ea15000000b006af08104887si3677180qkj.372.2022.07.11.03.54.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Jul 2022 03:54:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:59702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oAr3f-0001C4-UF
	for alex.bennee@linaro.org; Mon, 11 Jul 2022 06:54:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hesham.almatary@huawei.com>)
 id 1oAqwe-0007BL-M2; Mon, 11 Jul 2022 06:47:19 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hesham.almatary@huawei.com>)
 id 1oAqwd-0000VN-6m; Mon, 11 Jul 2022 06:47:16 -0400
Received: from fraeml735-chm.china.huawei.com (unknown [172.18.147.201])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4LhLC43pNHz686my;
 Mon, 11 Jul 2022 18:45:52 +0800 (CST)
Received: from lhreml751-chm.china.huawei.com (10.201.108.201) by
 fraeml735-chm.china.huawei.com (10.206.15.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 11 Jul 2022 12:47:12 +0200
Received: from O84201547D.china.huawei.com (10.122.247.218) by
 lhreml751-chm.china.huawei.com (10.201.108.201) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 11 Jul 2022 11:47:11 +0100
To: <jonathan.cameron@huawei.com>, <qemu-devel@nongnu.org>
CC: <yangyicong@huawei.com>, <chenxiang66@hisilicon.com>,
 <linuxarm@huawei.com>, <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>,
 <imammedo@redhat.com>, <wangyanan55@huawei.com>,
 <marcel.apfelbaum@gmail.com>, <eduardo@habkost.net>, <Brice.Goglin@inria.fr>, 
 <mst@redhat.com>
Subject: [PATCH 5/8] tests: Add HMAT AArch64/virt empty table files
Date: Mon, 11 Jul 2022 11:44:33 +0100
Message-ID: <20220711104436.8363-6-hesham.almatary@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220711104436.8363-1-hesham.almatary@huawei.com>
References: <20220711104436.8363-1-hesham.almatary@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.247.218]
X-ClientProxiedBy: lhreml732-chm.china.huawei.com (10.201.108.83) To
 lhreml751-chm.china.huawei.com (10.201.108.201)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=hesham.almatary@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to:  Hesham Almatary <hesham.almatary@huawei.com>
From:  Hesham Almatary via <qemu-devel@nongnu.org>
X-TUID: jLH+k2PryOvF

Signed-off-by: Hesham Almatary <hesham.almatary@huawei.com>
---
 tests/data/acpi/virt/DSDT.acpihmatvirt      | 0
 tests/data/acpi/virt/FACP.acpihmatvirt      | 0
 tests/data/acpi/virt/HMAT.acpihmatvirt      | 0
 tests/data/acpi/virt/SRAT.acpihmatvirt      | 0
 tests/qtest/bios-tables-test-allowed-diff.h | 4 ++++
 5 files changed, 4 insertions(+)
 create mode 100644 tests/data/acpi/virt/DSDT.acpihmatvirt
 create mode 100644 tests/data/acpi/virt/FACP.acpihmatvirt
 create mode 100644 tests/data/acpi/virt/HMAT.acpihmatvirt
 create mode 100644 tests/data/acpi/virt/SRAT.acpihmatvirt

diff --git a/tests/data/acpi/virt/DSDT.acpihmatvirt b/tests/data/acpi/virt/DSDT.acpihmatvirt
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/virt/FACP.acpihmatvirt b/tests/data/acpi/virt/FACP.acpihmatvirt
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/virt/HMAT.acpihmatvirt b/tests/data/acpi/virt/HMAT.acpihmatvirt
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/virt/SRAT.acpihmatvirt b/tests/data/acpi/virt/SRAT.acpihmatvirt
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..44594cae59 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,5 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/virt/DSDT.acpihmatvirt",
+"tests/data/acpi/virt/FACP.acpihmatvirt",
+"tests/data/acpi/virt/HMAT.acpihmatvirt",
+"tests/data/acpi/virt/SRAT.acpihmatvirt",
-- 
2.25.1

