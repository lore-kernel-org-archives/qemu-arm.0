Received: by 2002:a17:906:a205:b0:a52:4db9:938b with SMTP id r5csp1769808ejy;
        Fri, 3 May 2024 02:44:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU0FnPp7S/WY3S+hI6PlPp7wgbGfxX078vcu0CMI+c6wMu8gUdCMN+mTRkcPb31gGR7HC0fub9Zr5Zx5Ab5167KTl4DGNk5
X-Google-Smtp-Source: AGHT+IEqOTquF7Q6uXd3L5clQ+MzzTs66H0BXjGJQ4HjDAkVSubOfTTNwElz8dpQC0sCsMLXeM6T
X-Received: by 2002:ad4:5c62:0:b0:6a0:ac0f:a59c with SMTP id i2-20020ad45c62000000b006a0ac0fa59cmr2255169qvh.46.1714729499595;
        Fri, 03 May 2024 02:44:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714729499; cv=none;
        d=google.com; s=arc-20160816;
        b=GZeNcJ70ZOmNRJWnzAdzeyQkz55KDoLK6whWnXeS1t7+Qy1rwunO/l1WiUok+RZyzf
         kIGVUH8Ck8x+KAYdcZ9+9d329TpU4IjFqhK+eG7Riw3SKSWyUMYNN1fKKWfRj/M31z/g
         TaNOszPYIrmFDWQS2hxO6BjqMLIq6OvdHi0k0LCDwP9F1cBJYo6cHFN/pMhYlBFos8P/
         kPkZfTDHOdm656vmUDvMVUq2T0BNXw8rYz9lEEKiq0zG8OdQO47wiKuLlu0jQXB7vM5c
         LLQswb+WkkHmvc+C67i4fL3rIsU+Ih+mJhJnyZ/08hFOblpeFku8Aam67afnjg7FSrKD
         JNFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EzpjF3TeR3cKzb5knQUNNKlMPBdKhlydcNyhW3iKAlQ=;
        fh=DBwo5oYV+Zl89FPcGyBzo6mnqwnGCoM6YpiQGc4/RNc=;
        b=eKTEQ7bxS7OMWmc8WgzZUiG7rtbYHrgNvzwzosDvdfcZGBnzhDsgQljg5XUUWODcRK
         yKNYXvm89ajTpoJJF0mQGm05z6CZWA3DM46DjEFL071w0qn+acq+NVDJkBHW/OF3MrCP
         k7f5ynSjc2KJsMPX9a6WJo/4nWA+jJE30hJtdqYCJHTX+zk61+NJjr01TtDi9NnOo9a2
         Q2i61FTNz0hfL/kPRJhkdYdgZqb1YD+E4ZBHrOr18RmUPIvXJ0yKhXe/tT5PMp56+n/i
         n14R1neS0kxda/ENbIt7W6KIc1iM4gwHh7W8U8wfrsjxvbKJoDeUU6pkKgPnc96No/P/
         Iwqg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Cj0mReRm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p7-20020a05621421e700b006993ed55bd8si2845022qvj.230.2024.05.03.02.44.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 May 2024 02:44:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Cj0mReRm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s2pTG-0002fH-Jy; Fri, 03 May 2024 05:44:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <krishna125g@gmail.com>)
 id 1s2pTF-0002et-Db
 for qemu-arm@nongnu.org; Fri, 03 May 2024 05:44:49 -0400
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <krishna125g@gmail.com>)
 id 1s2pTC-0007xc-Tn
 for qemu-arm@nongnu.org; Fri, 03 May 2024 05:44:48 -0400
Received: by mail-ot1-x336.google.com with SMTP id
 46e09a7af769-6ee2fb4ec57so3119912a34.3
 for <qemu-arm@nongnu.org>; Fri, 03 May 2024 02:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714729482; x=1715334282; darn=nongnu.org;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EzpjF3TeR3cKzb5knQUNNKlMPBdKhlydcNyhW3iKAlQ=;
 b=Cj0mReRmGXLWXiFNuwpHThXYJ/ANJvyTgv+8z4DQJcLGTsJz7/J5JzuXY1tz5bdALZ
 HLgGm5f0l0OI4FHEi4EoVjY4JbTOibIwUfGACPf8/aV0AcEzOhYnLMbdjk3M732L/4S4
 NNYK/8U4dC5ec86qT55hOqPPIBxFVHyfWyTCv4YPvfuKEOTBn2CkbU1q76h7+lzTmHva
 Ji+inotIHFqh5Ou4FhnfQ2TF6QEStKETiozvgHPRclGOZ+qLbJ6gZ4lImiSr++KlIWx2
 kDcoycDm8ysaXcm6RMZtWO9ZV//ZVVA8+J8n34tVWMm0MsXT+H/+1oA0SCZiU+fS7uS2
 eRFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714729482; x=1715334282;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EzpjF3TeR3cKzb5knQUNNKlMPBdKhlydcNyhW3iKAlQ=;
 b=SbyXWULMCQnaY3l0z7R8Cxu0pms+iManWwEg8IzJTEvN43z6c73/9ttxtNVOVtA6a9
 kIvdKy5s6S6CQJpdoTI18BqjXaioJ0CKO++i4TFz2EIhGJyde5+rw64l+85weDBtcTEC
 Y7UtBE7BzyMhegrLzWF9fJI9SLoZ6WdML1QH0fmYKU7yktp7dSJrZRddFE47OkpVqpaI
 FH18xLe+aWloj7By4ekfqCffDysxpsdjRV8WLJMQJWP+NvIqA3zIC7aMHMS6nnyZRhjM
 QQUQQLg77qgQhHWORJKhi/fbseNZBCyrQjmK+U4yM3T35lAQ2yw8eIYopJcWp37ReDNJ
 Y9KA==
X-Gm-Message-State: AOJu0YyTVgyacSaB5Qd04KpPkvmLzl3PufzQ5vOsi84lcyNmiYvNgFby
 i+wxy2uYQSjvSegvgzoVn/KnY3JmyFuxir5MZWAeN1BL2m4qK+DKC2zX8ph+UhoEgDSSNcFnlC4
 YIHOyvfihgrkR+BPT71cat/soDV00pw7alo8=
X-Received: by 2002:a05:6870:d8cb:b0:23e:5cd0:faae with SMTP id
 of11-20020a056870d8cb00b0023e5cd0faaemr1389095oac.34.1714729482335; Fri, 03
 May 2024 02:44:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAH9tv=PKi3B44y4+gvTa9CpJHNN4UAeyvgxFwXCjUVM3Qy=ppA@mail.gmail.com>
 <CAFEAcA_LH+vKxn3pdzfua_1+Piy4rQECq3yh66f_O+YuTxfnRw@mail.gmail.com>
In-Reply-To: <CAFEAcA_LH+vKxn3pdzfua_1+Piy4rQECq3yh66f_O+YuTxfnRw@mail.gmail.com>
From: Krishna Gururaj <krishna125g@gmail.com>
Date: Fri, 3 May 2024 15:14:31 +0530
Message-ID: <CAH9tv=MSO2ooq=8Vt63uWCNV3sWMkZC2DihLvUkbpeOhYphkDg@mail.gmail.com>
Subject: Re: QNX in qemu
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000ae3c4e0617899196"
Received-SPF: pass client-ip=2607:f8b0:4864:20::336;
 envelope-from=krishna125g@gmail.com; helo=mail-ot1-x336.google.com
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
X-TUID: dScH4/KOBitG

--000000000000ae3c4e0617899196
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

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

--000000000000ae3c4e0617899196
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<br><br>=C2=A0 =C2=A0 =C2=A0Firstly thank you for th=
e response. Now when I remove the -nographic option a gtk screen opens and =
it displays that &#39; Guest has not initialized the display (yet) and in t=
he log I see this : (qemu:15068): Gtk-WARNING **: 10:54:03.341: Could not l=
oad a pixbuf from icon theme.This may indicate that pixbuf loaders or the m=
ime database could not be found.=C2=A0<br><br>QNX is not getting loaded whe=
n I remove this option.<br><br><br>I think the below logs might help you he=
lp me better :<br><br>I get this when I run this command &#39;qemu-system-a=
arch64.exe -machine vexpress-a15 -cpu cortex-a57 -smp 4 -m 30G -kernel ifs.=
bin -drive file=3Ddisk-qemu.vmdk,if=3Dnone,id=3Ddrv0 -device virtio-blk-dev=
ice,drive=3Ddrv0 -netdev tap,id=3Dmynet0,ifname=3DTAP_Ethernet,script=3Dno,=
downscript=3Dno -device virtio-net-device,netdev=3Dmynet0,mac=3D52:55:00:d1=
:55:01 -device virtio-rng-device -nographic&#39;<br><br>---&gt; Starting sl=
ogger2<br>---&gt; Starting PCI Services<br>---&gt; Starting devb<br>Path=3D=
0 -<br>=C2=A0target=3D0 lun=3D0 =C2=A0 =C2=A0 Direct-Access(0) - VIRTIO =C2=
=A0Rev:<br>---&gt; Mounting file systems<br>---&gt; Mounting file systems<b=
r>=E2=97=84---&gt; Starting Networking<br># net.inet.icmp.bmcastecho: 0 -&g=
t; 1<br>qnx.kern.droproot: 0 -&gt; 1<br>---&gt; Starting sshd<br>---&gt; St=
arting misc<br>-U deprecated, use security policies.<br>pps: NOTICE: PPS in=
itializing<br>pps: NOTICE: PPS attaching /pps<br>pps: NOTICE: PPS attached =
/pps major 2 minor 6<br>---&gt; Starting graphics<br>io_hid_dlopen, devh-ps=
2ser-vm.so DLL Error Library cannot be found<br>libkhronos: dlopen() err No=
 valid library found, path: &#39;/system/graphics/vmwgfx-drm/libwfdcfg-vmwg=
fx-generic.so&#39;<br>libkhronos: dlopen() err Library cannot be found, pat=
h: &#39;libwfdcfg-vmwgfx-generic.so&#39;<br>libkhronos: Ensure directory co=
ntaining graphics libraries is appended to LD_LIBRARY_PATH envar.<br><b>Una=
ble to access /dev/screen=C2=A0</b><br>Process count: 26<br>Startup complet=
e<br>QNX noname 7.1.0 2020/06/13-20:07:59EDT ARMv8_Foundation_Model aarch64=
le<div><br></div><div><br></div><div>I am configuring the screen with the f=
ollwoing command after boot up :=C2=A0</div><div><br></div><div>screen -c /=
system/lib/graphics/swiftshader/graphics.conf<br><br><br>graphics.conf :<br=
><br>begin khronos<br>=C2=A0 begin egl display 1<br>=C2=A0 =C2=A0 vk-icds =
=3D vk_swiftshader_icd.json<br>=C2=A0 =C2=A0 egl-dlls =3D libEGL_Angle.so<b=
r>=C2=A0 =C2=A0 glesv2-dlls =3D libGLESv2_Angle.so<br>=C2=A0 end egl displa=
y<br><br>=C2=A0 begin wfd device 1<br>=C2=A0 =C2=A0 pipeline-ids =3D 1<br>=
=C2=A0 =C2=A0 display-ids =3D 1<br>=C2=A0 =C2=A0 wfd-dlls =3D libwfdcfg-sam=
ple.so libWFDdummy.so<br>=C2=A0 end wfd device<br>end khronos<br><br>begin =
winmgr<br>=C2=A0 begin globals<br>=C2=A0 =C2=A0 default-display =3D 1<br>=
=C2=A0 =C2=A0 alloc-config =3D stdbuf<br>=C2=A0 =C2=A0 stack-size =3D 65536=
<br>=C2=A0 =C2=A0 blit-config =3D sw<br>=C2=A0 =C2=A0 input =3D keyboard,mo=
use<br>=C2=A0 =C2=A0 requests-logsize =3D 65536<br>=C2=A0 =C2=A0 blits-logs=
ize =3D 4096<br>=C2=A0 end globals<br><br>=C2=A0 begin display 1<br>=C2=A0 =
=C2=A0formats =3D rgba8888<br>=C2=A0 =C2=A0force-composition =3D true<br>=
=C2=A0 =C2=A0video-mode =3D 1920 x 1080 @ 60<br>=C2=A0 =C2=A0stack-size =3D=
 65536<br>=C2=A0 end display<br><br>=C2=A0 begin class framebuffer1<br>=C2=
=A0 =C2=A0 display =3D 1<br>=C2=A0 =C2=A0 pipeline =3D 1<br>=C2=A0 =C2=A0 f=
ormat =3D rgba8888<br>=C2=A0 =C2=A0 usage =3D sw<br>=C2=A0 end class<br><br=
>end winmgr<br><br><br>Thank You,=C2=A0<br>Krishna G.</div><br><br><br>Rega=
rds,<br>Krishna Gururaj.<br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Mon, Apr 29, 2024 at 8:56=E2=80=AFPM Peter=
 Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@lina=
ro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Mon, 29 Apr 2024 at 13:26, Krishna Gururaj &lt;<a href=3D"mailto:k=
rishna125g@gmail.com" target=3D"_blank">krishna125g@gmail.com</a>&gt; wrote=
:<br>
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

--000000000000ae3c4e0617899196--
