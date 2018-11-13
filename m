Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp4696019wrw;
        Tue, 13 Nov 2018 10:17:43 -0800 (PST)
X-Google-Smtp-Source: AJdET5cCBVZHuqaAZYkmKkbzxTaiwX67wtESTpD3Ax1SPtLs5Rk10Ij8btusZWohCCk9lDPHPXo9
X-Received: by 2002:aed:3f22:: with SMTP id p31mr6073058qtf.185.1542133063299;
        Tue, 13 Nov 2018 10:17:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542133063; cv=none;
        d=google.com; s=arc-20160816;
        b=DGzV/5QbthUIOrhOOVoHX8zgBwyRuSs3YrIxLxRzBECXyieipI9Ffdp1yPA1kCmIr5
         mhoyInwK8k83z4q3TSEzEOTeNJULDuVchjFFk0WGEeCTi0dJ9W5r6m78NhjpYk3YE5oG
         vYMKnO8jBz7oqg1WG1vHsY903leR0/sze64QdBdxRc/PbsEb3ZXQegJVQz9fGjnZMiGq
         qmh4xtAuAiTS23MRjr9KiVr74ElIYehxCcGZU02y7p32s1RZb0o4GmfPKm1aNIUAYwlS
         uCVeocUE36xQY88kAoW1bzyMfN2P7sWa5pnHfoPT9ICl8bG+iIIi9BVyUtYB9pii2n1h
         XKIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version;
        bh=UVk+g/dWnoF1Uc87LgeuyhqVBGhjyfveYbJ9w4QRftc=;
        b=lszuOu5LMPNBHnPsNcdHZJ3sU0fqGjF3itarptQcyEoJ0cXYeUqQeASJdSB/MSzJNr
         xq5aUabk5Oieq8CjTB14Hl018uBWJQM7aey2yK3q9bUysel8Rr0aXdEfi9Mq1g+Zfwpo
         fZ40nrxvRNC+XIiymun5e7M5TE1B5Q/EHNHf/Y0rSujMDicS40iQM6cTY/V83eZDTo9O
         duNJSJF1RaRcYjPjJNBbLyyttrzZASHspeWA6Ta1edMyMEe95ti0eBKqU5bsT+5GGcJX
         uHs0hI/hbkGRzwr+osqqdeBIM+//eQwMQjj0BW9ol6rRyaISBsUloPFjnib0YDF73qNk
         oHqg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k6si15875432qte.125.2018.11.13.10.17.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Nov 2018 10:17:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55569 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gMdFu-0004WZ-Ns
	for alex.bennee@linaro.org; Tue, 13 Nov 2018 13:17:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58059)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pmathieu@redhat.com>) id 1gMdDV-0003E4-1h
	for qemu-devel@nongnu.org; Tue, 13 Nov 2018 13:15:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pmathieu@redhat.com>) id 1gMd9P-00073R-ID
	for qemu-devel@nongnu.org; Tue, 13 Nov 2018 13:11:03 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:39984)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pmathieu@redhat.com>) id 1gMd9P-0006v1-9s
	for qemu-devel@nongnu.org; Tue, 13 Nov 2018 13:10:59 -0500
Received: by mail-wr1-f65.google.com with SMTP id p4so5212312wrt.7
	for <qemu-devel@nongnu.org>; Tue, 13 Nov 2018 10:10:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=UVk+g/dWnoF1Uc87LgeuyhqVBGhjyfveYbJ9w4QRftc=;
	b=uB8BxrWTVKww8mPpON+BOPoBnRKc1COqVLXaq8/+54OZviXulooUFQqhkru0/LnJ5j
	hHBg4Fv+sVuwkktB975zLTbv96ZX6+S2h6SBADbcKStbXFCuD/8bf6IU2JCZyeGWweQf
	Qr/WoXXj24LtwpJqYRbLG6sjgnSUreqLZQBPB3u77lGf4A4tQSKn7jNmweU97Kd2G1PM
	zZhlnsZ7i4GEuZeAi//N1vK7v6e04dtqIENsponZVZo2g+lOaZ7E2dmPfYoeO2H3tRQh
	Ee6W4j58ecQH3dcBC63vOnCPb0op7OV53/P3UhdA0/8SiOEi6qpmudC1g+5xZjhJfm1q
	jtwA==
X-Gm-Message-State: AGRZ1gJfcSjgxowTN3RwnagUKkC0k852FQ3QFneuE+FFMKwjeg2ZUW5K
	csQWwBrpm1vayYNOMnvcFK3yFzC47eeGz1omyVKFtg==
X-Received: by 2002:a5d:6204:: with SMTP id
	y4-v6mr6030386wru.105.1542132637560; 
	Tue, 13 Nov 2018 10:10:37 -0800 (PST)
MIME-Version: 1.0
References: <20181113165247.4806-1-sameo@linux.intel.com>
	<20181113165247.4806-3-sameo@linux.intel.com>
	<CAFEAcA-R51dyV7gtS+q-eLNn5LBJbSMKtQu4-N3p0c4mJrU8DA@mail.gmail.com>
	<37b5f17e-50cd-6980-2d42-4e7f4ede2597@redhat.com>
	<CAFEAcA_O5x3QuTnKkupur=iwQaEg-i1z2mWoNCiZt_zM5xi-XA@mail.gmail.com>
In-Reply-To: <CAFEAcA_O5x3QuTnKkupur=iwQaEg-i1z2mWoNCiZt_zM5xi-XA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Date: Tue, 13 Nov 2018 19:10:25 +0100
Message-ID: <CAP+75-X-GQFGGNprc5nW96qJanG=h7G9_iT8y9B98EdjNRWhcw@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.65
Subject: Re: [Qemu-devel] [PATCH 02/13] target: arm: Remove unused headers
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Samuel Ortiz <sameo@linux.intel.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: a6V/evr/s1kC

On Tue, Nov 13, 2018 at 7:08 PM Peter Maydell <peter.maydell@linaro.org> wr=
ote:
> On 13 November 2018 at 18:02, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.=
com> wrote:
> > On 13/11/18 18:01, Peter Maydell wrote:
> >> On 13 November 2018 at 16:52, Samuel Ortiz <sameo@linux.intel.com> wro=
te:
>
> >>> --- a/target/arm/helper.c
> >>> +++ b/target/arm/helper.c
> >>> @@ -12,13 +12,10 @@
> >>>   #include "internals.h"
> >>>   #include "exec/gdbstub.h"
> >>>   #include "exec/helper-proto.h"
> >>> -#include "qemu/host-utils.h"
> >>
> >>
> >> This is for muldiv64().
> >
> >
> > But it is already included by "cpu.h" -> "exec/cpu-defs.h"
>
> > So they are not "unused" but "unnecessary".
> >
> > I thought this would be better to clean this once, before Samuel split.
>
> Generally I think that if a .c file directly uses function X declared in
> header Y it should #include Y, even if it happens that it already include=
s
> other header Z that includes Y. Otherwise if we refactor Z later such
> that it no longer needs to include Y, it will break compilation of the .c
> file. (That is, Z including Y is a detail of the implementation of Z,
> not a guarantee made by Z to its users.)

Yes, this makes sense now, thanks.

Phil.

> The exception here is where the header guarantees that it's going
> to include certain other things (which is the case for eg our osdep.h).
>
> thanks
> -- PMM
