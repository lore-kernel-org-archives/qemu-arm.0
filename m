Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14A5FC61DD3
	for <qemu-arm@archiver.kernel.org>; Tue,  1 Sep 2026 08:57:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x1KIg-0000Jt-CE; Tue, 01 Sep 2026 04:57:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1x1KIe-0000Ih-Ph
 for qemu-arm@nongnu.org; Tue, 01 Sep 2026 04:57:00 -0400
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1x1KId-0007zG-1t
 for qemu-arm@nongnu.org; Tue, 01 Sep 2026 04:57:00 -0400
Received: by mail-yx1-xb135.google.com with SMTP id
 956f58d0204a3-66c70d73210so4403552d50.0
 for <qemu-arm@nongnu.org>; Tue, 01 Sep 2026 01:56:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788253017; cv=none;
 d=google.com; s=arc-20260327;
 b=I0/fWpDZ4YMLEddaSWQUFzv+22nqH+9Z6YKfqfhN7+vxYxIsWjxlvf0gybijbOqj90
 EWY7U/XJOFsMQ7P8askV0D77ewUzFVzRMYBpWc41ZEn0O+PK6GHFkTMRtHkO+VIH7zsc
 uH6ae9l7VEaHW0nJ6I57hZBjXlm18ukm38ECv93C81C9Utm/wgv9PtIBwta1keruHQQQ
 JpipK8hqymuIoUBZaiUCOxxEo7NbOCHB/9eRiU2rX8RRMHG/5hvZrfZRVIpLPDBgysuC
 vTF73f1ziEDRAayt9RDy+h0hW0uaBITtnmYRulExOJqYxsSEbtIM2tj1BB1CVVElG4eC
 l1tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Cq8YbfnJO8CtC22hnEedOTnWA4GJcNao2yClP9ojwDQ=;
 fh=m8tD+nYn9WfCn3z2rQQjhjQni0aN/8HvlnNGlhT+uZU=;
 b=E3NC5m2uVoaLfV9DLP278wJy18y3/VnkpjW3F/x4dpp76dtqcgphoNP/T6jtmyWGuU
 PgvVc8plhDH2U8UfIvsuFKpNyhiFD6G/NQw7ShFlLoOGnjAcg1xqHoQPWkJaOOG4bJLS
 /lNiRPdKplqW2g3iIqBqp7L6ueslPmzALpcXsr+nqp+gEeXCLoUa1taiehwVVYiXPKWL
 8di3DBwOIgD3pmQYxF1GBawKvdNkALzYEgIG5aZjbS2BMqeszAaOOMMBiCRjLYQGdOw6
 Ugv7KFAfpSatO2t3+9AheG7CIeKUTBMheqdn+h1E6qQe7UdwkhuetSIgIZZaMODeX8r7
 7E0w==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788253017; x=1788857817; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=Cq8YbfnJO8CtC22hnEedOTnWA4GJcNao2yClP9ojwDQ=;
 b=Q02Zjgl4Ve1emeidF80AvUOoMgra9VShAxZJbZkfqyGadfga+NDSaKU83MVkTPqNrW
 gMZrHW+BKvz9Mvqk7lJuXUgUK5+9hxHSnO905mtK6xd6YUI3xgD4AsQD35b/B1DXFO5C
 ERpJo9ifH5eKHVsiB1zM3Ci2hI1rxD2RTJUCIMGXew0NFb8Ox+DiATmpQvOd2OruknJE
 DognZt1pDV7jpYfVXV2/iR5f47nZyA2DuWPfnmMYyIhdIOaCeizKbXEaQMrvKZ35rXzq
 IiyHFq3a+RHtEXEww3TrHR046Xl2nZMQS/p8e8RcNDnADpWC9fhZKAbuun1PsQtKLs+R
 X1mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788253017; x=1788857817;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Cq8YbfnJO8CtC22hnEedOTnWA4GJcNao2yClP9ojwDQ=;
 b=Nxp4v8ZVAdEk0N9YjDnyfo1MSqmozE65hFtaqZB7WZDto3zAUYzfmT/pSYPqd7vWBV
 nYWCy0XIpfCpHiiFC8xeT3bpD8cQjIiDCz5Oi+3GRjCkKhdrmg+i/CgBQpYN/F9S90YY
 uch8esK9bW77fY47e14+R1EY8UKr+dhrgT9oQlROqLOkPG+TgpA8LzBN/6rvP1MVNyGC
 vtxdU6OvTYsiiBv6yyycn3pHaza4tcGFPCjKFDOzybLZMTUDnLLLUxpju9OeolwRL5aX
 mIKraZa91QwDRrYcSpQs7jpAvubpWpEOwGWH/KwDy+z9yMNDpe1drTz/4DLwVW6jiXnl
 y5bw==
X-Forwarded-Encrypted: i=1;
 AKwUvBww3BlpR33IWTj1JWMEonS7zm2OK0tZPQOQfLUqnUxFHjZvnOYsip6o8vXuXWslxft3IhHSrmer9w==@nongnu.org
X-Gm-Message-State: AFuF++nG7KgOLSZReyWVZaAmxIQ31/aWUGxFcbL7ZBURbdOVBl8bNrfR
 ruMiAYve6im5mC9r6w+zB8NPonV0gaR8oLHE/igHr1F9Mkc5GLvnztCwmYtXKrUuWxTE4oUIKXW
 +HGQmQlDlbO+jPX72sbjAV2zMWp8tUoM=
X-Gm-Gg: AYBFou0458RuEahNkB5PXKwtlZAWlmzX9mIZn706cGPYuuyPstI0qtWTRadqbm4z2UD
 yyWXMjT24fdLPjIRno7UE/zKhnEkXhMx11MBubbc32GoEo44DCSFN7VtL54iHrgjzegSKNZVnEI
 7HV/BbfxTHKUzx5S90jgi1bo0g0Ht9+sPvAYAF/6j6Ml125n2rrGxPLWEA7LyZLj5wnAQVT2cjU
 zlRt4gJNVyDL5LEe4XRV0xitBG/EkROV+jxGRpTfu2Qj1ca3YzAA2b1QsBip2tuZaZbeL5YvJFk
 rR9uxb14KaxTWtyMViqQARFGrv/sf32nI4fCapJ4db/3
X-Received: by 2002:a05:690e:43c6:b0:66f:80b6:e954 with SMTP id
 956f58d0204a3-66f80b6f278mr2191446d50.42.1788253016861; Tue, 01 Sep 2026
 01:56:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260825040452.1322251-1-stephensportia@gmail.com>
 <CAFEAcA9etHvjL1igO4mFy5iQNy1pCbNFGaSg5HFva+YCeMkGEA@mail.gmail.com>
 <CACYNXwKU_UuhrBWHNFtYYmSfzRsUd5jRFjSc1++xvQHxPk6rew@mail.gmail.com>
 <CAFEAcA-Ncv9_jMMg1i+Ox_xa9oM4D_MMLGnPpqbyGJV_5B9iMg@mail.gmail.com>
 <ac30bd54b6f1f4e4753638c9e95dbb85d8b81eca.camel@alistair23.me>
 <CAFEAcA9zz60hTDMEMePnc1osis7dPjn5KmSksrWKATpSMc8SHw@mail.gmail.com>
 <3796c9917796a0fe26f2462645d95cc7039539af.camel@alistair23.me>
 <a7c8c510-3391-4ab8-ab5a-c5432c9fb216@kaod.org>
In-Reply-To: <a7c8c510-3391-4ab8-ab5a-c5432c9fb216@kaod.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 1 Sep 2026 16:56:44 +0800
X-Gm-Features: AcwNN1W96iyzyiIRe5Dkw3W0pE6hdTHOcsaf3iHwkrWyoWMAWbyvMiTeSTSAiYY
Message-ID: <CAEUhbmWO70G1sBUX7s5VzGbM-FqhRSirDEn7YbW0T2qKEVwbhg@mail.gmail.com>
Subject: Re: [PATCH 0/4] Rename ssi_transfer to ssi_transfer8
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Alistair <alistair@alistair23.me>, Peter Maydell <peter.maydell@linaro.org>,
 Portia Stephens <stephensportia@gmail.com>, qemu-devel@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 qemu-ppc@nongnu.org, Steven Lee <steven_lee@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, 
 Troy Lee <leetroy@gmail.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@mailo.com>, 
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>, qemu-arm@nongnu.org, 
 Tyrone Ting <kfting@nuvoton.com>, Nicholas Piggin <npiggin@gmail.com>, 
 Aditya Gupta <adityag@linux.ibm.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 Francisco Iglesias <francisco.iglesias@amd.com>, Joel Stanley <joel@jms.id.au>,
 Hao Wu <wuhaotsh@google.com>, Glenn Miles <milesg@linux.ibm.com>,
 qemu-riscv@nongnu.org, Jean-Christophe Dubois <jcd@tribudubois.net>,
 Portia Stephens <portias@oss.tenstorrent.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b135;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yx1-xb135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Mon, Aug 31, 2026 at 9:03=E2=80=AFPM C=C3=A9dric Le Goater <clg@kaod.org=
> wrote:
>
> On 8/28/26 02:07, Alistair wrote:
> > On Thu, 2026-08-27 at 12:17 +0100, Peter Maydell wrote:
> >> On Thu, 27 Aug 2026 at 12:03, Alistair <alistair@alistair23.me>
> >> wrote:
> >>>
> >>> On Thu, 2026-08-27 at 11:53 +0100, Peter Maydell wrote:
> >>>> But isn't this just the way the SSI specification is? If we're
> >>>> modelling a "you just have to get this right in software" bit
> >>>> of hardware then we don't need to somehow try to add extra
> >>>> checks in QEMU for whether the software hasn't actually done
> >>>> things right.
> >>>
> >>>  From my reading of things this is a bug in QEMU, not a guest issue.
> >>>
> >>> The fact that aspeed_smc_flash_setup() for example iterates over a
> >>> larger value to send a single byte at a time shows that currently
> >>> everyone *thinks* think function should send a single byte.
> >>
> >> Doesn't that just show that the aspeed flash controller knows
> >> it is always talking to an 8-bit SSI device ? It wouldn't
> >
> > But I don't think that's guaranteed to be true.
> >
> > On real hardware the software could know that it's only ever connected
> > to an 8-bit SSI device, and set the driver accordingly. That seems
> > entirely possible.
> >
> > But the hardware seems to support larger sizes reading [1].
> >
> > In this case the QEMU code is the hardware, and I don't see how we know
> > we are only ever accessing an 8-bit device.
> >
> > 1:
> > https://patchew.org/linux/20220304083643.1079142-1-clg@kaod.org/2022030=
4083643.1079142-5-clg@kaod.org/
>
> On the Aspeed SoC, MMIO accesses (1, 2, 4 bytes) to the SPI controller
> are converted by the hardware into SPI bus transfers. The exact
> serialization is hardware-specific. QEMU's choice is to generate
> byte-oriented SPI transfers.
>
> In any case, SPI is generally byte-oriented, with bits shifted over
> 1/2/4/8 I/O lines. So byte transfer is sufficient.

Correct, one evidence is the spi-mem driver interface in the Linux
kernel for the spi-nor dummy cycles is converted to bytes. Although
some spi-nor devices do support different bit widths other than
8-bit/16-bit/24-bit/32-bit, other bit widths that are not multiple of
8 are currently not supported in the kernel, neither does QEMU.

>
> C.
>
> >
> >> surprise me if the SPI-NOR standard in particular insisted on
> >> 8-bit transfers, though I can't find anything claiming to be
> >> that standard.
> >>
> >>> So it does seem broken today. Making the current function clear
> >>> seems
> >>> like a good step. Supporting different or larger transfers in the
> >>> future is then possible.
> >>
> >> I think the current interface already supports different or
> >> larger transfers. We just happen to not be using that.
> >
> > Kind of. It does support larger transfers, but there is no size
> > argument. So how can the SSI device know how much was sent? Everything
> > seems to just assume a single byte, but it has no way to actually know
> > that.
> >

Regards,
Bin

