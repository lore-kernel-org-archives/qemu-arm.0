Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp322258njb;
        Mon, 12 May 2025 23:30:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWURLG28Q/RcpjCE0rfcPZPfuPUwfplq/xuZMZy/cWYWYSBMYPrdqrPk4uQDu94+ElJgGFjYrq/DXIGZg==@linaro.org
X-Google-Smtp-Source: AGHT+IFkOF6IHOBYf8kwjkzwPkZklo5OFQK75XKFj8gxoPE1JFVR9wFsWhAadvj3ii+QL4Jydg8d
X-Received: by 2002:a05:6214:5006:b0:6d8:99cf:d2db with SMTP id 6a1803df08f44-6f6e481cf8emr325507876d6.38.1747117843250;
        Mon, 12 May 2025 23:30:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747117843; cv=none;
        d=google.com; s=arc-20240605;
        b=WK6GtaC+T/pCooPaRxJIFvn1f1tcis1cCxSAK5zZHztnF/L5hlXPbRfAVrfvPG8JlW
         MXnaWJng1nX3mH3aMIO53zaATa72cafDSi6MNDfvxR7cA/DnjeFm/4wSkXCft0kz0iHW
         gHSMdIchnCJPAJsUIW7QopGTskDPfzUoAU7c7fSbvAYA8unXpUyeai7RNXmkpg2OifIN
         yy29NIMkgAnWcRFxL3nModEhT8dWEHdeK1G+nl59o5uxAIqtr6y33suCc3OPq4cv6imG
         RRP5aCokdJRvvqlj4InanPSyLSmRfLIkmWNXROxKHhPzlXuVwzBjguGhzOL4/WGY1bi2
         OW5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=OlJEw1u7I+PyR37kwlI3LovEEZq2VG75c3wOLpSwH5I=;
        fh=XVCbtZt0NlM3WRi/g+G2SrIUzl8hrRaPGDpFr//3vj8=;
        b=TqpTN3ek8lLAYQ+u+WmGRaz59LddkEW5S5a/L2rTemoVgoJNjwFA2dVW8vtKCB3sx8
         UPIhuWvppsHT+tQYF+0tUreRm3Lfs67MZJQQ6uxWgaPyLKQA0poL1GW5b4V0iMHscW8c
         V8dIJVoLyJrLQf9s9k2rS/QCURE5dyEy3RRQJrfp8eBn4Bhv91NWvOXNrZEM8WTnpFmM
         8oxNdXPVy7eDydveFdgcX3FeFobo73OwwM52vSiD0utzLPQBIFWUI796yiAon5u9PzW3
         1s23LrS8u/MDIAfUiWKrg6k8msGj4IUz8cROEKnS9Z+hVhiDL5TZDtnOSP6DzWxnWq4G
         8kkw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f6e3a43002si108271016d6.268.2025.05.12.23.30.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 May 2025 23:30:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uEj9E-0002jD-39; Tue, 13 May 2025 02:29:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1uEj98-0002S1-3A; Tue, 13 May 2025 02:29:46 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1uEj96-0001lo-Ad; Tue, 13 May 2025 02:29:45 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 13 May
 2025 14:29:03 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 13 May 2025 14:29:03 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Fabiano Rosas <farosas@suse.de>, Laurent Vivier
 <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "open list:ASPEED
 BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>
Subject: [PATCH v2 03/25] hw/misc/aspeed_hace: Ensure HASH_IRQ is always set
 to prevent firmware hang
Date: Tue, 13 May 2025 14:28:33 +0800
Message-ID: <20250513062901.2256865-4-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250513062901.2256865-1-jamin_lin@aspeedtech.com>
References: <20250513062901.2256865-1-jamin_lin@aspeedtech.com>
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
X-TUID: y5PfaJn6XoaQ

Currently, if the program encounters an unsupported algorithm, it does not set
the HASH_IRQ bit in the status register and send an interrupt to indicate
command completion. As a result, the FW gets stuck waiting for a completion
signal from the HACE module.

Additionally, in do_hash_operation, if an error occurs within the conditional
statement, the HASH_IRQ bit is not set in the status register. This causes the
firmware to continuously send HASH commands, as it is unaware that the HACE
model has completed processing the command.

To fix this, the HASH_IRQ bit in the status register must always be set to
ensure that the firmware receives an interrupt from the HACE module, preventing
it from getting stuck or repeatedly sending HASH commands.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Fixes: c5475b3 ("hw: Model ASPEED's Hash and Crypto Engine")
---
 hw/misc/aspeed_hace.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
index 6be94963bc..1256926d22 100644
--- a/hw/misc/aspeed_hace.c
+++ b/hw/misc/aspeed_hace.c
@@ -267,12 +267,6 @@ static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode,
                             iov[iov_idx - 1].iov_len, false,
                             iov[iov_idx - 1].iov_len);
     }
-
-    /*
-     * Set status bits to indicate completion. Testing shows hardware sets
-     * these irrespective of HASH_IRQ_EN.
-     */
-    s->regs[R_STATUS] |= HASH_IRQ;
 }
 
 static uint64_t aspeed_hace_read(void *opaque, hwaddr addr, unsigned int size)
@@ -356,10 +350,16 @@ static void aspeed_hace_write(void *opaque, hwaddr addr, uint64_t data,
                 qemu_log_mask(LOG_GUEST_ERROR,
                         "%s: Invalid hash algorithm selection 0x%"PRIx64"\n",
                         __func__, data & ahc->hash_mask);
-                break;
+        } else {
+            do_hash_operation(s, algo, data & HASH_SG_EN,
+                    ((data & HASH_HMAC_MASK) == HASH_DIGEST_ACCUM));
         }
-        do_hash_operation(s, algo, data & HASH_SG_EN,
-                ((data & HASH_HMAC_MASK) == HASH_DIGEST_ACCUM));
+
+        /*
+         * Set status bits to indicate completion. Testing shows hardware sets
+         * these irrespective of HASH_IRQ_EN.
+         */
+        s->regs[R_STATUS] |= HASH_IRQ;
 
         if (data & HASH_IRQ_EN) {
             qemu_irq_raise(s->irq);
-- 
2.43.0

