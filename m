Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp1491525njf;
        Tue, 3 Sep 2024 08:47:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWoK++TEkG64bYkTPsfqcnfoS0uKsad2S1mf7/eDBPYqiBoxGEaGlEBMzR8Qo9IQW/igWeK0Vh0vzIp7g==@linaro.org
X-Google-Smtp-Source: AGHT+IGoNMlWeccVTyXwRR0ZzWeu9LiILKabn3u8n59tjasS4qN0ynfpYR3rw5kLVHAEeGyPCuax
X-Received: by 2002:a05:6808:18a1:b0:3d9:26d6:c70a with SMTP id 5614622812f47-3df1b6f3963mr14799703b6e.10.1725378420687;
        Tue, 03 Sep 2024 08:47:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725378420; cv=none;
        d=google.com; s=arc-20160816;
        b=bZuW1WGYU3gxtfmu5zM2Cj1cB39EMThB2TakE6KoufEJpxnrocuyAcyGfdUnJJsvYX
         A7/Zg8EiNFy44FopNqPa4VB+4G2/ji+Zop4YUC3QOW3Qar2eFe+lPGf8k6UTnkBbi3Zq
         0opEaRImqh+rGhrSarUlKXEQJR3UMwU7V+5G4TAZPMLthZonnJcbK+hqk2XwakeTS1KX
         kiDehUFXbS04M/Z7vfeWhcbSaDMY/obPisFqTY3KXiWG9ymztA+RWg7itoDnM4UoL/VI
         gfB1gQvr7XxgXYzZotkF+HSOOcYFWN6ih9qtZKc1ClSIPFnka+dhXbSs5w2KR7+swTss
         Yecg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=yW7GmHRdTTEz2RUL5TmiIBBnb/ly4DlBT7MXmnU4+9s=;
        fh=yUhsYJCdRIAEnZjtJsinPFNmt5ZlD7DAkjNlnFHxCzE=;
        b=ltMCGPZVUeGQ4roy92oeLgOtrCGhc+jNWFhIO5zk8n+68o8bCyfUOupfhSwWt+bSwu
         xtbu2j4YF/KucD0rghA7gLjNB9xoDor95LxAhLV6mE9MfVYG/OHR4GnCx3xBPVeAWjzV
         bmB4gnY1hBEpsgzlf0v92CrxbObDsbH3ggIj55JnKp8SFGEa41MKX3S7pOf/KbLy5+2L
         aIPBn2tM6HfWJ+/5dVUsUpPqoyVKQaqvxpkVlCBefoCJ3UT3lseC1yWmQtXb7PZuvhQ+
         IBxDvmMTT+8AanEYXxe89RJN3YQ9qfQdU1L8T8zCDVhfySaQCdFbw/O6CyqAKklPbIHw
         twFQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=IZIfjvV0;
       spf=pass (google.com: domain of qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45682d3d209si117691081cf.263.2024.09.03.08.47.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Sep 2024 08:47:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=IZIfjvV0;
       spf=pass (google.com: domain of qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-discuss-bounces@nongnu.org>)
	id 1slVjl-00061C-Uf; Tue, 03 Sep 2024 11:46:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marietto2008@gmail.com>)
 id 1slVjk-00060E-Ke; Tue, 03 Sep 2024 11:46:32 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marietto2008@gmail.com>)
 id 1slVji-0007Sy-RL; Tue, 03 Sep 2024 11:46:32 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-2d8b68bddeaso1931150a91.1; 
 Tue, 03 Sep 2024 08:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725378388; x=1725983188; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yW7GmHRdTTEz2RUL5TmiIBBnb/ly4DlBT7MXmnU4+9s=;
 b=IZIfjvV095S1WbHT8Mt0r9Y9Pii97g3tbWArgVAlGxpwAUkShns3SR72FCPuBaFXMF
 b3gbNX1YkPjbDbNSDvNs+/FkjqoGvUVgO7fG8B87VWHluOpkYyjkmRxYKM5RQO3XIaUG
 mHr5sUbJQOoFuiMMwdKdboi/FvLj4t9+qXP6NEeMveaKbw4D5T6858ooAzgvQbCNOLdn
 IRabaM1jxpyijsd2B0/VA4fF/DYRXa8qCWomswx6wucOEU+7A2mmZUUbHTK3grDiz+b+
 KSeyimhqzS7XNzWtPBJ64rdAksGato+JpDAHdtnrGumvNBU1KOcGD1PpiZtd5rZVt1jB
 uW0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725378388; x=1725983188;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yW7GmHRdTTEz2RUL5TmiIBBnb/ly4DlBT7MXmnU4+9s=;
 b=HsGk9o1XHI5lEYw7J2hAewmROl3R4FGEKUCHAw5SgVmzoPjjAgb1saBdzexVVKWK0T
 tKkc/dczTxDLiuQOrx7Ys3If7F6TQhw5wrJUnGL4OIUiuKn0JjnQNUkPWAY6RJ8lwzXh
 82VYKMm3l+59XDZiY3jKMgWqk9dNJiysNdzv1/VL/MupwWy/KF7yJY3jTOhtVX1Da8/h
 Pvf+52uooZ5/B8w8C/2OWbXY2Dqdgba4lV7Gqd7wAc958Yz3Z2l2zkYKNvAK8HyNa4+l
 8bOgiyA+tcwakjoW6d4pQyfgM74/6cyL1jheIrd2S6FZNuG0y+ekYdmzXBt9IWdsbpgI
 agMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8x2upPCp47B0UD1FYpDLDOaG9amc3SURRCstFVGpTieoFrC/iXAZhkZOw41UQIfw6s6JGN+wZzgh/ns5Z@nongnu.org,
 AJvYcCV5ALWXYhOvLgVSMEk1w6GfAS5eC4HqpuEueOde4t+3vsDvC2m53AmS6pFPJ2qwZFx80CRsZlEgog==@nongnu.org
X-Gm-Message-State: AOJu0YxOq2wR5XOTj+kMreBr+HH4aPEpiABKNHFbjJelQGR37cAGXYD9
 +H8PTSTEIETAPpkoFnUwb2EsGd5caJhZQ1i2oCoGnRbKBfEe9aRhg9YK5fXNwF0D7p72E1tPTiC
 EZnLosLoNZI5ffpVFaMFjVIGfwT+CWq6Skxc=
X-Received: by 2002:a17:90b:46c3:b0:2d3:bc5f:715f with SMTP id
 98e67ed59e1d1-2d88d6ae5a5mr13237891a91.10.1725378388135; Tue, 03 Sep 2024
 08:46:28 -0700 (PDT)
MIME-Version: 1.0
References: <CA+1FSiirzpq4wjcKTLSexiOWtv26sgD37h=wA2qxv8Qh5MW_-w@mail.gmail.com>
 <23d60255-614a-4a06-b449-644f215555d0@linaro.org>
 <CA+1FSiitcSBa3JZaAZMGkdB356d2M0rPqscwFnNXGML5HghVCQ@mail.gmail.com>
 <c80e855a-ac1c-40b6-8a76-966e53c0b7d7@linaro.org>
 <4cbc21b0-0634-445d-8a67-7705a4e186d8@linaro.org>
 <CA+1FSigiu8xXF1OPs1oSPS7LiGe23gsN73RwPpJUYH=X5EkTRQ@mail.gmail.com>
 <CA+1FSiiH9LP-7UupNLjDyZJGqJAHAjN2nSLFm9fCx=ZNphxGoQ@mail.gmail.com>
 <CA+1FSih6t-Ccnxh1GvOFMf9pMjcfV1V+yyJHV=ZH0c2RY0Kjng@mail.gmail.com>
 <268989a3-cd5c-41fc-ba0d-5eb71bc6e9dc@linaro.org>
 <CA+1FSijygoVZmTkYR8Xoob4yQQdf9o3CZ2-LmzDrBh2e0VaerQ@mail.gmail.com>
 <CA+1FSigOmKen0QPKSEQqt15Zzrx4UFSCpj+5DJMCJtGnFcE+Hw@mail.gmail.com>
 <CA+1FSijfe+5V4RHs-1ow2JwAeiKcmW31V2Ddx9a9zxb_kybDFg@mail.gmail.com>
 <CAFEAcA-U5DpXysVoVQLAJzEKQ17TL82UiRXHH=q+chxwcubOJA@mail.gmail.com>
In-Reply-To: <CAFEAcA-U5DpXysVoVQLAJzEKQ17TL82UiRXHH=q+chxwcubOJA@mail.gmail.com>
From: Mario Marietto <marietto2008@gmail.com>
Date: Tue, 3 Sep 2024 17:45:51 +0200
Message-ID: <CA+1FSij0=6Zn_3HHq1njZgwjYDbopGe5ReUvjXkfHaD2_dCYzA@mail.gmail.com>
Subject: Re: Error : init: partition(s) not found in /sys, waiting for their
 uevent(s): mmcblk0p2, mmcblk0p3 while trying to emulate Android 14 on Ubuntu
 24.04 X64 bit using qemu-system-aarch64.
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-discuss@nongnu.org, 
 qemu-arm <qemu-arm@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000ed9639062138f52a"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=marietto2008@gmail.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-discuss@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-discuss.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-discuss>,
 <mailto:qemu-discuss-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-discuss>
List-Post: <mailto:qemu-discuss@nongnu.org>
List-Help: <mailto:qemu-discuss-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-discuss>,
 <mailto:qemu-discuss-request@nongnu.org?subject=subscribe>
Errors-To: qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-discuss-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: IY21sxsA/YRf

--000000000000ed9639062138f52a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Nope,I don't need 9pfs. I'm trying to understand what parameter I had
enabled when it worked. Is there a parameter to pass to enable the support
for "virtio-blk-pci" ? (as I said,I'm on the Jetson Nano now). Is
virtio-blk-pci enabled by default ? If I should not enable anything related
to that,the last chance I have is to try qemu 5.1.0 instead of 5.0.

On Tue, Sep 3, 2024 at 5:32=E2=80=AFPM Peter Maydell <peter.maydell@linaro.=
org>
wrote:

> On Tue, 3 Sept 2024 at 16:25, Mario Marietto <marietto2008@gmail.com>
> wrote:
> >
> > Hello.
> >
> > Actually I'm using my Jetson Nano and I'm trying to emulate Android 10
> by antmicro. I'm trying to use the same parameters used several years
> ago,when it worked. What I want to try now is to enable virtio-blk-pci on
> qemu. Probably in addition to using qemu 5.0,I had configured qemu with
> virtio-blk-pci enabled,because I used these parameters and they worked
> great :
> >
> > -drive
> index=3D0,if=3Dnone,id=3Dsystem,file=3D/home/aresuser/Desktop/antmicro/ao=
sp-img/system-rw.img
> \
> >         -device virtio-blk-pci,drive=3Dsystem \
> >         -drive
> index=3D1,if=3Dnone,id=3Dvendor,file=3D/home/aresuser/Desktop/antmicro/ao=
sp-img/vendor-rw.img
> \
> >         -device virtio-blk-pci,drive=3Dvendor \
> >         -drive
> index=3D2,if=3Dnone,id=3Duserdata,file=3D/home/aresuser/Desktop/antmicro/=
aosp-img/userdata.img
> \
> >         -device virtio-blk-pci,drive=3Duserdata \
> >
> > Can someone tell me how to enable the "VirtFS support" in qemu 5.0 ?
> because at the moment it is configured to "no" :
>
> VirtFS is 9pfs, not virtio, so unless you really want 9pfs
> you can ignore it. If you do need it, the requirements as
> of current QEMU are:
>  * Linux or macos host
>  * libattr-devel (for Linux)
> and I suspect they'll be similar for older QEMU.
>
> Passing configure "--enable-virtfs" should make it error out
> (possibly with a helpful error message) if it can't enable the
> feature.
>
> -- PMM
>


--=20
Mario.

--000000000000ed9639062138f52a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Nope,I don&#39;t need 9pfs. I&#39;m trying to understand w=
hat parameter I had enabled when it worked. Is there a parameter to pass to=
 enable the support for &quot;virtio-blk-pci&quot; ? (as I said,I&#39;m on =
the Jetson Nano now). Is virtio-blk-pci enabled by default ? If I should no=
t enable anything related to that,the last chance I have is to try qemu 5.1=
.0 instead of 5.0.<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Tue, Sep 3, 2024 at 5:32=E2=80=AFPM Peter Maydell =
&lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@linaro.org</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On =
Tue, 3 Sept 2024 at 16:25, Mario Marietto &lt;<a href=3D"mailto:marietto200=
8@gmail.com" target=3D"_blank">marietto2008@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hello.<br>
&gt;<br>
&gt; Actually I&#39;m using my Jetson Nano and I&#39;m trying to emulate An=
droid 10 by antmicro. I&#39;m trying to use the same parameters used severa=
l years ago,when it worked. What I want to try now is to enable virtio-blk-=
pci on qemu. Probably in addition to using qemu 5.0,I had configured qemu w=
ith virtio-blk-pci enabled,because I used these parameters and they worked =
great :<br>
&gt;<br>
&gt; -drive index=3D0,if=3Dnone,id=3Dsystem,file=3D/home/aresuser/Desktop/a=
ntmicro/aosp-img/system-rw.img \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-device virtio-blk-pci,drive=3Dsystem=
 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-drive index=3D1,if=3Dnone,id=3Dvendo=
r,file=3D/home/aresuser/Desktop/antmicro/aosp-img/vendor-rw.img \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-device virtio-blk-pci,drive=3Dvendor=
 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-drive index=3D2,if=3Dnone,id=3Duserd=
ata,file=3D/home/aresuser/Desktop/antmicro/aosp-img/userdata.img \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-device virtio-blk-pci,drive=3Duserda=
ta \<br>
&gt;<br>
&gt; Can someone tell me how to enable the &quot;VirtFS support&quot; in qe=
mu 5.0 ? because at the moment it is configured to &quot;no&quot; :<br>
<br>
VirtFS is 9pfs, not virtio, so unless you really want 9pfs<br>
you can ignore it. If you do need it, the requirements as<br>
of current QEMU are:<br>
=C2=A0* Linux or macos host<br>
=C2=A0* libattr-devel (for Linux)<br>
and I suspect they&#39;ll be similar for older QEMU.<br>
<br>
Passing configure &quot;--enable-virtfs&quot; should make it error out<br>
(possibly with a helpful error message) if it can&#39;t enable the<br>
feature.<br>
<br>
-- PMM<br>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">Mario.<br></d=
iv>

--000000000000ed9639062138f52a--
