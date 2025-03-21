Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp179558njc;
        Fri, 21 Mar 2025 02:30:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXMkRYwm2O9skqpvS4a00IQoMh/5tCo6yAN0JiJOUD6RFjUAHB/9+jLubzdKNg1KA3QrLOlH6IUGlRbaA==@linaro.org
X-Google-Smtp-Source: AGHT+IFBM2T4CFpf4zMtoJZ5pXaPrUbzBfESY73A30PqL74z9sF+S8tXKosbPmqIgTKw4wOa7sr1
X-Received: by 2002:a05:622a:408c:b0:476:87f6:3cdf with SMTP id d75a77b69052e-4771de488d3mr38638671cf.41.1742549452800;
        Fri, 21 Mar 2025 02:30:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742549452; cv=none;
        d=google.com; s=arc-20240605;
        b=TJkF/uEunjKyGYElc8WiOkO1o8hrYrLAcoxKxU/aHu02Q682cYAEJN/vvKO7pmONzQ
         eudxC/cViThDvLJdq3/TIbKosmQZ2L2A9WuIaHh4WjE+gNbj4UJJhYuy8ZLGFnsPZgsj
         6HYfGxTEGwC41vl9tJ5aoG+i8CdoArpYAEMCH2fhKsHKNqG+GtOxhk7h1c+F0C5mTAAp
         BRreToTB06mtLISwcO7EoDmpCSXiWHESibeO/vmGeRbWUQu5Adgb/SGVHuKjHSpBCHVm
         bCdDZVSBDCaBtSBPqLXepqERPYtixfoX61L2odsL6a3tzoZVQTCmiDfKEhbPGLfK0kgR
         YEqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=be/vKx3Dl1xKCtsZBLzZh/C1YPebEe7zHaO7Fb5BgL4=;
        fh=XVCbtZt0NlM3WRi/g+G2SrIUzl8hrRaPGDpFr//3vj8=;
        b=jlmpBwUPPY4lE7+4l70sF4br52dqT+X6SUG/B2k4KJjBAFjtzYeZpDRK0QJEfHm+Nz
         xav+HubW6YbrBbFr84B3jBPH0xA56peTkQoqXaioo7IpaDwscQ5Kr+/whVgESkH0Yc8W
         lPsLOPMpWnjmVzkRhJ5c3Sm1vHHOl75FCoL3yDTEqL63WBzoEKitDvuTpeF2ob9JNOa+
         +nz4EuBNrF5F06TC+pC3cCBHFlwWmuQqdKN00NuM+UPobLJT8B/+et7LK631u0lxy7QR
         Z8f3lNCATYB4s9Qdxjn3cLJSHHaVf8z994T7r7ox5iLFl1k3k1Pd6Sk2702n7RPe6M6L
         egVg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4771d528379si15619011cf.432.2025.03.21.02.30.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Mar 2025 02:30:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tvYeQ-0006QC-KV; Fri, 21 Mar 2025 05:26:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tvYeL-0006L4-R8; Fri, 21 Mar 2025 05:26:46 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tvYeJ-00056m-Oi; Fri, 21 Mar 2025 05:26:44 -0400
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
Subject: [PATCH v1 06/22] hw/misc/aspeed_hace: Support accumulative mode for
 direct access mode
Date: Fri, 21 Mar 2025 17:26:02 +0800
Message-ID: <20250321092623.2097234-7-jamin_lin@aspeedtech.com>
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
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: FIcXddsHeBb7

Enable accumulative mode for direct access mode operations. In direct access
mode, only a single source buffer is used, so the "iovec" count is set to 1.
If "acc_mode" is enabled:
1. Accumulate "total_req_len" with the current request length ("plen").
2. Check for padding and determine whether this is the final request.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/misc/aspeed_hace.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
index 8cf3f194a5..d06158dffd 100644
--- a/hw/misc/aspeed_hace.c
+++ b/hw/misc/aspeed_hace.c
@@ -223,8 +223,21 @@ static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode,
             return;
         }
         iov[0].iov_base = haddr;
-        iov[0].iov_len = plen;
         i = 1;
+        if (acc_mode) {
+            s->total_req_len += plen;
+
+            if (has_padding(s, &iov[0], plen, &total_msg_len,
+                            &pad_offset)) {
+                /* Padding being present indicates the final request */
+                sg_acc_mode_final_request = true;
+                iov[0].iov_len = pad_offset;
+            } else {
+                iov[0].iov_len = plen;
+            }
+        } else {
+            iov[0].iov_len = plen;
+        }
     }
 
     if (acc_mode) {
-- 
2.43.0

