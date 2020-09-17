Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp209525lfq;
        Wed, 16 Sep 2020 20:22:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx6XB06Xkbsm+rYAApd4QvmbMOd92GOacboZlE7AU0ZPQ9wDuPi9tyLhgy18ldvKosBkvVc
X-Received: by 2002:a25:9d06:: with SMTP id i6mr37481945ybp.510.1600312940884;
        Wed, 16 Sep 2020 20:22:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600312940; cv=none;
        d=google.com; s=arc-20160816;
        b=uw5NPkAxk8cZmJXqwTedgtL0wLlcYRyuchLKY76vS4MDJ6vNKVEbTqMmumZwTlL/U8
         kF+2gkUHfgTqG7jU5XxMhjhrw6ur+gvmt0iyT/GGvvpLK7CcmlwsSwQDjWdOAu/h4ghY
         v6yzvC3cQePNvqIqIdTLKCz0zUPamCYgvXT5xcsdnlY+2oc2R2wQmjANtU5Kafb2vmGN
         dCB6rmYdEOVHnMXw8AVvBwLtIWhsHxeFc3DwPMqHStXqs2QX2z2S/PLyj6CCJBdqx8L9
         GWGJW7meOG8VQJwKdyA4nH01pmbIbSI5iMbTipW8RD20n/N/hKhyv8Fyo7oOsBDWLvYp
         0gtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=3cvLjuNbI68UC9QDGu6ij4Y+z2J8+9OB0E23i3usaHM=;
        b=aFFoOs+rgfTYgYeVM6yi5jQCtE1iK9tScRsEhkluGmnbzRuKZQDTXFKYtldQL4SD8b
         5dwYHOahRFmFu8/g8Fo9gjIf62kWTHZhqp20wknmA5WJNkoziLR61pLJB2nMlNjvrQ0b
         Df70ZFW1VG0lplRftyFKJktkEThXuwgT81mhIbXzkRxd70H26Abln9rptt3BaHZrJjvf
         lT3tsCGSOMWasO2XOS9HEzpG/aTRLS6E/rHgi9YEV9KgR8dK+5oEyZmqTcKh8JllPyxU
         LxN+CHSOZ0t8ZqfO0Sj9je3cBspxFuQrJ4m5CgxR+OeJmBXuaQITuTEfTB5DuCXti7Lb
         8JmA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p16si9364764ybc.437.2020.09.16.20.22.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Sep 2020 20:22:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kIkV2-0005Ty-9B
	for alex.bennee@linaro.org; Wed, 16 Sep 2020 23:22:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kIkUN-0004w5-QJ; Wed, 16 Sep 2020 23:21:39 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:44680 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fangying1@huawei.com>)
 id 1kIkTp-0004QL-M3; Wed, 16 Sep 2020 23:21:39 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 765CCAFAF5B114C6D711;
 Thu, 17 Sep 2020 11:20:53 +0800 (CST)
Received: from localhost (10.174.185.104) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.487.0; Thu, 17 Sep 2020
 11:20:44 +0800
From: Ying Fang <fangying1@huawei.com>
To: <qemu-devel@nongnu.org>
Subject: [RFC PATCH 01/12] linux headers: Update linux header with
 KVM_ARM_SET_MP_AFFINITY
Date: Thu, 17 Sep 2020 11:20:22 +0800
Message-ID: <20200917032033.2020-2-fangying1@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
In-Reply-To: <20200917032033.2020-1-fangying1@huawei.com>
References: <20200917032033.2020-1-fangying1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.185.104]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32; envelope-from=fangying1@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/16 23:20:51
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
 zhang.zhanghailiang@huawei.com, alex.chen@huawei.com, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, alistair.francis@wdc.com,
 Ying Fang <fangying1@huawei.com>, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IT7BTSCUSGPj

Signed-off-by: Ying Fang <fangying1@huawei.com>
---
 linux-headers/linux/kvm.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
index a28c366737..461a2302e7 100644
--- a/linux-headers/linux/kvm.h
+++ b/linux-headers/linux/kvm.h
@@ -1031,6 +1031,7 @@ struct kvm_ppc_resize_hpt {
 #define KVM_CAP_PPC_SECURE_GUEST 181
 #define KVM_CAP_HALT_POLL 182
 #define KVM_CAP_ASYNC_PF_INT 183
+#define KVM_CAP_ARM_MP_AFFINITY 187
 
 #ifdef KVM_CAP_IRQ_ROUTING
 
@@ -1470,6 +1471,8 @@ struct kvm_s390_ucas_mapping {
 #define KVM_S390_SET_CMMA_BITS      _IOW(KVMIO, 0xb9, struct kvm_s390_cmma_log)
 /* Memory Encryption Commands */
 #define KVM_MEMORY_ENCRYPT_OP      _IOWR(KVMIO, 0xba, unsigned long)
+/* Available with KVM_CAP_ARM_MP_AFFINITY */
+#define KVM_ARM_SET_MP_AFFINITY    _IOWR(KVMIO, 0xbb, unsigned long)
 
 struct kvm_enc_region {
 	__u64 addr;
-- 
2.23.0

