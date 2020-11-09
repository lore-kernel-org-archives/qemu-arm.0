Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3670056lfb;
        Mon, 9 Nov 2020 06:20:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxLC5HyXEdgexIsVTeLGUJO1mTY4hlzjvT1zspig2N3tpw2ZNJ29Iwbide4ZrvoWjNIIzxL
X-Received: by 2002:a25:58c5:: with SMTP id m188mr19669033ybb.91.1604931623068;
        Mon, 09 Nov 2020 06:20:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604931623; cv=none;
        d=google.com; s=arc-20160816;
        b=02RId9FUNxtzZM4APG64GeItjX4V1qzl/WVEB7jJM5N4FAV6oX8M4+BHnIoSwv+QxE
         qLAJkTUUgHr3SEfFDjRU2dHdrPw4Y2fRhlwIU6W00layr8b+pubF4MQd/XiceCz04JEk
         kdCwooT5hpinLyYwfKrbpCp5/P3dbhiQttQGRCjWDlIb8EmX9p4PmwKg9PcYRLDsg40R
         FbXkB0vdzOjkAi5n7n0urb77XEElqZvYj5u+RRSWvs+vBv/cn69v8qkLfJ0m0UHYdEPk
         yKZJLEy05pBs3yYEFJZTvJhL6bWoNGpeGltF2oXeHfVreDzwWiIPtSC9MNuxkHE7Zk6L
         o9bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=wei1pFOYUse7Tl6YgTvckveLm78hX/DTxJhMZhT1FOo=;
        b=x1d5uZa/n2IKW22UrUb1qvBLUuG88Evo7IkrJ8y1pyn5g/dZBe4OJt3/f9m8DpadCD
         zZaQ6wfwRMCKS/Bw8BmfPGXqIFro+bKXP4w7Ug09sCGISdgLC85QNcMmQQxKdK9RDq5d
         44JE+B11W44e0dA8ZTjz1QnH8Oy7EtnNW8xirr/tcuj0xDNGuk62A1H0xaNFUAIdBgX5
         5cOoBrmM8MfkBQkOmAXImlWVdoHpcBqm+WKbdGItOV0uPj49r9NjrW938lJNesUcv5ju
         xF1Au4UYk0KyffE1x2N/02MTDbJcSssZSOPlj9CYL+B3sf3Tt7usLNCLnJnppytDaDWo
         y2BQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h137si10710382ybg.295.2020.11.09.06.20.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Nov 2020 06:20:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kc81u-0006DK-Bc
	for alex.bennee@linaro.org; Mon, 09 Nov 2020 09:20:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kc7sj-0003Nl-3X; Mon, 09 Nov 2020 09:10:53 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:60194
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kc7sf-0002qP-HY; Mon, 09 Nov 2020 09:10:52 -0500
Received: from basile.remlab.net (ip6-localhost [IPv6:::1])
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTP id 2193A605A6;
 Mon,  9 Nov 2020 15:10:24 +0100 (CET)
From: remi.denis.courmont@huawei.com
To: qemu-arm@nongnu.org
Subject: [PATCH 13/17] target/arm: handle VMID change in secure state
Date: Mon,  9 Nov 2020 16:10:16 +0200
Message-Id: <20201109141020.27234-13-remi.denis.courmont@huawei.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <5554493.MhkbZ0Pkbq@basile.remlab.net>
References: <5554493.MhkbZ0Pkbq@basile.remlab.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:41d0:2:5a1a::; envelope-from=remi@remlab.net;
 helo=ns207790.ip-94-23-215.eu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/09 08:56:07
X-ACL-Warn: Detected OS   = ???
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /BnMlYEJyUZP

From: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>

The VTTBR write callback so far assumes that the underlying VM lies in
non-secure state. This handles the secure state scenario.

Signed-off-by: Rémi Denis-Courmont <remi.denis.courmont@huawei.com>
---
 target/arm/helper.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index aae22847bb..314366a71f 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4018,10 +4018,15 @@ static void vttbr_write(CPUARMState *env, const ARMCPRegInfo *ri,
      * the combined stage 1&2 tlbs (EL10_1 and EL10_0).
      */
     if (raw_read(env, ri) != value) {
-        tlb_flush_by_mmuidx(cs,
-                            ARMMMUIdxBit_E10_1 |
-                            ARMMMUIdxBit_E10_1_PAN |
-                            ARMMMUIdxBit_E10_0);
+        uint16_t mask = ARMMMUIdxBit_E10_1 |
+                        ARMMMUIdxBit_E10_1_PAN |
+                        ARMMMUIdxBit_E10_0;
+
+        if (arm_is_secure_below_el3(env)) {
+            mask >>= ARM_MMU_IDX_A_NS;
+        }
+
+        tlb_flush_by_mmuidx(cs, mask);
         raw_write(env, ri, value);
     }
 }
-- 
2.29.2

