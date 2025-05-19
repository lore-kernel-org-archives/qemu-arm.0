Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp4200243njb;
        Mon, 19 May 2025 08:38:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWMtLc7MimWrd2suEgL7tnXKuQRBeyHztE4WDegP2nz0x+pa6g/+u3vsGzPftyVW9Uh779rj4wjWh7+dw==@linaro.org
X-Google-Smtp-Source: AGHT+IF0FoOgpqK6pw0H8tf1CmRpHCSAbhqxa5oGdaH0PNRoFPM9DI6iHHoIRxnh6uAZgMvpcmBH
X-Received: by 2002:a05:6e02:1a27:b0:3d9:6485:3a03 with SMTP id e9e14a558f8ab-3db84296ccfmr141539355ab.4.1747669106731;
        Mon, 19 May 2025 08:38:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747669106; cv=none;
        d=google.com; s=arc-20240605;
        b=OcpdailDBg3R06qog0GIWgITzj+25DLYJ5dpI6evKI4Ti6QV9nNT+EWiRhtRrYG9Bg
         o4QP3oNo5lNpQua35fssUDtmvmtBUqTZchr2QoH5C9QjRqWUIYXtyfkjwDTK07BS+50O
         +rQO23Wgn0fGEp2u1hLg8dwK3It899zQSzBOAZc9PuX2b1gnJ18OrDrxwHZJ+F6KKVYS
         wxcmzmm1PgKpnlujs/WokSavre//QmH4RVnKDZ2wx8A12MjBL9PVBjTpQ0u10KF9T2iy
         F3y0OS2AY0BRZH00ysDucHvdR1r1yXQnCoupwXhnKq0ivM0i96APerr8Mf6kgfK4cPMV
         v4cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=F3dkC3htdB6o/GV9Afe3xtTKqKDDlXfaLaXPN/CcVCQ=;
        fh=7CBlhCm8rPguwA6q+glmdL309TG5LEE0NmARedT2V+Q=;
        b=XeCn/ehoC01YLuEaoM3cuJxGkHVINxEOmgcqEyccSIIJ6FxLc0GjuP6kaWO59ZKZ5I
         g+1AVZM2VJkjXoKsUTlymvMLeWhnpfRBFdSpZPK4b7s10+56qJEYkGb+5tUPU1JACjhM
         6SoxRZCuIX+dLme7i2mS+xsEUo7bcmyBtY3eYPATAA3odKCI0m7PdeKWLPmbfzcL2llN
         6Qqq/NTyqX3WEBdx1u4Ul++RQxWrxc+We1fnafo1u0eMAF+iG5PQoX4wzkdnGvrRAIOc
         DbEe8Dgm3q11lCLe3/B/60H358M5nux2XOGUofMHNc/gKUZnksjC8G9SjONuXyhH14WF
         f2uw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e9e14a558f8ab-3db84395affsi44146265ab.15.2025.05.19.08.38.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 May 2025 08:38:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uH2ZF-0007ws-M1; Mon, 19 May 2025 11:38:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1uH2ZC-0007v6-Uj; Mon, 19 May 2025 11:38:14 -0400
Received: from [185.176.79.56] (helo=frasgout.his.huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1uH2ZA-0007Ss-6t; Mon, 19 May 2025 11:38:14 -0400
Received: from mail.maildlp.com (unknown [172.18.186.216])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4b1MFL2ZmWz6L4wJ;
 Mon, 19 May 2025 23:35:02 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
 by mail.maildlp.com (Postfix) with ESMTPS id B3B12140276;
 Mon, 19 May 2025 23:38:07 +0800 (CST)
Received: from a2303103017.china.huawei.com (10.203.177.99) by
 frapeml500003.china.huawei.com (7.182.85.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 19 May 2025 17:38:06 +0200
To: <mst@redhat.com>, <imammedo@redhat.com>
CC: <qemu-devel@nongnu.org>, <anisinha@redhat.com>, <armbru@redhat.com>,
 <berrange@redhat.com>, <dapeng1.mi@linux.intel.com>, <eric.auger@redhat.com>, 
 <farman@linux.ibm.com>, <gustavo.romero@linaro.org>,
 <jiangkunkun@huawei.com>, <jonathan.cameron@huawei.com>,
 <linuxarm@huawei.com>, <mtosatti@redhat.com>, <peter.maydell@linaro.org>,
 <philmd@linaro.org>, <qemu-arm@nongnu.org>, <richard.henderson@linaro.org>,
 <shameerali.kolothum.thodi@huawei.com>, <shannon.zhaosl@gmail.com>,
 <yangyicong@hisilicon.com>, <zhao1.liu@intel.com>
Subject: [PATCH v11 3/6] bios-tables-test: prepare to change ARM ACPI virt PPTT
Date: Mon, 19 May 2025 16:36:29 +0100
Message-ID: <20250519153632.537-4-alireza.sanaee@huawei.com>
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
X-TUID: o6fBm8K1L4Bc

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
2.43.0

