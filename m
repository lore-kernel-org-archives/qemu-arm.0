Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp425333wrt;
        Thu, 3 Jan 2019 01:17:12 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6UXtp9LTYuyYi6GKYUD7lBrFa77ltKKsv771rxFDtqkGASEMWC7mdbyMwSRIaB3Wrw5CH1
X-Received: by 2002:a37:5189:: with SMTP id f131mr42456150qkb.309.1546507032262;
        Thu, 03 Jan 2019 01:17:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546507032; cv=none;
        d=google.com; s=arc-20160816;
        b=RddXmn+TeswYCpF0y5pjjYeeSpQAGg9GT5MGOpR+/0MDEZMR8oJ+g4kfNC8N+aVnJ+
         QQ32cuHkfr78h3nqGCJ0kzkc1Y6btgRu2WYnaseX/dAH1BEB3kt4NbK6nklVJD8lMS48
         l1Xg4feQ4uoA0+++js77SIRyve7i1HjS9720f5fECdpPU7wGmLaUVkW3XKQmDXVVXZ8S
         Ym5rY1u0k0q/tT+vj/jK9ARW2QflL2RqoT6peR3vrdqg8+xBtiCOUSBzJ3UgloVi0a+2
         pWXvIYMP9yX75mpNmjFBlXNE3x8MjqsvsoxR6q7dHJZBnSAOgGV1UJtHC8/+9PzxziDh
         jwiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=PFBTZ5eDxMokR+6qdyv65VWOZ9ht0FKYoiuU/EWxruA=;
        b=FJYW7YbF50nVqAT5DoqrwZwKvhNhK5OQquARUZLRvky56FnvRtZiH4bQcwO9NuB47k
         Y60vqplFxh9zFptufeYDCIaBxUCpChsLAgjORZmI2wWUGHLaVWKPtwvH6qwDxBJytBSO
         TkiXwtvR3AkTKsRtWZkq5feihwytjNCbt/i7W1ss8+lI6FXRkWTk29D9IHDJw6mQYjYM
         YrmyN0EbUBo03FEaC5uS1ZlwjFO90Hqxnu7mAbKSGIBniJJI1uPDKx6iaSsGL+Q7FGQK
         UTOJhcPWjDuRuZRDkthtPgjszV6UsyT54v1R0fQrcX8lnM5BB+LJSn2mYRhxXOspUGx6
         aYMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id z14si1293290qtn.132.2019.01.03.01.17.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Jan 2019 01:17:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:49954 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gez7n-0007v8-6C
	for alex.bennee@linaro.org; Thu, 03 Jan 2019 04:17:11 -0500
Received: from eggs.gnu.org ([208.118.235.92]:51993)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1gez3y-0003pA-CS
	for qemu-arm@nongnu.org; Thu, 03 Jan 2019 04:13:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1gez3w-0006m3-BC
	for qemu-arm@nongnu.org; Thu, 03 Jan 2019 04:13:14 -0500
Received: from mx1.redhat.com ([209.132.183.28]:40506)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1gez3w-0006ld-45; Thu, 03 Jan 2019 04:13:12 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 38E5A432B7;
	Thu,  3 Jan 2019 09:13:11 +0000 (UTC)
Received: from localhost (ovpn-117-118.ams2.redhat.com [10.36.117.118])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BD49360C45;
	Thu,  3 Jan 2019 09:13:10 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: <qemu-devel@nongnu.org>
Date: Thu,  3 Jan 2019 09:11:18 +0000
Message-Id: <20190103091119.9367-11-stefanha@redhat.com>
In-Reply-To: <20190103091119.9367-1-stefanha@redhat.com>
References: <20190103091119.9367-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Thu, 03 Jan 2019 09:13:11 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 10/11] tests/microbit-test: Add Tests for nRF51
 Timer
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Steffen=20G=C3=B6rtz?= <contrib@steffen-goertz.de>,
	Jim Mussared <jim@groklearning.com>, qemu-arm@nongnu.org,
	Joel Stanley <joel@jms.id.au>, Stefan Hajnoczi <stefanha@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 52hlGN50D8nE

From: Steffen G=C3=B6rtz <contrib@steffen-goertz.de>

Basic tests for nRF51 Timer Peripheral.

Signed-off-by: Steffen G=C3=B6rtz <contrib@steffen-goertz.de>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 tests/microbit-test.c | 95 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 95 insertions(+)

diff --git a/tests/microbit-test.c b/tests/microbit-test.c
index 535714797a..16dffb1396 100644
--- a/tests/microbit-test.c
+++ b/tests/microbit-test.c
@@ -20,6 +20,7 @@
=20
 #include "hw/arm/nrf51.h"
 #include "hw/gpio/nrf51_gpio.h"
+#include "hw/timer/nrf51_timer.h"
=20
 static void test_nrf51_gpio(void)
 {
@@ -143,6 +144,99 @@ static void test_nrf51_gpio(void)
     qtest_set_irq_in(global_qtest, "/machine/nrf51", "unnamed-gpio-in", =
0, 0);
 }
=20
+static void timer_task(hwaddr task)
+{
+    writel(NRF51_TIMER_BASE + task, NRF51_TRIGGER_TASK);
+}
+
+static void timer_clear_event(hwaddr event)
+{
+    writel(NRF51_TIMER_BASE + event, NRF51_EVENT_CLEAR);
+}
+
+static void timer_set_bitmode(uint8_t mode)
+{
+    writel(NRF51_TIMER_BASE + NRF51_TIMER_REG_BITMODE, mode);
+}
+
+static void timer_set_prescaler(uint8_t prescaler)
+{
+    writel(NRF51_TIMER_BASE + NRF51_TIMER_REG_PRESCALER, prescaler);
+}
+
+static void timer_set_cc(size_t idx, uint32_t value)
+{
+    writel(NRF51_TIMER_BASE + NRF51_TIMER_REG_CC0 + idx * 4, value);
+}
+
+static void timer_assert_events(uint32_t ev0, uint32_t ev1, uint32_t ev2=
,
+                                uint32_t ev3)
+{
+    g_assert(readl(NRF51_TIMER_BASE + NRF51_TIMER_EVENT_COMPARE_0) =3D=3D=
 ev0);
+    g_assert(readl(NRF51_TIMER_BASE + NRF51_TIMER_EVENT_COMPARE_1) =3D=3D=
 ev1);
+    g_assert(readl(NRF51_TIMER_BASE + NRF51_TIMER_EVENT_COMPARE_2) =3D=3D=
 ev2);
+    g_assert(readl(NRF51_TIMER_BASE + NRF51_TIMER_EVENT_COMPARE_3) =3D=3D=
 ev3);
+}
+
+static void test_nrf51_timer(void)
+{
+    uint32_t steps_to_overflow =3D 408;
+
+    /* Compare Match */
+    timer_task(NRF51_TIMER_TASK_STOP);
+    timer_task(NRF51_TIMER_TASK_CLEAR);
+
+    timer_clear_event(NRF51_TIMER_EVENT_COMPARE_0);
+    timer_clear_event(NRF51_TIMER_EVENT_COMPARE_1);
+    timer_clear_event(NRF51_TIMER_EVENT_COMPARE_2);
+    timer_clear_event(NRF51_TIMER_EVENT_COMPARE_3);
+
+    timer_set_bitmode(NRF51_TIMER_WIDTH_16); /* 16 MHz Timer */
+    timer_set_prescaler(0);
+    /* Swept over in first step */
+    timer_set_cc(0, 2);
+    /* Barely miss on first step */
+    timer_set_cc(1, 162);
+    /* Spot on on third step */
+    timer_set_cc(2, 480);
+
+    timer_assert_events(0, 0, 0, 0);
+
+    timer_task(NRF51_TIMER_TASK_START);
+    clock_step(10000);
+    timer_assert_events(1, 0, 0, 0);
+
+    /* Swept over on first overflow */
+    timer_set_cc(3, 114);
+
+    clock_step(10000);
+    timer_assert_events(1, 1, 0, 0);
+
+    clock_step(10000);
+    timer_assert_events(1, 1, 1, 0);
+
+    /* Wrap time until internal counter overflows */
+    while (steps_to_overflow--) {
+        timer_assert_events(1, 1, 1, 0);
+        clock_step(10000);
+    }
+
+    timer_assert_events(1, 1, 1, 1);
+
+    timer_clear_event(NRF51_TIMER_EVENT_COMPARE_0);
+    timer_clear_event(NRF51_TIMER_EVENT_COMPARE_1);
+    timer_clear_event(NRF51_TIMER_EVENT_COMPARE_2);
+    timer_clear_event(NRF51_TIMER_EVENT_COMPARE_3);
+    timer_assert_events(0, 0, 0, 0);
+
+    timer_task(NRF51_TIMER_TASK_STOP);
+
+    /* Test Proposal: Stop/Shutdown */
+    /* Test Proposal: Shortcut Compare -> Clear */
+    /* Test Proposal: Shortcut Compare -> Stop */
+    /* Test Proposal: Counter Mode */
+}
+
 int main(int argc, char **argv)
 {
     int ret;
@@ -152,6 +246,7 @@ int main(int argc, char **argv)
     global_qtest =3D qtest_initf("-machine microbit");
=20
     qtest_add_func("/microbit/nrf51/gpio", test_nrf51_gpio);
+    qtest_add_func("/microbit/nrf51/timer", test_nrf51_timer);
=20
     ret =3D g_test_run();
=20
--=20
2.19.2

