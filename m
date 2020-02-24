Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp553726lfg;
        Mon, 24 Feb 2020 09:05:31 -0800 (PST)
X-Google-Smtp-Source: APXvYqy2DXpD9kyQEpz+VP0/Bmcq2zYPqZdKOAamw1LatGugKIhi+/GSKMoqVQm1bC8TObLBfmEW
X-Received: by 2002:ac8:1184:: with SMTP id d4mr50463606qtj.104.1582563931381;
        Mon, 24 Feb 2020 09:05:31 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i12si5922177qtj.330.2020.02.24.09.05.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2020 09:05:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=fXCUfJMm;
       arc=fail (body hash mismatch);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:39588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6HAg-0004t6-GP
	for alex.bennee@linaro.org; Mon, 24 Feb 2020 12:05:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46803)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <damien.hedde@greensocs.com>) id 1j6H8Y-00037B-Ut
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 12:03:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <damien.hedde@greensocs.com>) id 1j6H8U-0005ZR-P5
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 12:03:18 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:46582)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <damien.hedde@greensocs.com>)
 id 1j6H8U-0005XT-Fh; Mon, 24 Feb 2020 12:03:14 -0500
Received: from crumble.bar.greensocs.com (crumble.bar.greensocs.com
 [172.16.11.102])
 by beetle.greensocs.com (Postfix) with ESMTPS id 1E32C96F53;
 Mon, 24 Feb 2020 17:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1582563793;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3KBnGhw9hDGxLz0Jcga+udQdewrmFAgw5G9wE9PuV2Y=;
 b=fXCUfJMm/IeJjr8r4SaxzQyaRbQOq53sLi92NSmwj5xnIOpqKmIM0U0n2LgIlXit8Fu32A
 942K1gONQNmnd3JD1y6CxRqr25ydoY2h3WSOD1Mz6xWou4kWsP6P9uFzvVcX+7EdqguBbD
 L25HXhRPVdi5Be7VR8uZ/3SCl30xgCc=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 5/9] docs/clocks: add device's clock documentation
Date: Mon, 24 Feb 2020 18:02:57 +0100
Message-Id: <20200224170301.246623-6-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200224170301.246623-1-damien.hedde@greensocs.com>
References: <20200224170301.246623-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1582563793;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3KBnGhw9hDGxLz0Jcga+udQdewrmFAgw5G9wE9PuV2Y=;
 b=VMlI7EvOp8GcDpVlmhfrE4GNXX1z2d86PTc5VV8m1ihb2KxUvtPUra4XZLZFma04KI7ASn
 J5agMpXRU1RRWd0Mew7WH1XMA/5ifgkfMwiBbySfgEkjn5Hp21O145ly0W7okkJCfSdUES
 Bnt5PWALoqOO/MG+iXa16lfi5VclR44=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1582563793; a=rsa-sha256; cv=none;
 b=J/NRIuNhhJVQbuCzlri6ERKRX+62lGziv6CA20o641RitoayOt3X9DwCYATkIyklVSWaiS
 sy485iirSUUMx9B/YNUYhJxdcv8x7CKeIwMcdDSmsfrctgEvZCT/UxVfY783jupny9HqLf
 otZwvhMEHawXKoCM3xWUfQrKdhGKaSE=
ARC-Authentication-Results: i=1;
	beetle.greensocs.com;
	none
X-Spam: Yes
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 5.135.226.135
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, peter.maydell@linaro.org,
 berrange@redhat.com, ehabkost@redhat.com, pbonzini@redhat.com,
 alistair@alistair23.me, mark.burton@greensocs.com, qemu-arm@nongnu.org,
 marcandre.lureau@redhat.com, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Bh2WaQXjMs/e

Add the documentation about the clock inputs and outputs in devices.

This is based on the original work of Frederic Konrad.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---

v7:
 + update ClockIn/Out types
---
 docs/devel/clocks.rst | 356 ++++++++++++++++++++++++++++++++++++++++++
 docs/devel/index.rst  |   1 +
 2 files changed, 357 insertions(+)
 create mode 100644 docs/devel/clocks.rst

diff --git a/docs/devel/clocks.rst b/docs/devel/clocks.rst
new file mode 100644
index 0000000000..cc5563691d
--- /dev/null
+++ b/docs/devel/clocks.rst
@@ -0,0 +1,356 @@
+
+What are clocks
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+Clocks are QOM objects developed for the purpose of modeling the
+distribution of clocks in QEMU.
+
+They allow us to model the clock distribution of a platform and detect
+configuration errors in the clock tree such as badly configured PLL, clo=
ck
+source selection or disabled clock.
+
+The object is *Clock* and its QOM name is ``CLOCK``.
+
+Clocks are typically used with devices where they are used to model inpu=
ts
+and outputs. They are created in a similar way as gpios. Inputs and outp=
uts
+of different devices can be connect together.
+
+In these cases a Clock object is a child of a Device object but this is =
not
+a requirement. Clocks can be independent of devices. For example it is p=
ossible
+to create a clock outside of any device to model the main clock source o=
f a
+machine.
+
+Here is an example of clocks::
+
+    +---------+      +----------------------+   +--------------+
+    | Clock 1 |      |       Device B       |   |   Device C   |
+    |         |      | +-------+  +-------+ |   | +-------+    |
+    |         |>>-+-->>|Clock 2|  |Clock 3|>>--->>|Clock 6|    |
+    +---------+   |  | | (in)  |  | (out) | |   | | (in)  |    |
+                  |  | +-------+  +-------+ |   | +-------+    |
+                  |  |            +-------+ |   +--------------+
+                  |  |            |Clock 4|>>
+                  |  |            | (out) | |   +--------------+
+                  |  |            +-------+ |   |   Device D   |
+                  |  |            +-------+ |   | +-------+    |
+                  |  |            |Clock 5|>>--->>|Clock 7|    |
+                  |  |            | (out) | |   | | (in)  |    |
+                  |  |            +-------+ |   | +-------+    |
+                  |  +----------------------+   |              |
+                  |                             | +-------+    |
+                  +----------------------------->>|Clock 8|    |
+                                                | | (in)  |    |
+                                                | +-------+    |
+                                                +--------------+
+
+Clocks are defined in include/hw/clock.h header and device related funct=
ions
+are defined in include/hw/qdev-clock.h header.
+
+The clock state
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+The state of a clock is its period; it is stored as an integer represent=
ing
+it in 2^-32ns unit. The special value of 0 is used to represent the cloc=
k being
+inactive or gated. The clocks do not model the signal itself (pin toggli=
ng)
+or other properties such as the duty cycle.
+
+All clocks contain this state: outputs as well as inputs. It allows to f=
etch
+the current period of a clock at any time. When a clock is updated, the
+value is immediately propagated to all connected clocks in the tree.
+
+To ease interaction with clocks. Helpers with a unit suffix are defined =
for
+every clock state setter or getter. They are:
+  + ``_ns`` for handling periods in nanosecond, and
+  + ``_hz`` for handling frequencies in hertz.
+The 0 period value is converted to 0 in hertz and vice versa. 0 always m=
eans
+that the clock is disabled.
+
+Adding a new a clock
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+Adding clocks to a device must be done during the init method of the Dev=
ice
+instance.
+
+To add an input clock to a device, the function qdev_init_clock_in must =
be used.
+It takes the name, a callback and an opaque parameter for the callback (=
this will
+be explained in a following section below).
+Output is more simple, only the name is required. Typically::
+
+    qdev_init_clock_in(DEVICE(dev), "clk_in", clk_in_callback, dev);
+    qdev_init_clock_out(DEVICE(dev), "clk_out");
+
+Both functions return the created Clock pointer, which should be saved i=
n the
+device's state structure for further use.
+
+These objects will be automatically deleted by the QOM reference mechani=
sm.
+
+Note that it is possible to create a static array describing clock input=
s and
+outputs. The function ``qdev_init_clocks()`` must be called with the arr=
ay as
+parameter to initialize the clocks: it has the same behaviour as calling=
 the
+``qdev_init_clock_in/out()`` for each clock in the array. To ease the ar=
ray
+construction, some macros are defined in include/hw/qdev-clock.h.
+As an example, the following creates 2 clocks to a device: one input and=
 one
+output.
+
+::
+
+    /* device structure containing pointer to the clock objects */
+    typedef struct MyDeviceState {
+        DeviceState parent_obj;
+        Clock *clk_in;
+        Clock *clk_out;
+    } MyDeviceState;
+
+    /*
+     * callback for the input clock (see "Callback on input clock
+     * change" section below for more information).
+     */
+    static void clk_in_callback(void *opaque);
+
+    /*
+     * static array describing clocks:
+     * + a clock input named "clk_in", whose pointer is stored in
+     *   clk_in field of a MyDeviceState structure with callback
+     *   clk_in_callback.
+     * + a clock output named "clk_out" whose pointer is stored in
+     *   clk_out field of a MyDeviceState structure.
+     */
+    static const ClockPortInitArray mydev_clocks =3D {
+        QDEV_CLOCK_IN(MyDeviceState, clk_in, clk_in_callback),
+        QDEV_CLOCK_OUT(MyDeviceState, clk_out),
+        QDEV_CLOCK_END
+    };
+
+    /* device initialization function */
+    static void mydev_init(Object *obj)
+    {
+        /* cast to MyDeviceState */
+        MyDeviceState *mydev =3D MYDEVICE(obj);
+        /* create and fill the pointer fields in the MyDeviceState */
+        qdev_init_clocks(mydev, mydev_clocks);
+        [...]
+    }
+
+An alternative way to create a clock is to simply call
+``object_new(TYPE_CLOCK)``. In that case the clock will neither be an in=
put nor
+an output of a device. After the whole QOM hieracrhy of the clock has be=
en set
+``clock_setup_canonical_path()`` should be called.
+
+At creation, the period of the clock is 0: the clock is disabled. You ca=
n
+change it using ``clock_set[_ns|_hz]()``.
+
+Note that if you are creating a clock with a fixed period which will nev=
er
+change (for example the main clock source of a board), then you'll have
+nothing else to do. This value will be propagated to other clocks when
+connecting the clocks together and devices will fetch the right value du=
ring
+the first reset.
+
+Retrieving clocks from a device
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
+
+``qdev_get_clock_in()`` and ``dev_get_clock_out()`` are available to get=
 the clock inputs or outputs of a device. For example::
+
+    Clock *clk =3D qdev_get_clock_in(DEVICE(mydev), "clk_in");
+
+or::
+
+    Clock *clk =3D qdev_get_clock_out(DEVICE(mydev), "clk_out");
+
+Connecting two clocks together
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
+
+To connect two clocks together, use the ``clock_set_source()`` function.
+Given two clocks ``clk1``, and ``clk2``, ``clock_set_source(clk2, clk1);=
``
+configure ``clk2`` to follow the ``clk1`` period changes. Every time ``c=
lk1``
+is updated, ``clk2`` will be updated too.
+
+When connecting clock between devices, prefer using the
+``qdev_connect_clock_in()`` function set the source of an input device c=
lock.
+For example, to connect the input clock ``clk2`` of ``devB`` to the outp=
ut
+clock ``clk1`` of ``devA``, do::
+
+    qdev_connect_clock_in(devB, "clk2", qdev_get_clock_out(devA, "clk1")=
)
+
+We used ``qdev_get_clock_out()`` above, but any clock can drive an input=
 clock,
+even another input clock. The following diagram shows some
+examples of connections. Note also that a clock can drive several other =
clocks.
+
+::
+
+  +------------+  +--------------------------------------------------+
+  |  Device A  |  |                   Device B                       |
+  |            |  |               +---------------------+            |
+  |            |  |               |       Device C      |            |
+  |  +-------+ |  | +-------+     | +-------+ +-------+ |  +-------+ |
+  |  |Clock 1|>>-->>|Clock 2|>>+-->>|Clock 3| |Clock 5|>>>>|Clock 6|>>
+  |  | (out) | |  | | (in)  |  |  | | (in)  | | (out) | |  | (out) | |
+  |  +-------+ |  | +-------+  |  | +-------+ +-------+ |  +-------+ |
+  +------------+  |            |  +---------------------+            |
+                  |            |                                     |
+                  |            |  +--------------+                   |
+                  |            |  |   Device D   |                   |
+                  |            |  | +-------+    |                   |
+                  |            +-->>|Clock 4|    |                   |
+                  |               | | (in)  |    |                   |
+                  |               | +-------+    |                   |
+                  |               +--------------+                   |
+                  +--------------------------------------------------+
+
+In the above example, when *Clock 1* is updated by *Device A*, three clo=
cks gets the new clock period value: *Clock 2*, Clock 3* and *Clock 4*.
+
+It is not possible to disconnect a clock or to change the clock connecti=
on
+after it is done.
+
+Unconnected input clocks
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+A newly created input clock is disabled (period of 0). It means the cloc=
k will
+be considered as disabled until the period is updated. If the clock rema=
ins
+unconnected it will always keep its initial value of 0. If this is not t=
he
+wanted behaviour, ``clock_set()``, ``clock_set_ns()`` or ``clock_set_hz(=
)``
+should be called on the Clock object during device instance init. For ex=
ample::
+
+    clk =3D qdev_init_clock_in(DEVICE(dev), "clk-in", clk_in_callback,
+                             dev);
+    /* set initial value to 10ns / 100MHz */
+    clock_set_ns(clk, 10);
+
+Fetching clock frequency/period
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
+
+To get the current state of a clock, the function ``clock_get()``,
+``clock_get_ns()`` or ``clock_get_hz()`` must be used.
+
+It is also possible to register a callback on clock frequency changes.
+Here is an example::
+
+    void clock_callback(void *opaque) {
+        MyDeviceState *s =3D (MyDeviceState *) opaque;
+        /*
+         * opaque may not be the device state pointer, but most
+         * probably it is. (It depends on what is given to the
+         * qdev_init_clock_in function)
+         */
+
+        /* do something with the new period */
+        fprintf(stdout, "device new period is %" PRIu64 "ns\n",
+                        clock_get_ns(dev->my_clk_input));
+    }
+
+Changing a clock period
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+A device can change its outputs using the ``clock_update()``,
+``clock_update_ns()`` or ``clock_update_hz()`` function. It will trigger
+updates on every connected input.
+
+For example, let's say that we have an output clock *clkout* and we have=
 a
+pointer to it in the device state because we did the following in init p=
hase::
+
+    dev->clkout =3D qdev_init_clock_out(DEVICE(dev), "clkout");
+
+Then at any time (apart from the cases listed below), it is possible to
+change the clock value by doing::
+
+    clock_update_hz(dev->clkout, 1000 * 1000 * 1000); /* 1Ghz */
+
+Because updating a clock may trigger any side effects through connected =
clocks
+and their callbacks, this operation must be done while holding the qemu =
io lock.
+
+For the same reason, one can updates clocks only when it is allowed to h=
ave
+side effects on other objects. In consequence, it is forbidden:
++ during migration,
++ and in the enter phase of reset.
+
+Note that calling ``clock_update[_ns|_hz]()`` is equivalent to call
+``clock_set[_ns|_hz]()`` (with the same arguments) then ``clock_propagat=
e()`` on
+the clock. Thus, setting the clock value can separated from triggering t=
he
+side-effects. This is often required to factorize code to handle reset a=
nd
+migration in devices.
+
+Aliasing clocks
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+Sometimes, one needs to forward, or inherit, a clock from another device=
.
+Typically, when doing device composition, a device might expose a sub-de=
vice's
+clock without interfering with it.
+The function ``qdev_alias_clock()`` can be used to achieve this behaviou=
r. Note
+that it is possible to expose the clock under a different name. This wor=
ks for
+both inputs and outputs.
+
+For example, if device B is a child of device A, ``device_a_instance_ini=
t()``
+may do something like this::
+
+    void device_a_instance_init(Object *obj)
+    {
+        AState *A =3D DEVICE_A(obj);
+        BState *B;
+        /* create B object as child of A */
+        [...]
+        qdev_alias_clock(B, "clk", A, "b_clk");
+        /*
+         * Now A has a clock "b_clk" which is an alias to
+         * the clock "clk" of its child B.
+         */
+    }
+
+This function does not return any clock object. The new clock has the sa=
me
+direction (input or output) as the original one. This function only adds=
 a link
+to the existing clock. In the above example, B object remains the only o=
bject
+allowed to use the clock and device A must not try to change the clock p=
eriod
+or set a callback to the clock. Here follows a diagram describing the ex=
ample
+with an input clock::
+
+    +--------------------------+
+    |        Device A          |
+    |         +--------------+ |
+    |         |   Device B   | |
+    |         | +-------+    | |
+    >>"b_clk">>>| "clk" |    | |
+    |  (in)   | |  (in) |    | |
+    |         | +-------+    | |
+    |         +--------------+ |
+    +--------------------------+
+
+Migration
+=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+Clock state are not migrated automatically. Every device must handle its
+clock migration. Alias clocks must not be migrated.
+
+To ensure clock states are restored correctly during migration, there is=
 two
+solutions.
+
+Clocks states can be migrated by adding an entry into the device
+vmstate description. To this purpose, the ``VMSTATE_CLOCK`` macro define=
s
+such an entry and should be used. This is typically used to migrate an i=
nput
+clock state. The following example describes it::
+
+    MyDeviceState {
+        DeviceState parent_obj;
+        [...] /* some fields */
+        Clock *clk;
+    };
+
+    VMStateDescription my_device_vmstate =3D {
+        .name =3D "my_device",
+        .fields =3D (VMStateField[]) {
+            [...], /* other migrated fields */
+            VMSTATE_CLOCK(clk, MyDeviceState),
+            VMSTATE_END_OF_LIST()
+        }
+    };
+
+The second solution is to restore the clock state using information alre=
ady
+at our disposal. This can be used to restore output clocks states using =
the
+device state. The functions ``clock_set[_ns|_hz]()`` can be used during
+``post_load()`` migration callback.
+
+When adding a clock support to an existing device, if you care about mig=
ration
+compatibility. To this end, you can use ``clock_set()`` in a ``pre_load(=
)``
+function to setup a default value in case the source virtual machine doe=
s not
+send the clock state. You may also need to use a vmstate subsection.
+
+Care should be taken not to use ``clock_update[_ns|_hz]()`` or
+``clock_propagate()`` during the whole migration procedure because it wi=
ll
+trigger side effects to other devices in an unknown state.
diff --git a/docs/devel/index.rst b/docs/devel/index.rst
index 4dc2ca8d71..f9c8c668ee 100644
--- a/docs/devel/index.rst
+++ b/docs/devel/index.rst
@@ -25,3 +25,4 @@ Contents:
    tcg-plugins
    bitops
    reset
+   clocks
--=20
2.24.1

