Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp5498103lfp;
        Tue, 28 Sep 2021 20:07:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx9dydrHU6O0tN4mVLildGsGddZNkhXhA+VrgFgxyaLvMQgBT214CF9CBNeMgx8w9xpRx5c
X-Received: by 2002:ae9:d604:: with SMTP id r4mr3197943qkk.401.1632884848742;
        Tue, 28 Sep 2021 20:07:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632884848; cv=none;
        d=google.com; s=arc-20160816;
        b=MtYRv+GP2VRGUHefzw5ZQaLa2xBkXijFt0gDKMknULOKFpEg0/ld6bnWFp9k64HTp5
         ujtMNuaS7LYoE5uwjvSALw68qCchBT3SIALkZS+T05TEuw1zJQoTjqPftL/ApyG0Pwgu
         D0ad6uomVCAesHylunNX/OB6A4S9RAx6wtTlMgm4uxtXitgy7dO91hqpzvwZ84/XzKxV
         wB+9u0e98f+GwWGSBkNUnpL+L/PepydG84CUFx0g3IoEA/pXRx6rLiX2ulIhRlP8dGqc
         kivlz++oNAMwuvzKxuStzpTs6yEaj8x+XzP5k02f9/d3hJBbK2JEXUKyOQT8eGUnAnX7
         MblA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=dj5c/Q51+7nJBRy9TYbNiWHkmdFR1fD/SqVY1CRNTWo=;
        b=BPl4Z33G93t7UjpnVqgh3dfqmqe+vdddR5e8IGm86MqNW0bJEwvEmRNIDlmNxe9yyO
         bpQJmTCSS5ICoWE7h+USAball1t/vD2LQH85jBWoi+UetMwrdgB3/h6TYJa1vef0RQ90
         PBvfJ7cU/qUymJpH8LGlbNfpgBpuMmkDFSfzJ7MqcbS06s96IkCPZt3K8Zux8steGxs8
         NkM+SyXY6LlOmasxbNEuyQWJBq2NBM3jSoIRkApwQxjP6V+EAyaOsYqoWNEqtrI10eAw
         Up0jm/sm3q5u8uRUc7Fr1SFfruZSrlgWpas7oM9ADufV429HKIJYXNwMJlJ8/wSh51pm
         Q2qg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v10si636875qkg.112.2021.09.28.20.07.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Sep 2021 20:07:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:35522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mVPwO-0001yS-2P
	for alex.bennee@linaro.org; Tue, 28 Sep 2021 23:07:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mVPo7-0005b3-CZ; Tue, 28 Sep 2021 22:58:55 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:3178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mVPo4-000644-RP; Tue, 28 Sep 2021 22:58:55 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4HK1Jh2px1z8tX9;
 Wed, 29 Sep 2021 10:57:56 +0800 (CST)
Received: from dggpemm500023.china.huawei.com (7.185.36.83) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Wed, 29 Sep 2021 10:58:37 +0800
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Wed, 29 Sep 2021 10:58:37 +0800
From: Yanan Wang <wangyanan55@huawei.com>
To: Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?=
 <berrange@redhat.com>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, "Markus
 Armbruster" <armbru@redhat.com>
Subject: [PATCH v12 08/16] qtest/numa-test: Use detailed -smp CLIs in
 test_def_cpu_split
Date: Wed, 29 Sep 2021 10:58:08 +0800
Message-ID: <20210929025816.21076-9-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
In-Reply-To: <20210929025816.21076-1-wangyanan55@huawei.com>
References: <20210929025816.21076-1-wangyanan55@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=wangyanan55@huawei.com; helo=szxga03-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Pierre
 Morel <pmorel@linux.ibm.com>, Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>,
 wanghaibin.wang@huawei.com, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: a9x6WVI4Zte5

Since commit 80d7835749 (qemu-options: rewrite help for -smp options),
the preference of sockets/cores in -smp parsing is considered liable
to change, and actually we are going to change it in a coming commit.
So it'll be more stable to use detailed -smp CLIs in the testcases
that have strong dependency on the parsing results.

Currently, test_def_cpu_split use "-smp 8" and will get 8 CPU sockets
based on current parsing rule. But if we change to prefer cores over
sockets we will get one CPU socket with 8 cores, and this testcase
will not get expected numa set by default on x86_64 (Ok on aarch64).

So now explicitly use "-smp 8,sockets=8" to avoid affect from parsing
logic change.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/qtest/numa-test.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/numa-test.c b/tests/qtest/numa-test.c
index fd7a2e80a0..90bf68a5b3 100644
--- a/tests/qtest/numa-test.c
+++ b/tests/qtest/numa-test.c
@@ -42,7 +42,8 @@ static void test_def_cpu_split(const void *data)
     g_autofree char *s = NULL;
     g_autofree char *cli = NULL;
 
-    cli = make_cli(data, "-machine smp.cpus=8 -numa node,memdev=ram -numa node");
+    cli = make_cli(data, "-machine smp.cpus=8,smp.sockets=8 "
+                         "-numa node,memdev=ram -numa node");
     qts = qtest_init(cli);
 
     s = qtest_hmp(qts, "info numa");
-- 
2.19.1

