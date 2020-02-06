Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1539254lfp;
        Thu, 6 Feb 2020 06:53:56 -0800 (PST)
X-Received: by 2002:a1c:2089:: with SMTP id g131mr4723893wmg.63.1581000836209;
        Thu, 06 Feb 2020 06:53:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581000836; cv=none;
        d=google.com; s=arc-20160816;
        b=aH5VwjW54sIuRGlU5ZKVI2Zm1wz9wyu28hb6Z0bcNlmo3kf2t/M9OGtRV9KIIrP9cW
         06eQ6FC2xzHAJvfF5MhW5xTCi0mNdAv7gtRqS0Byk3RmtBbq5SVshumRg7imDc571Mn+
         UFVBJr1m6BaWTicXF8SC5tSpYKejzT3bWuvxiMtA4pDAqGuBC7Q2Yeyp2FPBIHzIPrH+
         OXQKlQI3/HZmrYxmxbX7ya/JpF98VSorloRODkSG0qq3OboHJQu1Tl0bkuuJlkIr8P6b
         0+Vrmo6PQmnAoyLCoPkWQp6wJxMwk4kaTNPaalWHjB3GAV5k+u6URHq11aua8B9j0Yn+
         D9Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:dkim-signature;
        bh=9lyCW1qY2LyUNpFqh4rbGRpMkH6riQ2ATjIFUK/yVYc=;
        b=0N2kEUbH5ENeR8k1d+8RBI4T5pDK5HfzdSGozYzdYG+XZWa+NyzEykyQjtAd20btbc
         impp4vVPsP4LD85Y1cZmKHcdGNgKWPkGUKck5q+oLziKW7T+rrqf4J1Hfffu1+tGYR4J
         hX85LUNOaZU4lohGffB4lY3rIFuxQie/YziozSFUodjigQ1VBEvwgt/+U113RrCanjyO
         oYW0EUepi3NCqBvAPNOhzxB/QnDySK6qoXmX/avMFD/9ZSHWNkzAF3djfZ6U/KrpwYDk
         QmDmMoBC253eOvO3CvzO0sUfMYEZ+PhXH1n7RognKOmsH4LcXtb6Yn9QHjt6BS/TcAyN
         2t2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@livius-net.20150623.gappssmtp.com header.s=20150623 header.b=M5tgnBFL;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of ilg@livius.net) smtp.mailfrom=ilg@livius.net
Return-Path: <ilg@livius.net>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id g18sor2383580wrr.8.2020.02.06.06.53.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 06 Feb 2020 06:53:56 -0800 (PST)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of ilg@livius.net) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@livius-net.20150623.gappssmtp.com header.s=20150623 header.b=M5tgnBFL;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of ilg@livius.net) smtp.mailfrom=ilg@livius.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=livius-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=9lyCW1qY2LyUNpFqh4rbGRpMkH6riQ2ATjIFUK/yVYc=;
        b=M5tgnBFLn7DgCPUxdHGG1fVULpLH9hVfBn4ff96QEwRbx+zdMSMx0F8UZY51x+hsA7
         nUaEKsAapPYl7hHYRBDJkofdLfFPsIMf1pZp52TarWWZGkEalNaTxXUWGxUEnEHuD5ZY
         uyQwMPJUEPRMLnBxjZ2g8ug6Pv70pHXKN59lui+qVSVkzP4CkncGHvofhd1HJ3duT9Oa
         nFBmeMQjQMeLzeKd92eL0PCLk5lKhbwtQFlhAV/KPsbZlDC2frF72Y9oMY4qLoG7TpFk
         atfUiztZ9RHqRRnJT0xVm7UJwo+Q0jqr+JU/d2djAaBnxjUbOv6UYTrcEBt19nVmCXjT
         uePg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=9lyCW1qY2LyUNpFqh4rbGRpMkH6riQ2ATjIFUK/yVYc=;
        b=LgExfVi/MySbsWLYotTuUuxavTW6o7v46jI+Zu4Cchi4D5H5l21NuZoIkOESkc+3qc
         oKnKroqZf+9OftbyTcuZKeryXD6ydYfAhEXXegpD2PD37kBtxHfxOwdSgjjrq1V1Jmku
         p4xeaTb4Uvlc6QIdefFuCQDWXdYfuJu5s+e4nsPKbhtUbLO1xscDheNT6150NsoGBn0/
         twFActYPq6FIowMVZEmzxVm1vf7ocu7eet+hXKSs/BG0eScNX67ZrqG9rdIM4ZfKlv4R
         61FV6OI4e1FuEOEz3NFcdfuO+TLvMxlC0PI5Z1N2WlMQeagPJfg2Ewa/uoBKHf/Af2t3
         Z1yQ==
X-Gm-Message-State: APjAAAUykF+fa5cMzLM5odgkUnsXSpIo08U0PEocsuxbGDhEtY7OaFYU
	56ZSFl4v2ayQIoCrjOXcHQLa71fMt/Gx+A==
X-Google-Smtp-Source: APXvYqw6wtDjVyWmanTkqAiRgC+VlrfyPeLO3voWojZ14DZCwGXdz1Z6v+x3rxHhgG2oAwKc/ihO7g==
X-Received: by 2002:a5d:66cc:: with SMTP id k12mr4174829wrw.72.1581000835799;
        Thu, 06 Feb 2020 06:53:55 -0800 (PST)
Return-Path: <ilg@livius.net>
Received: from wks.local ([84.232.200.227])
        by smtp.gmail.com with ESMTPSA id r3sm4379387wrn.34.2020.02.06.06.53.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Feb 2020 06:53:55 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: Is STM32f429 discovery board fully supported on qemu?
From: Liviu Ionescu <ilg@livius.net>
In-Reply-To: <aa9a6e4e-70bd-2abf-9b75-8200990a1c57@redhat.com>
Date: Thu, 6 Feb 2020 16:53:54 +0200
Cc: Mohannad Maklad <msala.work@gmail.com>,
 qemu-discuss@nongnu.org,
 =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 qemu-arm <qemu-arm@nongnu.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <513AE0E1-BCEB-47DF-B256-2460665ECBD8@livius.net>
References: <CADxp150RUQXjDFjrQcrJCfoWto=ERaGVd=neo9s_2=3XsyS9XA@mail.gmail.com>
 <07187FD3-2C54-4F19-8D2A-386FD3F360AD@livius.net>
 <aa9a6e4e-70bd-2abf-9b75-8200990a1c57@redhat.com>
To: =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@redhat.com>
X-Mailer: Apple Mail (2.3608.60.0.2.5)
X-TUID: FxRXf8edvPSK



> On 6 Feb 2020, at 16:42, Philippe Mathieu-Daud=C3=A9 =
<philmd@redhat.com> wrote:
>=20
> https://xpack.github.io/qemu-arm/#why-xpack-qemu-arm
>=20
>  "Even more, support for semihosting in the public
>  QEMU version was broken, and the verbosity required
>  for integration with the QEMU plug-in was missing,
>  so it could not be used with the GNU MCU Eclipse
>  plug-ins."
>=20
> Too bad these improvements aren't shared with the whole community.

Unfortunately, at that time (several years ago), there was little =
interest in anything else but Unix class machines, and we could not =
agree on a common strategy how to handle the changes required by GNU MCU =
Eclipse, so I had to make a fork.

> Note there have been a lot of changes/improvements related to ARM =
semihosting recently in the mainstream QEMU.

Yes. Great!

> Quite a nice list, it shouldn't require a lot of effort to contribute =
these boards to the community IMHO.

If there is interest, please start a new thread and we can discuss how =
to contribute them back to the main project.



Regards,

Liviu
