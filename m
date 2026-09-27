Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39A29C98328
	for <qemu-arm@archiver.kernel.org>; Sun, 27 Sep 2026 00:08:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xAcRI-000198-DN; Sat, 26 Sep 2026 20:08:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xAcRG-00018f-9q
 for qemu-arm@nongnu.org; Sat, 26 Sep 2026 20:08:18 -0400
Received: from mail-ed2-x0e.google.com ([2a00:1450:4864:33::e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xAcRE-0005XK-EX
 for qemu-arm@nongnu.org; Sat, 26 Sep 2026 20:08:18 -0400
Received: by mail-ed2-x0e.google.com with SMTP id
 4fb4d7f45d1cf-6aaea178c96so2115728a12.3
 for <qemu-arm@nongnu.org>; Sat, 26 Sep 2026 17:08:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790467695; cv=none;
 d=google.com; s=arc-20260327;
 b=qRYxWKJvjkl7aIX6bwhZKwS37CNIesIvCACuLz4qjBSbmmw2hpEHhh5kh2+FKMCHQG
 dURhCV2O+Xj29jNeOOZzIoO9D4tzVJjI8+R9lmFPsxOw64X1fRw89ni2wpQkCiLUdiNC
 eMN4NXYp9MEohBN+rl/AxUhhuO+pSGecs+IRUeqnLS/PyARhaDoUrvxh3szG6FHNyzZ+
 VXZiVXSsmPbFeRe8Wxa6z0J6bI1VI9CPTcBy1YHHP6lGMHnDNj0Ws5qhq1JwP9nGuh92
 /ioBs+cTP/ER9opFj1krIfpnJwjrisZqynSbWAWXXJDamkwPpVWLimyiChj4w+p4W6o5
 z+Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
 :mime-version:dkim-signature;
 bh=UKM+5PQ2HuuWEDJIWiPIZCGezMD8Lmj5jjp3C6dDZxY=;
 fh=3mOo4gFntnFRwI31zNRAkkeSBBW7fhjDpFyaDl1A6bM=;
 b=fCsrkuoS765AnjhiJ+lartgGkSakBOPjtj3S47Ij/Km0V+L4Ww8qN8ifpBSGnbVr/D
 7yMPtvqqhYcSOmVJv4KqH28US6oB1D+qno04Xdan0xZL01kbe4KmbjQPgHZ+0I73NJgg
 bNCIWtrawnQ1OWv+441i22XU5eNB7B8E+Ma6dZ1zMnzjEf92dKs3le5+aGMENdQjxsYW
 Jj8nZVE0v1e/sD06fWUzm22XrDNHzUFJKvs+oL8PJ5CWbdNSKNnvAceflXBXSsb3yeor
 M0VgyYUmRNeiod0r4D3tbOc5lqrUdEqqtNsxPXyREyQT9ovJexBzxtiUpHjWKb4DLcby
 wfhg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790467695; x=1791072495; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:reply-to
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=UKM+5PQ2HuuWEDJIWiPIZCGezMD8Lmj5jjp3C6dDZxY=;
 b=VFCpeMCRPn0KTTRMWjiPrxbStMIwHHwosqg13q2kmO303zKg+H7wfCpMyF2JaEAsMB
 cjNqN0WNHTq2f62ZSOYLBjh0lz8+31iY2PE2bq1dsyAXaTG9d1bZYuoo2qyDk+AdnWCM
 NlIeeq8kqYxAUoBbb1d+Z3jyEqhq2hhlC/EeBtMrD3U/yyJ0/CSNki7WJdPmuz5OsrUt
 9Gx940zzmI/mED9vrTHFwduoNFmkaUH1wRVozf73Dl32NdlHizERWy7jpEsrrhmKDSRI
 29yfanmjrl9sD3lF87PvG+lR3eFnz8VYfC7sH6e7uZXLmMiPCQxr5lBS14nFUPuQvx6o
 rFXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790467695; x=1791072495;
 h=content-type:cc:to:subject:message-id:date:from:reply-to
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=UKM+5PQ2HuuWEDJIWiPIZCGezMD8Lmj5jjp3C6dDZxY=;
 b=LUcZ/EJvdTa1dlTKQexDPdQGJPy0QiuQpxPAnwjIURcVAl0K7yhFRpgtMyA4UchfVD
 YdXMwOHk+8BIs37Pz5mQS2qgWbTSRRTJaTdYd7/w0xbOauy5abz92yxpHko//rhsrnGo
 uYJ5Z0iT1Pjc8ndCzJPeZJbc8H8WV78KX67+2X/cwVUTcPpP0IjopHoKKLQeTqzsH7DD
 82VmaZ5/pwxhQVAMdxZgVgLQPX+ZVZDNbauYS7TUsSE//DNdyFjOgTMm1Lfg+DjDjdx8
 PrNfJAg0idKffFHf+J1+3+WkRhOnViKOwLgdGtpx9vrKzt7Op71pKI63XS6OQPEATA5x
 G0+Q==
X-Forwarded-Encrypted: i=1;
 AKwUvBwapVDTJ175KYbt+6jJ/+cUjD0d5w41Bl+10ViJ8FODVQEBpG1yRXJepvTDOeI+/70G+c4FGpkFAA==@nongnu.org
X-Gm-Message-State: AFq9FYJ9t/7GvUZcpcL6gXy/FDaZQU3QsTAvXZWtUjJhVKhY0m81OOza
 hlHf7WbCfSOUDtaKAzsCI+Jrk5BTFDdMHWBacjH5r6vSuArRzk4Lx8e1SBZIuRl8NS2Tg/SFw1a
 yjfYpaUchEvAyNlRLuPlug2+u8Ptqjqc=
X-Gm-Gg: AYBFou2semcQZxR0vnClLtmaMSqHsBiBtnO42gK4ULmNPqOSLbXRszyV1iWF0obdT4c
 RcAWfEq8W3EhliUWhj34l1liD896rfYjn9yOH5BjkP6VlXTGlaXfB/hrVpIkjnCLMO2EbcWcgGR
 f5IZn5EXPyYoaDA4K5Hg8nMyTDhhwLHfah+1GKQKzKPd7rOKWw42VzgYZW+RV7NLhSrtTFyi4ou
 TkANF/CEj2P1snXWbSYGffy4mDq5W4XfUqctdiU/06v2Ym7Fx2ar+04rvWqHH1dvbK/9eqo3CAX
 s2pSeqdK7M2z6wn52CpLDnVLNWk5dnQEhneEkKYlBhWn/4MtdZJoToU=
X-Received: by 2002:a05:6402:4494:b0:6ab:541:a685 with SMTP id
 4fb4d7f45d1cf-6ab0541c080mr1942313a12.17.1790467694320; Sat, 26 Sep 2026
 17:08:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260923131635.1894-1-luoyonggang@gmail.com>
 <20260923131635.1894-29-luoyonggang@gmail.com>
 <5687f0f3-052a-4e16-9747-0be60296e07a@oss.qualcomm.com>
In-Reply-To: <5687f0f3-052a-4e16-9747-0be60296e07a@oss.qualcomm.com>
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Sun, 27 Sep 2026 08:08:01 +0800
X-Gm-Features: AclHuK9GTDw59PSmvQn9GZmAFMJououA1PQmQRoLQXooftHLs4G9T0uQ4MpS95c
Message-ID: <CAE2XoE-N56GNgQLBqee8U5RP7g2zj=_Z4Hr+R1-BHvwA+9x_3w@mail.gmail.com>
Subject: Re: [PATCH v3 028/114] hw/intc: use kvm_enabled() in APLIC AIA helpers
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, Cornelia Huck <cohuck@redhat.com>, 
 xen-devel@lists.xenproject.org, Chao Liu <chao.liu@processmission.com>, 
 Igor Mammedov <imammedo@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Peter Xu <peterx@redhat.com>, 
 Eric Blake <eblake@redhat.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Peter Maydell <peter.maydell@linaro.org>, Sunil V L <sunilvl@ventanamicro.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Fabiano Rosas <farosas@suse.de>, Xianglai Li <lixianglai@loongson.cn>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-ppc@nongnu.org, 
 Zhao Liu <zhao1.liu@intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Bibo Mao <maobibo@loongson.cn>, "Michael S. Tsirkin" <mst@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, David Hildenbrand <david@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Nicholas Piggin <npiggin@gmail.com>, qemu-riscv@nongnu.org, kvm@vger.kernel.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Stafford Horne <shorne@gmail.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 Song Gao <17746591750@163.com>, 
 qemu-arm@nongnu.org, qemu-s390x@nongnu.org, 
 Brian Cain <brian.cain@oss.qualcomm.com>
Content-Type: multipart/alternative; boundary="000000000000e6df7a065c6bbe69"
Received-SPF: pass client-ip=2a00:1450:4864:33::e;
 envelope-from=luoyonggang@gmail.com; helo=mail-ed2-x0e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, SPF_HELO_NONE=0.001,
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
Reply-To: luoyonggang@gmail.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

--000000000000e6df7a065c6bbe69
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 26, 2026 at 5:35=E2=80=AFPM Philippe Mathieu-Daud=C3=A9 <
philmd@oss.qualcomm.com> wrote:
>
> On 23/9/26 15:15, Yonggang Luo wrote:
> > - Replace CONFIG_KVM ifdefs in riscv_use_emulated_aplic and
> >    riscv_aplic_set_kvm_msicfgaddr with kvm_enabled().
>
> Can you provide your S-o-b tag please?

Thanks, I forgot this, the following patches will attach S-o-b. This series
is dropped as gmail limits me to send all the things.

>
> > ---
> >   hw/intc/riscv_aplic.c | 14 ++++++++------
> >   1 file changed, 8 insertions(+), 6 deletions(-)
> >
> > diff --git a/hw/intc/riscv_aplic.c b/hw/intc/riscv_aplic.c
> > index d8e25bfda14..03a0852b8b8 100644
> > --- a/hw/intc/riscv_aplic.c
> > +++ b/hw/intc/riscv_aplic.c
> > @@ -167,7 +167,10 @@ bool riscv_is_kvm_aia_aplic_imsic(bool msimode)
> >
> >   bool riscv_use_emulated_aplic(bool msimode)
> >   {
> > -#ifdef CONFIG_KVM
> > +    if (!kvm_enabled()) {
> > +        return true;
> > +    }
> > +
> >       if (tcg_enabled()) {
> >           return true;
> >       }
> > @@ -177,21 +180,20 @@ bool riscv_use_emulated_aplic(bool msimode)
> >       }
> >
> >       return kvm_kernel_irqchip_split();
> > -#else
> > -    return true;
> > -#endif
> >   }
> >
> >   void riscv_aplic_set_kvm_msicfgaddr(RISCVAPLICState *aplic, hwaddr
addr)
> >   {
> > -#ifdef CONFIG_KVM
> > +    if (!kvm_enabled()) {
> > +        return;
> > +    }
> > +
> >       if (riscv_use_emulated_aplic(aplic->msimode)) {
> >           addr >>=3D APLIC_xMSICFGADDR_PPN_SHIFT;
> >           aplic->kvm_msicfgaddr =3D extract64(addr, 0, 32);
> >           aplic->kvm_msicfgaddrH =3D extract64(addr, 32, 32) &
> >                                    APLIC_MMSICFGADDRH_VALID_MASK;
> >       }
> > -#endif
> >   }
> >
> >   /*
>


--
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

--000000000000e6df7a065c6bbe69
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Sat, Sep 26, 2026 at 5:35=E2=80=AFPM Philippe M=
athieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@oss.qualcomm.com">philmd@oss=
.qualcomm.com</a>&gt; wrote:<br>&gt;<br>&gt; On 23/9/26 15:15, Yonggang Luo=
 wrote:<br>&gt; &gt; - Replace CONFIG_KVM ifdefs in riscv_use_emulated_apli=
c and<br>&gt; &gt; =C2=A0 =C2=A0riscv_aplic_set_kvm_msicfgaddr with kvm_ena=
bled().<br>&gt;<br>&gt; Can you provide your S-o-b tag please?<div><br></di=
v><div>Thanks, I forgot this, the following patches will attach S-o-b. This=
 series is dropped as gmail limits me to send all the things.</div><div><br=
>&gt;<br>&gt; &gt; ---<br>&gt; &gt; =C2=A0 hw/intc/riscv_aplic.c | 14 +++++=
+++------<br>&gt; &gt; =C2=A0 1 file changed, 8 insertions(+), 6 deletions(=
-)<br>&gt; &gt;<br>&gt; &gt; diff --git a/hw/intc/riscv_aplic.c b/hw/intc/r=
iscv_aplic.c<br>&gt; &gt; index d8e25bfda14..03a0852b8b8 100644<br>&gt; &gt=
; --- a/hw/intc/riscv_aplic.c<br>&gt; &gt; +++ b/hw/intc/riscv_aplic.c<br>&=
gt; &gt; @@ -167,7 +167,10 @@ bool riscv_is_kvm_aia_aplic_imsic(bool msimod=
e)<br>&gt; &gt; =C2=A0 <br>&gt; &gt; =C2=A0 bool riscv_use_emulated_aplic(b=
ool msimode)<br>&gt; &gt; =C2=A0 {<br>&gt; &gt; -#ifdef CONFIG_KVM<br>&gt; =
&gt; + =C2=A0 =C2=A0if (!kvm_enabled()) {<br>&gt; &gt; + =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return true;<br>&gt; &gt; + =C2=A0 =C2=A0}<br>&gt; &gt; +<br>&gt;=
 &gt; =C2=A0 =C2=A0 =C2=A0 if (tcg_enabled()) {<br>&gt; &gt; =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 return true;<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 }<br>&g=
t; &gt; @@ -177,21 +180,20 @@ bool riscv_use_emulated_aplic(bool msimode)<b=
r>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 }<br>&gt; &gt; =C2=A0 <br>&gt; &gt; =C2=A0=
 =C2=A0 =C2=A0 return kvm_kernel_irqchip_split();<br>&gt; &gt; -#else<br>&g=
t; &gt; - =C2=A0 =C2=A0return true;<br>&gt; &gt; -#endif<br>&gt; &gt; =C2=
=A0 }<br>&gt; &gt; =C2=A0 <br>&gt; &gt; =C2=A0 void riscv_aplic_set_kvm_msi=
cfgaddr(RISCVAPLICState *aplic, hwaddr addr)<br>&gt; &gt; =C2=A0 {<br>&gt; =
&gt; -#ifdef CONFIG_KVM<br>&gt; &gt; + =C2=A0 =C2=A0if (!kvm_enabled()) {<b=
r>&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>&gt; &gt; + =C2=A0 =C2=
=A0}<br>&gt; &gt; +<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 if (riscv_use_emulate=
d_aplic(aplic-&gt;msimode)) {<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 addr &gt;&gt;=3D APLIC_xMSICFGADDR_PPN_SHIFT;<br>&gt; &gt; =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 aplic-&gt;kvm_msicfgaddr =3D extract64(addr, 0, 32=
);<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 aplic-&gt;kvm_msicfgaddr=
H =3D extract64(addr, 32, 32) &amp;<br>&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0APLIC_MMSICFGADDRH_VALID_MASK;<br>&gt; &gt; =C2=
=A0 =C2=A0 =C2=A0 }<br>&gt; &gt; -#endif<br>&gt; &gt; =C2=A0 }<br>&gt; &gt;=
 =C2=A0 <br>&gt; &gt; =C2=A0 /*<br>&gt;<br><br><br>--<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0=E6=AD=A4=E8=87=B4<br>=E7=A4=BC<br>=E7=BD=97=E5=8B=87=E5=
=88=9A<br>Yours<br>=C2=A0 =C2=A0 sincerely,<br>Yonggang Luo</div></div>

--000000000000e6df7a065c6bbe69--

