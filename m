Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp6389396lfp;
        Tue, 18 Feb 2020 10:12:27 -0800 (PST)
X-Google-Smtp-Source: APXvYqyOFKvsSLlC2Gt+Lzq39U81K473D/4jStxho3f6FJ9oId5nURPT/QgUcMCMG5/fnRkEMeat
X-Received: by 2002:ac8:a83:: with SMTP id d3mr18694120qti.228.1582049547798;
        Tue, 18 Feb 2020 10:12:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582049547; cv=none;
        d=google.com; s=arc-20160816;
        b=FVXgU8HTfQ4DGJZAiZbw3h5sclxGbm1yCcy/tSv0YDR5H4mJZPZZCKRMHiJ6sT/99B
         O5PK2mEkJPdUJCc9RerWqJwAU1yqnY1rjwbQ8zOxf5xVNZvR9gH3DdmwMm1FhuqqW265
         SLOKTMu5Lb/Wf75OLHkj7R5v5lxn590UB1DziHFBE2f5W2ymvEvquZYrgJLvGGXNedOP
         z2e/fUGAwL9tPcvee5ElIxjAQ7HU7W74/qjEpH5Ya0ye4rSUNAwbBvRr9B6rnkRwoBOE
         CC+I+Num77DJh6YeuqCSaBSymjt7Ht8d7ZFiwbi0WIzLIEB4Svhi2W1Nj/I/9eh0SuTZ
         HA5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=wML/uJ+u0MDichbvEgerDbC1wySMifI8PwyDwt83/9s=;
        b=RmAzbtwgVqsjTaavc3EqZ7rST3QPH0AqMH5FNm+HPhO+CSRbIFXFh2xRPwpVO1UeG7
         ek83scuhQB8cqhx6p0j6w0tUumQSQNVVp24zVQdOuTjkwUNPlEg7IctRyWXNqoMQzgLY
         idVAiq76CzALgVyu6N68IleO5zlMFj9UBKXyXPoWz2dfeA4e6gMZP2naO6dvWtR6H9ke
         NB4TeLDcWVEt8vq1RrAilHceuFmJXAmgSvmtYBhKGwmlqiDkHd/m0PH5nJpU6BoC5OJ2
         FtcKKQr8HFkBATzvLLhfIU1rrj6O74wIPvOUq6nHX1VvxcKomprJ+8w3+O2A6sAPHa36
         8YLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ULJs8M2G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p1si2249617qkm.148.2020.02.18.10.12.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2020 10:12:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ULJs8M2G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j47MB-0005tE-8a
	for alex.bennee@linaro.org; Tue, 18 Feb 2020 13:12:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33150)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pmathieu@redhat.com>) id 1j47M1-0005sN-Vl
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 13:12:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pmathieu@redhat.com>) id 1j47Ly-0001Ac-P3
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 13:12:16 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:53226
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pmathieu@redhat.com>) id 1j47Ly-00018D-Ga
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 13:12:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582049533;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wML/uJ+u0MDichbvEgerDbC1wySMifI8PwyDwt83/9s=;
 b=ULJs8M2GT64EPmfc/Y8ucf1Yx1aadAEoSMIoTpoon9CwZWJUK7xj7UvN6HWMT+eKv90yeO
 WOuy8NkC5F1xmAcfSsTpgpNkf17PflSdA6R3yXC9a8YRY41wP3q2Ri09nBXlXbdTJMX21u
 7Go6sGSs2ud9PZIdO7o2UClkf5Hkw58=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-VIL9csxGNPyFAFLV-6XZ0Q-1; Tue, 18 Feb 2020 13:12:04 -0500
Received: by mail-wr1-f69.google.com with SMTP id w6so11243938wrm.16
 for <qemu-arm@nongnu.org>; Tue, 18 Feb 2020 10:12:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wML/uJ+u0MDichbvEgerDbC1wySMifI8PwyDwt83/9s=;
 b=Vi9qA2KL5RfW9kOKWbiuYF8DIFMweWEPVwbjcUiAKIiK+LdVS8G+dZzhrE/pUXrtoy
 02RbT2+6NxVfBdWrRAYpo7+h93JfCLsiAPDr9p/dFBHCZxwz0CF1aVqbA1W8YJnrLa4J
 MTXq+LDUhzXWos1pP7quetEtssNVre310zqT3vP2bqJ8UrtfFzPktRoho/ar0pfvYfru
 v5z3rGjftasmRg+ToiwVNc1qub5q4AvVoJfVm29Uinv24Au0aCF/8OnbGVnwtDdcJJa8
 3yMFtwA/dT1hhizI8rSU7HD14XCV1LfjGHZHIDq1NOqLBjvbG91hTnr+cf9AXCkBBg1R
 K/Yg==
X-Gm-Message-State: APjAAAVoX/kEVOYbeTEaKTah5nPXWbVHcq/G8y6Gu3kE0CxI1N1DGRU7
 qnSBpdqOqVnPeGXATK6yI4t1i5xQTzTer/1XPmJV6mS9E06cyozSJ+J9OFQJsZXw42DHHQdG4Sl
 XDj+D/c0j8Z3tMRusHIwOkidl+oaP
X-Received: by 2002:adf:fa50:: with SMTP id y16mr32281954wrr.204.1582049522915; 
 Tue, 18 Feb 2020 10:12:02 -0800 (PST)
X-Received: by 2002:adf:fa50:: with SMTP id y16mr32281902wrr.204.1582049522527; 
 Tue, 18 Feb 2020 10:12:02 -0800 (PST)
MIME-Version: 1.0
References: <20200201204751.17810-1-f4bug@amsat.org>
 <CAL1e-=gLg0tDH8nKtC6W6jrooGbJ=iV=X1KXDBH--cTWOV-Jxg@mail.gmail.com>
In-Reply-To: <CAL1e-=gLg0tDH8nKtC6W6jrooGbJ=iV=X1KXDBH--cTWOV-Jxg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Date: Tue, 18 Feb 2020 19:11:51 +0100
Message-ID: <CAP+75-V__ACHRUWKb=U+B27Z9=FJ7_H6N_NTs=QpyDP59WK5Xw@mail.gmail.com>
Subject: Re: [PATCH] tests/acceptance: Count multiple Tux logos displayed on
 framebuffer
To: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
X-MC-Unique: VIL9csxGNPyFAFLV-6XZ0Q-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Thomas Huth <huth@tuxfamily.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>, Cleber Rosa <crosa@redhat.com>,
 Leon Alrae <leon.alrae@imgtec.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: O7efBum2sJWZ

Hi Aleksandar,

On Tue, Feb 18, 2020 at 7:07 PM Aleksandar Markovic
<aleksandar.m.mail@gmail.com> wrote:
> On Saturday, February 1, 2020, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
>>
>> Add a test that verifies that each core properly displays the Tux
>> logo on the framebuffer device.
>>
>> We simply follow the OpenCV "Template Matching with Multiple Objects"
>> tutorial, replacing Lionel Messi by Tux:
>> https://docs.opencv.org/4.2.0/d4/dc6/tutorial_py_template_matching.html
>>
>> When OpenCV and NumPy are installed, this test can be run using:
>>
>>   $ avocado --show=3Dapp,framebuffer \
>>     run -t cpu:i6400 \
>>     tests/acceptance/machine_mips_malta.py
>>   JOB ID     : 54f3d8efd8674f289b8aa01a87f5d70c5814544c
>>   JOB LOG    : avocado/job-results/job-2020-02-01T20.52-54f3d8e/job.log
>>    (1/3) tests/acceptance/machine_mips_malta.py:MaltaMachineFramebuffer.=
test_mips_malta_i6400_framebuffer_logo_1core:
>>   framebuffer: found Tux at position (x, y) =3D (0, 0)
>>   PASS (3.37 s)
>>    (2/3) tests/acceptance/machine_mips_malta.py:MaltaMachineFramebuffer.=
test_mips_malta_i6400_framebuffer_logo_7cores:
>>   framebuffer: found Tux at position (x, y) =3D (0, 0)
>>   framebuffer: found Tux at position (x, y) =3D (88, 0)
>>   framebuffer: found Tux at position (x, y) =3D (176, 0)
>>   framebuffer: found Tux at position (x, y) =3D (264, 0)
>>   framebuffer: found Tux at position (x, y) =3D (352, 0)
>>   framebuffer: found Tux at position (x, y) =3D (440, 0)
>>   framebuffer: found Tux at position (x, y) =3D (528, 0)
>>   PASS (5.80 s)
>>    (3/3) tests/acceptance/machine_mips_malta.py:MaltaMachineFramebuffer.=
test_mips_malta_i6400_framebuffer_logo_8cores:
>>   framebuffer: found Tux at position (x, y) =3D (0, 0)
>>   framebuffer: found Tux at position (x, y) =3D (88, 0)
>>   framebuffer: found Tux at position (x, y) =3D (176, 0)
>>   framebuffer: found Tux at position (x, y) =3D (264, 0)
>>   framebuffer: found Tux at position (x, y) =3D (352, 0)
>>   framebuffer: found Tux at position (x, y) =3D (440, 0)
>>   framebuffer: found Tux at position (x, y) =3D (528, 0)
>>   framebuffer: found Tux at position (x, y) =3D (616, 0)
>>   PASS (6.67 s)
>>   RESULTS    : PASS 3 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0=
 | CANCEL 0
>>   JOB TIME   : 16.79 s
>>
>> If the AVOCADO_CV2_SCREENDUMP_PNG_PATH environment variable is set, the
>> test will save the screenshot with matched squares to it.
>>
>> Test inspired by the following post:
>> https://www.mips.com/blog/how-to-run-smp-linux-in-qemu-on-a-mips64-relea=
se-6-cpu/
>> Kernel built with the following Docker file:
>> https://github.com/philmd/qemu-testing-blob/blob/malta_i6400/mips/malta/=
mips64el/Dockerfile
>>
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>> ---
>> The resulting match can be visualised at https://pasteboard.co/ISIj6ZA.p=
ng
>> Generated using:
>>
>>   $ AVOCADO_CV2_SCREENDUMP_PNG_PATH=3D/tmp/screendump_matched.png \
>>     avocado --show=3Dapp run -t cpu:i6400 \
>>     tests/acceptance/machine_mips_malta.py
>>   JOB ID     : 54f3d8efd8674f289b8aa01a87f5d70c5814544c
>>   JOB LOG    : avocado/job-results/job-2020-02-01T20.52-54f3d8e/job.log
>>    (1/3) tests/acceptance/machine_mips_malta.py:MaltaMachineFramebuffer.=
test_mips_malta_i6400_framebuffer_logo_1core: PASS (3.37 s)
>>    (2/3) tests/acceptance/machine_mips_malta.py:MaltaMachineFramebuffer.=
test_mips_malta_i6400_framebuffer_logo_7cores: PASS (5.80 s)
>>    (3/3) tests/acceptance/machine_mips_malta.py:MaltaMachineFramebuffer.=
test_mips_malta_i6400_framebuffer_logo_8cores: PASS (6.67 s)
>>   RESULTS    : PASS 3 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0=
 | CANCEL 0
>>   JOB TIME   : 16.79 s
>> ---
>
>
> Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>
>
> I may add this file to yet another section in MAINTAINTERS (main MIPS tar=
get section) (I'll do it while applying, no need to respin), since its impo=
rtance is significant (tests MIPS' smp fearure).

Hmm you mean the "MIPS TCG CPUs"? Yes why not.

>
> Once again, a gorgeous test!

Thanks :)

>
> Aleksandar
>
>>
>>  MAINTAINERS                            |   1 +
>>  tests/acceptance/machine_mips_malta.py | 116 +++++++++++++++++++++++++
>>  2 files changed, 117 insertions(+)
>>  create mode 100644 tests/acceptance/machine_mips_malta.py
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 4ceb1ad882..65a3dfb564 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -983,6 +983,7 @@ F: hw/mips/mips_malta.c
>>  F: hw/mips/gt64xxx_pci.c
>>  F: include/hw/southbridge/piix.h
>>  F: tests/acceptance/linux_ssh_mips_malta.py
>> +F: tests/acceptance/machine_mips_malta.py
>>
>>  Mipssim
>>  M: Aleksandar Markovic <amarkovic@wavecomp.com>
>> diff --git a/tests/acceptance/machine_mips_malta.py b/tests/acceptance/m=
achine_mips_malta.py
>> new file mode 100644
>> index 0000000000..2764143d15
>> --- /dev/null
>> +++ b/tests/acceptance/machine_mips_malta.py
>> @@ -0,0 +1,116 @@
>> +# Functional tests for the MIPS Malta board
>> +#
>> +# Copyright (c) Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>> +#
>> +# This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
>> +# See the COPYING file in the top-level directory.
>> +#
>> +# SPDX-License-Identifier: GPL-2.0-or-later
>> +
>> +import os
>> +import gzip
>> +import logging
>> +
>> +from avocado import skipUnless
>> +from avocado_qemu import Test
>> +from avocado_qemu import wait_for_console_pattern
>> +from avocado.utils import archive
>> +
>> +
>> +NUMPY_AVAILABLE =3D True
>> +try:
>> +    import numpy as np
>> +except ImportError:
>> +    NUMPY_AVAILABLE =3D False
>> +
>> +CV2_AVAILABLE =3D True
>> +try:
>> +    import cv2
>> +except ImportError:
>> +    CV2_AVAILABLE =3D False
>> +
>> +
>> +@skipUnless(NUMPY_AVAILABLE, 'Python NumPy not installed')
>> +@skipUnless(CV2_AVAILABLE, 'Python OpenCV not installed')
>> +class MaltaMachineFramebuffer(Test):
>> +
>> +    timeout =3D 30
>> +
>> +    KERNEL_COMMON_COMMAND_LINE =3D 'printk.time=3D0 '
>> +
>> +    def do_test_i6400_framebuffer_logo(self, cpu_cores_count):
>> +        """
>> +        Boot Linux kernel and check Tux logo is displayed on the frameb=
uffer.
>> +        """
>> +        screendump_path =3D os.path.join(self.workdir, 'screendump.pbm'=
)
>> +
>> +        kernel_url =3D ('https://github.com/philmd/qemu-testing-blob/ra=
w/'
>> +                      'a5966ca4b5/mips/malta/mips64el/'
>> +                      'vmlinux-4.7.0-rc1.I6400.gz')
>> +        kernel_hash =3D '096f50c377ec5072e6a366943324622c312045f6'
>> +        kernel_path_gz =3D self.fetch_asset(kernel_url, asset_hash=3Dke=
rnel_hash)
>> +        kernel_path =3D self.workdir + "vmlinux"
>> +        archive.gzip_uncompress(kernel_path_gz, kernel_path)
>> +
>> +        tuxlogo_url =3D ('https://github.com/torvalds/linux/raw/v2.6.12=
/'
>> +                       'drivers/video/logo/logo_linux_vga16.ppm')
>> +        tuxlogo_hash =3D '3991c2ddbd1ddaecda7601f8aafbcf5b02dc86af'
>> +        tuxlogo_path =3D self.fetch_asset(tuxlogo_url, asset_hash=3Dtux=
logo_hash)
>> +
>> +        self.vm.set_console()
>> +        kernel_command_line =3D (self.KERNEL_COMMON_COMMAND_LINE +
>> +                               'clocksource=3DGIC console=3Dtty0 consol=
e=3DttyS0')
>> +        self.vm.add_args('-kernel', kernel_path,
>> +                         '-cpu', 'I6400',
>> +                         '-smp', '%u' % cpu_cores_count,
>> +                         '-vga', 'std',
>> +                         '-append', kernel_command_line)
>> +        self.vm.launch()
>> +        framebuffer_ready =3D 'Console: switching to colour frame buffe=
r device'
>> +        wait_for_console_pattern(self, framebuffer_ready,
>> +                                 failure_message=3D'Kernel panic - not =
syncing')
>> +        self.vm.command('human-monitor-command', command_line=3D'stop')
>> +        self.vm.command('human-monitor-command',
>> +                        command_line=3D'screendump %s' % screendump_pat=
h)
>> +        logger =3D logging.getLogger('framebuffer')
>> +
>> +        match_threshold =3D 0.95
>> +        screendump_bgr =3D cv2.imread(screendump_path, cv2.IMREAD_COLOR=
)
>> +        tuxlogo_bgr =3D cv2.imread(tuxlogo_path, cv2.IMREAD_COLOR)
>> +        result =3D cv2.matchTemplate(screendump_bgr, tuxlogo_bgr,
>> +                                   cv2.TM_CCOEFF_NORMED)
>> +        loc =3D np.where(result >=3D match_threshold)
>> +        tuxlogo_count =3D 0
>> +        h, w =3D tuxlogo_bgr.shape[:2]
>> +        debug_png =3D os.getenv('AVOCADO_CV2_SCREENDUMP_PNG_PATH')
>> +        for tuxlogo_count, pt in enumerate(zip(*loc[::-1]), start=3D1):
>> +            logger.debug('found Tux at position (x, y) =3D %s', pt)
>> +            cv2.rectangle(screendump_bgr, pt,
>> +                          (pt[0] + w, pt[1] + h), (0, 0, 255), 2)
>> +        if debug_png:
>> +            cv2.imwrite(debug_png, screendump_bgr)
>> +        self.assertGreaterEqual(tuxlogo_count, cpu_cores_count)
>> +
>> +    def test_mips_malta_i6400_framebuffer_logo_1core(self):
>> +        """
>> +        :avocado: tags=3Darch:mips64el
>> +        :avocado: tags=3Dmachine:malta
>> +        :avocado: tags=3Dcpu:i6400
>> +        """
>> +        self.do_test_i6400_framebuffer_logo(1)
>> +
>> +    def test_mips_malta_i6400_framebuffer_logo_7cores(self):
>> +        """
>> +        :avocado: tags=3Darch:mips64el
>> +        :avocado: tags=3Dmachine:malta
>> +        :avocado: tags=3Dcpu:i6400
>> +        """
>> +        self.do_test_i6400_framebuffer_logo(7)
>> +
>> +    def test_mips_malta_i6400_framebuffer_logo_8cores(self):
>> +        """
>> +        :avocado: tags=3Darch:mips64el
>> +        :avocado: tags=3Dmachine:malta
>> +        :avocado: tags=3Dcpu:i6400
>> +        """
>> +        self.do_test_i6400_framebuffer_logo(8)
>> --
>> 2.21.1
>>
>>

