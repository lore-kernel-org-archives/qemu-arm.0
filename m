Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp263113wrp;
        Fri, 20 Sep 2019 21:41:58 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzidbrU+M2gckdDbeMtW/hvZZ7nw8D2Z502QO4vbGuZOofXjXpTDVKkUkiw4/ad90paJOkd
X-Received: by 2002:a05:6402:120e:: with SMTP id c14mr25513228edw.272.1569040918651;
        Fri, 20 Sep 2019 21:41:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569040918; cv=none;
        d=google.com; s=arc-20160816;
        b=LFNQLjVuGI/ha63tXAbbLajJK9h3UZi0MnfUmUsuF64GSnUO+DpIAJBKfu9GUHNJyc
         rT0asXfZIrUpDwj3cR1wdaC7rIpe0cEQ6ciFtjXTiXEVc0S9hWz2N0XNa6JpniMG4Uax
         q9p7rg92uyv1gcFmqoXzRlmzXOOa2+gWydLlinZrDor/RlZAxAsrh7mxAGxZbv8xOZmY
         WkA/3R2gc3q39wjAXV2xnPWQuNdsz4HY0jrIpXQIVGdpxO4PBbUHy0BTGE5pls0J1OM+
         I0HMCrWuf+kJRgxoQbb1UHILwzxN8TQ1kVsF40thKjLqLc6F4KzluiBkvQEaWgXIjVqO
         vsqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=+PPsKOCTh5RSa57I+BSSqGAEMvAJw0T0QxLY5cxA0Ko=;
        b=T+Ul9M3ch1UY0x8lpZhByce6dpj+GjeANVyFT+KoMnErwNg5ojBF79HdWjpinr0E0n
         2tVID6sY5GbVRxF/5FsQC9aDWA3FMn9FN0AXTMZB8fVHK3s0oH+JJDD6R2DP6xZhHV2+
         jlDO7zFvOSLDBIpONF5UdkdYY+17CL/0Y9kYsZY8UvSig1imWoc6rolla+vKY0F8v7ca
         liPX+Tn2nwWlK6V6dv68gE4VXU9vbFljZ2CSX0GZ7Ql0QSmVZQ2nZ7IkBEzcptOF0FlB
         rPvh31oKjVEGowe06yMuFBCBz6mFysP7Ee6uC2TPG9Vx0AqiCKzf1wgLsy1YiuLGlgBv
         RgHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@jms.id.au header.s=google header.b=MRFtUGSV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r2si2046601ejp.57.2019.09.20.21.41.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Sep 2019 21:41:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@jms.id.au header.s=google header.b=MRFtUGSV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iBXDZ-0002SV-Ir
	for alex.bennee@linaro.org; Sat, 21 Sep 2019 00:41:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45593)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <joel.stan@gmail.com>) id 1iBX9z-0008CG-27
 for qemu-arm@nongnu.org; Sat, 21 Sep 2019 00:38:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <joel.stan@gmail.com>) id 1iBX9x-0001Fc-Fi
 for qemu-arm@nongnu.org; Sat, 21 Sep 2019 00:38:14 -0400
Received: from mail-qt1-x843.google.com ([2607:f8b0:4864:20::843]:37651)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <joel.stan@gmail.com>)
 id 1iBX9w-0001Ec-Q9; Sat, 21 Sep 2019 00:38:13 -0400
Received: by mail-qt1-x843.google.com with SMTP id d2so11115733qtr.4;
 Fri, 20 Sep 2019 21:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+PPsKOCTh5RSa57I+BSSqGAEMvAJw0T0QxLY5cxA0Ko=;
 b=MRFtUGSVZQpUyY/Os2YX8cazuEcWpdYcVYSyHGl5zjFiK3HbOqdJljJt5rNo+e+RWr
 cqRol28iYlkSVs/KX0BqlrUuG/KQMYgZavizbTrSgDDjIcoWBZxDkaq3OQicPGykVUGl
 45IqBgMfyTbGmflaiqf3SyH+mrXX2cU3LBHbI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+PPsKOCTh5RSa57I+BSSqGAEMvAJw0T0QxLY5cxA0Ko=;
 b=syAgRT5iGNN2wvPKpuC3a2y8khnlM60R4sc7FsbJE34/VuLIBGGUbE91ahz06gjmId
 pcvikAZVI7z2WYwfqKpLMD8KC9lTBUqMEX5d3IcSi6TkRJNC2xWI4LTg+bXMSdow6Ehc
 AOWIzg+hDNwxW+i+PfXp45JdPimeBEyeaI3P4OG9WIeEISZanVwYCXKk0sNdysVmeGI0
 XyyI9DvWRGhkuWYy3XeiL6WY0iXwnXIXQEMBQGo8+/K0Yl8eTfeJhZOvG0ygSobqeSel
 B7egdkhPPlPqLew7tn89RsohkvJ0aiWjoLsTHFuzzDJZ7fZmpZtfN3Rl6Xx2U2kcwPrH
 V7Tw==
X-Gm-Message-State: APjAAAUEo+koq6UO69CymcavEK0wg4CaKkZJmPO98cFVqPQbe56l0/lF
 7JmMa5uaBTSc/OVOvAcZ4xaP1uldB2b0hbf065A=
X-Received: by 2002:a0c:a9d3:: with SMTP id c19mr16159222qvb.172.1569040691160; 
 Fri, 20 Sep 2019 21:38:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190919055002.6729-1-clg@kaod.org>
 <20190919055002.6729-4-clg@kaod.org>
 <139c3f7e-465e-4efb-b6c7-213dcd2ec6b7@www.fastmail.com>
 <2a267d68-2463-ae0d-00d0-d9a33ba845b2@kaod.org>
In-Reply-To: <2a267d68-2463-ae0d-00d0-d9a33ba845b2@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Sat, 21 Sep 2019 04:37:57 +0000
Message-ID: <CACPK8Xd2aR9tJKfVjNn7ZCnNw1XK4X7A+fe-5Z62N_HyCOiAWQ@mail.gmail.com>
Subject: Re: [PATCH 03/21] hw: aspeed_scu: Add AST2600 support
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::843
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NN4oiEp2L+Qi

On Fri, 20 Sep 2019 at 15:15, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 20/09/2019 06:10, Andrew Jeffery wrote:
> >
> >
> > On Thu, 19 Sep 2019, at 15:19, C=C3=A9dric Le Goater wrote:
> >> From: Joel Stanley <joel@jms.id.au>
> >>
> >> The SCU controller on the AST2600 SoC has extra registers. Increase
> >> the number of regs of the model and introduce a new field in the class
> >> to customize the MemoryRegion operations depending on the SoC model.
> >>
> >> +    switch (reg) {
> >> +    case AST2600_PROT_KEY:
> >> +        s->regs[reg] =3D (data =3D=3D ASPEED_SCU_PROT_KEY) ? 1 : 0;
> >> +        return;
> >> +    case AST2600_HW_STRAP1:
> >> +    case AST2600_HW_STRAP2:
> >> +        if (s->regs[reg + 2]) {
> >> +            return;
> >> +        }
> >> +        /* fall through */
> >> +    case AST2600_SYS_RST_CTRL:
> >> +    case AST2600_SYS_RST_CTRL2:
> >> +        /* W1S (Write 1 to set) registers */
> >> +        s->regs[reg] |=3D data;
> >> +        return;
> >> +    case AST2600_SYS_RST_CTRL_CLR:
> >> +    case AST2600_SYS_RST_CTRL2_CLR:
> >> +    case AST2600_HW_STRAP1_CLR:
> >> +    case AST2600_HW_STRAP2_CLR:
> >> +        /* W1C (Write 1 to clear) registers */
> >> +        s->regs[reg] &=3D ~data;
> >
> > This clear should respect the protection register for each strap case.
>
> Joel,
>
> You are the expert ! :)

Someone could implement this if they wanted to. In the future it might
be useful to create a detailed model for the OTP and secure boot
behavior, and that can affect the strapping.

However it is not critical for running guests under qemu. I think we
should defer it until there is some guest code that needs the detailed
behavior.

Cheers,

Joel
