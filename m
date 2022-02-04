Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp2446848lfk;
        Fri, 4 Feb 2022 01:42:23 -0800 (PST)
X-Received: by 2002:a7b:c153:: with SMTP id z19mr1497166wmi.118.1643967743158;
        Fri, 04 Feb 2022 01:42:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643967743; cv=none;
        d=google.com; s=arc-20160816;
        b=pQ+T1jlZcH9n5S7ug1zZaj6rvynM+gKIUoLnJ/gQ/imNO0/FKVISYiwZWBCuYF7O/m
         P79KuT7PaYe36GkNm/I+8y3HBZU0yHkrMHSwXKbLhj28IJbBgmQFemT1G5j92CJJaSg9
         bzMG5UY+YteOm2ARdJNFpLgQgj9GqrQnrCZloCk1mf9KUBgh9QJVpHSiXdmGsnxN2jOW
         eesEY3cQN59MoQJnJUzQeTArHuAbqdAUgs6mos0TlOtQJ3o18h5xb2QlSEHQ4+LkKjq1
         95EwfrV3dcsIWfWB+lIedT8DvVNCcd1DszpntGBllMYcq/zFMkIfFctofLG1WV8U5fu4
         hfJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jUZbZuTpM9tSZcxKB5Ny81cj9O/YNi38VWB2rnBTkSg=;
        b=CXnbYpXTnJmhKqvUWkwwrd+qDFlSw2dD8qstiLlyij61iZdzQGnAinWtw4CvuXdlc6
         41kAM/JM510k7Lx69XEq1qAOlzUjqgAO7RQWwpVgNbSc0rINsnMpNrG7V9O0PDkLq3Es
         2bhmD4Zls4xSAnR6vIU5fBbQ3TBEZ1t8Qe5aTJXhLYm7XOPe0BTbFogWc57r2X44Svs9
         arLm4zhAXo000XgIgzh3WLM+V2hfTzEjLFb/enq3d/ZHL5hu1h6SSd8eNlDAWrKVdG0i
         g02/g9m0XNleMVMuTV5MJztSN3cOeQ3nOr1GWjvlrIASECfLV3yyiv6Zw+7oF5nnCJ9C
         enng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ex3kIydH;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id j10sor5803050wmq.0.2022.02.04.01.42.23
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 04 Feb 2022 01:42:23 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ex3kIydH;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=jUZbZuTpM9tSZcxKB5Ny81cj9O/YNi38VWB2rnBTkSg=;
        b=Ex3kIydHlN5qU+6mhJVfGBGTzY0mHnO5bcy/DtqDd8zVf2WgjpIgVDl5Rks5i2kn7G
         gMYGjjccJ2uOGIjj0z5rlRRXVR88fubQI1LKKjX3eYvmSeS/Lkz4+LCHhJfbXwIK6YSI
         07n5uWPNZGDAR7zWTnet8/v86dynIXsX3L7A+Vcquj9sS5blA98RF5sxGORz8N6aq9D8
         3fCrv5JpkbJOxCqHPwNKvvqyDHNttT7vJPWwgPTrw4edBAfBRcJpzi3NvXz1lwoWkgel
         hVBMTXoOfi9Y+LynIpQaqIBxbecONIjPobJqgME5fTyzFOyElJEiL0pzG7ErOs2YRikn
         GzFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=jUZbZuTpM9tSZcxKB5Ny81cj9O/YNi38VWB2rnBTkSg=;
        b=euqraX2GrqC0kyMdLADSnM9YZHE0Si/yl9V1h+PJK5XPPUzNjMQ6XjnHmFLY35gQ9l
         ycoPNLCes+ktfk0E/766HjFrV4/BjQfpqE54R03UDhh4YEGnaoii6usmjPwQN9g7GISv
         KRdQ8Jl7x4hMGL7oPzF5j0/GKM8L2O2yB49tCuF8ETna/+cllE+jjI75Uas1Teg+3pRZ
         dqgtomlGaTnToNqLMBR/5CmrTtzsR9WaMUzSdMsU8wLfsCrniZuukzuAFVWiiMd/e+f5
         LdDGH6qdXeDsMWkQ+4qfmjHcEFXdx3qtt14qsZatqICCa3Ds4TIendB/jrxj5gEwQHDa
         qp7w==
X-Gm-Message-State: AOAM53338yctiSN3cPosUFBoXTUyVfZgDL366FsN+FeFpav6Dsa11GWt
	2X7chVQDxsBB2ZsgptiBuMX0KcziAY3sjW+HlZJFSMy1FWfFmw==
X-Google-Smtp-Source: ABdhPJy5D5Y4Gh2DsWYuHOBnAhiOq/wdIlcGKj8K/MHL1FuRaVyacGajJ9KNFm5g2JirVh0G5ipVP4rKwS7IBSp4+T0=
X-Received: by 2002:a05:600c:3552:: with SMTP id i18mr1535488wmq.21.1643967742852;
 Fri, 04 Feb 2022 01:42:22 -0800 (PST)
MIME-Version: 1.0
References: <20220203155304.2648009-1-valentinghita@google.com>
 <87tudfsv80.fsf@linaro.org> <CAKddhtYyZrEFveatS-o1YORdrUa-o53fBe3kwo9RVjXB2ovpyw@mail.gmail.com>
 <87czk3rnfl.fsf@linaro.org>
In-Reply-To: <87czk3rnfl.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Feb 2022 09:42:11 +0000
Message-ID: <CAFEAcA9y1F5X1BQOwzbJgJKPYvroHFM7ivSUOE-07d3S-GE7DA@mail.gmail.com>
Subject: Re: [PATCH] armv7m_nvic: set DHCSR.DEBUGEN when debugger is attached
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Valentin Ghita <valentinghita@google.com>, qemu-devel@nongnu.org, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
	qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: ZXjHZp/E/y1i

On Fri, 4 Feb 2022 at 09:28, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
> Assuming you are happy for the device to act as though a external
> debugger is attached regardless of the gdbstub state you could use a CPU
> property on the command line to enable this behaviour. We have some
> examples for SVE for the 64 bit CPUs (see object_property_add for
> sve-max-vq). So something like:
>
>   -cpu cortex-m3,dhscr=3Dtrue
>
> You would probably want to model the behaviour of DHSCR.C_HALT as well
> because that is something the core might do to itself if it detects it
> is running under debug.

This is sounding pretty hacky to me. I think we should either have
a proper implementation of all of halting debug (probably opt-in,
with the default being that the gdbstub is transparent to the guest),
or we should just say that no, this isn't something we support,
and if you want gdb to get control when a particular bit of code
is executed then you should set a breakpoint there.

We don't even implement the guest-visible debug parts of the
architecture (eg architected single-step) yet, incidentally.

-- PMM
