Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp9578711lff;
        Fri, 17 Jan 2020 01:50:58 -0800 (PST)
X-Google-Smtp-Source: APXvYqxcKwSBD/OSkZtHnfBqwMdkd4rDlyoWNeqPPu5HcaLYZqFTfz9yzorc0YXVzRxnyjAIbcTN
X-Received: by 2002:a50:cb8d:: with SMTP id k13mr2846399edi.284.1579254658572;
        Fri, 17 Jan 2020 01:50:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579254658; cv=none;
        d=google.com; s=arc-20160816;
        b=bXgKZaWonIDoF16Dj7hZdvdR5a97si+H/nh0GmcEEz1vedHcrmjEvzWDUt4Vde62vM
         47pkLB4FmDBKAsq2AdQPZuxzvQPfHcXJrGtn14CUdG/fmr2hsLbDeccLGA03wLFvFfIK
         c1n4y7O8sOlsoLDhZ27RjWjsmZQEZJwlmo2qi//YAdhiChSlRh83TAOB3omFrD6pLgfG
         howrddNLWnZjH9l6PAIMctF5eDL4LCO/rnj9oVnPmMzgfkRYsW1QybtAXGXfRyg16Lnc
         EFTyulIvBb/esCc3xmRb1z6c418RMSPV3xPAfn1Nayr088I5QUvBTK1BSrrPDtQgsPns
         Eb1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=O6W46C2To8bMeKKC6puqI4drhhWBpfh81HVIFggRLJ8=;
        b=pa4JvzVnKiC8j29YkcBkv9dsjwCMsRve6GI7naQf0NFJZGnGcTF7dLSzzeQ03U+7X3
         Js9cMfpVR6G1BaoFcvZ4PmolbeA6E9hrexmeRT5nyTGtsCkQm/Uu5GNrSeibNV9Gw7SZ
         iz0tBeASCxDfeuSjae7H50forcg1CFrhnZm6c1POcqTW63HHCcK230AWY/WwyRlWw69O
         9SFXriNSwrT/CL7O35hKSy/RR0tPlR9/RHg8mJfxfLGWRE9Esp9+wz2x7/6iiz8Q4tGT
         rFl8B6CsCDX/zXGzNAeoEZI+xgSORLSdbqt2oCM4/yBToYM/491sYZ3F1ZJ/mU7J+1ii
         E8qQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="jLcTBg+/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g12si16591969ejd.43.2020.01.17.01.50.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Jan 2020 01:50:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="jLcTBg+/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1isOHJ-00027v-HP
	for alex.bennee@linaro.org; Fri, 17 Jan 2020 04:50:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51125)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1isOH8-00026O-7k
 for qemu-arm@nongnu.org; Fri, 17 Jan 2020 04:50:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1isOH4-0007eh-Ih
 for qemu-arm@nongnu.org; Fri, 17 Jan 2020 04:50:46 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:45948
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1isOH4-0007ds-Ex
 for qemu-arm@nongnu.org; Fri, 17 Jan 2020 04:50:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579254641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O6W46C2To8bMeKKC6puqI4drhhWBpfh81HVIFggRLJ8=;
 b=jLcTBg+/qvSpBFaX6RwgYpibtmoZTDEKSXaQOtP0O8XRP1UP2lmx+gTOsi8nQy2c4BMk2z
 SZuB6tgOQeCcy9087Y3Ek9Vx8KkldowDfyIRfZdqYQnRvxsJ5BFb0IfyUSkQUwtBPJBEik
 dDOgl3/ySNbydZu0mCW/le2emCrtHn8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-208-SHBF_-YuO2aKGSawgTozNQ-1; Fri, 17 Jan 2020 04:50:40 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 81841183B54F;
 Fri, 17 Jan 2020 09:50:39 +0000 (UTC)
Received: from localhost (unknown [10.43.2.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 60EA819C4F;
 Fri, 17 Jan 2020 09:50:34 +0000 (UTC)
Date: Fri, 17 Jan 2020 10:50:33 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Subject: Re: [PATCH v3 18/86] arm:kzm: drop RAM size fixup
Message-ID: <20200117105033.6801593a@redhat.com>
In-Reply-To: <dc8d8594-0bf8-e6c2-9ce8-94bf5361bca3@redhat.com>
References: <87sgkgv6dh.wl-Peter.Chubb@data61.csiro.au>
 <1579195564-95459-1-git-send-email-imammedo@redhat.com>
 <dc8d8594-0bf8-e6c2-9ce8-94bf5361bca3@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: SHBF_-YuO2aKGSawgTozNQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: Peter.Chubb@data61.csiro.au, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 peter.chubb@nicta.com.au, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kA7DnDj/8WJV

On Thu, 16 Jan 2020 19:22:08 +0100
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> On 1/16/20 6:26 PM, Igor Mammedov wrote:
> > If the user provided too large a RAM size, the code used to
> > complain and trim it to the max size.  Now tht RAM is allocated by
> > generic code, that's no longer possible, so generate an error and
> > exit instead.
> >=20
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > ---
> > v3:
> >   * rephrase commit message in nicer way
> >     ("Chubb, Peter (Data61, Kensington NSW)" <Peter.Chubb@data61.csiro.=
au>)
> >   * reword error message and use size_to_str() to pretty print suggeste=
d size
> >     ("Chubb, Peter (Data61, Kensington NSW)" <Peter.Chubb@data61.csiro.=
au>)
> >=20
> > CC: peter.chubb@nicta.com.au
> > CC: peter.maydell@linaro.org
> > CC: qemu-arm@nongnu.org
> > ---
> >   hw/arm/kzm.c | 9 +++++----
> >   1 file changed, 5 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/hw/arm/kzm.c b/hw/arm/kzm.c
> > index 1d5ef28..94cbac1 100644
> > --- a/hw/arm/kzm.c
> > +++ b/hw/arm/kzm.c
> > @@ -25,6 +25,7 @@
> >   #include "hw/char/serial.h"
> >   #include "sysemu/qtest.h"
> >   #include "sysemu/sysemu.h"
> > +#include "qemu/cutils.h"
> >  =20
> >   /* Memory map for Kzm Emulation Baseboard:
> >    * 0x00000000-0x7fffffff See i.MX31 SOC for support
> > @@ -78,10 +79,10 @@ static void kzm_init(MachineState *machine)
> >  =20
> >       /* Check the amount of memory is compatible with the SOC */
> >       if (machine->ram_size > (FSL_IMX31_SDRAM0_SIZE + FSL_IMX31_SDRAM1=
_SIZE)) {
> > -        warn_report("RAM size " RAM_ADDR_FMT " above max supported, "
> > -                    "reduced to %x", machine->ram_size,
> > -                    FSL_IMX31_SDRAM0_SIZE + FSL_IMX31_SDRAM1_SIZE);
> > -        machine->ram_size =3D FSL_IMX31_SDRAM0_SIZE + FSL_IMX31_SDRAM1=
_SIZE;
> > +        char *sz =3D size_to_str(FSL_IMX31_SDRAM0_SIZE + FSL_IMX31_SDR=
AM1_SIZE);
> > +        error_report("RAM size more than %s is not supported", sz); =
=20
>=20
> Yay! Can you use this pattern the other patches too?

I plan to, as it's much neater and I can avoid adding RAM_ADDR_FMT

Would your acks still stand or should I drop your Reviewed-bys
on changed in such way patches?
=20
> You might want to add:
>=20
> #define FSL_IMX31_SDRAM_SIZE_MAX \
>    (FSL_IMX31_SDRAM0_SIZE + FSL_IMX31_SDRAM1_SIZE)
>=20
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>=20
> > +        g_free(sz);
> > +        exit(EXIT_FAILURE);
> >       }
> >  =20
> >       memory_region_allocate_system_memory(&s->ram, NULL, "kzm.ram",
> >  =20
>=20

