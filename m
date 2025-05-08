Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp308142njb;
        Thu, 8 May 2025 03:08:43 -0700 (PDT)
X-Received: by 2002:a05:6902:1009:b0:e75:6165:12f8 with SMTP id 3f1490d57ef6-e788143740amr8779945276.39.1746698923291;
        Thu, 08 May 2025 03:08:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746698923; cv=none;
        d=google.com; s=arc-20240605;
        b=diZ4iVMZbpbiySUumX873PBlgSPmFX5It9H5STJ0dOAwPzxb2Ep96nG/tbukdH2apj
         bx5rna/FUMBjIergCGq6PayUdWF+m+iG0Vo3HeyIeNIf6N7Ij0i61UzAhPaPVOdJcO48
         T1VdvrHhk7g2LOYxg4YBtEZviqKWteaydrzsvTwG5p5HpgLGOtJhSoXbQAueC9U9jCe0
         Slk+ooUmqWdX7xdmQZ0ozBuGUS/F1G4nECkpYiUyhLYel/gMeTviE6wjfC3nAlEbuiRY
         BLblmF8KiGuqc+xIHd/zqzUKfkxG37C06bhSivwPFSmjlGFvrscsTRgG2D2yqpW7fRN3
         GyAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1H0+0F9vOVLheaEZEvUdOPFnTo+Yi5n5w8p9tg66jlY=;
        fh=qFyuN+9aQ9YqLK0SiskoA6AJyTxb1+Ky9x7CdeetCiw=;
        b=REhbeAW5X67TzMsQCQ0e9gmiXgvOIvHwAn/Xv6cUmbFpZ0YrRymQwV1wgOZZrFRwHt
         K192YVOaHtIO3lQaaqgP8YFWSAxXhygaoKcgEvfpQzglMpsveI+Xn9K9N9wHCoLl4RVv
         YFUx6ifNJ15P7a4JOgUWbpmHJcwLmVX4YCJq/Pu/Lvx+8TovfFTG2u9+AhYmA4mm5ND0
         BCp5jw0jXHHHF0BO3GJFFKUYUnMi1hYgsDwz6bxuqTFhxC+ST14h14Som4nMHqfKW8dP
         z6vdtAA8RjE9jN8bVmDqkf4Peko2UKTyPYR2UhwAj/UXyZLgm0fY8rrDQvvX/DhYUuxz
         kFcQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e0yBz51Y;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 3f1490d57ef6-e755e710129sor8596899276.7.2025.05.08.03.08.43
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 08 May 2025 03:08:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e0yBz51Y;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746698923; x=1747303723; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1H0+0F9vOVLheaEZEvUdOPFnTo+Yi5n5w8p9tg66jlY=;
        b=e0yBz51YiSweuM/cfUR0Xi3xvPbvH0NkEggRxmTRujfIwsYCRmQCcPTtVSrhtr3gUJ
         xruF0w81/y8iDVdajZVZw0eVe+VPLijyPEo0fkEcPV4rfb8HgjPQQy7e+rT3l0YOirAO
         +t4Ss5GkoJ4iMtpdEdaTFL/RzHr0DgUDghmC5TSWEP41Pz5ZMt/q2CrdlKiHomUDNRsq
         6IcnaCpiJy/E9R0keenFwptqZxLSk5B2Q/WAl62rup9Zxza+S9zuOXY0ESlB60aVGpH1
         Ps4pfbafc6EAHDix3Z/NL64rCBpZDF6u2j2dAOOeSj/gBsegYZJXXO0mDQ4Eo0rwvhwW
         lsCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746698923; x=1747303723;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1H0+0F9vOVLheaEZEvUdOPFnTo+Yi5n5w8p9tg66jlY=;
        b=Dh3k+HrQebw02iH1ng7XVWfrmatxbSB0UdkwyKtdf+SOKghuSh7M47iyeb3RL2ATTn
         zDcotmi2Cjm5ERRqzTZPTBtLuNo7RmlDOF8r6tXEi8D2LMiAPKdTc/7wLomvEqwt+72A
         A56d9BVcOSeAdM0+8gsqf1JYmjU2issRBrwA9KXqW+/u0U1Z8+EJpGGb5Eilhozr5UtI
         4woVWhVP/5bPzHT0WybXKD49Z34D0jIoaC13/4s5vsKl/EagTOW7fgbLKShmk1dOlxfh
         D0Y8hcvsPql3TatMT8lrAdDHTwGUWt3cq+p27Q5I7M4nr4z+uSeXFMv5q81hqaGYk5cs
         rnsw==
X-Gm-Message-State: AOJu0YzRKciC31PuemWkTnXYZ5Pl2Pal/W0Y3kBvocwZFpgBLqjyYelA
	sKf2VWgkam4EEH7qy/4F1XEnqjOvY1fNHKx0q1SQWlztFcEGzIXoYLixi5nbFtqjJuW0e8yz2gB
	Hi30WPuU9j1/Kjra1pjuyAFMwbT4qCFAf4hhkr8zOZofq6Lc7kMw=
X-Gm-Gg: ASbGncseFn+2y9WvI129bYYMOJhm8JibVZ9bKhssmGOpfIOZuulgYXAhEJXwIFzjRK+
	1Qn58Ox5nZyvH5DmSrUmCOShZgMXPh317fA9N+l+jQIiaQnl1qtcYZmltVd6IGZ+NPriB5ixIKf
	LejajU0stbuuBrknFO6JJGbuU=
X-Google-Smtp-Source: AGHT+IHAFjKhVb7P78m/ux7WDmQOeEzYANSm2OTObw8LkPC3QsIjwxGCiY6aftn5mq53d1lzDEptDpZC92r0BZ5Ofsc=
X-Received: by 2002:a05:6902:2411:b0:e75:5ef3:893e with SMTP id
 3f1490d57ef6-e788143b11bmr8339767276.35.1746698922914; Thu, 08 May 2025
 03:08:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250507165840.401623-1-alex.bennee@linaro.org>
In-Reply-To: <20250507165840.401623-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 May 2025 11:08:31 +0100
X-Gm-Features: ATxdqUGNuMZUmWvsDZGuey5CBwObIZjAL67p9J79vhahR9SoTWffafPG5Bi4MUg
Message-ID: <CAFEAcA_0cf=XEbH9VQdTHqu1wekSmFDLdqnnzpcwnshCT-UUCg@mail.gmail.com>
Subject: Re: [RFC PATCH] target/arm: allow gdb to read ARM_CP_NORAW regs
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Julian Armistead <julian.armistead@linaro.org>, 
	"open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: mFnOoLFQvLmh

On Wed, 7 May 2025 at 17:58, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> Before this we suppress all ARM_CP_NORAW registers being listed under
> GDB. This includes useful registers like CurrentEL which gets tagged
> as ARM_CP_NO_RAW because it is one of the ARM_CP_SPECIAL_MASK
> registers. These are registers TCG can directly compute because we
> have the information at compile time but until now with no readfn.
>
> Add a .readfn to return the CurrentEL and then loosen the restrictions
> in arm_register_sysreg_for_feature to allow ARM_CP_NORAW registers to
> be read if there is a readfn available.

The primary use case for NO_RAW is "system instructions" like
the TLB maintenance insns. These don't make sense to expose
to a debugger.

If we want the gdbstub access to system registers to be
more than our current "we provide the ones that are easy",
then I think I'd like to see a bit more up-front analysis of
what the gdbstub needs and whether we've got into a bit of
a mess with our ARM_CP_* flags that we could straighten out.

thanks
-- PMM
