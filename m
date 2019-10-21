Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp4306212wrm;
        Mon, 21 Oct 2019 02:23:16 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx5h/esI5Uc5DyDLjHdSXjFKcm/rmiQ7uu/U5Hs4MrHDSXaB3I1vYd1MLlDKuwnv0UK8BC2
X-Received: by 2002:ac8:40c5:: with SMTP id f5mr1792076qtm.344.1571649796834;
        Mon, 21 Oct 2019 02:23:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571649796; cv=none;
        d=google.com; s=arc-20160816;
        b=KLKIga0LyPkvmTJ0dSsNV28FTDcUZRR5vw705TTm5BTdT7jqDw8IWkBYl9NvfT0qA6
         Glm3NpD65CEPW8t1uv92ecjRoeGmvN1ZEpBH4Zpc+PfPKkpc5lxt/kEvxwmCcBA9aYEA
         JZPvp+4Op5fYuUe69XHdfkDbJqxE33I4VrK/KGf3qkCRgaf+XjCCiQvSQMGGo62qbv6u
         QAltofu+KwRQeyORveUTyZIa1OP5DGpDYHL1vk4I/wu3KET8uUh76T2UGq2Mq9BqRKx9
         ihigBTWS40RF46nPJVhk6iorRZspUdnJ0MmAm+iSYxlvjz+VV5l4S52OnyOAcldVuBhT
         LSJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=szG+1UapO55MI4I3VrImIiZ0ELN8Poyvt1pm837MU30=;
        b=JyFOmpLpfRWn/V0ZJid4kJm0GFnqPI9qslGyPZ/fyd78BgFxGr1SQO0OdkKLDz9fwa
         8wHu1k7flGYCumwtRr170Yc7omKGlg8rmCHDz52pW3dF15E+XsfbkJcj9OXM9QjsyIHj
         eFwkPeBzYltvfdl8VuRiLWW6H54IHmk/VeI5xveJR5NfqNI1BlHCDiM7Pu+oolS4sO2O
         NKdKvtBdUa69VXpIa6Ep9WN99v5OG15lLmnHSIYoqoiDICMYQW2/r7ImvPCsATXMid5A
         Hagm8UXk7q/p3yMhHtfcAroyDkKrLfK5cn+hUItQxmC6/SrirUaySMiyDOngY/ghmVF4
         v5+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=K0rfojov;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h186si3948885qke.354.2019.10.21.02.23.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Oct 2019 02:23:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=K0rfojov;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iMTuG-0002oU-BC
	for alex.bennee@linaro.org; Mon, 21 Oct 2019 05:23:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34769)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iMTts-0002oD-DZ
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 05:22:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iMTtr-0002fD-32
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 05:22:52 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:35606)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iMTtq-0002ee-Ry
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 05:22:51 -0400
Received: by mail-oi1-x243.google.com with SMTP id x3so10462827oig.2
 for <qemu-devel@nongnu.org>; Mon, 21 Oct 2019 02:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=szG+1UapO55MI4I3VrImIiZ0ELN8Poyvt1pm837MU30=;
 b=K0rfojov9wjax38D4q2fCYsnLT9GerreAwYJT/m5qYqXIoJFBimByxZeo1JGX7xb74
 DFOFp8Fn6b+PU7hjJ5K9t8n7NhT1oO49GnGz1x5AnYFJ/RQ3Vjeg5U+INDZrQrmlC/ci
 DABFass3wwAZTHgm/8s07Y+bwb5F3DypSzjBKVbAcYVTq8OX5qd+1OPqie+cHxFx+vLC
 c9P6MlXAB0XGCWNebG6pA07vUVi0XUvyd8qQP6cVqbOEp3LCZqR/TfkyOTdFABpO/UA3
 nD25rP6AUWrSzC3L7o3ImAScrh7HWQ8Ye6ALSMVchdftvF21ouOSHB8E5pjDx0b/33Sk
 vK6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=szG+1UapO55MI4I3VrImIiZ0ELN8Poyvt1pm837MU30=;
 b=kXFRoEZSlLWrG9RhxH2NS7qt/MFjlrl5/gaIWTqHqObR9XP4gze9vkimI5SeJHB1ym
 Z/s/fQY+vlA78K4pNCnrJZqJbjz5dLIaaR14iCuNms5DSzKdlirxjfb7cAthOZjRyxPw
 d5xhoxYkwjsc0uqGMf85i4d6JPsFKy0V9tXl5WZCi/XMZJsif1KGz0JZebEL6yMNpCzL
 h3SCC3U5raSDjYIlfejAM4E1gHVwFVaavnoY0z64q4cr3wcgvnGBjFYThMdcBbMEQ+UP
 XVtyFONjaMZXCN2oJuwl15aUGbf8arxSrS9PRCxjXgLZibwUE9cxhe4f7cxftg3TE5oX
 SF9A==
X-Gm-Message-State: APjAAAUyAMY6eugJFpxXm41DYvozjFCxDi4SIOV3Lqklv4liKTNEbQBl
 CpOvNWq2FxsK/nChIqPEd0j+ubYrOzENHGoR0OFAiA==
X-Received: by 2002:aca:49c2:: with SMTP id
 w185mr18595718oia.163.1571649769769; 
 Mon, 21 Oct 2019 02:22:49 -0700 (PDT)
MIME-Version: 1.0
References: <20191020225650.3671-1-philmd@redhat.com>
 <20191020225650.3671-13-philmd@redhat.com>
In-Reply-To: <20191020225650.3671-13-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Oct 2019 10:22:39 +0100
Message-ID: <CAFEAcA8bhP9X-2AaTus9=GtEAqmnNA9me6hv8U=vXYwjQp_CnA@mail.gmail.com>
Subject: Re: [PATCH 12/21] hw/arm: Let the machine be the owner of the system
 memory
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paul Burton <pburton@wavecomp.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Leif Lindholm <leif.lindholm@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Rob Herring <robh@kernel.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Helge Deller <deller@gmx.de>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Antony Pavlov <antonynpavlov@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Fabien Chouteau <chouteau@adacore.com>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
 Thomas Huth <huth@tuxfamily.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, Andrew Jeffery <andrew@aj.id.au>,
 Michael Walle <michael@walle.cc>, qemu-ppc <qemu-ppc@nongnu.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Peter Chubb <peter.chubb@nicta.com.au>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LE8Fv/wRCK7g

On Mon, 21 Oct 2019 at 00:01, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---

>  hw/arm/virt.c             | 2 +-

I think from a quick code scan that this is ok, but did
you test that migration compat from old to new still works?
I vaguely recall that there are some cases when adding an
owner to a memory region changes the name string used for
identifying the ramblock in migration.

thanks
-- PMM
