Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp6307693lfk;
        Sun, 21 Nov 2021 19:27:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJycUpc7wnQqEXDFLkYnyK172UuvzuOnZpqzAiYR7MhPNoO6S1YQWXz5eWwsxwBBTOjD1/56
X-Received: by 2002:a05:6122:548:: with SMTP id y8mr155305103vko.24.1637551634869;
        Sun, 21 Nov 2021 19:27:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637551634; cv=none;
        d=google.com; s=arc-20160816;
        b=MogtcPIaLxJzfUsIfe1OiUNq2lVsAZygzJzyCYPDf3EhjjRfL7snizDeQbtQApYrHN
         UnDDcOxP1hfGtucfAM7R5ZfBJI5YXRQkde+dq5cqUl8zspH6txxSw7ZsBVU+NDjTV6q7
         os093QJe8uWcJF7RY05zv3hwvvbvyH9qBSQ3eIl9S/AU9eFwgHkM4mMvQTXa1g8jPI5v
         n54BplEA8P5e4vXZOsJsp+5dQOFBRxzk/NnjrTtji+aXXmBS3RflcYQ+THLD9qbt+JXg
         MH2Ve05Gh+UmC/d8c1MqnW97AtMm7rXUx69AeRLMfrQdU1gJi7WVM0LZHeiC7l03yaVV
         cpOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :message-id:date:subject:cc:to;
        bh=gD0otah8uzjY9KcZRvL90ArQSaML4LV/m0jPR437Gis=;
        b=MNsaJs1G1NPX4es//3Gd0xf7B+NyHcymvPPHjZI3J95hdoVR0OlkLNHrs+VHKTPXm1
         binwbLTyB2FvLcURUjyHTn+NLcEFoCe4YgQu2U81V2CNO18VzNivNLZdzv1p3SPmxkb2
         9Le3mVPhW/yfeQtnObGXM3UJIdskKgdQrpceOHypgrb531mbEbjeiNSmjpa1znSfbrUD
         PQVFhlOeOTCeFEXwkCtW79X+BNpj4qiadXSl5hV3q5j2GQBZa1seDKnyfmSi0gtB4B91
         FPMApodO+bWGviErF/+Ai16stxusbeKK7H5Rg4gmMdnylSoWyYzIlYF/HPUfeTpdmDU+
         J3fA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y12si19842480vsj.157.2021.11.21.19.27.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 21 Nov 2021 19:27:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:48032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mozz8-0004Ae-8t
	for alex.bennee@linaro.org; Sun, 21 Nov 2021 22:27:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mozyz-00049G-Pj; Sun, 21 Nov 2021 22:27:05 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:4108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyanan55@huawei.com>)
 id 1mozyu-0001u4-VL; Sun, 21 Nov 2021 22:27:05 -0500
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4HyCNj2W3bz914b;
 Mon, 22 Nov 2021 11:26:29 +0800 (CST)
Received: from DESKTOP-TMVL5KK.china.huawei.com (10.174.187.128) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 22 Nov 2021 11:26:53 +0800
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>, <wanghaibin.wang@huawei.com>, Yanan Wang
 <wangyanan55@huawei.com>
Subject: [PATCH for-6.2] qapi/machine.json: Fix incorrect description for
 die-id
Date: Mon, 22 Nov 2021 11:26:51 +0800
Message-ID: <20211122032651.16064-1-wangyanan55@huawei.com>
X-Mailer: git-send-email 2.8.4.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.187.128]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500023.china.huawei.com (7.185.36.83)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=wangyanan55@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to:  Yanan Wang <wangyanan55@huawei.com>
From:  Yanan Wang via <qemu-arm@nongnu.org>
X-TUID: xjAvoQBg/cCY

In terms of scope, die-id should mean "the die number within
socket the CPU belongs to" instead of "the die number within
node/board the CPU belongs to". Fix it to avoid confusing
the Doc reader.

Fixes: 176d2cda0d ("i386/cpu: Consolidate die-id validity in smp context")
Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
---
 qapi/machine.json | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qapi/machine.json b/qapi/machine.json
index 067e3f5378..f1839acf20 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -867,7 +867,7 @@
 #
 # @node-id: NUMA node ID the CPU belongs to
 # @socket-id: socket number within node/board the CPU belongs to
-# @die-id: die number within node/board the CPU belongs to (Since 4.1)
+# @die-id: die number within socket the CPU belongs to (since 4.1)
 # @core-id: core number within die the CPU belongs to
 # @thread-id: thread number within core the CPU belongs to
 #
-- 
2.19.1

