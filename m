Received: by 2002:a17:505:840b:b0:1be9:327d:8ee3 with SMTP id lq11csp71655njc;
        Tue, 21 Jan 2025 05:05:08 -0800 (PST)
X-Received: by 2002:a05:6902:150a:b0:e57:8a58:335b with SMTP id 3f1490d57ef6-e57b10999c6mr12133240276.27.1737464708433;
        Tue, 21 Jan 2025 05:05:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737464708; cv=none;
        d=google.com; s=arc-20240605;
        b=bdKovnCwfi1JX6/86qJdYRvKBOHfsR6Q/gHLkma14NCqtec6rv00V6gJJWKbhCo49G
         u1xTo3oG810oLJcApdkDhu/GUFPCpAyAs4186sf7uXCef+hnhqAUbsH87uGX6++zmXUO
         jsGNJ70yGSV6EGbk3dGCNuKEu8EehgugN/uAXE5JrNAIW/JOfobSUnKDCZQ2clr3JQPQ
         PVO6ucE5xtlbKV5DgDM6dZQdQaZPGlrZhK8WmUJ64gNPQb+FHZqHieHJuGtkva0XJL3h
         Kchygyo9sudPjAlp8VFrOVXUj+wU/5VkUdHD5r/GrZp9501APTfPo1S1tTn5nDDNfhWL
         kERg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=L0LC9uCGFjyS38qgSUaB3bhc+kfZQqXdfM2lVdqqJog=;
        fh=UQPmfmOvwV8Ufl4El5AQe4QTeNsgmyJo9dM1FPni0/M=;
        b=VGHnxTk0stR3T1VTtsNjX3uFKIit5UFNLIqR7JQwCZ0kUdizPRglIrCo6dBV2F9Zs/
         hca3g+MNqGCNtJwHeHQFHlDSS1J05V9ANOvSFZeTJ+iPVLBE0L4P0t5nfQ2J9X/PgSGx
         6JyIHZwKf9bVgcolXvkONlXNUnun2FR3udi4/Okjc0UsRLUsvqIpIQfhZ/PYYFsSyj7P
         uHh+gG/B9dV/fITdkPPk4efhmDPCrsMA6hb5AyuMPVq+IkXTorxm7ImWb+vW2+BBOOkb
         vpriaEBouj+aTHF5IRWGl4MEcoMgwQcCwP2MKIzgH/LhQTv/q5QBvwzgYtHLe96pCZxN
         qG2g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Xh8tCEnR;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 3f1490d57ef6-e57ab46ddedsor5354561276.12.2025.01.21.05.05.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 21 Jan 2025 05:05:08 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Xh8tCEnR;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737464708; x=1738069508; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L0LC9uCGFjyS38qgSUaB3bhc+kfZQqXdfM2lVdqqJog=;
        b=Xh8tCEnRKoJGnaC+JucN3eWXb0nEes9IDdPcx+1hqrG23OVHdPklMaskQ4OdwtSl5w
         7YufZ5hblp8Xho3bNW3+RzXpKdbqt6ew7u349wAR43zJOmgkxLCG0aPVdqvcgOzjmYt2
         XKJ3BaIlC0xZzsPJIAeYSk6WSFqnyL1UdLw4tiYgMfwSh6TJbDC6luqnP2Xd7WWyXd5f
         8sDR7ya6MYuYaIRou5M33Kes8zi/oyn6/dMjpcjggkptHiEcsqwq5br8yVtBIJzN9UDZ
         8xCFKV3DW81W7HEU/SywGMI8M5fWvqzx/kMn9Nc/4IgQKjmo++7btjP5tU5To1mXMqgl
         SFfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737464708; x=1738069508;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L0LC9uCGFjyS38qgSUaB3bhc+kfZQqXdfM2lVdqqJog=;
        b=klc30BC0MqfDGoWBPADjMU2QaxYjlZOmo/gQYa0MKvzi7tMYirEelreJD+WTvalhcF
         R7SonNEBuYCYnFeOuyJlH7qOiI3Rxw/l6uMD/S5rpAs2nkkV32WO4UlDNZi6Ff6hfqn5
         7QT64VrILE75ptjQXkFjw0IsLwristok3ODcvLzMyAhDb3nhacK7UaKbpXfixB03JNl9
         5DdchZc3YiZktzeiEGg/9WZVxqUdt35IauIDMRp7x1FhjbApL3QqYMwlyIIdsV8FaFpc
         TNRIjOWG199GRxCo64f0OV1SgrumycBIXnEveJyluGEFXDXolclvDxOkZr6RiSK3KIIh
         Y9hA==
X-Gm-Message-State: AOJu0YyuMy/Cxl47yBZMiNvf2V2kiT9iinLIcXjsXSk6G4bDAjxXv1fz
	hMQnRrhO3o8aSLlG0fcJGM8tqcekP/jy+frDjzJ9MdbuqIU5m4eDOn1Yg0azQXJImnS8D7/PLkF
	UP1hheSZbdN7GBJl7iklWMmJ0Nwh3YyRtl55NAKDixy8yl8tqJCs=
X-Gm-Gg: ASbGncuokcWIS63FFqjX3Y0dF1rYKLfhGZxpqqZt9z32DSHS8zT7u7FbG2zSM+/0qnU
	274GALkv4zUqVAO2KpUuX5DQGjIs/6ljgb6pOHDBtSFMt7CQjsVWf
X-Google-Smtp-Source: AGHT+IHIU3MO35jrOSaOuGgzQBJYDsWlT7SNbbIrhCg41B+5rBE7f3T1bnIov5TSaO3VDauYrcLShn9Cnxp0uxMmBu4=
X-Received: by 2002:a05:6902:1b02:b0:e49:c11a:7580 with SMTP id
 3f1490d57ef6-e57b10453eemr12505410276.7.1737464707734; Tue, 21 Jan 2025
 05:05:07 -0800 (PST)
MIME-Version: 1.0
References: <20250120210212.3890255-1-alex.bennee@linaro.org> <20250120210212.3890255-7-alex.bennee@linaro.org>
In-Reply-To: <20250120210212.3890255-7-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Jan 2025 13:04:56 +0000
X-Gm-Features: AbW1kvZ-Pag_aRcTSJV0CQvvb9KJN0wMv3z415E0AitAhflfvfj1yHoVGvRiExQ
Message-ID: <CAFEAcA_qceSO9be7wSj6U2a9yDvj9VhjQZuRugzGKsae+wEoog@mail.gmail.com>
Subject: Re: [PATCH 6/7] tests/qtest: tighten up the checks on clock_step
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org, qemu-arm@nongnu.org, 
	Thomas Huth <thuth@redhat.com>, Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: kmPsbvXPE55+

On Mon, 20 Jan 2025 at 21:02, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> It is invalid to call clock_step with an implied time to step forward
> as if no timers are running we won't be able to advance.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  system/qtest.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/system/qtest.c b/system/qtest.c
> index 28b6fac37c..1a9bfd0b33 100644
> --- a/system/qtest.c
> +++ b/system/qtest.c
> @@ -708,10 +708,15 @@ static void qtest_process_command(CharBackend *chr,=
 gchar **words)
>          } else {
>              ns =3D qemu_clock_deadline_ns_all(QEMU_CLOCK_VIRTUAL,
>                                              QEMU_TIMER_ATTR_ALL);
> +            if (ns < 0) {
> +                qtest_send(chr, "FAIL "
> +                           "no timers for clock_step to follow\n");

I think I would say
"cannot advance clock to the next deadline because there is no pending dead=
line"
as being a bit clearer about what's gone wrong here.

> +                return;
> +            }
>          }
>          new_ns =3D qemu_clock_advance_virtual_time(old_ns + ns);
>          qtest_sendf(chr, "%s %"PRIi64"\n",
> -                    new_ns > old_ns ? "OK" : "FAIL", new_ns);
> +                    new_ns > old_ns ? "OK" : "FAIL could not advance tim=
e", new_ns);

Maybe we should give up on trying to handle the OK and FAIL
cases in the same qtest_sendf() call? It's not clear to me that
printing the new clock value in the FAIL message is actually
useful.

For that matter, is it actually possible for the clock to not
advance? It doesn't seem obvious that "advance the clock by 0 ticks"
should be a failure case rather than a "does nothing" case,
and once patch 7 is applied I don't think there's any case
where qemu_clock_advance_virtual_time() could make the
clock go backwards... Put another way, this would be moving
back to the situation before your commit d524441a3610b.

thanks
-- PMM
