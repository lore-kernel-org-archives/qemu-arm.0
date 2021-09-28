Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp4493754lfp;
        Mon, 27 Sep 2021 21:08:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzYxceg4G2hU4d4N3dtpFKVnHBEUcku/gGNPPSCsiTMrHhJ4OCYOTykvmAnZ5AW0jB5yzx/
X-Received: by 2002:a4a:3ecd:: with SMTP id t196mr3098098oot.69.1632802092046;
        Mon, 27 Sep 2021 21:08:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632802092; cv=none;
        d=google.com; s=arc-20160816;
        b=eEOjvxdgt7igr1+uAUh8/K2VVvcNygR/N0S/PDs8S0B64pb/5RaykQvdV50jArOQxB
         j8DDG4JMTYv80houxksrCo6IUuSoxIiESnOg2a5uGFQ9UCOHO+geFpfIJvxxguw3JO3x
         yJgRApjqMz1AnaSjZNcmTI0EntsTgqy1yrpmzXqqfzcDUKsE1gjxTCZFEgduB4dkb2O0
         tR4MfKIyMFMgIS/cIa5CLCjKx/iSPPArdA3EOTYZxsdfxyKDrlRBlHb8DvFMmABexTB7
         6R1IafPfbo9/9dR8Vv3HZ+mtRvjiU0qw2Y12ee6NNWQ8WygW7+conQvATsNXH4Fmpzff
         u6EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :in-reply-to:message-id:date:subject:to:from;
        bh=FYN91YV5gdpkuxIpEfs1FzC76M8jesdJAJ6UfnZVj/M=;
        b=R+3w//I++dM8f9f406BaMHjdmQ15v90ATpRxbbzsGUDpgvAq3Tb1AvBwa6UQeEI1g8
         i+J4/ZiOrJMd2AwCfClgBtT7VWQG14Awrz6cXY+eTTS84SinYufWO8JjOR99r/XdyqQR
         3g8ulYDzuoLg9Ab4A8xfTa53W2IJx9jTYFk2zhKmNoQg1vpyUjQb3NaoLKAu9ovSA9sa
         bUb+7MWby9t7GKY1RCgWNl857gHhtjDIZcW0JgKJgEHeBDhX9E8oSZhk9AA5U/fqPO7T
         VoLJw0ZZIZCdII9F/yTJCLrMkQ/6Awdf1JvLmSl/Dsyzvdfb9a05Z7GCNa/4KQl1DoRG
         rS3w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l21si18140440ota.320.2021.09.27.21.08.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Sep 2021 21:08:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:52674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mV4PZ-0007Sx-N6
	for alex.bennee@linaro.org; Tue, 28 Sep 2021 00:08:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mV4G1-0001RN-KU; Mon, 27 Sep 2021 23:58:17 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:2870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mV4Fw-0002Gv-Bl; Mon, 27 Sep 2021 23:58:17 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4HJQg42wJbz1DHMj;
 Tue, 28 Sep 2021 11:56:48 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Tue, 28 Sep 2021 11:58:04 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Tue, 28 Sep 2021 11:58:04 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?=
 <berrange@redhat.com>, Andrew Jones <drjones@redhat.com>
Subject: [PATCH v11 06/14] qtest/numa-test: Use detailed -smp CLIs in
 pc_dynamic_cpu_cfg
Date: Tue, 28 Sep 2021 11:57:47 +0800
Message-ID: <20210928035755.11684-7-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210928035755.11684-1-wangyanan55@huawei.com>
References: <20210928035755.11684-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=wangyanan55@huawei.com; helo=szxga08-in.huawei.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Pierre
 Morel <pmorel@linux.ibm.com>, Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>,
 wanghaibin.wang@huawei.com, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: y/dN9BYdHgx7

Since commit 80d7835749 (qemu-options: rewrite help for -smp options),
the preference of sockets/cores in -smp parsing is considered liable
to change, and actually we are going to change it in a coming commit.
So it'll be more stable to use detailed -smp CLIs in testing if we
have strong dependency on the parsing results.

pc_dynamic_cpu_cfg currently assumes/needs that there will be 2 CPU
sockets with "-smp 2". To avoid breaking the test because of parsing
logic change, now explicitly use "-smp 2,sockets=2".

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
---
 tests/qtest/numa-test.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/numa-test.c b/tests/qtest/numa-test.c
index c677cd63c4..fd7a2e80a0 100644
--- a/tests/qtest/numa-test.c
+++ b/tests/qtest/numa-test.c
@@ -265,7 +265,8 @@ static void pc_dynamic_cpu_cfg(const void *data)
     QTestState *qs;
     g_autofree char *cli = NULL;
 
-    cli = make_cli(data, "-nodefaults --preconfig -machine smp.cpus=2");
+    cli = make_cli(data, "-nodefaults --preconfig "
+                         "-machine smp.cpus=2,smp.sockets=2");
     qs = qtest_init(cli);
 
     /* create 2 numa nodes */
-- 
2.19.1

