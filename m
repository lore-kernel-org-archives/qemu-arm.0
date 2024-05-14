Received: by 2002:a17:907:90c2:b0:a52:4db9:938b with SMTP id gk2csp2734019ejb;
        Tue, 14 May 2024 01:35:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW/m7Z2EsaXD/GF4jbWkE/5kPosEebK3BjgHrr1pWZB+ezxx9YNzBNKps8Ervxi3alP3u6O+E/F6L6Vzh2gkBubRbrz7RYg
X-Google-Smtp-Source: AGHT+IHS1WZRXTNIFWo1CbaTLJycnF908EWpSbbNqEuL+0VwqkGj6dgDnalZVR9adYmWth9zcZH4
X-Received: by 2002:a05:620a:8324:b0:792:bd36:c380 with SMTP id af79cd13be357-792c75fd8bcmr1295959385a.74.1715675757374;
        Tue, 14 May 2024 01:35:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715675757; cv=none;
        d=google.com; s=arc-20160816;
        b=OAIEiD2eLVm/Rpm9zMpbjHSB93vtYtt7v/Zdb4gyFMvJfiPlpWS6OjhELTIdH0x4Bs
         epeSfDnwGn8ZXBe4XigG/lhagyrtS3G/Ui3h8iI0j4mdZdfTtdm9Exn+knPaAt6X+/Kx
         3V9GngEC56weUlFMp3mubWGpawbYrKKWyP+pvKhTPFHdqjCpsacrIMmthC8Wu9xOuXPr
         tOZ09Ujn9GGvxlnYL6tgO9z9N61Bnt2C6EWm3RnjEBuDYC8mvdq5AMJBjChpaK85TXSd
         fYst6/RuA8wDA8k71DIjSNwuMOZYpI9eJw+QEeModHzmHluBOxYECZJHJHeAjv5X5SZn
         K/hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AnlROpjDSQzRrmp9qjX+7oIcV7qUOHE9hyaRPIMZ4mU=;
        fh=dj5OtBvg7kkId8pxOPiIT/+1qW4xeXasyZqzNpAmPqo=;
        b=tx3gdxdFiUa6ByvA/s8eXzhQYKRMOL0S19dr47DaNJq8kYCQpmWppVnYJO/kAzrHWP
         5O7KvZ6jI4DGpDcazPmf3F498UjFf0reKiAdneePNiiCPxmQBfL0mNPd8vgFjpVCOQeE
         7peuTkAozV5Lm5Dd36VmP/gxMqGTXWoqL039RitQOIslN83gBoEXAx29MZW38WN2/ejs
         vIEhCnKUqMNpcdQkd/mo56BqNvzYcc7JeDwSiHZH3eZbHGxUc3fe+vD1NhojbgnYSx7j
         xN93OAh6KL/HOT+fpMdlVw/WKwxPzSsX4vF6nJhuFHWHqB4MYGlOHlpOlryNN7wD/vN4
         zqJw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=O+uXtdj1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-792bf36260bsi1267867985a.567.2024.05.14.01.35.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 May 2024 01:35:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=O+uXtdj1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s6ndU-0005RP-T3; Tue, 14 May 2024 04:35:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <krishna125g@gmail.com>)
 id 1s6ndJ-0005PC-PR
 for qemu-arm@nongnu.org; Tue, 14 May 2024 04:35:39 -0400
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <krishna125g@gmail.com>)
 id 1s6ndH-0003gV-Fk
 for qemu-arm@nongnu.org; Tue, 14 May 2024 04:35:37 -0400
Received: by mail-ot1-x330.google.com with SMTP id
 46e09a7af769-6f0f252db4dso1982688a34.0
 for <qemu-arm@nongnu.org>; Tue, 14 May 2024 01:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715675733; x=1716280533; darn=nongnu.org;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AnlROpjDSQzRrmp9qjX+7oIcV7qUOHE9hyaRPIMZ4mU=;
 b=O+uXtdj1/fXrI0H+TagQwEVgXGMgI02ueIioy1O8ag68oXzx5+UpHqkAGtpAJ4afy6
 Djw9qzGWsRhcNy0L+/LkBUOoFC/J7BGh2+IueNqNNNZg1Mh0zpKLgJXZ2QSCSPzutiYk
 UriTExJYm4i2QF5Q12bJIhfVmLtyaXftiONeTt73W4ttnj19qfDpAhRLh4qptvbL3rQX
 RfeXFuMp2BvDWaR1zW/0FRd53SliskpAT6bHjGeJdrj4U+3nvjnc8KJMTTCg/FdYw9uq
 1h3mWKOzbJ+NdE2TOXeXuVgCjtjhzsoTAsOouBZx+XMlVJOOOGTjynFHLHQvohZeFY5s
 1idQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715675733; x=1716280533;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AnlROpjDSQzRrmp9qjX+7oIcV7qUOHE9hyaRPIMZ4mU=;
 b=Y4XYi9FDQX6aidfMtNmYujg7qh/XBEI7zjpjjs/NhUN3v9g/qcvUz55pyjanVudoBL
 xeIaryPp1PMA9UlE7sCXvLlJ1yprIDlFC6tT6rLn8eK8DVjFRuuV+UcOKoX15PZu9Z+v
 DaePlJ3YDBunaTSyp/BIlMVkJxqzWjylCKEKq0Q/a1S7rpWX78LcGgobf6HoCXCwXFXZ
 F/X0jIX1buEAx8woqyKmnh7p+HXzJxWPOsnxUwU18smLjnrytWPfcGUtTpg3NilNfkXj
 Id2+RfUOQreUNhU5EW9nl39aYsVX/h/PGPKOeye0C7PoYy4h0LCtXWdJQ7GhVppqGLNu
 a4rQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8sk09sitXpot+s7MTVBGXrT5BUHj89T0MsCB61hxiW1sAyofN8EguW+tWo1/PEhrXmogUgiQsPyRNjWA6EW2TUR9V
X-Gm-Message-State: AOJu0Yy1t5BuoUgrRIHVTaDcdTC1aI1IwQ37Nl9rbPFA1q3HFDYezi58
 VqlowQEYdMdabuDi1KyrQqa4gy5sUtGi9oAzG5lhVBdk43BsxJqu7OaCgXYeXLGjoB7H1I9g1be
 pRh9nDIZHLGlBJKe2fbstJ4yQ6Uw=
X-Received: by 2002:a05:6870:b149:b0:23d:8e24:7234 with SMTP id
 586e51a60fabf-24172fb6251mr15467323fac.54.1715675732820; Tue, 14 May 2024
 01:35:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAH9tv=PKi3B44y4+gvTa9CpJHNN4UAeyvgxFwXCjUVM3Qy=ppA@mail.gmail.com>
 <CAFEAcA_LH+vKxn3pdzfua_1+Piy4rQECq3yh66f_O+YuTxfnRw@mail.gmail.com>
 <CAH9tv=MSO2ooq=8Vt63uWCNV3sWMkZC2DihLvUkbpeOhYphkDg@mail.gmail.com>
In-Reply-To: <CAH9tv=MSO2ooq=8Vt63uWCNV3sWMkZC2DihLvUkbpeOhYphkDg@mail.gmail.com>
From: Krishna Gururaj <krishna125g@gmail.com>
Date: Tue, 14 May 2024 14:05:21 +0530
Message-ID: <CAH9tv=Po6SJ52-A3no6TZe2humHwiXdm1vFiBhmw5_QWNxT4MA@mail.gmail.com>
Subject: Fwd: QNX in qemu
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000009acb08061865e2c5"
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=krishna125g@gmail.com; helo=mail-ot1-x330.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URI_NOVOWEL=0.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: VtbS1Y3QRfZJ

--0000000000009acb08061865e2c5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

---------- Forwarded message ---------
From: Krishna Gururaj <krishna125g@gmail.com>
Date: Fri, May 3, 2024 at 3:14=E2=80=AFPM
Subject: Re: QNX in qemu
To: <qemu-arm@nongnu.org>


Hello,

     Firstly thank you for the response. Now when I remove the -nographic
option a gtk screen opens and it displays that ' Guest has not initialized
the display (yet) and in the log I see this : (qemu:15068): Gtk-WARNING **:
10:54:03.341: Could not load a pixbuf from icon theme.This may indicate
that pixbuf loaders or the mime database could not be found.

QNX is not getting loaded when I remove this option.


I think the below logs might help you help me better :

I get this when I run this command 'qemu-system-aarch64.exe -machine
vexpress-a15 -cpu cortex-a57 -smp 4 -m 30G -kernel ifs.bin -drive
file=3Ddisk-qemu.vmdk,if=3Dnone,id=3Ddrv0 -device virtio-blk-device,drive=
=3Ddrv0
-netdev tap,id=3Dmynet0,ifname=3DTAP_Ethernet,script=3Dno,downscript=3Dno -=
device
virtio-net-device,netdev=3Dmynet0,mac=3D52:55:00:d1:55:01 -device
virtio-rng-device -nographic'

---> Starting slogger2
---> Starting PCI Services
---> Starting devb
Path=3D0 -
 target=3D0 lun=3D0     Direct-Access(0) - VIRTIO  Rev:
---> Mounting file systems
---> Mounting file systems
=E2=97=84---> Starting Networking
# net.inet.icmp.bmcastecho: 0 -> 1
qnx.kern.droproot: 0 -> 1
---> Starting sshd
---> Starting misc
-U deprecated, use security policies.
pps: NOTICE: PPS initializing
pps: NOTICE: PPS attaching /pps
pps: NOTICE: PPS attached /pps major 2 minor 6
---> Starting graphics
io_hid_dlopen, devh-ps2ser-vm.so DLL Error Library cannot be found
libkhronos: dlopen() err No valid library found, path:
'/system/graphics/vmwgfx-drm/libwfdcfg-vmwgfx-generic.so'
libkhronos: dlopen() err Library cannot be found, path:
'libwfdcfg-vmwgfx-generic.so'
libkhronos: Ensure directory containing graphics libraries is appended to
LD_LIBRARY_PATH envar.
*Unable to access /dev/screen *
Process count: 26
Startup complete
QNX noname 7.1.0 2020/06/13-20:07:59EDT ARMv8_Foundation_Model aarch64le


I am configuring the screen with the follwoing command after boot up :

screen -c /system/lib/graphics/swiftshader/graphics.conf


graphics.conf :

begin khronos
  begin egl display 1
    vk-icds =3D vk_swiftshader_icd.json
    egl-dlls =3D libEGL_Angle.so
    glesv2-dlls =3D libGLESv2_Angle.so
  end egl display

  begin wfd device 1
    pipeline-ids =3D 1
    display-ids =3D 1
    wfd-dlls =3D libwfdcfg-sample.so libWFDdummy.so
  end wfd device
end khronos

begin winmgr
  begin globals
    default-display =3D 1
    alloc-config =3D stdbuf
    stack-size =3D 65536
    blit-config =3D sw
    input =3D keyboard,mouse
    requests-logsize =3D 65536
    blits-logsize =3D 4096
  end globals

  begin display 1
   formats =3D rgba8888
   force-composition =3D true
   video-mode =3D 1920 x 1080 @ 60
   stack-size =3D 65536
  end display

  begin class framebuffer1
    display =3D 1
    pipeline =3D 1
    format =3D rgba8888
    usage =3D sw
  end class

end winmgr


Thank You,
Krishna G.



Regards,
Krishna Gururaj.

On Mon, Apr 29, 2024 at 8:56=E2=80=AFPM Peter Maydell <peter.maydell@linaro=
.org>
wrote:

> On Mon, 29 Apr 2024 at 13:26, Krishna Gururaj <krishna125g@gmail.com>
> wrote:
> >
> > Hello,
> >
> > I am trying to run the gles2-gears binary in qnx with the following
> configuration :
> >
> > qemu-system-aarch64.exe -machine vexpress-a15 -cpu cortex-a57 -smp 4 -m
> 30G -kernel ifs.bin -drive file=3Ddisk-qemu.vmdk,if=3Dnone,id=3Ddrv0 -dev=
ice
> virtio-blk-device,drive=3Ddrv0 -netdev
> tap,id=3Dmynet0,ifname=3DTAP_Ethernet,script=3Dno,downscript=3Dno -device
> virtio-net-device,netdev=3Dmynet0,mac=3D52:55:00:d1:55:01 -device
> virtio-rng-device -nographic
>
> This command line is not correct, because it takes a machine
> that is only supposed to work with a Cortex-A15 ("vexpress-a15")
> and tries to create a Cortex-A57 CPU with it. This will either
> ignore the -cpu option or create something weird and unsupported,
> I forget which. You should either fix the machine type or the
> CPU type.
>
> That's unrelated to your graphics question -- the answer there
> is that you say "-nographic" which means "I don't want to see
> a GUI window". If you do that then you obviously won't see any
> graphics. (Beyond that, the guest OS will need to have support
> for whatever graphics device/framebuffer the machine provides.)
>
> thanks
> -- PMM
>

--0000000000009acb08061865e2c5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">---------- Forwarded message ---------<br>From: <strong cla=
ss=3D"gmail_sendername" dir=3D"auto">Krishna Gururaj</strong> <span dir=3D"=
auto">&lt;<a href=3D"mailto:krishna125g@gmail.com">krishna125g@gmail.com</a=
>&gt;</span><br>Date: Fri, May 3, 2024 at 3:14=E2=80=AFPM<br>Subject: Re: Q=
NX in qemu<br>To:  &lt;<a href=3D"mailto:qemu-arm@nongnu.org">qemu-arm@nong=
nu.org</a>&gt;<br></div><br><br><div dir=3D"ltr">Hello,<br><br>=C2=A0 =C2=
=A0 =C2=A0Firstly thank you for the response. Now when I remove the -nograp=
hic option a gtk screen opens and it displays that &#39; Guest has not init=
ialized the display (yet) and in the log I see this : (qemu:15068): Gtk-WAR=
NING **: 10:54:03.341: Could not load a pixbuf from icon theme.This may ind=
icate that pixbuf loaders or the mime database could not be found.=C2=A0<br=
><br>QNX is not getting loaded when I remove this option.<br><br><br>I thin=
k the below logs might help you help me better :<br><br>I get this when I r=
un this command &#39;qemu-system-aarch64.exe -machine vexpress-a15 -cpu cor=
tex-a57 -smp 4 -m 30G -kernel ifs.bin -drive file=3Ddisk-qemu.vmdk,if=3Dnon=
e,id=3Ddrv0 -device virtio-blk-device,drive=3Ddrv0 -netdev tap,id=3Dmynet0,=
ifname=3DTAP_Ethernet,script=3Dno,downscript=3Dno -device virtio-net-device=
,netdev=3Dmynet0,mac=3D52:55:00:d1:55:01 -device virtio-rng-device -nograph=
ic&#39;<br><br>---&gt; Starting slogger2<br>---&gt; Starting PCI Services<b=
r>---&gt; Starting devb<br>Path=3D0 -<br>=C2=A0target=3D0 lun=3D0 =C2=A0 =
=C2=A0 Direct-Access(0) - VIRTIO =C2=A0Rev:<br>---&gt; Mounting file system=
s<br>---&gt; Mounting file systems<br>=E2=97=84---&gt; Starting Networking<=
br># net.inet.icmp.bmcastecho: 0 -&gt; 1<br>qnx.kern.droproot: 0 -&gt; 1<br=
>---&gt; Starting sshd<br>---&gt; Starting misc<br>-U deprecated, use secur=
ity policies.<br>pps: NOTICE: PPS initializing<br>pps: NOTICE: PPS attachin=
g /pps<br>pps: NOTICE: PPS attached /pps major 2 minor 6<br>---&gt; Startin=
g graphics<br>io_hid_dlopen, devh-ps2ser-vm.so DLL Error Library cannot be =
found<br>libkhronos: dlopen() err No valid library found, path: &#39;/syste=
m/graphics/vmwgfx-drm/libwfdcfg-vmwgfx-generic.so&#39;<br>libkhronos: dlope=
n() err Library cannot be found, path: &#39;libwfdcfg-vmwgfx-generic.so&#39=
;<br>libkhronos: Ensure directory containing graphics libraries is appended=
 to LD_LIBRARY_PATH envar.<br><b>Unable to access /dev/screen=C2=A0</b><br>=
Process count: 26<br>Startup complete<br>QNX noname 7.1.0 2020/06/13-20:07:=
59EDT ARMv8_Foundation_Model aarch64le<div><br></div><div><br></div><div>I =
am configuring the screen with the follwoing command after boot up :=C2=A0<=
/div><div><br></div><div>screen -c /system/lib/graphics/swiftshader/graphic=
s.conf<br><br><br>graphics.conf :<br><br>begin khronos<br>=C2=A0 begin egl =
display 1<br>=C2=A0 =C2=A0 vk-icds =3D vk_swiftshader_icd.json<br>=C2=A0 =
=C2=A0 egl-dlls =3D libEGL_Angle.so<br>=C2=A0 =C2=A0 glesv2-dlls =3D libGLE=
Sv2_Angle.so<br>=C2=A0 end egl display<br><br>=C2=A0 begin wfd device 1<br>=
=C2=A0 =C2=A0 pipeline-ids =3D 1<br>=C2=A0 =C2=A0 display-ids =3D 1<br>=C2=
=A0 =C2=A0 wfd-dlls =3D libwfdcfg-sample.so libWFDdummy.so<br>=C2=A0 end wf=
d device<br>end khronos<br><br>begin winmgr<br>=C2=A0 begin globals<br>=C2=
=A0 =C2=A0 default-display =3D 1<br>=C2=A0 =C2=A0 alloc-config =3D stdbuf<b=
r>=C2=A0 =C2=A0 stack-size =3D 65536<br>=C2=A0 =C2=A0 blit-config =3D sw<br=
>=C2=A0 =C2=A0 input =3D keyboard,mouse<br>=C2=A0 =C2=A0 requests-logsize =
=3D 65536<br>=C2=A0 =C2=A0 blits-logsize =3D 4096<br>=C2=A0 end globals<br>=
<br>=C2=A0 begin display 1<br>=C2=A0 =C2=A0formats =3D rgba8888<br>=C2=A0 =
=C2=A0force-composition =3D true<br>=C2=A0 =C2=A0video-mode =3D 1920 x 1080=
 @ 60<br>=C2=A0 =C2=A0stack-size =3D 65536<br>=C2=A0 end display<br><br>=C2=
=A0 begin class framebuffer1<br>=C2=A0 =C2=A0 display =3D 1<br>=C2=A0 =C2=
=A0 pipeline =3D 1<br>=C2=A0 =C2=A0 format =3D rgba8888<br>=C2=A0 =C2=A0 us=
age =3D sw<br>=C2=A0 end class<br><br>end winmgr<br><br><br>Thank You,=C2=
=A0<br>Krishna G.</div><br><br><br>Regards,<br>Krishna Gururaj.<br></div><b=
r><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, =
Apr 29, 2024 at 8:56=E2=80=AFPM Peter Maydell &lt;<a href=3D"mailto:peter.m=
aydell@linaro.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon, 29 Apr=
 2024 at 13:26, Krishna Gururaj &lt;<a href=3D"mailto:krishna125g@gmail.com=
" target=3D"_blank">krishna125g@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hello,<br>
&gt;<br>
&gt; I am trying to run the gles2-gears binary in qnx with the following co=
nfiguration :<br>
&gt;<br>
&gt; qemu-system-aarch64.exe -machine vexpress-a15 -cpu cortex-a57 -smp 4 -=
m 30G -kernel ifs.bin -drive file=3Ddisk-qemu.vmdk,if=3Dnone,id=3Ddrv0 -dev=
ice virtio-blk-device,drive=3Ddrv0 -netdev tap,id=3Dmynet0,ifname=3DTAP_Eth=
ernet,script=3Dno,downscript=3Dno -device virtio-net-device,netdev=3Dmynet0=
,mac=3D52:55:00:d1:55:01 -device virtio-rng-device -nographic<br>
<br>
This command line is not correct, because it takes a machine<br>
that is only supposed to work with a Cortex-A15 (&quot;vexpress-a15&quot;)<=
br>
and tries to create a Cortex-A57 CPU with it. This will either<br>
ignore the -cpu option or create something weird and unsupported,<br>
I forget which. You should either fix the machine type or the<br>
CPU type.<br>
<br>
That&#39;s unrelated to your graphics question -- the answer there<br>
is that you say &quot;-nographic&quot; which means &quot;I don&#39;t want t=
o see<br>
a GUI window&quot;. If you do that then you obviously won&#39;t see any<br>
graphics. (Beyond that, the guest OS will need to have support<br>
for whatever graphics device/framebuffer the machine provides.)<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div>
</div></div>

--0000000000009acb08061865e2c5--
