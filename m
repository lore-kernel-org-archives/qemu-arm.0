Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp533344lfq;
        Thu, 17 Sep 2020 05:27:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz8YlzdOnzEYIzo8nc0jutOCrptBrhPHIhUTv0r+rjoF7SQu4VAKuG850NE7vGOFhy1UxTH
X-Received: by 2002:a5b:ad1:: with SMTP id a17mr20750229ybr.488.1600345645051;
        Thu, 17 Sep 2020 05:27:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600345645; cv=none;
        d=google.com; s=arc-20160816;
        b=Yo35fyRfq9oI4ti8dW2ZG6DDTmEo5wNmNvfC4Khb7dDi7J7XykgNjqs2v7wIYqBwTo
         Mwik3X3Z4+ZnTX8CRn0V2N6SFyneg3MHgM8dnzpBeAcPFC+e7GOwy7wKPOJe44Rj1Cdp
         491OQQpJGr/Mu3aDGycy2aFml0QpT1x1gg2mTeoJksYRbk/DHFYl4LAiWr8U9fP8/yP4
         M1D+0Tf+6DJuPhxUAMN7fE4ACNWdOU4hxCc9fhjl8sEssG7hoIYIAhjHQuZG5Xvl6IQW
         mcTCgNWR75XOpwilKCFQuzGonLf2bMOn/Vanl3GYvEg7fzh33cY1Azp5khO86v2kGD+Q
         ejmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=Oa1ZFtVQ1Il4bObh3pBUVp2XQucv/5EN77QB7tvIAwE=;
        b=J4E+ns0FG/H/AqrU7MRRNEEW6xvwt0vyQ1tqWaWqWxwxvhd0aTtUu5trHBxfWProNr
         8OMoD46NnOb7zPE4forHnO6C3TRKKwAinWvbvjrn6l/zvImDSe4UMXSjbO/Ke0yQTmrS
         iNRUBc3JnklMR/3UyYtaLRiJ2rj1qLs8rSzX9fHyeGD+ep5Pc2BwCWj5qRZ3ytZPdUWV
         PfmA/JwW/BYfAD1NVLx3KuPY++VHlQCVhRpgkXPYIpZYG/+60ActDvkLYGm/XYvxfqTX
         fDbzqecp6BAOSuLQAU9uGC83aeFfaj8rYpgCY3OtK8cYNQedd+AuQoGQkyxrDwem1zXf
         tACQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j132si999180ybc.13.2020.09.17.05.27.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Sep 2020 05:27:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kIt0W-0003xL-5w
	for alex.bennee@linaro.org; Thu, 17 Sep 2020 08:27:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1kIswr-00008I-Rq; Thu, 17 Sep 2020 08:23:37 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:51600 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1kIswp-0003R9-EG; Thu, 17 Sep 2020 08:23:37 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 66995CFAC79B39438DFC;
 Thu, 17 Sep 2020 20:23:32 +0800 (CST)
Received: from localhost.localdomain (10.175.104.175) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Thu, 17 Sep 2020 20:23:23 +0800
From: Peng Liang <liangpeng10@huawei.com>
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [RFC v2 10/10] target/arm: Add CPU features to
 query-cpu-model-expansion
Date: Thu, 17 Sep 2020 20:14:49 +0800
Message-ID: <20200917121449.3442059-11-liangpeng10@huawei.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200917121449.3442059-1-liangpeng10@huawei.com>
References: <20200917121449.3442059-1-liangpeng10@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35;
 envelope-from=liangpeng10@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/17 08:23:09
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, drjones@redhat.com,
 zhang.zhanghailiang@huawei.com, mst@redhat.com, cohuck@redhat.com,
 xiexiangyou@huawei.com, Peng Liang <liangpeng10@huawei.com>,
 pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rv1Ku7JK/khE

Add CPU features to the result of query-cpu-model-expansion so that
other applications (such as libvirt) can know the supported CPU
features.

Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
Signed-off-by: Peng Liang <liangpeng10@huawei.com>
---
 target/arm/monitor.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/monitor.c b/target/arm/monitor.c
index ba6e01abd037..bcc4209e950d 100644
--- a/target/arm/monitor.c
+++ b/target/arm/monitor.c
@@ -104,6 +104,10 @@ static const char *cpu_model_advertised_features[] = {
     "sve640", "sve768", "sve896", "sve1024", "sve1152", "sve1280",
     "sve1408", "sve1536", "sve1664", "sve1792", "sve1920", "sve2048",
     "kvm-no-adjvtime",
+    "aes", "sha1", "sha2", "crc32", "atomics", "asimdrdm", "sha3", "sm3", "sm4",
+    "asimddp", "asimdfhm", "flagm", "rng", "dcpop", "jscvt", "fcma", "lrcpc",
+    "frint", "sb", "i8mm", "bf16", "dgh", "fp", "asimd", "dit", "bt", "sbss",
+    "uscat", "fphp", "asimdhp", "pmull", "sha512", "flagm2", "dcpodp", "ilrcpc",
     NULL
 };
 
-- 
2.26.2

