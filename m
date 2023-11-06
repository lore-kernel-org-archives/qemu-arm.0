Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp2809292eja;
        Mon, 6 Nov 2023 06:44:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG9P5HwLqKEn0cJ2WIaKa3InzbcJlG4OmPJ7RBsHBltvVm12iUw/G9qoMgwFt/GgvNv7Sir
X-Received: by 2002:a05:6214:252d:b0:672:a9f4:2a8f with SMTP id gg13-20020a056214252d00b00672a9f42a8fmr29565619qvb.47.1699281897120;
        Mon, 06 Nov 2023 06:44:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699281897; cv=none;
        d=google.com; s=arc-20160816;
        b=BL9DJo028+OzSZC2igua547Fqzh4obfMild6p3IlXr24PrXyH48NOQISYGZQnskmft
         aglzwk2TIHlEElAsFt+YpXm06WgsNTVC887E4pRONEkSjG3WmuY8zICBgTMIWCNWUcZ6
         5bLYB46O6f/sz+eWTkXqCNbWkSJQar2EvzIsRhnLZzCydhu3ycw1VXCi8jSbJSm8XChx
         NG5XpUAcmxhaCCK84dgayIfEabnGvkHoFeV/hmBrIFZb1SecLQNwCS530fPXv7ciwGgX
         SeDyAt4SbPDHTZwdEz2eUczFezZ6nrHWlJRASuyCnOkOvW7QljmSGe8O3xXxQb6pMge2
         IUpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=GfLDD7eeNsgvbeeft6a1k752KeP3+lJ050siu+ConOY=;
        fh=9GTYc9l2hd/puEzXvqRPxg+gQJ1TFpAPYXus9Xf0XPk=;
        b=A8hcBaeOL/tsBEh64LyMBWu/hhc4mU849MOwLoFhRWvkEJeJ807/y/PbX2b0Y+6HLD
         rG7XeXBZtHs5m6TvqpaE7fa1gG2Ur8KiKiyB4eDeTLT3r1NgUXZcyyO+owx8tDQ7ZgWd
         1woh3GeIXHVwSs2cvFF5oa1q+2VOr/u236QVpmrho2C16ASdOWyXvO/XDNV2HKk5BT7T
         92FSE9jKN6H8OSSkBFd98e+B9damSgyYUztxoGOeQba/2Q/RgWhmpQfw4NTR0k+22pP/
         vXosYbWrFTCvEnusQxtT3EgQXDhCvboOpa/cnjv/WdlWkbknJFd8ODzigE/n0czcHqRk
         Ue8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xURYVgyz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ml5-20020a056214584500b00670bfc9444esi5789759qvb.302.2023.11.06.06.44.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Nov 2023 06:44:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xURYVgyz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r00l1-0000BY-Sx; Mon, 06 Nov 2023 09:39:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1r00kv-0008Ma-S7
 for qemu-arm@nongnu.org; Mon, 06 Nov 2023 09:39:12 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1r00ks-0001GQ-Jb
 for qemu-arm@nongnu.org; Mon, 06 Nov 2023 09:39:09 -0500
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5435336ab0bso7768976a12.1
 for <qemu-arm@nongnu.org>; Mon, 06 Nov 2023 06:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699281535; x=1699886335; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GfLDD7eeNsgvbeeft6a1k752KeP3+lJ050siu+ConOY=;
 b=xURYVgyzghUDMs3S8S1umGoLtDRZNx8jlSAr7Xw8ZRVyGyaE6mrhzbxzZ0zyuT+O4o
 osYrc94VxtiF4Z7IUbJalOze8qizoffz1AcLxXoWCCs+/Ov0sa9wt7sL49yQsDksp3A6
 PQ/buvyFrg4fkr8FWUF6LZYxX7d/dHBvICJK8SR26BIqG26JZEWBd0YPq7fziMGfDTQ6
 aGDtR7BDC7FHtip2IWLpLtEdhFLeHpBIfVS9Tn9aMKxN2/RZQfJg3oGFtUNR0iPfMg2L
 racKyYiKbYB541e9XSbZv2dQmzpPGfYyex4n3rX+IfMPiT97/qDMH3JKcMvCkT7eoSRs
 Rnsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699281536; x=1699886336;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GfLDD7eeNsgvbeeft6a1k752KeP3+lJ050siu+ConOY=;
 b=AyqQb7XGNrHvimUI+e3318C4SFe7BISZ/u0bbydYOCn2O18EF2mGYqsj+F+JMlBNUG
 SfYvD6O0vAFvIpCV/LStdFwOe1CDzLCmeI8SB2azEpyZOA0fLW8idW/kn37/S0zKJZ1m
 NY5yIyvBJEcN7V0BmLHWcahd+BKW+IxufRGAM3xLOWy/S5JxhACvSxcOeO5HRaOO2GZf
 KjQZFAHZhgEmaQRvun5XZyRu/mKgapJcXup2XHMbMCdlnq+MQ+jldt4u2Jv+SbTWsVCD
 KN4f0UNak2Nl/hDEIZQOh40ZvADtQMqgLbCvXk6LEGZSL75Z45FJzjwyqG6NlBNFC0J8
 CdtA==
X-Gm-Message-State: AOJu0YwlJN9cfYVeUlaC7NPeIdsGJ7S/5iMz22bUb5mDdTxhNzymaW+S
 YwKGOhk6YEvenUJNSYl/Bdi//7zMvReHWMvMDgoGRh11/tFQMq4H
X-Received: by 2002:a50:d495:0:b0:543:580e:b28c with SMTP id
 s21-20020a50d495000000b00543580eb28cmr15775731edi.35.1699281535694; Mon, 06
 Nov 2023 06:38:55 -0800 (PST)
MIME-Version: 1.0
References: <20231103152120.829962-1-peter.maydell@linaro.org>
 <20231103152120.829962-3-peter.maydell@linaro.org>
 <CAFEAcA-iSvg0r7-pRbv07p80Fy4ZEii0Md2DnuGs_=djdBe-HA@mail.gmail.com>
 <20231106150533.1b166fb5@imammedo.users.ipa.redhat.com>
In-Reply-To: <20231106150533.1b166fb5@imammedo.users.ipa.redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Nov 2023 14:38:44 +0000
Message-ID: <CAFEAcA-6Sn=bYOo4Q+TwCzpLEOWA56VN2iW8CycTG70CtpkJeg@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] hw/arm/virt: Report correct register sizes in ACPI
 DBG2/SPCR tables.
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Udo Steinberg <udo@hypervisor.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 0iLAQ/p6arv2

On Mon, 6 Nov 2023 at 14:05, Igor Mammedov <imammedo@redhat.com> wrote:
>
> On Fri, 3 Nov 2023 15:26:22 +0000
> Peter Maydell <peter.maydell@linaro.org> wrote:
>
> > On Fri, 3 Nov 2023 at 15:21, Peter Maydell <peter.maydell@linaro.org> wrote:
> > >
> > > From: Udo Steinberg <udo@hypervisor.org>
> > >
> > > Documentation for using the GAS in ACPI tables to report debug UART addresses at
> > > https://learn.microsoft.com/en-us/windows-hardware/drivers/bringup/acpi-debug-port-table
> > > states the following:
> > >
> > > - The Register Bit Width field contains the register stride and must be a
> > >   power of 2 that is at least as large as the access size.  On 32-bit
> > >   platforms this value cannot exceed 32.  On 64-bit platforms this value
> > >   cannot exceed 64.
> > > - The Access Size field is used to determine whether byte, WORD, DWORD, or
> > >   QWORD accesses are to be used.  QWORD accesses are only valid on 64-bit
> > >   architectures.
> > >
> > > Documentation for the ARM PL011 at
> > > https://developer.arm.com/documentation/ddi0183/latest/
> > > states that the registers are:
> > >
> > > - spaced 4 bytes apart (see Table 3-2), so register stride must be 32.
> > > - 16 bits in size in some cases (see individual registers), so access
> > >   size must be at least 2.
>
> it might be worth mentioning that QEMU impl. uses 32 bit registers and
> can correctly handle 32 bit access only, while 16 (or any other) bit access
> to 32 bit registers won't actually work.
>
> ex:
> pl011_write()
>    ...
>    switch (offset >> 2)
>
> essentially only 1st byte will be accessed correctly,
> the rest will be misplaced as read/write handlers do not account
> for split access possibility.

No, 16 bit accesses should work OK -- we set our .impl.min_access_size
and .impl.max_access_size to 4, so the memory subsystem should
implement 8 and 16 bit accesses for us by converting them to
32 bit accesses.

thanks
-- PMM
