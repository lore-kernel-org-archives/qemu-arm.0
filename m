Received: by 2002:a05:7022:629e:b0:68:46be:293d with SMTP id e30csp517161dle;
        Sun, 9 Jul 2023 23:39:40 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFULBNlhYariOLZexmM4EaDBuIgPtrXBDUWtUWv7AJq2I67ynIVF2ampTuNXd25HvGc8Daw
X-Received: by 2002:a05:620a:284c:b0:767:7c08:479e with SMTP id h12-20020a05620a284c00b007677c08479emr12634629qkp.53.1688971179869;
        Sun, 09 Jul 2023 23:39:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688971179; cv=none;
        d=google.com; s=arc-20160816;
        b=ub/SmcW6JVOqc+NF27FKKyOdu9PT67k0R3spLEeGOcsWlrFgKvA7673AXqPFxWIjMR
         pdE+llWDebQm5FI+zWWEb2lhyn1SqgaVuWLiLoJzXQcKS3Ytt+0jHQ70rq5/ut2lExHR
         ufDD/S0pqq13KPZoQjglLBzQjxAPLw0G5FQx0Yk7sE2px5CihCEUWZH2pHFAHOvlt+SC
         7/dFnlf+Jm4wPNyj+3RSud9gYWFLOIScYJqqVcJoTkLZZdeGannF/rd/Nx34HcxcfN54
         nXHKrL1MQMkL3+EBqk6Ep5O1T0WiKSdURVcfR3SNTxXpdITZ0a9ZzQrf7oAI2fPeY/Iz
         o+kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=VuNUrfeEDDkpOumvCpe7TW04UJfTKoonxOjhIrDXMu8=;
        fh=m+atztmj45Qd/LkX8H0+FbRutNyItefegY+LOHd4Ly8=;
        b=SSJbL9o3QKo+shlD4zm0aqsAqkGdhdr0VKhj1npFk2T0rLjmwNhSGBy/E+TVPnsQu0
         UZzVrOVXneGNJHonbCWzGrtWWJppaiygCFWRJ3Zaz0VxpvtMqhxCHLMFwTDJpkiKDLPd
         jwypHq6gY3Ae7D7XjZtsRCo+egDkgkjKoe5lu2ZjwdQy0BbwRBDjH5q7mqnuvD7EUE4w
         JfR0A2SX3jGLmjMABmoC9sM8wc009gkMOm/kTkrNoS/1si2hhRfeXjkZxfYzTkWmGvQa
         assClA/0sFWo7hdThMZwnAxPRp3HBgxEfi1FBmdrF1XTDxY3MUgtxr6bV60GXJ6XpenV
         oNWA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id rf6-20020a05620a8e8600b00767cd2196ebsi1282018qkn.153.2023.07.09.23.39.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 09 Jul 2023 23:39:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qIkY2-0008GL-8C; Mon, 10 Jul 2023 02:39:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyuquan1236@phytium.com.cn>)
 id 1qIkY1-0008G2-QD; Mon, 10 Jul 2023 02:39:01 -0400
Received: from zg8tmja5ljk3lje4ms43mwaa.icoremail.net ([209.97.181.73])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wangyuquan1236@phytium.com.cn>)
 id 1qIkXx-0000JY-Rz; Mon, 10 Jul 2023 02:39:01 -0400
Received: from prodtpl.icoremail.net (unknown [10.12.1.20])
 by hzbj-icmmx-7 (Coremail) with SMTP id AQAAfwDHO00Bp6tkik47Aw--.39654S2;
 Mon, 10 Jul 2023 14:36:49 +0800 (CST)
Received: from phytium.com.cn (unknown [123.150.8.50])
 by mail (Coremail) with SMTP id AQAAfwBn0650p6tkw1kAAA--.693S4;
 Mon, 10 Jul 2023 14:38:47 +0800 (CST)
From: Yuquan Wang <wangyuquan1236@phytium.com.cn>
To: rad@semihalf.com, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org,
 chenbaozi@phytium.com.cn, Yuquan Wang <wangyuquan1236@phytium.com.cn>
Subject: [PATCH 1/1] hw/arm/sbsa-ref: set 'slots' property of xhci
Date: Mon, 10 Jul 2023 14:37:50 +0800
Message-Id: <20230710063750.473510-2-wangyuquan1236@phytium.com.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230710063750.473510-1-wangyuquan1236@phytium.com.cn>
References: <20230710063750.473510-1-wangyuquan1236@phytium.com.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAfwBn0650p6tkw1kAAA--.693S4
X-CM-SenderInfo: 5zdqw5pxtxt0arstlqxsk13x1xpou0fpof0/1tbiAQAQAWSrBqcCUgAAsu
Authentication-Results: hzbj-icmmx-7; spf=neutral smtp.mail=wangyuquan
 1236@phytium.com.cn;
X-Coremail-Antispam: 1Uk129KBjvdXoWrKrWUKr4kAw4xJr1rAr17trb_yoW3KFX_CF
 4fC3y7Wrs3ArWIva4Yya1qvryxtw4rKrsIqFn7ua95t3WjgFW5CwsFkrn5tFWUuayxWryS
 va45Ar43JF1UWjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrnU
 Uv73VFW2AGmfu7jjvjm3AaLaJ3UjIYCTnIWjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRUUUUU
 UUUU=
Received-SPF: pass client-ip=209.97.181.73;
 envelope-from=wangyuquan1236@phytium.com.cn;
 helo=zg8tmja5ljk3lje4ms43mwaa.icoremail.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: DlkJ9Ethhx9i

This extends the slots of xhci to 64, since the default xhci_sysbus
just supports one slot.

Signed-off-by: Wang Yuquan <wangyuquan1236@phytium.com.cn>
Signed-off-by: Chen Baozi <chenbaozi@phytium.com.cn>
---
 hw/arm/sbsa-ref.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 64e1cbce17..bc89eb4806 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -611,6 +611,7 @@ static void create_xhci(const SBSAMachineState *sms)
     hwaddr base = sbsa_ref_memmap[SBSA_XHCI].base;
     int irq = sbsa_ref_irqmap[SBSA_XHCI];
     DeviceState *dev = qdev_new(TYPE_XHCI_SYSBUS);
+    qdev_prop_set_uint32(dev, "slots", XHCI_MAXSLOTS);
 
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
     sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
-- 
2.34.1

