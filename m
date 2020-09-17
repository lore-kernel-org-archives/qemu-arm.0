Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp530839lfq;
        Thu, 17 Sep 2020 05:23:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwOqYSRnZ6G+rIGWXeNHHOZw64sQ8Vrx3lBxvIFrX7N6yCFuMmMTaJPFWvPP7g7xvxDSjGV
X-Received: by 2002:a25:6a41:: with SMTP id f62mr14556880ybc.225.1600345426206;
        Thu, 17 Sep 2020 05:23:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600345426; cv=none;
        d=google.com; s=arc-20160816;
        b=dZ2EqTJnyu67p1M/HJA+kqf2GVN1YneNAjEcFAkHnv3o1cnhctJ6yXCTpHwx9dyL76
         q+97zcFLS+e8vhonZvl6WMCdbmtii0O8RKK4wfD1t+Bir9h1Bgv9Wa/fCrsB1kQuzeHN
         JuWTHa9ubDiZsknISgnjPORyRQgwkKI4Ul70n/tvcjLZFGRtXinF+EjoVa2/EdM6GBs+
         pK4f1fukVSDcgyBkQZiWZW6oMeH0V+eJy2A0HBKCLkF+GW69dkR48KHVVZboYVnRsYem
         o9gLt/CE3kRRF8bcZoW4Aa1OLZkMZ7nhUsL88hQ1fw5shCwCEs28zzkVcjz+CbGmcpxD
         //ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=6H3i/jU2FG5Mwc4eu3H+itHYyEEShkNo5kdOgJtbd20=;
        b=QaI8yE3ekM2XvLMuxdO6uhko6SjmhojkRZrVQR7uRbrhd504sZ39Y6AwNvNMhptANw
         3xp7BL33hA46J3qCWzFtF7DCMY1wGloq1JZaDvL1aH9P50ugj2lWN38tlpm436LgYNfL
         JnJguKKZGVLKosMKglnXn3Kp7hnznK0CvobianwjpqmItytTH0Gn4qnYHgHjy7DZVYrU
         N65t1IDzf92pDmJmwfQth/XWVCc9rv8/Bp9NYy9EVAEtCB7rzp+tWVbUUESKpnBUSyhz
         uHcKz/uj1cGaQ7awob4rUN6FzMF4ttUUdHrgTNbUAzzR7kyAXHTvvh/2U9HxeEatfidB
         zdEw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o14si3775451ybc.322.2020.09.17.05.23.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Sep 2020 05:23:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kIswz-00006v-Jr
	for alex.bennee@linaro.org; Thu, 17 Sep 2020 08:23:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1kIswf-000866-CL; Thu, 17 Sep 2020 08:23:25 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:4761 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liangpeng10@huawei.com>)
 id 1kIswd-0003OY-EQ; Thu, 17 Sep 2020 08:23:25 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 93B15305F13E28443BFD;
 Thu, 17 Sep 2020 20:23:14 +0800 (CST)
Received: from localhost.localdomain (10.175.104.175) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Thu, 17 Sep 2020 20:23:04 +0800
From: Peng Liang <liangpeng10@huawei.com>
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [RFC v2 01/10] linux-header: Introduce KVM_CAP_ARM_CPU_FEATURE
Date: Thu, 17 Sep 2020 20:14:40 +0800
Message-ID: <20200917121449.3442059-2-liangpeng10@huawei.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200917121449.3442059-1-liangpeng10@huawei.com>
References: <20200917121449.3442059-1-liangpeng10@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=liangpeng10@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/17 08:23:14
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
X-TUID: C8f5Bsjf3BLA

Introduce KVM_CAP_ARM_CPU_FEATURE.

Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
Signed-off-by: Peng Liang <liangpeng10@huawei.com>
---
 linux-headers/linux/kvm.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
index a28c3667370b..169eb0bb31c8 100644
--- a/linux-headers/linux/kvm.h
+++ b/linux-headers/linux/kvm.h
@@ -1031,6 +1031,7 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_PPC_SECURE_GUEST 181
 #define KVM_CAP_HALT_POLL 182
 #define KVM_CAP_ASYNC_PF_INT 183
+#define KVM_CAP_ARM_CPU_FEATURE 188
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
-- 
2.26.2

