Received: by 10.25.0.6 with SMTP id 6csp271075lfa;
        Fri, 12 May 2017 07:40:01 -0700 (PDT)
X-Received: by 10.25.87.79 with SMTP id l76mr1399927lfb.90.1494600001617;
        Fri, 12 May 2017 07:40:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494600001; cv=none;
        d=google.com; s=arc-20160816;
        b=QDlRp2EdCCYWfhKS6Oz8K9KL0ZRSrPz8FhFmUg3ljxQvy3XuKwg6LPmf+iuOzXE9P/
         BNICTdoUOSAg2lZJVB+C6uj1l8cUzVum0OLP2rOUWrP5BDR9emi6XMJTrNAR4lbVw5S+
         RrvU+AhFJnF9XpCaDFjV1p1iUELfpLfdfHKjHsooLSETmnrXlct5pyvTqVzghvCGgQVL
         PNEquYIEp08GwbQR2kEh88nMbUxGKjrURAaWGJ9mvLROMFGHZn5tPqTaH+f/iL7lkKN3
         MQCdZtPKCmxE4IOE+AnRL/W85z4Jqbo2LjsDR+l2cK143m++hiJ+uMOKw2UAAcGSAJQS
         XQuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to:reply-to
         :mime-version:dkim-signature:arc-authentication-results;
        bh=IClcix/feVvCyWM6f0UY0VHfFhDxKo6ysJR+GUq536o=;
        b=QWhqKjjPTRRktSPc623VLqtLfHk9ZbMfVAk1sFWT6YsZRTzw0vnT3ggQmOX0IJCWFX
         DYuLAhb1uphL9LaZqm+oZzpYOBZIwH0U/Nuo560i/4IQtdnzW1crKzQmI0mJgQJ8ME2M
         USJKBAool492rZPwRqYDVGwrm1BjV0YrQAzSJgB+nEB2bqIYQNaI070VaOgwYp6yb0wI
         SZvEc+InsK7DL+xKkaXINHvcjhKQNvwZP39BLQCoiuhCTDVV0CmtrnK+YG22AfJVDEKx
         oxXUH/cWmYoMA3FwPJJ+GeBQ+N7nFcmb7CKa6fpvosfUDqbbQa6CIKL9JYMa6/GedNly
         iImA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of heut2008@gmail.com designates 2a00:1450:4010:c07::244 as permitted sender) smtp.mailfrom=heut2008@gmail.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <heut2008@gmail.com>
Received: from mail-lf0-x244.google.com (mail-lf0-x244.google.com. [2a00:1450:4010:c07::244])
        by mx.google.com with ESMTPS id t16si1630875lfd.207.2017.05.12.07.40.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 12 May 2017 07:40:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of heut2008@gmail.com designates 2a00:1450:4010:c07::244 as permitted sender) client-ip=2a00:1450:4010:c07::244;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of heut2008@gmail.com designates 2a00:1450:4010:c07::244 as permitted sender) smtp.mailfrom=heut2008@gmail.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: by mail-lf0-x244.google.com with SMTP id q24so330700lfb.1
        for <alex.bennee@linaro.org>; Fri, 12 May 2017 07:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=IClcix/feVvCyWM6f0UY0VHfFhDxKo6ysJR+GUq536o=;
        b=oin/RMkq5zp/kpea2RJYyvP+OQUfMBpzZNUTS/gM5GuE/vDWg9pK/FS/SoddDgUieR
         FGYdQf+ncq690saEMxyzoiSR1a+rScnrLMfs093U1CrP2+9v37HzhGNN6o4DDEvq/fst
         tFo76ilSctE/+3qjb7+qUR8K9iYWONvW/q7+PM8QgDVPCOrwdHRCk3eesnstVQXN2Flz
         FgUNlBkeIWr+Ei478yBIIwZliqAclKoXZd/2/SHG5m3jvbe76EFb0I/VPM+fzbpV+bjr
         mGgARd+N3C2/xs91D/WhLAwjsFHQDDkP2IfEcVMZvrTrr6lacrq4LG2A03axHfUxSCO9
         TfGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:in-reply-to:references
         :from:date:message-id:subject:to:cc;
        bh=IClcix/feVvCyWM6f0UY0VHfFhDxKo6ysJR+GUq536o=;
        b=aMxb+YxehZeLOOQa67u3tcdmywNn81QyPgqqhOmZf/63pTa+uadIJL/vU0mGSmHt/2
         HphDrSjmUl6NXxY3gJkSilVUcrG0FcHn9uAFOoUQuZuSZQKCZynzaNpG0ICXqi0nYRBz
         AdKPTW9LUTWtu3ofw1RYWOCYzOvnhjC4ifcMcQdY3IaV4f61NLNtOqQPt4P+HWqrJlvo
         cRhQhcCj5o6EdP8T7DBvH6AFrTj7Mf9SuVCL2wosgy84oxGfgVgbTyE1Q5kpknXZvVzn
         jExOaYpeWpXfGniJxR38tFYbUMLU+zUCVkt/A2nzOvZxPTZLwdHmHEa0pqzhbXfISahO
         Ce/g==
X-Gm-Message-State: AODbwcC7FspPIzlBSAjG9axAS7HaXmUcHJX1IS4DHSEf764Cv+hfEV5j
	RktlhkSt9MtaCzE+udUXW7xrjx130ypxhkA=
X-Received: by 10.25.35.87 with SMTP id j84mr1420900lfj.118.1494600001242;
 Fri, 12 May 2017 07:40:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.196.67 with HTTP; Fri, 12 May 2017 07:40:00 -0700 (PDT)
Reply-To: heut2008@gmail.com
In-Reply-To: <87inl643o2.fsf@linaro.org>
References: <CAPP2CaWZ3p5rcry5xvcAoVmji2cpkQffZBvfJqjOsYh4t9VLvw@mail.gmail.com>
 <87lgq68ot2.fsf@linaro.org> <CAPP2CaWv-SEipA-_3VQ7wSLAx0MGE9VyqEHeCK1jci5u2apa2A@mail.gmail.com>
 <CAPP2CaUzzyCJcAm8BH7szD=E56TCZoNAR93SpNHoqQwc_Vpxpw@mail.gmail.com> <87inl643o2.fsf@linaro.org>
From: Yaguang Tang <heut2008@gmail.com>
Date: Fri, 12 May 2017 22:40:00 +0800
Message-ID: <CAPP2CaXSCw9_Fu_dCvxqNzfPwmtSPdcv0jGLcTSsd7sE_1-mpg@mail.gmail.com>
Subject: Re: [Qemu-arm] Qemu qxl support on arm64 issue
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="001a113c9ba027cef9054f54aed8"
X-TUID: 3ZWszyfohmGP

--001a113c9ba027cef9054f54aed8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This is what I am using:

/usr/local/bin/qemu-system-aarch64 --enable-kvm --nographic -machine virt
--bios /usr/share/qemu-efi/QEMU_EFI.fd -device
virtio-blk-device,drive=3Dimage -drive
if=3Dnone,id=3Dimage,file=3Dxenial-server-cloudimg-arm64-uefi1.raw --spice
port=3D5900,disable-ticketing -cpu host  -m 2048 -device virtio-gpu -smp 4
-device usb-ehci -device usb-kbd

From the console log I see USB device can be recognized in VM , but the
issue is when using spice client, only mouse work, can't input anything.
The qemu version is 2.9 which I compile from source with spice 0.13.3
support.

On Fri, May 12, 2017 at 9:15 PM, Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:

>
> Yaguang Tang <heut2008@gmail.com> writes:
>
> > Hi Alex,
> >
> > Thanks for your suggestion, I am successfully connect to guest using
> spice
> > with virtio-gpu graphic driver, but the next problem is that can't use
> > keyboard in spice client, when trying to add a usb keyboard
> > device to guest, libvirt show's   *ibvirtError: internal error: No free
> USB
> > ports,* note that I am adding this usb device using virt-manager . is
> there
> > any specific to USB device in arm64 ?
>
> It's hard to tell without knowing what virt-manager is doing.
>
> However the general thing with the arm64 virt machine is it is fairly
> bare by default (compared to a PC which includes a bunch of stuff in its
> default device model). As a result you need to declare all additional
> devices you wish to use.
>
> There is no particular reason why you shouldn't be able to instantiate a
> virtio USB hub for your device although you would want it to be
> discover-able so on a virtio-pci bus.
>
> Can you include you current QEMU command line?
>
> >
> > On Tue, May 9, 2017 at 6:38 PM, Yaguang Tang <heut2008@gmail.com> wrote=
:
> >
> >> Qemu shows QXL is not available,  if I use virtio-gpu, does it require
> >> specific driver or kernel version in guest ?
> >>
> >> On Tue, May 9, 2017 at 3:36 PM, Alex Benn=C3=A9e <alex.bennee@linaro.o=
rg>
> >> wrote:
> >>
> >>>
> >>> Yaguang Tang <heut2008@gmail.com> writes:
> >>>
> >>> > Hi all,
> >>> >
> >>> > I am trying to make openstack work on arm64, when setting spice for
> VM,
> >>> > qemu complains that qxl is not available, my env:
> >>> >
> >>> > qemu 2.8 compiled with the following:
> >>> >
> >>> > ./configure --enable-spice --enable-kvm --target-list=3Daarch64-sof=
tmmu
> >>> > perl: warning: Setting locale failed.
> >>> > perl: warning: Please check that your locale settings:
> >>> >         LANGUAGE =3D (unset),
> >>> >         LC_ALL =3D (unset),
> >>> >         LANG =3D "en_US.UTF-8"
> >>> >     are supported and installed on your system.
> >>> > perl: warning: Falling back to the standard locale ("C").
> >>> > Install prefix    /usr/local
> >>> > BIOS directory    /usr/local/share/qemu
> >>> > binary directory  /usr/local/bin
> >>> > library directory /usr/local/lib
> >>> > module directory  /usr/local/lib/qemu
> >>> > libexec directory /usr/local/libexec
> >>> > include directory /usr/local/include
> >>> > config directory  /usr/local/etc
> >>> > local state directory   /usr/local/var
> >>> > Manual directory  /usr/local/share/man
> >>> > ELF interp prefix /usr/gnemul/qemu-%M
> >>> > Source path       /home/etos/git/qemu
> >>> > C compiler        cc
> >>> > Host C compiler   cc
> >>> > C++ compiler      c++
> >>> > Objective-C compiler cc
> >>> > ARFLAGS           rv
> >>> > CFLAGS            -O2 -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=3D2 -g
> >>> > QEMU_CFLAGS       -I/usr/include/pixman-1   -Werror
> >>> > -DHAS_LIBSSH2_SFTP_FSYNC -pthread -I/usr/include/glib-2.0
> >>> > -I/usr/lib/aarch64-linux-gnu/glib-2.0/include   -D_GNU_SOURCE
> >>> > -D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE_SOURCE -Wstrict-prototypes
> >>> > -Wredundant-decls -Wall -Wundef -Wwrite-strings -Wmissing-prototype=
s
> >>> > -fno-strict-aliasing -fno-common -fwrapv  -Wendif-labels
> >>> > -Wno-missing-include-dirs -Wempty-body -Wnested-externs
> >>> -Wformat-security
> >>> > -Wformat-y2k -Winit-self -Wignored-qualifiers -Wold-style-declarati=
on
> >>> > -Wold-style-definition -Wtype-limits -fstack-protector-strong
> >>> >  -I/usr/include/p11-kit-1     -I/usr/include/libpng12  -pthread
> >>> > -I/usr/local/include/spice-server -I/usr/local/include/spice-1
> >>> > -I/usr/include/glib-2.0 -I/usr/lib/aarch64-linux-gnu/
> glib-2.0/include
> >>> > -I/usr/include/pixman-1  -I/usr/include/libusb-1.0
> >>> > LDFLAGS           -Wl,--warn-common -g
> >>> > make              make
> >>> > install           install
> >>> > python            python -B
> >>> > smbd              /usr/sbin/smbd
> >>> > module support    no
> >>> > host CPU          aarch64
> >>> > host big endian   no
> >>> > target list       aarch64-softmmu
> >>> > tcg debug enabled no
> >>> > gprof enabled     no
> >>> > sparse enabled    no
> >>> > strip binaries    yes
> >>> > profiler          no
> >>> > static build      no
> >>> > pixman            system
> >>> > SDL support       yes (1.2.15)
> >>> > GTK support       no
> >>> > GTK GL support    no
> >>> > VTE support       no
> >>> > TLS priority      NORMAL
> >>> > GNUTLS support    yes
> >>> > GNUTLS rnd        yes
> >>> > libgcrypt         no
> >>> > libgcrypt kdf     no
> >>> > nettle            yes (3.3)
> >>> > nettle kdf        yes
> >>> > libtasn1          yes
> >>> > curses support    no
> >>> > virgl support     yes
> >>> > curl support      yes
> >>> > mingw32 support   no
> >>> > Audio drivers     oss
> >>> > Block whitelist (rw)
> >>> > Block whitelist (ro)
> >>> > VirtFS support    yes
> >>> > VNC support       yes
> >>> > VNC SASL support  yes
> >>> > VNC JPEG support  yes
> >>> > VNC PNG support   yes
> >>> > xen support       no
> >>> > brlapi support    yes
> >>> > bluez  support    yes
> >>> > Documentation     yes
> >>> > PIE               no
> >>> > vde support       yes
> >>> > netmap support    no
> >>> > Linux AIO support yes
> >>> > ATTR/XATTR support yes
> >>> > Install blobs     yes
> >>> > KVM support       yes
> >>> > HAX support       no
> >>> > RDMA support      no
> >>> > TCG interpreter   no
> >>> > fdt support       yes
> >>> > preadv support    yes
> >>> > fdatasync         yes
> >>> > madvise           yes
> >>> > posix_madvise     yes
> >>> > libcap-ng support yes
> >>> > vhost-net support yes
> >>> > vhost-scsi support yes
> >>> > vhost-vsock support yes
> >>> > Trace backends    log
> >>> > spice support     yes (0.12.13/0.13.3.311-1b9c-dirty)
> >>> > rbd support       yes
> >>> > xfsctl support    yes
> >>> > smartcard support no
> >>> > libusb            yes
> >>> > usb net redir     yes
> >>> > OpenGL support    no
> >>> > OpenGL dmabufs    no
> >>> > libiscsi support  yes
> >>> > libnfs support    no
> >>> > build guest agent yes
> >>> > QGA VSS support   no
> >>> > QGA w32 disk info no
> >>> > QGA MSI support   no
> >>> > seccomp support   yes
> >>> > coroutine backend ucontext
> >>> > coroutine pool    yes
> >>> > debug stack usage no
> >>> > GlusterFS support no
> >>> > gcov              gcov
> >>> > gcov enabled      no
> >>> > TPM support       yes
> >>> > libssh2 support   yes
> >>> > TPM passthrough   no
> >>> > QOM debugging     yes
> >>> > lzo support       yes
> >>> > snappy support    no
> >>> > bzip2 support     no
> >>> > NUMA host support no
> >>> > tcmalloc support  no
> >>> > jemalloc support  no
> >>> > avx2 optimization no
> >>> > replication support yes
> >>> > VxHS block device no
> >>> >
> >>> > start a vm as follow:
> >>> >
> >>> > qemu-system-aarch64 --enable-kvm --nographic -machine virt --kernel
> >>> > cirros-d161201-aarch64-vmlinuz --initrd cirros-d161201-aarch64-init=
rd
> >>> > --spice port=3D5900,disable-ticketing -cpu host -vga qxl
> >>> >
> >>> > Is there anything I am missing or wrong ?
> >>>
> >>> What error does it give?
> >>>
> >>> Regardless I think -vga is a legacy option for x86. If you want a
> display
> >>> adaptor for an ARM vm machine you'll need to instantiate virtio-gpu
> >>> device and then connect it to your spice display.
> >>>
> >>> --
> >>> Alex Benn=C3=A9e
> >>>
> >>
> >>
> >>
> >> --
> >> Tang Yaguang
> >>
> >>
> >>
> >>
>
>
> --
> Alex Benn=C3=A9e
>



--=20
Tang Yaguang

--001a113c9ba027cef9054f54aed8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This is what I am using:<div><br><div><div>/usr/local/bin/=
qemu-system-aarch64 --enable-kvm --nographic -machine virt --bios /usr/shar=
e/qemu-efi/QEMU_EFI.fd -device virtio-blk-device,drive=3Dimage -drive if=3D=
none,id=3Dimage,file=3Dxenial-server-cloudimg-arm64-uefi1.raw --spice port=
=3D5900,disable-ticketing -cpu host =C2=A0-m 2048 -device virtio-gpu -smp 4=
 -device usb-ehci -device usb-kbd</div></div><div><br></div></div><div>From=
 the console log I see USB device can be recognized in VM , but the issue i=
s when using spice client, only mouse work, can&#39;t input anything. =C2=
=A0</div><div>The qemu version is 2.9 which I compile from source with spic=
e 0.13.3 support.</div></div><div class=3D"gmail_extra"><br><div class=3D"g=
mail_quote">On Fri, May 12, 2017 at 9:15 PM, Alex Benn=C3=A9e <span dir=3D"=
ltr">&lt;<a href=3D"mailto:alex.bennee@linaro.org" target=3D"_blank">alex.b=
ennee@linaro.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><s=
pan class=3D""><br>
Yaguang Tang &lt;<a href=3D"mailto:heut2008@gmail.com">heut2008@gmail.com</=
a>&gt; writes:<br>
<br>
&gt; Hi Alex,<br>
&gt;<br>
&gt; Thanks for your suggestion, I am successfully connect to guest using s=
pice<br>
&gt; with virtio-gpu graphic driver, but the next problem is that can&#39;t=
 use<br>
&gt; keyboard in spice client, when trying to add a usb keyboard<br>
</span>&gt; device to guest, libvirt show&#39;s=C2=A0 =C2=A0*ibvirtError: i=
nternal error: No free USB<br>
&gt; ports,* note that I am adding this usb device using virt-manager . is =
there<br>
<span class=3D"">&gt; any specific to USB device in arm64 ?<br>
<br>
</span>It&#39;s hard to tell without knowing what virt-manager is doing.<br=
>
<br>
However the general thing with the arm64 virt machine is it is fairly<br>
bare by default (compared to a PC which includes a bunch of stuff in its<br=
>
default device model). As a result you need to declare all additional<br>
devices you wish to use.<br>
<br>
There is no particular reason why you shouldn&#39;t be able to instantiate =
a<br>
virtio USB hub for your device although you would want it to be<br>
discover-able so on a virtio-pci bus.<br>
<br>
Can you include you current QEMU command line?<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt;<br>
&gt; On Tue, May 9, 2017 at 6:38 PM, Yaguang Tang &lt;<a href=3D"mailto:heu=
t2008@gmail.com">heut2008@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt;&gt; Qemu shows QXL is not available,=C2=A0 if I use virtio-gpu, does i=
t require<br>
&gt;&gt; specific driver or kernel version in guest ?<br>
&gt;&gt;<br>
&gt;&gt; On Tue, May 9, 2017 at 3:36 PM, Alex Benn=C3=A9e &lt;<a href=3D"ma=
ilto:alex.bennee@linaro.org">alex.bennee@linaro.org</a>&gt;<br>
&gt;&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Yaguang Tang &lt;<a href=3D"mailto:heut2008@gmail.com">heut200=
8@gmail.com</a>&gt; writes:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; &gt; Hi all,<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; I am trying to make openstack work on arm64, when setting=
 spice for VM,<br>
&gt;&gt;&gt; &gt; qemu complains that qxl is not available, my env:<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; qemu 2.8 compiled with the following:<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; ./configure --enable-spice --enable-kvm --target-list=3Da=
arch64-softmmu<br>
&gt;&gt;&gt; &gt; perl: warning: Setting locale failed.<br>
&gt;&gt;&gt; &gt; perl: warning: Please check that your locale settings:<br=
>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LANGUAGE =3D (unset),<br=
>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LC_ALL =3D (unset),<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LANG =3D &quot;en_US.UTF=
-8&quot;<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0are supported and installed on your sy=
stem.<br>
&gt;&gt;&gt; &gt; perl: warning: Falling back to the standard locale (&quot=
;C&quot;).<br>
&gt;&gt;&gt; &gt; Install prefix=C2=A0 =C2=A0 /usr/local<br>
&gt;&gt;&gt; &gt; BIOS directory=C2=A0 =C2=A0 /usr/local/share/qemu<br>
&gt;&gt;&gt; &gt; binary directory=C2=A0 /usr/local/bin<br>
&gt;&gt;&gt; &gt; library directory /usr/local/lib<br>
&gt;&gt;&gt; &gt; module directory=C2=A0 /usr/local/lib/qemu<br>
&gt;&gt;&gt; &gt; libexec directory /usr/local/libexec<br>
&gt;&gt;&gt; &gt; include directory /usr/local/include<br>
&gt;&gt;&gt; &gt; config directory=C2=A0 /usr/local/etc<br>
&gt;&gt;&gt; &gt; local state directory=C2=A0 =C2=A0/usr/local/var<br>
&gt;&gt;&gt; &gt; Manual directory=C2=A0 /usr/local/share/man<br>
&gt;&gt;&gt; &gt; ELF interp prefix /usr/gnemul/qemu-%M<br>
&gt;&gt;&gt; &gt; Source path=C2=A0 =C2=A0 =C2=A0 =C2=A0/home/etos/git/qemu=
<br>
&gt;&gt;&gt; &gt; C compiler=C2=A0 =C2=A0 =C2=A0 =C2=A0 cc<br>
&gt;&gt;&gt; &gt; Host C compiler=C2=A0 =C2=A0cc<br>
&gt;&gt;&gt; &gt; C++ compiler=C2=A0 =C2=A0 =C2=A0 c++<br>
&gt;&gt;&gt; &gt; Objective-C compiler cc<br>
&gt;&gt;&gt; &gt; ARFLAGS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rv<br>
&gt;&gt;&gt; &gt; CFLAGS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -O2 -U_FO=
RTIFY_SOURCE -D_FORTIFY_SOURCE=3D2 -g<br>
&gt;&gt;&gt; &gt; QEMU_CFLAGS=C2=A0 =C2=A0 =C2=A0 =C2=A0-I/usr/include/pixm=
an-1=C2=A0 =C2=A0-Werror<br>
&gt;&gt;&gt; &gt; -DHAS_LIBSSH2_SFTP_FSYNC -pthread -I/usr/include/glib-2.0=
<br>
&gt;&gt;&gt; &gt; -I/usr/lib/aarch64-linux-gnu/<wbr>glib-2.0/include=C2=A0 =
=C2=A0-D_GNU_SOURCE<br>
&gt;&gt;&gt; &gt; -D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE_SOURCE -Wstrict-pro=
totypes<br>
&gt;&gt;&gt; &gt; -Wredundant-decls -Wall -Wundef -Wwrite-strings -Wmissing=
-prototypes<br>
&gt;&gt;&gt; &gt; -fno-strict-aliasing -fno-common -fwrapv=C2=A0 -Wendif-la=
bels<br>
&gt;&gt;&gt; &gt; -Wno-missing-include-dirs -Wempty-body -Wnested-externs<b=
r>
&gt;&gt;&gt; -Wformat-security<br>
&gt;&gt;&gt; &gt; -Wformat-y2k -Winit-self -Wignored-qualifiers -Wold-style=
-declaration<br>
&gt;&gt;&gt; &gt; -Wold-style-definition -Wtype-limits -fstack-protector-st=
rong<br>
&gt;&gt;&gt; &gt;=C2=A0 -I/usr/include/p11-kit-1=C2=A0 =C2=A0 =C2=A0-I/usr/=
include/libpng12=C2=A0 -pthread<br>
&gt;&gt;&gt; &gt; -I/usr/local/include/spice-<wbr>server -I/usr/local/inclu=
de/spice-1<br>
&gt;&gt;&gt; &gt; -I/usr/include/glib-2.0 -I/usr/lib/aarch64-linux-gnu/<wbr=
>glib-2.0/include<br>
&gt;&gt;&gt; &gt; -I/usr/include/pixman-1=C2=A0 -I/usr/include/libusb-1.0<b=
r>
&gt;&gt;&gt; &gt; LDFLAGS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Wl,--war=
n-common -g<br>
&gt;&gt;&gt; &gt; make=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 make=
<br>
&gt;&gt;&gt; &gt; install=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install<b=
r>
&gt;&gt;&gt; &gt; python=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 python -B=
<br>
&gt;&gt;&gt; &gt; smbd=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /usr=
/sbin/smbd<br>
&gt;&gt;&gt; &gt; module support=C2=A0 =C2=A0 no<br>
&gt;&gt;&gt; &gt; host CPU=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 aarch64<br>
&gt;&gt;&gt; &gt; host big endian=C2=A0 =C2=A0no<br>
&gt;&gt;&gt; &gt; target list=C2=A0 =C2=A0 =C2=A0 =C2=A0aarch64-softmmu<br>
&gt;&gt;&gt; &gt; tcg debug enabled no<br>
&gt;&gt;&gt; &gt; gprof enabled=C2=A0 =C2=A0 =C2=A0no<br>
&gt;&gt;&gt; &gt; sparse enabled=C2=A0 =C2=A0 no<br>
&gt;&gt;&gt; &gt; strip binaries=C2=A0 =C2=A0 yes<br>
&gt;&gt;&gt; &gt; profiler=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 no<br>
&gt;&gt;&gt; &gt; static build=C2=A0 =C2=A0 =C2=A0 no<br>
&gt;&gt;&gt; &gt; pixman=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 system<br=
>
&gt;&gt;&gt; &gt; SDL support=C2=A0 =C2=A0 =C2=A0 =C2=A0yes (1.2.15)<br>
&gt;&gt;&gt; &gt; GTK support=C2=A0 =C2=A0 =C2=A0 =C2=A0no<br>
&gt;&gt;&gt; &gt; GTK GL support=C2=A0 =C2=A0 no<br>
&gt;&gt;&gt; &gt; VTE support=C2=A0 =C2=A0 =C2=A0 =C2=A0no<br>
&gt;&gt;&gt; &gt; TLS priority=C2=A0 =C2=A0 =C2=A0 NORMAL<br>
&gt;&gt;&gt; &gt; GNUTLS support=C2=A0 =C2=A0 yes<br>
&gt;&gt;&gt; &gt; GNUTLS rnd=C2=A0 =C2=A0 =C2=A0 =C2=A0 yes<br>
&gt;&gt;&gt; &gt; libgcrypt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0no<br>
&gt;&gt;&gt; &gt; libgcrypt kdf=C2=A0 =C2=A0 =C2=A0no<br>
&gt;&gt;&gt; &gt; nettle=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 yes (3.3)=
<br>
&gt;&gt;&gt; &gt; nettle kdf=C2=A0 =C2=A0 =C2=A0 =C2=A0 yes<br>
&gt;&gt;&gt; &gt; libtasn1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 yes<br>
&gt;&gt;&gt; &gt; curses support=C2=A0 =C2=A0 no<br>
&gt;&gt;&gt; &gt; virgl support=C2=A0 =C2=A0 =C2=A0yes<br>
&gt;&gt;&gt; &gt; curl support=C2=A0 =C2=A0 =C2=A0 yes<br>
&gt;&gt;&gt; &gt; mingw32 support=C2=A0 =C2=A0no<br>
&gt;&gt;&gt; &gt; Audio drivers=C2=A0 =C2=A0 =C2=A0oss<br>
&gt;&gt;&gt; &gt; Block whitelist (rw)<br>
&gt;&gt;&gt; &gt; Block whitelist (ro)<br>
&gt;&gt;&gt; &gt; VirtFS support=C2=A0 =C2=A0 yes<br>
&gt;&gt;&gt; &gt; VNC support=C2=A0 =C2=A0 =C2=A0 =C2=A0yes<br>
&gt;&gt;&gt; &gt; VNC SASL support=C2=A0 yes<br>
&gt;&gt;&gt; &gt; VNC JPEG support=C2=A0 yes<br>
&gt;&gt;&gt; &gt; VNC PNG support=C2=A0 =C2=A0yes<br>
&gt;&gt;&gt; &gt; xen support=C2=A0 =C2=A0 =C2=A0 =C2=A0no<br>
&gt;&gt;&gt; &gt; brlapi support=C2=A0 =C2=A0 yes<br>
&gt;&gt;&gt; &gt; bluez=C2=A0 support=C2=A0 =C2=A0 yes<br>
&gt;&gt;&gt; &gt; Documentation=C2=A0 =C2=A0 =C2=A0yes<br>
&gt;&gt;&gt; &gt; PIE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0no<br>
&gt;&gt;&gt; &gt; vde support=C2=A0 =C2=A0 =C2=A0 =C2=A0yes<br>
&gt;&gt;&gt; &gt; netmap support=C2=A0 =C2=A0 no<br>
&gt;&gt;&gt; &gt; Linux AIO support yes<br>
&gt;&gt;&gt; &gt; ATTR/XATTR support yes<br>
&gt;&gt;&gt; &gt; Install blobs=C2=A0 =C2=A0 =C2=A0yes<br>
&gt;&gt;&gt; &gt; KVM support=C2=A0 =C2=A0 =C2=A0 =C2=A0yes<br>
&gt;&gt;&gt; &gt; HAX support=C2=A0 =C2=A0 =C2=A0 =C2=A0no<br>
&gt;&gt;&gt; &gt; RDMA support=C2=A0 =C2=A0 =C2=A0 no<br>
&gt;&gt;&gt; &gt; TCG interpreter=C2=A0 =C2=A0no<br>
&gt;&gt;&gt; &gt; fdt support=C2=A0 =C2=A0 =C2=A0 =C2=A0yes<br>
&gt;&gt;&gt; &gt; preadv support=C2=A0 =C2=A0 yes<br>
&gt;&gt;&gt; &gt; fdatasync=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0yes<br>
&gt;&gt;&gt; &gt; madvise=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0yes<br>
&gt;&gt;&gt; &gt; posix_madvise=C2=A0 =C2=A0 =C2=A0yes<br>
&gt;&gt;&gt; &gt; libcap-ng support yes<br>
&gt;&gt;&gt; &gt; vhost-net support yes<br>
&gt;&gt;&gt; &gt; vhost-scsi support yes<br>
&gt;&gt;&gt; &gt; vhost-vsock support yes<br>
&gt;&gt;&gt; &gt; Trace backends=C2=A0 =C2=A0 log<br>
&gt;&gt;&gt; &gt; spice support=C2=A0 =C2=A0 =C2=A0yes (0.12.13/0.13.3.311-=
1b9c-<wbr>dirty)<br>
&gt;&gt;&gt; &gt; rbd support=C2=A0 =C2=A0 =C2=A0 =C2=A0yes<br>
&gt;&gt;&gt; &gt; xfsctl support=C2=A0 =C2=A0 yes<br>
&gt;&gt;&gt; &gt; smartcard support no<br>
&gt;&gt;&gt; &gt; libusb=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 yes<br>
&gt;&gt;&gt; &gt; usb net redir=C2=A0 =C2=A0 =C2=A0yes<br>
&gt;&gt;&gt; &gt; OpenGL support=C2=A0 =C2=A0 no<br>
&gt;&gt;&gt; &gt; OpenGL dmabufs=C2=A0 =C2=A0 no<br>
&gt;&gt;&gt; &gt; libiscsi support=C2=A0 yes<br>
&gt;&gt;&gt; &gt; libnfs support=C2=A0 =C2=A0 no<br>
&gt;&gt;&gt; &gt; build guest agent yes<br>
&gt;&gt;&gt; &gt; QGA VSS support=C2=A0 =C2=A0no<br>
&gt;&gt;&gt; &gt; QGA w32 disk info no<br>
&gt;&gt;&gt; &gt; QGA MSI support=C2=A0 =C2=A0no<br>
&gt;&gt;&gt; &gt; seccomp support=C2=A0 =C2=A0yes<br>
&gt;&gt;&gt; &gt; coroutine backend ucontext<br>
&gt;&gt;&gt; &gt; coroutine pool=C2=A0 =C2=A0 yes<br>
&gt;&gt;&gt; &gt; debug stack usage no<br>
&gt;&gt;&gt; &gt; GlusterFS support no<br>
&gt;&gt;&gt; &gt; gcov=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gcov=
<br>
&gt;&gt;&gt; &gt; gcov enabled=C2=A0 =C2=A0 =C2=A0 no<br>
&gt;&gt;&gt; &gt; TPM support=C2=A0 =C2=A0 =C2=A0 =C2=A0yes<br>
&gt;&gt;&gt; &gt; libssh2 support=C2=A0 =C2=A0yes<br>
&gt;&gt;&gt; &gt; TPM passthrough=C2=A0 =C2=A0no<br>
&gt;&gt;&gt; &gt; QOM debugging=C2=A0 =C2=A0 =C2=A0yes<br>
&gt;&gt;&gt; &gt; lzo support=C2=A0 =C2=A0 =C2=A0 =C2=A0yes<br>
&gt;&gt;&gt; &gt; snappy support=C2=A0 =C2=A0 no<br>
&gt;&gt;&gt; &gt; bzip2 support=C2=A0 =C2=A0 =C2=A0no<br>
&gt;&gt;&gt; &gt; NUMA host support no<br>
&gt;&gt;&gt; &gt; tcmalloc support=C2=A0 no<br>
&gt;&gt;&gt; &gt; jemalloc support=C2=A0 no<br>
&gt;&gt;&gt; &gt; avx2 optimization no<br>
&gt;&gt;&gt; &gt; replication support yes<br>
&gt;&gt;&gt; &gt; VxHS block device no<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; start a vm as follow:<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; qemu-system-aarch64 --enable-kvm --nographic -machine vir=
t --kernel<br>
&gt;&gt;&gt; &gt; cirros-d161201-aarch64-vmlinuz --initrd cirros-d161201-aa=
rch64-initrd<br>
&gt;&gt;&gt; &gt; --spice port=3D5900,disable-ticketing -cpu host -vga qxl<=
br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; Is there anything I am missing or wrong ?<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; What error does it give?<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Regardless I think -vga is a legacy option for x86. If you wan=
t a display<br>
&gt;&gt;&gt; adaptor for an ARM vm machine you&#39;ll need to instantiate v=
irtio-gpu<br>
&gt;&gt;&gt; device and then connect it to your spice display.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; --<br>
&gt;&gt;&gt; Alex Benn=C3=A9e<br>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; Tang Yaguang<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
<br>
<br>
--<br>
</div></div><span class=3D"HOEnZb"><font color=3D"#888888">Alex Benn=C3=A9e=
<br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div di=
r=3D"ltr"><div>Tang Yaguang</div><div><br></div><br><div>=C2=A0</div></div>=
</div>
</div>

--001a113c9ba027cef9054f54aed8--
