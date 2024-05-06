Received: by 2002:a17:907:a09:b0:a52:4db9:938b with SMTP id bb9csp1278121ejc;
        Sun, 5 May 2024 18:30:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU2mVBDZhijvZJ9zcSrH7k9uKKrW/+r/Kb36gOqegQEdDYxeOM5IjoR+5TNXmsWfzBBNpWDhVxTDxtmmfIEH9MpS9qf+EOo
X-Google-Smtp-Source: AGHT+IGesdES5iGnw4DDXaKxT6jJlhs/a4IUhC+Rv3am05G+vVsm1eYFmqmXB6cWZOejnlRyyPyM
X-Received: by 2002:a05:620a:9c7:b0:792:90f5:89b3 with SMTP id y7-20020a05620a09c700b0079290f589b3mr4563579qky.7.1714959049397;
        Sun, 05 May 2024 18:30:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714959049; cv=none;
        d=google.com; s=arc-20160816;
        b=QlkANE69CergMUTqIyqg7tWH94ivg9+yVZtK+h/ifgzpQziPMlr6XcwpK3ZRw40WRy
         r5m6XBx4meJychHpWoL1x0FsuZ2zv66zkPpEfm//UYHCf3NJO7t08bRWsgtDDAQyDxLP
         wJa9StF8yGK29UG9jDhVQZ8RJunxQyyeF1x67rxdNuUszfx3ylKd4h0x/fh4sLeWg94W
         IdB374eCFvQ0h3zSufvnz4tlctEhGHlNBne98yUn4FVd7Gpyt5puWio5cGvXQ+n76ilG
         8MBeAup6hd4P7wLJa50eJutlh/4dFnNEHe3MTgYoyTvr0qqmOQPZQiyhC6MIas9R2DTf
         93GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:in-reply-to:references
         :message-id:date:subject:mime-version:from:content-transfer-encoding
         :dkim-signature;
        bh=4Hb2mmnXv2C0z+ctoR57PeZM/HR/seCmZTdJzxcLpaU=;
        fh=DBwo5oYV+Zl89FPcGyBzo6mnqwnGCoM6YpiQGc4/RNc=;
        b=Nl0wEH/qQcYvO5PKVGt+4TnkvlficHR4ihhkRVP3+bfKcvRENYlIUbLNMrFXVLy5HA
         JuizfELGByh6txgomUBuB8UUhX2NuZUsUMykrLetT6M2Tvq2L3yievmHXYFAK4C/557w
         XEW2aGwbtG8KVdruHktnEQAGszCuSZE/ivGUmKl+Ap4VtOQCmEjlKQQCvXXLn9fngdQO
         +HbSoNCTkfJOEJ3eBW3VY5MpFhnYDCjNzQChGRlSWwy3jDH0zhIhAdsgAsiaFVNyMVGs
         TqC/MsBmE78/A9Fs8/30TD86lYPL6ms0sO5G7CPdt75sOoQuZZQD4g10CTfYFEpjHTwH
         nQ7A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=AEhPy3bo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u5-20020ac858c5000000b0043ac84e8349si9105905qta.686.2024.05.05.18.30.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 05 May 2024 18:30:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=AEhPy3bo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s3nBe-00033j-4x; Sun, 05 May 2024 21:30:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <krishna125g@gmail.com>)
 id 1s3nBQ-0002x1-0x
 for qemu-arm@nongnu.org; Sun, 05 May 2024 21:30:28 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <krishna125g@gmail.com>)
 id 1s3nBD-0004Iq-Qo
 for qemu-arm@nongnu.org; Sun, 05 May 2024 21:30:23 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-6f447976de7so884116b3a.1
 for <qemu-arm@nongnu.org>; Sun, 05 May 2024 18:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714959007; x=1715563807; darn=nongnu.org;
 h=to:in-reply-to:references:message-id:date:subject:mime-version:from
 :content-transfer-encoding:from:to:cc:subject:date:message-id
 :reply-to; bh=4Hb2mmnXv2C0z+ctoR57PeZM/HR/seCmZTdJzxcLpaU=;
 b=AEhPy3bo+I9b7WBXWlRa9mVWoqgz0PjLrGL/tJf0XVnHfpP0KcI+27AMSswjua4QYr
 +mLu4iaWk83GEWfPEZ/dK2l4gFshMSkIRUD2N+YL7ki+v2/Kmqgqwsy4sBT9/o5i6fcT
 wvBlRUhQsBO3SFpflVsj3eds8gCTKKub4R6T//X1yA6GuHy5TkPEq5rozB/4vYCCyD5X
 Y18vJMMLw6wy2pZl/4XMysSp8fYsqTWnyhckyA1/SQwjPJ+qsX5MiImrmMcXENcoWEeg
 GAMWdGGmPTiGgN1E2oWSHolHteHPevT69pUJjh/vtp+vYsrihZPxzD+BDgVioypOtCbu
 3ADQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714959007; x=1715563807;
 h=to:in-reply-to:references:message-id:date:subject:mime-version:from
 :content-transfer-encoding:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=4Hb2mmnXv2C0z+ctoR57PeZM/HR/seCmZTdJzxcLpaU=;
 b=TBsj8IxsOXBKKmXQ1/Oa7BiY6o03O6wBy0PTsxZy/BkLE6MiJnjhZWdfgt+yDKUVd/
 jGK3WgfNF6BNO1xx3wvSOSbt5O0PUA8XYLn4neqQbG298x6/FTnH1R3DOBW7Pcf91zNO
 0QOYmcx/4LshkmcAPGSgzhKnaR7P5oDlll/8MMJiCp50S77v0O7xbKTXk/M1E0qlzQDy
 u7hVl8MpkdO8OrotQ4lPxL9Y0TIRCLXxwXLjPs/lpFpO/hm0OtYS7JMSZB0V7ycx/GD0
 f9jbW3CndhCsIB7jFJwszZnBkbp1T8tXIsMmeLM2hqfGEzoLRg9Ilc3I7yeXbByh8Qrn
 Qiww==
X-Gm-Message-State: AOJu0YzC5v3Dvmlqj0r+xMxojHaRLM7SnV4iGlUFJHFLSGvq/RDlDYat
 QVWQs19hlbeWHQMg6IrmZB5wmHxkQnA5zXf4PrSixX/INuHagXOZLMes6w==
X-Received: by 2002:a05:6a00:2295:b0:6e7:b3c4:43a4 with SMTP id
 f21-20020a056a00229500b006e7b3c443a4mr9713106pfe.25.1714959007048; 
 Sun, 05 May 2024 18:30:07 -0700 (PDT)
Received: from smtpclient.apple ([2401:4900:1cc4:edd0:b17b:388:5805:17a])
 by smtp.gmail.com with ESMTPSA id
 z17-20020aa79911000000b006f46a0e6874sm2093178pff.62.2024.05.05.18.30.06
 for <qemu-arm@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 May 2024 18:30:06 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary=Apple-Mail-8FA931D6-B62C-429A-A4C2-CC57BDD578B4
Content-Transfer-Encoding: 7bit
From: Krishna Gururaj <krishna125g@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: QNX in qemu
Date: Mon, 6 May 2024 06:59:54 +0530
Message-Id: <1279AECF-3BAD-41BB-8ECF-0E27063D725B@gmail.com>
References: <CAH9tv=MSO2ooq=8Vt63uWCNV3sWMkZC2DihLvUkbpeOhYphkDg@mail.gmail.com>
In-Reply-To: <CAH9tv=MSO2ooq=8Vt63uWCNV3sWMkZC2DihLvUkbpeOhYphkDg@mail.gmail.com>
To: qemu-arm@nongnu.org
X-Mailer: iPhone Mail (20G81)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=krishna125g@gmail.com; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, MIME_HTML_ONLY=0.1, MIME_HTML_ONLY_MULTI=0.001,
 MIME_QP_LONG_LINE=0.001, MPART_ALT_DIFF=0.79, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URI_NOVOWEL=0.5 autolearn=no autolearn_force=no
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
X-TUID: ZO0z2e8LZxST


--Apple-Mail-8FA931D6-B62C-429A-A4C2-CC57BDD578B4
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto">Hello,<div><br></div><div><br></div><div><b=
r></div><div>I request somebody to please respond to my query.</div><div><br=
></div><div>Regards,</div><div>Krishna G</div><div><br><div dir=3D"ltr">Sent=
 from my iPhone</div><div dir=3D"ltr"><br><blockquote type=3D"cite">On 03-Ma=
y-2024, at 15:14, Krishna Gururaj &lt;krishna125g@gmail.com&gt; wrote:<br><b=
r></blockquote></div><blockquote type=3D"cite"><div dir=3D"ltr">=EF=BB=BF<di=
v dir=3D"ltr">Hello,<br><br>&nbsp; &nbsp; &nbsp;Firstly thank you for the re=
sponse. Now when I remove the -nographic option a gtk screen opens and it di=
splays that ' Guest has not initialized the display (yet) and in the log I s=
ee this : (qemu:15068): Gtk-WARNING **: 10:54:03.341: Could not load a pixbu=
f from icon theme.This may indicate that pixbuf loaders or the mime database=
 could not be found.&nbsp;<br><br>QNX is not getting loaded when I remove th=
is option.<br><br><br>I think the below logs might help you help me better :=
<br><br>I get this when I run this command 'qemu-system-aarch64.exe -machine=
 vexpress-a15 -cpu cortex-a57 -smp 4 -m 30G -kernel ifs.bin -drive file=3Ddi=
sk-qemu.vmdk,if=3Dnone,id=3Ddrv0 -device virtio-blk-device,drive=3Ddrv0 -net=
dev tap,id=3Dmynet0,ifname=3DTAP_Ethernet,script=3Dno,downscript=3Dno -devic=
e virtio-net-device,netdev=3Dmynet0,mac=3D52:55:00:d1:55:01 -device virtio-r=
ng-device -nographic'<br><br>---&gt; Starting slogger2<br>---&gt; Starting P=
CI Services<br>---&gt; Starting devb<br>Path=3D0 -<br>&nbsp;target=3D0 lun=3D=
0 &nbsp; &nbsp; Direct-Access(0) - VIRTIO &nbsp;Rev:<br>---&gt; Mounting fil=
e systems<br>---&gt; Mounting file systems<br>=E2=97=84---&gt; Starting Netw=
orking<br># net.inet.icmp.bmcastecho: 0 -&gt; 1<br>qnx.kern.droproot: 0 -&gt=
; 1<br>---&gt; Starting sshd<br>---&gt; Starting misc<br>-U deprecated, use s=
ecurity policies.<br>pps: NOTICE: PPS initializing<br>pps: NOTICE: PPS attac=
hing /pps<br>pps: NOTICE: PPS attached /pps major 2 minor 6<br>---&gt; Start=
ing graphics<br>io_hid_dlopen, devh-ps2ser-vm.so DLL Error Library cannot be=
 found<br>libkhronos: dlopen() err No valid library found, path: '/system/gr=
aphics/vmwgfx-drm/libwfdcfg-vmwgfx-generic.so'<br>libkhronos: dlopen() err L=
ibrary cannot be found, path: 'libwfdcfg-vmwgfx-generic.so'<br>libkhronos: E=
nsure directory containing graphics libraries is appended to LD_LIBRARY_PATH=
 envar.<br><b>Unable to access /dev/screen&nbsp;</b><br>Process count: 26<br=
>Startup complete<br>QNX noname 7.1.0 2020/06/13-20:07:59EDT ARMv8_Foundatio=
n_Model aarch64le<div><br></div><div><br></div><div>I am configuring the scr=
een with the follwoing command after boot up :&nbsp;</div><div><br></div><di=
v>screen -c /system/lib/graphics/swiftshader/graphics.conf<br><br><br>graphi=
cs.conf :<br><br>begin khronos<br>&nbsp; begin egl display 1<br>&nbsp; &nbsp=
; vk-icds =3D vk_swiftshader_icd.json<br>&nbsp; &nbsp; egl-dlls =3D libEGL_A=
ngle.so<br>&nbsp; &nbsp; glesv2-dlls =3D libGLESv2_Angle.so<br>&nbsp; end eg=
l display<br><br>&nbsp; begin wfd device 1<br>&nbsp; &nbsp; pipeline-ids =3D=
 1<br>&nbsp; &nbsp; display-ids =3D 1<br>&nbsp; &nbsp; wfd-dlls =3D libwfdcf=
g-sample.so libWFDdummy.so<br>&nbsp; end wfd device<br>end khronos<br><br>be=
gin winmgr<br>&nbsp; begin globals<br>&nbsp; &nbsp; default-display =3D 1<br=
>&nbsp; &nbsp; alloc-config =3D stdbuf<br>&nbsp; &nbsp; stack-size =3D 65536=
<br>&nbsp; &nbsp; blit-config =3D sw<br>&nbsp; &nbsp; input =3D keyboard,mou=
se<br>&nbsp; &nbsp; requests-logsize =3D 65536<br>&nbsp; &nbsp; blits-logsiz=
e =3D 4096<br>&nbsp; end globals<br><br>&nbsp; begin display 1<br>&nbsp; &nb=
sp;formats =3D rgba8888<br>&nbsp; &nbsp;force-composition =3D true<br>&nbsp;=
 &nbsp;video-mode =3D 1920 x 1080 @ 60<br>&nbsp; &nbsp;stack-size =3D 65536<=
br>&nbsp; end display<br><br>&nbsp; begin class framebuffer1<br>&nbsp; &nbsp=
; display =3D 1<br>&nbsp; &nbsp; pipeline =3D 1<br>&nbsp; &nbsp; format =3D r=
gba8888<br>&nbsp; &nbsp; usage =3D sw<br>&nbsp; end class<br><br>end winmgr<=
br><br><br>Thank You,&nbsp;<br>Krishna G.</div><br><br><br>Regards,<br>Krish=
na Gururaj.<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Mon, Apr 29, 2024 at 8:56=E2=80=AFPM Peter Maydell &lt;<a hr=
ef=3D"mailto:peter.maydell@linaro.org">peter.maydell@linaro.org</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon, 29 Apr 2=
024 at 13:26, Krishna Gururaj &lt;<a href=3D"mailto:krishna125g@gmail.com" t=
arget=3D"_blank">krishna125g@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hello,<br>
&gt;<br>
&gt; I am trying to run the gles2-gears binary in qnx with the following con=
figuration :<br>
&gt;<br>
&gt; qemu-system-aarch64.exe -machine vexpress-a15 -cpu cortex-a57 -smp 4 -m=
 30G -kernel ifs.bin -drive file=3Ddisk-qemu.vmdk,if=3Dnone,id=3Ddrv0 -devic=
e virtio-blk-device,drive=3Ddrv0 -netdev tap,id=3Dmynet0,ifname=3DTAP_Ethern=
et,script=3Dno,downscript=3Dno -device virtio-net-device,netdev=3Dmynet0,mac=
=3D52:55:00:d1:55:01 -device virtio-rng-device -nographic<br>
<br>
This command line is not correct, because it takes a machine<br>
that is only supposed to work with a Cortex-A15 ("vexpress-a15")<br>
and tries to create a Cortex-A57 CPU with it. This will either<br>
ignore the -cpu option or create something weird and unsupported,<br>
I forget which. You should either fix the machine type or the<br>
CPU type.<br>
<br>
That's unrelated to your graphics question -- the answer there<br>
is that you say "-nographic" which means "I don't want to see<br>
a GUI window". If you do that then you obviously won't see any<br>
graphics. (Beyond that, the guest OS will need to have support<br>
for whatever graphics device/framebuffer the machine provides.)<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div>
</div></blockquote></div></body></html>=

--Apple-Mail-8FA931D6-B62C-429A-A4C2-CC57BDD578B4--
