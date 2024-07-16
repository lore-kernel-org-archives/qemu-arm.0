Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp199483njk;
        Tue, 16 Jul 2024 07:09:20 -0700 (PDT)
X-Received: by 2002:a05:6402:4581:b0:58b:7b90:94e2 with SMTP id 4fb4d7f45d1cf-59ef07c51a9mr1575870a12.38.1721138960199;
        Tue, 16 Jul 2024 07:09:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721138960; cv=none;
        d=google.com; s=arc-20160816;
        b=thatV6EPpZjaw3I4/36wJFEmIXbKVZivLIh/9Wu7KWU9Lcuc2iHxICnwv7h6pwxaTn
         2xmXHSwl9oyS4OVgsczs2DaTDuA94kNMJ/7Gz4IMrra6jRt3XIaRCtb8fFj0HpjFy2a5
         DhNu+Vq9fiHxQvO6rqapx9cg+VWXZEov6TFVC63DwwuETWg6QOUYqwzqh36zKzVfJLe1
         2y/QSlEmtPn4bQxruq5Fd1WQR9mNCN+oqMXooKvr8ePyNDO/Kw1YzeXrH+jcY+4Ish03
         XuEP1oL/PDquE62pgFl7Cf0ZJhrEr02RSck9Ao7+KiMzm2r2d/6JlvvY5JRWqQbDja9D
         f1uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wnbnYZhKW3lBgSIL7cBcffW8bmVQWHFI2NF0kpCOhy4=;
        fh=ct6Cr+hFqGO/YAyXOEvbzSXep+PIS3/1MIwUWjSCa5g=;
        b=nVUgzai9kHpxvMs2WSNsXGY//fnBDwHlDn7gfgy70zXhJvFGlDJvOBfe/BQL9cYZR3
         plrbRWRGEenGxK4BFTVd85F/cFh9IYtwDI3pF4lothHQTrthgO5k96Zb3XJmhxPWR3Em
         PhpQ9b0mvIZYKt8X8na0H0DOSYMLrRdXBpFz4JHB02sZhurUrq+EeQMtxyLlH6rLMebf
         Rcfy5pAc+UN6Idp4/46ZtkkOU/rMvnqWxMoK1dyXehP0arFml+QASXE17L2N/JXpcrhK
         QWlXBO6YaRLl0Tn7WeSBcO7KBhlm0h1xzBlO50nUMcfzRvXGPu4nl11IytG1C4uG6AWj
         1oCA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Qg2w+J5T;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 4fb4d7f45d1cf-59b2504bb81sor1878787a12.4.2024.07.16.07.09.19
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 16 Jul 2024 07:09:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Qg2w+J5T;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721138959; x=1721743759; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wnbnYZhKW3lBgSIL7cBcffW8bmVQWHFI2NF0kpCOhy4=;
        b=Qg2w+J5T9VnrTrJy6eSipDErR5EDWYmXuAhK34PIegiqCx0OWpqM+izFiymw+qgd5D
         suf061EhOjml9dOa56YV7qD7+RcNNYw4DkjrnN9N9HwomQEYDUYHLnzhyoPDfFZqpdk9
         rAdXTkHqzvad+qeAXjd7gtSiCJr+e6Gbv8mMvnwQZe0oGctGesGG+XxR2wzdPnFJ+qIY
         9Hi6GrZrvq0iH5U+hXSc9NmZbULcLaOGJTB9srmebCqFrr+ArZh9Xu7oEngzqtTfrIHw
         bhO6sE3vxZ/HB5MNM+9ACofgoqENB6YDIz2qukz10n62etXoPc2DV6kGPOcg4Q4FtI0Y
         9MMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721138959; x=1721743759;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wnbnYZhKW3lBgSIL7cBcffW8bmVQWHFI2NF0kpCOhy4=;
        b=fiHgqyKWKZnIx9Ap6dxXwsUgICih6ND2tFnyw8pQ5qfu+8qkynLcBSnpAiyMWLN8sX
         Ld+SS6m/SV9mg7dKs5wucnxYARj21yaHpCU2prRu65UrPacJA0inT9MpJXq/XOh9CKBF
         G5XAZbRUxBNkenqPeG32UTjVsaX8WhPwQkeT24Cv9cqhaMog8ANiTBHSSxx6bDNHLFhD
         gSaw6p9/8LuFAsWVkPQr49uXWx8dYOgkVMcmw2+0fnmoXY/w/ll0gb8PjzEuxRYE7BK8
         QLMYpG9KBS4VM84Clm7RIlfvzyihtcxDQysSe/BkNpdru6Ys3t8Q9YVXfVZj2yOu4CdB
         BZzQ==
X-Gm-Message-State: AOJu0Yyy08yPLJvL2wKlmV6ZyOBflQMfkVas/wrx102sDuYBng4Jhcrc
	X4Xh/plAamf9a0816ftMFJJBa0L7WT4lJhcCPdla46AD+ovLJs3m2UYc4pHZT8zNWoGmjxT+oJ4
	aSin5WEpsYZcXhJKJyQ8245VjpqKpTWuE5H9+Hy+MR1sTpAkPHrQ=
X-Google-Smtp-Source: AGHT+IFj+1fjmEFn58TsmUm8+IOlWFAQ4435xD2CAoyQRCl/4FNj9ZwIwgFJcww6Co1DcG7+o7eM0X8dM/cr7ULsIt4=
X-Received: by 2002:a05:6402:2692:b0:58d:d1d5:da65 with SMTP id
 4fb4d7f45d1cf-59eee53f724mr1766145a12.11.1721138959512; Tue, 16 Jul 2024
 07:09:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240716114229.329355-1-alex.bennee@linaro.org>
 <b9690162-170e-1f74-f148-0642a8503002@linaro.org> <87plrdh2i3.fsf@draig.linaro.org>
In-Reply-To: <87plrdh2i3.fsf@draig.linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Jul 2024 15:09:07 +0100
Message-ID: <CAFEAcA8+KXykmmk_4BU990kj3nY4xfr0zn2MtM0cYTuhNnsWtg@mail.gmail.com>
Subject: Re: [RFC PATCH] gdbstub: Re-factor gdb command extensions
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Gustavo Romero <gustavo.romero@linaro.org>, qemu-devel@nongnu.org, 
	Akihiko Odaki <akihiko.odaki@daynix.com>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	"open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: f5z2v812Hb1/

On Tue, 16 Jul 2024 at 14:48, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> Gustavo Romero <gustavo.romero@linaro.org> writes:
>
> > Hi Alex,
> >
> > On 7/16/24 8:42 AM, Alex Benn=C3=A9e wrote:
> >> Coverity reported a memory leak (CID 1549757) in this code and its
> >> admittedly rather clumsy handling of extending the command table.
> >> Instead of handing over a full array of the commands lets use the
> >> lighter weight GPtrArray and simply test for the presence of each
> >> entry as we go. This avoids complications of transferring ownership of
> >> arrays and keeps the final command entries as static entries in the
> >> target code.
> > How did you run Coverity to find the leak? I'm wondering what's the
> > quickest way to check it next time.
>
> Coverity is only run in the cloud on the released build. There is a
> container somewhere but I don't know how its used.

The Coverity cloud stuff comes in two parts:
 (1) you build locally with the Coverity tools, which creates
a big opaque build-artefact
 (2) you upload that artefact to the cloud server, and the
actual analysis happens on the cloud

The container stuff and the integration with the Gitlab CI
is there for the sole purpose of automating the "local build
and upload" steps. You can't do an analysis-run locally.
(Well, you probably can if you have the paid-for commercial
version of the tooling, but we haven't got any kind of
setup for doing that.)

We only do analysis runs on head-of-git because the Coverity Scan
resource limits for open source projects give us about one
complete scan a day. So this is all "after the fact" stuff.
Developers who want to look at the scan results can create
an account via https://scan.coverity.com/projects/qemu .
Triaging new coverity reports is a bit tedious because there
are a ton of false positives...

thanks
-- PMM
