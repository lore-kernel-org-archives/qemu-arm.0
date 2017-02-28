Received: by 10.25.0.147 with SMTP id 141csp1415934lfa;
        Tue, 28 Feb 2017 06:27:33 -0800 (PST)
X-Received: by 10.176.66.66 with SMTP id i60mr1160926uai.131.1488292053616;
        Tue, 28 Feb 2017 06:27:33 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i66si676775uad.247.2017.02.28.06.27.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 28 Feb 2017 06:27:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33279 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ciikV-0003q8-28
	for alex.bennee@linaro.org; Tue, 28 Feb 2017 09:27:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58898)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ciiJ6-0004ca-9i
	for qemu-arm@nongnu.org; Tue, 28 Feb 2017 08:59:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ciiJ5-0000SE-Ce
	for qemu-arm@nongnu.org; Tue, 28 Feb 2017 08:59:12 -0500
Received: from mail-wm0-x236.google.com ([2a00:1450:400c:c09::236]:38087)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ciiJ5-0000Rk-64
	for qemu-arm@nongnu.org; Tue, 28 Feb 2017 08:59:11 -0500
Received: by mail-wm0-x236.google.com with SMTP id u199so12413734wmd.1
	for <qemu-arm@nongnu.org>; Tue, 28 Feb 2017 05:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Pb19gmVahxi11ene1QrbC+t2KU21NZbs0UO506/BKxM=;
	b=MXooB1sswGuDaFChzQr172ZBUdYvcmW+y1hiW5BdDeI7Vbs5yw6lFW6PBJA2jG3nJD
	OhrHKfo5oyWGA/w/tzqV2Wox2d5jUvWY8e43qNzCMxVK3JQzyduKE9wHLF15PLYLZifY
	f7UvZc0QjRS+UmZP3Vw9fjOXIrzC1PgW4WWAQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Pb19gmVahxi11ene1QrbC+t2KU21NZbs0UO506/BKxM=;
	b=HhHSGk6GUckd88xW4RUrSW5SBbrpYtLw4fipfv1BxpGYRJSQcxqFAiGSkCJnRm1LN/
	1Kj/7B21EqOO1uNs6/eOVzRrNscYc2CzWMsYfKC7Ytd9O9Yx+vmyqEFlyXA0gcbS61PY
	HpsXbwH0kNZhNQwRUd6U0mFdSErWWoQmeJElku2xM/nIVpwuMnvMROslQ5Fobt9ySLY1
	pxjdfPUS/5bqDClAeT1n3niGreLH3TUD3gAl3Hb49WHndxmiFBjVLoXvnumChMiI7Ztt
	ktpg2x63ia3ZaGubWLyAD8wJ4Ny9MaMhJ5bFFc31+V46dz399MD1rXCwO7mA7Ov2rcot
	urwQ==
X-Gm-Message-State: AMke39nv7RMkKO7oGvu8ECdrQv508i3CHVEtC42ONIpKDA33DHjgh2UEMtgIWGudzwkdGZaZCtZgkcJqAqDVa7y7
X-Received: by 10.28.55.199 with SMTP id e190mr17465133wma.92.1488290349918;
	Tue, 28 Feb 2017 05:59:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Tue, 28 Feb 2017 05:58:49 -0800 (PST)
In-Reply-To: <20170224164021.9066-3-clement.deschamps@antfield.fr>
References: <20170224164021.9066-1-clement.deschamps@antfield.fr>
	<20170224164021.9066-3-clement.deschamps@antfield.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Feb 2017 13:58:49 +0000
Message-ID: <CAFEAcA_ZRB9VRQkWTJRh7D9fg-3+Bb=JGnMduhvu6WbOF2YWMw@mail.gmail.com>
To: Clement Deschamps <clement.deschamps@antfield.fr>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::236
Subject: Re: [Qemu-arm] [PATCH v3 2/4] hw/sd: add card-reparenting function
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Andrew Baumann <andrew.baumann@microsoft.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2QfsuBx7AxDz

On 24 February 2017 at 16:40, Clement Deschamps
<clement.deschamps@antfield.fr> wrote:
> Provide a new function sdbus_reparent_card() in sd core for reparenting
> a card from a SDBus to another one.
>
> This function is required by the raspi platform, where the two SD
> controllers can be dynamically switched.
>
> Signed-off-by: Clement Deschamps <clement.deschamps@antfield.fr>
> ---
>  hw/sd/core.c       | 30 ++++++++++++++++++++++++++++++
>  include/hw/sd/sd.h |  1 +
>  2 files changed, 31 insertions(+)
>

It turns out we got the logic wrong here -- it causes random
crashes on OSX, and this valgrind error on Linux:

==19695== Invalid read of size 8
==19695==    at 0x7DD59C: object_unparent (object.c:446)
==19695==    by 0x6E920A: sdbus_reparent_card (core.c:158)
==19695==    by 0x3ED0D5: bcm2835_gpio_reset (bcm2835_gpio.c:268)
==19695==    by 0x5DE10E: device_reset (qdev.c:1148)
==19695==    by 0x5DBFA3: qdev_reset_one (qdev.c:295)
==19695==    by 0x5DCBA7: qdev_walk_children (qdev.c:610)
==19695==    by 0x5E0D4A: qbus_walk_children (bus.c:59)
==19695==    by 0x5DC0BD: qbus_reset_all (qdev.c:321)
==19695==    by 0x5DC0E0: qbus_reset_all_fn (qdev.c:327)
==19695==    by 0x5E1690: qemu_devices_reset (reset.c:69)
==19695==    by 0x5258C6: qemu_system_reset (vl.c:1695)
==19695==    by 0x52D915: main (vl.c:4645)
==19695==  Address 0x354c9bc0 is 0 bytes after a block of size 32 alloc'd
==19695==    at 0x4C2FB55: calloc (in
/usr/lib/valgrind/vgpreload_memcheck-amd64-linux.so)
==19695==    by 0x1B7A5770: g_malloc0 (in
/lib/x86_64-linux-gnu/libglib-2.0.so.0.4800.2)
==19695==    by 0x5DB77C: bus_add_child (qdev.c:85)
==19695==    by 0x5DB8C9: qdev_set_parent_bus (qdev.c:107)
==19695==    by 0x5DBA17: qdev_try_create (qdev.c:153)
==19695==    by 0x5DB8EF: qdev_create (qdev.c:117)
==19695==    by 0x49E3AB: raspi2_init (raspi.c:152)
==19695==    by 0x52D68C: main (vl.c:4523)

I've dropped it (and the following patches) from the pull request
for the moment and will have a look at what the fix is.

thanks
-- PMM
