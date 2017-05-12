Received: by 10.25.0.6 with SMTP id 6csp214063lfa;
        Fri, 12 May 2017 05:28:18 -0700 (PDT)
X-Received: by 10.28.152.133 with SMTP id a127mr2204509wme.115.1494592098529;
        Fri, 12 May 2017 05:28:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494592098; cv=none;
        d=google.com; s=arc-20160816;
        b=LHmD7BHY/ZgRlHGZUCGqq45Na21zOQWbB9tHOJGS59LAOfkpzm12KvjesNY0EMHMif
         CgDbHq0J9tkqWnODKsg6LyRmvqW5GdiSIFh0+kyqzs+GJVRzlX9/br4l6uM35/GWdXlP
         pzJjiu03a64AijIVzrWjFT4cD0EwYC0bmJqDTftQzl/XXyTTRst/AAXQFZ1TyLCHY942
         IeLhJTRQGaaICbbwJx9PcBvLUUghxGyl5Dg7zgEEEfAp3doxkwz/bbIUj9i68hTlSwYU
         cu/t6JJbgzrhHkHvCBb+bTjBZv7gfTZe7otwlORHkRktSyvDlJi4BDKgaIXGhV4BQ59Y
         we+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to:reply-to
         :mime-version:dkim-signature:arc-authentication-results;
        bh=cj0qP/OvGYVEYW+0cAONQXNZjjEw+tk09VY63uQduLg=;
        b=zZl0bq+E35pPF1XXXrJ5UUobGGYVIQ3qiAxdJOUXTbnHpBQPTrPmGxz0YPsyE999rA
         gF3rrSdXUsO1tjh0on5CZ3VWyxHa6i5OSFtAxNrdZxIQGa4gAO417a4FnBAiE/DxEdUN
         RwdU+XSYjUbt34qCJ7Twvjlb0QcI7cLH7UP8B7ZahlNSov3y0nQEbIfRn3jLH4kdqUMX
         iFiQ2ZvPZsUyWYcJ7R57GR6s/SpkRhKvLSG+61dv3Rqxht9O0rDVyYTW/syLZ6FSO0Qn
         DXxgx/mrx91kM//omwoL6e6gDHxjv95sCFG2Z7KsWiQ5jcatBWzxWtFzDIy5tjxq45ga
         xnZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of heut2008@gmail.com designates 2a00:1450:400c:c0c::241 as permitted sender) smtp.mailfrom=heut2008@gmail.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <heut2008@gmail.com>
Received: from mail-wr0-x241.google.com (mail-wr0-x241.google.com. [2a00:1450:400c:c0c::241])
        by mx.google.com with ESMTPS id m4si3412276wrb.16.2017.05.12.05.28.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 12 May 2017 05:28:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of heut2008@gmail.com designates 2a00:1450:400c:c0c::241 as permitted sender) client-ip=2a00:1450:400c:c0c::241;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of heut2008@gmail.com designates 2a00:1450:400c:c0c::241 as permitted sender) smtp.mailfrom=heut2008@gmail.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: by mail-wr0-x241.google.com with SMTP id g12so7509279wrg.2
        for <alex.bennee@linaro.org>; Fri, 12 May 2017 05:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=cj0qP/OvGYVEYW+0cAONQXNZjjEw+tk09VY63uQduLg=;
        b=GFKVuG/U5lSs9ILd34l20ApTXgs+HfYUQPAP5GF8IeKCI9aKYt99Js/AmTqxdC0yde
         PPbglAG3dbnlkX0im0a5W8XSBE0vLLH8a30GQQ4wSItMV48FZL1G5Ewf/U8DskWH9D7H
         WDIF3fC48BxqYBmvcWXE73DmzTjjiklW5/trSZTo1mTAjsVPQrTBpPu2I5lhaOYhMm0N
         YAZ2Qmt/mZh9TclCJ/PMnsORzXAi69m+/UuGxdI7v/6n7dKqxib2F8K+Z9WEJpjUMIt5
         F2S3C2GwRmiSF2SfVwv9tLw4dRjUJXheQ8KnSFnQPbrJyTP3RiHFgXuhu/gdbCMCLTfr
         pU2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:in-reply-to:references
         :from:date:message-id:subject:to:cc;
        bh=cj0qP/OvGYVEYW+0cAONQXNZjjEw+tk09VY63uQduLg=;
        b=F1q4ptMOThLnfidIWV0y/L5tkpOSDLRC9DvLnlkXCNimZ5Qn6rvrL+u85p1XT9Iewc
         iLDFgT+NBZlhBuKXCgmWgGoTVlaK/Tbd8jEDRqF52mhXxBJJh64KQ6aPaRJrjV8T4lnJ
         LdnEJuUhTWeq63Ukr2PlUFvtxkyUh/Pk6RiiE9s6vQDqgmdb80w+Vd8+vD59ijz7mGXZ
         ihDOlfP8Y4ntHXsrIdWUSAb6H2eeOXTUIUSioJw+izZzNStnydjEuCmeHl3rKOrNAPOC
         3BYdeMzJ1xLJGbe5i0YXMFRasPNHF6V6REiXITuv1tEzGqdAQ6wyVnD3Rq5k2ZAzXArF
         T3zg==
X-Gm-Message-State: AODbwcANh8XnOe7AFc2rLTloG35HNIrzAI2KkUXatUJMi9l61LPHPtZt
	ZWlPO25sfWY8qkOl8SclgC4YSzBbxgd2pKk=
X-Received: by 10.46.74.1 with SMTP id x1mr1014233lja.116.1494592098037; Fri,
 12 May 2017 05:28:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.196.67 with HTTP; Fri, 12 May 2017 05:28:17 -0700 (PDT)
Reply-To: heut2008@gmail.com
In-Reply-To: <CAPP2CaWv-SEipA-_3VQ7wSLAx0MGE9VyqEHeCK1jci5u2apa2A@mail.gmail.com>
References: <CAPP2CaWZ3p5rcry5xvcAoVmji2cpkQffZBvfJqjOsYh4t9VLvw@mail.gmail.com>
 <87lgq68ot2.fsf@linaro.org> <CAPP2CaWv-SEipA-_3VQ7wSLAx0MGE9VyqEHeCK1jci5u2apa2A@mail.gmail.com>
From: Yaguang Tang <heut2008@gmail.com>
Date: Fri, 12 May 2017 20:28:17 +0800
Message-ID: <CAPP2CaUzzyCJcAm8BH7szD=E56TCZoNAR93SpNHoqQwc_Vpxpw@mail.gmail.com>
Subject: Re: [Qemu-arm] Qemu qxl support on arm64 issue
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="f403045ebdc2167737054f52d7a7"
X-TUID: MAQZebprIWqa

--f403045ebdc2167737054f52d7a7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

Thanks for your suggestion, I am successfully connect to guest using spice
with virtio-gpu graphic driver, but the next problem is that can't use
keyboard in spice client, when trying to add a usb keyboard
device to guest, libvirt show's   *ibvirtError: internal error: No free USB
ports,* note that I am adding this usb device using virt-manager . is there
any specific to USB device in arm64 ?

On Tue, May 9, 2017 at 6:38 PM, Yaguang Tang <heut2008@gmail.com> wrote:

> Qemu shows QXL is not available,  if I use virtio-gpu, does it require
> specific driver or kernel version in guest ?
>
> On Tue, May 9, 2017 at 3:36 PM, Alex Benn=C3=A9e <alex.bennee@linaro.org>
> wrote:
>
>>
>> Yaguang Tang <heut2008@gmail.com> writes:
>>
>> > Hi all,
>> >
>> > I am trying to make openstack work on arm64, when setting spice for VM=
,
>> > qemu complains that qxl is not available, my env:
>> >
>> > qemu 2.8 compiled with the following:
>> >
>> > ./configure --enable-spice --enable-kvm --target-list=3Daarch64-softmm=
u
>> > perl: warning: Setting locale failed.
>> > perl: warning: Please check that your locale settings:
>> >         LANGUAGE =3D (unset),
>> >         LC_ALL =3D (unset),
>> >         LANG =3D "en_US.UTF-8"
>> >     are supported and installed on your system.
>> > perl: warning: Falling back to the standard locale ("C").
>> > Install prefix    /usr/local
>> > BIOS directory    /usr/local/share/qemu
>> > binary directory  /usr/local/bin
>> > library directory /usr/local/lib
>> > module directory  /usr/local/lib/qemu
>> > libexec directory /usr/local/libexec
>> > include directory /usr/local/include
>> > config directory  /usr/local/etc
>> > local state directory   /usr/local/var
>> > Manual directory  /usr/local/share/man
>> > ELF interp prefix /usr/gnemul/qemu-%M
>> > Source path       /home/etos/git/qemu
>> > C compiler        cc
>> > Host C compiler   cc
>> > C++ compiler      c++
>> > Objective-C compiler cc
>> > ARFLAGS           rv
>> > CFLAGS            -O2 -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=3D2 -g
>> > QEMU_CFLAGS       -I/usr/include/pixman-1   -Werror
>> > -DHAS_LIBSSH2_SFTP_FSYNC -pthread -I/usr/include/glib-2.0
>> > -I/usr/lib/aarch64-linux-gnu/glib-2.0/include   -D_GNU_SOURCE
>> > -D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE_SOURCE -Wstrict-prototypes
>> > -Wredundant-decls -Wall -Wundef -Wwrite-strings -Wmissing-prototypes
>> > -fno-strict-aliasing -fno-common -fwrapv  -Wendif-labels
>> > -Wno-missing-include-dirs -Wempty-body -Wnested-externs
>> -Wformat-security
>> > -Wformat-y2k -Winit-self -Wignored-qualifiers -Wold-style-declaration
>> > -Wold-style-definition -Wtype-limits -fstack-protector-strong
>> >  -I/usr/include/p11-kit-1     -I/usr/include/libpng12  -pthread
>> > -I/usr/local/include/spice-server -I/usr/local/include/spice-1
>> > -I/usr/include/glib-2.0 -I/usr/lib/aarch64-linux-gnu/glib-2.0/include
>> > -I/usr/include/pixman-1  -I/usr/include/libusb-1.0
>> > LDFLAGS           -Wl,--warn-common -g
>> > make              make
>> > install           install
>> > python            python -B
>> > smbd              /usr/sbin/smbd
>> > module support    no
>> > host CPU          aarch64
>> > host big endian   no
>> > target list       aarch64-softmmu
>> > tcg debug enabled no
>> > gprof enabled     no
>> > sparse enabled    no
>> > strip binaries    yes
>> > profiler          no
>> > static build      no
>> > pixman            system
>> > SDL support       yes (1.2.15)
>> > GTK support       no
>> > GTK GL support    no
>> > VTE support       no
>> > TLS priority      NORMAL
>> > GNUTLS support    yes
>> > GNUTLS rnd        yes
>> > libgcrypt         no
>> > libgcrypt kdf     no
>> > nettle            yes (3.3)
>> > nettle kdf        yes
>> > libtasn1          yes
>> > curses support    no
>> > virgl support     yes
>> > curl support      yes
>> > mingw32 support   no
>> > Audio drivers     oss
>> > Block whitelist (rw)
>> > Block whitelist (ro)
>> > VirtFS support    yes
>> > VNC support       yes
>> > VNC SASL support  yes
>> > VNC JPEG support  yes
>> > VNC PNG support   yes
>> > xen support       no
>> > brlapi support    yes
>> > bluez  support    yes
>> > Documentation     yes
>> > PIE               no
>> > vde support       yes
>> > netmap support    no
>> > Linux AIO support yes
>> > ATTR/XATTR support yes
>> > Install blobs     yes
>> > KVM support       yes
>> > HAX support       no
>> > RDMA support      no
>> > TCG interpreter   no
>> > fdt support       yes
>> > preadv support    yes
>> > fdatasync         yes
>> > madvise           yes
>> > posix_madvise     yes
>> > libcap-ng support yes
>> > vhost-net support yes
>> > vhost-scsi support yes
>> > vhost-vsock support yes
>> > Trace backends    log
>> > spice support     yes (0.12.13/0.13.3.311-1b9c-dirty)
>> > rbd support       yes
>> > xfsctl support    yes
>> > smartcard support no
>> > libusb            yes
>> > usb net redir     yes
>> > OpenGL support    no
>> > OpenGL dmabufs    no
>> > libiscsi support  yes
>> > libnfs support    no
>> > build guest agent yes
>> > QGA VSS support   no
>> > QGA w32 disk info no
>> > QGA MSI support   no
>> > seccomp support   yes
>> > coroutine backend ucontext
>> > coroutine pool    yes
>> > debug stack usage no
>> > GlusterFS support no
>> > gcov              gcov
>> > gcov enabled      no
>> > TPM support       yes
>> > libssh2 support   yes
>> > TPM passthrough   no
>> > QOM debugging     yes
>> > lzo support       yes
>> > snappy support    no
>> > bzip2 support     no
>> > NUMA host support no
>> > tcmalloc support  no
>> > jemalloc support  no
>> > avx2 optimization no
>> > replication support yes
>> > VxHS block device no
>> >
>> > start a vm as follow:
>> >
>> > qemu-system-aarch64 --enable-kvm --nographic -machine virt --kernel
>> > cirros-d161201-aarch64-vmlinuz --initrd cirros-d161201-aarch64-initrd
>> > --spice port=3D5900,disable-ticketing -cpu host -vga qxl
>> >
>> > Is there anything I am missing or wrong ?
>>
>> What error does it give?
>>
>> Regardless I think -vga is a legacy option for x86. If you want a displa=
y
>> adaptor for an ARM vm machine you'll need to instantiate virtio-gpu
>> device and then connect it to your spice display.
>>
>> --
>> Alex Benn=C3=A9e
>>
>
>
>
> --
> Tang Yaguang
>
>
>
>



--=20
Tang Yaguang

--f403045ebdc2167737054f52d7a7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Alex,<div><br></div><div>Thanks for your suggestion, I =
am successfully connect to guest using spice with virtio-gpu graphic driver=
, but the next problem is that can&#39;t use keyboard in spice client, when=
 trying to add a usb keyboard</div><div>device to guest, libvirt show&#39;s=
 =C2=A0=C2=A0<b>ibvirtError: internal error: No free USB ports,</b> note th=
at I am adding this usb device using virt-manager . is there any specific t=
o USB device in arm64 ?</div></div><div class=3D"gmail_extra"><br><div clas=
s=3D"gmail_quote">On Tue, May 9, 2017 at 6:38 PM, Yaguang Tang <span dir=3D=
"ltr">&lt;<a href=3D"mailto:heut2008@gmail.com" target=3D"_blank">heut2008@=
gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=
=3D"ltr">Qemu shows QXL is not available, =C2=A0if I use=C2=A0<span style=
=3D"font-size:12.8px">virtio-gpu, does it require specific driver or kernel=
 version in guest ?</span></div><div class=3D"gmail_extra"><div><div class=
=3D"h5"><br><div class=3D"gmail_quote">On Tue, May 9, 2017 at 3:36 PM, Alex=
 Benn=C3=A9e <span dir=3D"ltr">&lt;<a href=3D"mailto:alex.bennee@linaro.org=
" target=3D"_blank">alex.bennee@linaro.org</a>&gt;</span> wrote:<br><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex"><div class=3D"m_5958825221151326510HOEnZb"><div cla=
ss=3D"m_5958825221151326510h5"><br>
Yaguang Tang &lt;<a href=3D"mailto:heut2008@gmail.com" target=3D"_blank">he=
ut2008@gmail.com</a>&gt; writes:<br>
<br>
&gt; Hi all,<br>
&gt;<br>
&gt; I am trying to make openstack work on arm64, when setting spice for VM=
,<br>
&gt; qemu complains that qxl is not available, my env:<br>
&gt;<br>
&gt; qemu 2.8 compiled with the following:<br>
&gt;<br>
&gt; ./configure --enable-spice --enable-kvm --target-list=3Daarch64-softmm=
u<br>
&gt; perl: warning: Setting locale failed.<br>
&gt; perl: warning: Please check that your locale settings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LANGUAGE =3D (unset),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LC_ALL =3D (unset),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LANG =3D &quot;en_US.UTF-8&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0are supported and installed on your system.<br>
&gt; perl: warning: Falling back to the standard locale (&quot;C&quot;).<br=
>
&gt; Install prefix=C2=A0 =C2=A0 /usr/local<br>
&gt; BIOS directory=C2=A0 =C2=A0 /usr/local/share/qemu<br>
&gt; binary directory=C2=A0 /usr/local/bin<br>
&gt; library directory /usr/local/lib<br>
&gt; module directory=C2=A0 /usr/local/lib/qemu<br>
&gt; libexec directory /usr/local/libexec<br>
&gt; include directory /usr/local/include<br>
&gt; config directory=C2=A0 /usr/local/etc<br>
&gt; local state directory=C2=A0 =C2=A0/usr/local/var<br>
&gt; Manual directory=C2=A0 /usr/local/share/man<br>
&gt; ELF interp prefix /usr/gnemul/qemu-%M<br>
&gt; Source path=C2=A0 =C2=A0 =C2=A0 =C2=A0/home/etos/git/qemu<br>
&gt; C compiler=C2=A0 =C2=A0 =C2=A0 =C2=A0 cc<br>
&gt; Host C compiler=C2=A0 =C2=A0cc<br>
&gt; C++ compiler=C2=A0 =C2=A0 =C2=A0 c++<br>
&gt; Objective-C compiler cc<br>
&gt; ARFLAGS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rv<br>
&gt; CFLAGS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -O2 -U_FORTIFY_SOURCE =
-D_FORTIFY_SOURCE=3D2 -g<br>
&gt; QEMU_CFLAGS=C2=A0 =C2=A0 =C2=A0 =C2=A0-I/usr/include/pixman-1=C2=A0 =
=C2=A0-Werror<br>
&gt; -DHAS_LIBSSH2_SFTP_FSYNC -pthread -I/usr/include/glib-2.0<br>
&gt; -I/usr/lib/aarch64-linux-gnu/g<wbr>lib-2.0/include=C2=A0 =C2=A0-D_GNU_=
SOURCE<br>
&gt; -D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE_SOURCE -Wstrict-prototypes<br>
&gt; -Wredundant-decls -Wall -Wundef -Wwrite-strings -Wmissing-prototypes<b=
r>
&gt; -fno-strict-aliasing -fno-common -fwrapv=C2=A0 -Wendif-labels<br>
&gt; -Wno-missing-include-dirs -Wempty-body -Wnested-externs -Wformat-secur=
ity<br>
&gt; -Wformat-y2k -Winit-self -Wignored-qualifiers -Wold-style-declaration<=
br>
&gt; -Wold-style-definition -Wtype-limits -fstack-protector-strong<br>
&gt;=C2=A0 -I/usr/include/p11-kit-1=C2=A0 =C2=A0 =C2=A0-I/usr/include/libpn=
g12=C2=A0 -pthread<br>
&gt; -I/usr/local/include/spice-ser<wbr>ver -I/usr/local/include/spice-1<br=
>
&gt; -I/usr/include/glib-2.0 -I/usr/lib/aarch64-linux-gnu/g<wbr>lib-2.0/inc=
lude<br>
&gt; -I/usr/include/pixman-1=C2=A0 -I/usr/include/libusb-1.0<br>
&gt; LDFLAGS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Wl,--warn-common -g<b=
r>
&gt; make=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 make<br>
&gt; install=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install<br>
&gt; python=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 python -B<br>
&gt; smbd=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /usr/sbin/smbd<br=
>
&gt; module support=C2=A0 =C2=A0 no<br>
&gt; host CPU=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 aarch64<br>
&gt; host big endian=C2=A0 =C2=A0no<br>
&gt; target list=C2=A0 =C2=A0 =C2=A0 =C2=A0aarch64-softmmu<br>
&gt; tcg debug enabled no<br>
&gt; gprof enabled=C2=A0 =C2=A0 =C2=A0no<br>
&gt; sparse enabled=C2=A0 =C2=A0 no<br>
&gt; strip binaries=C2=A0 =C2=A0 yes<br>
&gt; profiler=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 no<br>
&gt; static build=C2=A0 =C2=A0 =C2=A0 no<br>
&gt; pixman=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 system<br>
&gt; SDL support=C2=A0 =C2=A0 =C2=A0 =C2=A0yes (1.2.15)<br>
&gt; GTK support=C2=A0 =C2=A0 =C2=A0 =C2=A0no<br>
&gt; GTK GL support=C2=A0 =C2=A0 no<br>
&gt; VTE support=C2=A0 =C2=A0 =C2=A0 =C2=A0no<br>
&gt; TLS priority=C2=A0 =C2=A0 =C2=A0 NORMAL<br>
&gt; GNUTLS support=C2=A0 =C2=A0 yes<br>
&gt; GNUTLS rnd=C2=A0 =C2=A0 =C2=A0 =C2=A0 yes<br>
&gt; libgcrypt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0no<br>
&gt; libgcrypt kdf=C2=A0 =C2=A0 =C2=A0no<br>
&gt; nettle=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 yes (3.3)<br>
&gt; nettle kdf=C2=A0 =C2=A0 =C2=A0 =C2=A0 yes<br>
&gt; libtasn1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 yes<br>
&gt; curses support=C2=A0 =C2=A0 no<br>
&gt; virgl support=C2=A0 =C2=A0 =C2=A0yes<br>
&gt; curl support=C2=A0 =C2=A0 =C2=A0 yes<br>
&gt; mingw32 support=C2=A0 =C2=A0no<br>
&gt; Audio drivers=C2=A0 =C2=A0 =C2=A0oss<br>
&gt; Block whitelist (rw)<br>
&gt; Block whitelist (ro)<br>
&gt; VirtFS support=C2=A0 =C2=A0 yes<br>
&gt; VNC support=C2=A0 =C2=A0 =C2=A0 =C2=A0yes<br>
&gt; VNC SASL support=C2=A0 yes<br>
&gt; VNC JPEG support=C2=A0 yes<br>
&gt; VNC PNG support=C2=A0 =C2=A0yes<br>
&gt; xen support=C2=A0 =C2=A0 =C2=A0 =C2=A0no<br>
&gt; brlapi support=C2=A0 =C2=A0 yes<br>
&gt; bluez=C2=A0 support=C2=A0 =C2=A0 yes<br>
&gt; Documentation=C2=A0 =C2=A0 =C2=A0yes<br>
&gt; PIE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0no<br>
&gt; vde support=C2=A0 =C2=A0 =C2=A0 =C2=A0yes<br>
&gt; netmap support=C2=A0 =C2=A0 no<br>
&gt; Linux AIO support yes<br>
&gt; ATTR/XATTR support yes<br>
&gt; Install blobs=C2=A0 =C2=A0 =C2=A0yes<br>
&gt; KVM support=C2=A0 =C2=A0 =C2=A0 =C2=A0yes<br>
&gt; HAX support=C2=A0 =C2=A0 =C2=A0 =C2=A0no<br>
&gt; RDMA support=C2=A0 =C2=A0 =C2=A0 no<br>
&gt; TCG interpreter=C2=A0 =C2=A0no<br>
&gt; fdt support=C2=A0 =C2=A0 =C2=A0 =C2=A0yes<br>
&gt; preadv support=C2=A0 =C2=A0 yes<br>
&gt; fdatasync=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0yes<br>
&gt; madvise=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0yes<br>
&gt; posix_madvise=C2=A0 =C2=A0 =C2=A0yes<br>
&gt; libcap-ng support yes<br>
&gt; vhost-net support yes<br>
&gt; vhost-scsi support yes<br>
&gt; vhost-vsock support yes<br>
&gt; Trace backends=C2=A0 =C2=A0 log<br>
&gt; spice support=C2=A0 =C2=A0 =C2=A0yes (0.12.13/0.13.3.311-1b9c-dirty<wb=
r>)<br>
&gt; rbd support=C2=A0 =C2=A0 =C2=A0 =C2=A0yes<br>
&gt; xfsctl support=C2=A0 =C2=A0 yes<br>
&gt; smartcard support no<br>
&gt; libusb=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 yes<br>
&gt; usb net redir=C2=A0 =C2=A0 =C2=A0yes<br>
&gt; OpenGL support=C2=A0 =C2=A0 no<br>
&gt; OpenGL dmabufs=C2=A0 =C2=A0 no<br>
&gt; libiscsi support=C2=A0 yes<br>
&gt; libnfs support=C2=A0 =C2=A0 no<br>
&gt; build guest agent yes<br>
&gt; QGA VSS support=C2=A0 =C2=A0no<br>
&gt; QGA w32 disk info no<br>
&gt; QGA MSI support=C2=A0 =C2=A0no<br>
&gt; seccomp support=C2=A0 =C2=A0yes<br>
&gt; coroutine backend ucontext<br>
&gt; coroutine pool=C2=A0 =C2=A0 yes<br>
&gt; debug stack usage no<br>
&gt; GlusterFS support no<br>
&gt; gcov=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gcov<br>
&gt; gcov enabled=C2=A0 =C2=A0 =C2=A0 no<br>
&gt; TPM support=C2=A0 =C2=A0 =C2=A0 =C2=A0yes<br>
&gt; libssh2 support=C2=A0 =C2=A0yes<br>
&gt; TPM passthrough=C2=A0 =C2=A0no<br>
&gt; QOM debugging=C2=A0 =C2=A0 =C2=A0yes<br>
&gt; lzo support=C2=A0 =C2=A0 =C2=A0 =C2=A0yes<br>
&gt; snappy support=C2=A0 =C2=A0 no<br>
&gt; bzip2 support=C2=A0 =C2=A0 =C2=A0no<br>
&gt; NUMA host support no<br>
&gt; tcmalloc support=C2=A0 no<br>
&gt; jemalloc support=C2=A0 no<br>
&gt; avx2 optimization no<br>
&gt; replication support yes<br>
&gt; VxHS block device no<br>
&gt;<br>
&gt; start a vm as follow:<br>
&gt;<br>
&gt; qemu-system-aarch64 --enable-kvm --nographic -machine virt --kernel<br=
>
&gt; cirros-d161201-aarch64-vmlinuz --initrd cirros-d161201-aarch64-initrd<=
br>
&gt; --spice port=3D5900,disable-ticketing -cpu host -vga qxl<br>
&gt;<br>
&gt; Is there anything I am missing or wrong ?<br>
<br>
</div></div>What error does it give?<br>
<br>
Regardless I think -vga is a legacy option for x86. If you want a display<b=
r>
adaptor for an ARM vm machine you&#39;ll need to instantiate virtio-gpu<br>
device and then connect it to your spice display.<br>
<br>
--<br>
Alex Benn=C3=A9e<br>
</blockquote></div><br><br clear=3D"all"><div><br></div></div></div><span c=
lass=3D"HOEnZb"><font color=3D"#888888">-- <br><div class=3D"m_595882522115=
1326510gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"=
><div>Tang Yaguang</div><div><br></div><br><div>=C2=A0</div></div></div>
</font></span></div>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><d=
iv>Tang Yaguang</div><div><br></div><br><div>=C2=A0</div></div></div>
</div>

--f403045ebdc2167737054f52d7a7--
