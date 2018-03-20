Received: by 10.28.91.67 with SMTP id p64csp4305156wmb;
        Tue, 20 Mar 2018 14:03:17 -0700 (PDT)
X-Google-Smtp-Source: AG47ELtXQzr5KIW8HNplLWIRazTbPFOTRc1sdRNMcby0UAd/Y0RLOYaPHpqaBEZl3B9LniVTWYzd
X-Received: by 2002:a25:c3c2:: with SMTP id t185-v6mr10672887ybf.487.1521579797206;
        Tue, 20 Mar 2018 14:03:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521579797; cv=none;
        d=google.com; s=arc-20160816;
        b=TK3GD6Yb6M1KHiC05wEfP72AwZFj1t0SvXHibNL+2RrXu3SEtH04XPks3/ZHmYgd3l
         qxlVHIBkw5lDeepXUfjNSHWt1doIGnEahmQTbMk7Pn6u919p1O3lar5Q4CmCALMvmqZW
         +AJ61yY5UFgxuQ10Hv4v26B2cHPTYWT3Jh68ev3YiXAG9jOYLSYOCe0VpnkyIyz8KOfC
         /3dNUm2v2WS9DTZpIXPvGqb6nAzVULav5FWhwnFgGRjHTCRJEryACQYVxvFWm6zDqwgF
         yyLkmOlWYT4/CTT2j5VTcUAkW247uPmOfcmnIx9gq5yTMcA9Iep7qow0MZHwNNlZf8OL
         WySA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:arc-authentication-results;
        bh=35wVrckPQbuXAQnMhU6zBcIBrJEV5bPFcYa+m8fpKug=;
        b=yDh5XTfCrp2rQpzyqYkuvUm5D5aMqB5juNfiMj+837v259tBPKCuOzZgOM0t2BQ/De
         xM8OFbWDSUEIFi5i0y37SbU1yR0Q3bbW54bBvADfjl9w1lr0jT/WcrUZhkKxMrWXKwXV
         a82B9+BZv/yQf/IAdmKO8/5Ah8uLwWR9tfb9pyMcCC8z/E93LKwDEN7z8OTGNVUbc6pi
         Lw/8GLyn0MszQlkGvtgzWIsljXPqA0oJcFxBUfu89WUL0Xy8jc0rIYEskHw/mT/lwNls
         m0cBCNF6lQYf66kLb2nadDYossRO7uyuFFp5e8hvubfAMZHAJS2jBMxTwm9dp6iBqrVa
         ysCA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n2si1920131qtl.217.2018.03.20.14.03.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Mar 2018 14:03:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51723 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eyOPc-0005mE-OH
	for alex.bennee@linaro.org; Tue, 20 Mar 2018 17:03:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48797)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eyONx-00059U-B7
	for qemu-devel@nongnu.org; Tue, 20 Mar 2018 17:01:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eyONw-0007XJ-3k
	for qemu-devel@nongnu.org; Tue, 20 Mar 2018 17:01:33 -0400
Received: from mail-yw0-f195.google.com ([209.85.161.195]:42849)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eyONp-0007TM-Qe; Tue, 20 Mar 2018 17:01:25 -0400
Received: by mail-yw0-f195.google.com with SMTP id z82so1008346ywd.9;
	Tue, 20 Mar 2018 14:01:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=1PJKLQzqqXL7Bwzw2IUmbDmzLiDzy5fXsqwfLNfGS+0=;
	b=CxtZJ86hJfdWy/zvmYu7hcdkw6ooHQU9Xw6ufwEbr96W9mqTEc1knXJbe8B5syfyze
	iOqItfS7cLH2tfKJiJYaC4Wuz8wmtbRr3aXU40TRofJt8YP0IzjyL31CmQMgvmG8DWjO
	Kw/llysEuFOK53UI3L0s7pOPZaoLx2TqxtqMl4unR38qEgv5jhqIQI3zd9KhqaeRDKcC
	QuPqXMGHg9bGh+7tMHDJNM9YwxI8KwQBmjN1qBg496pS+ITViUsFEXODSxVieZ+DEh8G
	/VkSVpkkzZpf7OWgf1qWLsoKfRQLtCeg4mEttUdSrQDow71DSA6lcDaLAQxLF++IahkU
	Jn3A==
X-Gm-Message-State: AElRT7GZNSi5YP8b78LO3eTqpVeOmE38q+/ufpxJuvJsPZYLIb4d68sY
	J9KQTbc5/ldlOtkxVTXYzAmoHxXrdLCcWNcR+fw=
X-Received: by 10.13.208.199 with SMTP id s190mr1597490ywd.33.1521579685052;
	Tue, 20 Mar 2018 14:01:25 -0700 (PDT)
MIME-Version: 1.0
References: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
	<1521232280-13089-9-git-send-email-alindsay@codeaurora.org>
	<9c99641e-af00-e229-02a1-7d396b5132d1@amsat.org>
	<20180320204523.GE24561@codeaurora.org>
In-Reply-To: <20180320204523.GE24561@codeaurora.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Tue, 20 Mar 2018 21:01:14 +0000
Message-ID: <CAAdtpL5L7BNv4VpLQbebjEsMsSO7uiyLPHxziJ=4Vyafh+StPQ@mail.gmail.com>
To: Aaron Lindsay <alindsay@codeaurora.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.161.195
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH v3 08/22] target/arm: Support
 multiple EL change hooks
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
Cc: Wei Huang <wei@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
	Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, qemu-devel@nongnu.org,
	Alistair Francis <alistair.francis@xilinx.com>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iakZqagLFq/m

Le 20 mars 2018 9:45 PM, "Aaron Lindsay" <alindsay@codeaurora.org> a =C3=A9=
crit :

On Mar 18 23:41, Philippe Mathieu-Daud=C3=A9 wrote:
> On 03/16/2018 09:31 PM, Aaron Lindsay wrote:
> > Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
> > ---
> >  target/arm/cpu.c       | 15 ++++++++++-----
> >  target/arm/cpu.h       | 23 ++++++++++++-----------
> >  target/arm/internals.h |  7 ++++---
> >  3 files changed, 26 insertions(+), 19 deletions(-)
> >
> > diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> > index 072cbbf..5f782bf 100644
> > --- a/target/arm/cpu.c
> > +++ b/target/arm/cpu.c
> > @@ -55,13 +55,16 @@ static bool arm_cpu_has_work(CPUState *cs)
> >           | CPU_INTERRUPT_EXITTB);
> >  }
> >
> > -void arm_register_el_change_hook(ARMCPU *cpu, ARMELChangeHook *hook,
> > +void arm_register_el_change_hook(ARMCPU *cpu, ARMELChangeHookFn *hook,
> >                                   void *opaque)
> >  {
> > -    /* We currently only support registering a single hook function */
> > -    assert(!cpu->el_change_hook);
> > -    cpu->el_change_hook =3D hook;
> > -    cpu->el_change_hook_opaque =3D opaque;
> > +    ARMELChangeHook *entry;
> > +    entry =3D g_malloc0(sizeof (*entry));
>
> imho g_malloc() is enough.

It seems like the only difference is between initializing it to zero
(g_malloc0) and making it as uninitialized (g_malloc) for coverity. Are
there coding standards for when we should choose which?


Since you initialize all members, bzero is not necessary; until someone add
another member to the structure. So your way is correct and safer, with a
ridiculous performance penalty.



>
> > +
> > +    entry->hook =3D hook;
> > +    entry->opaque =3D opaque;
> > +
> > +    QLIST_INSERT_HEAD(&cpu->el_change_hooks, entry, node);
> >  }
> >
> >  static void cp_reg_reset(gpointer key, gpointer value, gpointer opaque=
)
> > @@ -744,6 +747,8 @@ static void arm_cpu_realizefn(DeviceState *dev,
Error **errp)
> >          return;
> >      }
> >
> > +    QLIST_INIT(&cpu->el_change_hooks);
> > +
>
> You missed to fill arm_cpu_unrealizefn() with:
>
>     QLIST_FOREACH(...) {
>         QLIST_REMOVE(...);
>         g_free(...);
>     }

Do you mean arm_cpu_finalizefn()?


Yes :)



-Aaron


--
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies,
Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
