Received: by 2002:a17:505:6015:b0:1be9:327d:8ee3 with SMTP id us21csp284032njc;
        Thu, 5 Jun 2025 07:22:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXZd+j/NZ2IDqPmpMuzhcl0TRp7e8NBvLen+/QuVCCO8SLn/kfh/FY4WGLL95d0q/V42j2Iey+CJBPrsQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFMa534l9crAUj1GKFnxs3YQh9KYWKsDQ1Wn6HN9Mtdcjfv2JOs1zLPm5cDRKxkB3gxQ4qA
X-Received: by 2002:a05:622a:4ac6:b0:4a4:3086:2ac6 with SMTP id d75a77b69052e-4a5a582e026mr113408391cf.52.1749133349043;
        Thu, 05 Jun 2025 07:22:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749133349; cv=none;
        d=google.com; s=arc-20240605;
        b=KlaytsOr1OOjArVEhP7ZdrwfuDTMWSuFq0AFMgRXpGydwXVjnq+2ori75fUV/e4KZP
         QiJiCzryn6RRj+g4nZx+ePyrQNeu49/zDvMerArlxviwFWAZnkbWTrWpFidCbvLTMmR2
         c75KmyjxoclhPp/1x7VAgVK8LHDB5RyNVHlWWwWYdyiKRAsszPMez1tlFKr1nvzJYJxA
         R8s5jxmcuQSrnU8rVVK6knuxDyiqqAiMsENb4NYI+bRWKFMWG3HFd2YCjGMlt2/GRcqP
         sDucChvw7VyOAo9zz8eZGZ2V1eCxrYFSUeQ5tXm7B1Yackx7UoyO2g/nXrPE1KwkFmBl
         rTNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=SRdzD7ZQN8BMWfgAisKzDMkuBRwVVn5vbPGVFjaxMSo=;
        fh=W+9lqOwYKkeDrPoFWlFMGBkKiRi71vwD43j9ZyNwpms=;
        b=e27sUYfmDSfX+Z0rJnuCM3VSYVsuxQ0ReTwh8XtXp0QmTND0UQqbHQL7zyzSk6tFle
         +h5pAI8L7xPe6ScIxxhuT8TvZCtFkrFrpb5kNIvU3eV62+lLW367a8jPaycpVx3DTGVu
         /b81lP/w2tRbNRUkrBrlVTlfwkhaj9eseq9ITAvedN1AJU4tbL3TMJW3HWFRiOe+vT5a
         l9tT4bjnm8Px7IwVlcFAu0hw2WuWm5tByEuxT+R607M2efeaEPdOxRBX+6JiaO81kTxD
         RpNil09VoXj0QyL1uTVOvMx27zJxY/ydw6AtQI8Vc4YtDzq5MfKAkyBxqCdQ0KM5w7Ap
         2mcQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="lJpkoCE/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a581f72e74si131048991cf.356.2025.06.05.07.22.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Jun 2025 07:22:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="lJpkoCE/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uNBU9-0006pY-5a; Thu, 05 Jun 2025 10:22:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cocotroupe20@gmail.com>)
 id 1uNBU2-0006of-0L
 for qemu-arm@nongnu.org; Thu, 05 Jun 2025 10:22:18 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cocotroupe20@gmail.com>)
 id 1uNBTp-0001fz-VG
 for qemu-arm@nongnu.org; Thu, 05 Jun 2025 10:22:17 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-450ce3a2dd5so9218415e9.3
 for <qemu-arm@nongnu.org>; Thu, 05 Jun 2025 07:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749133317; x=1749738117; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SRdzD7ZQN8BMWfgAisKzDMkuBRwVVn5vbPGVFjaxMSo=;
 b=lJpkoCE/BJDvDLRwZbK6PdBnl+Nr6qUXRHmOVss/7k5BPqYKpoItqXKgsC5iTKLHNX
 tEwrLckFV9eyPfFE9mgQeUTSASA4bw2hzzki6l8CDqS515TZzndhFfLQ7DvEU0LEpvq2
 7B7jq1wrs/Qzc5aGOd+6H4iY601JoSulq4OXRizj7fE7GD5lfxCZ8zMpvj2SAVLl6t9n
 v9WDyVjzu6SAULqncma7MeNh1XO2ALnDeXfNmG4dHqIHtf8+ovD8MAIpEB3CeX8Stf/C
 Yf75tKTbobrh7j+kueUnc4u027EAhnbbOb33V9pIE8GWXd4nXL/44RVpajJm2m/LBr8C
 l+Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749133317; x=1749738117;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SRdzD7ZQN8BMWfgAisKzDMkuBRwVVn5vbPGVFjaxMSo=;
 b=tviPt8yrZuucvdr1Lc4SJGxrfXnJOtvzOqreHF6kFifABAT+oET0pa0KDxvyL5VnI/
 Jpt+yjemdnzH5JGWf1uHwdxsrsexzkxHBfyhbBRoSH5OaRHffJ5/rt+8jCmKB8iM739S
 EeHUPa9UsBCN5etjifDt8SfgAGx9NzrwYpg9nL7qJyX2qINJmav52OJmCs/e4KvDXdrx
 LQtT4BU6xaFU/kSxtITMDHx9ncsRb8AgBQXQJXcnkc9YVRO2+8soz6xk4ogSMRCHvXZh
 FVupRuSSjvdltx1Snh+s/UWn/34rYNRUAcqSoBX4YMXCedNyVpmPEbUKv7+UkGeQ2+vZ
 M4TQ==
X-Gm-Message-State: AOJu0YzlG+WqCpMWVWYeNU8mahVIWvUhTQFgSj2nHcokrn1yRaltNkji
 vYqR4GEaLQAbw2zlxHGrmHevWUjlvmnqpiDjdIzYuCfwAlR7Ut/w0Wz3PR8AN0GFWKk+qWsMUgE
 l3rUpkn/Cbd5t3ewFFUg0kNbiWUpvSqo=
X-Gm-Gg: ASbGncsVU1wBgwyrToMGNXlfwdnjQva7St260hf7i2NjhXP/KULq8EdWZauyHvN4bgj
 T1FqZrRCA+5l0pXJ7xAnINGURXbGaJLFefbv/atUXLcKqlZwzPiTNz952qd9U0j+P17L1mXcPHd
 Xx8dcqLk7UaYLr7KVJeBmKF68+rhbVeya0Rkm/8aHZR14J
X-Received: by 2002:a5d:5885:0:b0:3a3:5f36:33ee with SMTP id
 ffacd0b85a97d-3a51d970a2emr5705000f8f.32.1749133317100; Thu, 05 Jun 2025
 07:21:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAPwCrcOwX3Atxwzrk=Rtpya_i_STv9+Gi8uY6ryJigPvhk5+DQ@mail.gmail.com>
 <CAFEAcA9y0P9KEQnv7fPxc8k5paCZQoQc2CqaVHTLFWm6+Aau5A@mail.gmail.com>
In-Reply-To: <CAFEAcA9y0P9KEQnv7fPxc8k5paCZQoQc2CqaVHTLFWm6+Aau5A@mail.gmail.com>
From: Corentin GENDRE <cocotroupe20@gmail.com>
Date: Thu, 5 Jun 2025 16:21:45 +0200
X-Gm-Features: AX0GCFs3wGvInWTLbmIFh8unAc8_oZsz1yGmSNOUXZdvHb8lRO58I7953NWDSxc
Message-ID: <CAPwCrcMHJxQW002RPxUS2aO=4BpNYCZzGSPw_JkcVn8gVAcQ-g@mail.gmail.com>
Subject: Re: Inquiry About MPU Region Limit for Cortex-M7 in QEMU
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000007da2d0636d3d6c6"
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=cocotroupe20@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: fK6oZOVcz0FF

--00000000000007da2d0636d3d6c6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for your answer.

Le jeu. 5 juin 2025 =C3=A0 15:49, Peter Maydell <peter.maydell@linaro.org> =
a
=C3=A9crit :

> On Wed, 4 Jun 2025 at 18:38, Corentin GENDRE <cocotroupe20@gmail.com>
> wrote:
> > Dear QEMU Support Team,
>
> There is no QEMU Support Team: just people who use it and
> who work on it :-)
>
> > I am currently working with the emulation of a Cortex-M7 target using
> QEMU and have encountered a limitation regarding the Memory Protection Un=
it
> (MPU). According to the ARM Cortex-M7 (and the MPS2-AN500) technical
> reference manual, the MPU should support up to 16 memory regions. However=
,
> in the current QEMU implementation, I noticed that only 12 MPU regions
> appear to be emulated.
> >
> > Could you please confirm whether this limitation is intentional or if
> there is a way to modify the number of MPU regions supported by QEMU for
> the Cortex-M7? If this parameter can be adjusted, I would greatly
> appreciate any guidance or documentation on how to do so.
>
> This is a bug, but I don't think we are setting up 12 MPU
> regions; we default to 8 for the Cortex-M7 and we aren't
> overriding this for the mps2-an500 board. (This is because
> this board shares code with the AN385, AN386 and AN511:
> those are all Cortex-M3 and -M4, which don't have a configurable
> number of MPU regions, so always have 8. The M7 does have a
> config knob for this (you can select "no MPU", 8 regions, or 16)
> but we missed setting it correctly when we added the AN500 handling.)
>
> This (only very lightly tested) patch ought to fix it; I'll
> send that to qemu-devel in a bit. Let me know if it works for you.
>
> Author: Peter Maydell <peter.maydell@linaro.org>
> Date:   Thu Jun 5 14:36:16 2025 +0100
>
>     hw/arm/mps2: Configure the AN500 CPU with 16 MPU regions
>
>     The AN500 application note documents that it configures the Cortex-M7
>     CPU to have 16 MPU regions. We weren't doing this in our emulation,
>     so the CPU had only the default 8 MPU regions. Set the mpu-ns-regions
>     property to 16 for this board.
>
>     This bug doesn't affect any of the other board types we model in
>     this source file, because they all use either the Cortex-M3 or
>     Cortex-M4. Those CPUs do not have an RTL configurable number of
>     MPU regions, and always provide 8 regions if the MPU is built in.
>
>     Cc: qemu-stable@nongnu.org
>     Reported-by: Corentin GENDRE <cocotroupe20@gmail.com>
>     Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>
> diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
> index 58efb41e6db..50e1a1c1c80 100644
> --- a/hw/arm/mps2.c
> +++ b/hw/arm/mps2.c
> @@ -224,7 +224,11 @@ static void mps2_common_init(MachineState *machine)
>      switch (mmc->fpga_type) {
>      case FPGA_AN385:
>      case FPGA_AN386:
> +        qdev_prop_set_uint32(armv7m, "num-irq", 32);
> +        break;
>      case FPGA_AN500:
> +        /* The AN500 configures its Cortex-M7 with 16 MPU regions */
> +        qdev_prop_set_uint32(armv7m, "mpu-ns-dregions", 16);
>          qdev_prop_set_uint32(armv7m, "num-irq", 32);
>          break;
>      case FPGA_AN511:
>
>
> thanks
> -- PMM
>

--00000000000007da2d0636d3d6c6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Thank you for your answer.=C2=A0<br></div=
><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" clas=
s=3D"gmail_attr">Le=C2=A0jeu. 5 juin 2025 =C3=A0=C2=A015:49, Peter Maydell =
&lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@linaro.org</a=
>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Wed, 4 Jun 2025 at 18:38, Corentin GENDRE &lt;<a href=3D"mail=
to:cocotroupe20@gmail.com" target=3D"_blank">cocotroupe20@gmail.com</a>&gt;=
 wrote:<br>
&gt; Dear QEMU Support Team,<br>
<br>
There is no QEMU Support Team: just people who use it and<br>
who work on it :-)<br>
<br>
&gt; I am currently working with the emulation of a Cortex-M7 target using =
QEMU and have encountered a limitation regarding the Memory Protection Unit=
 (MPU). According to the ARM Cortex-M7 (and the MPS2-AN500) technical refer=
ence manual, the MPU should support up to 16 memory regions. However, in th=
e current QEMU implementation, I noticed that only 12 MPU regions appear to=
 be emulated.<br>
&gt;<br>
&gt; Could you please confirm whether this limitation is intentional or if =
there is a way to modify the number of MPU regions supported by QEMU for th=
e Cortex-M7? If this parameter can be adjusted, I would greatly appreciate =
any guidance or documentation on how to do so.<br>
<br>
This is a bug, but I don&#39;t think we are setting up 12 MPU<br>
regions; we default to 8 for the Cortex-M7 and we aren&#39;t<br>
overriding this for the mps2-an500 board. (This is because<br>
this board shares code with the AN385, AN386 and AN511:<br>
those are all Cortex-M3 and -M4, which don&#39;t have a configurable<br>
number of MPU regions, so always have 8. The M7 does have a<br>
config knob for this (you can select &quot;no MPU&quot;, 8 regions, or 16)<=
br>
but we missed setting it correctly when we added the AN500 handling.)<br>
<br>
This (only very lightly tested) patch ought to fix it; I&#39;ll<br>
send that to qemu-devel in a bit. Let me know if it works for you.<br>
<br>
Author: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org" targe=
t=3D"_blank">peter.maydell@linaro.org</a>&gt;<br>
Date:=C2=A0 =C2=A0Thu Jun 5 14:36:16 2025 +0100<br>
<br>
=C2=A0 =C2=A0 hw/arm/mps2: Configure the AN500 CPU with 16 MPU regions<br>
<br>
=C2=A0 =C2=A0 The AN500 application note documents that it configures the C=
ortex-M7<br>
=C2=A0 =C2=A0 CPU to have 16 MPU regions. We weren&#39;t doing this in our =
emulation,<br>
=C2=A0 =C2=A0 so the CPU had only the default 8 MPU regions. Set the mpu-ns=
-regions<br>
=C2=A0 =C2=A0 property to 16 for this board.<br>
<br>
=C2=A0 =C2=A0 This bug doesn&#39;t affect any of the other board types we m=
odel in<br>
=C2=A0 =C2=A0 this source file, because they all use either the Cortex-M3 o=
r<br>
=C2=A0 =C2=A0 Cortex-M4. Those CPUs do not have an RTL configurable number =
of<br>
=C2=A0 =C2=A0 MPU regions, and always provide 8 regions if the MPU is built=
 in.<br>
<br>
=C2=A0 =C2=A0 Cc: <a href=3D"mailto:qemu-stable@nongnu.org" target=3D"_blan=
k">qemu-stable@nongnu.org</a><br>
=C2=A0 =C2=A0 Reported-by: Corentin GENDRE &lt;<a href=3D"mailto:cocotroupe=
20@gmail.com" target=3D"_blank">cocotroupe20@gmail.com</a>&gt;<br>
=C2=A0 =C2=A0 Signed-off-by: Peter Maydell &lt;<a href=3D"mailto:peter.mayd=
ell@linaro.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt;<br>
<br>
diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c<br>
index 58efb41e6db..50e1a1c1c80 100644<br>
--- a/hw/arm/mps2.c<br>
+++ b/hw/arm/mps2.c<br>
@@ -224,7 +224,11 @@ static void mps2_common_init(MachineState *machine)<br=
>
=C2=A0 =C2=A0 =C2=A0switch (mmc-&gt;fpga_type) {<br>
=C2=A0 =C2=A0 =C2=A0case FPGA_AN385:<br>
=C2=A0 =C2=A0 =C2=A0case FPGA_AN386:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qdev_prop_set_uint32(armv7m, &quot;num-irq&quo=
t;, 32);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
=C2=A0 =C2=A0 =C2=A0case FPGA_AN500:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* The AN500 configures its Cortex-M7 with 16 =
MPU regions */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qdev_prop_set_uint32(armv7m, &quot;mpu-ns-dreg=
ions&quot;, 16);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qdev_prop_set_uint32(armv7m, &quot;num-ir=
q&quot;, 32);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0case FPGA_AN511:<br>
<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div></div>

--00000000000007da2d0636d3d6c6--
