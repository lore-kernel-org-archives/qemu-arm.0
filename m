Received: by 2002:a17:504:1b46:b0:1be9:327d:8ee3 with SMTP id t6csp4099900njh;
        Wed, 4 Jun 2025 06:37:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVM6a9gZsUremvi+PmntamlOdfSqspl6bVAI2YSkCZ21r6UOnjtDNgiSH8Dppnmfyzk92kHFyeJR6OGjA==@linaro.org
X-Google-Smtp-Source: AGHT+IGRikNAX+y8xbltuOsBYuJ2tx4Xfuyd9xmozmZ24QQgBqQyfhoaR8/mC4fcRu5hPNaMzf9Z
X-Received: by 2002:a05:6214:2aae:b0:6fa:ba15:e9d with SMTP id 6a1803df08f44-6faf6f93671mr41099956d6.4.1749044274133;
        Wed, 04 Jun 2025 06:37:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749044274; cv=none;
        d=google.com; s=arc-20240605;
        b=jEjPAyP4bWOiJ6c3xk7dV8/n7++2DbOYpjhJWOSdJWcAa0ZzSMy49Jn4yPwUFzpkoo
         UN7YmEMpxhQSIa4KtqGNLt21HPPG9tMCcQn5/NFjBtD7vExnw0gSlh066oNkhIyfT/4T
         UGS/xDqVsDKT7vrFiktAFB9ReiY8uXl5q5Saq657U1a92uyl5pRB9qB2zbZ/h7T+sBsZ
         okLKhN0scVdoKNfkE9gp8+cBjVLbzQbj5Yt0jMU/TliO9rU1QaVWZI9/ozS0wCNMf6Gc
         7V168XZra1VNSJOJZtb74RXqru6kk+ps088glDaz+bpyViF9Ks9Zu7GgkEqG1PVLPiPR
         Ksqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=Yn83n81bGnuNvDWD2P1xnyOJl+meSe798w/DpmbdoD8=;
        fh=C0Dub1YbqewaCU0k9sFoVramrVk8aBVFkwelzXGVRHg=;
        b=ZdYu5mbyBsmEqD3z04jEVvx1j86ZkLbB1AhNBYIG2zzB9k+zaTDfGXU3tjaWiNtEc3
         rPSEji59e33a1Efp0A8uHaDfgUOowLqXJJGmGK4fbzDM4q7DYXYLj2BYjdt/2okXaSHB
         nsMjJ64WrP4PLWcYLp3CyR3cWb8BWN+zgg50vBldWywLcUyahY7sqqLXymtKdO37kp/m
         xABobUZdfQehp6aLQrN4SAr7i9IdtBAF9cXxtdUQ2w1nQhlbbmXgMdYO4ZHlAwYtJuGL
         k1z1mJ57wXIsSFzTMYzYeGGVl8dDHOU70GeUIaztzUUshiYi5HntI6ifvIYNz8P1qQxg
         4LTA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fac6dab8fdsi146952116d6.99.2025.06.04.06.37.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Jun 2025 06:37:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uMoJE-0000LB-EX; Wed, 04 Jun 2025 09:37:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1uMoJ4-0000Dl-QL; Wed, 04 Jun 2025 09:37:29 -0400
Received: from [185.176.79.56] (helo=frasgout.his.huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1uMoJ3-0006Ch-5q; Wed, 04 Jun 2025 09:37:26 -0400
Received: from mail.maildlp.com (unknown [172.18.186.31])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bC7rM6Rb1z6HJqK;
 Wed,  4 Jun 2025 21:35:47 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
 by mail.maildlp.com (Postfix) with ESMTPS id EC1D51402EA;
 Wed,  4 Jun 2025 21:37:20 +0800 (CST)
Received: from a2303103017.china.huawei.com (10.203.177.99) by
 frapeml500003.china.huawei.com (7.182.85.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 4 Jun 2025 15:37:19 +0200
To: <mst@redhat.com>
CC: <anisinha@redhat.com>, <armbru@redhat.com>, <berrange@redhat.com>,
 <dapeng1.mi@linux.intel.com>, <eric.auger@redhat.com>,
 <farman@linux.ibm.com>, <gustavo.romero@linaro.org>, <imammedo@redhat.com>,
 <jiangkunkun@huawei.com>, <jonathan.cameron@huawei.com>,
 <linuxarm@huawei.com>, <mtosatti@redhat.com>, <peter.maydell@linaro.org>,
 <philmd@linaro.org>, <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>,
 <richard.henderson@linaro.org>, <shameerali.kolothum.thodi@huawei.com>,
 <shannon.zhaosl@gmail.com>, <yangyicong@hisilicon.com>,
 <zhao1.liu@intel.com>, <maobibo@loongson.cn>
Subject: [PATCH v12 5/6] tests/qtest/bios-table-test: testing new ARM ACPI
 PPTT topology
Date: Wed, 4 Jun 2025 14:34:38 +0100
Message-ID: <20250604133439.1592-6-alireza.sanaee@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250604133439.1592-1-alireza.sanaee@huawei.com>
References: <20250604133439.1592-1-alireza.sanaee@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.203.177.99]
X-ClientProxiedBy: lhrpeml500002.china.huawei.com (7.191.160.78) To
 frapeml500003.china.huawei.com (7.182.85.28)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 185.176.79.56 (deferred)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=alireza.sanaee@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: anRgS+kWpiPu

Test new PPTT topolopy with cache representation.

Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 tests/qtest/bios-tables-test.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 0b2bdf9d0d..1f64c784a6 100644
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
2.43.0

