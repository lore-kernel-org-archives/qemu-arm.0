Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp3647925lfa;
        Sun, 1 Nov 2020 21:45:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzzEucNWxQqcHCbvWQR63l1xX1dAqK5G5S2ja747+G2SFDcxo8kO3dZeDApN1chPvMZTYur
X-Received: by 2002:a37:5f85:: with SMTP id t127mr12758760qkb.180.1604295916115;
        Sun, 01 Nov 2020 21:45:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604295916; cv=none;
        d=google.com; s=arc-20160816;
        b=TIRWh9PX1w6sPlirsw377ZJwrm8ejtu+mNeGaXJO5tbJYcc8yy3qmW+xVczZb0CT2c
         dGOfwczAOROjAchL77O3oIA8kUNFpCJnKHMlxcxU+zC7GOSdfkbA8T6+23sMAmXy6kyg
         O5rsAjKUySx8EMSeJ2XYjImGhnxS5Vs7VIzVO9nBQwWqt1GVqVNSZG2FRxq+x1aaZK2U
         rcOFjp3iaz38mE/tNohycPZRTjWuKFxYtMjDslw4hhvd0e1uBXQ5k6rcB2EMIw6f44wl
         dwLTx6p7SkQsAWmYcD1vMZljoYEHEv4FD//uIftkhGqgQR2ahlYV62XSEVURahussSV4
         DAIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=CLvjbIHFkRDZPoIAjQyxiU5cJC2xH9P/BfJvLwljrno=;
        b=Jx2X77A54tgc0vJpRzmdCAGotE4xDbGZjXvKceDf8Rz0UmU8irIA5B+mLAwy4ooXP4
         NcWDAwzz7G1nXru7bycfTOBXCvg1+NtRvbiK0a8UkE+xz9KU3cUWnnNExlfCaU9plMhW
         95EU3568SQKl9RuAbuhQLo/xFIhv9rxwB1jVtnxYZKZBn1NeVS0yQRDVdWpbPNs80zBB
         FRcbT/TMa76HzYJP+EuuC2nAfipOu1/sd7toYyxiVGAKEAarsjR8CBlv+Nr4wSxU3yoW
         0OAt4DkXG3/A0r9tKBUMkH5VxEWRO/xeyRFo0kUbzqaJXbMa4GuW9zsDpCQl42D4dkG0
         luSA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s24si2431318qtq.220.2020.11.01.21.45.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 01 Nov 2020 21:45:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:35806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kZSeZ-00036Y-Db
	for alex.bennee@linaro.org; Mon, 02 Nov 2020 00:45:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1kZSdN-0002Vh-W3; Mon, 02 Nov 2020 00:44:02 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1kZSdM-0001NX-3C; Mon, 02 Nov 2020 00:44:01 -0500
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CPhfy2hQ5zkcX7;
 Mon,  2 Nov 2020 13:43:54 +0800 (CST)
Received: from localhost.localdomain (10.175.124.27) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.487.0; Mon, 2 Nov 2020 13:43:50 +0800
From: Peng Liang <liangpeng10@huawei.com>
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [RFC v3 10/10] target/arm: Add CPU features to
 query-cpu-model-expansion
Date: Mon, 2 Nov 2020 13:40:55 +0800
Message-ID: <20201102054055.686143-11-liangpeng10@huawei.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201102054055.686143-1-liangpeng10@huawei.com>
References: <20201102054055.686143-1-liangpeng10@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=liangpeng10@huawei.com; helo=szxga04-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/02 00:43:42
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, drjones@redhat.com,
 zhang.zhanghailiang@huawei.com, mst@redhat.com, cohuck@redhat.com,
 xiexiangyou@huawei.com, Peng Liang <liangpeng10@huawei.com>,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XmlmZbIOGcwu

Add CPU features to the result of query-cpu-model-expansion so that
other applications (such as libvirt) can know the supported CPU
features.

Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
Signed-off-by: Peng Liang <liangpeng10@huawei.com>
---
 target/arm/monitor.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/monitor.c b/target/arm/monitor.c
index 169d8a64b651..7950206352f1 100644
--- a/target/arm/monitor.c
+++ b/target/arm/monitor.c
@@ -104,6 +104,10 @@ static const char *cpu_model_advertised_features[] = {
     "sve640", "sve768", "sve896", "sve1024", "sve1152", "sve1280",
     "sve1408", "sve1536", "sve1664", "sve1792", "sve1920", "sve2048",
     "kvm-no-adjvtime", "kvm-steal-time",
+    "aes", "sha1", "sha2", "crc32", "atomics", "asimdrdm", "sha3", "sm3", "sm4",
+    "asimddp", "asimdfhm", "flagm", "rng", "dcpop", "jscvt", "fcma", "lrcpc",
+    "frint", "sb", "i8mm", "bf16", "dgh", "fp", "asimd", "dit", "bt", "sbss",
+    "uscat", "fphp", "asimdhp", "pmull", "sha512", "flagm2", "dcpodp", "ilrcpc",
     NULL
 };
 
-- 
2.26.2

