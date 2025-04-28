Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp5889330njd;
        Mon, 28 Apr 2025 04:09:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUY22/QoZ6FWJsgbaegBSAdTt65KeVELo0vjjthlgcXq4da0R9WdOBauld9gzqHKgcoJ6wpgEpF/zu/+w==@linaro.org
X-Google-Smtp-Source: AGHT+IEL27XGml8dMJU9Dg21ZiCdG/PQ1uTPwxKxv+i+Gxtz+iC2OogU534VzlkxT6UWTX3gW3jv
X-Received: by 2002:ac8:5710:0:b0:47a:eade:95eb with SMTP id d75a77b69052e-48132f873ccmr138753021cf.40.1745838580594;
        Mon, 28 Apr 2025 04:09:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745838580; cv=none;
        d=google.com; s=arc-20240605;
        b=G1vi/cs5TlJFTxm+xU7Gq6fQYDvvktKZ+xTG5uprHjfVuOa6GxG6d5f60MUNejnA+p
         jBRjBANhnS7ndSQ2t54N2cPuU7OmnyIJAWJsCM7a80FG/97VaNbj+yHYDzcA7oCt8q1u
         zer8vPKrBbXHCipjv/3trHMd2GKvtkKV/40gEV6O5FUI8tn/vv47rWCfJLmcujPUSfX8
         SihwiBfWVsyx9mQrWoBd94g2dRZ1+5WgfdkTTDsjYRSif0AcKGDxgjvUdQhG03jdVs76
         sjWI1CRf1L2PlE+UTzDbCuuuPlwOU5ARd/bD92M7dpwsthAke7SkKTrIGrneeEqvoISH
         sPPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=dA1qpXq+EdoQq7A9wTizSPr8ggOqM3xOzk9x7Ewtl28=;
        fh=4I6C6M6UnjJSR8ua+77IMjq+L7KY+8Gqk52ai7dLWhQ=;
        b=OtuTaO+VCm3k21Y73iO2k84iss9wC3k1eqOn32iPOwbz9oQDe3T5LORAc0xywy/SNy
         +ECDmF/T7VsBavzu1ghx0G9n+siKJsA84iKLeLom5foKixyaLJ8SljTSKlUjkGU025mw
         qmEsiHUSCiR52GpeiRthqoXhq7nhNYMo3wNpIqsqk/ogInSAg7GwByWx73PoRUKWPGBi
         n15cCWIzRNVVXFO/PNTICPXF+tz2r6onUNwpG80SPtEanH0B9fudTmh1f5qAB842WzLn
         lyc1oxKCqGKWJhPjTpYC8I4+PuO88bQR/ZlGpk7L52fZN0pJHEvhJnO8J0DhZgyDtdL3
         9iDA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47e9f2ca278si104098831cf.56.2025.04.28.04.09.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Apr 2025 04:09:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1u9MMh-0006cM-QV; Mon, 28 Apr 2025 07:09:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1u9MMf-0006c9-ST; Mon, 28 Apr 2025 07:09:33 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1u9MMe-0001eV-7m; Mon, 28 Apr 2025 07:09:33 -0400
Received: from mail.maildlp.com (unknown [172.18.186.231])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZmLFj1L9Rz6M4k7;
 Mon, 28 Apr 2025 19:05:13 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
 by mail.maildlp.com (Postfix) with ESMTPS id 2A44F1402EF;
 Mon, 28 Apr 2025 19:09:30 +0800 (CST)
Received: from a2303103017.china.huawei.com (10.203.177.99) by
 frapeml500003.china.huawei.com (7.182.85.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 28 Apr 2025 13:09:29 +0200
To: <qemu-devel@nongnu.org>
CC: <philmd@linaro.org>, <alireza.sanaee@huawei.com>, <anisinha@redhat.com>,
 <armbru@redhat.com>, <berrange@redhat.com>, <dapeng1.mi@linux.intel.com>,
 <eric.auger@redhat.com>, <farman@linux.ibm.com>, <gustavo.romero@linaro.org>, 
 <imammedo@redhat.com>, <jiangkunkun@huawei.com>,
 <jonathan.cameron@huawei.com>, <linuxarm@huawei.com>, <mst@redhat.com>,
 <mtosatti@redhat.com>, <peter.maydell@linaro.org>, <qemu-arm@nongnu.org>,
 <richard.henderson@linaro.org>, <shameerali.kolothum.thodi@huawei.com>,
 <shannon.zhaosl@gmail.com>, <yangyicong@hisilicon.com>, <zhao1.liu@intel.com>
Subject: [PATCH v10 3/6] bios-tables-test: prepare to change ARM ACPI virt PPTT
Date: Mon, 28 Apr 2025 12:07:51 +0100
Message-ID: <20250428110754.48-4-alireza.sanaee@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250428110754.48-1-alireza.sanaee@huawei.com>
References: <20250428110754.48-1-alireza.sanaee@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.203.177.99]
X-ClientProxiedBy: lhrpeml100012.china.huawei.com (7.191.174.184) To
 frapeml500003.china.huawei.com (7.182.85.28)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=alireza.sanaee@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.01, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
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
X-TUID: 7a8Y1MyTxks/

Prepare to update `build_pptt` function to add cache description
functionalities, thus add binaries in this patch.

Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8bf4..e84d6c695520 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,4 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/aarch64/virt/PPTT",
+"tests/data/acpi/aarch64/virt/PPTT.acpihmatvirt",
+"tests/data/acpi/aarch64/virt/PPTT.topology",
-- 
2.34.1

