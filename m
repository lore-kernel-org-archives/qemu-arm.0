Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp5441676wrm;
        Tue, 8 Oct 2019 10:27:32 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzkRXMd5L08lhKfTew7BO5IZnJnBOHlX2kTAuHM9PHAws40FfoloKPdK+HdG9ut1ZfBVT0O
X-Received: by 2002:ac8:27d9:: with SMTP id x25mr35197089qtx.321.1570555652256;
        Tue, 08 Oct 2019 10:27:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570555652; cv=none;
        d=google.com; s=arc-20160816;
        b=Tf6pZ5SnvpqyZNt5Im/7eIhCyHw2vSzoV6LHI6tpRN21TkpE+TUtYbq7P39rANJzFG
         htYVE3JJslmIDrFJEfibSj/CJt8ojptj6RfDZHPRvgfxTv5rV2Z/H5zwcXy3iZOA/q5+
         JX0XIKY35gwe/kGeLitiP5aTvqVvn/RcN5kcb8PQYEzWOeHdwKUYFEnAbbGKWvxBFraR
         q6OthcQak7LRFDTvoFd7zApg4BCw+0vdqTbdTqhIstrc3H+0NZNFhAb3K+X0WrbDZe7g
         oj5kfHmIqNmKaQTPZtquXd+O9Aj4Z5Ji4DWpQ5p068qmup1N5ErFJ1Myvy0U4iCIXmU2
         7ffw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=WdDJaaZ/rRs7yx03rtQr/OXY2zE5aVv2WsD7FCB9XiQ=;
        b=VzYAXW+uxqUr7Qbm7L1PcmO62RVkNFd1HWED+8NljemgtUg4Asmj4vyvcjiZOFMGMD
         3/Kg8P8nozutE7Exr4qHNzt5QUGEbeBk7B9TnF8G/hRS7lYCUHCywiwDb4FQzfNi+LX7
         U6oVjqkiviF7Xw58ZAOdyXodtoEoWWeKv/WMF+UCNa6GwL26EpQDW7dn9IqeYJws3TBW
         h3L6K/dRzLQlDqSkNJKaeNFtWpLZvFleXyVlPJWl3KAQxjwQ46WWvuHNLkbQBmtLn/7u
         bcm4k3JHPT6Rqo5kfxy2SYhWZP45Q8EMZffgNs0Zc4Pm0VVasTEv/oaadboSX4pii4vE
         Oyfg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Bzpfq2Bz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z11si16518416qvp.51.2019.10.08.10.27.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Oct 2019 10:27:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Bzpfq2Bz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iHtGl-0007cy-5E
	for alex.bennee@linaro.org; Tue, 08 Oct 2019 13:27:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48967)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iHt7b-0006kg-07
 for qemu-arm@nongnu.org; Tue, 08 Oct 2019 13:18:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iHt7Y-0002Ld-TH
 for qemu-arm@nongnu.org; Tue, 08 Oct 2019 13:18:02 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:46021)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iHt7W-0002Im-Ri
 for qemu-arm@nongnu.org; Tue, 08 Oct 2019 13:18:00 -0400
Received: by mail-wr1-x443.google.com with SMTP id r5so20261191wrm.12
 for <qemu-arm@nongnu.org>; Tue, 08 Oct 2019 10:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WdDJaaZ/rRs7yx03rtQr/OXY2zE5aVv2WsD7FCB9XiQ=;
 b=Bzpfq2BzeT6i8Poc+l2rSXhqmOGm8dTTj76XumrT9oGnPLL1M+zL++D9E3KgpycklD
 HU8f218i7bjlUbeuBlBq8ykAvW0UdgMbe+K00Q1f1yU3mc6xQDdinP9897UyPqVRj5J6
 SZDOuz6xnlIB3H4mC6ZblzRfvY0CrzFoMA2ykkgFFyjwbnrVObElxdhoP801JFxFIAb1
 CIkv4xoKuCVlAjjYdTcqIVB3/jyr7bvFBK/XENEW4U4o0LtHz7itbyEcJRJ6sx33ZyFH
 J6WfAHyh11e24CbXxsiux1+myW+UURUcGYN08mvq9bSLFCe8SeuqWpeWII8VoYKYxgil
 uX3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WdDJaaZ/rRs7yx03rtQr/OXY2zE5aVv2WsD7FCB9XiQ=;
 b=GAoXQiwnbqM2a+UtQm0E4moCWznKOIOxRnxx8jyYyqESv3+PlL/XcVzOHjgPYjLJtt
 QVn9VujIl8IvN7NjyQfqHiYAXS9P9ueFLgq9S+4tteuOirEPqq2MxU/ovChRXpG5LTLV
 j+yO9AAKV0VOUB6EDf10rzS1fUdvJMQALpmdaGtHfjVzhN3L4IAKEQnSvIPWCROg/Qrh
 FRPFkDLukf9duc+TWLIOaslQ81jejqJQu3M7eMgS9UezwdgA7mzVVxl64BNxK+0TUi4r
 zLQoKZLSgdIneHCol2AlcOKV/Oey66PIw6AtLc+jjO3kWk6Oy3WytC7+TKx3Zl2/kzY3
 4iDg==
X-Gm-Message-State: APjAAAX7W9Juky3PDCyRzkEcZoLU0mhhe3L0ib2k4nR8AZP14tUvQkNv
 IUQLIvS4iAoUawovzHfHN1VbyKw0gSMXpQ==
X-Received: by 2002:adf:c58b:: with SMTP id m11mr26761343wrg.252.1570555076363; 
 Tue, 08 Oct 2019 10:17:56 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id z9sm19135541wrl.35.2019.10.08.10.17.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2019 10:17:55 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 10/21] hw/timer/digic-timer.c: Switch to transaction-based
 ptimer API
Date: Tue,  8 Oct 2019 18:17:29 +0100
Message-Id: <20191008171740.9679-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191008171740.9679-1-peter.maydell@linaro.org>
References: <20191008171740.9679-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: d9wQhpiKyGvv

Switch the digic-timer.c code away from bottom-half based ptimers to
the new transaction-based ptimer API.  This just requires adding
begin/commit calls around the various places that modify the ptimer
state, and using the new ptimer_init() function to create the timer.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/timer/digic-timer.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/hw/timer/digic-timer.c b/hw/timer/digic-timer.c
index b111e1fe643..32612228daf 100644
--- a/hw/timer/digic-timer.c
+++ b/hw/timer/digic-timer.c
@@ -29,7 +29,6 @@
 #include "qemu/osdep.h"
 #include "hw/sysbus.h"
 #include "hw/ptimer.h"
-#include "qemu/main-loop.h"
 #include "qemu/module.h"
 #include "qemu/log.h"
 
@@ -52,7 +51,9 @@ static void digic_timer_reset(DeviceState *dev)
 {
     DigicTimerState *s = DIGIC_TIMER(dev);
 
+    ptimer_transaction_begin(s->ptimer);
     ptimer_stop(s->ptimer);
+    ptimer_transaction_commit(s->ptimer);
     s->control = 0;
     s->relvalue = 0;
 }
@@ -93,16 +94,20 @@ static void digic_timer_write(void *opaque, hwaddr offset,
             break;
         }
 
+        ptimer_transaction_begin(s->ptimer);
         if (value & DIGIC_TIMER_CONTROL_EN) {
             ptimer_run(s->ptimer, 0);
         }
 
         s->control = (uint32_t)value;
+        ptimer_transaction_commit(s->ptimer);
         break;
 
     case DIGIC_TIMER_RELVALUE:
         s->relvalue = extract32(value, 0, 16);
+        ptimer_transaction_begin(s->ptimer);
         ptimer_set_limit(s->ptimer, s->relvalue, 1);
+        ptimer_transaction_commit(s->ptimer);
         break;
 
     case DIGIC_TIMER_VALUE:
@@ -125,17 +130,24 @@ static const MemoryRegionOps digic_timer_ops = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
+static void digic_timer_tick(void *opaque)
+{
+    /* Nothing to do on timer rollover */
+}
+
 static void digic_timer_init(Object *obj)
 {
     DigicTimerState *s = DIGIC_TIMER(obj);
 
-    s->ptimer = ptimer_init_with_bh(NULL, PTIMER_POLICY_DEFAULT);
+    s->ptimer = ptimer_init(digic_timer_tick, NULL, PTIMER_POLICY_DEFAULT);
 
     /*
      * FIXME: there is no documentation on Digic timer
      * frequency setup so let it always run at 1 MHz
      */
+    ptimer_transaction_begin(s->ptimer);
     ptimer_set_freq(s->ptimer, 1 * 1000 * 1000);
+    ptimer_transaction_commit(s->ptimer);
 
     memory_region_init_io(&s->iomem, OBJECT(s), &digic_timer_ops, s,
                           TYPE_DIGIC_TIMER, 0x100);
-- 
2.20.1

