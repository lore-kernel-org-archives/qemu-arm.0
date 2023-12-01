Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp978526ejb;
        Fri, 1 Dec 2023 05:30:13 -0800 (PST)
X-Received: by 2002:a05:6870:390b:b0:1fa:3e47:5a8e with SMTP id b11-20020a056870390b00b001fa3e475a8emr20748042oap.5.1701437413226;
        Fri, 01 Dec 2023 05:30:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701437413; cv=none;
        d=google.com; s=arc-20160816;
        b=zNEmJHTUvCzDZOns3vz5s3iPTPGMRhXnmJUiWxxizLQkk1gjwh4imKI08omdn6Hcla
         GTI4BS6TBKAkvvyYaDzGhRQaw025398NrjM0CAjHfarIIfyddsd554iBPxyBMo8DObBC
         x9KQ5MsAXYHFie1KobResVB5B8cBZShjYHpHiktI3TqVxyPBwcD1FIWlbQJAtqKbjnPM
         fCpDPnxcGX5u4ItSCuK67JP1e9E6GhVaCnWZC4EFAfvZyi1mC+M4J7/2Bfz7CErLAPaw
         SSBaiiaDdeuerHbzJ1imnXleBOtEYJx1Xnbr0whXZ8VCQJxQSB5rq6MFLNlFkfuBhSVM
         0fSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MH+NVr5dvJ1pbj6ZslFfay8kvyZdy3CtR1L09cAHFFU=;
        fh=wTZd+Z0WDJ7xYrWzR3kZlnY/s+PFWdhwM14WlVO0IhI=;
        b=DSMPimgO2v3nXl9x5OlE+hFS2B6gRum2QsEtO7AKuU4UImVzz4vWqCXXcHez2NSZA7
         DmmJtRzswmovZD10DcmSLaFBcIfQhxkxycUyLrlCqNIHxNNCiZnBoDlJouOgS4zYLrSq
         nEuI/oDCOVdHntYTCUT/OJkvRqwRvI+yjcOA3AppUYKDdAdLHOR8dZ7KSPhnRz6aNuPC
         QiHgBYQO11Cse9a/PbeIq308MbTC6wDQ0b3SSAyzhmlGqr5zmN9eeQg/WkC1pvYcJ6qg
         +rN4LYmtgqGZ9xGQzlIruSiRZMSPHiDWQrDgX36M9LZNfJ2oqKeDdg7J6LKUgVlNw1Ip
         Iluw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=I+53P7GC;
       spf=pass (google.com: domain of stefanha@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=stefanha@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <stefanha@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id eg41-20020a05687098a900b001fa901f26edsor428676oab.1.2023.12.01.05.30.13
        (Google Transport Security);
        Fri, 01 Dec 2023 05:30:13 -0800 (PST)
Received-SPF: pass (google.com: domain of stefanha@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=I+53P7GC;
       spf=pass (google.com: domain of stefanha@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=stefanha@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701437413; x=1702042213; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MH+NVr5dvJ1pbj6ZslFfay8kvyZdy3CtR1L09cAHFFU=;
        b=I+53P7GC8/CdqDospTNBPOEXAPZjQ9QuhF2QF7aUotVgcQJ/lvK2dbltAOpMp8FTPv
         TzWsYIM0PtBOFNv5brtTOHJK095F8LVx3dELWjw9ns/TsFP+hf+4V98weLTBsbdeB/yH
         f5vlRAuF3gXf2/91bf7XQgywgKJAFnpxzM39uIPoWTtN69kqYQAlvVBr+OUOBIp+HWZb
         i934fcLQGUNq5biZkak1GOsJ1y2n22pzJmcdNQTJTjasfybiOQlkAjgrBzSAn5ppm0e2
         jw2+NONOBgNpCqnXBHWYGqWUG8HrPrXExzyio+AOMT/bqk4HdRqjHXZahBb2VGWGfPeb
         kIuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701437413; x=1702042213;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MH+NVr5dvJ1pbj6ZslFfay8kvyZdy3CtR1L09cAHFFU=;
        b=dR1md7uxGy0Sbmnqiyhbwqe2UsbQOkHq7Bx2LFE44xLR1Ij8kOeuJ4mBa/R+TpP93t
         xpr/pN9VdQRvu/et5bs2e4YLZP1M8bDTOtF0c8jJ9kEpEgkqinbLUTaME9DUPre+GF1t
         3ddTxqgTj22474hCLl6WT9EISjf7BqOhlm1VZdyAVD9RaFxtTRa6boUU/lJMlLpdt4g7
         oUlgBvxa6q37yJZb6/uHcKCjinVLLwKMsoYs4Q7778mFKZZFLzcQ/H9xKwfOOQGwLk+Z
         Gg8Gpul8jE9bydPOcZuBf0O+AZF8xQ+LZIZ7kAe0w5SZlhjs0/7ZfXN0g2K8NTxqwNsZ
         QTqg==
X-Gm-Message-State: AOJu0Ywi0u1nTSti94S+HwkT5/h8vRWVsRIWIgoWb4fhcUmpZXifpflU
	jL5uF38nfnfdQ7q+vI+LNlJchTT5dZaIpLukypZohCli
X-Google-Smtp-Source: AGHT+IHXTtOeEYVzJ0MUB5wDmesbCYgLew+qvlkXJnbvzcyd1lqJsAFa3O7z82jRVvwWfOtpRp0Cgl2i1zs78AypaqQ=
X-Received: by 2002:a05:6870:7d01:b0:1fa:f387:e0a1 with SMTP id
 os1-20020a0568707d0100b001faf387e0a1mr1270505oab.9.1701437412780; Fri, 01 Dec
 2023 05:30:12 -0800 (PST)
MIME-Version: 1.0
References: <20231201093633.2551497-1-alex.bennee@linaro.org>
In-Reply-To: <20231201093633.2551497-1-alex.bennee@linaro.org>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Fri, 1 Dec 2023 08:30:00 -0500
Message-ID: <CAJSP0QUzOOinLjVBPak-j4pLoBeaAQX5XFET+7W9JUnrxkNvNA@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] final fixes for 8.2
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Eric Farman <farman@linux.ibm.com>, 
	Peter Maydell <peter.maydell@linaro.org>, Leif Lindholm <quic_llindhol@quicinc.com>, 
	Beraldo Leal <bleal@redhat.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Paolo Bonzini <pbonzini@redhat.com>, Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, 
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, 
	Radoslaw Biernacki <rad@semihalf.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Eric Auger <eric.auger@redhat.com>, Halil Pasic <pasic@linux.ibm.com>, qemu-s390x@nongnu.org, 
	Wainer dos Santos Moschetta <wainersm@redhat.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Aurelien Jarno <aurelien@aurel32.net>, 
	Cleber Rosa <crosa@redhat.com>, Joel Stanley <joel@jms.id.au>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: J23WibAS/ZS0

On Fri, 1 Dec 2023 at 07:56, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> 8.2 is looking fairly stable but I do have one bug fix for gdbstub
> which I came across while debugging something else. The changes for
> avocado rationalise all flaky tests under the QEMU_TEST_FLAKY_TESTS
> environment variable. The final patch re-adds the flaky tests to the
> CI as a manually run allow_fail job so we can still attempt to debug
> their failure in the place they tend to fall over.

Acked-by: Stefan Hajnoczi <stefanha@redhat.com>

>
> v2
> --
>
>   - addressed some review comments
>   - emphasised raising a bug for failing tests
>   - drop some tests now missing assets online
>   - fix wrong microblaze target for tests
>
> The following still need review:
>
>   gitlab: build the correct microblaze target
>   tests/avocado: tag sbsa tests as tcg only
>   tests/avocado: drop malta yamon tests
>   tests/avocado: drop BootLinuxConsole.test_mips_malta_cpio test
>
> Alex.
>
> Alex Benn=C3=A9e (7):
>   gdbstub: use a better signal when we halt for IO reasons
>   docs/devel: rationalise unstable gitlab tests under FLAKY_TESTS
>   tests/avocado: drop BootLinuxConsole.test_mips_malta_cpio test
>   tests/avocado: drop malta yamon tests
>   tests/avocado: tag sbsa tests as tcg only
>   gitlab: build the correct microblaze target
>   gitlab: add optional job to run flaky avocado tests
>
>  docs/devel/testing.rst                   | 32 ++++++++++------
>  gdbstub/internals.h                      |  1 +
>  gdbstub/system.c                         |  2 +-
>  .gitlab-ci.d/buildtest.yml               | 32 +++++++++++++++-
>  tests/avocado/boot_linux.py              | 10 +++--
>  tests/avocado/boot_linux_console.py      | 28 ++------------
>  tests/avocado/intel_iommu.py             |  6 ++-
>  tests/avocado/linux_initrd.py            |  7 +++-
>  tests/avocado/machine_aarch64_sbsaref.py |  1 +
>  tests/avocado/machine_aspeed.py          | 10 +++--
>  tests/avocado/machine_mips_malta.py      | 47 ++++--------------------
>  tests/avocado/machine_rx_gdbsim.py       | 10 +++--
>  tests/avocado/machine_s390_ccw_virtio.py |  3 +-
>  tests/avocado/replay_kernel.py           |  8 +++-
>  tests/avocado/reverse_debugging.py       | 16 +++++---
>  tests/avocado/smmu.py                    |  6 ++-
>  tests/avocado/tuxrun_baselines.py        |  5 ++-
>  17 files changed, 122 insertions(+), 102 deletions(-)
>
> --
> 2.39.2
>
>
