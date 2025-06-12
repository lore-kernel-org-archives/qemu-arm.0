Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp2420032njc;
        Thu, 12 Jun 2025 08:16:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWl4WUtX2eLPKLp9nuy81hsaypueW7gsNQKrKahbADXX30C8xqBE6njN3dDXUJQbr+rbYX+S9CLK5+ERg==@linaro.org
X-Received: by 2002:a05:690c:eca:b0:6fb:b1dd:a00d with SMTP id 00721157ae682-71140ae04f6mr115450897b3.30.1749741413870;
        Thu, 12 Jun 2025 08:16:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749741413; cv=none;
        d=google.com; s=arc-20240605;
        b=PbslijuDo2Gb4CSpxGSgth5RZSn6lQOnLaJTmq8Ha1Q8Bw4+PL22FFBSrSAN/SPNxV
         ovSI8ShAHpqAvQ2QaiyDGWgaaFjDhusKuHbWDk7mLv+1EzOtiuUrsxpwPQFl+rqMMYzE
         Jp8YJcCKcbWhoctgXjH7GFdPgF7n4j9otOfTQJQX1sCIuyaM+YUQJkpsRarLRaE0+O4l
         0MUSCgIg4OyxOrfoNbStizZ085LISI5ly3qRQG4tPApITOTkN8SvVjtV9CQRZb5xRVKO
         kUrD/itxcvc0DfGqj2C82cavMU4nPfwtVLmY/5PMOLhACSYeSn4ULOGs4wBWBhZqtxt/
         yMmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pynYP3g1x7bEvnpKVAJ2PfUrR08T2TE/exFWGnDSM3k=;
        fh=nKmdbdQ+3PAXNBLHGXdiYterh8AgVDfJju3QCcXF0P0=;
        b=fRz//uhkD4sumQHuURlcJ1Rh/+gUE9c0bKcQf3cDO3W3Pie0kir2mlcIX7Bzhxkdd1
         bLMljvwGfSGx3vMmSat0PJn8wGOs/w2QrEls3Na6mq3Ci2s+K++6DbdUH5SCI93PZMIK
         1CPp54aG2mrCMGT6CpBPAHKSLI0zA6+7NCKABYVL9AdDk2JQ0qLzkfuouRa0mT4dPZeb
         FLjsH7vJWVTQJaeXwuX+mq1ROaSQ9Z9tVKnVOXWCwcX0pSn16JB0zeyGIkKcLKvp8rzX
         G8PqS/JLbCZig5PQJzlW1f4m8pCw3+pzeO/tUB8ohkj1mpe9dJpLWMDx2Dttp3sfM3Oa
         AWQA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rXBMtva6;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 00721157ae682-711513e70adsor11044607b3.0.2025.06.12.08.16.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Jun 2025 08:16:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rXBMtva6;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749741413; x=1750346213; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pynYP3g1x7bEvnpKVAJ2PfUrR08T2TE/exFWGnDSM3k=;
        b=rXBMtva6BgSYxMP1oNjzY5G3kmT8/x90eliudSLJhxeOCIqoUesnfYGIHqtT6YoA8V
         eNhOKV8iGlrG6+BFkk6yGunh+TVTkNxTOHDQGVe08rGg+GfOW+IftSewZ7JPyL3layQZ
         3ikaFk2lpCL/OvYEL7r8FG3bMW5L9BG09U22r2lgANxMK0Z1jUFFbIVnjDJIDwol/u2N
         lRxKfXD6Vw/w4FYPGa3eZbPp79ppdfXch/Jf1Nl1ebpiRVOcSBh7NJ4W0kqmMU6vsM+3
         UrGbYyiOiwrYlXFb37ZWogHg4OqEz6k9vlsMBX84lQbffHIa12/+7mLnol6fKxFfoeWp
         d8KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749741413; x=1750346213;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pynYP3g1x7bEvnpKVAJ2PfUrR08T2TE/exFWGnDSM3k=;
        b=VUc/uWXWsaE1X2a71fd6FH2hc40Qrs1WtYoQp/ZWvAAH+VYR3aEIPIAeTu7idVy1xu
         CV9RAUtexMZCcP476CgHuOm9P7gRM0/4v9nnPlb2bcJyp6XtfjW37/bQ5NSWF5VNvmTG
         ndMxbAtu3JF+fvyJncc7S3W3H24OQ5kU6aS/3otw+qaUTrHHiSFmRSM8gB8TrSJGMnxD
         ML4/Wk7Njh+VQ8Y6avpV9BvGZIQu8lTflhxc0IFzDJSePc///WqY7DjXyF+4hz6aby0A
         6fYn8g0V66EXU4bZWDTWJQbSdJcKqic57TwRHJH5paH7rEyjxYUn4k+PVlLyUbwf9Y87
         8tbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUG8bFq9bQCsXTiVZWDDqPEiX/xwFdMX8vwLuPjs9HxUac2yxDnEo+jYjEwDfhVyLtmC8ekW+JfeSWQ1A==@linaro.org
X-Gm-Message-State: AOJu0Yzj6j3V1hjclzOPyzXWKuFioLkUhHO2wdIjA3MDytsjL81Fy+pm
	dO0s7Z13OG6DVUdHivyXHZZ4vuCDTN7JZmex5Fu9ae5fvFzMl0iqH8WUCXtWBUcGvHS9GiZEdsI
	4gdNJ7m4zgaGpO8iq3upz5xizAj5NQDyYQXE9ZDowrhLR
X-Gm-Gg: ASbGncsmEq6/zjIgt9j5msguCJIseyFsN9fWIk07su9DaxnYPX/UFnh+AGRhEW39aSl
	u1d0Ngk02N0YkPi9L974lSO9q/8+3VNBylBOYH/aQYOa9qgZ58OeTMpO2Kj+R0WEkZzEVFM/GKq
	j4pcMjp4LDlP4KL5GozjQe616rAx7ymwF1LZtRMo6Ro9oY
X-Google-Smtp-Source: AGHT+IGYiecPIEGI+SJaCfuiYeexAAl9RgvSgy2FQZTT1sSnvIQJSJ8BM7RWlCmuhu4n7BWqsMQg6VdmdcMZ9NIZDqM=
X-Received: by 2002:a05:690c:39b:b0:6fb:b37f:2072 with SMTP id
 00721157ae682-71140ab6714mr108064287b3.22.1749741413249; Thu, 12 Jun 2025
 08:16:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250515153907.151174-1-cohuck@redhat.com> <20250515153907.151174-9-cohuck@redhat.com>
In-Reply-To: <20250515153907.151174-9-cohuck@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Jun 2025 16:16:41 +0100
X-Gm-Features: AX0GCFuBHrJGT1DhrRgfURJ0MalgsW4xYAj3mIR8h1lKcbEjMTHrKhv4wIVn_nY
Message-ID: <CAFEAcA-c=EaE-Y4DMVz_meVd2cbxuCyFGFOXET-COOgMWHXWWA@mail.gmail.com>
Subject: Re: [PATCH v7 08/14] arm/cpu: Store id_isar0-7 into the idregs array
To: Cornelia Huck <cohuck@redhat.com>
Cc: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org, 
	qemu-arm@nongnu.org, kvmarm@lists.linux.dev, richard.henderson@linaro.org, 
	alex.bennee@linaro.org, maz@kernel.org, oliver.upton@linux.dev, 
	sebott@redhat.com, shameerali.kolothum.thodi@huawei.com, armbru@redhat.com, 
	berrange@redhat.com, abologna@redhat.com, jdenemar@redhat.com, 
	agraf@csgraf.de, shahuang@redhat.com, mark.rutland@arm.com, philmd@linaro.org, 
	pbonzini@redhat.com
Content-Type: text/plain; charset="UTF-8"
X-TUID: s3gnkWDEa5lu

On Thu, 15 May 2025 at 16:40, Cornelia Huck <cohuck@redhat.com> wrote:
>
> From: Eric Auger <eric.auger@redhat.com>
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Sebastian Ott <sebott@redhat.com>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>  hw/intc/armv7m_nvic.c     |  12 ++--
>  target/arm/cpu-features.h |  36 +++++-----
>  target/arm/cpu.c          |  24 +++----
>  target/arm/cpu.h          |   7 --
>  target/arm/cpu64.c        |  28 ++++----
>  target/arm/helper.c       |  14 ++--
>  target/arm/kvm.c          |  21 ++----
>  target/arm/tcg/cpu-v7m.c  |  90 +++++++++++++-----------
>  target/arm/tcg/cpu32.c    | 144 +++++++++++++++++++++-----------------
>  target/arm/tcg/cpu64.c    | 108 ++++++++++++++--------------
>  10 files changed, 243 insertions(+), 241 deletions(-)

This doesn't compile:

../../target/arm/tcg/cpu-v7m.c:70:5: error: incompatible pointer types
initializing 'ARMISARe
gisters *' (aka 'struct ARMISARegisters *') with an expression of type
'uint64_t *' (aka 'unsigned long *')
[-Werror,-Wincompatible-pointer-types]
   70 |     SET_IDREG(idregs, ID_ISAR0, 0x01141110);
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../../target/arm/cpu.h:875:26: note: expanded from macro 'SET_IDREG'
  875 |         ARMISARegisters *i_ = (ISAR);
         \
      |                          ^    ~~~~~~
../../target/arm/tcg/cpu-v7m.c:71:5: error: incompatible pointer types
initializing 'ARMISARegisters *' (aka 'struct ARMISARegisters *') with
an expression of type 'uint64_t *' (aka 'unsigned long *')
[-Werror,-Wincompatible-pointer-types]
   71 |     SET_IDREG(idregs, ID_ISAR1, 0x02111000);
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../../target/arm/cpu.h:875:26: note: expanded from macro 'SET_IDREG'
  875 |         ARMISARegisters *i_ = (ISAR);
         \
      |                          ^    ~~~~~~

(and more similar errors until the compiler gives up).

-- PMM
