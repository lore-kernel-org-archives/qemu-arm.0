Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp2421756ejc;
        Sat, 4 Mar 2023 06:10:32 -0800 (PST)
X-Received: by 2002:a17:90b:4c43:b0:233:c40d:9a37 with SMTP id np3-20020a17090b4c4300b00233c40d9a37mr5372510pjb.10.1677939031975;
        Sat, 04 Mar 2023 06:10:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677939031; cv=none;
        d=google.com; s=arc-20160816;
        b=jlfxB4BSzrb3sWZ/rNELpnDJ3PXYelOAAS1ErgXF7fb4a+vBxwt6sMyQLY8LmjtTEx
         DDKvIo3ua1cgPj19PU8UqewAnV0gHeA6MrIif5T3n3vvN38h1n6tVdAlIWVb4AafouRq
         0xVvBrWKSHpNND4oU7uoNZEpdirDs9ID2FIcHRZhUBehmR8nG1nnFuUyecgqI6mH5txB
         jtXUCKUxhvpnEoBCJ39da39UyHsonCUz/d/AjdYcka4pX8Q/mfnbLic00qmdykleD39/
         CA+UN4nS1iDG26TqWQWbKBPuCdFgldVwsHNTs3gq1qjZbBnWd4xZ6p8tUBYzuWQolVat
         i93w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=8rbBDKVbFX5p4DPpsjS+sN1J3zemVKGH89kixqMsoJk=;
        b=I7plRvNZIM95lcffz6cb4RMegdzCYrt8YQ/lvYiWwXHm3im6WiKv6b+1RnqRoi133s
         A5mnmrcEJU2nUqETk/Hw+q8lxUD3PdXeI2xnns05I7tl0Wel+aNA2MZW1pd8iJ4i1ds0
         KfE3BOVXhxDwjzBhHyL//jqpmODSwag+JOPOCxahqcWOwIWDYlSvTyLoy9+0uKbvUG7a
         QoQ0JSu5mJpIHeQdrr3lQ5fxWtKqZJMZpG08nMCbtBXBx9msD1U/NJ210S54PCH2tgTa
         +QOXS67pbNB/y9YMD0tnKFLcErdOjEG4dNQU35NnwqZ9PZANiBY0qSJsb8VNrUn+uD1V
         1DLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UITaUBxb;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id gi7-20020a17090b110700b0023045b9664bsor2301372pjb.1.2023.03.04.06.10.31
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 04 Mar 2023 06:10:31 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UITaUBxb;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677939031;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8rbBDKVbFX5p4DPpsjS+sN1J3zemVKGH89kixqMsoJk=;
        b=UITaUBxbOupmnJa5G6IPEwQUkib23Grhw7UDOueeLBURQuv2XKXyBvWO71a1XvYtn7
         +dKBX91NK6ETiyTU4cyKKrkkPh20KOJ7Age7Hl/Fz2U8KG5VZ9FGW49nruK+aTBLuERH
         AHGVYmqhrMa/b5z+3ztAmmm0VwL+WHS4GwlQq7fJNNPqiRSszL6DsV4LxzY44zCcJIe7
         eOhdXHY5KanPLzkmQ2d+VD6JgfQd1p0jSX5YYnqDSwy1oW71fAp9/ebfECylAYjC+IuG
         EPRBpg6sNy7ieKuPsh3opYxLK2mA9z/FqSrtUFNiRRIax5ZxH8d2Zin4YEo3gRbghgAY
         q1Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677939031;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8rbBDKVbFX5p4DPpsjS+sN1J3zemVKGH89kixqMsoJk=;
        b=TMwFFlRJr6D5difXNKr6J2suEbjfRiODMPa1/INgkBpw6+U70qztlGf7y+kj2K0MHi
         TODgknXxwKg8LjOkSaqHyBgwvh6wATHLVum7gdz6+Y72k4w4397rCdr0I+ytwKngtMM0
         nDQYKz4VXN5NyQAoxT50hrnLyvA1mCUUMH/uVq3ls/inXdyrIVaeNFyDc+yowyxi6Hf2
         /6FHBpwLjnp6V6wOXBczJsbiI844fXUykCPvTOvm+XFC7IJXBVh2Oe/SinCIOiiKxZeW
         novksbPSW7RCGCXaqyV9/fOxwEaxpBqROVbhhnmvZOJdAdduDyNLbolW/zRNfkS6wXhd
         UKzA==
X-Gm-Message-State: AO0yUKUVaRJ5HAFVcr5W84k/7nCgcn+P3BmDYoV/YqzdTYKcgQfkJF65
	tgSpY5P5GYUi9Gzasac0bfU6j8rhbtI0mSdTWSdYZr90
X-Google-Smtp-Source: AK7set9hLjgNwUsBsqfH8DnCkB1rIezTnhi0tJwLeXAVVzzDJP7KGm7JIJWmCdJ8qUL8Z9wz/hQRnBQ7MBN5eAM7+As=
X-Received: by 2002:a17:90b:f12:b0:237:5834:2808 with SMTP id
 br18-20020a17090b0f1200b0023758342808mr1912071pjb.0.1677939031480; Sat, 04
 Mar 2023 06:10:31 -0800 (PST)
MIME-Version: 1.0
References: <20230228192628.26140-1-farosas@suse.de> <20230228192628.26140-6-farosas@suse.de>
 <CAFEAcA8p86BdbbO-thyov+A-dc98iygPx6nyCmnxinCRCuKviA@mail.gmail.com> <87pm9pwnym.fsf@suse.de>
In-Reply-To: <87pm9pwnym.fsf@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 4 Mar 2023 14:10:20 +0000
Message-ID: <CAFEAcA_aw6mc_FM00MqOcOzqFP=xktpq6+Z-_uhhEHKbw-bKNA@mail.gmail.com>
Subject: Re: [PATCH RESEND v7 5/9] tests/avocado: Pass parameters to migration test
To: Fabiano Rosas <farosas@suse.de>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Richard Henderson <richard.henderson@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>, 
	Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>, Cornelia Huck <cohuck@redhat.com>, 
	Cleber Rosa <crosa@redhat.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: 8kcUaRX2vgv3

On Fri, 3 Mar 2023 at 20:59, Fabiano Rosas <farosas@suse.de> wrote:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Tue, 28 Feb 2023 at 19:28, Fabiano Rosas <farosas@suse.de> wrote:
> >>
> >> The migration tests are currently broken for an aarch64 host because
> >> the tests pass no 'machine' and 'cpu' options on the QEMU command
> >> line.
> >>
> >> Add a separate class to each architecture so that we can specify
> >> 'machine' and 'cpu' options instead of relying on defaults.
> >>
> >> Add a skip decorator to keep the current behavior of only running
> >> migration tests when the qemu target matches the host architecture.
> >
> > I still don't understand this patch. Don't we run the
> > migration-test on all hosts already? David ?
> >
>
> We run on all hosts but for each host we only take the QEMU binary that
> matches the host architecture. So if you want to test aarch64 migration,
> you need an aarch64 host.
>
> If you run on an x86_64 host (without this patch):
> $ ../configure #all targets
> $ make check-avocado AVOCADO_TESTS=../tests/avocado/migration.py
>
> You'll see:
>
>  (1/3) ... migration.py:Migration.test_migration_with_tcp_localhost: PASS (0.21 s)
>  (2/3) ... migration.py:Migration.test_migration_with_unix: PASS (0.18 s)
>  (3/3) ... migration.py:Migration.test_migration_with_exec: PASS (0.21 s)
>
> All three tests ran using qemu-system-x86_64.
>
> The issue I'm trying to solve is that when run on a aarch64 host, the
> test will fail because (being generic) it doesn't pass the '-machine
> virt' option and there is no architecture-specific information in it at
> all.

But my point is that we already CI on aarch64 hosts, so what is
happening there that means the test doesn't fail already ?

-- PMM
