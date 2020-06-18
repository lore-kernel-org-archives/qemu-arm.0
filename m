Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1194743lfm;
        Wed, 17 Jun 2020 19:41:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzSewi6UUxP0QjlsS1q2TP/N2K0p0LlLU0aWJSDMjfaa0ajiHlGKmaxv7o1fgxnEd8KVgJB
X-Received: by 2002:a25:230a:: with SMTP id j10mr3241266ybj.148.1592448072316;
        Wed, 17 Jun 2020 19:41:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592448072; cv=none;
        d=google.com; s=arc-20160816;
        b=G5Thb2m5sN170McpVZfmTo5V5e7IJngR8jb77j/k8g66Entf0fQpLI6+4S/ojTgN/9
         QAW2NcNV0F8eYVkHiv6IaAhlTq00/hVUzL1SqfACngRiEOLAeqweZT7p9bGRyQVf6wYy
         zne+TKTH34CDnpwLEJzKMMRD+GoEc74boCGYDbnPliUP6Sun8Rsm/N/lgdLGPYrIQV5b
         uZbEVNG+7ZE67z5zMlE/yPSfsZXsRUMtPPzcL2aNYhyrgMTHy6ga0LqVkPHbp1q9k0jQ
         esB1k9G4jNHoXA+/+KD89B19wa2FqZfCWWlh+0RaPcCYhShqd5L9LWu7cd14OqfX9iw0
         tk5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=2QGBwbLSnWJPzMhG7hmlgpEaJ1aqmaYfDLod2fS/lu4=;
        b=VjjSq5+igMsKhJZqeYqyVmPwZ2F3++VzVcvPQTKxWBiep6W47EGPrk8ukGS71npgTi
         lxf9tu24U3/HTc2BnIVN/z83fWJsK73wF59kyqrz29dvPoyDRtH9HOGAkpeUXINDFcmy
         xyIXpnL59RuwXIQjXoq5+1U7nU4tcmXxcsdiivQjDdshTslU23Pq+lMHWDAs/BbDxUrr
         u8EAZYQMgXqDA+ayeuovxOWagk4K6g9mlsD6mszfujUvvtsL5EAjk3ECk3KQNQOAaueh
         qvfMpudHpgdbJohbhKP6IxKUdfAvTDt+EmFCjIc6+IR/ybcDLDL7XG5fS7Cscd2fuIuq
         tUkg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b="LTOD3/+F";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e15si1245112ybn.268.2020.06.17.19.41.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jun 2020 19:41:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b="LTOD3/+F";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:59700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlkUJ-0007kI-ME
	for alex.bennee@linaro.org; Wed, 17 Jun 2020 22:41:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1jlkUB-0007jU-3F
 for qemu-arm@nongnu.org; Wed, 17 Jun 2020 22:41:03 -0400
Received: from mail-ua1-x944.google.com ([2607:f8b0:4864:20::944]:44383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1jlkU8-0000IG-1H
 for qemu-arm@nongnu.org; Wed, 17 Jun 2020 22:41:02 -0400
Received: by mail-ua1-x944.google.com with SMTP id c9so1460566uao.11
 for <qemu-arm@nongnu.org>; Wed, 17 Jun 2020 19:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2QGBwbLSnWJPzMhG7hmlgpEaJ1aqmaYfDLod2fS/lu4=;
 b=LTOD3/+FKlGr4xTd5eeF54DJ8/oHDZPZ2awCM+1qCswJaVb5D4aZ0XH0GJ+ixrjBT3
 0oQzYzX3+zysVqJI5Niu7k70qAzvaSUeoWUfXUOdbXE8VVT6LYgctNqT+HtgejD0jKAU
 PjZwwV4IjRBx+zKa5o602q3tIoMBxp0d232ZLCTnuoVKxfCBu/OqvG1cQVcxuFmo8+CF
 jr0IOUkdrCvuevLbzbPqdmWPCqNliCvXOLbioVgS7m3/+QHNSsan0qErewe7vNGahPI6
 bUojgl1OXLrxF2xqEq8WWYE63IRjMpf1Hhiw0ztvpgPdfbHxnvemnuKI3L57WnIy+RH3
 NYlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2QGBwbLSnWJPzMhG7hmlgpEaJ1aqmaYfDLod2fS/lu4=;
 b=SdsHZCCXeiULN9kBF//9+OAC1iFdyFLGC84FmX120ZWpWZIzz+y+7y7V8qIQfGD8Tt
 reCI3zSLV8L04/PfjLa3n5VMDgaJSKsQr4e207J42vnT/D+MwQpHbdij+IEbRn7Zt1F3
 fq2aiCo60G96WkJaNDp0L1dkzc7kKqG8092n/i8tHtrNQTdleREVAOKfxOwltNVbIZoy
 YsZG6fbZY3VXtox3OvaRbCxEF2CLENj+pbHGpVFdIWGkaGEwHv6Pn/JCTGBlecFPWKRy
 W/77StDhFgzsQKSqEnzrcfXqL6bnrVxDPYiTrp+YYp9m0PJRT5k4XzQgM/2TgNVndMqL
 1urA==
X-Gm-Message-State: AOAM533UABJmsqkK1fHJSkgyZsr1q2tjcknrSh1CHPLDVonClajQszJf
 RfIoQPsJv5xunW6oNBaIrRXfx8jJzq7QZmPKOfLyNg==
X-Received: by 2002:ab0:70c9:: with SMTP id r9mr1474785ual.15.1592448057350;
 Wed, 17 Jun 2020 19:40:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200611223016.259837-1-hskinnemoen@google.com>
 <20200611223016.259837-12-hskinnemoen@google.com>
 <69a4b9c8-0ae0-96e2-8b46-cc89c9acbc9a@kaod.org>
 <CACPK8XfzgLURHct7=cOW8ABuZ72sCFb6tgVAWX=n58oP6qdUCA@mail.gmail.com>
In-Reply-To: <CACPK8XfzgLURHct7=cOW8ABuZ72sCFb6tgVAWX=n58oP6qdUCA@mail.gmail.com>
From: Havard Skinnemoen <hskinnemoen@google.com>
Date: Wed, 17 Jun 2020 19:40:45 -0700
Message-ID: <CAFQmdRaWmr_k+H-nOgBe=SphOjAn3Hy_RSP4XeAwaAV4e1j+cA@mail.gmail.com>
Subject: Re: [PATCH v2 11/12] hw/arm: Wire up BMC boot flash for npcm750-evb
 and quanta-gsj
To: Joel Stanley <joel@jms.id.au>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, 
 QEMU Developers <qemu-devel@nongnu.org>, Avi Fishman <Avi.Fishman@nuvoton.com>,
 CS20 KFTing <kfting@nuvoton.com>
Content-Type: multipart/alternative; boundary="000000000000c8f88e05a852b4c7"
Received-SPF: pass client-ip=2607:f8b0:4864:20::944;
 envelope-from=hskinnemoen@google.com; helo=mail-ua1-x944.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, PDS_OTHER_BAD_TLD=1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PW0S0auTvY+E

--000000000000c8f88e05a852b4c7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 17, 2020 at 6:35 PM Joel Stanley <joel@jms.id.au> wrote:

> On Wed, 17 Jun 2020 at 16:42, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> >
> > On 6/12/20 12:30 AM, Havard Skinnemoen wrote:
> > > This allows these NPCM7xx-based boards to boot from a flash image, e.=
g.
> > > one built with OpenBMC. For example like this:
> > >
> > > IMAGE=3D${OPENBMC}/build/tmp/deploy/images/gsj/image-bmc
> >
> > could you put the image on some site when ready ?
>
> They are built as part of OpenBMC CI:
>
>
> https://openpower.xyz/job/openbmc-build/distro=3Dubuntu,label=3Dbuilder,t=
arget=3Dgsj/lastSuccessfulBuild/artifact/deploy/images/gsj/


Cool, I didn't know that!

Trying to boot that image reminds me of a couple of issues I ran into.

1. This error:

spi_master spi0: /ahb/fiu@fb000000/spi-nor@0 has no valid
'spi-max-frequency' property (-22)

should be fixed by
https://github.com/Nuvoton-Israel/linux/commit/c9185ea65bec8ba7b617080c6278=
eb3e36db4eb4
but it looks like it hasn't propagated into the openbmc repo yet.

2. npcm7xx_ether_probe crashes the kernel, presumably because there's no
emac model in qemu yet. I worked around it by disabling that driver, but it
shouldn't be necessary once the emac model is done.

3. IIRC, after getting past (1) and (2), it turned out the MTD partition
layout didn't match the device tree, so I had to adjust some offsets in the
openbmc build. I was planning to post that to the openbmc list after making
sure I'm cleared to contribute.

Havard

--000000000000c8f88e05a852b4c7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, Jun 17, 2020 at 6:35 PM Joel Stan=
ley &lt;<a href=3D"mailto:joel@jms.id.au">joel@jms.id.au</a>&gt; wrote:<br>=
</div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">On Wed, 17 Jun 2020 at 16:42, C=C3=A9dric Le Goater &lt;<a href=3D"=
mailto:clg@kaod.org" target=3D"_blank" class=3D"cremed">clg@kaod.org</a>&gt=
; wrote:<br>
&gt;<br>
&gt; On 6/12/20 12:30 AM, Havard Skinnemoen wrote:<br>
&gt; &gt; This allows these NPCM7xx-based boards to boot from a flash image=
, e.g.<br>
&gt; &gt; one built with OpenBMC. For example like this:<br>
&gt; &gt;<br>
&gt; &gt; IMAGE=3D${OPENBMC}/build/tmp/deploy/images/gsj/image-bmc<br>
&gt;<br>
&gt; could you put the image on some site when ready ?<br>
<br>
They are built as part of OpenBMC CI:<br>
<br>
<a href=3D"https://openpower.xyz/job/openbmc-build/distro=3Dubuntu,label=3D=
builder,target=3Dgsj/lastSuccessfulBuild/artifact/deploy/images/gsj/" rel=
=3D"noreferrer" target=3D"_blank" class=3D"cremed">https://openpower.xyz/jo=
b/openbmc-build/distro=3Dubuntu,label=3Dbuilder,target=3Dgsj/lastSuccessful=
Build/artifact/deploy/images/gsj/</a></blockquote><div><br></div><div>Cool,=
 I didn&#39;t know that!</div><div><br></div><div>Trying to boot that image=
 reminds me of a couple of issues I ran into.</div><div><br></div><div>1. T=
his error:</div><div><br></div><div>spi_master spi0: /ahb/fiu@fb000000/spi-=
nor@0 has no valid &#39;spi-max-frequency&#39; property (-22)=C2=A0</div><d=
iv><br></div><div>should be fixed by=C2=A0<a href=3D"https://github.com/Nuv=
oton-Israel/linux/commit/c9185ea65bec8ba7b617080c6278eb3e36db4eb4">https://=
github.com/Nuvoton-Israel/linux/commit/c9185ea65bec8ba7b617080c6278eb3e36db=
4eb4</a> but it looks like it hasn&#39;t propagated into the openbmc repo y=
et.</div><div><br></div><div>2.=C2=A0npcm7xx_ether_probe crashes the kernel=
, presumably because there&#39;s no emac model in qemu yet. I worked around=
 it by disabling that driver, but it shouldn&#39;t be necessary once the em=
ac model is done.</div><div><br></div><div>3. IIRC, after getting past (1) =
and (2), it turned out the MTD partition layout didn&#39;t match the device=
 tree, so I had to adjust some offsets in the openbmc build. I was planning=
 to post that to the openbmc list after making sure I&#39;m cleared to cont=
ribute.</div><div><br></div><div>Havard</div></div></div>

--000000000000c8f88e05a852b4c7--
