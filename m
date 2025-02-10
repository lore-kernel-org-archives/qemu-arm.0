Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp1816691njb;
        Mon, 10 Feb 2025 01:33:55 -0800 (PST)
X-Received: by 2002:a05:690c:6c10:b0:6f9:ac35:4489 with SMTP id 00721157ae682-6f9b29a85e9mr102812077b3.34.1739180035703;
        Mon, 10 Feb 2025 01:33:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739180035; cv=none;
        d=google.com; s=arc-20240605;
        b=iPTmrcme2mWJJm1tAv2HYQ8HX0n4YdrME4Gdm6oeqjRaL+IHBcOLF63vt0Zb54o6H6
         FP+Z4wrLeHU1Uev7jt5/tqSENnuABTfpK4LXWx4D57sThViYITrsZ5shUgfCKy0Zf1Zb
         6/CfqDAX9hFPqPL119ODv5uTmS6/LlRpUzXhKAvmdPTbIG/2wKpBT4U7eZ6OGi8Z3F9t
         wLeAF/9t43Lp2PFjy9OCDiMQWON41NP003QX/8QzU4gnDT7IaM2yvo4PBgdceLMEgt6P
         2Ur8/Z2pb9r8NH+ZNg2ymTXNzvKOvNLpBDoiemMuDNwQJlL4On8WWE+D5dmB5p78mzDC
         QxhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zbzce1JeM8K739t+w3wJvg+8MysR5ashRFokl5gUKN8=;
        fh=UH+d3ILEo9XULRbi0KvdDGPtMpuf3mz3lT/9lLbPWSA=;
        b=asjbgh8b6B5uX7EOAnMnT6SuZsvJVm5sL3YyqbJPnbZufuDwXfAe2hRY9srNdndv2h
         r/EQ26NprCAKp6QPQJQj4iYC2miL4le4nC9grvdLjDf+ZzTuxUqCBn9/V7d8pRznqD55
         tkOuPJmmAPiKgHc8tLvhBeUOsIySX5V/8LGHroOLsevogg/2DqXDi/Zuqkw+tU7muSEY
         wY3QLtvZh7UAAuohWUJeqVGuP0lA09B8f3GMRYSOrw8wKPZO0ZwfFIrZ5Crc60wyB79v
         xxuWWlvfMw2sPNvUypg0185LHQFnlH3PmFRcYqlr0zR+f+6I+fpAcAgpA+NhSZXpTk86
         eu/Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LNH9qNqM;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 00721157ae682-6f9ca59711fsor25486537b3.7.2025.02.10.01.33.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 10 Feb 2025 01:33:55 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LNH9qNqM;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739180035; x=1739784835; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zbzce1JeM8K739t+w3wJvg+8MysR5ashRFokl5gUKN8=;
        b=LNH9qNqMB0eTAFgUNepFPtTkxsZbAMJD55FIyB9KQAkPvxn1RqZdJDGVCo//UrJZcz
         YDrE5kVHsuWAqTCGt2kq6E5K+sjruLRolYA6JXHhwq1m2hlGw5GnESLBiR7QdxL/sSct
         RUCFHaBkiNKACRfwKBw/TWNcVoDFjrHsZattWbBQ28uL8YayULD9tSzyMrzYTZFEEWs3
         pzQAwpid6m8CPfZsIz/XIQq9N0D8JeUe981QygNjBxbeOCCQSbPEx+2Ji1McqcafF2ix
         A+iwYtcdY2RUeYuDKL/fKSAa/8Z6hqDWOjG2S0vgMXCXQJ5+hLlDj3raU/4PEwOc/mY2
         IR0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739180035; x=1739784835;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zbzce1JeM8K739t+w3wJvg+8MysR5ashRFokl5gUKN8=;
        b=fyAHYDvMxtGjQwo2nzEkUCIa0HfkOBwQ/t7g20LbUSLRaAmj+crIXDMB17+yAQPqI6
         QYkd0uDzS97dvWJBFFcqnGWxVBNcenl+pPL7Mw3MnEW2ihMPLZ8z6s5MVc/vOKsC71us
         FIkgBuH3pQMeo2tUqlRixTHt5yfG2Z9QPkHwl5aOTX0bBeG7PCBXfdkaGB58LC4QvYf6
         VdGtvX6tUHPpJEe5pvGwX6TcdfoetNrq2Z+s70l+CJG1qcsPr3lc5tJcZbKbzYCso6ly
         LQBhaOk6d7sPRKoW/LX6ltf4nmCwSChzwCG5+NJekkFhvl2uHLX/H5gjc89//qDXZzWB
         4lOQ==
X-Gm-Message-State: AOJu0YxrytUqiqXnCwVkTiLOHe/ykgn2hVF3p3VCjopsOQgjTDHE8lsg
	I1ribW91HuRadAOwps4SRNvYL23496tBd3pKyNW6+EWpNOgIdDZikuZXyKptwN9y7iTBEx2uREi
	oVWDnyo7g3DXniM++qPPlrufXIFWQsTRFF+x3uQlmKpsGGA32R7s=
X-Gm-Gg: ASbGncsPKpCSinA9xFwIo9cZIaEIdqOBGWSNk8HNianeQmTHZeGMqE5QNKmLulHQ5ss
	UFC3alImP4j3lK0WHKwuaw89kIILjmjwYgucmd232uUXRfSxApvk7t8agKrH9t2jTMIOfEQ6ykg
	==
X-Google-Smtp-Source: AGHT+IH+LpIg3DfIs0EJDk2wfnMLR3zmxIhh+xfMnqKNw65LHDaxqpqdKVHcC25fGTb6WHCGIBSZdsKjqhpmqkj+eiI=
X-Received: by 2002:a05:6902:1249:b0:e5b:248a:bf2f with SMTP id
 3f1490d57ef6-e5b4626c51cmr10924092276.31.1739180035342; Mon, 10 Feb 2025
 01:33:55 -0800 (PST)
MIME-Version: 1.0
References: <20240615185423.49474-1-florian.lugou@provenrun.com>
 <CAFEAcA_+WrzM4fXQMUxMi3L5yiUWMrUGTSZH=NDdYDKUCP+8NQ@mail.gmail.com>
 <20240620135627.qxcrkdx5v7wdurx4@flugou-latitude5401> <CAFEAcA-ngrrEUDD7eA_sOLGF+_wRCuQVxTwuCA4pXjRcuJucmA@mail.gmail.com>
 <20240621140725.f4hsasmhrhh4joxm@flugou-latitude5401> <CAFEAcA9c9hbpsdyc7+=QEOZGrNY2m-urk6VrWdwCdfk9ipkwpw@mail.gmail.com>
 <20240820113024.53tmzejw2omm6bbx@flugou-latitude5401> <CAFEAcA9X0w5QW2qnnhF2k72ZrS8SALWiXV7uNr1e=jQnZvrQ7Q@mail.gmail.com>
 <CAFEAcA-MrouAPdwpsyojMC-bx4aFtuL=tYZD=2pBS1vP5iicaw@mail.gmail.com>
 <5ee77b8c-e6a4-421b-b729-a6535fdf1e6d@linaro.org> <87a5axr4l4.fsf@draig.linaro.org>
In-Reply-To: <87a5axr4l4.fsf@draig.linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 Feb 2025 09:33:44 +0000
X-Gm-Features: AWEUYZks7N5joTM2FfdiQcWhg1B3GGmwDm1C_TyYlrkh2oHdflFuHEhWeKy_Jq8
Message-ID: <CAFEAcA89Wm-cZZV7swdmzVxjR3h3QfGpgROA=AAt6ABJLbOOsw@mail.gmail.com>
Subject: Re: [PATCH] target/arm/helper: Fix timer interrupt masking when
 HCR_EL2.E2H == 0
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org, 
	"open list:ARM TCG CPUs" <qemu-arm@nongnu.org>, Florian Lugou <florian.lugou@provenrun.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: SA/6GCmNT94A

On Fri, 7 Feb 2025 at 18:29, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> Richard Henderson <richard.henderson@linaro.org> writes:
>
> > On 2/7/25 07:45, Peter Maydell wrote:
> >> This is where things go wrong -- icount_start_warp_timer()
> >> notices that all CPU threads are currently idle, and
> >> decides it needs to warp the timer forwards to the
> >> next deadline, which is at the end of time -- INT64_MAX.
> >> But once timer_mod_ns() returns, the generic timer code
> >> is going to raise an interrupt (this goes through the GIC
> >> code and comes back into the CPU which calls cpu_interrupt()),
> >> so we don't want to warp the timer at all. The clock should
> >> stay exactly at the value it has and the CPU is going to
> >> have more work to do.
> >> How is this supposed to work? Shouldn't we only be doing
> >> the "start moving the icount forward to the next deadline"
> >> once we've completed all the "run timers and AIO stuff" that
> >> icount_handle_deadline() triggers, not randomly in the middle
> >> of that when this timer callback or some other one might do
> >> something to trigger an interrupt?
> >
> > I don't understand timer warping at all.  And you're right, it doesn't
> > seem like this should happen outside of a specific point in the main
> > loop.
>
> This has come up before - and the conclusion was we don't know what
> sleep=3Don/off is meant to mean. If the processor is asleep and there are
> no timers to fire then nothing will happen.
>
> It was off-list though:
>
>   Subject: Re: qemu-system-aarch64 & icount behavior

No, that was a different situation. That thread was about
when there genuinely is nothing to do (all CPUs asleep and
no timers active) for the rest of the life of the simulation.

The bug in this thread is that icount incorrectly prematurely
decides it should warp the timer forwards, when in fact
there is going to be something the CPU should be doing
right now (i.e. responding to the interrupt the timer callback
is about to raise). It becomes very obvious when there's
no other timer callback, because the place that icount
incorrectly warps us to is end-of-time, but I'm pretty sure
that even when there is another timer active icount will
still be wrongly warping time -- it will just be less obvious
because the interrupt gets incorrectly delayed to whatever
that subsequent timer callback time is, rather than forever.

thanks
-- PMM
