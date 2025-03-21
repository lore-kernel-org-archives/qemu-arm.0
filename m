Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp178895njc;
        Fri, 21 Mar 2025 02:29:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWf6tK+1Kfi3RSsbyhGaOdybrg21J0LyPDxWfx2Q/lYRVtODs2G3JRZPQK/oO+Un6PuVP/Hz7DQ9R5lag==@linaro.org
X-Google-Smtp-Source: AGHT+IF2nwGy7aIuS2hcJjwRrPlER/G6AuQVFpAaBRGZjtuuv6q3lsoN1QDf9MI/vUz0jCac7rxF
X-Received: by 2002:a05:622a:2b0b:b0:476:8e85:2a2f with SMTP id d75a77b69052e-4771dd943f4mr40000361cf.20.1742549365116;
        Fri, 21 Mar 2025 02:29:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742549365; cv=none;
        d=google.com; s=arc-20240605;
        b=Ho4GLeeHeHuThfjl6It6Hbq/GEmkEVhmTFJz4td628ZQlngi66Rkf70lS9M5/6BuXi
         Y4X9cM0nLdXEaB7nNNb7akzvo60q2sGXd2Ofjd7irI9lpb+g1Pk5FICup6TiIpXszayX
         ZMg9krzVhXALfkbDafoMXkoXv4W3WbFWniy+Zd0PXKvq2RkMZ3b8lvYQY/Um0t9GppaP
         jCsPE5Ld4oUxRqDq8MQbkMQhdcLBm/HusHLvPwvKR0l5DKBV0tG66MRIwVcp39c2XxKj
         ZMBupF88c7IpOqLR3Td6VCiXwvRQFBn+sZNynyvhWVnw1SpC3tIB8JUiMVAPbv3HtLKG
         GlwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=Qj+RulTo9BNDAFntDQxgOvPCPxggj1nywiqA1xMsgl4=;
        fh=XVCbtZt0NlM3WRi/g+G2SrIUzl8hrRaPGDpFr//3vj8=;
        b=O2MyGArNUFcjhBqogLH0JVwwdolVFVPEfUjMJowJiZk4BVFhShZPWj/uTlmsEUwz6S
         nEBe/NPVG9GGclcfwwlA2Z6QTvcmIWTD9ial1tqJNYdVqIkm/c8OOuaw8aMZPc1zN5QN
         QQ/IuyOinLeY9MS1WTyUYF7U3IcW3WEpSyHHpRFnQKTqmDpuETiRciNuCwbnEyZ1B8HP
         euU2urhTKPfvWNKHkUaMnUbd29qHF42E0KRxd9HVqszOBW2wBcwXpC3CsMjm5xPb0tJp
         oBVQvAtAjS6QodOB/olJ2jc4tAxUj+j6Np+ujMfQf6JZP0D8zQfVGStTfpyL7x6hs/ad
         /o/Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4771d63abbasi14950381cf.527.2025.03.21.02.29.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Mar 2025 02:29:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tvYeS-0006Tx-4v; Fri, 21 Mar 2025 05:26:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tvYeL-0006L3-Qt; Fri, 21 Mar 2025 05:26:46 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tvYeJ-00056F-Qf; Fri, 21 Mar 2025 05:26:44 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Fri, 21 Mar
 2025 17:26:25 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Fri, 21 Mar 2025 17:26:25 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Fabiano Rosas <farosas@suse.de>, Laurent Vivier
 <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "open list:ASPEED
 BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>
Subject: [PATCH v1 05/22] hw/misc/aspeed_hace: Introduce 64-bit digest_addr
 variable for AST2700
Date: Fri, 21 Mar 2025 17:26:01 +0800
Message-ID: <20250321092623.2097234-6-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250321092623.2097234-1-jamin_lin@aspeedtech.com>
References: <20250321092623.2097234-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Cr7XiwLwLGRS

The AST2700 CPU, based on the Cortex-A35, is a 64-bit processor with a 64-bit
DRAM address space. To support future AST2700 updates, a new "digest_addr"
variable is introduced with a 64-bit data type.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/misc/aspeed_hace.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
index 9771d6e490..8cf3f194a5 100644
--- a/hw/misc/aspeed_hace.c
+++ b/hw/misc/aspeed_hace.c
@@ -148,6 +148,7 @@ static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode,
     bool sg_acc_mode_final_request = false;
     g_autofree uint8_t *digest_buf = NULL;
     struct iovec iov[ASPEED_HACE_MAX_SG];
+    uint64_t digest_addr = 0;
     Error *local_err = NULL;
     uint32_t total_msg_len;
     size_t digest_len = 0;
@@ -257,7 +258,8 @@ static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode,
         return;
     }
 
-    if (address_space_write(&s->dram_as, s->regs[R_HASH_DEST],
+    digest_addr = deposit64(digest_addr, 0, 32, s->regs[R_HASH_DEST]);
+    if (address_space_write(&s->dram_as, digest_addr,
                             MEMTXATTRS_UNSPECIFIED,
                             digest_buf, digest_len)) {
         qemu_log_mask(LOG_GUEST_ERROR,
-- 
2.43.0

