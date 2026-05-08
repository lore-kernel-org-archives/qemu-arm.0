Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA1B7CD3447
	for <qemu-arm@archiver.kernel.org>; Fri,  8 May 2026 12:11:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wLK2d-0000by-GG; Fri, 08 May 2026 08:10:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wLK2X-0000bL-OM
 for qemu-arm@nongnu.org; Fri, 08 May 2026 08:10:46 -0400
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wLK2P-0007Wk-SJ
 for qemu-arm@nongnu.org; Fri, 08 May 2026 08:10:41 -0400
Received: by mail-yx1-xb132.google.com with SMTP id
 956f58d0204a3-65c0bda7f15so2075134d50.0
 for <qemu-arm@nongnu.org>; Fri, 08 May 2026 05:10:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778242233; cv=none;
 d=google.com; s=arc-20240605;
 b=bpTprfvPjC54bHBFwsQ2QtPwOxZaCaYoW6WiG3NjybUsDU6fFjAuzQP/tbuYMEghzL
 zkkJVbzXMszK19Pdx128+0A2SjA8Zu8TajGYFeyJeJg5h+SGuJcAmydFdYjyrFs6LNBp
 gIj/pDqo7COIn4iBTDqS48sU5tHmetx9MCM/QoO+KJTgMbMfG9cH+GUh+3SLD7A3k/o1
 uRj0TvFg8nJSVMAHhTpFifQhI9znR47CPS89zYo50sSrtnM/WR06rGLzDUhs4ab/DxBZ
 BWeUtvU5Ud2fg9g8MZtUafG1VE82f59ZiMGk9PiFEjo5rmIP2e7bWN378Sd8xBQKiSIm
 vgUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=FCnMFxPWcz83WnTu6jqJklTu3YcuzvxcDSZE9YHOY4M=;
 fh=tLkO34+lmIG4z/lp4hUgypl+wpBlhhPRg/O8p6dEMec=;
 b=RlSY6/VIyt7mZfnsx+9jISOkxFPWf9NzTgHn+6ZmkqEJfdkdgzDNz8z6LUqSB7ZxAC
 fjwr8LfiTMFYl2EljXmJE++RHNJZTE/GBmv+JFGTxGD0zSga+qIlBJJ3kWHnaXZ1e14K
 c8QUOmgwQpcN/tQyAmx9uAPuK0aMrVF0PUQuqJtPKcDeqJWroWDEOo2saJ+FAAJODVLd
 v/GDVAWK85337HJxaNw6Q86N1EJwAJqoHaFscoV7KC+Pd2v7fNK/+BpSG4hb2gXjbOTf
 OAeANKIYXRQ9Qtwe1IFlVqPXKtHOrcrURvkz5eOsRqeU9nOJ1P6+ZrSnXhqXadt1aUxA
 hSWw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778242233; x=1778847033; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FCnMFxPWcz83WnTu6jqJklTu3YcuzvxcDSZE9YHOY4M=;
 b=qkT5+GFpWGGZeJegeeJ4rCZ1zKvn5n0XX2kbvRBbg15bGEkxai3L4YR/y/f+qEo/a7
 Hy4fZUtnJNIMj8vLsnLzjLuLmsNtpvzx8OO1IJlpxeyDMNRqdZCoitdC95sjiGIsTLP7
 AuvP8tmqWZHu1eoX747jc561xGNtLYTF6gWaXDaVQOBNeTpNFRT+S1+T/f4V1IiNCfte
 l0f81gmwYoBRiOTWVsUuCPL9E+2sKM3yrq8j4D3J94ddwIFsw9nlo5ue6m4LF2kZSFdR
 /Z6X1macNhdBwoWyRdGCPX8ogtYQUmDaYHDN+PVyVHXbCCJgYrY/YiKiGjpdP1uM4Wo3
 TtbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778242233; x=1778847033;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=FCnMFxPWcz83WnTu6jqJklTu3YcuzvxcDSZE9YHOY4M=;
 b=ifK2+Xxiv+CNeqpg4l9q4liOPXKXnNyRxEWBEIiM2ucv0V7Nlj49enIjtguKJoW1EL
 fQpDUT1AUlvbfVeGezh0uFNbpxMjZRTibu6G4FZsVQRYj0jGMlZ8DDYcf4o+K2P2ZI1u
 ls1LAWqs1bfYSm0Ca/C+wnYXk06BkW2SxEWIB81CMrPTCSxdHWhWXmSUXlLKzOwDKddn
 fqiTWRQ3Dn/+2jBeXwtWUBJ78B9I+KqwoedyBTfe+AQyu0x14kxitSUTW3cqNqQsdlf8
 WsQc9kSaOYIZ9nD/pVlJqKP1seAIYdQgvlNy062xYlPwiklhnFSjZ6z6QQ5RcBHd3zlq
 AKoQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ99Il3qu8G95B80DIz2WCjPFsa3woYNaC6v+tFM4631r2uOfIsS2RA7xXviZAt+oMtAjtPFd82pGg==@nongnu.org
X-Gm-Message-State: AOJu0Yz8fZSAnDjIzwd5jX6VQuEmEvYiH5Aw0kc8mtEQFC00W5vfTeCE
 VGeESluZzRndJHhPAiEU+dF194R/7rd+M9rM7XT536Vj8FtRXo50nGClrnYTCT8hRZ7CX7aPc0j
 ZCbuD2E1KdiyPdz5bT0Bs6zKeckyzwlXA0KxHmbKvGg==
X-Gm-Gg: Acq92OHBWzfpR13KZQbKegh0tkroBxCKvBN2co8LSbiI+BFjztVO8PT7NQm4UFqRQeD
 +d3zzCTMRF5TNNm2FYSeO4TozHu1WFIAIcYbphnWaQLtrTL/51Jy9yjgrpSc599rjMyvHCYeg9s
 7fFtQw/m/jk9cXAVK5K0XR4iWOBpiKSMWq6QqRbOimVeSo1/gTgDjSipx6suP6CrnX624/0u6cm
 JrYp+GiajtnWaH3+6d5416EWoPsE0jz+XDne21Y83S6D9BsdrQpnpbfXiptNgM4xz8iU6x8nLCR
 i+dqgCe6bsk0HM6ZLrOQe6Rt8Ku7lhQR/msVOLDVwgZtQ3qtJH79HdurrW8UNi13PehP91H1Oir
 ++Q==
X-Received: by 2002:a05:690e:120b:b0:64e:f106:60ee with SMTP id
 956f58d0204a3-65c799d57c0mr11671279d50.55.1778242232406; Fri, 08 May 2026
 05:10:32 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1777571962.git.matyas.bobek@gmail.com>
 <1B6ED5DC-6808-4A41-B8FA-B2C97C5C8933@gmail.com>
 <CAFEAcA9kQNdx=gwSd_Ec=R2nwegT1R-BEiC9yXvfr23VJHDZiA@mail.gmail.com>
 <936E6AF6-32BA-4236-B8A2-0A8E8748D9C1@gmail.com>
In-Reply-To: <936E6AF6-32BA-4236-B8A2-0A8E8748D9C1@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 8 May 2026 13:10:21 +0100
X-Gm-Features: AVHnY4JrGTYDc7zOIr6E9sjhStbzmsKbno1e2DoGqljKofnwcHTBRxQAsVlNITg
Message-ID: <CAFEAcA95RcGhhN8ZqVeOgRyhRqSar23EnJhCjVgKBwoqXBJwjw@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] hw/arm/sabrelite: Add FlexCAN support
To: Bernhard Beschow <shentey@gmail.com>
Cc: =?UTF-8?B?TWF0ecOhxaEgQm9iZWs=?= <matyas.bobek@gmail.com>, 
 qemu-devel@nongnu.org, Matyas Bobek <bobekmat@fel.cvut.cz>,
 Pavel Pisa <pisa@fel.cvut.cz>, 
 qemu-arm@nongnu.org, Marc Kleine-Budde <mkl@pengutronix.de>, 
 Oliver Hartkopp <socketcan@hartkopp.net>,
 Nikita Ostrenkov <n.ostrenkov@gmail.com>, 
 "Daniel P. Berrange" <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb132.google.com
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

On Tue, 5 May 2026 at 21:21, Bernhard Beschow <shentey@gmail.com> wrote:
> Am 5. Mai 2026 18:41:52 UTC schrieb Peter Maydell <peter.maydell@linaro.o=
rg>:
> >On Tue, 5 May 2026 at 19:03, Bernhard Beschow <shentey@gmail.com> wrote:
> >> I guess the only open issue is the licensing of struct FlexcanRegs [1]=
 which originates from Linux? How do we proceed here?
> >>
> >> Best regards,
> >> Bernhard
> >>
> >> [1] https://lore.kernel.org/qemu-devel/202603211316.18181.pisa@fel.cvu=
t.cz/
> >
> >Could you say what the problem is? In general there is no problem
> >with taking header structs from the Linux kernel, as they are
> >GPL-2-only and that is a QEMU-compatible license. The relevant
> >source files or pieces of source files would need to be noted
> >as 2-only rather than our default of 2-or-later, but that is
> >doable -- we already do that for other things we have borrowed
> >from the kernel.
>
> In https://lore.kernel.org/qemu-devel/f3cb3166-c3f8-4ed8-8c9a-cbf48b071d1=
e@gmail.com/ I raised this review question: "The following structure looks =
like being based on Linux. Does this affect the copyright of this file?" I =
was just asking for advice and I'm glad the solution is that easy.

If the struct was copied from the kernel, then it's GPL-2.0-only,
and we should just note the license and where we got the code from.

If the struct is just very similar to the kernel's one because
it's the obvious representation taken from the datasheet, then
it's not related to the kernel code and we can treat it as
GPL-2.0-or-later like the rest of the file.

Since Maty=C3=A1=C5=A1 says in the cover letter here "the headers (struct
FlexcanRegs and flexcan_regs.h macros) were copied from the Linux
kernel" then we're in case 1.

You can mark this up by having the file's SPDX tag be
"SPDX-License-Identifier: (GPL-2.0-only AND GPL-2.0-or-later)"
Then have a normal comment in the file next to the part that is
2.0-only that says
/*
 * [This struct / the macros X, Y, Z / whatever ] are borrowed
 * from the Linux kernel, and so (unlike the rest of this file)
 * they are GPL-2.0-only.
 */

thanks
-- PMM

