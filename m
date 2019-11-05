Received: by 2002:adf:db01:0:0:0:0:0 with SMTP id s1csp457807wri;
        Tue, 5 Nov 2019 01:16:54 -0800 (PST)
X-Google-Smtp-Source: APXvYqzB+ysz8Fi/+SGfRl/MwLViioLsKodn+lIVkv0ms8fNUWWSj2N7ZOqB4EefzCIWwxZsw/Ks
X-Received: by 2002:a50:8969:: with SMTP id f38mr34474800edf.211.1572945414848;
        Tue, 05 Nov 2019 01:16:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1572945414; cv=none;
        d=google.com; s=arc-20160816;
        b=jngyPEKUxYIhajrsdjHxO+cXAdfZCutJ9NQW8NoyuBNrLxTAhOw0up6r4ACMdjstqB
         3U4b4Xig19LSNWusszVL5SiXUY/vtasXYaUJRjhk8KypMXljY26hzlipXuXCkkjyN7Rr
         jx5zGBGEOLFs+kupLsGtNs2wVugoVSk+Y9Pf2Kps3Znb5lOAkHZSJc9QF2PAf/o2+Uyi
         sUEtLrSipbzjm2Z//QMKe5G6VqmB20MF42Nnxs9BYe93+/OTvKQlzfLxGICAjfheQDBH
         BcNpTRENc1fKGyMC/2N0X1ojmM49HHh/OEJ93cWOlRpPkyCRJxQXebbz84XbwRsY2iBN
         3Zig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=wxImGTqOKDCP8fOmSl7CUORgjLvMp2wj8JQl+LWyBkU=;
        b=LCDpTdJ95C7VONlPyhmpSSgBVpFtpKUyfeM1L4MxrSqWURaxfDrRDEVmHoJSHQTt1U
         gSsgql/FP2ZlPBuo2Lb/60N4vVIYLOGFwv0pMD5kGttbeZlMCftcBhEZc5sOsAIAPvls
         QnUJ9JfiDYPQmTpZw+a6pGI1UrnPweZDg7pdlzjKMJJL9uNT4KXaE2h9H2J2BOSVKmEH
         lAdSV61LiWbjnwxU9TwufY6721LAhAbyxqTbVBL19tGYgWXtSA4Sex3xZEanZXk8Bt0v
         yChyv4Ie0QS5waxFBiu0ytgnjSt85qydYocebJLYWhrDS8FRhXQx7+TQae2S7Qf857J9
         FlFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x14si9742156edl.128.2019.11.05.01.16.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Nov 2019 01:16:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iRuxJ-0002C3-Sp
	for alex.bennee@linaro.org; Tue, 05 Nov 2019 04:16:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43060)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <guoheyi@huawei.com>) id 1iRusx-00052C-Jl
 for qemu-arm@nongnu.org; Tue, 05 Nov 2019 04:12:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <guoheyi@huawei.com>) id 1iRusv-0007m7-QM
 for qemu-arm@nongnu.org; Tue, 05 Nov 2019 04:12:23 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2196 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <guoheyi@huawei.com>)
 id 1iRusv-0007kO-Do; Tue, 05 Nov 2019 04:12:21 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 4C2F3E89D1355151C65C;
 Tue,  5 Nov 2019 17:12:13 +0800 (CST)
Received: from linux-OtBuvb.huawei.com (10.175.104.212) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.439.0; Tue, 5 Nov 2019 17:12:03 +0800
From: Heyi Guo <guoheyi@huawei.com>
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [RFC v2 02/14] standard-headers: import arm_sdei.h
Date: Tue, 5 Nov 2019 17:10:44 +0800
Message-ID: <20191105091056.9541-3-guoheyi@huawei.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20191105091056.9541-1-guoheyi@huawei.com>
References: <20191105091056.9541-1-guoheyi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.104.212]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.190
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Marc Zyngier <marc.zyngier@arm.com>,
 Cornelia Huck <cohuck@redhat.com>, James Morse <james.morse@arm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Heyi Guo <guoheyi@huawei.com>,
 wanghaibin.wang@huawei.com, Dave Martin <Dave.Martin@arm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Vfvlya6JXaW2

Import Linux header file include/uapi/linux/arm_sdei.h from kernel v5.4-r=
c5.

This is to prepare for qemu SDEI emulation.

Signed-off-by: Heyi Guo <guoheyi@huawei.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Dave Martin <Dave.Martin@arm.com>
Cc: Marc Zyngier <marc.zyngier@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: James Morse <james.morse@arm.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Cornelia Huck <cohuck@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
---

Notes:
    v2:
    - Import arm_sdei.h by running update-linux-headers.sh

 include/standard-headers/linux/arm_sdei.h | 73 +++++++++++++++++++++++
 1 file changed, 73 insertions(+)
 create mode 100644 include/standard-headers/linux/arm_sdei.h

diff --git a/include/standard-headers/linux/arm_sdei.h b/include/standard=
-headers/linux/arm_sdei.h
new file mode 100644
index 0000000000..568d971915
--- /dev/null
+++ b/include/standard-headers/linux/arm_sdei.h
@@ -0,0 +1,73 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/* Copyright (C) 2017 Arm Ltd. */
+#ifndef _LINUX_ARM_SDEI_H
+#define _LINUX_ARM_SDEI_H
+
+#define SDEI_1_0_FN_BASE			0xC4000020
+#define SDEI_1_0_MASK				0xFFFFFFE0
+#define SDEI_1_0_FN(n)				(SDEI_1_0_FN_BASE + (n))
+
+#define SDEI_1_0_FN_SDEI_VERSION			SDEI_1_0_FN(0x00)
+#define SDEI_1_0_FN_SDEI_EVENT_REGISTER			SDEI_1_0_FN(0x01)
+#define SDEI_1_0_FN_SDEI_EVENT_ENABLE			SDEI_1_0_FN(0x02)
+#define SDEI_1_0_FN_SDEI_EVENT_DISABLE			SDEI_1_0_FN(0x03)
+#define SDEI_1_0_FN_SDEI_EVENT_CONTEXT			SDEI_1_0_FN(0x04)
+#define SDEI_1_0_FN_SDEI_EVENT_COMPLETE			SDEI_1_0_FN(0x05)
+#define SDEI_1_0_FN_SDEI_EVENT_COMPLETE_AND_RESUME	SDEI_1_0_FN(0x06)
+#define SDEI_1_0_FN_SDEI_EVENT_UNREGISTER		SDEI_1_0_FN(0x07)
+#define SDEI_1_0_FN_SDEI_EVENT_STATUS			SDEI_1_0_FN(0x08)
+#define SDEI_1_0_FN_SDEI_EVENT_GET_INFO			SDEI_1_0_FN(0x09)
+#define SDEI_1_0_FN_SDEI_EVENT_ROUTING_SET		SDEI_1_0_FN(0x0A)
+#define SDEI_1_0_FN_SDEI_PE_MASK			SDEI_1_0_FN(0x0B)
+#define SDEI_1_0_FN_SDEI_PE_UNMASK			SDEI_1_0_FN(0x0C)
+#define SDEI_1_0_FN_SDEI_INTERRUPT_BIND			SDEI_1_0_FN(0x0D)
+#define SDEI_1_0_FN_SDEI_INTERRUPT_RELEASE		SDEI_1_0_FN(0x0E)
+#define SDEI_1_0_FN_SDEI_PRIVATE_RESET			SDEI_1_0_FN(0x11)
+#define SDEI_1_0_FN_SDEI_SHARED_RESET			SDEI_1_0_FN(0x12)
+
+#define SDEI_VERSION_MAJOR_SHIFT			48
+#define SDEI_VERSION_MAJOR_MASK				0x7fff
+#define SDEI_VERSION_MINOR_SHIFT			32
+#define SDEI_VERSION_MINOR_MASK				0xffff
+#define SDEI_VERSION_VENDOR_SHIFT			0
+#define SDEI_VERSION_VENDOR_MASK			0xffffffff
+
+#define SDEI_VERSION_MAJOR(x)	(x>>SDEI_VERSION_MAJOR_SHIFT & SDEI_VERSIO=
N_MAJOR_MASK)
+#define SDEI_VERSION_MINOR(x)	(x>>SDEI_VERSION_MINOR_SHIFT & SDEI_VERSIO=
N_MINOR_MASK)
+#define SDEI_VERSION_VENDOR(x)	(x>>SDEI_VERSION_VENDOR_SHIFT & SDEI_VERS=
ION_VENDOR_MASK)
+
+/* SDEI return values */
+#define SDEI_SUCCESS		0
+#define SDEI_NOT_SUPPORTED	-1
+#define SDEI_INVALID_PARAMETERS	-2
+#define SDEI_DENIED		-3
+#define SDEI_PENDING		-5
+#define SDEI_OUT_OF_RESOURCE	-10
+
+/* EVENT_REGISTER flags */
+#define SDEI_EVENT_REGISTER_RM_ANY	0
+#define SDEI_EVENT_REGISTER_RM_PE	1
+
+/* EVENT_STATUS return value bits */
+#define SDEI_EVENT_STATUS_RUNNING	2
+#define SDEI_EVENT_STATUS_ENABLED	1
+#define SDEI_EVENT_STATUS_REGISTERED	0
+
+/* EVENT_COMPLETE status values */
+#define SDEI_EV_HANDLED	0
+#define SDEI_EV_FAILED	1
+
+/* GET_INFO values */
+#define SDEI_EVENT_INFO_EV_TYPE			0
+#define SDEI_EVENT_INFO_EV_SIGNALED		1
+#define SDEI_EVENT_INFO_EV_PRIORITY		2
+#define SDEI_EVENT_INFO_EV_ROUTING_MODE		3
+#define SDEI_EVENT_INFO_EV_ROUTING_AFF		4
+
+/* and their results */
+#define SDEI_EVENT_TYPE_PRIVATE			0
+#define SDEI_EVENT_TYPE_SHARED			1
+#define SDEI_EVENT_PRIORITY_NORMAL		0
+#define SDEI_EVENT_PRIORITY_CRITICAL		1
+
+#endif /* _LINUX_ARM_SDEI_H */
--=20
2.19.1

