Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9279FCD5BC9
	for <qemu-arm@archiver.kernel.org>; Wed, 27 May 2026 10:43:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wSBiv-0007cL-9u; Wed, 27 May 2026 06:42:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1wSBit-0007bb-88
 for qemu-arm@nongnu.org; Wed, 27 May 2026 06:42:51 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1wSBir-0005Jr-Gv
 for qemu-arm@nongnu.org; Wed, 27 May 2026 06:42:50 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-490388fd0dbso59588555e9.0
 for <qemu-arm@nongnu.org>; Wed, 27 May 2026 03:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779878568; x=1780483368; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wBZPSB/Yj/ayi0IgH3V5as1qAK4wfKZ+qn+MumQvJyk=;
 b=RkW1cBHZR+BNTwNL7ooK3K7/8IxrCmeUsARwK/DEyvm1p4ZApOc8iNkfzz1AmcCOoB
 CIP8rKAPy9j7XKnxbXNTItMX9z8IKkuXP4Pm8AfDpc3epjvvmGACyBMJSUB+lKL7gWCa
 f+M0aIrBlbGo3/lyR2DEgKWcosfw5951Qev0B5qodJsz+UcNgLC5aebQ2l8hD+gnfYn2
 Pdm3FnG8Z/TtavwUSaO3cYSMS0IvmApNqRZseTMiSfMUtj1i3zw41/kGLmpsOxe8pXlz
 I+/gdUgg2+9/oNkKkjNKcsl4ThCSdVA+jjEDHZ0u8CsVDFuwrTCkypUcEyXk/X8KBkao
 Idvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779878568; x=1780483368;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wBZPSB/Yj/ayi0IgH3V5as1qAK4wfKZ+qn+MumQvJyk=;
 b=QW7ft/vmL/xBsEAt9TEH9OOa9xA4LKNkGHiYG8k7ViAR7VpL6hGMOe3gCKqLIWPRRt
 V2WrFePXiwaTndQRxKx1OFEQWtWMsD/SjJ2zfJF8B62o1lh3gr4AnCyMhT+QLu9BDfTe
 URajGK9YHGxpZ+zz9lOmgeNIjoio1qVNJPjEyTNyWBIaKCNs2nxN7ElW0rtwOgS5Sjo/
 7yFn76VE7cUCe83/OlhDx/hg0TT2s/bJPWBXmQrPr6Uqt5toc/G2DSC9yX7nIsYu/CHy
 ZTP3XYHsg5X4brqVHkThgXQEhdNVr/iYyipj5azkdxbQnHSSI5AQ+Op9aAPnGPZpYHPd
 GCgg==
X-Forwarded-Encrypted: i=1;
 AFNElJ9oU5mD+pDIvTaqe2IM/D+xLN3ooSJC5idFYQmChanW9Qc5K2ts8ED7j+F3aeAak+NgjDyGW2EIfw==@nongnu.org
X-Gm-Message-State: AOJu0YzrwvccpKgo8hNXJnLGIEa16YEmbNEXv27tQfN1sCRWYITH4Us0
 zunVYJP+0fz6lzt5AKWhAonaqS7PKUuR+kJdcSG8btVG5Tpm14Fjyk+9
X-Gm-Gg: Acq92OE7MC2iUuXkeDhls7gwZSXOd0GTixZcuhJWmyyNyX44KnZdt529C9h/rdOeIOk
 eDMHp4IpuyGE5PUM60Y6oWm3tB8nF9U4WuCIDUTrqtE+hLooivuLDZUbT526Y4vB5xG1XB0ByE0
 ztWeEkSa2C9zV41YRNEuCOaCx9Hku0E8IRVPg2fyoIBqizzy8En1CpTMtxHNYuQ+7EYftT2b9D4
 cUnjihHDL+ux6f7PeY/CcJZ23dHQYOm87ypqbcfo8XRxDuKNqJecpLboF4YPqVuUCu1au4jgboy
 GVqqDUh+YRQWyhxhZoVoU9QL4U6/sD6x7PX2Qbge2pdUPLS499Wig7yjX9MtcjJKnoIUFIhFpwX
 SRLOipN/qZBZJCSZ0/+RSYzVSs1QS8mndx5XRWfq8NI3BNmhFQl65VPrz7QZuXiIeEHhVYtmUkm
 RIVswnRBW1dDTPvZM6I2dl+Bgo+uIp
X-Received: by 2002:a05:600d:6447:10b0:48f:d5b8:5b07 with SMTP id
 5b1f17b1804b1-490426c5b1emr271376255e9.20.1779878567601; 
 Wed, 27 May 2026 03:42:47 -0700 (PDT)
Received: from ehlo.thunderbird.net ([62.214.191.67])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4907e627b1csm23452065e9.0.2026.05.27.03.42.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 May 2026 03:42:47 -0700 (PDT)
Date: Wed, 27 May 2026 10:42:23 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?UTF-8?Q?Maty=C3=A1=C5=A1_Bobek?= <matyas.bobek@gmail.com>,
 Pavel Pisa <pisa@fel.cvut.cz>, Matyas Bobek <bobekmat@fel.cvut.cz>
CC: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Oliver Hartkopp <socketcan@hartkopp.net>,
 Nikita Ostrenkov <n.ostrenkov@gmail.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v3 0/7] hw/arm/sabrelite: Add FlexCAN support
In-Reply-To: <CAFEAcA95RcGhhN8ZqVeOgRyhRqSar23EnJhCjVgKBwoqXBJwjw@mail.gmail.com>
References: <cover.1777571962.git.matyas.bobek@gmail.com>
 <1B6ED5DC-6808-4A41-B8FA-B2C97C5C8933@gmail.com>
 <CAFEAcA9kQNdx=gwSd_Ec=R2nwegT1R-BEiC9yXvfr23VJHDZiA@mail.gmail.com>
 <936E6AF6-32BA-4236-B8A2-0A8E8748D9C1@gmail.com>
 <CAFEAcA95RcGhhN8ZqVeOgRyhRqSar23EnJhCjVgKBwoqXBJwjw@mail.gmail.com>
Message-ID: <08A7BC6B-7019-45C4-B581-0A26AD3AA554@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x32a.google.com
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



Am 8=2E Mai 2026 12:10:21 UTC schrieb Peter Maydell <peter=2Emaydell@linar=
o=2Eorg>:
>On Tue, 5 May 2026 at 21:21, Bernhard Beschow <shentey@gmail=2Ecom> wrote=
:
>> Am 5=2E Mai 2026 18:41:52 UTC schrieb Peter Maydell <peter=2Emaydell@li=
naro=2Eorg>:
>> >On Tue, 5 May 2026 at 19:03, Bernhard Beschow <shentey@gmail=2Ecom> wr=
ote:
>> >> I guess the only open issue is the licensing of struct FlexcanRegs [=
1] which originates from Linux? How do we proceed here?
>> >>
>> >> Best regards,
>> >> Bernhard
>> >>
>> >> [1] https://lore=2Ekernel=2Eorg/qemu-devel/202603211316=2E18181=2Epi=
sa@fel=2Ecvut=2Ecz/
>> >
>> >Could you say what the problem is? In general there is no problem
>> >with taking header structs from the Linux kernel, as they are
>> >GPL-2-only and that is a QEMU-compatible license=2E The relevant
>> >source files or pieces of source files would need to be noted
>> >as 2-only rather than our default of 2-or-later, but that is
>> >doable -- we already do that for other things we have borrowed
>> >from the kernel=2E
>>
>> In https://lore=2Ekernel=2Eorg/qemu-devel/f3cb3166-c3f8-4ed8-8c9a-cbf48=
b071d1e@gmail=2Ecom/ I raised this review question: "The following structur=
e looks like being based on Linux=2E Does this affect the copyright of this=
 file?" I was just asking for advice and I'm glad the solution is that easy=
=2E
>
>If the struct was copied from the kernel, then it's GPL-2=2E0-only,
>and we should just note the license and where we got the code from=2E
>
>If the struct is just very similar to the kernel's one because
>it's the obvious representation taken from the datasheet, then
>it's not related to the kernel code and we can treat it as
>GPL-2=2E0-or-later like the rest of the file=2E
>
>Since Maty=C3=A1=C5=A1 says in the cover letter here "the headers (struct
>FlexcanRegs and flexcan_regs=2Eh macros) were copied from the Linux
>kernel" then we're in case 1=2E
>
>You can mark this up by having the file's SPDX tag be
>"SPDX-License-Identifier: (GPL-2=2E0-only AND GPL-2=2E0-or-later)"
>Then have a normal comment in the file next to the part that is
>2=2E0-only that says
>/*
> * [This struct / the macros X, Y, Z / whatever ] are borrowed
> * from the Linux kernel, and so (unlike the rest of this file)
> * they are GPL-2=2E0-only=2E
> */

Ping

Any news? With just the license issue remaining, it would be nice to get F=
lexCAN support into the upcoming release=2E

>
>thanks
>-- PMM

