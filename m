Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp3655330wrd;
        Mon, 17 Sep 2018 01:42:16 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdY8rSJ524Rdf5H3gAH9XjPSCYzhPC9W3JeXBTxfgFNugNIoAZTdRbpGYzxZ2j3nmniw0Wsj
X-Received: by 2002:ac8:f2e:: with SMTP id e43-v6mr16208788qtk.262.1537173736283;
        Mon, 17 Sep 2018 01:42:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537173736; cv=none;
        d=google.com; s=arc-20160816;
        b=auVw1qMcAarVXLKGSFI/wdflhKN9D5DdJNU23y0hKGTFfgCqmR/x67Gk12L7DCwyg3
         FAwMJIP1+4s7sE40fwzcpH7NTfakiv03k4a9ItxqzpGB7GFkaXr+vcs/ckbFVweEX6eL
         hnPTuVSIJj0vHHA0+isCJmhZZDoKm4wRqq/2nDYNiE3rdElqOW+nF08X/5Cmc1GdR/Wn
         C6CBrD/NMjgnv1UuXdghqnUUfiL0wjEPs3GR5w/8rpfCId9kRLtzD7FqhckiqpV7CD7t
         JETmDqBcJl+KutLSHbQJ65uuqAoPkXEmdlJzphZ3buQDJhOAkBgolXogYCR2CaSgxBlp
         BGeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=krZVqdIwPxNhN4GiBwYv+XzuMQbm4BBUOAOnGP/fG7A=;
        b=ckWCfeuxvE/FvQ9dGwBYPiMWBr0CmqRtf7WbvJu2AdsfqydsGVN5cBlzv3yqKRMPsI
         0PFzMXGyz/byJ3Bb+Fv7gLp+VJ6ocatfuAcllGT8II1FPz6c9A/18DLaGtxRMV90SmDe
         oeixiDh/x9JFbLT+0P2SnavKxRfzlMhDvYw+RUJfMfIhcD+tgPKgtgIzBe1YqflETKui
         GvAT8Sds+kTCwX5SqzcOSN9ruCC89PiJBfgstixqz9PFO3b4iObppxo9U9CXw9I9ktZf
         rSTG4yheFZQbrbyL+rvcD49nzgBmu781lJytVUoFmEM7JFDuhXkiDo3VaDkK9fEsX0tk
         wV7w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=3PUygeru;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=aunUz5hp;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=jQppPchm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 35-v6si5881383qkz.103.2018.09.17.01.42.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 17 Sep 2018 01:42:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=3PUygeru;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=aunUz5hp;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=jQppPchm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34425 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g1p6l-0006ei-2L
	for alex.bennee@linaro.org; Mon, 17 Sep 2018 04:42:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46396)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1g1p5u-00069Q-Th
	for qemu-arm@nongnu.org; Mon, 17 Sep 2018 04:41:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1g1p5q-0005W9-Ig
	for qemu-arm@nongnu.org; Mon, 17 Sep 2018 04:41:22 -0400
Received: from greensocs.com ([193.104.36.180]:51748)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>)
	id 1g1p5q-0005VQ-4g; Mon, 17 Sep 2018 04:41:18 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 3DA33521ABA;
	Mon, 17 Sep 2018 10:41:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1537173671;
	bh=2EcAqJ44LxLI9TwdNOnM07gw735X6yx02uZL+SgKdOE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=3PUygerumSdKfYKEdqyzM07INA5Nh0qvR8O/ZSRx9UqDu/cnXBT1TQiKMgJSnvPB4
	6MNISOa/XdOnB7nBXdy4CxuFSk688QQ8UupmPFih4acwrJf2WRAVHo1P8V8RIgPRa+
	yPCH4nQHlPmuhimPf17earuJK8y+lZ2csbV4CzGA=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=aunUz5hp;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=jQppPchm
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S13w4oMlyNeL; Mon, 17 Sep 2018 10:41:10 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 3917A2387FF; Mon, 17 Sep 2018 10:41:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1537173670;
	bh=2EcAqJ44LxLI9TwdNOnM07gw735X6yx02uZL+SgKdOE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=aunUz5hpNHSdFjHwQZMdEp52BKJf8A6NMAzDHG2SiTH23kwceYiZV2/8AWgiaakN1
	EVk69+3rAo06b1xOmHPcHp/y7Z2DIC6SnFkV9HMqkzwyFwy4J8E8/8V4pL/5ps/Jg9
	FGztBZpGtS6ZRf21Z2LXrmcke/fAbjdrMD6fCIw4=
Received: from kouign-amann.hive.antfield.fr (antfield.tima.u-ga.fr
	[147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: damien.hedde@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 59CFB443483;
	Mon, 17 Sep 2018 10:41:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1537173669;
	bh=2EcAqJ44LxLI9TwdNOnM07gw735X6yx02uZL+SgKdOE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jQppPchmltnRwPxY0QDEcDGkZ1/4JNUnibEThjO97fbWxeHD/Psc1HoJLC/aXRGXt
	kfuSx6hLaqv1KD3YWY9GDRgje2raFJwtxaT/94cA6b57kUMwnuwkrK3IKywD5hHN4i
	2yiJAqKYkQAlTCh2kfSGCYcCPXnM7QIRHQRivZrs=
From: damien.hedde@greensocs.com
To: qemu-devel@nongnu.org
Date: Mon, 17 Sep 2018 10:40:11 +0200
Message-Id: <20180917084016.12750-6-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180917084016.12750-1-damien.hedde@greensocs.com>
References: <20180917084016.12750-1-damien.hedde@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v4 05/10] docs/clocks: add device's clock
 documentation
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, alistair@alistair23.me,
	mark.burton@greensocs.com, saipava@xilinx.com,
	qemu-arm@nongnu.org, Damien Hedde <damien.hedde@greensocs.com>,
	pbonzini@redhat.com, luc.michel@greensocs.com, fred.konrad@greensocs.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ruR6RxeFaCbd

From: Damien Hedde <damien.hedde@greensocs.com>

Add the documentation about the clock inputs and outputs in devices.

This is based on the original work of Frederic Konrad.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 docs/devel/clock.txt | 144 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 144 insertions(+)
 create mode 100644 docs/devel/clock.txt

diff --git a/docs/devel/clock.txt b/docs/devel/clock.txt
new file mode 100644
index 0000000000..d018fbef90
--- /dev/null
+++ b/docs/devel/clock.txt
@@ -0,0 +1,144 @@
+
+What are device's clocks
+========================
+
+Clocks are ports representing input and output clocks of a device. They are QOM
+objects developed for the purpose of modeling the distribution of clocks in
+QEMU.
+
+It allows to model the clock distribution of a platform and detect configuration
+errors in the clock tree such as badly configured PLL, clock source selection or
+disabled clock.
+
+The objects are CLOCK_IN for the input and CLOCK_OUT for the output.
+
+The clock value: ClockState
+===========================
+
+The ClockState is the structure carried by the CLOCK_OUT and CLOCK_IN objects.
+
+It actually contains two fields:
++ an integer representing the frequency of the clock in Hertz,
++ and a boolean representing the clock domain reset assertion signal.
+
+It only simulates the clock by transmitting the frequency value and
+doesn't model the signal itself such as pin toggle or duty cycle.
+The special value 0 as a frequency is legal and represent the clock being
+inactive or gated.
+
+Reset is also carried in the structure since both signals are closely related.
+But they remain value-independent, the frequency can be non-zero and the reset
+asserted as well as the opposite.
+
+Adding clocks to a device
+=========================
+
+Adding clocks to a device must be done during the init phase of the Device
+object.
+
+To add an input clock to a device, the function qdev_init_clock_in must be used.
+It takes the name, a callback, and an opaque parameter for the clock.
+output is more simple, only the name is required. Typically:
+qdev_init_clock_in(DEVICE(dev), "clk-in", clk_in_callback, dev);
+qdev_init_clock_out(DEVICE(dev), "clk-out");
+
+Both functions return the created CLOCK_IN/OUT pointer. For an output, it should
+be saved in the device's state structure in order to be able to change the
+clock. For an input, it can be saved it one need to change the callback.
+
+Note that it is possible to create a static array describing clock inputs and
+outputs. The function qdev_init_clocks must be called with the array as
+parameters to initialize the clocks: it has the same behaviour as calling the
+qdev_init_clock/out for each clock.
+
+Forwarding clocks
+=================
+
+Sometimes, one needs to forward, or inherit, a clock from another device.
+Typically, when doing device composition, a device might exposes a sub-device's
+clock without interfering with it.
+The function qdev_init_clock_forward can be used to achieve this behaviour.
+Note, that it is possible to expose the clock under a different name.
+This works for both inputs or outputs.
+
+For example, if device B is a child of device A, device_a_instance_init may
+do something like this:
+void device_a_instance_init(Object *obj)
+{
+    AState *A = DEVICE_A(obj);
+    BState *B;
+    [...] /* create B object as child of A */
+    qdev_init_clock_forward(A, "b_clk", B, "clk");
+    /*
+     * Now A has a clock "b_clk" which forwards to
+     * the "clk" of its child B.
+     */
+}
+
+This function does not returns any clock object. It is not possible to add
+a callback on a forwarded input clock.
+
+Connecting two clocks together
+==============================
+
+Let's say we have 2 devices A and B. A has an output clock named "clkout" and B
+has an input clock named "clkin".
+
+The clocks are connected together using the function qdev_clock_connect:
+qdev_clock_connect(B, "clkin", A, "clkout", &error_abort);
+The device which has the input must be the first argument.
+
+It is possible to connect several input clock to the same output. Every
+input callback will be called during the output changes.
+
+It is not possible to disconnect a clock neither to change the clock connection
+after it is done.
+
+Changing a clock output
+=======================
+
+A device can change its outputs using the clock_set function. It will trigger
+updates on any connected inputs.
+
+For example, let's say that we have an output clock "clkout" and we have pointer
+on it in the device state because we did the following in init phase:
+dev->clkout = qdev_init_clock_out(DEVICE(dev), "clkout");
+
+Then at any time, it is possible to change the clock value by doing:
+ClockState state;
+state.frequency = 1000 * 1000 * 1000; /* 1MHz */
+clock_set(dev->clkout, &state);
+
+Outputs must be initialized in the device_reset method to ensure every connected
+inputs is updated at machine startup.
+
+Callback on input clock change
+==============================
+
+Here is an example of an input callback:
+void clock_callback(void *opaque, ClockState *state) {
+    MyDeviceState *s = (MyDeviceState *) opaque;
+    /*
+     * opaque may not be the device state pointer, but most probably it is.
+     * (It depends on what is given to the qdev_init_clock_in function)
+     */
+
+    /* do something with the state */
+    fprintf(stdout, "device new frequency is %" PRIu64 "Hz\n",
+                    clock_state_get_frequency(state));
+
+    /* optionally store the value for later use in our state */
+    clock_state_copy(&s->clkin_shadow, state);
+}
+
+The state argument needs only to be copied if the device needs to use the value
+later: the state pointer argument of the pointer will not be valid anymore
+after the end of the function.
+
+Migration
+=========
+
+State is not stored in clock input or output. A device is responsible for
+setting its output clock correctly in the post_load function (using clock_set)
+after its state has been loaded. This way, during the migration process, all
+clocks will be correctly restored.
-- 
2.18.0

