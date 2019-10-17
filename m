Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp975566wrm;
        Thu, 17 Oct 2019 06:47:37 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzXfa7esPpGEePaTWrXjUHJEiFpoeIyRnl2pg6uwO34WAqzVc37Obb0DJeROBq3C8Y4Hhbz
X-Received: by 2002:a17:906:2410:: with SMTP id z16mr3587894eja.120.1571320057317;
        Thu, 17 Oct 2019 06:47:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571320057; cv=none;
        d=google.com; s=arc-20160816;
        b=aFlSApmlCMsgJZFu1XwGTX+eED3TM2C2njrNGk+p5xRJ5LLn26fb49UB41yjJFyoOP
         IU+3BVQHr2ouGkUz3/nxhPboGuoJfxhbClhHgyRDE+U0MUSZM+zkOhK2+WNMmM1JoHdk
         HwGkt8YqtWVK9lZCsFDSr8MVjf/L/9oG+13TJlNOcph9wEY/5+LpYHwrh1PNZIt0Omem
         2tCQI8F342MTfFUR5nKbF6+L2H4WeGcfHNqUauj/4mFk1jL0Hg6Tw0DXq60VdzbKt08r
         uhTWFdI5HdMdCW8mqL6JnSuhwP7LDOMeidEKgXKdtGvqRQXwF65sTRN43eIIMPEQPbq8
         kSRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=DQC4XpSmd8PGYvkUObRMkiwdpTVp4qnrLAv8MVPjMfc=;
        b=N/tWXj03kn6Io3eykCvSgnUKWqcIAP1mQjoI8aU/AKbaKT3wNOTF2jFYG/5MiR/ue0
         F4EOHMaPqKL/YQgL3S4BnBN6FU7PEPg6N7kIV0jPTtaHGsrvsQGjn08YUYXNDgTegk0o
         OFHS/GG9uLoecpe1m6U9vzMBGlPEkVwZ6Oj9dgVMxjbyECKDO0G36YpnEgdDXCsf2QaS
         Ur5X+bYsjtnW6E6WzkH2amw75f03WFmbNqtGIS1+IBplOxl2M4m1ibcjNBQY4l0AVBJJ
         rVzfCogwo92k+8c3BJ4W4Hc3Y3eDgqm7N/wh99+aauc+dQhmCMSvscajbK/6fs3SfUui
         +F7w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BXoRk4ip;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b3si1696842ede.118.2019.10.17.06.47.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Oct 2019 06:47:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BXoRk4ip;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iL67r-0002Tc-W7
	for alex.bennee@linaro.org; Thu, 17 Oct 2019 09:47:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34960)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iL5ic-00051K-FN
 for qemu-arm@nongnu.org; Thu, 17 Oct 2019 09:21:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iL5ia-0000Na-TH
 for qemu-arm@nongnu.org; Thu, 17 Oct 2019 09:21:30 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:40889)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iL5ia-0000N3-Me
 for qemu-arm@nongnu.org; Thu, 17 Oct 2019 09:21:28 -0400
Received: by mail-wm1-x342.google.com with SMTP id b24so2507804wmj.5
 for <qemu-arm@nongnu.org>; Thu, 17 Oct 2019 06:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DQC4XpSmd8PGYvkUObRMkiwdpTVp4qnrLAv8MVPjMfc=;
 b=BXoRk4ipvCCHTzB5RH6mflZFBLDZYC2GIPWZuUYfvFaTPwMcEDViqdxSZo+QUkPufI
 niPgKR7Skh6NKKRwAtfthFcSPc38C0OgDt06iA89Z1tXnDJyBOgXt+wW40OIQI3Dmlj3
 RkcRAWLWjpy6ltoaZrrE8UPBa6VAOdrY+CspInsGbIPB5RC3iXBmRcaNWOhiXDKsNdrU
 93GaLbwRDIQIfnctVCd7SouAj71maxDOBx5purizGDt4zWlOiZpYJyQnW/ExQx9v5uWh
 kFWSMiRc1wtBny+TFLKicoCBYmdO5sfN6YplLZmDpSxFgM6/5tdNEUVYA9O7PmQvFpqB
 6NQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DQC4XpSmd8PGYvkUObRMkiwdpTVp4qnrLAv8MVPjMfc=;
 b=gNPYrMFo562JZTEwlgbbw3FIFXefw6XVhDLy3a46KCcnLWzlsO1g4XodC+axw+o7K9
 z4oKaxuRzQSeeyX5VJGre5OhqT9CfZ0xN39s0nRGX/F6sr+TT3wlSbnmSAotZv2V3tcJ
 OtZKy03eDIhDFKNksIrt4Ry4n/3bawpbZaGhFEY++XuXSBRBha7Nqm48gZEXpc998cPM
 csfdKN0qrXn/YS8R9XQMTvITVAgIzWGiOPJkAYQKlK44Oipj6ucK2qZq4GCANY2WK9iu
 GTjbTKViZpflDT3OGtmwfN2x+M/BGEx/2Msnx/dslHc59MWikjnzC1mcAjPxoMO/e0Bx
 KSVA==
X-Gm-Message-State: APjAAAWTZ6wROcrrIYpfwaQVHXFu243sddkWrb/eV0MvX79LPEe7IqSG
 LBIbiZaNBsQKAWYEs/Asi0OgHA==
X-Received: by 2002:a7b:c444:: with SMTP id l4mr2915340wmi.49.1571318487648;
 Thu, 17 Oct 2019 06:21:27 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id e9sm11543164wme.3.2019.10.17.06.21.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2019 06:21:27 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] hw/timer/xilinx_timer.c: Switch to transaction-based
 ptimer API
Date: Thu, 17 Oct 2019 14:21:21 +0100
Message-Id: <20191017132122.4402-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191017132122.4402-1-peter.maydell@linaro.org>
References: <20191017132122.4402-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
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
Cc: Jason Wang <jasowang@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +g1iAqt0ni7g

Switch the xilinx_timer code away from bottom-half based ptimers to
the new transaction-based ptimer API.  This just requires adding
begin/commit calls around the various places that modify the ptimer
state, and using the new ptimer_init() function to create the timer.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/timer/xilinx_timer.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/hw/timer/xilinx_timer.c b/hw/timer/xilinx_timer.c
index 92dbff304d9..7191ea54f58 100644
--- a/hw/timer/xilinx_timer.c
+++ b/hw/timer/xilinx_timer.c
@@ -28,7 +28,6 @@
 #include "hw/ptimer.h"
 #include "hw/qdev-properties.h"
 #include "qemu/log.h"
-#include "qemu/main-loop.h"
 #include "qemu/module.h"
 
 #define D(x)
@@ -52,7 +51,6 @@
 
 struct xlx_timer
 {
-    QEMUBH *bh;
     ptimer_state *ptimer;
     void *parent;
     int nr; /* for debug.  */
@@ -134,6 +132,7 @@ timer_read(void *opaque, hwaddr addr, unsigned int size)
     return r;
 }
 
+/* Must be called inside ptimer transaction block */
 static void timer_enable(struct xlx_timer *xt)
 {
     uint64_t count;
@@ -174,8 +173,11 @@ timer_write(void *opaque, hwaddr addr,
                 value &= ~TCSR_TINT;
 
             xt->regs[addr] = value & 0x7ff;
-            if (value & TCSR_ENT)
+            if (value & TCSR_ENT) {
+                ptimer_transaction_begin(xt->ptimer);
                 timer_enable(xt);
+                ptimer_transaction_commit(xt->ptimer);
+            }
             break;
  
         default:
@@ -220,9 +222,10 @@ static void xilinx_timer_realize(DeviceState *dev, Error **errp)
 
         xt->parent = t;
         xt->nr = i;
-        xt->bh = qemu_bh_new(timer_hit, xt);
-        xt->ptimer = ptimer_init_with_bh(xt->bh, PTIMER_POLICY_DEFAULT);
+        xt->ptimer = ptimer_init(timer_hit, xt, PTIMER_POLICY_DEFAULT);
+        ptimer_transaction_begin(xt->ptimer);
         ptimer_set_freq(xt->ptimer, t->freq_hz);
+        ptimer_transaction_commit(xt->ptimer);
     }
 
     memory_region_init_io(&t->mmio, OBJECT(t), &timer_ops, t, "xlnx.xps-timer",
-- 
2.20.1

