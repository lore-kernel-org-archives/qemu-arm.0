Received: by 10.182.158.201 with SMTP id ww9csp115613obb;
        Fri, 27 Nov 2015 11:54:28 -0800 (PST)
X-Received: by 10.140.92.85 with SMTP id a79mr56856197qge.105.1448654068428;
        Fri, 27 Nov 2015 11:54:28 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c8si30141155qgf.45.2015.11.27.11.54.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 Nov 2015 11:54:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58324 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a2P6C-0004RA-0N
	for alex.bennee@linaro.org; Fri, 27 Nov 2015 14:54:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50448)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcd@tribudubois.net>) id 1a2P69-0004PV-3N
	for qemu-arm@nongnu.org; Fri, 27 Nov 2015 14:54:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jcd@tribudubois.net>) id 1a2P65-0005Ri-S0
	for qemu-arm@nongnu.org; Fri, 27 Nov 2015 14:54:25 -0500
Received: from zose-mta05.web4all.fr ([185.49.20.50]:42352)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcd@tribudubois.net>)
	id 1a2P65-0005Rb-J6; Fri, 27 Nov 2015 14:54:21 -0500
Received: from localhost (localhost [127.0.0.1])
	by zose-mta05.web4all.fr (Postfix) with ESMTP id 07F9040864;
	Fri, 27 Nov 2015 20:54:20 +0100 (CET)
Received: from zose-mta05.web4all.fr ([127.0.0.1])
	by localhost (zose-mta05.web4all.fr [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id sv-aBFjtRZFf; Fri, 27 Nov 2015 20:54:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zose-mta05.web4all.fr (Postfix) with ESMTP id 4085140885;
	Fri, 27 Nov 2015 20:54:19 +0100 (CET)
X-Virus-Scanned: amavisd-new at zose-mta-05.w4a.fr
Received: from zose-mta05.web4all.fr ([127.0.0.1])
	by localhost (zose-mta05.web4all.fr [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id x643WJQDIQln; Fri, 27 Nov 2015 20:54:19 +0100 (CET)
Received: from [192.168.1.128] (smm49-1-78-235-240-156.fbx.proxad.net
	[78.235.240.156])
	by zose-mta05.web4all.fr (Postfix) with ESMTPSA id C8C4040864;
	Fri, 27 Nov 2015 20:54:18 +0100 (CET)
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
References: <cover.1448521064.git.jcd@tribudubois.net>
	<d53f34e3cf05dde424b6eab7d51cef6f244ef80a.1448521065.git.jcd@tribudubois.net>
	<CAPokK=pUqOnccS-jSqm6ai4iG5v4+Zr+F-LyJwCGZQv-BjkPpQ@mail.gmail.com>
From: Jean-Christophe DUBOIS <jcd@tribudubois.net>
Message-ID: <5658B4EA.8070005@tribudubois.net>
Date: Fri, 27 Nov 2015 20:54:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CAPokK=pUqOnccS-jSqm6ai4iG5v4+Zr+F-LyJwCGZQv-BjkPpQ@mail.gmail.com>
Content-Type: multipart/alternative;
	boundary="------------080701030101010109020801"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 185.49.20.50
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH v4 3/3] i.MX: Add an i.MX25 specific CCM
	class/instance.
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: q9T6a9zEsmXx

This is a multi-part message in MIME format.
--------------080701030101010109020801
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Le 27/11/2015 03:39, Peter Crosthwaite a =C3=A9crit :
> On Wed, Nov 25, 2015 at 11:16 PM, Jean-Christophe Dubois
> <jcd@tribudubois.net> wrote:
>> Signed-off-by: Jean-Christophe Dubois <jcd@tribudubois.net>
> This seems to slow down boot performance for i.MX25 Linux. Admittedly,
> the issue looks to be in timeout code for an unmodelled periph (NAND):
>
> ------------[ cut here ]------------
> WARNING: CPU: 0 PID: 1 at
> /home/pcrost/poky/build/tmp/work-shared/qemuarmv5imx/kernel-source/driv=
ers/mtd/nand/mxc_nand.c:464
> wait_op_done+0xf0/0x114()
> timeout! useirq=3D0
> Modules linked in:
> CPU: 0 PID: 1 Comm: swapper Not tainted 4.2.1 #1
> Hardware name: Freescale i.MX25 (Device Tree Support)
> [<c000eec8>] (unwind_backtrace) from [<c000d2b0>] (show_stack+0x10/0x14=
)
> [<c000d2b0>] (show_stack) from [<c0019154>] (warn_slowpath_common+0x74/=
0xac)
> [<c0019154>] (warn_slowpath_common) from [<c00191bc>]
> (warn_slowpath_fmt+0x30/0x40)
> [<c00191bc>] (warn_slowpath_fmt) from [<c036eaa0>] (wait_op_done+0xf0/0=
x114)
> [<c036eaa0>] (wait_op_done) from [<c0369698>] (nand_scan_ident+0xdc/0x1=
560)
> [<c0369698>] (nand_scan_ident) from [<c036e6a8>] (mxcnd_probe+0x378/0x5=
c0)
> [<c036e6a8>] (mxcnd_probe) from [<c03081a4>] (platform_drv_probe+0x44/0=
xac)
> [<c03081a4>] (platform_drv_probe) from [<c0306654>]
> (driver_probe_device+0x180/0x2c4)
> [<c0306654>] (driver_probe_device) from [<c0306824>] (__driver_attach+0=
x8c/0x90)
> [<c0306824>] (__driver_attach) from [<c0304a80>] (bus_for_each_dev+0x70=
/0xa0)
> [<c0304a80>] (bus_for_each_dev) from [<c0305d08>] (bus_add_driver+0x188=
/0x210)
> [<c0305d08>] (bus_add_driver) from [<c03071d4>] (driver_register+0x78/0=
xf8)
> [<c03071d4>] (driver_register) from [<c00095e0>] (do_one_initcall+0x84/=
0x1f0)
> [<c00095e0>] (do_one_initcall) from [<c071bd24>]
> (kernel_init_freeable+0x108/0x1c8)
> [<c071bd24>] (kernel_init_freeable) from [<c0541a0c>] (kernel_init+0x8/=
0xec)
> [<c0541a0c>] (kernel_init) from [<c000a340>] (ret_from_fork+0x14/0x34)
> ---[ end trace 13248cb1a1bbcb9c ]---
>
> <<Delay happens here>>
>
> nand: No NAND device found
> ...
>
> Without this patch, the delay is around 2 seconds, with this patch it
> is 10+. Any idea what would cause it? Are you removing the NAND from
> DTS for your testing and do we not care about these errors paths?
>
> Regards,
> Peter
The kernel I am testing with is 3.19.0 but without without DTS tree.

    Linux version 3.19.0 (jcd@jcd-U31SG) (gcc version 4.6.3 (GCC) ) #2
    Mon Jun 22 00:32:04 CEST 2015

So I am not up to date on this side and I might not test the same=20
devices as you do as I generated a "minimal" kernel for my test.

Anyway, testing the timer code I found that running "sleep 60" on both=20
PTF doesn't give the expected 60 seconds in "real world time":

  * On i.MX31 (using i.MX31 CCM) =3D> 47 seconds
  * On i.MX25 (using i.MX31 CCM) =3D> 52 seconds (before change. close
    enough?)
  * On i.MX25 (using i.MX25 CCM) =3D> 80 seconds

Another indication, the bogomips:

  * On i.MX31 (using i.MX31 CCM) =3D> 78
  * On i.MX25 (using i.MX31 CCM) =3D> 87 (before change. close enough?)
  * On i.MX25 (using i.MX25 CCM) =3D> 133

So, yes, for some reason "time goes slower" after switching to i.MX25=20
CCM ... (but it was also going too fast before with i.MX31 CCM)

As the CCM doesn't really provide any clock (just a clock value)=20
something must not be right in the way the i.MX GPT timer is computing ti=
me.

I need to look after this.

JC
>
>> ---
>>
>> Changes since v1:
>>   * rework loging to match other i.MX drivers
>>
>> Changes since v2:
>>   * We moved to an inheritance QOM scheme
>>
>> Changes since v3:
>>   * Rework logging based on comments.
>>
>>   hw/arm/fsl-imx25.c          |   2 +-
>>   hw/misc/Makefile.objs       |   1 +
>>   hw/misc/imx25_ccm.c         | 276 ++++++++++++++++++++++++++++++++++=
++++++++++
>>   include/hw/arm/fsl-imx25.h  |   4 +-
>>   include/hw/misc/imx25_ccm.h |  59 ++++++++++
>>   5 files changed, 339 insertions(+), 3 deletions(-)
>>   create mode 100644 hw/misc/imx25_ccm.c
>>   create mode 100644 include/hw/misc/imx25_ccm.h
>>


--------------080701030101010109020801
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta content=3D"text/html; charset=3Dutf-8" http-equiv=3D"Content-Ty=
pe">
  </head>
  <body bgcolor=3D"#FFFFFF" text=3D"#000000">
    <div class=3D"moz-cite-prefix">Le 27/11/2015 03:39, Peter Crosthwaite
      a =C3=A9crit=C2=A0:<br>
    </div>
    <blockquote
cite=3D"mid:CAPokK=3DpUqOnccS-jSqm6ai4iG5v4+Zr+F-LyJwCGZQv-BjkPpQ@mail.gm=
ail.com"
      type=3D"cite">
      <pre wrap=3D"">On Wed, Nov 25, 2015 at 11:16 PM, Jean-Christophe Du=
bois
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:jcd@tribudubois.net">&l=
t;jcd@tribudubois.net&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"">Signed-off-by: Jean-Christophe Dubois <a class=3D"=
moz-txt-link-rfc2396E" href=3D"mailto:jcd@tribudubois.net">&lt;jcd@tribud=
ubois.net&gt;</a>
</pre>
      </blockquote>
      <pre wrap=3D"">
This seems to slow down boot performance for i.MX25 Linux. Admittedly,
the issue looks to be in timeout code for an unmodelled periph (NAND):

------------[ cut here ]------------
WARNING: CPU: 0 PID: 1 at
/home/pcrost/poky/build/tmp/work-shared/qemuarmv5imx/kernel-source/driver=
s/mtd/nand/mxc_nand.c:464
wait_op_done+0xf0/0x114()
timeout! useirq=3D0
Modules linked in:
CPU: 0 PID: 1 Comm: swapper Not tainted 4.2.1 #1
Hardware name: Freescale i.MX25 (Device Tree Support)
[&lt;c000eec8&gt;] (unwind_backtrace) from [&lt;c000d2b0&gt;] (show_stack=
+0x10/0x14)
[&lt;c000d2b0&gt;] (show_stack) from [&lt;c0019154&gt;] (warn_slowpath_co=
mmon+0x74/0xac)
[&lt;c0019154&gt;] (warn_slowpath_common) from [&lt;c00191bc&gt;]
(warn_slowpath_fmt+0x30/0x40)
[&lt;c00191bc&gt;] (warn_slowpath_fmt) from [&lt;c036eaa0&gt;] (wait_op_d=
one+0xf0/0x114)
[&lt;c036eaa0&gt;] (wait_op_done) from [&lt;c0369698&gt;] (nand_scan_iden=
t+0xdc/0x1560)
[&lt;c0369698&gt;] (nand_scan_ident) from [&lt;c036e6a8&gt;] (mxcnd_probe=
+0x378/0x5c0)
[&lt;c036e6a8&gt;] (mxcnd_probe) from [&lt;c03081a4&gt;] (platform_drv_pr=
obe+0x44/0xac)
[&lt;c03081a4&gt;] (platform_drv_probe) from [&lt;c0306654&gt;]
(driver_probe_device+0x180/0x2c4)
[&lt;c0306654&gt;] (driver_probe_device) from [&lt;c0306824&gt;] (__drive=
r_attach+0x8c/0x90)
[&lt;c0306824&gt;] (__driver_attach) from [&lt;c0304a80&gt;] (bus_for_eac=
h_dev+0x70/0xa0)
[&lt;c0304a80&gt;] (bus_for_each_dev) from [&lt;c0305d08&gt;] (bus_add_dr=
iver+0x188/0x210)
[&lt;c0305d08&gt;] (bus_add_driver) from [&lt;c03071d4&gt;] (driver_regis=
ter+0x78/0xf8)
[&lt;c03071d4&gt;] (driver_register) from [&lt;c00095e0&gt;] (do_one_init=
call+0x84/0x1f0)
[&lt;c00095e0&gt;] (do_one_initcall) from [&lt;c071bd24&gt;]
(kernel_init_freeable+0x108/0x1c8)
[&lt;c071bd24&gt;] (kernel_init_freeable) from [&lt;c0541a0c&gt;] (kernel=
_init+0x8/0xec)
[&lt;c0541a0c&gt;] (kernel_init) from [&lt;c000a340&gt;] (ret_from_fork+0=
x14/0x34)
---[ end trace 13248cb1a1bbcb9c ]---

&lt;&lt;Delay happens here&gt;&gt;

nand: No NAND device found
...

Without this patch, the delay is around 2 seconds, with this patch it
is 10+. Any idea what would cause it? Are you removing the NAND from
DTS for your testing and do we not care about these errors paths?

Regards,
Peter
</pre>
    </blockquote>
    The kernel I am testing with is 3.19.0 but without without DTS tree.<=
br>
    <blockquote>Linux version 3.19.0 (jcd@jcd-U31SG) (gcc version 4.6.3
      (GCC) ) #2 Mon Jun 22 00:32:04 CEST 2015<br>
    </blockquote>
    So I am not up to date on this side and I might not test the same
    devices as you do as I generated a "minimal" kernel for my test.<br>
    <br>
    Anyway, testing the timer code I found that running "sleep 60" on
    both PTF doesn't give the expected 60 seconds in "real world time":<b=
r>
    <ul>
      <li>On i.MX31 (using i.MX31 CCM) =3D&gt; 47 seconds</li>
      <li>On i.MX25 (using i.MX31 CCM) =3D&gt; 52 seconds (before change.
        close enough?)<br>
      </li>
      <li>On i.MX25 (using i.MX25 CCM) =3D&gt; 80 seconds</li>
    </ul>
    <p>Another indication, the bogomips:<br>
    </p>
    <ul>
      <li>On i.MX31 (using i.MX31 CCM) =3D&gt; 78</li>
      <li>On i.MX25 (using i.MX31 CCM) =3D&gt; 87 (before change. close
        enough?) </li>
      <li>On i.MX25 (using i.MX25 CCM) =3D&gt; 133</li>
    </ul>
    <p>So, yes, for some reason "time goes slower" after switching to
      i.MX25 CCM ... (but it was also going too fast before with i.MX31
      CCM)<br>
    </p>
    <p>As the CCM doesn't really provide any clock (just a clock value)
      something must not be right in the way the i.MX GPT timer is
      computing time.<br>
    </p>
    <p>I need to look after this.<br>
    </p>
    JC
    <blockquote
cite=3D"mid:CAPokK=3DpUqOnccS-jSqm6ai4iG5v4+Zr+F-LyJwCGZQv-BjkPpQ@mail.gm=
ail.com"
      type=3D"cite">
      <pre wrap=3D"">

</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"">---

Changes since v1:
 * rework loging to match other i.MX drivers

Changes since v2:
 * We moved to an inheritance QOM scheme

Changes since v3:
 * Rework logging based on comments.

 hw/arm/fsl-imx25.c          |   2 +-
 hw/misc/Makefile.objs       |   1 +
 hw/misc/imx25_ccm.c         | 276 ++++++++++++++++++++++++++++++++++++++=
++++++
 include/hw/arm/fsl-imx25.h  |   4 +-
 include/hw/misc/imx25_ccm.h |  59 ++++++++++
 5 files changed, 339 insertions(+), 3 deletions(-)
 create mode 100644 hw/misc/imx25_ccm.c
 create mode 100644 include/hw/misc/imx25_ccm.h

</pre>
      </blockquote>
      <pre wrap=3D"">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------080701030101010109020801--
