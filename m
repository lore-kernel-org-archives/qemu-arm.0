Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp500425wru;
        Wed, 25 Jul 2018 02:47:40 -0700 (PDT)
X-Received: by 2002:a6b:b307:: with SMTP id c7-v6mr16109523iof.25.1532512060883;
        Wed, 25 Jul 2018 02:47:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532512060; cv=none;
        d=google.com; s=arc-20160816;
        b=hPexPXHyuHS49mtz8dquo1raXCf7cPVOy+7HqJ7KgWCxux0NVibhE4t/WvgEolk/EP
         rKbBKmp5DBpGL0hCUkapS0lTq2c4z6ebcpNguZHwSRyeFJlp+I0cCnpv7fX5+15yYPtO
         L3LQnvwoQ6z3mk0UNAzYoX/lkVgpmorPKpaRxIHSa4XUis5O9PeP22VDi0TIBBe+l+h4
         Covv5sI62eKdBid7CobE8ZIlrHCuELsTU+2IFt6xTwIlRaq+EEmm2MNingBVJCEvHV7m
         NitKEEA1vQCGk/dEzLZKH1G4AARjSmD4o9vlUgn3ZUovDhBDGSwH4+a36wovCmkx4/Ff
         ZBng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=z+4plEO3166ctZS6h+XhAY1Qkdw/CqGehpUC0lIb68c=;
        b=kZYDpbXBbz/oSJYIP01XByPu4QOLRCs2zf/WIeUPlfLe7vRq4+50rrMcyuu/6AUSmn
         ub7U+VBdnsxU32CZLLCfwDttxgz90gKsOPvG0BrElm9FPf8Db6fnH9jTu4VeO3DYtSry
         BOzt1A83a8t2bdoUfX29GQMRLa/9fmF6XDO+dwTyHSDlRywBwOdIIjtt8XtZRZWssMcF
         pgiZPnAQKfyHNXA0vYsfGPV25D89vjiIyJHVJYlMa+P8GF7KE6Obok/Ev0g9KHwE2/fZ
         DZdFoz+3UhDJ6VDSZyoeL3Xu8tF1+CvMwlU7YKHXSIBnUC3pNF+hAk6oqwyCBFcfWMrd
         KyzA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="d/CuSCz5";
       spf=pass (google.com: domain of ard.biesheuvel@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=ard.biesheuvel@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <ard.biesheuvel@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id y1-v6sor4395893ioy.7.2018.07.25.02.47.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 25 Jul 2018 02:47:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of ard.biesheuvel@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="d/CuSCz5";
       spf=pass (google.com: domain of ard.biesheuvel@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=ard.biesheuvel@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=z+4plEO3166ctZS6h+XhAY1Qkdw/CqGehpUC0lIb68c=;
        b=d/CuSCz517ZocGTq1M8znY6EmeuZHVLnM3GRZIk/r1Hb1trbLOFSWYFzUZ39F+tiTc
         NM2pRjNkPvcHnA5CXo1LM4HC8T4fXRwHglRpZMR3igZsd6S6t2qf/NurNKndQgYaLHmc
         fmhVeOX6unJiHmSck+NSJmHaWoqLc/1KVuXpc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=z+4plEO3166ctZS6h+XhAY1Qkdw/CqGehpUC0lIb68c=;
        b=ZKAUOr385fDRjsx1v3ssITBsKEIhk4LYMf1gBYugq39Xxg5dJK0jR0I7hXDEjl1Uhr
         WeLXSI+Z1LIzAnYaNokwzSZI374eIMt/+9+sqX9somF3SoXO+K1U3FdFZ61bKrb6+BRB
         aftbjpfMKje+1g+9ukrQ/QB0Zd28vLIIQBzimw2rgOnZwzoQTaOoM/qiVgJPl7zJXYKa
         +yL6ev/QfVyDDA2fKgVz3NT3coATqZ8L6tSXk7KBaJtx4+CTk81g5vjQ4h27joMEuq1i
         +WwaSO7rPacJFtB+xEVYoNWH16JcJ1RWQwBG96+QrI32SdMd0bMltXfyGo4JYGJkRhNO
         e/QA==
X-Gm-Message-State: AOUpUlEXjYE/wxeGWA81h7FTxiQJZ27iBxqlsH/9FkGkk32QHfmuPYae
	+5Xq65tX/8CKTrq/pP5WJ+tDBqWm8mVXyWEtKcOmSpb3
X-Google-Smtp-Source: AAOMgpfDP65uW0AIII3xYmd6o4EQFVgcNcxmG0Z/nYNLCeib1B43tF92QXLFEGzWo76TREzjSDZXuepmQCgbMXV1IZc=
X-Received: by 2002:a6b:5208:: with SMTP id g8-v6mr16973258iob.60.1532512060499;
 Wed, 25 Jul 2018 02:47:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a6b:ac05:0:0:0:0:0 with HTTP; Wed, 25 Jul 2018 02:47:39
 -0700 (PDT)
In-Reply-To: <20180725094037.uzz4ycen4qja4q4a@kamzik.brq.redhat.com>
References: <1532496652-26364-1-git-send-email-hongbo.zhang@linaro.org>
 <1532496652-26364-2-git-send-email-hongbo.zhang@linaro.org>
 <20180725084824.GA12855@redhat.com> <CAKv+Gu_RHsed0KAH8njKB8UPvbUDeoTZ5sP76f_br6azisZzSQ@mail.gmail.com>
 <CAHmQWvCqKqQXnXxOUgi=kLTyE5BhV2NxqaKzvPp63HX02V=X2g@mail.gmail.com>
 <CAKv+Gu_eFjS_UvOuEKhbsWr34o3Jqd4h2duJ-gG1ofsFbwkGbQ@mail.gmail.com>
 <CAHmQWvC8_J4i32UZzdHqJ4w3EdEAHmWGdgqrvGwEA7uo0kvk9A@mail.gmail.com>
 <CAKv+Gu-B4o7dwZPOix2MkECJia6M6Q+zBMw8XVdw49kFYW6J+w@mail.gmail.com> <20180725094037.uzz4ycen4qja4q4a@kamzik.brq.redhat.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Wed, 25 Jul 2018 11:47:39 +0200
Message-ID: <CAKv+Gu9VnKkXC8r9BpMPjXfjhsPVRaAmRaOYM8=hPyDCgXMQWQ@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v2 2/2] hw/arm: Add Arm Enterprise machine type
To: Andrew Jones <drjones@redhat.com>
Cc: Hongbo Zhang <hongbo.zhang@linaro.org>, Peter Maydell <peter.maydell@linaro.org>, 
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	Leif Lindholm <leif.lindholm@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: fQCcCGtX7gHl

On 25 July 2018 at 11:40, Andrew Jones <drjones@redhat.com> wrote:
> On Wed, Jul 25, 2018 at 11:20:03AM +0200, Ard Biesheuvel wrote:
>> On 25 July 2018 at 11:17, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
>> > On 25 July 2018 at 17:13, Ard Biesheuvel <ard.biesheuvel@linaro.org> w=
rote:
>> >> On 25 July 2018 at 11:09, Hongbo Zhang <hongbo.zhang@linaro.org> wrot=
e:
>> >>> On 25 July 2018 at 17:01, Ard Biesheuvel <ard.biesheuvel@linaro.org>=
 wrote:
>> >>>> On 25 July 2018 at 10:48, Daniel P. Berrang=C3=A9 <berrange@redhat.=
com> wrote:
>> >>>>> On Wed, Jul 25, 2018 at 01:30:52PM +0800, Hongbo Zhang wrote:
>> >>>>>> For the Aarch64, there is one machine 'virt', it is primarily mea=
nt to
>> >>>>>> run on KVM and execute virtualization workloads, but we need an
>> >>>>>> environment as faithful as possible to physical hardware, for sup=
porting
>> >>>>>> firmware and OS development for pysical Aarch64 machines.
>> >>>>>>
>> >>>>>> This patch introduces new machine type 'Enterprise' with main fea=
tures:
>> >>>>>
>> >>>>> The 'enterprise' name is really awful - this is essentially a mark=
eting
>> >>>>> term completely devoid of any useful meaning.
>> >>>>>
>> >>>>> You had previously called this "sbsa" which IIUC was related to a =
real
>> >>>>> world hardware specification that it was based on. IOW, I think th=
is old
>> >>>>> name was preferrable to calling it "enterprise".
>> >>>>>
>> >>>>
>> >>>> I couldn't agree more. However, IIUC this change was made at the
>> >>>> request of one of the reviewers, although I wasn't part of the
>> >>>> discussion at that point, so I'm not sure who it was.
>> >>>>
>> >>>> Hongbo, could you please share a link to that discussion?
>> >>>>
>> >>>> Thanks,
>> >>>> Ard.
>> >>>>
>> >>>
>> >>> V1 discussion here:
>> >>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg545775.html
>> >>>
>> >>
>> >> So who asked for the sbsa -> enterprise change?
>> >
>> > Actually nobody, but it was argued that sbsa does not require ehci and
>> > ahci etc, then we should find a name fitting for this platform better.
>>
>> That doesn't make sense to me. The SBSA describes a minimal
>> configuration, it does not limit what peripherals may be attached to
>> the core system.
>>
>
> Hi Ard,
>
> I think that a machine model named 'sbsa' should provide all SBSA require=
d
> hardware, and nothing else, while providing a means to easily extend the
> machine beyond that in any way the user likes. The user can easily add
> devices with the command line and/or by using -readconfig to build a
> "typical" machine. Note, it should even be possible to add, e.g. an ACHI
> controller, to the memory map using the platform bus, if that's preferred
> over PCIe.
>

The purpose of the SBSA machine is not to provide a minimal
configuration. It is intended to exercise all the moving parts one
might find in a server firmware/OS stack, including pieces that are
not usually found on x86 machines, such as DRAM starting above 4 GB
and SATA/USB controllers that are not PCIe based.

If we start layering the usual components on top, it is highly likely
that checking the EHCI box gives you a PCI based USB2 controller,
partially defeating the purpose of the exercise.

--=20
Ard.
