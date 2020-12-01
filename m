Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp5692448lfb;
        Mon, 30 Nov 2020 16:00:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyWis5boVhNuaYoQnokqCJrjG1y5OGdBr1uGM9/o1ygVhMfEYNZZfqtBM95ZNjO6yI7PYfJ
X-Received: by 2002:a25:492:: with SMTP id 140mr42972831ybe.198.1606780836611;
        Mon, 30 Nov 2020 16:00:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606780836; cv=none;
        d=google.com; s=arc-20160816;
        b=x88TUIICs2q60T/TzyeozDLzZlDJW5LG9Li3Lq2liggqjKJXoNTBQDKn7ISomdrng3
         3+0BOGYijcbA33oPQQf3K8ro1YheaA+VcgYNslxZ4cM+qVpZOTGmI9u1bWreIu8AQdpi
         xgT/pFHC3vi+Dya5K8Cc2rtggjZztjFaIX2DGkychaUiB4kKMZlb6YxUJD8o3RQdKC1I
         WI4xTUY5U4PD2dCCQFwB522Uy9oVFAVtogw+hiUv89ha2FWbqlzZ8CFgzMaN4WTBCi4u
         Dbin36BSoUMJtVu+KxMqanIZpHgQBatdECYhkf8bwrqvAr5Ep2ZKFzqHGytdfRYKsMlF
         AOUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=gFCRm/4h3HXLjKG7xJ3jnJ5g6/OXy3X4V05S2rNPgs0=;
        b=pgSjvMl1UplNkBIxtjhfZu395PwfasugkNlBm8zB8LRaGxSrma/ol9LvXSenNiQ7JF
         ss3D0CqCIrhvSt+CbA8Ke+NFirF/AZI8AGIwryvsCkE2+eY5wEgI5dQjLzJnjlMrz54h
         UVgSUT1mjx1/1orG4fm4xO0ojxGL+mLWkHolpvaWAoWQ2TUPzFItj5rkL2vBcSPlsZ32
         ge/h6FMClilyQjaD41R+bpIawqQsUnjrjpjNvLcqDBtAu5o9k/qTl77yQMmPBRN4NDrI
         ShnIZrZNF8pK6x6DL8I3sKNXQQ/AgKPcRYG8VBQPOYUJENHr/W1zbt4T/X94qyRer/q1
         RCUg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=q0o8t1gx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m17si25203ybm.232.2020.11.30.16.00.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Nov 2020 16:00:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=q0o8t1gx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:52804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kjt5v-0000ZI-Vg
	for alex.bennee@linaro.org; Mon, 30 Nov 2020 19:00:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pcc@google.com>) id 1kjt5m-0000Z7-Ir
 for qemu-arm@nongnu.org; Mon, 30 Nov 2020 19:00:26 -0500
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f]:36798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pcc@google.com>) id 1kjt5k-0001kd-9d
 for qemu-arm@nongnu.org; Mon, 30 Nov 2020 19:00:26 -0500
Received: by mail-il1-x12f.google.com with SMTP id z10so4689604ilu.3
 for <qemu-arm@nongnu.org>; Mon, 30 Nov 2020 16:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=gFCRm/4h3HXLjKG7xJ3jnJ5g6/OXy3X4V05S2rNPgs0=;
 b=q0o8t1gxOitYZVWYxd+xolWwsh0T9PjOAOjTXUcFFwjT256HXASunbfCMZDP2r7BfZ
 tIu2b9sffxDPhYUHCR04jy9DBR8ebIjIYFDJAflb0A61vm3xQ+FBvXWJldnLXqv3pc/S
 +OgY7OP3kdvEKvBEneKei5CNlBLfe8SSCO1Hd0YuVrC2xKVfPefiFTYD1/wwNGi/tnMQ
 Tpp5qSnW7XBX445pT9G+yhWRVYZ4xf7+fD7y6DUOV70KpQNIfP7Zb/QPPS06ylpjT/fW
 /1tf3EtRrwwMP1erMfjyu8diHmCJOIltQ+0h0lU1fzUcSEWcatbwAqH0jUb06R73xshM
 UH5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gFCRm/4h3HXLjKG7xJ3jnJ5g6/OXy3X4V05S2rNPgs0=;
 b=U7AiPFsaiffORTN1YOgjzHNTAmV3crPXnB4TGmP+PvWGt8rEBdQFYpE4iSmtONPYo4
 fQyZyR1Yu6QjU4y3hDSVcjGnmVdNUvkAD9w/KOi6Wz9S1ubMsvu1Al+7wPx6zUNXjkHr
 hsZKKFLKokFzI8QIYQmcUBuile4+rvehsWoZTdw9bViht8VLM5TErkmUB9hp5ilb7tlW
 aH6L225Zyrw3yMb3dt5JhS05gL17Swb01KycPwq3sAR87IqE2b4Old3vs5RsmtdWNvEW
 j0w87UOfIDqpPc8YPmQ2jlc4ev95jF1I3Fh2kOl/WH2A5122o8xVcFNctYgCVGm0oJML
 m6oA==
X-Gm-Message-State: AOAM532/JUy8r3fQ1fxt37+nGsF8Z6aVqUy7WWsScsZMJHpFxiqi7Cgd
 Mbch696/OIWKLjSKNgUugwIaoC5FRz4G9ZA3vbE7XQ==
X-Received: by 2002:a92:351c:: with SMTP id c28mr170195ila.61.1606780822795;
 Mon, 30 Nov 2020 16:00:22 -0800 (PST)
MIME-Version: 1.0
References: <20201126215017.41156-1-agraf@csgraf.de>
 <20201126215017.41156-3-agraf@csgraf.de>
 <20201127200054.GC56950@SPB-NB-133.local>
 <392c2465-157e-e15a-0a2c-2e3faa166d22@csgraf.de>
 <CAEkmjvUArgL+Mcvy6nUhfJrdX3OaF=U8UdWia7ZDo9GWk0VF=g@mail.gmail.com>
 <CAEkmjvVJ5zup4NR2+DStt_NvV2cV7+7dj2=fJ3DQBkth8pAfcw@mail.gmail.com>
 <cecd20d0-278b-0a4b-ba9c-0207504c99d7@csgraf.de>
 <CAEkmjvVOAYP6wJyVpAtZE3d=iNOOWGZeHptQ9xJDGcTi4qQ0hQ@mail.gmail.com>
 <CAMn1gO7jqjsqJHtSaV7F+2qmtfF-YFDJwo=O8ot2iem+Uz4Zrw@mail.gmail.com>
 <6975b4a3-1568-df40-8594-bfcf488ac425@csgraf.de>
 <CAMn1gO5xs8RniRYm+Gnbh8S3GVah2+2Ew2V6tFL6PNuSJ7o5Hw@mail.gmail.com>
 <4e1d93a4-9dcc-c6b6-e060-6eea39ae2f16@csgraf.de>
In-Reply-To: <4e1d93a4-9dcc-c6b6-e060-6eea39ae2f16@csgraf.de>
From: Peter Collingbourne <pcc@google.com>
Date: Mon, 30 Nov 2020 16:00:11 -0800
Message-ID: <CAMn1gO44Y4rahufveQ1dOq96nhqvGEmZ0pYci2f6BKv9kd638Q@mail.gmail.com>
Subject: Re: [PATCH 2/8] hvf: Move common code out
To: Alexander Graf <agraf@csgraf.de>
Cc: Frank Yang <lfy@google.com>, Roman Bolshakov <r.bolshakov@yadro.com>, 
 Peter Maydell <peter.maydell@linaro.org>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, 
 Cameron Esfahani <dirty@apple.com>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::12f;
 envelope-from=pcc@google.com; helo=mail-il1-x12f.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FnGpt62P/RLi

On Mon, Nov 30, 2020 at 3:18 PM Alexander Graf <agraf@csgraf.de> wrote:
>
>
> On 01.12.20 00:01, Peter Collingbourne wrote:
> > On Mon, Nov 30, 2020 at 1:40 PM Alexander Graf <agraf@csgraf.de> wrote:
> >> Hi Peter,
> >>
> >> On 30.11.20 22:08, Peter Collingbourne wrote:
> >>> On Mon, Nov 30, 2020 at 12:56 PM Frank Yang <lfy@google.com> wrote:
> >>>>
> >>>> On Mon, Nov 30, 2020 at 12:34 PM Alexander Graf <agraf@csgraf.de> wr=
ote:
> >>>>> Hi Frank,
> >>>>>
> >>>>> Thanks for the update :). Your previous email nudged me into the ri=
ght direction. I previously had implemented WFI through the internal timer =
framework which performed way worse.
> >>>> Cool, glad it's helping. Also, Peter found out that the main thing k=
eeping us from just using cntpct_el0 on the host directly and compare with =
cval is that if we sleep, cval is going to be much < cntpct_el0 by the slee=
p time. If we can get either the architecture or macos to read out the slee=
p time then we might be able to not have to use a poll interval either!
> >>>>> Along the way, I stumbled over a few issues though. For starters, t=
he signal mask for SIG_IPI was not set correctly, so while pselect() would =
exit, the signal would never get delivered to the thread! For a fix, check =
out
> >>>>>
> >>>>>     https://patchew.org/QEMU/20201130030723.78326-1-agraf@csgraf.de=
/20201130030723.78326-4-agraf@csgraf.de/
> >>>>>
> >>>> Thanks, we'll take a look :)
> >>>>
> >>>>> Please also have a look at my latest stab at WFI emulation. It does=
n't handle WFE (that's only relevant in overcommitted scenarios). But it do=
es handle WFI and even does something similar to hlt polling, albeit not wi=
th an adaptive threshold.
> >>> Sorry I'm not subscribed to qemu-devel (I'll subscribe in a bit) so
> >>> I'll reply to your patch here. You have:
> >>>
> >>> +                    /* Set cpu->hvf->sleeping so that we get a
> >>> SIG_IPI signal. */
> >>> +                    cpu->hvf->sleeping =3D true;
> >>> +                    smp_mb();
> >>> +
> >>> +                    /* Bail out if we received an IRQ meanwhile */
> >>> +                    if (cpu->thread_kicked || (cpu->interrupt_reques=
t &
> >>> +                        (CPU_INTERRUPT_HARD | CPU_INTERRUPT_FIQ))) {
> >>> +                        cpu->hvf->sleeping =3D false;
> >>> +                        break;
> >>> +                    }
> >>> +
> >>> +                    /* nanosleep returns on signal, so we wake up on=
 kick. */
> >>> +                    nanosleep(ts, NULL);
> >>>
> >>> and then send the signal conditional on whether sleeping is true, but
> >>> I think this is racy. If the signal is sent after sleeping is set to
> >>> true but before entering nanosleep then I think it will be ignored an=
d
> >>> we will miss the wakeup. That's why in my implementation I block IPI
> >>> on the CPU thread at startup and then use pselect to atomically
> >>> unblock and begin sleeping. The signal is sent unconditionally so
> >>> there's no need to worry about races between actually sleeping and th=
e
> >>> "we think we're sleeping" state. It may lead to an extra wakeup but
> >>> that's better than missing it entirely.
> >>
> >> Thanks a bunch for the comment! So the trick I was using here is to
> >> modify the timespec from the kick function before sending the IPI
> >> signal. That way, we know that either we are inside the sleep (where t=
he
> >> signal wakes it up) or we are outside the sleep (where timespec=3D{} w=
ill
> >> make it return immediately).
> >>
> >> The only race I can think of is if nanosleep does calculations based o=
n
> >> the timespec and we happen to send the signal right there and then.
> > Yes that's the race I was thinking of. Admittedly it's a small window
> > but it's theoretically possible and part of the reason why pselect was
> > created.
> >
> >> The problem with blocking IPIs is basically what Frank was describing
> >> earlier: How do you unset the IPI signal pending status? If the signal
> >> is never delivered, how can pselect differentiate "signal from last ti=
me
> >> is still pending" from "new signal because I got an IPI"?
> > In this case we would take the additional wakeup which should be
> > harmless since we will take the WFx exit again and put us in the
> > correct state. But that's a lot better than busy looping.
>
>
> I'm not sure I follow. I'm thinking of the following scenario:
>
>    - trap into WFI handler
>    - go to sleep with blocked SIG_IPI
>    - SIG_IPI arrives, pselect() exits
>    - signal is still pending because it's blocked
>    - enter guest
>    - trap into WFI handler
>    - run pselect(), but it immediate exits because SIG_IPI is still pendi=
ng
>
> This was the loop I was seeing when running with SIG_IPI blocked. That's
> part of the reason why I switched to a different model.

What I observe is that when returning from a pending signal pselect
consumes the signal (which is also consistent with my understanding of
what pselect does). That means that it doesn't matter if we take a
second WFx exit because once we reach the pselect in the second WFx
exit the signal will have been consumed by the pselect in the first
exit and we will just wait for the next one.

I don't know why things may have been going wrong in your
implementation but it may be related to the issue with
mach_absolute_time() which I posted about separately and was also
causing busy loops for us in some cases. Once that issue was fixed in
our implementation we started seeing sleep until VTIMER due work
properly.

>
>
> > I reckon that you could improve things a little by unblocking the
> > signal and then reblocking it before unlocking iothread (e.g. with a
> > pselect with zero time interval), which would flush any pending
> > signals. Since any such signal would correspond to a signal from last
> > time (because we still have the iothread lock) we know that any future
> > signals should correspond to new IPIs.
>
>
> Yeah, I think you actually *have* to do exactly that, because otherwise
> pselect() will always return after 0ns because the signal is still pendin=
g.
>
> And yes, I agree that that starts to sound a bit less racy now. But it
> means we can probably also just do
>
>    - WFI handler
>    - block SIG_IPI
>    - set hvf->sleeping =3D true
>    - check for pending interrupts
>    - pselect()
>    - unblock SIG_IPI
>
> which means we run with SIG_IPI unmasked by default. I don't think the
> number of signal mask changes is any different with that compared to
> running with SIG_IPI always masked, right?

And unlock/lock iothread around the pselect? I suppose that could work
but as I mentioned it would just be an optimization.

Maybe I can try to make my approach work on top of your series, or if
you already have a patch I can try to debug it. Let me know.

Peter
