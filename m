Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp1601783wrt;
        Sat, 29 Sep 2018 01:07:36 -0700 (PDT)
X-Received: by 2002:a81:9216:: with SMTP id j22-v6mr1068907ywg.259.1538208456068;
        Sat, 29 Sep 2018 01:07:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538208456; cv=none;
        d=google.com; s=arc-20160816;
        b=MxWwA9hwFn51qg1CNfiv8GqrAPnJkdLPFIe9F/9dQ2RAmmTVHdgfT0wAatMNUbxz43
         /N1hCkGVDvLZ0p+IZXV+6ZAkq7b9TX/ox+WIBNRIhJJN9KeoWydsJwYE56ofRsDWF7Ib
         Nj0h4s7z0KO7J86jKIMdMHGYbHRoAqYztEI27K1qJymQiKZ/iJvFsQYtEgLwzsKFVJp/
         hdUZb8Vr4hKECiuMst4Rmx6/h2DOzEZ9QvpvIR4k7sxyDNvZISq0Ae7sDRU6i76WD9G1
         RMBw+cq+2KGptWjjdlqX75+DXoBZh6DY664iYG01i8KJnUOexyb6UPk1XVkTmE5xLQUj
         gWHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=DwduC8KRd7JaDtM+eTf44fUFTnvtuXFLVePsQWkIHUk=;
        b=j6HkiRN3fZ6/G7GkBCItAC86utXHlIsN95K3gZ0eK0u9/qrKUtSalh+m5wxPSX0emM
         yAy4lrhG0I46UbVOEaLpLrsJEoupzkP2gMTWNT3s8tdYYGLWjt9cvBsDQ7QLw9REveCV
         Thi8iXBYA0djvjndn+dKTbb4D5Y4gmC8IM5BmLWsuQxurqsQf9NYdBEPwophtZ3s8QJy
         7X1HNAb8/41PpX9Un2NG1ogRqr3MT02FAzvEcbMZx60Q3LIcJaWQLPiV8h7DJVSVBCck
         ibyiHt1BEyzSaZ6Pr+XpJjY65qozbA4RtB6iANoVGcijG/OvRNCLjQLoKTblSBpC+xfG
         NtIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DzyImlpb;
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <hongbo.zhang@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id g67-v6sor489002ywd.209.2018.09.29.01.07.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 29 Sep 2018 01:07:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DzyImlpb;
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=DwduC8KRd7JaDtM+eTf44fUFTnvtuXFLVePsQWkIHUk=;
        b=DzyImlpbBhff+7WSe+D3rN5LDHcB6fo/Cf6WWydJ3qoIr02+Ny3AUt190Ok9SuaT44
         npavgStmOdpqAiyB1lYe9wETyPLHaBNq597fog/9socSCU8cPBi8wBzE4GipIXBMhKRT
         xgQcMctetYEgjyWt5hXWlaQ/24xbfCap9o850=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=DwduC8KRd7JaDtM+eTf44fUFTnvtuXFLVePsQWkIHUk=;
        b=TKN+E+uqB2ksLHerIlcvYwpMIV9IkSVnuyfIVLRV2iEJ2DaQOfG2+0wfQ7TPgocbfx
         hTe41QFOki2JRMHA1qLJL2TfUFuPk/c9amKXUMhNFf4aJyHj1f1Moy7Qf3oVzTGBY1Sd
         l2/g8/mjZC5DF5HaxX3UI69Qx6A8igAuWOUDMrv5KNdSea2qS/KgtPJaByer9K+op21K
         PLPixkDSn2gHM22ee2Qyn/MB1xtiWZ+0gDT+1IvMtTrZhS+K6lZaBoMrTeS2mdcbnV4h
         jzP01Ylwk3Wc2YLbbq40VzQmZKK5GfGo14vvvvduPubOjRqFf9sOR3d/M70fVg0Pvg9n
         9O6Q==
X-Gm-Message-State: ABuFfoj2fFThmOtzrgjBX/rCB1rpCgakZ2ANML0hgTpWTzaQGcEILr5f
	Y5YtQeV/yl07UV1eTm33wl//Ddo5PMPre50FWfHgF5p+
X-Google-Smtp-Source: ACcGV61Xr5TYcri3W+y2v/naCzqxRLzwC5UU9eLWKJ1/pyecn0P0Cxt1uqtAn02uG21g43lQsQXuqDm+/NDwJMTs47g=
X-Received: by 2002:a81:9b83:: with SMTP id s125-v6mr1069221ywg.47.1538208455672;
 Sat, 29 Sep 2018 01:07:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:58c2:0:0:0:0:0 with HTTP; Sat, 29 Sep 2018 01:07:34
 -0700 (PDT)
In-Reply-To: <CAFEAcA9Cueh8+pJq20OhOTTXf+g=C0GCk3rG1F+43kDguYXoDw@mail.gmail.com>
References: <1536488638-29326-1-git-send-email-hongbo.zhang@linaro.org>
 <CAHmQWvAL5BdgjuZ7wM02DqKhLFYasXy_OGiFQU50O_Q4zgXsNw@mail.gmail.com> <CAFEAcA9Cueh8+pJq20OhOTTXf+g=C0GCk3rG1F+43kDguYXoDw@mail.gmail.com>
From: Hongbo Zhang <hongbo.zhang@linaro.org>
Date: Sat, 29 Sep 2018 16:07:34 +0800
Message-ID: <CAHmQWvAxOxcUwzSmR1U=P3v_CpJ2CR81t-X2X4QFBgOkKr1duA@mail.gmail.com>
Subject: Re: [PATCH v3] hw/arm: Add arm SBSA reference machine
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Ard Biesheuvel <ard.biesheuvel@linaro.org>, Leif Lindholm <leif.lindholm@linaro.org>, 
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: JN2dHe9Xb+jX

On 27 September 2018 at 18:30, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 27 September 2018 at 11:23, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
>> I would mention that there are some issues in the base qemu tree to
>> boot this (and also 'virt') machine.
>>
>> The MPIDR isn't emulated well, currently only 4 cores on one cluster
>> can be booted, if we have more cores / more clusters / different
>> number of cores on one clusters, SMP cannot boot correctly because
>> PSCI checks MPIDR for booting secondary cores.
>
> 8-core SMP boot works fine for me on 'virt'...
>
Also depends on GIC version, and firmware usage, e.g. QEMU built-in
PSCI or external ARMTF PSCI, let me check and summarize.

>> And I have to revert "device_tree: Increase FDT_MAX_SIZE to 1 MiB" and
>> revert "target/arm: Implement new do_transaction_failed hook" to boot
>> the system, these commits not only block this new sbsa machine , but
>> also the 'virt' machine, maybe the patches need to be checked or maybe
>> firmware needed some adapt to these commits, currently I just revert
>> them to boot.
>
> Problems with do_transaction_failed mean the guest tried
> to access some physical address where there is no device. This
> is always a guest bug or misconfiguration. The commit you cite
> there is the one that means we stop ignoring this and instead
> generate guest bus errors, as real hardware usually does.
>
> Not sure about the device_tree one, but again, 'virt' machine
> works OK for me.
>
You didn't boot with ARMTF and UEFI I think, when both firmwares used,
you likely get blocked at UEFI with message:
(so I guess it is due to UEFI to do some adaption)

ASSERT_EFI_ERROR (Status = Not Found)
ASSERT [ResetSystemRuntimeDxe]
/home/hongbo/work/edk2/Build/ArmVirtQemuKernel-AARCH64/DEBUG_GCC5/AARCH64/MdeModulePkg/Universal/ResetSystemRuntimeDxe/ResetSystemRuntimeDxe/DEBUG/AutoGen.c(362):
!EFI_ERROR (Status)

>> I will add a cover letter for the next iteration included explanation
>> of these issues.
>
> Thanks. Where they affect the 'virt' board, instructions to reproduce
> there would be useful.
>
Yes, sure, will explain issues in detail. (when back from my National
Day vocation)

> -- PMM
