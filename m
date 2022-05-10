Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp4187931lfj;
        Tue, 10 May 2022 01:27:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw6kMyYtaeMEPaVSNeEjhKTKnBTw58DwKLeZMfPd+Ibhnwk8f18eehSRu52QTMiLAbL59WY
X-Received: by 2002:ad4:596e:0:b0:45a:b06d:d8cb with SMTP id eq14-20020ad4596e000000b0045ab06dd8cbmr16808888qvb.97.1652171270223;
        Tue, 10 May 2022 01:27:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652171270; cv=none;
        d=google.com; s=arc-20160816;
        b=Vs2TMGkqqgsw0z1tCoI3VVl9vmznLHwfQvvBUTpIpmznhkMfncEWegJ/fGqCE4WLUA
         Pnmlztb6FKSmMiUi7GlfkQFLShAzQJKjdSss3bpuOu/KKFLUE8rC1B+U8B5oauivzTj2
         zcXqbSGI71ugQuw48lssQkgafLJqZeucque3lwd1SOfl9fUVDHUk0colE4ZWh4DB3NC1
         QaddgnL2wp1rD5xbTRAqjZ7wwVpsDyoy0EBsFt70zrnWq2vSKqtnHk+oizzZVO/tMjDU
         icoSGYfhakGRLZwQ+Y4Gsp5QvEudEFqeMB/cgOmReIljagouqaEYt+g10nF8sYKBNc92
         wDvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=GqBTpIDibHf2I2qGHF/Hx5Ns2784NoLmtN3K72XkCSU=;
        b=z76Wd/i5u6eJlYwZrGT2Cwy5GToRNKRDJu9F7L3JCwjS7+vqYetg+OxqDAhvkQ9pR+
         brs3FY29i4T8ej7TXt1903+tY4D8wqF27jYcmI4y0dyZnGf4mKFjoI8uovXGqf2yuhDw
         GMlQtLekWIoRxb+SpxSKIPA4/2q9hUm0WZurSOW8kvlhkEZ9AOv3VpTm9OYcNpd8X6HZ
         RSSblVa/denfHn8Fx4jfMguONQkeu5apcjlAzvEVlTu2EZyX8/H28QHrJPvEX4GVK/6A
         PA32LC78LH4UlFZB1P3lW1/Xw97b60MsI4mc2F9ycNSPx3Jw5lpqGU0TG0XW15+x9CGv
         0ZDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=oh9jxPHI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h4-20020a05620a284400b0069f6cd59c40si10537009qkp.457.2022.05.10.01.27.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 May 2022 01:27:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=oh9jxPHI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:42546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1noLDh-00024V-Ma
	for alex.bennee@linaro.org; Tue, 10 May 2022 04:27:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1noLCt-0001xO-Bm; Tue, 10 May 2022 04:27:00 -0400
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130]:37563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1noLCr-0007wa-Ay; Tue, 10 May 2022 04:26:59 -0400
Received: by mail-il1-x130.google.com with SMTP id y11so10892880ilp.4;
 Tue, 10 May 2022 01:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=GqBTpIDibHf2I2qGHF/Hx5Ns2784NoLmtN3K72XkCSU=;
 b=oh9jxPHIpxKPvK1rTg6QROVgWVzFkD3IOKNeK1CGxGseoV7DQGlYJnTw2XXarqEV4O
 0Djp9S5zastO3uBslbrDyFolautsi2ccVt6CSYNxl7HQJ7/ycZZCdwuq4jAKd9FiTH0D
 piibxKhFrzLRbT/MpDTYsLtXQ8Zl1LYY2xZLbK+BUOK/oPxlIWryT50Dk4aSt0wybNij
 GXOHeYG5KUttX5KOpoxT5Bq5paptdV/LtQT4ZIvy7/fXt1dOTr1RsMJVGY/Ega9EiLZB
 mbI7RPRJB6Q6Wj8LvySM2N7iNLqOH5fIO9RH4JQpbAsekaHrf97YjmUlUWyErNEJQ/iN
 bChw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GqBTpIDibHf2I2qGHF/Hx5Ns2784NoLmtN3K72XkCSU=;
 b=gtjwrNJ3PjT+2YXADUKjySa76/5h8cHrJ5yOfhBDlnslZ78n6NusQ4CcZL3r/9NbXv
 ZOyliVEvDj9+ODYR1aBNUefJvZlcRWkPInUdMcf1ygQbId0O3U8Hv+lP/2YMFE6MCYSp
 0shTPM2kjcR4d3v+7BG16wSFqkO2Ahd09QbQ99DAjIZYfIhpa3nKuLa1sDd19wfczHno
 BjN5YaFHsRqaxW9SUJlEsa76Nhol1KAefDyBbSWVs0FVuNmthWnjbjKt3IAJv1VgM7M1
 tiYdt+iJcohBYaxtz+PEKYd83iYD+IDlmlf8TnCxzLqJcxPICESTMe2nPYBMQAbKS0II
 km3w==
X-Gm-Message-State: AOAM533mME6WNt2svCvHJyOvOtIRXY8GTyo4hwrJduJpzr06a6kv/pb7
 aTx94EAeVoElcxed6Io9mVCczusOWguAHt0sBLI=
X-Received: by 2002:a05:6e02:1986:b0:2cf:908d:3d0a with SMTP id
 g6-20020a056e02198600b002cf908d3d0amr6673896ilf.113.1652171211857; Tue, 10
 May 2022 01:26:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220429233146.29662-1-muriloo@linux.ibm.com>
 <b31e3221-6dfd-de68-8dfc-177ded0b501e@ilande.co.uk>
 <9ec244e0-4c7c-69ff-08f8-da451f6da449@linux.ibm.com>
 <87sfpqaey7.fsf@linux.ibm.com>
 <2ab9e2b3-5dba-4e18-ed2e-6063a2716f4c@ilande.co.uk>
 <87ilql9xww.fsf@linux.ibm.com>
 <ef8256fb-6e99-5f37-d5c5-67f9af4302b0@ilande.co.uk>
 <472e45e8-319b-ad48-3afa-0dfa74e6ad20@redhat.com>
In-Reply-To: <472e45e8-319b-ad48-3afa-0dfa74e6ad20@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 10 May 2022 10:26:25 +0200
Message-ID: <CAKmqyKNXMsVnH1y__abw7YaompT5MLXFn0Pvr+d4ddwXeP_VTw@mail.gmail.com>
Subject: Re: QEMU 32-bit vs. 64-bit binaries (was: [PATCH] mos6522: fix
 linking error when CONFIG_MOS6522 is not set)
To: Thomas Huth <thuth@redhat.com>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Fabiano Rosas <farosas@linux.ibm.com>, muriloo@linux.ibm.com, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, mopsfelder@gmail.com, 
 "open list:New World" <qemu-ppc@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 qemu-arm <qemu-arm@nongnu.org>, qemu-RISC-V <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::130;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x130.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: e6Y4zy8GFNlT

On Tue, May 10, 2022 at 10:07 AM Thomas Huth <thuth@redhat.com> wrote:
>
> On 04/05/2022 16.48, Mark Cave-Ayland wrote:
> > On 04/05/2022 15:26, Fabiano Rosas wrote:
> >
> >> Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk> writes:
> >>
> >>> On 03/05/2022 15:06, Fabiano Rosas wrote:
> >>>
> >>>> Murilo Opsfelder Ara=C3=BAjo <muriloo@linux.ibm.com> writes:
> [...]
> >>>> So ppc64-softmmu doesn't quite do what it says on the tin. I think i=
n
> >>>> the long run we need to revisit the conversation about whether to ke=
ep
> >>>> the 32 & 64 bit builds separate. It is misleading that you're explic=
itly
> >>>> excluding ppc-softmmu from the `--target-list`, but a some 32 bit st=
uff
> >>>> still comes along implicitly.
> >>>
> >>> Unfortunately for historical reasons it isn't quite that simple: the
> >>> mac99 machine in
> >>> hw/ppc/mac_newworld.c is both a 32-bit and a 64-bit machine, but with=
 a
> >>> different PCI
> >>> host bridge and a 970 CPU if run from qemu-system-ppc64. Unfortunatel=
y it
> >>> pre-dates
> >>> my time working on QEMU's PPC Mac machines but I believe it was (is?)
> >>> capable of
> >>> booting Linux, even though I doubt it accurately represents a real ma=
chine.
> >>
> >> Well, what you describe is fine in my view, the 64-bit machine uses
> >> qemu-system-ppc64. If there is shared code with 32-bit, that is ok.
> >>
> >> What I would like to understand is what is the community's direction
> >> with this, do we want:
> >>
> >> 1) the 64-bit build to include all of the code and have it run all
> >>     machines, or;
> >>
> >> 2) the 64-bit build to run only 64-bit machines and the 32-bit build t=
o
> >>     run only 32-bit machines.
> >>
> >> There are things such as 'target_ulong' that go against #1, and this
> >> thread shows that we're not doing #2 as well.
> >>
> >> I know there have been discussions about this in the past but I couldn=
't
> >> find them in the archives.
> >
> > Certainly if a 64-bit Mac machine were to be added today, I'd be inclin=
ed to
> > copy mac_newworld.c into a separate file and give it a separate machine=
 name
> > for ppc64 to make a clear distinction between the two machines (and all=
ow
> > them to evolve separately). Unfortunately I have no idea as to what the
> > reference machine for the PPC64 Mac machine was supposed to be which ma=
kes
> > it harder to decide what to do :(
> >
> > In my mind it feels like qemu-system-ppc is for 32-bit guests and
> > qemu-system-ppc64 is for 64-bit guests which I believe is consistent wi=
th
> > how it currently works with MIPS and ARM (someone feel free to correct =
me
> > here).
>
> For CPUs that have both, 32-bit and 64-bit variants, we have mixed approa=
ches:
>
> 1) For x86_64/i386, aarch64/arm, mips64/mips and ppc64/ppc, the 64-bit
> variants are a superset of the 32-bit variants, i.e. if you build the 64-=
bit
> version, you normally don't need the 32-bit version anymore (see below fo=
r
> the KVM-case where you still might need it).
>
> 2) For sparc64/sparc and riscv64/riscv32, the set of machines is distinct
> between the 64-bit and 32-bit versions (well, riscv has some machines
> shared, and some machines are different).

For RISC-V we are slowly moving towards riscv64 being a superset of
riscv32, similar to the other architectures

>
> I once suggested in the past already that we should maybe get rid of the
> 32-bit variants in case the 64-bit variant is a full superset, so we can
> save compile- and test times (which is quite a bit for QEMU), but I've be=
en
> told that the 32-bit variants are mostly still required for supporting KV=
M
> on 32-bit host machines.

That was the eventual long term plan for RISC-V, then we can have a
single binary for everything

>
> But in the long run, I think we rather want to converge everything into o=
ne
> binary (to decrease testing and compilation time) instead of separating
> stuff into multiple binaries, so IMHO we should not start separating the
> 32-bit machines into qemu-system-ppc and the 64-bit-only machines into
> qemu-system-ppc64 now.

Agreed!

Alistair

>
>   Thomas
>
>
