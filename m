Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp1641253lff;
        Fri, 18 Jun 2021 08:02:11 -0700 (PDT)
X-Received: by 2002:a5d:4044:: with SMTP id w4mr12899432wrp.201.1624028531882;
        Fri, 18 Jun 2021 08:02:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624028531; cv=none;
        d=google.com; s=arc-20160816;
        b=AjlOCFfqPD6qbfoDh4/tVtr8EJHWOxYMa6eywjLPhYzD8RXf8okhcRDrZqCozd5jZU
         M0nTtNQO6hC2asdouQBr49y5BAMqOlLclxcbiH5pQnG7YYasEjNa6riTuEUEZCYhtbUw
         /IVj+utAjUIP6xmKPzSkklwhuHVRj9e7hilNyrA9wbwresd5Zf8rNjRAOx+oMRt4cV73
         Oulb7PkZu4tGKaCt54zpl1Em2+A7jlgr5o7lIHGhNUUFdZP/LRcimFO4iScUt6F5bi3v
         29/iinYyb9dJXwWAdgNj3Nx+HCrea7AgWeV8yglijCuXsp94ammgDEmWCnjV6AGMIMsc
         tFkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bxMjk+2+cPzGxh72Db4vUGtuWMXV+M2dXsGgEwXfBAM=;
        b=NVjnHX5lEevvJ1G/VswjPI3lBzna1Pp5JOPS5GCEDHTJSOrQPsA+VhkP6eg++TGDb2
         aF0v9MZIWYEAJjgDKwgyA1Sa1gmOH1QvmODJgEKxkYDDfyDdtrZXsT3x4zGdSn3zEZ1G
         voafeyNPItM9Gin5JI1qh1Hjm3AF1P1ED6BeSLz+GnEBYPh7g7Y2i8v5f0wMj7W9fLWf
         WuyjQu6NjObfcUSvyIgKYKqQ16gYPB+w0ioYLzW755VQ9SHS+aIWgZHyb62DMOZyD9Wg
         La9X2mwZpikuemlCxEvX5BoP6zGKesXjlqEiQQOjm9tLUD6dpgBLjVX1vPhbZ4Mlu0JT
         HRwA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rrYsh2Xh;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id n2sor6935973wme.6.2021.06.18.08.02.11
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 18 Jun 2021 08:02:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rrYsh2Xh;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bxMjk+2+cPzGxh72Db4vUGtuWMXV+M2dXsGgEwXfBAM=;
        b=rrYsh2XhGDdwMY2TXuPSIA/a05AQAmeWDDYoU5rQhf45reRw4+ukMboFn837xkvyHQ
         uS8zgFbfHvCifHOnlxHpHz9gU9SO2fbe5rVHhzLjkOTIaQJweXzQeUCdKEN278JHil7L
         haO7UoOmROzO46vD0sQ3QepgXxUWYjmwJuz4NbLHsOyy0lKzzCFNpd3CYbQR5/cA3KD1
         3Sv1wO/fE+Ig/jCnVJk11pXYHSBAaqrY3GdAgwHs2SWa1V5LT2teL/eJDEVMISqU7iUb
         kEi2yXyt6FOHcAB4kINke4Q9DPl24FYmmj2A9uI6g0hi4S82DL0xmLzo3T65belP14jw
         qX8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bxMjk+2+cPzGxh72Db4vUGtuWMXV+M2dXsGgEwXfBAM=;
        b=cFKG/Zb61OKaxxDdUYPXBb9yab9NM5rsR/2vd85guBOvU0Ay4fkYNOAsVbvDH84Ftt
         UPEB9AnMdJG27IEC/CeF3RmgC4rZ/vJ+1KrlDcjxn3Oj04usQE/e3SuAJy1PwueBCMcq
         YLYTrVc/jy+K4vpSvsvMJKDZs/sGVv8GhMAuXyqeTNlrgkJjZTyyAJJn4oIEJUxZ9iOV
         XcOCs3MqDXmU7tB0XhOcEdKJ0JsH1nN3Ou8lHHt/FzfbtHAxgzw1NjXfIkaYfsFw5D3d
         lPsWDR5e1/NKm7eEEJBV0Zu/WUHm25HKvBoOYGFlehvORLiNGHzQujdctnnH9yAcnJPd
         zwSw==
X-Gm-Message-State: AOAM533PvaZge5ei140yGxPs7ohXIxh0ZoTKiN6FgWX8OiRVUVx/umSe
	zhYOoKCmNBOj5QTpvbqcPwiiGgNyiI2IdslLRxJ8IjtgwCIHgydM
X-Google-Smtp-Source: ABdhPJxB3dX9S//I2PkxMJPIOPzHDkLvRZEUPzeEkYfrkBb+y81RzxRvBsiR4BLYooK4U79SlHQqmxe0FX1/Vm4I9Lc=
X-Received: by 2002:a05:6402:220d:: with SMTP id cq13mr5510073edb.52.1624028531492;
 Fri, 18 Jun 2021 08:02:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210615165800.23265-1-alex.bennee@linaro.org>
 <20210615165800.23265-2-alex.bennee@linaro.org> <CAFEAcA8t8q8pJNOOYK-zkDtME7hOWfXVUj3+HLVMRkFzY6Ei1g@mail.gmail.com>
 <CAFEAcA-OtgCRHPayXBsVZ64mqP7-aJj8+TV4rrLTE6Jh8JcgXA@mail.gmail.com>
In-Reply-To: <CAFEAcA-OtgCRHPayXBsVZ64mqP7-aJj8+TV4rrLTE6Jh8JcgXA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Jun 2021 16:01:35 +0100
Message-ID: <CAFEAcA_AShKbP4dD2S+15way4JVB_+oiV+nCOHPqLNu0mot3Ew@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] semihosting/arm-compat: replace heuristic for
 softmmu SYS_HEAPINFO
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Andrew Strauss <astrauss11@gmail.com>, 
	qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: +crJBgApl0el

On Fri, 18 Jun 2021 at 11:09, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Thu, 17 Jun 2021 at 20:22, Peter Maydell <peter.maydell@linaro.org> wrote:
> > This will pick the first MR it finds that happens to be RAM (which
> > could be some tiny thing). You don't want that, you want specifically
> > whatever the board decided was the system RAM, which is the MemoryRegion
> > MachineState::ram.
>
> As a concrete example, on the mps3-an547 machine this code finds
> the 512KB ITCM at 0x0 rather than the much more useful 2GB DRAM
> at 0x6000_0000...

Turns out that "look for MachineState::ram" won't find you the
2GB DRAM, though, because it's lurking behind a Memory Protection
Controller so it doesn't appear directly in the flatview.
Not sure what to do about that -- maybe we should forget about
MachineState::ram and just go for "largest RAM we can see" ?
Trying to get this code to be able to 'look through' IOMMUs sounds
like it would be massively painful.

-- PMM
