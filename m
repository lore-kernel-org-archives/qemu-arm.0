Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp178238njc;
        Fri, 21 Mar 2025 02:27:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUrDeeK5GfvjJWxaCpEVCnMC4EVA6VmkBiC1MW2jLH0jDBx70+lf3b8cvDX+NXsKe8I7VT+EZrXe2WBhQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHO5tUCRlRMDVy2B3hAdNt77Cc7wJYZQyoJ1ysnJF6iax+m6KKXs5vpc7sUIN5qVt4gw4fw
X-Received: by 2002:a05:622a:4c0a:b0:476:9dc9:3c2a with SMTP id d75a77b69052e-4771de498f7mr43294251cf.48.1742549253693;
        Fri, 21 Mar 2025 02:27:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742549253; cv=none;
        d=google.com; s=arc-20240605;
        b=b4I1shQok9x07tuSrclSXwPQJnNGinGENCW17wMIS4aN8mWgb9v9reGtqbbgTwRAOn
         JNrrKR9KNvLAPvkqArQ+2Xibr51pLT4nW+OPtir6OK15LemGcuOPXjFELf0JUylo01om
         19mh9gfkacIXs34DM+PlvWaJ0Cl4UDH9/bwDc0h96eoxf97pdUg7QQhkiIsnkPqI6wGl
         qMVkMg7Lt6Y1xoKKmoOei3QS0oESdk8/e9rdU/ltKu+an/4lxC/Px02Dffjiy/KzEGK5
         Ua8Kafvyxthlk+0PBMFz5nG9Okr++Ne2azZ6BRTcA0RcAA+byvrNKM+AKDnj6oIAdKJ5
         IITg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=J3L0bBO43HSPPNEFMDhc3Blc19GSY61sfhHd4K7gXrs=;
        fh=XVCbtZt0NlM3WRi/g+G2SrIUzl8hrRaPGDpFr//3vj8=;
        b=HyBuW00CWoAlkxpFzydk8WRMygfbxiYd+eRI2M62otKqsZa95JUjV1EKFyaagku0Ta
         ocdzbzrcZ9Yj8uQr5vR/dVP4IOextv0F/3DonfY2LWYrUsQHCJTnfTR+kYb5VLC7BYLd
         p1PkI3g6nSP3yPw+n4bgPAwp0UjBAv69F163Rlo0ORAzvi8UTqVjeG2HMQ4Ui/h/AT2l
         Bv8OSwE53lHcVWE0nYKQSOioaFYo7cRHMiksvFpuoyXFBVHORM9yAQZAisKM5uaIBs4y
         JNLfGjUp7mofbPXyjpafBOkyTqxrRrpjGCnrP7+bvp8gyi2KgOxm2fnRNJ4N7e0SBLGE
         jtEA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4771d638f72si15680911cf.479.2025.03.21.02.27.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Mar 2025 02:27:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tvYf0-00073C-PJ; Fri, 21 Mar 2025 05:27:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tvYet-0006pl-QM; Fri, 21 Mar 2025 05:27:22 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tvYep-00056m-PF; Fri, 21 Mar 2025 05:27:17 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Fri, 21 Mar
 2025 17:26:27 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Fri, 21 Mar 2025 17:26:27 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Fabiano Rosas <farosas@suse.de>, Laurent Vivier
 <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "open list:ASPEED
 BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>
Subject: [PATCH v1 12/22] hw/misc/aspeed_hace Support to dump plaintext and
 digest for better debugging
Date: Fri, 21 Mar 2025 17:26:08 +0800
Message-ID: <20250321092623.2097234-13-jamin_lin@aspeedtech.com>
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
X-TUID: FALgqmcZhYEW

1. Disabled by default. Uncomment "#define DEBUG_HACE 1" to enable it.
2. Uses the "qemu_hexdump" API to dump the digest result.
3. Uses the "iov_hexdump" API to dump the source vector, which contains the
   source plaintext.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/misc/aspeed_hace.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
index b8e473ee3f..ae4d2fa687 100644
--- a/hw/misc/aspeed_hace.c
+++ b/hw/misc/aspeed_hace.c
@@ -10,8 +10,10 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/cutils.h"
 #include "qemu/log.h"
 #include "qemu/error-report.h"
+#include "qemu/iov.h"
 #include "hw/misc/aspeed_hace.h"
 #include "qapi/error.h"
 #include "migration/vmstate.h"
@@ -20,6 +22,8 @@
 #include "hw/irq.h"
 #include "trace.h"
 
+/* #define DEBUG_HACE 1 */
+
 #define R_CRYPT_CMD     (0x10 / 4)
 
 #define R_STATUS        (0x1c / 4)
@@ -268,6 +272,10 @@ static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode,
         }
     }
 
+#ifdef DEBUG_HACE
+    iov_hexdump(iov, i, stdout, "plaintext", 0xa000);
+#endif
+
     if (acc_mode) {
         if (qcrypto_hash_updatev(s->hash_ctx, iov, i, &local_err) < 0) {
             qemu_log_mask(LOG_GUEST_ERROR, "qcrypto hash update failed : %s",
@@ -311,6 +319,10 @@ static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode,
                       "aspeed_hace: address space write failed\n");
     }
 
+#ifdef DEBUG_HACE
+    qemu_hexdump(stdout, "digest", digest_buf, digest_len);
+#endif
+
     for (; i > 0; i--) {
         address_space_unmap(&s->dram_as, iov[i - 1].iov_base,
                             iov[i - 1].iov_len, false,
-- 
2.43.0

