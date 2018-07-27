Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp357177wru;
        Thu, 26 Jul 2018 23:31:17 -0700 (PDT)
X-Received: by 2002:a24:ad11:: with SMTP id c17-v6mr4403681itf.46.1532673077099;
        Thu, 26 Jul 2018 23:31:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532673077; cv=none;
        d=google.com; s=arc-20160816;
        b=aMeQYB8JtTl51ICm/xl/4UIQX1r+QJ2oi055SBo5qGePCt7+w5BD5il1ifWyZm+bmC
         kaGxGSbuIUjJrsIndNpkeIs4Zd9oNo6few3GAM1/2+HwBFxxJZxiXh4zsdFmeqZRltPB
         9biCIROAn5IKye7him+AIVSuvgLnuy1dbCHaDycr7VMivyHo02XUuBAtKY+ds+re9gtS
         eJx1iPYgRVuF44DO9+QXyjz6nu43H+z7w5FjOtcoIoROlG8b9vVWUJOBvHbKN7QDcXrB
         d85zgLy9aJRLZoJWRvrrQ4HpYPDiYYXFG1B5jo6kPhyvOYq+GZTRMdtmRUhcHgvIYbjI
         R8IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature:arc-authentication-results;
        bh=vWmBmFeEHzKosbxZWRkNq0MZSS5wAc/a40qXNofUHSU=;
        b=A/KEdJjxz6k8T3kvd3g518DJdK2zO6TsDzgUe1nBHwIKXdKfaHxNTS9mb0y6Jl4F8K
         m9PvL29G4uN/zRPo5z2ymFDSu6grtmWhnyRY/YH/RdvrgB4Y8txfgYN9tG+lXLIT4TP0
         y3M211A13bbSjlfkLCa27qR/FxPBXo6P5VeaWWtWvOY4MzwGv8MN5vdKBt7BIwOiIKY9
         0wV5i4jy0CP/bU4XwvC1dqNJArA0vtM6uMS8weOGE5IA8282Qh/qbOfrOlMC+3hfreWv
         /szzjz7xvHTEzdQjV7p2OKHGrK0kaalxMbeL9Pdivo3HAJ/nb3sT4XxcMVmvtFYvIZKg
         wGkg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=d85DdQFG;
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <hongbo.zhang@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 3-v6sor942762iow.171.2018.07.26.23.31.16
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 26 Jul 2018 23:31:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=d85DdQFG;
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=vWmBmFeEHzKosbxZWRkNq0MZSS5wAc/a40qXNofUHSU=;
        b=d85DdQFG8TtoGqT4F5+UcTeyiAEeGQNfqr1hjw5+m3mTOcspM8bG1UJdGSHrX99lbk
         0Q9h2lcpV2yanf7u6InFASOnmSf70ia4OFdfFti/DMyybQXeFC5B/jiPuWwlYeNQc7oA
         dB32moJZYwJjb3kD/ktyVL4rYayL6Mtrx6lpA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=vWmBmFeEHzKosbxZWRkNq0MZSS5wAc/a40qXNofUHSU=;
        b=YApWg2J01e8xrJ/VyBtwBwksdDfd9smmcizJsdeR6Zfk0r2uIjtGJMrO7CXvDmL4lW
         mhyIF7nNFCJxp8W7l8apsKIuuMLzRQ7ynSAA/IKKFC3DztHCgRL/K5UuLktahl8guOUY
         obUrTbbiUsoRYwGzMHTPtXlSmaNAYrrdR9kePFC7X+NiG9KCgw6lckNnG6FL3HOod54H
         lONL7hptxZ1upewLuvuOLE0nmGOfJCR62bGkOT97+obrp3gRoUvuk36phQNbUiKX+Bod
         PEgBqUaPU/L0BRBqh3QhqtODCZCTVyGR1IycFIW7nHmbie6EwVHB9l958kGKRL6omcaT
         lk+Q==
X-Gm-Message-State: AOUpUlFgvOjf1OKPluwoSxMSP9G4/fkOEBVcK1lOHdm55sl9L7zUaBoc
	oH6/LRRzDNdc0wQr9hg6m1WUooSc+VcHMQhLIklkd5dC
X-Google-Smtp-Source: AAOMgpefl7JuaX2YV4yfBKATmX6W6+TQiODdz663bXiSwfEdWTX5FNISnIxhRTuuBwo13+xgQ53MAADt06mqX+gozgk=
X-Received: by 2002:a6b:6104:: with SMTP id v4-v6mr3806209iob.94.1532673076721;
 Thu, 26 Jul 2018 23:31:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac0:a161:0:0:0:0:0 with HTTP; Thu, 26 Jul 2018 23:31:15
 -0700 (PDT)
In-Reply-To: <CAFEAcA-Zv5xV2VwMCfGXUv8oT+gC_dgn8Q3M1v3FBjry7TbXVA@mail.gmail.com>
References: <20180725095426.f7kv4ftngeje6pkx@kamzik.brq.redhat.com>
 <CAHmQWvCKkzim+-Z4Y69fWg6igZ7V6gaWhjKJZ0m0G0dhbwOFyw@mail.gmail.com>
 <20180725112621.imdzdkntpmh3n5og@kamzik.brq.redhat.com> <CAHmQWvCfHFSU7RGKG5t6=m7ZSWZjf3TeqOo3cX2KT-GSiN3mPw@mail.gmail.com>
 <20180726102855.x6ffdoqjpejpyae7@kamzik.brq.redhat.com> <CAKv+Gu-ffZRNmACH6YieNsg=AHxJxYoXHsBGf6C=nOvFfTu7Sg@mail.gmail.com>
 <20180726111109.w24jk6ehklimige7@kamzik.brq.redhat.com> <CAKv+Gu80KfwZft4t1HtOXPuijuPLV80K9iW+BsTgs7WcnosMXA@mail.gmail.com>
 <20180726114158.am7kgc3jekxg55i5@kamzik.brq.redhat.com> <CAFEAcA8YH4p__zT1o0s3vNZOsyWZn3XPLgkNeT+jSJpmjvFTUw@mail.gmail.com>
 <20180726123509.qyadwbz4skwashcj@kamzik.brq.redhat.com> <CAFEAcA-Zv5xV2VwMCfGXUv8oT+gC_dgn8Q3M1v3FBjry7TbXVA@mail.gmail.com>
From: Hongbo Zhang <hongbo.zhang@linaro.org>
Date: Fri, 27 Jul 2018 14:31:15 +0800
Message-ID: <CAHmQWvC2J_-GsMhSiEHcsN=fkp8fCe0PKtUT5Ed_UxMyNr530Q@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v2 2/2] hw/arm: Add Arm Enterprise machine type
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Andrew Jones <drjones@redhat.com>, Radoslaw Biernacki <radoslaw.biernacki@linaro.org>, 
	Ard Biesheuvel <ard.biesheuvel@linaro.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	Leif Lindholm <leif.lindholm@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: QE/E/88C41nn

On 26 July 2018 at 20:43, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 26 July 2018 at 13:35, Andrew Jones <drjones@redhat.com> wrote:
>> On Thu, Jul 26, 2018 at 01:10:34PM +0100, Peter Maydell wrote:
>>> On 26 July 2018 at 12:41, Andrew Jones <drjones@redhat.com> wrote:
>>> > The patch guards the generation. It'll only modify DT and ACPI for the
>>> > new machine type. But, while modifying the DT makes sense, as that
>>> > generated DT will get consumed
>>>
>>> ...will it? Why would we want the firmware to read the
>>> QEMU-generated DT? Real hardware doesn't work that way.
>>>
>>
>> Good point. If the plan for this reference software is to always
>> prepare its own DTB and ACPI tables, then this patch shouldn't
>> touch the DT generation either. Of course a lot of the device
>> and fdt node creation is intertwined in mach-virt, so it's going
>> to create a DTB anyway.
>
> I haven't yet looked at this patch so I might change my mind
> once I've had time to look at the code, but my initial
> thought is to prefer it to be in its own file rather than
> trying to share code with the virt board. There's a lot
> of stuff 'virt' needs that this doesn't (DT generation,
> ACPI generation, switches to disable virtualization or
> trustzone support, options to select GICv2, etc etc).
>
> Q: is this new board model intended to be able to work
> under KVM, or is that out of scope? (You wouldn't be able
> to run guest EL3 firmware under KVM, certainly.)
>
KVM is out of scope.

> thanks
> -- PMM
