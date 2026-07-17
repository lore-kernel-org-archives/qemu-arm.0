Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA0C2C44520
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Jul 2026 13:28:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wkicS-0001pi-CI; Fri, 17 Jul 2026 09:28:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wkicQ-0001oM-BL
 for qemu-arm@nongnu.org; Fri, 17 Jul 2026 09:28:46 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wkicO-0007J1-2c
 for qemu-arm@nongnu.org; Fri, 17 Jul 2026 09:28:46 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-81ec29f1d07so49777747b3.1
 for <qemu-arm@nongnu.org>; Fri, 17 Jul 2026 06:28:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784294923; cv=none;
 d=google.com; s=arc-20260327;
 b=NYqHgDzytU0S3H86XHkrhqIYMiBdpj/yN29vtlnLC/OiH3WWKyP88WwMq9fB8229cY
 zwdDmSTMofmToLGkFVS5/RWvZ/njniKmrDbp5atUPgcOl8yB6ZsFVQVH+z/OLDucIA/R
 0rnqdArqXHe/41O8gCTuPWjpfSZ9BCDJ6F6IBDmxFNu7gIvLuPBMZ4QB2PXwNfhI/h4N
 tBMvZRQ7JYO8V5WroMbAYv/Lk56c7+z+3cK922TTywXk5Tc5phqIMSE15wB30K/LejL0
 7365YyFEG5TOXnoWhBcnJizNG5SKwwPGByLWYPjnfA7cco7cRs5yu1gC/v6nJJ9xakZq
 2Vbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=zAza6idldi/AmDBXBvhM73YBNaZPDxoAkKRX1lxWWr0=;
 fh=EwYDjRxIS7HREli+DnbD9GrzC5hdvcPq86ZllNSuLPQ=;
 b=WUdF7z8Kow++lqYOHWTmzx91dUGo4HMIQO1DXbriZUKvrYwga0PqxJuwqZqdRbTdh2
 LaVLeABRvZI4pDlPL9OKAsbPLpeJZYPjiHRzlrAQ9/+OyWrDMD4MX6WmepFpPgPCoFQc
 O06cR6/ouIpPZ3hhJliP2RayxqeD89e6LVodGSMI2tO2MtkpmHTaRfaeU4vFlgZzYjEm
 XDLi58wyUfkuvoJ/scLb5bt7CTzWjB1bSFjDQC3CJh3S7tjG9ZPPgeOjF5GLZUxDWa1N
 pJunCUdcNp37fh7fetAVrYhkfAAAXQAPQBL7blUl0WG7xZrL7FE3xnwlZ5PEyr+L4mkb
 mneg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1784294923; x=1784899723; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=zAza6idldi/AmDBXBvhM73YBNaZPDxoAkKRX1lxWWr0=;
 b=GvSqIL8qF6G+QYpT5V0PqI2U8padwL9Yk60dsD9D/7VwEy3fN2WuD8LzTP9NpVHNFa
 r+mCqYNavDhM2P70XG1W5vlkkbp5Fhe63QryodsPkR9s5rISzE0xPzdlYTEAIyuaozGj
 PBKOLWHnErhGZlCrc1uKijhLJNi7E8A86fh3DxUG9gIJxL6PsBMrDcJ7/bx6/S/SE5z3
 np9ya0efBSEElF+wyEHX1IUEwBP4zUP1xOz4D8NM4nWkLCZuyowjUH62yzED0wii4E4D
 Sle3T+rJHRe/APpJGccBY5GFynsPhiDhReNR3R679ozOmAt1exm4LNvQ9W5S5nBNbVCe
 NA7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784294923; x=1784899723;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=zAza6idldi/AmDBXBvhM73YBNaZPDxoAkKRX1lxWWr0=;
 b=Du4YQv8aX25ZUDNO1O52fQOPn2ZoR5QKBrMVPBwkrntSs55NAwgWkEEDLyvisnZhwr
 EI86SHSBLXNweFL5AbFQGYRUc/cd0kUAeq9Cg/jC7H/b44qzckyxgzs9IDFBiZ96h/Qj
 Fr+t48bHAH8IOgx3T/wzRWizjQgiAafo2xX0N9vx1AmqHRS6dYZnpmdOa1m79lD7xCXY
 ri3HqXDla9weFIPCUXseERbrfgsXvEyhVqaJNvRenc+y2kslJZweoyOoHD9yBYJn/ls3
 ZjY7V/s4d6zWXolpsVP4i7XMeFLINAVFzBudraNs1FZq+g4Zio4Yaae7isEOonoosIHb
 EDug==
X-Forwarded-Encrypted: i=1;
 AHgh+RrVkquTWtoyd4iYkOt4ELcvLCLEGar3lLaOj121irdcaYrHh5habKMCIXBzAGwVYuGdq1143exeiQ==@nongnu.org
X-Gm-Message-State: AOJu0YygwXt3NEwln0ayrUxYJzUCIfiMGMJHE06JtkOW8OHCGErJ433z
 LIKYNdqDyCBRShKw/4oWnKeVWgJ/WnCgoM58FrhnKV/UaZSX9fUrC3bnYHcMg1U38KMdbtncFJJ
 tbEO9o+feH7PQCXGqLMMF6pkNi1Bm9LS8TUfvWTMUqw==
X-Gm-Gg: AfdE7cksG7nC9NWMEp8X/hPYF4I8bLIvdxz3JvkLIIq1xGRiCMxz1W57CixhMtLBTwr
 +kaRIXPElp7bFDOX0/PMq5jjRwoX1yppvn9BNTcX3kbtB6uy78pl5Iaf8GtKCYaN2Oq9z/gCf/q
 yTlTzYxf11q/aa8115GEhO1xqyDBYYy5qjstDUwc6aYAgG7KZKqlA3CyU0Ma9YqsrJiaJHhagDL
 rpwJblcWM2W2HI/2QdT6WZe4JMuihm+qllX8OR3/OlfYr+DMTHNM5DG5IGTHMd8QiXMmscMBa+t
 xZgnTf1n8rcPmNs9NGPkupNtpMYiX5xbDEnAJSS/0+1lOw==
X-Received: by 2002:a05:690c:c1c:b0:80b:bfee:c427 with SMTP id
 00721157ae682-81ef25a3bc3mr7480727b3.13.1784294922674; Fri, 17 Jul 2026
 06:28:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260701-i2c-adc128d818-anacapa-v5-0-fe8292d86b38@free.fr>
 <20260701-i2c-adc128d818-anacapa-v5-6-fe8292d86b38@free.fr>
 <CAFEAcA8mygA035i3VSEGzQWppCDaUz0HM5mNU9DvTsOjei1F8Q@mail.gmail.com>
 <D5F0871C-4AC1-43D6-9BCD-C59A07236A1F@free.fr>
 <alomsclAchz2_bWy@mail.minyard.net>
In-Reply-To: <alomsclAchz2_bWy@mail.minyard.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Jul 2026 14:28:29 +0100
X-Gm-Features: AUfX_mw-Rc8nV8LNb9lLOizZTJs6D8LLWx3Kz5bo9OMcga1jzo5qtO3ZYRkLung
Message-ID: <CAFEAcA8dsSKrF3F53SWwyhcNR4XbvRG3N5k96Qkq4RLtpYuwWQ@mail.gmail.com>
Subject: Re: [PATCH v5 6/8] hw/i2c: parent slaves created with
 i2c_slave_create_simple
To: cminyard@mvista.com
Cc: Emmanuel Blot <emmanuel.blot@free.fr>, qemu-devel@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@mailo.com>, 
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 Alexander Hansen <alexander.hansen@9elements.com>, 
 William de Abreu Pinho <williampinho@meta.com>, Emmanuel Blot <eblot@meta.com>,
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Fri, 17 Jul 2026 at 13:57, Corey Minyard <cminyard@mvista.com> wrote:
>
> On Thu, Jul 16, 2026 at 07:08:04PM +0200, Emmanuel Blot wrote:
> >
> >
> > On 10 Jul 2026, at 18:05, Peter Maydell wrote:
> >
> > > On Wed, 1 Jul 2026 at 18:31, Emmanuel Blot <emmanuel.blot@free.fr> wr=
ote:
> > >>
> > >> Slaves created with i2c_slave_create_simple() were left unparented a=
nd
> > >> showed up under /machine/unattached with no stable QOM path. Add eac=
h
> > >> slave as a QOM child of its bus, named after its I2C address, so it =
has
> > >> a deterministic and addressable QOM path.
> > >
> > > Should devices on a bus be QOM children of the bus, though?
> > > I would expect that they ought to be QOM children of e.g.
> > > the SoC or machine that created them.
> > >
> > > Do we do this for other bus types, e.g. PCI ?
> >
> > If we do not want a I2C device to be a child of its bus, an alternative=
 parent could be the master/controller of the bus. However as a controller =
may manage several buses, we need to add bus differentiator in the child na=
me, such as bus_num:address.
> >
> > I do not think it makes more sense to have the I2C device to be a child=
 of the SoC rather than its dedicated controller.
> >
> > On machines that are statically defined rather than composed from the c=
ommand line (BMCs, complex SoC-based machines, =E2=80=A6), all the I2C devi=
ces would appear as a =E2=80=9Cflat=E2=80=9D list of devices, with sometime=
s many instances of the same I2C device type belonging to very different su=
b-domains of the machine they instrument and/or drive.
> >
> > I tend to think that using a flat schema would likely make use of QOM p=
aths more difficult to observe and reach a device at run time: one would ha=
ve to iterate the device and bus hierarchy rather than to use QOM path to a=
ccess a device, or special care would be required for naming device instanc=
es. I was viewing the role of the QOM paths as a way to expose the machine =
device hierarchy as a comprehensive and non-ambiguous representation.
> >
> > What are the cons for using the device/bus hierarchy for simple buses s=
uch as SPI & I2C?
> > Is there any drawback to use the device & bus hierarchy to assign a def=
ault/fallback QOM path to a device?
> >
> > Maybe it=E2=80=99s a matter of ownership? Neither the I2C. bus nor the =
I2C controller owns the device for sure.
>
> Well, "own" doesn't have much of a meaning in this context.  It's a
> matter of how it's connected.

"own" is the whole thing about the QOM tree, though. This is
specifically not the same thing as how a device is connected.

> I agree with you philosophically.  From a user's point of view, a
> hierarchy is much more obvious.  Otherwise you will have to create a
> fake hierarchy with the names or you won't be able to find anything.

If you want the bus hierarchy, we have that; it's not the same
thing as the QOM ownership hierarchy.

-- PMM

