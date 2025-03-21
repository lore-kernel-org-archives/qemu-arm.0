Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp178073njc;
        Fri, 21 Mar 2025 02:27:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUD34i5u/yA4at3AT1DjHOiqjG2hRqsHZZ8wCNtHSzPggvPIjRRV6NCrU5+t6n7ZadC8EF5DLzdinRElg==@linaro.org
X-Google-Smtp-Source: AGHT+IE1wzZaVB599kRbER5xuVZ4oTYPKIWS99v/XnvWWVW6/yftlgAzLfI3IUA01FrXXhH1Yhzd
X-Received: by 2002:a05:6214:2624:b0:6e6:64e8:28e7 with SMTP id 6a1803df08f44-6eb3f29447fmr42442196d6.15.1742549229875;
        Fri, 21 Mar 2025 02:27:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742549229; cv=none;
        d=google.com; s=arc-20240605;
        b=Ex/LxFfh8t+lJnYxpTTxR830NNu9f3Zw08O0IM5MSRr+oaoQTai3tKH1XjjFvTb8ol
         I+zG2CfigsY0cOih4Wg00G1Y/u0KJbQtCjbLlVwpx/NYlQtrDAUljQlkezibGWYRNrPA
         b9kFKuLItNk86KCEy9MqXYJuMzFfmFew/744FiHXgoQYqKzAzzzwEUkVXfzjCzaMjSCb
         02TlZw3rVaqEB1aGau8t7XBEhnI6mM6LI4Sj+7ITMRTLh+bJ1NYSjvgzA7p9YKUKQJt4
         +tQqUTyRXQ1wLPTo188KvLPUL04CASAqmsXlS9Y/nuXefKBcdOR6okDgdgfLzKpiNNw4
         JaUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=lS3FkQ2VqpT1/sWjVFenG4tgwxR2XSSMyU72uOLfBMY=;
        fh=XVCbtZt0NlM3WRi/g+G2SrIUzl8hrRaPGDpFr//3vj8=;
        b=Tma8ogdDF3tXp2/QLKIwLR2ZOQ8BtT7Cw3b50hXgDlQ1ETwmetLXikyuExJXkpuOtU
         IfpUwI739aJzD5MVmccnqq1sIXrptMwEhKX36jAKXmucsw0yGKHR9xkrFPHtntIcmte/
         nYR/jZsWxyFe/BM/PyhajEocMV96quWgvcAFDIwusuOaq1JwCWnpxdcrKbGjHMjuqflx
         Q08+tjZSJiyWblQtUJ+N0yX2dirt85b4hsN+K9WOh90tfjcq+oe8SAR57IIKdcAz53tv
         K1U5H1Fo2bPPuaxvVAm/Ivef7PINeAPMWyPIBXlkRStkqiz6mo8NvyAF/gfX11yT//Jw
         YemQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6eb3ef48c8csi15450726d6.21.2025.03.21.02.27.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Mar 2025 02:27:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tvYeK-0006Ju-U7; Fri, 21 Mar 2025 05:26:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tvYeF-0006Dv-TD; Fri, 21 Mar 2025 05:26:39 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tvYeD-00056F-Rp; Fri, 21 Mar 2025 05:26:39 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Fri, 21 Mar
 2025 17:26:24 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Fri, 21 Mar 2025 17:26:24 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Fabiano Rosas <farosas@suse.de>, Laurent Vivier
 <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "open list:ASPEED
 BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>
Subject: [PATCH v1 02/22] hw/misc/aspeed_hace: Fix buffer overflow in
 has_padding function
Date: Fri, 21 Mar 2025 17:25:58 +0800
Message-ID: <20250321092623.2097234-3-jamin_lin@aspeedtech.com>
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
X-TUID: rN9toTMmQ8Z9

The maximum padding size is either 64 or 128 bytes and should always be smaller
than "req_len". If "padding_size" exceeds "req_len", then
"req_len - padding_size" underflows due to "uint32_t" data type, leading to a
large incorrect value (e.g., `0xFFXXXXXX`). This causes an out-of-bounds memory
access, potentially leading to a buffer overflow.

Added a check to ensure "padding_size" does not exceed "req_len" before
computing "pad_offset". This prevents "req_len - padding_size" from underflowing
and avoids accessing invalid memory.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/misc/aspeed_hace.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
index 8e7e8113a5..d8b5f048bb 100644
--- a/hw/misc/aspeed_hace.c
+++ b/hw/misc/aspeed_hace.c
@@ -128,6 +128,11 @@ static bool has_padding(AspeedHACEState *s, struct iovec *iov,
     if (*total_msg_len <= s->total_req_len) {
         uint32_t padding_size = s->total_req_len - *total_msg_len;
         uint8_t *padding = iov->iov_base;
+
+        if (padding_size > req_len) {
+            return false;
+        }
+
         *pad_offset = req_len - padding_size;
         if (padding[*pad_offset] == 0x80) {
             return true;
-- 
2.43.0

