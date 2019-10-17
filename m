Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp982157wrm;
        Thu, 17 Oct 2019 06:53:38 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw5vHHqlF0dO3FwijB8F3W+aKYeHf/aOEqoTo0XxkymIjHtl4rSy5AghwdwzRRQ0EcuTK43
X-Received: by 2002:aa7:ce94:: with SMTP id y20mr3948246edv.120.1571320418723;
        Thu, 17 Oct 2019 06:53:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571320418; cv=none;
        d=google.com; s=arc-20160816;
        b=llchvS1KUuaEkx8u+unCP5RMfHPoQCO5k30brS4JxanOA5GbdvVWo/+su2TmT86tsD
         DyikPz2oSXmete1zvaS8nKRXmQn00dm+L7M/EJAs/sLpQAuFMo6489br+MdcNXPfOmPC
         hvkS+KN7aHpT4H7wqz5FEPy1KckD31/g9FlRACeAzi8FmdqOS/yyaL+LbXn2776wsZoX
         0teyBxC7mfS2HXulZ5T0wQnLfNKMwh8miVFyAhIbKRADphl59Nf0u7/ZxTigN4SHVi9P
         rgKqnB2kbF9O16BeqAIohEW1HhNHBrbrnMVntY8zCgA42VuorRua/LaJpjX+Nw5y2bFq
         tT7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=KWHu+m1O+EERA4S9NNTm+FIYK5BZF9JX07P8U3F6Cyk=;
        b=LCR0ibJDzTPMUqkxx/MB2MablMj/AhqOTHdxlkrWvZZwPMD9t65A+xk2swHhSJd/u3
         lC5KgNEfhGZ7gOWBHZ8OOMax1caHsHkd4RPp6kniRFk1WQhlbD1VorNVj169hM6FNiQo
         k76GbLpooctecVKdpoaCkQ7oPReq1Ny7vIZiAMUUIS4N+ItG8wID5XnQhGRQI2CU1idc
         Ol7aNQVv7/++UvJRyV1X8+djhXasEDLV2rR8T2E8Hh5UvE1yX/oKJhZXEw19KNk5IBL7
         YMiwezieYNthXBT/SispzBWJW+xq8eVM0dJueQlth8pmLbpc6o5GYrNPn9cv1SsNEq7x
         jUFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iuGkR5zC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l20si1419937ejb.111.2019.10.17.06.53.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Oct 2019 06:53:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iuGkR5zC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iL6Dh-0001mG-79
	for alex.bennee@linaro.org; Thu, 17 Oct 2019 09:53:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34987)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iL5id-00052X-5Z
 for qemu-arm@nongnu.org; Thu, 17 Oct 2019 09:21:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iL5ic-0000PR-2a
 for qemu-arm@nongnu.org; Thu, 17 Oct 2019 09:21:31 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:51564)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iL5ib-0000P2-Sd
 for qemu-arm@nongnu.org; Thu, 17 Oct 2019 09:21:30 -0400
Received: by mail-wm1-x343.google.com with SMTP id 7so2571562wme.1
 for <qemu-arm@nongnu.org>; Thu, 17 Oct 2019 06:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KWHu+m1O+EERA4S9NNTm+FIYK5BZF9JX07P8U3F6Cyk=;
 b=iuGkR5zCFL4filGYWyr6lIL6j5aQJ/Bxt6aRGY5pOq+xT7IEWp8369nt/MTC1yiN7h
 AZi6Sl8AsceN6aONXZ2s9fXrqRLyDVvmkXD0/Qtck7e07xwjTSylbb87zArPWTsiakUv
 T8BGsgJ2ILhHgqC/MQSyveu3o/i3NZQem/3jU9SCgBaJRNC2mwNVISy37Vv1ZJ7OSrjH
 kX5bDe2FXD2QmhTIzTfxQQUBcqalUpdri0pTxo7VwNgPqFugSBm5HNelZAgJIoxPaLR0
 INMp3EZDvG7LDpUF4n+jG+lxAUGtnc5o4SzOz66wfiqAqyrXdWqoj0MXiVlahB31ohOm
 9t1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KWHu+m1O+EERA4S9NNTm+FIYK5BZF9JX07P8U3F6Cyk=;
 b=Zme/iyxQJjHz4brz/jnEB0KIPgPpQza5W8fqcLgrNOfAe/NobHgtxyY05ahiRhG2sd
 +HPixordS+rgr/FI53iGB4d4dnhRVRJKkTMEEGYYZpB+kcTg+Mune392dVwzBT1/BWZt
 vsh54VXD0p0sbPZ16f1DysQuKiwAE5Jva0vmM+n1yqFZI2ldvan/hLoYHnXbRn9CMqIm
 x0CHm4B1/W76NblYaHhs3FEpmDwdgT1FkiNO4KflneOp77cQ3LGNlNuwRi3fQTQFEc2f
 UZWP3AlJk+XpfXEpFToNy+I2Iov8OVwLyPPexLsXmE45sG2OC1E+X0GSh86hVr9G0/xa
 dH6g==
X-Gm-Message-State: APjAAAWkh5CF7LoqiqkMYAGbuM98T8tGIhDN/DPMy++C7l3DnCzZGZc5
 bHLi33dknNUIHcEChfCE78vN2Q==
X-Received: by 2002:a7b:c011:: with SMTP id c17mr2959378wmb.95.1571318488967; 
 Thu, 17 Oct 2019 06:21:28 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id e9sm11543164wme.3.2019.10.17.06.21.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2019 06:21:28 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] hw/dma/xilinx_axidma.c: Switch to transaction-based
 ptimer API
Date: Thu, 17 Oct 2019 14:21:22 +0100
Message-Id: <20191017132122.4402-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191017132122.4402-1-peter.maydell@linaro.org>
References: <20191017132122.4402-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
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
X-TUID: moLrU2t2aasT

Switch the xilinx_axidma code away from bottom-half based ptimers to
the new transaction-based ptimer API.  This just requires adding
begin/commit calls around the various places that modify the ptimer
state, and using the new ptimer_init() function to create the timer.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/dma/xilinx_axidma.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/hw/dma/xilinx_axidma.c b/hw/dma/xilinx_axidma.c
index e035d1f7504..fb3a978e282 100644
--- a/hw/dma/xilinx_axidma.c
+++ b/hw/dma/xilinx_axidma.c
@@ -31,7 +31,6 @@
 #include "hw/ptimer.h"
 #include "hw/qdev-properties.h"
 #include "qemu/log.h"
-#include "qemu/main-loop.h"
 #include "qemu/module.h"
 
 #include "hw/stream.h"
@@ -104,7 +103,6 @@ enum {
 };
 
 struct Stream {
-    QEMUBH *bh;
     ptimer_state *ptimer;
     qemu_irq irq;
 
@@ -242,6 +240,7 @@ static void stream_complete(struct Stream *s)
     unsigned int comp_delay;
 
     /* Start the delayed timer.  */
+    ptimer_transaction_begin(s->ptimer);
     comp_delay = s->regs[R_DMACR] >> 24;
     if (comp_delay) {
         ptimer_stop(s->ptimer);
@@ -255,6 +254,7 @@ static void stream_complete(struct Stream *s)
         s->regs[R_DMASR] |= DMASR_IOC_IRQ;
         stream_reload_complete_cnt(s);
     }
+    ptimer_transaction_commit(s->ptimer);
 }
 
 static void stream_process_mem2s(struct Stream *s, StreamSlave *tx_data_dev,
@@ -551,9 +551,10 @@ static void xilinx_axidma_realize(DeviceState *dev, Error **errp)
         struct Stream *st = &s->streams[i];
 
         st->nr = i;
-        st->bh = qemu_bh_new(timer_hit, st);
-        st->ptimer = ptimer_init_with_bh(st->bh, PTIMER_POLICY_DEFAULT);
+        st->ptimer = ptimer_init(timer_hit, st, PTIMER_POLICY_DEFAULT);
+        ptimer_transaction_begin(st->ptimer);
         ptimer_set_freq(st->ptimer, s->freqhz);
+        ptimer_transaction_commit(st->ptimer);
     }
     return;
 
-- 
2.20.1

