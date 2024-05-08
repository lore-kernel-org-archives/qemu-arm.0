Received: by 2002:a17:907:a184:b0:a52:4db9:938b with SMTP id om4csp422820ejc;
        Wed, 8 May 2024 03:44:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXG9JXAnskm6ajQYKWbI7Ep0t9t5u4o3quglOgQSJa+Uo8fETJGjw+h8freKZIhwFNZtzmZ7RcQ7EZzK0BC9YXFfBnLTVoV
X-Google-Smtp-Source: AGHT+IG+hW5moR9eUra9J+EEnAsHYc/pvuKtflc0pO9s90/z4DQkG7IUITjcRqWn9mkUwrNBdFnr
X-Received: by 2002:aca:d0c:0:b0:3c9:70eb:151b with SMTP id 5614622812f47-3c98532b4d3mr1988439b6e.59.1715165084720;
        Wed, 08 May 2024 03:44:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715165084; cv=none;
        d=google.com; s=arc-20160816;
        b=TMHKST/WaF21wjyvDKHcBiuEQi27HaWX8X3Mi57Xpzq5NCXviwEVgA7+p6PanKw+Lh
         O9sMlP14cOmMMHmFhY+T+IsJhnXcxedRKzpaE3BnVw307r44ZsUnMwSKp7FeJuUdpxjG
         hunbdA9+FfvBsWeEqqsyMKTbbIA0g0gPd5PZc0wViP6BxYr13eKg6UBR2uqtjShnvoyV
         xVsam/3u236c5E8V5JPCKcB6gzfxVse0K0JcXKTQs3iyXcQQ0/5U56U2LhinUTJ5I66b
         EJuU0pdJ3F3pa7y/7Lok0OJwxytTB4zKQnoq4jPDiywQ4+uvTclQQQF66rCbzntqINhl
         xhlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9jCfZWkikmWHI0s9Ue+82jVPJC4r8U7IlxASku5WFnI=;
        fh=DBwo5oYV+Zl89FPcGyBzo6mnqwnGCoM6YpiQGc4/RNc=;
        b=C5TrN4va/8X4gUu74dVHU7CimxCq66ftm1ya3V4ZK8OplnBOoiWBkHVk4RQ8QHZ+8y
         NsQkElJSN5Z8y6Lme+hZmaSSzdsdUbGwg9LVkr/wB78fa4ADGr9MNAIhK+FLXzbOOYP1
         kS+NhoqE47k+qye9z8M31aobTCv3vUflrdsYe2qGDZzsbi/QvoNuRwT8g3k3U+SyN2ru
         NwHMqUq67b09OFIRVqs3CBA1LscuVVgmmkxUca2x5qYHbkk+3xg951EpvrfM0pJ3O6El
         /ayfdw6vw9oRcDQeopjlmURetGn5XSzvpcFqaZWymoD/v0HffiekqzNTabDUKM9jOcRM
         OWwQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=PHrUmkBg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p14-20020ad45f4e000000b006a0b36af784si13735048qvg.488.2024.05.08.03.44.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 May 2024 03:44:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=PHrUmkBg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s4emf-0004wn-7u; Wed, 08 May 2024 06:44:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <krishna125g@gmail.com>)
 id 1s4emd-0004we-Lm
 for qemu-arm@nongnu.org; Wed, 08 May 2024 06:44:23 -0400
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <krishna125g@gmail.com>)
 id 1s4emb-0008Gk-3A
 for qemu-arm@nongnu.org; Wed, 08 May 2024 06:44:23 -0400
Received: by mail-oi1-x234.google.com with SMTP id
 5614622812f47-3c96c096a32so1843685b6e.1
 for <qemu-arm@nongnu.org>; Wed, 08 May 2024 03:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715165059; x=1715769859; darn=nongnu.org;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9jCfZWkikmWHI0s9Ue+82jVPJC4r8U7IlxASku5WFnI=;
 b=PHrUmkBg226KzQnNltQTNy2gV3yu9PX8UFT7ucVL40Zx2rrEK1E183PTaES7Jw2AGF
 adKrhgr25MDO7aEFaohutBKeW08NU4cHUul4tUhCzCgVjbUYC5JsRYJtHfNRLVNbRwAx
 ObQxKisCF/1bjqTi0pFtxTLya0nXrJqEt3uOv640rwJKIXJOjKdlWD+YGTEmRCkaKhSz
 rDhhKEOi7RQoe91og3iOg0+eNWZKWC7+rbQUOwzcyPpxtme0UviWXnhvqOnV9BIjApc0
 q7cc7yJK0sEcD30heI6266ufOhUBS1/iCr+vmYJC8ZUlInBRp250L7CHm3jU5xkMX/8z
 eLWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715165059; x=1715769859;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9jCfZWkikmWHI0s9Ue+82jVPJC4r8U7IlxASku5WFnI=;
 b=cvga8FriUUW8JG3EO4xlsbzZSK8zyAVUGYC+h7XPQPnqapWrnYXsFaH9pEPBB5t0JM
 GuZb4dXPU0TlIbQ1DlSHXjX8qWvxQrQNEhqgmRPONiyaVbxBF3XEawSuWj4LeODCm08u
 bvTYTNtUynPWQs2ppvIVW/QtkfFCgbq0bJU+MsnUR2BBl3FvzaMceip4P5MohjRRFq3t
 mCSCj63EsiG2MpPFtEmpVP1X4o+aVnow95EtguXNbbV1pcb8uEYMl1ostoy94rWbdGA3
 mdgKHxqmmmnkb6uqKaQX6xZgAS22EPsQvilBrBKen6riOSFdpN67ji55y1p8BPhuheYv
 8ASQ==
X-Gm-Message-State: AOJu0Yw5YHt74y64LUNhO0ibkon11BePA+LB/eIVUzzhLACfBc1Fnxl4
 +T05IidLKPgSa3h5FSPB2Nlf8cI0f9yYy9qsUKy2yYLF6hVz6/8CYlaFRt0YvFPGytPG0zteAFP
 3feDhWaRMiqkOJ33tIzbEL7bB5/5DJLPJ
X-Received: by 2002:a05:6870:2208:b0:239:4a86:bbcd with SMTP id
 586e51a60fabf-240979c0676mr2353511fac.3.1715165059339; Wed, 08 May 2024
 03:44:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAH9tv=MSO2ooq=8Vt63uWCNV3sWMkZC2DihLvUkbpeOhYphkDg@mail.gmail.com>
 <1279AECF-3BAD-41BB-8ECF-0E27063D725B@gmail.com>
In-Reply-To: <1279AECF-3BAD-41BB-8ECF-0E27063D725B@gmail.com>
From: Krishna Gururaj <krishna125g@gmail.com>
Date: Wed, 8 May 2024 16:14:08 +0530
Message-ID: <CAH9tv=NX-_3pwmYZNi506Z0=oYxwSCE3xcuxfnauqtWu5E6jWw@mail.gmail.com>
Subject: Re: QNX in qemu
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000017dfaa0617eefc3d"
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=krishna125g@gmail.com; helo=mail-oi1-x234.google.com
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
X-TUID: 97/cUFch/MLQ

--00000000000017dfaa0617eefc3d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello All,


Can somebody please address my question, I am already thankful for the help
and support.

Regards,
Krishna G.

On Mon, May 6, 2024 at 7:00=E2=80=AFAM Krishna Gururaj <krishna125g@gmail.c=
om>
wrote:

> Hello,
>
>
>
> I request somebody to please respond to my query.
>
> Regards,
> Krishna G
>
> Sent from my iPhone
>
> On 03-May-2024, at 15:14, Krishna Gururaj <krishna125g@gmail.com> wrote:
>
> =EF=BB=BF
> Hello,
>
>      Firstly thank you for the response. Now when I remove the -nographic
> option a gtk screen opens and it displays that ' Guest has not initialize=
d
> the display (yet) and in the log I see this : (qemu:15068): Gtk-WARNING *=
*:
> 10:54:03.341: Could not load a pixbuf from icon theme.This may indicate
> that pixbuf loaders or the mime database could not be found.
>
> QNX is not getting loaded when I remove this option.
>
>
> I think the below logs might help you help me better :
>
> I get this when I run this command 'qemu-system-aarch64.exe -machine
> vexpress-a15 -cpu cortex-a57 -smp 4 -m 30G -kernel ifs.bin -drive
> file=3Ddisk-qemu.vmdk,if=3Dnone,id=3Ddrv0 -device virtio-blk-device,drive=
=3Ddrv0
> -netdev tap,id=3Dmynet0,ifname=3DTAP_Ethernet,script=3Dno,downscript=3Dno=
 -device
> virtio-net-device,netdev=3Dmynet0,mac=3D52:55:00:d1:55:01 -device
> virtio-rng-device -nographic'
>
> ---> Starting slogger2
> ---> Starting PCI Services
> ---> Starting devb
> Path=3D0 -
>  target=3D0 lun=3D0     Direct-Access(0) - VIRTIO  Rev:
> ---> Mounting file systems
> ---> Mounting file systems
> =E2=97=84---> Starting Networking
> # net.inet.icmp.bmcastecho: 0 -> 1
> qnx.kern.droproot: 0 -> 1
> ---> Starting sshd
> ---> Starting misc
> -U deprecated, use security policies.
> pps: NOTICE: PPS initializing
> pps: NOTICE: PPS attaching /pps
> pps: NOTICE: PPS attached /pps major 2 minor 6
> ---> Starting graphics
> io_hid_dlopen, devh-ps2ser-vm.so DLL Error Library cannot be found
> libkhronos: dlopen() err No valid library found, path:
> '/system/graphics/vmwgfx-drm/libwfdcfg-vmwgfx-generic.so'
> libkhronos: dlopen() err Library cannot be found, path:
> 'libwfdcfg-vmwgfx-generic.so'
> libkhronos: Ensure directory containing graphics libraries is appended to
> LD_LIBRARY_PATH envar.
> *Unable to access /dev/screen *
> Process count: 26
> Startup complete
> QNX noname 7.1.0 2020/06/13-20:07:59EDT ARMv8_Foundation_Model aarch64le
>
>
> I am configuring the screen with the follwoing command after boot up :
>
> screen -c /system/lib/graphics/swiftshader/graphics.conf
>
>
> graphics.conf :
>
> begin khronos
>   begin egl display 1
>     vk-icds =3D vk_swiftshader_icd.json
>     egl-dlls =3D libEGL_Angle.so
>     glesv2-dlls =3D libGLESv2_Angle.so
>   end egl display
>
>   begin wfd device 1
>     pipeline-ids =3D 1
>     display-ids =3D 1
>     wfd-dlls =3D libwfdcfg-sample.so libWFDdummy.so
>   end wfd device
> end khronos
>
> begin winmgr
>   begin globals
>     default-display =3D 1
>     alloc-config =3D stdbuf
>     stack-size =3D 65536
>     blit-config =3D sw
>     input =3D keyboard,mouse
>     requests-logsize =3D 65536
>     blits-logsize =3D 4096
>   end globals
>
>   begin display 1
>    formats =3D rgba8888
>    force-composition =3D true
>    video-mode =3D 1920 x 1080 @ 60
>    stack-size =3D 65536
>   end display
>
>   begin class framebuffer1
>     display =3D 1
>     pipeline =3D 1
>     format =3D rgba8888
>     usage =3D sw
>   end class
>
> end winmgr
>
>
> Thank You,
> Krishna G.
>
>
>
> Regards,
> Krishna Gururaj.
>
> On Mon, Apr 29, 2024 at 8:56=E2=80=AFPM Peter Maydell <peter.maydell@lina=
ro.org>
> wrote:
>
>> On Mon, 29 Apr 2024 at 13:26, Krishna Gururaj <krishna125g@gmail.com>
>> wrote:
>> >
>> > Hello,
>> >
>> > I am trying to run the gles2-gears binary in qnx with the following
>> configuration :
>> >
>> > qemu-system-aarch64.exe -machine vexpress-a15 -cpu cortex-a57 -smp 4 -=
m
>> 30G -kernel ifs.bin -drive file=3Ddisk-qemu.vmdk,if=3Dnone,id=3Ddrv0 -de=
vice
>> virtio-blk-device,drive=3Ddrv0 -netdev
>> tap,id=3Dmynet0,ifname=3DTAP_Ethernet,script=3Dno,downscript=3Dno -devic=
e
>> virtio-net-device,netdev=3Dmynet0,mac=3D52:55:00:d1:55:01 -device
>> virtio-rng-device -nographic
>>
>> This command line is not correct, because it takes a machine
>> that is only supposed to work with a Cortex-A15 ("vexpress-a15")
>> and tries to create a Cortex-A57 CPU with it. This will either
>> ignore the -cpu option or create something weird and unsupported,
>> I forget which. You should either fix the machine type or the
>> CPU type.
>>
>> That's unrelated to your graphics question -- the answer there
>> is that you say "-nographic" which means "I don't want to see
>> a GUI window". If you do that then you obviously won't see any
>> graphics. (Beyond that, the guest OS will need to have support
>> for whatever graphics device/framebuffer the machine provides.)
>>
>> thanks
>> -- PMM
>>
>

--00000000000017dfaa0617eefc3d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello All,<br><br><br>Can somebody please address my=C2=A0=
question, I am already=C2=A0thankful for the help and support.<br><br>Regar=
ds,<br>Krishna G.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Mon, May 6, 2024 at 7:00=E2=80=AFAM Krishna Gururaj &lt=
;<a href=3D"mailto:krishna125g@gmail.com">krishna125g@gmail.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"=
auto">Hello,<div><br></div><div><br></div><div><br></div><div>I request som=
ebody to please respond to my query.</div><div><br></div><div>Regards,</div=
><div>Krishna G</div><div><br><div dir=3D"ltr">Sent from my iPhone</div><di=
v dir=3D"ltr"><br><blockquote type=3D"cite">On 03-May-2024, at 15:14, Krish=
na Gururaj &lt;<a href=3D"mailto:krishna125g@gmail.com" target=3D"_blank">k=
rishna125g@gmail.com</a>&gt; wrote:<br><br></blockquote></div><blockquote t=
ype=3D"cite"><div dir=3D"ltr">=EF=BB=BF<div dir=3D"ltr">Hello,<br><br>=C2=
=A0 =C2=A0 =C2=A0Firstly thank you for the response. Now when I remove the =
-nographic option a gtk screen opens and it displays that &#39; Guest has n=
ot initialized the display (yet) and in the log I see this : (qemu:15068): =
Gtk-WARNING **: 10:54:03.341: Could not load a pixbuf from icon theme.This =
may indicate that pixbuf loaders or the mime database could not be found.=
=C2=A0<br><br>QNX is not getting loaded when I remove this option.<br><br><=
br>I think the below logs might help you help me better :<br><br>I get this=
 when I run this command &#39;qemu-system-aarch64.exe -machine vexpress-a15=
 -cpu cortex-a57 -smp 4 -m 30G -kernel ifs.bin -drive file=3Ddisk-qemu.vmdk=
,if=3Dnone,id=3Ddrv0 -device virtio-blk-device,drive=3Ddrv0 -netdev tap,id=
=3Dmynet0,ifname=3DTAP_Ethernet,script=3Dno,downscript=3Dno -device virtio-=
net-device,netdev=3Dmynet0,mac=3D52:55:00:d1:55:01 -device virtio-rng-devic=
e -nographic&#39;<br><br>---&gt; Starting slogger2<br>---&gt; Starting PCI =
Services<br>---&gt; Starting devb<br>Path=3D0 -<br>=C2=A0target=3D0 lun=3D0=
 =C2=A0 =C2=A0 Direct-Access(0) - VIRTIO =C2=A0Rev:<br>---&gt; Mounting fil=
e systems<br>---&gt; Mounting file systems<br>=E2=97=84---&gt; Starting Net=
working<br># net.inet.icmp.bmcastecho: 0 -&gt; 1<br>qnx.kern.droproot: 0 -&=
gt; 1<br>---&gt; Starting sshd<br>---&gt; Starting misc<br>-U deprecated, u=
se security policies.<br>pps: NOTICE: PPS initializing<br>pps: NOTICE: PPS =
attaching /pps<br>pps: NOTICE: PPS attached /pps major 2 minor 6<br>---&gt;=
 Starting graphics<br>io_hid_dlopen, devh-ps2ser-vm.so DLL Error Library ca=
nnot be found<br>libkhronos: dlopen() err No valid library found, path: &#3=
9;/system/graphics/vmwgfx-drm/libwfdcfg-vmwgfx-generic.so&#39;<br>libkhrono=
s: dlopen() err Library cannot be found, path: &#39;libwfdcfg-vmwgfx-generi=
c.so&#39;<br>libkhronos: Ensure directory containing graphics libraries is =
appended to LD_LIBRARY_PATH envar.<br><b>Unable to access /dev/screen=C2=A0=
</b><br>Process count: 26<br>Startup complete<br>QNX noname 7.1.0 2020/06/1=
3-20:07:59EDT ARMv8_Foundation_Model aarch64le<div><br></div><div><br></div=
><div>I am configuring the screen with the follwoing command after boot up =
:=C2=A0</div><div><br></div><div>screen -c /system/lib/graphics/swiftshader=
/graphics.conf<br><br><br>graphics.conf :<br><br>begin khronos<br>=C2=A0 be=
gin egl display 1<br>=C2=A0 =C2=A0 vk-icds =3D vk_swiftshader_icd.json<br>=
=C2=A0 =C2=A0 egl-dlls =3D libEGL_Angle.so<br>=C2=A0 =C2=A0 glesv2-dlls =3D=
 libGLESv2_Angle.so<br>=C2=A0 end egl display<br><br>=C2=A0 begin wfd devic=
e 1<br>=C2=A0 =C2=A0 pipeline-ids =3D 1<br>=C2=A0 =C2=A0 display-ids =3D 1<=
br>=C2=A0 =C2=A0 wfd-dlls =3D libwfdcfg-sample.so libWFDdummy.so<br>=C2=A0 =
end wfd device<br>end khronos<br><br>begin winmgr<br>=C2=A0 begin globals<b=
r>=C2=A0 =C2=A0 default-display =3D 1<br>=C2=A0 =C2=A0 alloc-config =3D std=
buf<br>=C2=A0 =C2=A0 stack-size =3D 65536<br>=C2=A0 =C2=A0 blit-config =3D =
sw<br>=C2=A0 =C2=A0 input =3D keyboard,mouse<br>=C2=A0 =C2=A0 requests-logs=
ize =3D 65536<br>=C2=A0 =C2=A0 blits-logsize =3D 4096<br>=C2=A0 end globals=
<br><br>=C2=A0 begin display 1<br>=C2=A0 =C2=A0formats =3D rgba8888<br>=C2=
=A0 =C2=A0force-composition =3D true<br>=C2=A0 =C2=A0video-mode =3D 1920 x =
1080 @ 60<br>=C2=A0 =C2=A0stack-size =3D 65536<br>=C2=A0 end display<br><br=
>=C2=A0 begin class framebuffer1<br>=C2=A0 =C2=A0 display =3D 1<br>=C2=A0 =
=C2=A0 pipeline =3D 1<br>=C2=A0 =C2=A0 format =3D rgba8888<br>=C2=A0 =C2=A0=
 usage =3D sw<br>=C2=A0 end class<br><br>end winmgr<br><br><br>Thank You,=
=C2=A0<br>Krishna G.</div><br><br><br>Regards,<br>Krishna Gururaj.<br></div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mo=
n, Apr 29, 2024 at 8:56=E2=80=AFPM Peter Maydell &lt;<a href=3D"mailto:pete=
r.maydell@linaro.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon, 29 =
Apr 2024 at 13:26, Krishna Gururaj &lt;<a href=3D"mailto:krishna125g@gmail.=
com" target=3D"_blank">krishna125g@gmail.com</a>&gt; wrote:<br>
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
</div></blockquote></div></div></blockquote></div>

--00000000000017dfaa0617eefc3d--
