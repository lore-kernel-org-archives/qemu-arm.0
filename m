Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp4101284lfp;
        Mon, 3 Feb 2020 07:49:04 -0800 (PST)
X-Google-Smtp-Source: APXvYqxPRURjwLwBKhvsz/bk3AIA1cKU49VDF0T683mx8a9RvuYUqaUyH09gu8Snk3XZBQ4DJN9g
X-Received: by 2002:a0c:f68f:: with SMTP id p15mr22752048qvn.79.1580744944086;
        Mon, 03 Feb 2020 07:49:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580744944; cv=none;
        d=google.com; s=arc-20160816;
        b=a/XBG4dol36Jn7wPGfH86kGe2rcTg/VnuHc4s4gin8xWtPieqJ8ckTdyRHuVjusy/s
         wy74rMi51+P0vogb3djZVGEp7G4q3BTXhn4QBeNrHHYrsYI8Lzjlrx6B7m5nDYyMGXyX
         KDgdF199Nmi44ZiG+dP6LqJYMJC3ETPItQifcw/KcwRIE7bFKHpfDx35Oj0wfmuPJHj3
         yJbymRWoBiAtMFkrtDImY5Yf8/B1qEgxDpyPIypixjXVCAEpaYt0lWwI9A+fJ8YCas8f
         YdQqhdteWeyf4YnVwXuo8WvhjUPukcm9IiqTU/f/WqCxx1nZDX7iyMHJE8E+7tZRjlHO
         tvxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=Eph97qwVHR8y0FI33RQVTM4RhESN6Ec/Xdr0q609z98=;
        b=xIiOwacK4IYwd02DfItqLDoV8E9Ogt1e+scBPCqU9UlIWVfwyfsh965gAJisgIQ7fi
         ShT4LYhOzRCpyS8fpHF8tXXHB2oAVjnyMUCwrdDF7++LrFl/UgpelZDA7PTLCOpKuTME
         y6XobnMPhB6/amRDRzaRCKbcUuzvQoEoTLVAli/BZ9QRiO115U4DqKJJ2TI0OwS+Y67B
         IN7H7OU64AkX+PoH17QldyWfnx2frNh1Ry2GdHjuzc8+j22eX5SKGqtn69U4Cq/Z3YoV
         lTOF2YuOLr3c0nDdGxKKm5NDYMZwijxCQt7dF7E0eXRlKiyIM2MeNJaiHVNJYd4Dz5EC
         MgYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=VcXVWzm7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t9si12267452qvp.112.2020.02.03.07.49.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Feb 2020 07:49:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=VcXVWzm7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iydyA-0001qa-Dk
	for alex.bennee@linaro.org; Mon, 03 Feb 2020 10:49:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35560)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ehabkost@redhat.com>) id 1iydxw-0001lD-AR
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 10:48:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1iydxu-0006bE-DC
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 10:48:48 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:35624
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1iydxu-0006Zr-9a
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 10:48:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580744926;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Eph97qwVHR8y0FI33RQVTM4RhESN6Ec/Xdr0q609z98=;
 b=VcXVWzm7Z9FirNRF0QJmQD+7PafO1D5zvcnccVwgJzS821XmVCWIP/xuKixvzfWsFTQjjm
 QsJ4n7DfNeE179HzX5BQypeDsNJ5OdT/cF1Ol6hO5ul9aGPJyGItKBPEcE3QaP2cSRcRZO
 4WDRqdRboAnl6cLnMO0kkn0pSFRxA3M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-267-AvE9usFmNR2w4Q_h0hlZbQ-1; Mon, 03 Feb 2020 10:48:32 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4820F107BA98;
 Mon,  3 Feb 2020 15:48:31 +0000 (UTC)
Received: from localhost (unused-10-15-17-6.yyz.redhat.com [10.15.17.6])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 475F6100194E;
 Mon,  3 Feb 2020 15:48:25 +0000 (UTC)
Date: Mon, 3 Feb 2020 10:48:25 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: Re: [PATCH 1/1] tests/acceptance: Count Raspberry Pi logos displayed
 on framebuffer
Message-ID: <20200203154825.GY25446@habkost.net>
References: <20200131232436.23548-1-f4bug@amsat.org>
 <20200131232436.23548-2-f4bug@amsat.org>
 <ad5d50ff-acc8-247f-74d9-7854605baaca@redhat.com>
MIME-Version: 1.0
In-Reply-To: <ad5d50ff-acc8-247f-74d9-7854605baaca@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: AvE9usFmNR2w4Q_h0hlZbQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yDK/My5QFhQe

On Mon, Feb 03, 2020 at 12:21:53PM -0200, Wainer dos Santos Moschetta wrote=
:
>=20
> On 1/31/20 9:24 PM, Philippe Mathieu-Daud=E9 wrote:
> > Add a test that verifies that each core properly displays the
> > Raspberry Pi logo on the framebuffer device.
> >=20
> > We simply follow the OpenCV "Template Matching with Multiple Objects"
> > tutorial, replacing Lionel Messi by a raspberrry:
> > https://docs.opencv.org/4.2.0/d4/dc6/tutorial_py_template_matching.html
> >=20
> > When OpenCV and NumPy are installed, this test can be run using:
> >=20
> >    $ avocado --show=3Dapp,framebuffer run -t device:bcm2835-fb tests/ac=
ceptance/
> >    JOB ID     : 9bbbc54c0a6fa180348d0b5305507f76852b4da2
> >    JOB LOG    : avocado/job-results/job-2020-01-31T23.48-9bbbc54/job.lo=
g
> >     (1/1) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_=
arm_raspi2_framebuffer_logo:
> >    framebuffer: found raspberry at position (x, y) =3D (0, 0)
> >    framebuffer: found raspberry at position (x, y) =3D (71, 0)
> >    framebuffer: found raspberry at position (x, y) =3D (142, 0)
> >    framebuffer: found raspberry at position (x, y) =3D (213, 0)
> >    PASS (11.06 s)
> >    RESULTS    : PASS 1 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT=
 0 | CANCEL 0
> >    JOB TIME   : 11.39 s
> >=20
> > Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
> > ---
> > The resulting match can be visualised at https://pasteboard.co/ISzNHtx.=
png
> > ---
> >   tests/acceptance/boot_linux_console.py | 62 +++++++++++++++++++++++++=
+
> >   1 file changed, 62 insertions(+)
> >=20
> > diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/=
boot_linux_console.py
> > index e40b84651b..4e69a83a12 100644
> > --- a/tests/acceptance/boot_linux_console.py
> > +++ b/tests/acceptance/boot_linux_console.py
> > @@ -12,6 +12,7 @@ import os
> >   import lzma
> >   import gzip
> >   import shutil
> > +import logging
> >   from avocado import skipUnless
> >   from avocado_qemu import Test
> > @@ -21,6 +22,19 @@ from avocado.utils import process
> >   from avocado.utils import archive
> > +NUMPY_AVAILABLE =3D True
> > +try:
> > +    import numpy as np
> > +except ImportError:
> > +    NUMPY_AVAILABLE =3D False
> > +
> > +CV2_AVAILABLE =3D True
> > +try:
> > +    import cv2
> > +except ImportError:
> > +    CV2_AVAILABLE =3D False
> > +
> > +
>=20
>=20
> Those Python packages are only needed by this new test case, and the test=
 is
> likely to be moved to a separate file soon. So I suggest to put those
> availability checks inside the test method, so easing the future removal.
> And use self.cancel() to cancel the test (if the case).
>=20
>=20
> >   class BootLinuxConsole(Test):
> >       """
> >       Boots a Linux kernel and checks that the console is operational a=
nd the
> > @@ -360,6 +374,54 @@ class BootLinuxConsole(Test):
> >           """
> >           self.do_test_arm_raspi2(0)
> > +    @skipUnless(NUMPY_AVAILABLE, 'Python NumPy not installed')
> > +    @skipUnless(CV2_AVAILABLE, 'Python OpenCV not installed')
> > +    def test_arm_raspi2_framebuffer_logo(self):
> > +        """
> > +        :avocado: tags=3Darch:arm
> > +        :avocado: tags=3Dmachine:raspi2
> > +        :avocado: tags=3Ddevice:bcm2835-fb
> > +        """
> > +        screendump_path =3D os.path.join(self.workdir, 'screendump.pbm=
')
> > +        rpilogo_url =3D ('https://github.com/raspberrypi/linux/raw/'
> > +                       'raspberrypi-kernel_1.20190517-1/'
> > +                       'drivers/video/logo/logo_linux_clut224.ppm')
> > +        rpilogo_hash =3D 'fff3cc20c6030acce0953147f9baac43f44ed6b0'
> > +        rpilogo_path =3D self.fetch_asset(rpilogo_url, asset_hash=3Drp=
ilogo_hash)
> > +        deb_url =3D ('http://archive.raspberrypi.org/debian/'
> > +                   'pool/main/r/raspberrypi-firmware/'
> > +                   'raspberrypi-kernel_1.20190215-1_armhf.deb')
> > +        deb_hash =3D 'cd284220b32128c5084037553db3c482426f3972'
> > +        deb_path =3D self.fetch_asset(deb_url, asset_hash=3Ddeb_hash)
> > +        kernel_path =3D self.extract_from_deb(deb_path, '/boot/kernel7=
.img')
> > +        dtb_path =3D self.extract_from_deb(deb_path, '/boot/bcm2709-rp=
i-2-b.dtb')
> > +
> > +        self.vm.set_console()
> > +        kernel_command_line =3D (self.KERNEL_COMMON_COMMAND_LINE +
> > +                               'earlycon=3Dpl011,0x3f201000 console=3D=
ttyAMA0')
> > +        self.vm.add_args('-kernel', kernel_path,
> > +                         '-dtb', dtb_path,
> > +                         '-append', kernel_command_line)
> > +        self.vm.launch()
> > +        framebuffer_ready =3D 'Console: switching to colour frame buff=
er device'
> > +        wait_for_console_pattern(self, framebuffer_ready)
> > +        self.vm.command('human-monitor-command', command_line=3D'stop'=
)
> > +        self.vm.command('human-monitor-command',
> > +                        command_line=3D'screendump %s' % screendump_pa=
th)
> > +        logger =3D logging.getLogger('framebuffer')
> > +
> > +        cpu_cores_count =3D 4
>=20
>=20
> Won't this fail if host cpu cores are less than 4?

The number of cores in the host shouldn't matter.  raspi2 has
min_cpus =3D max_cpus =3D BCM283X_NCPUS =3D 4.

--=20
Eduardo

