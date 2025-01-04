Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp10938763njk;
        Sat, 4 Jan 2025 12:52:41 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUzoSybY6d4nLyII2S+V+/Y1lLVNzvicO9aWaX7qpcLcsU+bmHsx1uanPNMmwPBBt0O5VJLgmS0Cwhz7g==@linaro.org
X-Google-Smtp-Source: AGHT+IExPYM1JQIvG9sK8irJ7WyjMZOeGn4NAcrs++cKU7qhO/gMPhTdJ7dCLtvY6Lxw9uqZ/NtU
X-Received: by 2002:ad4:5d4e:0:b0:6d8:8fdd:9797 with SMTP id 6a1803df08f44-6dd2339d938mr784819746d6.36.1736023961378;
        Sat, 04 Jan 2025 12:52:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736023961; cv=none;
        d=google.com; s=arc-20240605;
        b=k8TlDHNQmCs8uZ2vGnNJSr5HQvvjsGpRgumPO0h5taY7xpLRIt73a5Nx4ScgsWVJMl
         62kb4T8moEjziE+HkmHGxz2rSawb3YzRGnVAZUoHX84sAOTDphuwFtJ43X6tFzhC/Vld
         JTDjnJPHq5QBreUr+vURiqz/ycZSoOXY7sQ6YGsylvyrsKAi8oCtgRTPAb4GTV0QkRnW
         onoIoXwVrX6Bf/pTc3L2FsQ2UI8KonzaKNKc3HL1WDshWhuvtsP1qlWYu6WnWmwigDxK
         fgNC2jLInL1zHD6EJ/BmttkQLqWIxCjLP/drNCx7WNgAOnvD38OLRgARY21bL1lO3hCP
         6MCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=kFDlTfpF8i6VCYfxZ4G9kev/+B3xmqJOSlU0tdmmlLQ=;
        fh=BSRugdxVHM1dnqPJsJwWCK61m5K+9vDWIy6s+f07zU8=;
        b=T4+7Wyk1R7tp7+1jfEipwzqx707wIQaCLGZanDPiTmfm2zGEO4v5qXZFd+dBXcx9KS
         YHSc4wQAqHn1Egytme+5QeEbCaKPNNOi/oiJFW4pJ5+LZn146LPE/4sZe8hkTJTgJBno
         E+IbI7cbN8hO5gVgOxy50e4uOmejQBAT54GkyDjoDZ9MclOuOVW0oRSBu3vYwheabKSB
         ME7uRue7AVoqTsgkeWewsQvAQzKa4IBcweYe5rDrOO9ZpkGSitNcfPG1T3txI7fil0vK
         Yg+FXXVENMkKueAzaRpWvWsjHytupRVV/CcpKHmxuSmsuDakmWDRVtdVAfhkmiVMDHkR
         t5Sg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=DxKOLTbz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6dd1810cc21si425906916d6.59.2025.01.04.12.52.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 04 Jan 2025 12:52:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=DxKOLTbz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tUB83-0007Vi-Kx; Sat, 04 Jan 2025 15:52:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tUB7u-0007Uo-Pf
 for qemu-arm@nongnu.org; Sat, 04 Jan 2025 15:52:07 -0500
Received: from mail-vk1-xa34.google.com ([2607:f8b0:4864:20::a34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tUB7q-00024y-4N
 for qemu-arm@nongnu.org; Sat, 04 Jan 2025 15:52:05 -0500
Received: by mail-vk1-xa34.google.com with SMTP id
 71dfb90a1353d-5174d53437eso7857225e0c.2
 for <qemu-arm@nongnu.org>; Sat, 04 Jan 2025 12:52:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1736023919; x=1736628719;
 darn=nongnu.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kFDlTfpF8i6VCYfxZ4G9kev/+B3xmqJOSlU0tdmmlLQ=;
 b=DxKOLTbz20mHN5Dot0sGFhKVHlzd+hvruQ9XR2ymrCa2DgujcoaStfrWGlIDUnslbp
 ODK5qawzF+rR2bVKBIgdLGjSQEhdJuBzTrwV7ExhGG5rUUJssnzxHr3bJgq4IesKumne
 65EftJ2iHdPqzxRmvOxbSu3vEoAoi2y2jT/JACJXRcg4BvuUQvZ0G4gHlVmariSjNNhN
 y1bOBdPrVfISjk3oItNigQ+3bIdivqyaJ86f9QSRAAfvMPuxTVzUG5e6ZqNo0MmFs5+V
 WoGSkGgyelyoF1ATms2aZI4PfmX54CEPpooMxxRnkE5YvX75/CQ4jpHeE3AZQL66rODk
 gFww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736023919; x=1736628719;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kFDlTfpF8i6VCYfxZ4G9kev/+B3xmqJOSlU0tdmmlLQ=;
 b=C2qhxMHnYN4NMjgbeYJPeiCNG09Zh/KUKvnAjTx9GeG+bwgWouNClcgLp+KB9ptKlS
 NHo+u1qRERLX8BkClPKgdde9dg6EwChtppSjxCTQFN5BEKHgNBpN5ZeM6bUQ9QUFBOy9
 5zj3lK/nDvBrcUILVoIhK6SOOs5nRkuPuZjMgqTqJgiGBXN/BNEcWgLwYYJSY3KHr/90
 yrIcE6eS5Y60OY3aTPRByxVzVyZff9od07MLeeJ+29kH8p65BmMO8Hm8+wYVf1Ho2I9W
 DwsRPh8Cc9pANfL7WYrEqEhh94/e8oeELhoDSdl4+giGmLfj2gKYotHIXZrU1OgPGQqW
 hoAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbGQoPJBOXULN2mZFy3RNqBLz7x21rluCkxfOsmVoCaZw/H2eB+eSnb70kjlRMVbHz8m8xVh9NwQ==@nongnu.org
X-Gm-Message-State: AOJu0YwzUsp/b/YaC0b23JtHVY7KgJoqwpkYSbPCU4WbtnlffA/tojym
 WAgPWYPunpoJz/XO6lcxrR2V1nv8nk31CNIWDdJKGC09cqx/3zyyvUoG9Me2uODRA8zG2RsSGpa
 ID3ntd/uq9lC9Aiqv+1FSHSegN9XKe46NCks9
X-Gm-Gg: ASbGncszBNo4ijUFG9KEDurBUwvMs3o1NP4BCdgkbNKzQrXU3keaX8Zme6mj9tw3tgV
 C7+dlpNxhoRaMcRDZ3241GmmZD5xmlsy91Y9bHw==
X-Received: by 2002:a05:6122:2519:b0:516:1106:4c1a with SMTP id
 71dfb90a1353d-51b75d6b15emr32965434e0c.12.1736023919465; Sat, 04 Jan 2025
 12:51:59 -0800 (PST)
MIME-Version: 1.0
References: <20241223221645.29911-1-phil@philjordan.eu>
 <20241223221645.29911-15-phil@philjordan.eu>
 <2ceda358-adce-42bd-9f29-9a2e441361f0@linaro.org>
 <34ddf42c-8bb1-4155-90cf-69e1032b0437@daynix.com>
In-Reply-To: <34ddf42c-8bb1-4155-90cf-69e1032b0437@daynix.com>
From: Phil Dennis-Jordan <phil@philjordan.eu>
Date: Sat, 4 Jan 2025 21:51:48 +0100
Message-ID: <CAAibmn1RCQ4ae2LLDmOUhTCdbUzymyeusx_g+6AmJ1zD+szhDA@mail.gmail.com>
Subject: Re: [PATCH v16 14/14] hw/vmapple/vmapple: Add vmapple machine type
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-devel@nongnu.org, agraf@csgraf.de, peter.maydell@linaro.org, 
 pbonzini@redhat.com, rad@semihalf.com, quic_llindhol@quicinc.com, 
 stefanha@redhat.com, mst@redhat.com, slp@redhat.com, 
 richard.henderson@linaro.org, eduardo@habkost.net, marcel.apfelbaum@gmail.com, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, chenhuacai@kernel.org, 
 kwolf@redhat.com, hreitz@redhat.com, shorne@gmail.com, palmer@dabbelt.com, 
 alistair.francis@wdc.com, bmeng.cn@gmail.com, liwei1518@gmail.com, 
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, jcmvbkbc@gmail.com, 
 marcandre.lureau@redhat.com, berrange@redhat.com, qemu-arm@nongnu.org, 
 qemu-block@nongnu.org, qemu-riscv@nongnu.org, balaton@eik.bme.hu, 
 Alexander Graf <graf@amazon.com>
Content-Type: multipart/alternative; boundary="0000000000000ab449062ae7911a"
Received-SPF: neutral client-ip=2607:f8b0:4864:20::a34;
 envelope-from=phil@philjordan.eu; helo=mail-vk1-xa34.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NEUTRAL=0.779 autolearn=no autolearn_force=no
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
X-TUID: GGVAS+40hKt+

--0000000000000ab449062ae7911a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 4 Jan 2025 at 16:15, Akihiko Odaki <akihiko.odaki@daynix.com> wrote=
:

> On 2024/12/28 5:36, Philippe Mathieu-Daud=C3=A9 wrote:
> > On 23/12/24 23:16, Phil Dennis-Jordan wrote:
> >
> >> Known issues:
> >>   - Keyboard and mouse/tablet input is laggy. The reason for this is
> >>     that macOS's XHCI driver seems to expect interrupter mapping to
> >>     be disabled when MSI/MSI-X is unavailable. I have found a
> >>     workaround but discovered a bunch of other XHCI spec non-complianc=
e
> >>     in the process, so I'm fixing all of those in a separate patch
> >>     set.
> >
> > Should we wait for your XHCI fixes series to get reviewed first
> > so I can base this series on top (removing this comment) when merging?
>
> This series no longer cleanly applies due to patches merged early so
> please rebase it.
>

I've already done this locally, but I need to incorporate some of Phil
M-D's feedback, I don't think there's much point posting a v17 to the list
before those points are resolved.

In particular, I'm unsure about part of the proposed fix for the emulated
GIC dependency.
https://patchew.org/QEMU/20241227202435.48055-1-philmd@linaro.org/202412272=
02435.48055-3-philmd@linaro.org/

I need to set up an aarch64 Linux host to test the build with --enable-kvm
--enable-tcg to disprove or confirm my worry that
select ARM_GICV3 if !KVM
would deselect ARM_GICV3 even though it's needed for the TCG accelerator.
And if that suspicion turns out to be correct, I'll need to find a good
alternative.
select ARM_GICV3 if TCG || HVF || NVMM || WHPX || XEN_EMU || XEN
seems=E2=80=A6 awkward.

It will be nice if you also:
> 1. rebase this vmapple series onto the xHC series and
> 2. move "[PATCH v3 6/6] hw/vmapple: XHCI controller's interrupt mapping
> workaround for macOS" into this vmapple series
>
> xHC changes that are not specific to vmapple may be merged early in this
> way. I will be also able to test all vmapple code at once.
>

I'm going to combine the two series and put the generic (standards
compliant) XHCI  patches first. The final XHCI patch has been squashed into
the final vmapple patch.

The work-in-progress branch is at
https://github.com/pmj/qemu/tree/xhci%2Bvmapple-v17 if you or anyone else
wants to test/review. It's currently just a rebase/reorder/squash with
conflicts fixed, no functional changes since v16.


> Please use Based-on: tag when you post a series that based on another.
> It will create a Git tree that I can use for testing at:
> https://patchew.org/QEMU/
> docs/devel/submitting-a-patch.rst describes the details.
>

Thanks!


> Regards,
> Akihiko Odaki
>

--0000000000000ab449062ae7911a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br><div class=3D"gmail_quote gmail_quote_container"><=
div dir=3D"ltr" class=3D"gmail_attr">On Sat, 4 Jan 2025 at 16:15, Akihiko O=
daki &lt;<a href=3D"mailto:akihiko.odaki@daynix.com">akihiko.odaki@daynix.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">On 2024/12/28 5:36, Philippe Mathieu-Daud=C3=A9 wrote:<br>
&gt; On 23/12/24 23:16, Phil Dennis-Jordan wrote:<br>
&gt; <br>
&gt;&gt; Known issues:<br>
&gt;&gt; =C2=A0 - Keyboard and mouse/tablet input is laggy. The reason for =
this is<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 that macOS&#39;s XHCI driver seems to expect in=
terrupter mapping to<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 be disabled when MSI/MSI-X is unavailable. I ha=
ve found a<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 workaround but discovered a bunch of other XHCI=
 spec non-compliance<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 in the process, so I&#39;m fixing all of those =
in a separate patch<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 set.<br>
&gt; <br>
&gt; Should we wait for your XHCI fixes series to get reviewed first<br>
&gt; so I can base this series on top (removing this comment) when merging?=
<br>
<br>
This series no longer cleanly applies due to patches merged early so <br>
please rebase it.<br></blockquote><div><br></div><div>I&#39;ve already done=
 this locally,  but I need to incorporate some of Phil M-D&#39;s feedback, =
I don&#39;t think there&#39;s much point posting a v17 to the list before t=
hose points are resolved.</div><div><br></div><div>In particular, I&#39;m u=
nsure about part of the proposed fix for the emulated GIC dependency. <a hr=
ef=3D"https://patchew.org/QEMU/20241227202435.48055-1-philmd@linaro.org/202=
41227202435.48055-3-philmd@linaro.org/">https://patchew.org/QEMU/2024122720=
2435.48055-1-philmd@linaro.org/20241227202435.48055-3-philmd@linaro.org/</a=
></div><div><br></div><div>I need to set up an aarch64 Linux host to test t=
he build with --enable-kvm --enable-tcg to disprove or confirm my worry tha=
t=C2=A0</div><div>select ARM_GICV3 if !KVM<br></div><div>would deselect ARM=
_GICV3 even though it&#39;s needed for the TCG accelerator. And if that sus=
picion turns out to be correct, I&#39;ll need to find a good alternative.</=
div><div>select ARM_GICV3 if TCG || HVF || NVMM || WHPX || XEN_EMU ||=C2=A0=
XEN</div><div>seems=E2=80=A6 awkward.<br></div><div><br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
It will be nice if you also:<br>
1. rebase this vmapple series onto the xHC series and<br>
2. move &quot;[PATCH v3 6/6] hw/vmapple: XHCI controller&#39;s interrupt ma=
pping <br>
workaround for macOS&quot; into this vmapple series<br>
<br>
xHC changes that are not specific to vmapple may be merged early in this <b=
r>
way. I will be also able to test all vmapple code at once.<br></blockquote>=
<div><br></div><div>I&#39;m going to combine the two series and put the gen=
eric (standards compliant) XHCI=C2=A0 patches first. The final XHCI patch h=
as been squashed into the final vmapple patch.<br></div><div><br></div><div=
>The work-in-progress branch is at <a href=3D"https://github.com/pmj/qemu/t=
ree/xhci%2Bvmapple-v17">https://github.com/pmj/qemu/tree/xhci%2Bvmapple-v17=
</a> if you or anyone else wants to test/review. It&#39;s currently just a =
rebase/reorder/squash with conflicts fixed, no functional changes since v16=
.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
Please use Based-on: tag when you post a series that based on another. <br>
It will create a Git tree that I can use for testing at: <br>
<a href=3D"https://patchew.org/QEMU/" rel=3D"noreferrer" target=3D"_blank">=
https://patchew.org/QEMU/</a><br>
docs/devel/submitting-a-patch.rst describes the details.<br></blockquote><d=
iv><br></div><div>Thanks!<br></div><div>=C2=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
Regards,<br>
Akihiko Odaki<br>
</blockquote></div></div>

--0000000000000ab449062ae7911a--
