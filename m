Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp6478lfc;
        Wed, 2 Sep 2020 16:05:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwEX+M1Eux+R96R74i/yHSExwxn1/gGLgsCIjsPGhhQ9jeasRTT8aTn7maShGhrgqZrg9g6
X-Received: by 2002:a25:aca3:: with SMTP id x35mr46387ybi.3.1599087914879;
        Wed, 02 Sep 2020 16:05:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599087914; cv=none;
        d=google.com; s=arc-20160816;
        b=B6KWrrIIQfnBqyAxMSoQGjghJShbSgdfITkOBqFbk+UMHvEHaTYKeMmM4QS8F7EWkI
         G3l7PN0hnhVXBtH0yq7H8hS7ZV06OAkixa4cjQ8v9qTcSv1Rq3KAl4sy1Ok15mrRfJeh
         97/UDDLZkvK2fQt3+LDub7upxcci/vLxas1ZFZy3HvrzAAXzYVoPQjNmLTdAuWwhfpMj
         QWSLjpGMVnWNBei3aAfB3fZeOedvDZKkfSUSHx6m8B2jq7tyrAVfWI1802A+faW83EPd
         jIltMoE0vJnrUzMMj2AvmuiXuGTookCCYfSDy7zTdEl+9BGfsdHAcC7SW+OmVIdtqxw3
         Z22g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=KlgzwG9LMNP5KR5cuY0HArWP1u2TlaKf9DQrTHmB+ew=;
        b=H2yLX9AMlhtC7/vnnCiOjzDn1ABXoSrktsxOcwC8AG/zsIq+EcDUSmRCMof12E4MKG
         0jRSfmrpnyoYHR2xg75ZnzMT37nIJZJkQaalOgZdSFGKr6A0ZI9zyw3mhhlb8gKYoKn2
         7U+e8+M45v3cY5+g8adhM797q/TBSD+5zfFUD4NuJ9IdYkAm7hc79vfSMB4nKdH6WaFV
         2KBsq6r7EuxZsYZjNoJVueuYlENNk2buMzZiaSLuYOJE1ICRViL76naZKAlGIhow6v8B
         VA6KM0XF1zi2D4vOXbBePPFxncrLFE9NrjpNh9kDhxOCFiLXDlPo8C6NUWitfnVw83Lo
         kKQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Efd8h0tF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h132si1027681ybg.268.2020.09.02.16.05.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Sep 2020 16:05:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Efd8h0tF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kDboY-0002DE-2v
	for alex.bennee@linaro.org; Wed, 02 Sep 2020 19:05:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kDbVQ-0005Ac-7e
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 18:45:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kDbVO-0000D0-5d
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 18:45:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599086725;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KlgzwG9LMNP5KR5cuY0HArWP1u2TlaKf9DQrTHmB+ew=;
 b=Efd8h0tFm5hCe5hrg9Po6Tt/mPaCG3GbqrOCzLEMA2J49N4RUScSyMUe3LThHS7LXhCiT5
 LHimpIVtWYqhFVQOH6Uu6A3MTODMoBMuUSfeBmvto+d20omHrRGF9hggj/mWKu9j1yvC/r
 KEE1bYLAsJ18I37myPtLbk+zwRzyHRQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240--gKsb3FoM36zxIjT0kj9fw-1; Wed, 02 Sep 2020 18:45:22 -0400
X-MC-Unique: -gKsb3FoM36zxIjT0kj9fw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9198E18A2256;
 Wed,  2 Sep 2020 22:45:21 +0000 (UTC)
Received: from localhost (ovpn-66-226.rdu2.redhat.com [10.10.66.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 53B467E313;
 Wed,  2 Sep 2020 22:45:21 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 49/63] stm32f205: Rename STM32F2XXTIMER to STM32F2XX_TIMER
Date: Wed,  2 Sep 2020 18:42:57 -0400
Message-Id: <20200902224311.1321159-50-ehabkost@redhat.com>
In-Reply-To: <20200902224311.1321159-1-ehabkost@redhat.com>
References: <20200902224311.1321159-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/02 02:42:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, berrange@redhat.com,
 qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 16ffLKBdCnIO

Make the type checking macro name consistent with the TYPE_*
constant.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Cc: Alistair Francis <alistair@alistair23.me>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org
---
 include/hw/timer/stm32f2xx_timer.h | 2 +-
 hw/timer/stm32f2xx_timer.c         | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/hw/timer/stm32f2xx_timer.h b/include/hw/timer/stm32f2xx_timer.h
index 90f40f1746..70ef426afc 100644
--- a/include/hw/timer/stm32f2xx_timer.h
+++ b/include/hw/timer/stm32f2xx_timer.h
@@ -63,7 +63,7 @@
 
 #define TYPE_STM32F2XX_TIMER "stm32f2xx-timer"
 typedef struct STM32F2XXTimerState STM32F2XXTimerState;
-DECLARE_INSTANCE_CHECKER(STM32F2XXTimerState, STM32F2XXTIMER,
+DECLARE_INSTANCE_CHECKER(STM32F2XXTimerState, STM32F2XX_TIMER,
                          TYPE_STM32F2XX_TIMER)
 
 struct STM32F2XXTimerState {
diff --git a/hw/timer/stm32f2xx_timer.c b/hw/timer/stm32f2xx_timer.c
index ba8694dcd3..d880c0b4d5 100644
--- a/hw/timer/stm32f2xx_timer.c
+++ b/hw/timer/stm32f2xx_timer.c
@@ -96,7 +96,7 @@ static void stm32f2xx_timer_set_alarm(STM32F2XXTimerState *s, int64_t now)
 
 static void stm32f2xx_timer_reset(DeviceState *dev)
 {
-    STM32F2XXTimerState *s = STM32F2XXTIMER(dev);
+    STM32F2XXTimerState *s = STM32F2XX_TIMER(dev);
     int64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
 
     s->tim_cr1 = 0;
@@ -306,7 +306,7 @@ static Property stm32f2xx_timer_properties[] = {
 
 static void stm32f2xx_timer_init(Object *obj)
 {
-    STM32F2XXTimerState *s = STM32F2XXTIMER(obj);
+    STM32F2XXTimerState *s = STM32F2XX_TIMER(obj);
 
     sysbus_init_irq(SYS_BUS_DEVICE(obj), &s->irq);
 
@@ -317,7 +317,7 @@ static void stm32f2xx_timer_init(Object *obj)
 
 static void stm32f2xx_timer_realize(DeviceState *dev, Error **errp)
 {
-    STM32F2XXTimerState *s = STM32F2XXTIMER(dev);
+    STM32F2XXTimerState *s = STM32F2XX_TIMER(dev);
     s->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, stm32f2xx_timer_interrupt, s);
 }
 
-- 
2.26.2

