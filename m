Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp5134737wrt;
        Tue, 2 Oct 2018 07:39:07 -0700 (PDT)
X-Google-Smtp-Source: ACcGV607HIibq6un98jxtv+huoaIWMS7tZt5WCPo40imf8Ofc6ZbRTCmREztcMDu+bG+bqSYfO+9
X-Received: by 2002:a0c:8c0a:: with SMTP id n10-v6mr11033904qvb.119.1538491147742;
        Tue, 02 Oct 2018 07:39:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538491147; cv=none;
        d=google.com; s=arc-20160816;
        b=LvYXXlavjSwFvXoyUheW0j7eaPOz0GaMVK2v3EaZoCcdlT+p6YkNkGihC5Z8q58BWf
         +3XWLBDHSSTGRzyhtKgys3VTWFMM+0o83hzaVRGWJD3zy+xDF5sPJ7o2pCx0Bx6UaEiN
         MOdtFDK1AQLqJCashPhKxAk0juoXImWbNFT6ANJk7wSGEd07ahu9shZqw/YxLEiYJ5Uv
         WOrFPqk5j1NEHxLtcg1fdg8KOV9f7NWzNUJxSEPusItbLsr2rUXt3531pVfhbYQUEYem
         B0RpW56hRz1KOV2USWoot/NNUFwkrlLsIYpkKxfVf5FSBcc/uPIkL3psok11J21ZeHr3
         OuHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=0XuJVUrLx1qOUsxK6/wjQZpPpB8tv8192VrzUgMsodI=;
        b=h7eYj7b0C9/DBEUhjUGqNaL6HC/QWUCxmEI3NQLgWiVnW3onCGbIMdqlENGBu30hxN
         1VcoyerUHe4VXG1s25v0hGTP4CB00lJrDvlNL34euxo8x57r2ycA/444h1ZpFWb4YewH
         2nBw/QbHvEl9q3zlwt5q+mfQJLa/HWDDHDayaIo47RZXmMw3rSvljmauGjd1CnpHKCB1
         kZ3CSTCiis/m8gOLZDUUIbcWeuzPLAby7qlU6hfZxxuikkyqx7aW/oL+M/33xCjh/mE0
         t3MgsnTS6AVQzX1gyRWH6BTkTyCUQEM11bD8EVrZqDJYyQ1rr+04IqPXQqRahP/+JrJy
         8x0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=R+3tWROO;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=kCn4QJq0;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=5T+1b0Ws;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r50-v6si6841871qvj.164.2018.10.02.07.39.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Oct 2018 07:39:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=R+3tWROO;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=kCn4QJq0;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=5T+1b0Ws;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44021 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g7LpL-0007Oh-5v
	for alex.bennee@linaro.org; Tue, 02 Oct 2018 10:39:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46555)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1g7Lmo-0005FG-8b
	for qemu-devel@nongnu.org; Tue, 02 Oct 2018 10:36:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1g7LdC-0004QW-MZ
	for qemu-devel@nongnu.org; Tue, 02 Oct 2018 10:26:37 -0400
Received: from greensocs.com ([193.104.36.180]:53912)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>)
	id 1g7LdA-0004NR-4w; Tue, 02 Oct 2018 10:26:32 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 30B5B442AFD;
	Tue,  2 Oct 2018 16:26:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1538490368;
	bh=5hEvNX90SokMK9PbyoKGxS0APN8VtL8lmcUwytaGsG0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=R+3tWROOucd/xvoOTFlNHBNcRDLHBtEtVDKz7R9uoao3kDR7D4NcnOlsPYDzttvhx
	XF0X/KaPb/m75Dy0eUdySElJk6ZGEQn6yEdODwEmEDNUrC9ITuk6fVvvleA05sdFpI
	WA3f7A+/Q2Ffci45cgviM7I0wIeJg1aRuF6qRg4Y=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=kCn4QJq0;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=5T+1b0Ws
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X9DHJz8u4MPG; Tue,  2 Oct 2018 16:26:07 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 05509442AE7; Tue,  2 Oct 2018 16:26:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1538490366;
	bh=5hEvNX90SokMK9PbyoKGxS0APN8VtL8lmcUwytaGsG0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kCn4QJq0xr9djIDbeJk7HzeI2pe54V9soBz/XVJMZsSWzNMhRiDXIXOAna3wfSg2z
	YM1QRk/+JK/WmzR1k3vt5SvKoe/elPp6aADbd7pCGmA3zi+L4LatTcpp+Szv61vlOy
	KoybwY/CRgFaNm9blH4/Kp4fUy+xmY7lA3KCYBrM=
Received: from kouign-amann.hive.antfield.fr (antfield.tima.u-ga.fr
	[147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: damien.hedde@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 94F9C442AEC;
	Tue,  2 Oct 2018 16:26:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1538490365;
	bh=5hEvNX90SokMK9PbyoKGxS0APN8VtL8lmcUwytaGsG0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=5T+1b0WsDjdEl8C9hbQfVj0Hi5vJtUDlmVKYZI2+FBERL7x0Fq2bl5d+RrAL3aDCl
	4+XWRnUs4GU+E8+2utUq/Nfe0DCoAo9TILz0c8yWzwgCEQqvRAoJJ6Q3pQwaixv00G
	Kx4EvwYYjLDZgZp6XGnxq6UWygxbqSheVDT1+I4A=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Date: Tue,  2 Oct 2018 16:24:39 +0200
Message-Id: <20181002142443.30976-6-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20181002142443.30976-1-damien.hedde@greensocs.com>
References: <20181002142443.30976-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-devel] [PATCH v5 5/9] docs/clocks: add device's clock
 documentation
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, alistair@alistair23.me,
	mark.burton@greensocs.com, saipava@xilinx.com,
	qemu-arm@nongnu.org, Damien Hedde <damien.hedde@greensocs.com>,
	pbonzini@redhat.com, konrad@adacore.com, luc.michel@greensocs.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CInUnScUiObT

Add the documentation about the clock inputs and outputs in devices.

This is based on the original work of Frederic Konrad.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 docs/devel/clock.txt | 163 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 163 insertions(+)
 create mode 100644 docs/devel/clock.txt

diff --git a/docs/devel/clock.txt b/docs/devel/clock.txt
new file mode 100644
index 0000000000..6dd8abdee6
--- /dev/null
+++ b/docs/devel/clock.txt
@@ -0,0 +1,163 @@
+
+What are device's clocks
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+Clocks are ports representing input and output clocks of a device. They =
are QOM
+objects developed for the purpose of modeling the distribution of clocks=
 in
+QEMU.
+
+This allows us to model the clock distribution of a platform and detect
+configuration errors in the clock tree such as badly configured PLL, clo=
ck
+source selection or disabled clock.
+
+The objects are CLOCK_IN for the input and CLOCK_OUT for the output.
+
+The clock value: ClockState
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
+
+The ClockState is the structure carried by the CLOCK_OUT and CLOCK_IN ob=
jects.
+It contains one integer field representing the frequency of the clock in=
 Hertz.
+
+It only simulates the clock by transmitting the frequency value and
+doesn't model the signal itself such as pin toggle or duty cycle.
+The special value 0 as a frequency is legal and represent the clock bein=
g
+inactive or gated.
+
+Adding clocks to a device
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
+
+Adding clocks to a device must be done during the init phase of the Devi=
ce
+object.
+
+To add an input clock to a device, the function qdev_init_clock_in must =
be used.
+It takes the name, a callback, and an opaque parameter for the clock.
+Output is more simple, only the name is required. Typically:
+qdev_init_clock_in(DEVICE(dev), "clk-in", clk_in_callback, dev);
+qdev_init_clock_out(DEVICE(dev), "clk-out");
+
+Both functions return the created CLOCK_IN/OUT pointer, which should be =
saved
+in the device's state structure.
+
+Theses objects will be automatically deleted by the qom reference mechan=
ism.
+
+Note that it is possible to create a static array describing clock input=
s and
+outputs. The function qdev_init_clocks must be called with the array as
+parameters to initialize the clocks: it has the same behaviour as callin=
g the
+qdev_init_clock/out for each clock in the array.
+
+Unconnected input clocks
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+Unconnected input clocks have a default frequency value of 0. It means t=
he
+clock will be considered as disabled. If this is not the wanted behaviou=
r,
+clock_init_frequency should be called on the ClockIn object during devic=
e init.
+For example:
+clk =3D qdev_init_clock_in(DEVICE(dev), "clk-in", clk_in_callback, dev);
+clock_init_frequency(clk, 100 * 1000 * 1000); // init value is 100Mhz
+
+Forwarding clocks
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+Sometimes, one needs to forward, or inherit, a clock from another device=
.
+Typically, when doing device composition, a device might expose a sub-de=
vice's
+clock without interfering with it.
+The function qdev_pass_clock can be used to achieve this behaviour. Note=
, that
+it is possible to expose the clock under a different name. This works fo=
r both
+inputs or outputs.
+
+For example, if device B is a child of device A, device_a_instance_init =
may
+do something like this:
+void device_a_instance_init(Object *obj)
+{
+    AState *A =3D DEVICE_A(obj);
+    BState *B;
+    [...] /* create B object as child of A */
+    qdev_pass_clock(A, "b_clk", B, "clk");
+    /*
+     * Now A has a clock "b_clk" which forwards to
+     * the "clk" of its child B.
+     */
+}
+
+This function does not returns any clock object. It is not possible to a=
dd
+a callback on a forwarded input clock.
+
+Connecting two clocks together
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
+
+Let's say we have 2 devices A and B. A has an output clock named "clkout=
" and B
+has an input clock named "clkin".
+
+The clocks are connected together using the function qdev_connect_clock:
+qdev_connect_clock(B, "clkin", A, "clkout", &error_abort);
+The device which has the input must be the first argument.
+
+It is possible to connect several input clocks to the same output. Every
+input callback will be called when the output changes.
+
+It is not possible to disconnect a clock or to change the clock connecti=
on
+after it is done.
+
+Changing a clock output
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+A device can change its outputs using the clock_set function. It will tr=
igger
+updates on any connected inputs.
+
+For example, let's say that we have an output clock "clkout" and we have=
 a
+pointer to it in the device state because we did the following in init p=
hase:
+dev->clkout =3D qdev_init_clock_out(DEVICE(dev), "clkout");
+
+Then at any time, it is possible to change the clock value by doing:
+clock_set_frequency(dev->clkout, 1000 * 1000 * 1000); /* 1Mhz */
+
+Callback on input clock change
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
+
+Here is an example of an input callback:
+void clock_callback(void *opaque) {
+    MyDeviceState *s =3D (MyDeviceState *) opaque;
+    /*
+     * opaque may not be the device state pointer, but most probably it =
is.
+     * (It depends on what is given to the qdev_init_clock_in function)
+     */
+
+    /* do something with the new frequency */
+    fprintf(stdout, "device new frequency is %" PRIu64 "Hz\n",
+                    clock_get_frequency(dev->my_clk_input));
+}
+
+The state argument needs only to be copied if the device needs to use th=
e value
+later: the state pointer argument of the pointer will not be valid anymo=
re
+after the end of the function.
+
+Migration
+=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+Only the CLOCK_IN object has a state. CLOCK_OUT frequency should not be =
set
+in migration post_load.
+
+In case the frequency of in input clock is needed for a device's migrati=
on,
+this state must be migrated. The VMSTATE_CLOCKIN macro defines an entry =
to
+be added in a vmstate description.
+
+For example, if a device has a clock input and the device state looks li=
ke:
+MyDeviceState {
+    DeviceState parent_obj;
+    ClockIn *clk;
+};
+
+Then, to add the clock frequency to the device's migrated state, the vms=
tate
+description is:
+VMStateDescription my_device_vmstate =3D {
+    .name =3D "my_device",
+    .fields =3D (VMStateField[]) {
+        VMSTATE_CLOCKIN(clk, MyDeviceState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+When adding a input clock support to an existing device, you must care a=
bout
+migration compatibility. To this end, you can use the clock_init_frequen=
cy in
+a pre_load function to setup a default value in case the source vm does =
not
+migrate the frequency.
--=20
2.19.0

