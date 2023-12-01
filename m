Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp907788ejb;
        Fri, 1 Dec 2023 03:27:17 -0800 (PST)
X-Received: by 2002:a05:6870:d60f:b0:1fa:fb10:b46b with SMTP id a15-20020a056870d60f00b001fafb10b46bmr255149oaq.26.1701430037560;
        Fri, 01 Dec 2023 03:27:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701430037; cv=none;
        d=google.com; s=arc-20160816;
        b=C2SrcLJ4nLepCFThzURSN25HoEdqQbutZ7adDdcCUfw4foDY9fGv6qCPXQgCkqKvHB
         exoFUN4sGq6DQMjya4HPASyrPEXUdYo7U6gZ2aHqgRZLZsZc1Cw9NpKv9m/DbC1+DeGD
         Bew5kyJjb36eAYt4M2ekBgVnPKM4GePwNlKfKGnET4yuil6vhua0sZfVpemo5Pb+mFBj
         kUAglfO/xUMG6B4Qmy7PKWWxLKd8lUPJQmI6jyVVwmDS94/x7ZUo6jMcSXjt/fEwfpSC
         dtZU9GDoHOh/A3ZyEqKwkyYxDXC5Qy9CmO/yiIiUrYuceSAAZMVRephfG6GslgF2rtpK
         1BNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=N7G4F+/3DYTV2xUhvsGBYPnyztxOU0n9MgMzRa6wU2s=;
        fh=lxnmunRT89pT1cOX3SSSpN4sdP2YjmpaY1rJpC50mSY=;
        b=tzHQA98o9TAz9WaELPwrgeaAySCpea67HXLKnzxAx2rU0HOfQKCOSZ6UzNfBo8qa9l
         ViShfPzhiA8B7jX/V7CTaC7IM++Mkua3IyDIGZkxB9rwPCnl4GSe4ik5S1kfv96zhZPM
         T/7c5HfoMUNRjx5CvHkttfTdXkIOcwr+mqpvSmYCQ+Y8j9GL1HhEP/mYAQI2EjD+K2tR
         TPJTOitn8pIgdUu/EIDC09kz9wO+j/YwzmfzjL+1QDPVGYcocgM7kyZaRizDRweKfN4T
         ywxGB080RI/3NANwJ+fBMBndXcaVw96BOPngge11s+oHC0p88f+rjBsKFgBSI4MPIiHL
         UAAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=PKwuWEJd;
       spf=pass (google.com: domain of stefanha@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=stefanha@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <stefanha@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id dt6-20020a0568705a8600b001faf2a3c0b1sor259841oab.7.2023.12.01.03.27.17
        (Google Transport Security);
        Fri, 01 Dec 2023 03:27:17 -0800 (PST)
Received-SPF: pass (google.com: domain of stefanha@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=PKwuWEJd;
       spf=pass (google.com: domain of stefanha@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=stefanha@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701430037; x=1702034837; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=N7G4F+/3DYTV2xUhvsGBYPnyztxOU0n9MgMzRa6wU2s=;
        b=PKwuWEJdUGBKTTDx37xtmdmFBxx9RlGcuUrdhvC0xLRXc5vrVyAq2XLHESODkbLNB9
         u/gQP+WHFzGkn8J+6jLb03APsdnnTRiQiA1ihOWAxY9qHSFwFbOUI8Oerz4IF+LJmF72
         AobAM0oAfjSZsTPd6v60r6LEx16Mb5N7i7Pukpu/aDeX/74pkt6z2Nyd1OHQ7yXA8i/C
         Pt/aeRuDLP/2Q2Ch4rGg6ImrlSXNqDAD7TRfHSSd/VApi8p+L5yj2Q8zxh0TS6XGtqK/
         FL+OdzUtr4XCY6ShX6BQZF1nW5wCYjxS7cYtGApwU3D1FR3zSgtrB/G5/rNidXicR69b
         ehXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701430037; x=1702034837;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N7G4F+/3DYTV2xUhvsGBYPnyztxOU0n9MgMzRa6wU2s=;
        b=m/gZw0FBnKM1nphYvZ96Ri2cjX0KZrAABHLiOzgUIaEEK8AfHmy6jXWXdNEBpL8FcA
         BAS9mISSDWxl+2zRA7b3vFMyeHI6pGC68Wuwtj06Whqhh5K9W1im29gu3zpEm8e1dst1
         Tv76D/jnIN9rdp2i8TTcPznYoJGaw2FY1OAbjHmwhyOoXFz4uzetRx646/VQflydVjaQ
         EJ6eWTsHVFbFeQCJsMfd97rUHlKDB/UHcXfFOoEKSXkt/SKO2rOJ4TcksXbF/9uvF3md
         2PHVKdelwBidlO6SrkydHaCjtphMNf1LKvCXQ0PjUREnNkRJFUCFnRhyxqwH1oW5baqm
         haHg==
X-Gm-Message-State: AOJu0YwY5UMbiCvlzDSCWdra+GfoiIQE7lKGrUXaLYX314oHj5x5mvZd
	tkxuJmWwA5OzJGMeSxeeOpUrivfow45JkevkfzNNfiGT
X-Google-Smtp-Source: AGHT+IFp3fTMYRgCAcNM5+dZH0jaMsO2IqgcFPnSMega3ELhBtT5pHeWWfce4HWh35rjZ2F1kv1Ft0XbVS6DIfyZREY=
X-Received: by 2002:a05:6870:240a:b0:1fa:c88e:19fc with SMTP id
 n10-20020a056870240a00b001fac88e19fcmr4566807oap.20.1701430035498; Fri, 01
 Dec 2023 03:27:15 -0800 (PST)
MIME-Version: 1.0
References: <20231201093633.2551497-1-alex.bennee@linaro.org> <20231201093633.2551497-4-alex.bennee@linaro.org>
In-Reply-To: <20231201093633.2551497-4-alex.bennee@linaro.org>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Fri, 1 Dec 2023 06:27:04 -0500
Message-ID: <CAJSP0QXSm9nLqixMmgOCn72MQPUBUCHVOLu456FTSDnKSJFq5A@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] tests/avocado: drop BootLinuxConsole.test_mips_malta_cpio
 test
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel <qemu-devel@nongnu.org>, Eric Farman <farman@linux.ibm.com>, 
	Peter Maydell <peter.maydell@linaro.org>, Leif Lindholm <quic_llindhol@quicinc.com>, 
	Beraldo Leal <bleal@redhat.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Paolo Bonzini <pbonzini@redhat.com>, Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, 
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Thomas Huth <thuth@redhat.com>, 
	qemu-arm <qemu-arm@nongnu.org>, Radoslaw Biernacki <rad@semihalf.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Eric Auger <eric.auger@redhat.com>, 
	Halil Pasic <pasic@linux.ibm.com>, qemu-s390x <qemu-s390x@nongnu.org>, 
	Wainer dos Santos Moschetta <wainersm@redhat.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Aurelien Jarno <aurelien@aurel32.net>, 
	Cleber Rosa <crosa@redhat.com>, Joel Stanley <joel@jms.id.au>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000e04b62060b710c86"
X-TUID: Ap6PfF7ur6Z4

--000000000000e04b62060b710c86
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 1, 2023, 04:38 Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:

> The assets are no longer archived by Debian so we can't run this on
> CI. While some people may still have the test in their cache we do
> have more recent images from tuxrun so this isn't a great loss.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> Cc: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  tests/avocado/boot_linux_console.py | 22 ----------------------
>  1 file changed, 22 deletions(-)
>

Acked-by: Stefan Hajnoczi <stefanha@redhat.com>


> diff --git a/tests/avocado/boot_linux_console.py
> b/tests/avocado/boot_linux_console.py
> index 231b4f68e5..5d978f6dd0 100644
> --- a/tests/avocado/boot_linux_console.py
> +++ b/tests/avocado/boot_linux_console.py
> @@ -116,28 +116,6 @@ def test_x86_64_pc(self):
>          console_pattern =3D 'Kernel command line: %s' % kernel_command_l=
ine
>          self.wait_for_console_pattern(console_pattern)
>
> -    def test_mips_malta(self):
> -        """
> -        :avocado: tags=3Darch:mips
> -        :avocado: tags=3Dmachine:malta
> -        :avocado: tags=3Dendian:big
> -        """
> -        deb_url =3D ('http://snapshot.debian.org/archive/debian/'
> -                   '20130217T032700Z/pool/main/l/linux-2.6/'
> -                   'linux-image-2.6.32-5-4kc-malta_2.6.32-48_mips.deb')
> -        deb_hash =3D 'a8cfc28ad8f45f54811fc6cf74fc43ffcfe0ba04'
> -        deb_path =3D self.fetch_asset(deb_url, asset_hash=3Ddeb_hash)
> -        kernel_path =3D self.extract_from_deb(deb_path,
> -
> '/boot/vmlinux-2.6.32-5-4kc-malta')
> -
> -        self.vm.set_console()
> -        kernel_command_line =3D self.KERNEL_COMMON_COMMAND_LINE +
> 'console=3DttyS0'
> -        self.vm.add_args('-kernel', kernel_path,
> -                         '-append', kernel_command_line)
> -        self.vm.launch()
> -        console_pattern =3D 'Kernel command line: %s' % kernel_command_l=
ine
> -        self.wait_for_console_pattern(console_pattern)
> -
>      def test_mips64el_malta(self):
>          """
>          This test requires the ar tool to extract "data.tar.gz" from
> --
> 2.39.2
>
>
>

--000000000000e04b62060b710c86
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, Dec 1, 2023, 04:38 Alex Benn=C3=A9e &lt;<a hre=
f=3D"mailto:alex.bennee@linaro.org">alex.bennee@linaro.org</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex">The assets are no longer archived by=
 Debian so we can&#39;t run this on<br>
CI. While some people may still have the test in their cache we do<br>
have more recent images from tuxrun so this isn&#39;t a great loss.<br>
<br>
Signed-off-by: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.or=
g" target=3D"_blank" rel=3D"noreferrer">alex.bennee@linaro.org</a>&gt;<br>
Cc: Stefan Hajnoczi &lt;<a href=3D"mailto:stefanha@redhat.com" target=3D"_b=
lank" rel=3D"noreferrer">stefanha@redhat.com</a>&gt;<br>
Cc: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@linaro.org" ta=
rget=3D"_blank" rel=3D"noreferrer">philmd@linaro.org</a>&gt;<br>
---<br>
=C2=A0tests/avocado/boot_linux_console.py | 22 ----------------------<br>
=C2=A01 file changed, 22 deletions(-)<br></blockquote></div></div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Acked-by: Stefan Hajnoczi &lt;<a href=
=3D"mailto:stefanha@redhat.com">stefanha@redhat.com</a>&gt;</div><div dir=
=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">
<br>
diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux=
_console.py<br>
index 231b4f68e5..5d978f6dd0 100644<br>
--- a/tests/avocado/boot_linux_console.py<br>
+++ b/tests/avocado/boot_linux_console.py<br>
@@ -116,28 +116,6 @@ def test_x86_64_pc(self):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0console_pattern =3D &#39;Kernel command l=
ine: %s&#39; % kernel_command_line<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.wait_for_console_pattern(console_pat=
tern)<br>
<br>
-=C2=A0 =C2=A0 def test_mips_malta(self):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 :avocado: tags=3Darch:mips<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 :avocado: tags=3Dmachine:malta<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 :avocado: tags=3Dendian:big<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 deb_url =3D (&#39;<a href=3D"http://snapshot.d=
ebian.org/archive/debian/" rel=3D"noreferrer noreferrer" target=3D"_blank">=
http://snapshot.debian.org/archive/debian/</a>&#39;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;=
20130217T032700Z/pool/main/l/linux-2.6/&#39;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;=
linux-image-2.6.32-5-4kc-malta_2.6.32-48_mips.deb&#39;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 deb_hash =3D &#39;a8cfc28ad8f45f54811fc6cf74fc=
43ffcfe0ba04&#39;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 deb_path =3D self.fetch_asset(deb_url, asset_h=
ash=3Ddeb_hash)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_path =3D self.extract_from_deb(deb_path=
,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &#39;/boot/vmlinux-2.6.32-5-4kc-malta&#39;)<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.set_console()<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_command_line =3D self.KERNEL_COMMON_COM=
MAND_LINE + &#39;console=3DttyS0&#39;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.add_args(&#39;-kernel&#39;, kernel_pat=
h,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&#39;-append&#39;, kernel_command_line)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.vm.launch()<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 console_pattern =3D &#39;Kernel command line: =
%s&#39; % kernel_command_line<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.wait_for_console_pattern(console_pattern)=
<br>
-<br>
=C2=A0 =C2=A0 =C2=A0def test_mips64el_malta(self):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This test requires the ar tool to extract=
 &quot;data.tar.gz&quot; from<br>
-- <br>
2.39.2<br>
<br>
<br>
</blockquote></div></div></div>

--000000000000e04b62060b710c86--
