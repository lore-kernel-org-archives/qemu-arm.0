Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp4911218wrd;
        Wed, 5 Sep 2018 07:09:48 -0700 (PDT)
X-Received: by 2002:a0d:f302:: with SMTP id c2-v6mr22021937ywf.232.1536156588389;
        Wed, 05 Sep 2018 07:09:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1536156588; cv=none;
        d=google.com; s=arc-20160816;
        b=Tz1r3rUMORUIdFXCcqQRUcrj3YnaFnVzetgtmFP7u5X5DdGjn0XbCSlTWJdG13f+Mw
         yzMF/wZAT+E8eFQBF3qpJ5L6zjcKBfWi55CBCJUFdtdvqPGYLBIrBRfBhd3yvOfg/OJn
         Er8/ZGKucIFjj7vqowuZ2BlLY1vP6aNWCu+SqFKeID5s2bDmF7ejXzIbyK5uGs9BQdvy
         TwnOXBRgXP/hu+uCkCyFvqq8hAEyo8CXhaL8cRWs4g/guNulSfE0ZCw7flmc9X1Xxxs5
         hZ3zwa98jif/u8aM3SD49oXRhjExKkGqB14ybyJjZrZNQ5ROeKF48veAjBn4m3ZqZMCb
         5VFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=R374TK82JCRV3Jyg9yAjbIXfSLHkAXrUSpKtgukc+EQ=;
        b=TNzahAOwMRfgyZb2gRp3+3/915RvdXrhG1PAxJXUnHSMqxadHby7QT9kP+WUaAdWW9
         VsNsMgbs39G0XJZToFtijYqTsg4BFCalmQBO83FCVUoUYLInFTgKBhuDiSRLPxnXyk/t
         E53CeznFpCRdpyptcSKxHRqCHOOL6FDkqNZXcAqvEa0RuVO5Vt8qafgY6u5m9ZPqJl+h
         NDtFcsnikT9N2NDtMhlLVMUlKmX4uJzdWtQMKGvecin543rJDV8p0mpMvtU1RTJAe5ck
         bGVXWkYS9Lc+0yNxl4+idpUlaV6whBAz/eQBS4VVi8nXm6F7suVnHAYzSg46TMkQkbQW
         FgXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=P5bGGru+;
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <hongbo.zhang@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id h7-v6sor383875ybm.171.2018.09.05.07.09.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 05 Sep 2018 07:09:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=P5bGGru+;
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=R374TK82JCRV3Jyg9yAjbIXfSLHkAXrUSpKtgukc+EQ=;
        b=P5bGGru+8pthtnPFG4tkIy764MqihQmPFnJauAXD0KKdLXIMS863Ik3dXOH9/J5Me6
         TAfqsEXCWMgJ5tQg7R5xEh4kefp3B3eC+S1TTWOGJIdOpVI1SIdxf5MhMOr24pDxgNEE
         uIf+zprsbWEpYbAr3v6b2QK40t5p1/esMpgv8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=R374TK82JCRV3Jyg9yAjbIXfSLHkAXrUSpKtgukc+EQ=;
        b=jvKL9VlTDfjiKE7n3A2feNCh/OfmaB92Q2kpzprj3GQ3UeRpFwdycZjZ+Vtiy9c2rs
         lji583FkLAYn/D+X8nIGCrVAJ+EVCFtuwAEFWNpTYji9eV0U0Io5Tu0eeUNn2dh7Phld
         DW54b443Gs96hbD8ll5alT0JI34lj+Ypu4YELvoRRcFpyMrP2EZdns8mxBJ9HCUjuTXe
         2hrqiFEUf+cKrJE+FShKS1hhRGoTenJv58w4ZWmZBPmBhPgwmfFCAXhifiKPdRtASWrf
         gKfuOIegDTIl9/5MfXfFfD3ESsttkssH2BK+2nPaURlyZiRRzGXNNEK97ijMD3JzE/b9
         Ketg==
X-Gm-Message-State: APzg51D7m/Rtp55NRsEZz+zaJpw4PI++ErfVxgLiaiiZUK0sj+1IUo6y
	urGI/Y8DLkvkdQlCfbYuSYQYeRgbPmomI15k530fHi9W
X-Google-Smtp-Source: ANB0VdZI8e/ozoDtpsb8yTicnV6vzxJVM58xArNOJSMH2LAp0qagOuEfGWgnlQY3YGn/FqzmqM6o+6IyZVgwTmPJywg=
X-Received: by 2002:a25:4c45:: with SMTP id z66-v6mr8295064yba.58.1536156587849;
 Wed, 05 Sep 2018 07:09:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:58c5:0:0:0:0:0 with HTTP; Wed, 5 Sep 2018 07:09:46 -0700 (PDT)
In-Reply-To: <20180905120248.unyh6q4msvyx4f43@kamzik.brq.redhat.com>
References: <1532496652-26364-2-git-send-email-hongbo.zhang@linaro.org>
 <CAFEAcA9hivJzqksiSZbco4+EysYj=_y0t3k_L7TobxNPS8T2dQ@mail.gmail.com>
 <CAHmQWvC4Kp1CAeCe8ZTGtSeG7fnT=Xen4GFKfnhTBWUCJdQV+g@mail.gmail.com>
 <20180829134219.cmyqipnvukk6k2rp@kamzik.brq.redhat.com> <CAHmQWvA5t7zbbDDM0UvuKSL_Z8ey+x+vOGZumYjwsq0FC5AHGA@mail.gmail.com>
 <20180830083117.iekobw7l3arkt24m@bivouac.eciton.net> <CAFEAcA_s+9-4PYHyx_aAnxwt4e=VH77uBG7rC4JA++nOyjAaPw@mail.gmail.com>
 <20180830100233.nr6fm3npy57zl4xx@bivouac.eciton.net> <CAKv+Gu9r+1OBOSUBW_KpDEEoKyc=iwW4zVEe04-_JUnJtSGupQ@mail.gmail.com>
 <CAHmQWvBDjMeBpe9Puv+oRii3JrVULW_+AYJL9WV1tXT7F7ALfg@mail.gmail.com> <20180905120248.unyh6q4msvyx4f43@kamzik.brq.redhat.com>
From: Hongbo Zhang <hongbo.zhang@linaro.org>
Date: Wed, 5 Sep 2018 22:09:46 +0800
Message-ID: <CAHmQWvAD2Zaz94AxoAScBT8jL8WZqiTMdiuzKPxrZ_3Uvk5ihg@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v2 2/2] hw/arm: Add Arm Enterprise machine type
To: Andrew Jones <drjones@redhat.com>
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>, Peter Maydell <peter.maydell@linaro.org>, 
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	Leif Lindholm <leif.lindholm@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: doRrxtSPPZCT

On 5 September 2018 at 20:02, Andrew Jones <drjones@redhat.com> wrote:
> On Wed, Sep 05, 2018 at 06:08:57PM +0800, Hongbo Zhang wrote:
>> On 30 August 2018 at 21:29, Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
>> > On 30 August 2018 at 12:02, Leif Lindholm <leif.lindholm@linaro.org> wrote:
>> >> On Thu, Aug 30, 2018 at 09:39:33AM +0100, Peter Maydell wrote:
>> >>> On 30 August 2018 at 09:31, Leif Lindholm <leif.lindholm@linaro.org> wrote:
>> >>> > On Thu, Aug 30, 2018 at 03:07:29PM +0800, Hongbo Zhang wrote:
>> >>> >> @Ard, @Leif, is there any possibility to remove all the DT nodes?
>> >>> >> On real hardware, how does UEFI find the memory size and CPU number?
>> >>> >
>> >>> > Usually by asking some form of SCP/PMU.
>> >>> > So until we have rock-solid multi-cpu-instance (making terms up here,
>> >>> > there may be a proper name already?) support upstream, we need to take
>> >>> > shortcuts.
>> >>>
>> >>> I would expect that you'd want a "faked-on-the-QEMU end" SCP
>> >>> communications endpoint to start with anyway. We have one of
>> >>> those for vexpress, for instance.
>> >>
>> >> Ah, I wasn't aware we did!
>> >>
>> >> In that case - sure, that is probably the more sensible solution.
>> >> Does it emulate SCMI?
>> >>
>> >
>> > The purpose of the SBSA/SBBR qemu machine is prototyping the
>> > interactions between rich firmware and the OS for things like RAS,
>> > secure variable storage for UEFI or capsule update.
>> >
>> > How exactly the firmware figures out how many CPUs and how much memory
>> > we are running with is out of scope for this, and so I don't think
>> > there is a need to build something from scratch here: DT will do just
>> > fine, given that both EDK2 and ARM-TF have working DT code for these
>> > things.
>>
>> Ard, we need to clarify which DT nodes should be kept in SBSA-ref QEMU.
>> I've researched and tested, there are 3 kinds of DT nodes in the
>> current 'virt' machine:
>>
>> a) CPU DT node, because it is dynamic according to input parameters,
>> and we don't want to get it by other way, so we agreed to keep it.
>
> I have a patch series on the list[*] (which I need to refresh) that
> would also add a generated cpu-map node. I think the SBSA-ref machine
> may be interested in testing more complex cpu topologies, but that won't
> be easy to do with ACPI boot guests unless the topology is hard coded.
> How will sbsa-ref know when it should use a hard coded cpu topology vs.
> a dynamic number of cpus in a flat topology?
>
If I understand you question correctly: for the cpu topology, firmware
always get CPU DT from QEMU (which is generated dynamically form
command parameter), so it is always dynamic, not hard coded in this
case.
(and then firmware may translate this DT and insert it into a whole
ACPI to load OS, it is up to the firmware developer)

And I even considered, do we really need dynamic CPU nodes for such
platform? memory size has to be dynamic, but it isn't in DT.

> [*] http://lists.nongnu.org/archive/html/qemu-devel/2018-07/msg01170.html
>
>> b) GIC, UART, Timer (and RTC?) nodes, these nodes are now used by
>> UEFI, if removed, UEFI needs a rework to not rely on them any longer.
>
> Will sbsa-ref support GICv2? If so, then timer and pmu DT nodes will
> need to have their irqflags fields modified depending on the number of
> configured CPUs.
>
No, I removed the GICv2 in next patch.

>> c) All the other devices nodes, such as GPIO, PCIE etc, currently the
>> UEFI doesn't need them, so UEFI can boot with them removed.
>>
>> How about b) and c)?
>> my idea is to keep a) only, remove b) and thus a UEFI modification
>> accordingly is to be done, c) can be removed freely.
>
> So UEFI would learn to augment static DTBs with QEMU generated
> DT nodes and/or other auxiliary info from QEMU passed to it
> through the "guest DT" (which is now looking more like a guest
> firmware configuration description)? Is it worth it? Why not
> just require the entire DTB to be provided by the user on the
> QEMU command line and completely ignore QEMU parameters like
> '-smp'?
>
UEFI loads OS by ACPI, not DT for this machine.
But UEFI has to handle DT too, becuase there is DT passing info from
ARMTF to UEFI, and this dynamic CPU DT as well.
I think every thing UEFI gets from DT should translated into ACPI,
again,it is my understaning now, it is up to firmware developers.

"entire DTB provided by the user on the QEMU command line", you mean
firmware can use it to load OS? it is not fine, some featurs such as
RAS, may still need ACPI, so ACPI is to be used to load OS on this
sbsa-ref machine.

> Thanks,
> drew
