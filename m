Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp2011559njc;
        Mon, 16 Jun 2025 10:26:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW3PPccC+tKIKMQPYRbpEAPgkSirFX7GjyTBB1XQEMLIitvSGIxxNCXvM/TFdqY3YvkUAv9SxrWrC/hog==@linaro.org
X-Google-Smtp-Source: AGHT+IGTwkV32aQ9TuWmlhAmhMJzJCLN8BU8sOPX44QIS1e+6HGOPoBEUTgcTbX7j/ksEvblzY43
X-Received: by 2002:a05:6214:d4a:b0:6f8:a978:d46 with SMTP id 6a1803df08f44-6fb47740adamr161245616d6.19.1750094791046;
        Mon, 16 Jun 2025 10:26:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750094791; cv=none;
        d=google.com; s=arc-20240605;
        b=g4exgKCPERZc5k0g6n4leoJmALiySXb8D0ZNF82QxQXaWOarHNzGo6QZ91H+tOFxBE
         CtHqTxFHSknw2EOU9H/3PXjbyFoOp4IT+SySPyx7aEaFOQXgQIzoPeKHDvpOKPTIHac4
         0kZfZS1OiEiiGnF8buJ0lXNpsW8ivvd5Kadzq+MmjbDlNpkjDkd6O0LF/jsMdceJfjn1
         ghfpBV0x79E27KyjcwrSiWlsHJPGojciKUdgQSvISCmv5fa0vqq7Y1egn5skrc0Z0H9t
         qnjrxHC8uKQDpqFHjvBMCQILm3pMDxjhMsNQ9FVro70J2glre015RpWanpio/Y3MRTv2
         lt9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=evBOl5rbfEcn1En9csBiLwPoXAIPY0sQhp6r0d0a+mY=;
        fh=YSS6IwOZbmqAaNk1mB0bKhZZ6/1NuqKuBkRACaI5c/4=;
        b=L3sYBPt4diMr71pm4Pa7MAye54Ox2Se4nUuNvr1aUqedj36jkIwsrcf3BPqq3APkdW
         vHZPQeoHlQuu+eQ5Cy9r5Gb2AyyVCyc+N6lQKrDgs2vHLIzXVUZkC4i09LPgNtYcq5ns
         x2cicNkY5iErkASyrruGSNbFDKabPTObgvZK9x2Q5oFxnQf5xrt0Ud4dNRHkjJM02ciM
         vkCdonAluQkIO+qFHXnw1+8JwY0M6yA0W5QzCwH2t5+mqytAvVJKRfiwFn3YLN9P73Pw
         X7emyO7x9Woa/srtXBXTB2ErlbiLS2xJKTnVBhylAaRi7IKu5hvmqAaofJLTy6mUJt72
         foFw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@wjsota.com header.s=sig1 header.b=PAcNiDeq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fb5218a71asi41919066d6.186.2025.06.16.10.26.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Jun 2025 10:26:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@wjsota.com header.s=sig1 header.b=PAcNiDeq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uRDb4-00060z-Ry; Mon, 16 Jun 2025 13:26:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <root@wjsota.com>) id 1uRDRF-0002P3-QD
 for qemu-arm@nongnu.org; Mon, 16 Jun 2025 13:16:06 -0400
Received: from p-west1-cluster3-host8-snip4-3.eps.apple.com ([57.103.66.56]
 helo=outbound.pv.icloud.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <root@wjsota.com>) id 1uRDRA-0000ho-6j
 for qemu-arm@nongnu.org; Mon, 16 Jun 2025 13:16:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wjsota.com; s=sig1;
 bh=evBOl5rbfEcn1En9csBiLwPoXAIPY0sQhp6r0d0a+mY=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme;
 b=PAcNiDeqDVxQwbss0cDDfUxhyRsyJ0iWIfZfpxotD21zgzI0CLO7LXKPPy5q8gfpD
 0mZgO4rQXubVVZ3FoAb/21Kgxn+oF9IJhn9tif63goD70TbwEEbKx/2EHObenH5X1I
 zdeMtyTaNNcmpzQxEucrPyz/Z9U+CVHmQzbAGuPwGydvLWIgrGr2BykB/6nrtBZbwB
 f3WLqwDZbPtweYGw/uubgA1M/8q0ODwSQWIAdgajmOtGVqfBECipYwDjqujl1FPW1f
 9yT5Bk+qL4iPnYqSN29iPzcRZFcZKcYWjcLl2LS7KbVW+I2ZPOBJh0VDLPPh7m4B4o
 QMnjBcugJYV0Q==
Received: from outbound.pv.icloud.com (localhost [127.0.0.1])
 by outbound.pv.icloud.com (Postfix) with ESMTPS id 7F601180030C;
 Mon, 16 Jun 2025 17:15:54 +0000 (UTC)
Received: from dell-op7020.. (pv-asmtp-me-k8s.p00.prod.me.com [17.56.9.36])
 by outbound.pv.icloud.com (Postfix) with ESMTPSA id 3286D1800B55;
 Mon, 16 Jun 2025 17:15:53 +0000 (UTC)
From: Solomon Tan <root@wjsota.com>
To: 
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Solomon Tan <root@wjsota.com>
Subject: [PATCH] target/arm: Make RETA[AB] UNDEF when pauth is not implemented
Date: Tue, 17 Jun 2025 01:15:46 +0800
Message-ID: <20250616171549.59190-1-root@wjsota.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: jyJRFDUagL06QZIPT0DSlFADjHdhK3qA
X-Proofpoint-ORIG-GUID: jyJRFDUagL06QZIPT0DSlFADjHdhK3qA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_08,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=1
 clxscore=1030 malwarescore=0 mlxlogscore=734 mlxscore=0 phishscore=0
 suspectscore=0 bulkscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2503310001 definitions=main-2506160115
Received-SPF: pass client-ip=57.103.66.56; envelope-from=root@wjsota.com;
 helo=outbound.pv.icloud.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 16 Jun 2025 13:26:02 -0400
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
X-TUID: e1SKG91XMFF2

According to the Arm A-profile A64 Instruction Set Architecture,
RETA[AB] should be decoded as UNDEF if the pauth feature is not
implemented.

Fixes: 0ebbe9021254f ("target/arm: Convert BRA[AB]Z, BLR[AB]Z, RETA[AB] to decodetree")
Signed-off-by: Solomon Tan <root@wjsota.com>
---
 target/arm/tcg/translate-a64.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index ac80f572a2..d0719b5665 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -1816,6 +1816,10 @@ static bool trans_RETA(DisasContext *s, arg_reta *a)
 {
     TCGv_i64 dst;
 
+    if (!dc_isar_feature(aa64_pauth, s)) {
+        return false;
+    }
+
     dst = auth_branch_target(s, cpu_reg(s, 30), cpu_X[31], !a->m);
     gen_a64_set_pc(s, dst);
     s->base.is_jmp = DISAS_JUMP;
-- 
2.48.1

