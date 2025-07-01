Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3047924dye;
        Tue, 1 Jul 2025 03:17:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXYTiCvh2pTGQGdtGGLzSGh4AUbpkwmuE7vJmwbvWQNH5v9U6wLmP/7LexuptDGuC80l8nUUdFMaHlIxQ==@linaro.org
X-Received: by 2002:a05:690c:10d:b0:708:16b0:59c3 with SMTP id 00721157ae682-715171b7bdbmr241699297b3.33.1751365020863;
        Tue, 01 Jul 2025 03:17:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751365020; cv=none;
        d=google.com; s=arc-20240605;
        b=l1K9zoFeFk6hUoHweqXpxc5wV6t4TiENIcN61QVQo1V/WWZKl5aYuK9eLs5lej+P7w
         FyT7r+5SVPhPofQgfAy428D6Od317QKwYQuzdZhgZftbNiacDdqUCaWq8zUIBjtLXwlU
         lDB1VoS23PP2vFJiLNH4+1UL8aZ3YxexWpxpYO2WgW44nDz/VNeq2Okuie5vW/+S6wUQ
         tw46NgmUKSrXSZRecwgpIEY5Kp7eRFCQ5b82AzUqcP+isqun7IzEz5uisGKLxMlVZvx0
         UcgL+EcK8gH81DwwRPx5QlvoJXAfJtQII4yoHh+R+NdIlia1jOdUK1FNiss1hcwCg0As
         Qofg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/EZGFydrDXJBrz0DVvdE/jHAvcnNcUyTdefYv3idd5Q=;
        fh=ojIh4YsyPSKKvJDS7C9w7+aekizW1JxNe1V8AJp67GM=;
        b=IFA3JVZBl+gckrENjOCyaCh07GbGb6HSVKDB9d3jyoPM47arJOE3yWbZJkGxo56P6E
         UwXiLZiI5ORVxUle3tx4905pk29/nbjMM6WosNaovwPJkskc27Nb6qLZw/p3b+syrfhA
         6EZOMgT/7GpI48cexqo+NVmmeFeYSZeTHPgPDg9EHBERSrmoUD4xcR1TSdf4cv59STSK
         kgzPbUPMotwnWYOGu8R/fxj57Tpq7Rw1Ywbxs9arL510VdlrKH6VQxPFXBd/nBNiUGuD
         qHlV8gfu77LzH+H2ACjVl+Z4U9JojJjahRsriJ1iP75dXFDFthEQlUQUjLIw9Yft3+1b
         Sq2g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=agOxeMqP;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 00721157ae682-71515c01726sor62445797b3.4.2025.07.01.03.17.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 01 Jul 2025 03:17:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=agOxeMqP;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751365020; x=1751969820; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/EZGFydrDXJBrz0DVvdE/jHAvcnNcUyTdefYv3idd5Q=;
        b=agOxeMqPmBJvAWRyhTUP4jVOKSHj3PG7xNeSs4Q9SkQifFmnwjhDMQ2gWceyz9xabq
         aqw956zRXE+hdV20xxydsI4UU5stEf6cb6B0CgGq1ZahgIPCfQpe7E3wul+0aFepQ2WQ
         mblCkEK+tvYjWZUi6nn5VeJs/uWHDCWC0hY+/o1hDDoqed/XCgSPpTfi0qbrwvagXB/i
         9YmCv73nHdgK14gTdetnECdDrxJs/hGQtfhvk/hFWmhIspqROYl3zRwByDonJNKN1l/w
         92zzdiVXaFFK9o8xrDV1aFzQZkNw9y2V/T350H5Q5hP8HvcK9AYlIEJr3reFrW1KJNDf
         V9mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751365020; x=1751969820;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/EZGFydrDXJBrz0DVvdE/jHAvcnNcUyTdefYv3idd5Q=;
        b=Yomf99rt9vEsqSLm+fl7xnDBKh8BC/8AU9aKdrnkQZcBnsXBg3cGaphlAw5CJD9SlZ
         xYTz6QtxWiXxyzGG94YaA35/EPbC9F9SBwGHw1pjUej9C9HmyF2LdLilxGDeXeYaz/ke
         rAFNeHSkkf4Ho5Vrj3p7hoDly2M464mcSezin83tX66rCq/ke7uU1t/nDe/BEHMNElp3
         6EoxPX2QNxkj6vpJ+i9vtWpdI+JfkPbV5cBk7/99tgD8aUHaMG0Qmir2fFNLXht91WG8
         8FCmbBhgaDGwAb3rKB11tQ/4yfsiYScd9KpBoavLALyy1/j+ozpe0YaC0pxjTwoKJxQD
         Lu5g==
X-Forwarded-Encrypted: i=1; AJvYcCUz/vsrrY5rUcZW1vT25AeUGHxzd+YczCGkU3jSgVx1QD0Ol7D8NRVzWJM/gtAvkcRl66wbu+p1dg0Rjg==@linaro.org
X-Gm-Message-State: AOJu0YxgWjBSvTUza1SWf0fP3Sju4zWVydrSv6VCBCWe5YlQIzaQW492
	gFPgU52LdWxb8EHBUgRuf0t4EemmFKWroCsZnwOJGUT6eZFP6ovZkxO7G9m0/zol8sG41fULnlB
	dwUJy7xmyoZwyfCo7JLFv6vKkJErpkzz0lOLiNk/MeqGX3I7uAfiu5nk=
X-Gm-Gg: ASbGncuDomG6s8AnJNkR8uEcVU5Vx5stHmB9+woBT0IQTbSKg08cdQZt1vAlBKnZN4s
	ws+q1yh2MRXdRVaLeB6zSZCO0VQFdWcATcIAJLERA/RkHqosNbGGu5/9Jw0IA7ETDm2Z4jgM4r8
	s2d2MY90G58y/l73yH/R3vsmHHvOXXW8/UvHPoih/UiGIi
X-Google-Smtp-Source: AGHT+IHaev1eooza1tvFqNELJSxTEWCpDaYkpuMurhT9txvR+eF996nXRUAaSLtmrPa7B4Hk+87ADuca53LAipHLb58=
X-Received: by 2002:a05:690c:4901:b0:710:ebdb:83d3 with SMTP id
 00721157ae682-7151713eb30mr235674297b3.8.1751365020417; Tue, 01 Jul 2025
 03:17:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250623121845.7214-1-philmd@linaro.org>
In-Reply-To: <20250623121845.7214-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Jul 2025 11:16:49 +0100
X-Gm-Features: Ac12FXyxBi2YNUaZLCDi3EC5J8pKLHPxbd-OCNyqfbGXsAeITXA5VEa44a42DSs
Message-ID: <CAFEAcA_hD_8XjMU+xdXM6ez-O8xmQtSddFLUA1j4JhstmJTFFQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/26] arm: Fixes and preparatory cleanups for split-accel
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Leif Lindholm <leif.lindholm@oss.qualcomm.com>, 
	qemu-arm@nongnu.org, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Roman Bolshakov <rbolshakov@ddn.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Alexander Graf <agraf@csgraf.de>, Bernhard Beschow <shentey@gmail.com>, John Snow <jsnow@redhat.com>, 
	Thomas Huth <thuth@redhat.com>, =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	kvm@vger.kernel.org, Eric Auger <eric.auger@redhat.com>, 
	Cameron Esfahani <dirty@apple.com>, Cleber Rosa <crosa@redhat.com>, 
	Radoslaw Biernacki <rad@semihalf.com>, Phil Dennis-Jordan <phil@philjordan.eu>, 
	Richard Henderson <richard.henderson@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: Pbd4775/7GpG

On Mon, 23 Jun 2025 at 13:18, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Only the last patch is missing review (#26)
>
> Since v2:
> - Addressed thuth review comments
>
> Since v1:
> - Addressed rth's review comments
>
> Omnibus series of ARM-related patches (noticed during the
> "split accel" PoC work).
>
> - Usual prototypes cleanups
> - Check TCG for EL2/EL3 features (and not !KVM or !HVF)
> - Improve HVF debugging
> - Correct HVF 'dtb_compatible' value for Linux
> - Fix HVF GTimer frequency (My M1 hardware has 24 MHz)
>   (this implies accel/ rework w.r.t. QDev vCPU REALIZE)
> - Expand functional tests w.r.t. HVF
>
> Regards,
>
> Phil.

Hi; I've applied these to target-arm.next:

> Philippe Mathieu-Daud=C3=A9 (26):
>   target/arm: Remove arm_handle_psci_call() stub
>   target/arm: Reduce arm_cpu_post_init() declaration scope
>   target/arm: Unify gen_exception_internal()
>   target/arm/hvf: Directly re-lock BQL after hv_vcpu_run()
>   target/arm/hvf: Trace hv_vcpu_run() failures
>   accel/hvf: Trace VM memory mapping
>   target/arm/hvf: Log $pc in hvf_unknown_hvc() trace event
>   target/arm: Correct KVM & HVF dtb_compatible value
>   target/arm/hvf: Pass @target_el argument to hvf_raise_exception()
>   target/arm: Restrict system register properties to system binary
>   hw/arm/virt: Only require TCG || QTest to use TrustZone
>   hw/arm/virt: Only require TCG || QTest to use virtualization extension
>   hw/arm/virt: Rename cpu_post_init() -> post_cpus_gic_realized()
>   hw/arm/sbsa-ref: Tidy up use of RAMLIMIT_GB definition
>   tests/functional: Set sbsa-ref machine type in each test function
>   tests/functional: Restrict nested Aarch64 Xen test to TCG
>   tests/functional: Require TCG to run Aarch64 imx8mp-evk test
>   tests/functional: Add hvf_available() helper
>   tests/functional: Expand Aarch64 SMMU tests to run on HVF accelerator

Where I haven't picked up a patch it doesn't mean I'm
rejecting it, just that I don't have time to think through
the more complicated ones this week, and I wanted to at least
take the easy patches to reduce the size of your patchset.

-- PMM
