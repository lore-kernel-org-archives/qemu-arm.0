Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp5185349lff;
        Sat, 21 Dec 2019 10:23:53 -0800 (PST)
X-Google-Smtp-Source: APXvYqzDF/SS9lzJnzBCh/boJFTxRCo1Ttu+ByjKTbaVJykDk6NPc/aotkHyPSRMtr9tBwDj7ex5
X-Received: by 2002:ad4:51cc:: with SMTP id p12mr17147106qvq.113.1576952633485;
        Sat, 21 Dec 2019 10:23:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576952633; cv=none;
        d=google.com; s=arc-20160816;
        b=rEH4I2JdBsykgtC/xoBVw/AM0yVRnNtzX1p5E+929p2rGTy8A32alTUOqswVoik/NM
         x94pS6FAcQ9mCco85SRmbPr5pJYADi0hWJRvc6QR6zb9P8+5+1b7lDP9eL0jqFpvfxFL
         63JyxMg3vSpcp6HEw+Io8Ck7B0D0tEQW5RBqVipSWoZTT5Wbma/QGPCzFbwcg4QHqLAX
         vDmnicxyEsuG0S463Fsw59jTnLxhEhol/8GCQjapNunmdOveLSP8KYOVQlpluzrn9Rvp
         JLtBChjuGCrNmPxn+ZVb0GFGFs3mGEp/cN8LzOBryIdY9eDDTcZUkvVogOVhpOel5oIp
         Vp+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZLCFWTYU9xOMO++Bg3cHTj2xEbQKJXfwi0dTYdgU4sw=;
        b=JXvExvl0qCzIn1JRUUeY22zFjskU1oIdL+QRl3j84khbJaltHwQbYSb2P+u6LRyxoB
         4A/9Iab61hbwgb7Ghh+XiI9/6PTitkRixBRQD4QQsiFcna2xVT2+4HQscZBuVp8cmsQ/
         jV8UBbxpZPgSoFtxHtzGEVAG1+1DDEI74TMWpJDQzYuPHNF5+6xN0pPtTwg6emCLnkQE
         g5hlaroywVUEMJ+tEblsS5uEtzOJIzuWrl10FgX/aXWscu1SwaADxV0/pi35RYvwwA5p
         J6MoJR07xuCmGGUVCGwTNNt/gciEaM3vcMYI2xRSU5cPapSp9+0TVQIov9HmMNFzAp5p
         E8Ng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=D0Rki1Pv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n12si6548410qvl.43.2019.12.21.10.23.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 21 Dec 2019 10:23:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=D0Rki1Pv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iijPs-0004xI-Sa
	for alex.bennee@linaro.org; Sat, 21 Dec 2019 13:23:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53014)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <nieklinnenbank@gmail.com>) id 1iijOv-000449-5u
 for qemu-devel@nongnu.org; Sat, 21 Dec 2019 13:22:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <nieklinnenbank@gmail.com>) id 1iijOt-0005kN-5q
 for qemu-devel@nongnu.org; Sat, 21 Dec 2019 13:22:52 -0500
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141]:40593)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <nieklinnenbank@gmail.com>)
 id 1iijOs-0005gh-TC; Sat, 21 Dec 2019 13:22:51 -0500
Received: by mail-il1-x141.google.com with SMTP id c4so10822963ilo.7;
 Sat, 21 Dec 2019 10:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZLCFWTYU9xOMO++Bg3cHTj2xEbQKJXfwi0dTYdgU4sw=;
 b=D0Rki1Pvmo/C3zY+q5P99TxRAfzWtGptRkGD/giuD0wG5JVn+DTXb4HchyYTJgbJ5B
 iCcGHwrBXrKeXP+Krw/liYEB2qhS1N+zYXCDiqubRp5XT78AhyzA549AA3B2Plc+iSqx
 t1KZXliCtn/rl+TvGiqwzL3gEo6RhCcprMvQs+RMuJ/zHGLVduub/ff+y2A5RnNelF1t
 pbXmIaRbUGLcRgG4TeSkice/6AAu+tT4cauleS6tZ8VtNBeUsLivlG7yiMu0YAtCdEvL
 xg61sld5oLNIMfZ3BDNeLSuVQvLWNped2uLWxrUse+P/lV+YX6CgJeMQ2nXHnIuWdpHt
 ei1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZLCFWTYU9xOMO++Bg3cHTj2xEbQKJXfwi0dTYdgU4sw=;
 b=E8x19HAnkFttnXnFm+66wXq3Kj9WcHWU7I1YtMyHc/ckCydt6tO0hGj/z/fahpnHls
 VbnHufPJ7TcUgM0n+Oi5NSH9HME8cMHNwZ/TUw4GDsfkVVcX1+BYx3Itv3eQ0GJDz5b5
 IZTnW++AY+Zs/v2a89vredRnMZGT28UXJUcSckaHljaLZBfhvsg+/3OedTe265Z04IZG
 eu1kHZKD3X6p4B0/lfi/++RC3pYQkvOsod62ECrmWSE73wrSz1bg09mp2CAoMCuBeVsG
 jkE1/pF+93FMnvyH8+jirP5bSr/cOtpfusTEpOJA/cXjXC/zXd0p+CfSNNfMZd3/3DB4
 ykMg==
X-Gm-Message-State: APjAAAVQhEWmfVL1pwoBkuXT6R72cCt2qpW7i4plm/slhOyGTlPiXUaJ
 j511IxXRnYZF8mMXf/hY1Ld3BI1DaPh5Wv1JZ8w=
X-Received: by 2002:a92:af08:: with SMTP id n8mr17618555ili.217.1576952569890; 
 Sat, 21 Dec 2019 10:22:49 -0800 (PST)
MIME-Version: 1.0
References: <20191217182730.943-1-f4bug@amsat.org>
 <20191217182730.943-2-f4bug@amsat.org>
In-Reply-To: <20191217182730.943-2-f4bug@amsat.org>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Sat, 21 Dec 2019 19:22:38 +0100
Message-ID: <CAPan3Wp2=uRUNsQkZsdfLw7iYs8p6OSJw9ULLggw=2efHg4dpQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] tests/boot_linux_console: Add a quick test for the
 OrangePi PC board
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="000000000000c18efa059a3ae11e"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::141
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Guenter Roeck <linux@roeck-us.net>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OuMKLSETdfCG

--000000000000c18efa059a3ae11e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Philippe,

On Tue, Dec 17, 2019 at 7:27 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g>
wrote:

> This test boots a Linux kernel on a OrangePi PC board and verify
> the serial output is working.
>
> The kernel image and DeviceTree blob are built by the Raspbian
> project (based on Debian):
> https://www.raspbian.org/RaspbianImages


One minor remark: I noticed here you refer to Raspbian, while the actual
image
used is from Armbian :-)


>
> If ARM is a target being built, "make check-acceptance" will
> automatically include this test by the use of the "arch:arm" tags.
>
> Alternatively, this test can be run using:
>
>   $ make check-venv
>   $ ./tests/venv/bin/avocado --show=3Dconsole,app run -t machine:orangepi=
-pc
> tests/acceptance/boot_linux_console.py
>   JOB ID     : 2e4d15eceb13c33672af406f08171e6e9de1414a
>   JOB LOG    : ~/job-results/job-2019-12-17T05.46-2e4d15e/job.log
>   (1/1)
> tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi=
:
>   console: Uncompressing Linux... done, booting the kernel.
>   console: Booting Linux on physical CPU 0x0
>   console: Linux version 4.20.7-sunxi (root@armbian.com) (gcc version
> 7.2.1 20171011 (Linaro GCC 7.2-2017.11)) #5.75 SMP Fri Feb 8 09:02:10 CET
> 2019
>   console: CPU: ARMv7 Processor [410fc075] revision 5 (ARMv7), cr=3D50c53=
87d
>   console: CPU: div instructions available: patching division code
>   console: CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing
> instruction cache
>   console: OF: fdt: Machine model: Xunlong Orange Pi PC
>   console: Memory policy: Data cache writealloc
>   console: OF: reserved mem: failed to allocate memory for node
> 'cma@4a000000'
>   console: cma: Failed to reserve 128 MiB
>   console: psci: probing for conduit method from DT.
>   console: psci: PSCIv0.2 detected in firmware.
>   console: psci: Using standard PSCI v0.2 function IDs
>   console: psci: Trusted OS migration not required
>   console: random: get_random_bytes called from start_kernel+0x8d/0x3c2
> with crng_init=3D0
>   console: percpu: Embedded 18 pages/cpu @(ptrval) s41228 r8192 d24308
> u73728
>   console: Built 1 zonelists, mobility grouping on.  Total pages: 32480
>   console: Kernel command line: printk.time=3D0 console=3DttyS0,115200
>   PASS (8.59 s)
>   JOB TIME   : 8.81 s
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  tests/acceptance/boot_linux_console.py | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>
> diff --git a/tests/acceptance/boot_linux_console.py
> b/tests/acceptance/boot_linux_console.py
> index 7e41cebd47..820239e439 100644
> --- a/tests/acceptance/boot_linux_console.py
> +++ b/tests/acceptance/boot_linux_console.py
> @@ -411,6 +411,32 @@ class BootLinuxConsole(Test):
>          self.wait_for_console_pattern('Boot successful.')
>          # TODO user command, for now the uart is stuck
>
> +    def test_arm_orangepi(self):
> +        """
> +        :avocado: tags=3Darch:arm
> +        :avocado: tags=3Dmachine:orangepi-pc
> +        """
> +        deb_url =3D ('https://apt.armbian.com/pool/main/l/'
> +
>  'linux-4.20.7-sunxi/linux-image-dev-sunxi_5.75_armhf.deb')
> +        deb_hash =3D '1334c29c44d984ffa05ed10de8c3361f33d78315'
> +        deb_path =3D self.fetch_asset(deb_url, asset_hash=3Ddeb_hash)
> +        kernel_path =3D self.extract_from_deb(deb_path,
> +                                            '/boot/vmlinuz-4.20.7-sunxi'=
)
> +        dtb_path =3D
> '/usr/lib/linux-image-dev-sunxi/sun8i-h3-orangepi-pc.dtb'
> +        dtb_path =3D self.extract_from_deb(deb_path, dtb_path)
> +
> +        self.vm.set_machine('orangepi-pc')
> +        self.vm.set_console()
> +        kernel_command_line =3D (self.KERNEL_COMMON_COMMAND_LINE +
> +                               'console=3DttyS0,115200n8 '
> +                               'earlycon=3Duart,mmio32,0x1c28000')
> +        self.vm.add_args('-kernel', kernel_path,
> +                         '-dtb', dtb_path,
> +                         '-append', kernel_command_line)
> +        self.vm.launch()
> +        console_pattern =3D 'Kernel command line: %s' % kernel_command_l=
ine
> +        self.wait_for_console_pattern(console_pattern)
> +
>      def test_s390x_s390_ccw_virtio(self):
>          """
>          :avocado: tags=3Darch:s390x
> --
> 2.21.0
>
>

--=20
Niek Linnenbank

--000000000000c18efa059a3ae11e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Philippe,<br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Dec 17, 2019 at 7:27 PM Phili=
ppe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.o=
rg</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">This test boots a Linux kernel on a OrangePi PC board and verify<br>
the serial output is working.<br>
<br>
The kernel image and DeviceTree blob are built by the Raspbian<br>
project (based on Debian):<br>
<a href=3D"https://www.raspbian.org/RaspbianImages" rel=3D"noreferrer" targ=
et=3D"_blank">https://www.raspbian.org/RaspbianImages</a></blockquote><div>=
<br></div><div>One minor remark: I noticed here you refer to Raspbian, whil=
e the actual image</div><div>used is from Armbian :-)<br></div><div> <br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
If ARM is a target being built, &quot;make check-acceptance&quot; will<br>
automatically include this test by the use of the &quot;arch:arm&quot; tags=
.<br>
<br>
Alternatively, this test can be run using:<br>
<br>
=C2=A0 $ make check-venv<br>
=C2=A0 $ ./tests/venv/bin/avocado --show=3Dconsole,app run -t machine:orang=
epi-pc tests/acceptance/boot_linux_console.py<br>
=C2=A0 JOB ID=C2=A0 =C2=A0 =C2=A0: 2e4d15eceb13c33672af406f08171e6e9de1414a=
<br>
=C2=A0 JOB LOG=C2=A0 =C2=A0 : ~/job-results/job-2019-12-17T05.46-2e4d15e/jo=
b.log<br>
=C2=A0 (1/1) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_a=
rm_orangepi:<br>
=C2=A0 console: Uncompressing Linux... done, booting the kernel.<br>
=C2=A0 console: Booting Linux on physical CPU 0x0<br>
=C2=A0 console: Linux version 4.20.7-sunxi (<a href=3D"mailto:root@armbian.=
com" target=3D"_blank">root@armbian.com</a>) (gcc version 7.2.1 20171011 (L=
inaro GCC 7.2-2017.11)) #5.75 SMP Fri Feb 8 09:02:10 CET 2019<br>
=C2=A0 console: CPU: ARMv7 Processor [410fc075] revision 5 (ARMv7), cr=3D50=
c5387d<br>
=C2=A0 console: CPU: div instructions available: patching division code<br>
=C2=A0 console: CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing inst=
ruction cache<br>
=C2=A0 console: OF: fdt: Machine model: Xunlong Orange Pi PC<br>
=C2=A0 console: Memory policy: Data cache writealloc<br>
=C2=A0 console: OF: reserved mem: failed to allocate memory for node &#39;c=
ma@4a000000&#39;<br>
=C2=A0 console: cma: Failed to reserve 128 MiB<br>
=C2=A0 console: psci: probing for conduit method from DT.<br>
=C2=A0 console: psci: PSCIv0.2 detected in firmware.<br>
=C2=A0 console: psci: Using standard PSCI v0.2 function IDs<br>
=C2=A0 console: psci: Trusted OS migration not required<br>
=C2=A0 console: random: get_random_bytes called from start_kernel+0x8d/0x3c=
2 with crng_init=3D0<br>
=C2=A0 console: percpu: Embedded 18 pages/cpu @(ptrval) s41228 r8192 d24308=
 u73728<br>
=C2=A0 console: Built 1 zonelists, mobility grouping on.=C2=A0 Total pages:=
 32480<br>
=C2=A0 console: Kernel command line: printk.time=3D0 console=3DttyS0,115200=
<br>
=C2=A0 PASS (8.59 s)<br>
=C2=A0 JOB TIME=C2=A0 =C2=A0: 8.81 s<br>
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsa=
t.org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
---<br>
=C2=A0tests/acceptance/boot_linux_console.py | 26 +++++++++++++++++++++++++=
+<br>
=C2=A01 file changed, 26 insertions(+)<br>
<br>
diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot=
_linux_console.py<br>
index 7e41cebd47..820239e439 100644<br>
--- a/tests/acceptance/boot_linux_console.py<br>
+++ b/tests/acceptance/boot_linux_console.py<br>
@@ -411,6 +411,32 @@ class BootLinuxConsole(Test):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.wait_for_console_pattern(&#39;Boot s=
uccessful.&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# TODO user command, for now the uart is =
stuck<br>
<br>
+=C2=A0 =C2=A0 def test_arm_orangepi(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 :avocado: tags=3Darch:arm<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 :avocado: tags=3Dmachine:orangepi-pc<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 deb_url =3D (&#39;<a href=3D"https://apt.armbi=
an.com/pool/main/l/" rel=3D"noreferrer" target=3D"_blank">https://apt.armbi=
an.com/pool/main/l/</a>&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;=
linux-4.20.7-sunxi/linux-image-dev-sunxi_5.75_armhf.deb&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 deb_hash =3D &#39;1334c29c44d984ffa05ed10de8c3=
361f33d78315&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 deb_path =3D self.fetch_asset(deb_url, asset_h=
ash=3Ddeb_hash)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_path =3D self.extract_from_deb(deb_path=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &#39;/boot/vmlinuz-4.20.7-sunxi&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dtb_path =3D &#39;/usr/lib/linux-image-dev-sun=
xi/sun8i-h3-orangepi-pc.dtb&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dtb_path =3D self.extract_from_deb(deb_path, d=
tb_path)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.set_machine(&#39;orangepi-pc&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.set_console()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_command_line =3D (self.KERNEL_COMMON_CO=
MMAND_LINE +<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;console=3DttyS0,115200n8 &#39;<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;earlycon=3Duart,mmio32,0x1c28000=
&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.add_args(&#39;-kernel&#39;, kernel_pat=
h,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;-dtb&#39;, dtb_path,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;-append&#39;, kernel_command_line)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.launch()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 console_pattern =3D &#39;Kernel command line: =
%s&#39; % kernel_command_line<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.wait_for_console_pattern(console_pattern)=
<br>
+<br>
=C2=A0 =C2=A0 =C2=A0def test_s390x_s390_ccw_virtio(self):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0:avocado: tags=3Darch:s390x<br>
-- <br>
2.21.0<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><div>Niek Linnenbank<br><br></div></div></=
div></div>

--000000000000c18efa059a3ae11e--
