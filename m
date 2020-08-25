Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp3346896lfy;
        Tue, 25 Aug 2020 04:29:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwgfu1utGL/plzYrGoKMSn0mKQqdFpIZwm1n9Ld3OtIoU08/+aNvMoo/bCfQ1/CfM9Fe1Tj
X-Received: by 2002:a25:5f0b:: with SMTP id t11mr14003727ybb.141.1598354977489;
        Tue, 25 Aug 2020 04:29:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598354977; cv=none;
        d=google.com; s=arc-20160816;
        b=l29kcMfWcJgR+5iMMzsp5y1xx5/BhzBpD5k8FLiLoA4bgS0uIp1sz67XhdNtB6Ykl6
         ueLwN2654wF2siLc8MoVwAuBRogQ1udvDettwxk5hOhPXj5RME/SRzEa6IUw0LPJ7efg
         ieJfH5S6QN0I+J1wN+PIatlQZkJ6X5pUmmsa5Z7LLExhDTporZCcDBq2P7/wb8jgkD2H
         Iseh0szCxRavam0Bx6acJuaV09Q0RtnzYL6PRQyiLmgjDR7NiMSj0OzD8s8m38Tyzs2F
         N+GMtop4loqESOAoZAHirAJ+iyVskq+ZpX9hXQcDf/S3AwIBnBuGnOiX2uIz97icwvL3
         ud6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=u6T0uLWiLZAGFG8y7fqfJDxKgaukFimKcfPW0IdJszo=;
        b=OlFvx4DOfTpEKXAbZro6s6Fhudkrs54cfEe9qpb4FcpfNHtLIFcPWcbRaNcUrFt+2r
         UdgaFyapF9410OwXlg46P6kUd5Fm+VCCyPxImUtTFap2ZdCtuA+P3A96JBNV5b1oIIQV
         mHwX2duHqpS6urkvZug0yelDIVEWw8MNJIJ7aQLm2KUR4yDn9Q+TBXWkkqRTuS7Xd/fo
         K0CwdpA/5l3UK80tRYTZ6jZpQs1Mo1g11n3NqfvjkYPw/sz0Mr5vt943Pr5NQvxdDNTt
         QYnb6cKbqK0wOx64Mq9Jlz0ubFH415hNn0bOiiF0bT0TLebrpoo6+m+D2v0yyhFQvhIO
         6qPw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v27si14858839ybd.373.2020.08.25.04.29.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Aug 2020 04:29:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kAX8y-0006nN-Qv
	for alex.bennee@linaro.org; Tue, 25 Aug 2020 07:29:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kAX5o-0000U8-IM; Tue, 25 Aug 2020 07:26:21 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:40426 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kAX5j-0006er-0W; Tue, 25 Aug 2020 07:26:20 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 1006D5FB14AD8B8C8CBC;
 Tue, 25 Aug 2020 19:26:09 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.487.0; Tue, 25 Aug 2020
 19:26:00 +0800
From: Chen Qun <kuhn.chenqun@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
Subject: [PATCH v2 04/10] target/arm/translate-a64:Remove redundant statement
 in disas_simd_two_reg_misc_fp16()
Date: Tue, 25 Aug 2020 19:24:41 +0800
Message-ID: <20200825112447.126308-5-kuhn.chenqun@huawei.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200825112447.126308-1-kuhn.chenqun@huawei.com>
References: <20200825112447.126308-1-kuhn.chenqun@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35;
 envelope-from=kuhn.chenqun@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/25 07:26:04
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, zhang.zhanghailiang@huawei.com,
 pannengyuan@huawei.com, qemu-arm@nongnu.org,
 Euler Robot <euler.robot@huawei.com>, Chen Qun <kuhn.chenqun@huawei.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nfG2VnH7PSzs

Clang static code analyzer show warning:
target/arm/translate-a64.c:13007:5: warning: Value stored to 'rd' is never read
    rd = extract32(insn, 0, 5);
    ^    ~~~~~~~~~~~~~~~~~~~~~
target/arm/translate-a64.c:13008:5: warning: Value stored to 'rn' is never read
    rn = extract32(insn, 5, 5);
    ^    ~~~~~~~~~~~~~~~~~~~~~

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
---
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
---
 target/arm/translate-a64.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index c83bb85e4e..47cce160d8 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -13016,9 +13016,6 @@ static void disas_simd_two_reg_misc_fp16(DisasContext *s, uint32_t insn)
     fpop = deposit32(opcode, 5, 1, a);
     fpop = deposit32(fpop, 6, 1, u);
 
-    rd = extract32(insn, 0, 5);
-    rn = extract32(insn, 5, 5);
-
     switch (fpop) {
     case 0x1d: /* SCVTF */
     case 0x5d: /* UCVTF */
-- 
2.23.0

