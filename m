Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp366411ejb;
        Thu, 30 Nov 2023 08:41:56 -0800 (PST)
X-Received: by 2002:a17:906:10dc:b0:a04:a0c4:ccef with SMTP id v28-20020a17090610dc00b00a04a0c4ccefmr4299ejv.15.1701362460538;
        Thu, 30 Nov 2023 08:41:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701362460; cv=none;
        d=google.com; s=arc-20160816;
        b=qNAJCyQgc6ehrlHH5lPGGLrH5dAauNwdE8epRq7Hh/z5x8kfzys+FyMnCzHIjFtMIh
         LGWG5mALzbJeIN4kz3mEbEk38PlwPspEatKDwRQnZu8v3ApTRK2b6UM6cXCrdhS2gcEq
         ckU3z1RDmhjRbzhxi6LGU3QjL75x7ffVN3yWwvOcZV6od0Avrq7js0Ji5LpB+tkmG6x0
         jBcNZbaau/d7VUYWuKJ1kx2uMt2ernDcWWQm74Wz12rqexB1OMmfyw6we+2fdJXY9VWJ
         N7jfyTcmdbq9V0PSaeV0JEhA5mnxKeG0BUOMxZ9ILKKvKEZRBo//qv4yOgsiHJ54xPVL
         1OKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MsyXXDyAXykqAjb/T5ppI8uWl8n1qg1OdjdBH8wm6vM=;
        fh=KXlCWWG7aBb2aj/DNrpGlo0gIoAzmZghEaeXBP5GrTE=;
        b=eALYxK108JsJEFAXmDn51fSbohfaxogvVJOTfUsTKRF/pI6lsTMzVYrd0h/GL9AqUh
         SqIh1hrqbmBxhYfGPrtJKJ01RdvoIuIWItl4Dcd8JiTUf40wtBNcUwaJ9rke4DOfAiqK
         svhLPp+W5peYD7gUMxhaeYAVG8bQvQlFB3no7AhTsnVe5j2xq4Xx6HlX21XD+Fm1qcvE
         cEOflc6zOApXaRQHUoDCjgeuvhkFeXUl0W3LtIWcCH2uTDC522wwzp0dzG2spUbI9qxM
         1wPJgm+6HwGsbNRSG99A7PXKhV6Q+V/43/l28MZoeKfKW+6zvJsH/+4zxWmvz6GjzPQL
         qugQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lbrzeU1C;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id n3-20020a056512310300b0050aa01f9064sor33656lfb.5.2023.11.30.08.40.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 30 Nov 2023 08:41:00 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lbrzeU1C;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701362459; x=1701967259; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MsyXXDyAXykqAjb/T5ppI8uWl8n1qg1OdjdBH8wm6vM=;
        b=lbrzeU1CZi6i9Cpan2bJ3wURxFaYTFyVqRW7xHUI56A5L6WAAxnhs8xkpQv5C+o3Gu
         fkPXNx3umjYCm40N6+HXgBtGL4+Mukj1Xi6o1x81kHg6WtzA2clL30Py+leT/QnP8b32
         H+L5luSI3GJZmwuB3W/w8RYEh+xmyFXN55+UTXR33cV8y/Rg/Yg7avWqRWnUbj2eQ46D
         5B71VrtYJhuNXDD0E1VRE7h15TGb+pliksIaWvKqUvNpQZFMy6kV81zmyezX/Kr8Co14
         QPk16wnDULPBF+PDuaXn0wh+KDPFpjfosVD6Uzevb8fHIUalG/WSrAXvjJ51XkQdJJFO
         +dUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701362459; x=1701967259;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MsyXXDyAXykqAjb/T5ppI8uWl8n1qg1OdjdBH8wm6vM=;
        b=Zw/uEAyz4d6Nu/UmM+jz0aNGotC6KWcNSv2v4KlbOY+k9Ufwtalx+RZkm9QGNfM5jq
         JOCDwKRCtcAG9b4O/FjYvJA/HcP+m+/uj/8+pJ0qHPGSI4KoI22a1bdFuOGgu7OlAuXZ
         yPwH1DNQNZZ4vj/N7EIUAJcP7zyinJEw7M9iH+FN4HNxU5iovzghTmCRHCG4HvdFK+R1
         cQCPSACKQCwCQB7On3Rapnh5M7seYOxSh3mXU9p6c6EWMQEQns1A8E2BoEDceulcTT/j
         TmKuQW0IiZ98cA+0wxg47P2gsYMK1vH/9uBGuRwt7BcrEeg5pC8eP23xHZLsPF+R8ZNK
         kg0A==
X-Gm-Message-State: AOJu0YyzHIp1PCi84GAi6PhsDwsrFooaq62jhql43Hsr1wIvbYaUEwO0
	Sjc+lsxsLcjeO7M0geMQojBLOamRyNxjV9l8rUHFrai1UUAXy7V/U/M=
X-Google-Smtp-Source: AGHT+IF3dMS9Rz9iWdac9/jkopgixoCg+pfD2O2LRP9BgWEweDkPEs3TYPbT8vO9wh368SMFVj/Mil+AEPo7wy4CtVU=
X-Received: by 2002:a05:6402:f19:b0:54b:4067:6278 with SMTP id
 i25-20020a0564020f1900b0054b40676278mr27922eda.26.1701362418461; Thu, 30 Nov
 2023 08:40:18 -0800 (PST)
MIME-Version: 1.0
References: <20231130153333.2424775-1-alex.bennee@linaro.org> <20231130153333.2424775-3-alex.bennee@linaro.org>
In-Reply-To: <20231130153333.2424775-3-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Nov 2023 16:40:06 +0000
Message-ID: <CAFEAcA91HawkhdxmQmz-+t1favfWmzJCpgAy6xr_1+AEomEXNg@mail.gmail.com>
Subject: Re: [PATCH 2/3] docs/devel: rationalise unstable gitlab tests under FLAKY_TESTS
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Eric Farman <farman@linux.ibm.com>, 
	Cleber Rosa <crosa@redhat.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Wainer dos Santos Moschetta <wainersm@redhat.com>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
	Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org, 
	Halil Pasic <pasic@linux.ibm.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, 
	Aurelien Jarno <aurelien@aurel32.net>, qemu-s390x@nongnu.org, 
	Beraldo Leal <bleal@redhat.com>, Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: t78TGFwibUsi

On Thu, 30 Nov 2023 at 15:33, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> It doesn't make sense to have two classes of flaky tests. While it may
> take the constrained environment of CI to trigger failures easily it
> doesn't mean they don't occasionally happen on developer machines. As
> CI is the gating factor to passing there is no point developers
> running the tests locally anyway unless they are trying to fix things.
>
> While we are at it update the language in the docs to discourage the
> QEMU_TEST_FLAKY_TESTS becoming a permanent solution.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  docs/devel/testing.rst                   | 31 +++++++++++++++---------
>  tests/avocado/boot_linux.py              |  8 +++---
>  tests/avocado/boot_linux_console.py      |  5 ++--
>  tests/avocado/intel_iommu.py             |  5 ++--
>  tests/avocado/linux_initrd.py            |  5 ++--
>  tests/avocado/machine_aspeed.py          |  8 +++---
>  tests/avocado/machine_mips_malta.py      |  8 +++---
>  tests/avocado/machine_rx_gdbsim.py       |  8 +++---
>  tests/avocado/machine_s390_ccw_virtio.py |  2 +-
>  tests/avocado/replay_kernel.py           |  5 ++--
>  tests/avocado/reverse_debugging.py       | 14 +++++++----
>  tests/avocado/smmu.py                    |  5 ++--
>  tests/avocado/tuxrun_baselines.py        |  4 +--
>  13 files changed, 67 insertions(+), 41 deletions(-)
>
> diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
> index 22218dbedb..579d1837e0 100644
> --- a/docs/devel/testing.rst
> +++ b/docs/devel/testing.rst
> @@ -1371,23 +1371,32 @@ conditions. For example, tests that take longer t=
o execute when QEMU is
>  compiled with debug flags. Therefore, the ``AVOCADO_TIMEOUT_EXPECTED`` v=
ariable
>  has been used to determine whether those tests should run or not.
>
> -GITLAB_CI
> -^^^^^^^^^
> -A number of tests are flagged to not run on the GitLab CI. Usually becau=
se
> -they proved to the flaky or there are constraints on the CI environment =
which
> -would make them fail. If you encounter a similar situation then use that
> -variable as shown on the code snippet below to skip the test:
> +QEMU_TEST_FLAKY_TESTS
> +^^^^^^^^^^^^^^^^^^^^^
> +Some tests are not working reliably and thus are disabled by default.
> +This includes tests that don't run reliably on GitLab's CI which
> +usually expose real issues that are rarely seen on developer machines
> +due to the constraints of the CI environment. If you encounter a
> +similar situation then mark the test as shown on the code snippet
> +below:
>
>  .. code::
>
> -  @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
> +  @skipUnless(os.getenv('QEMU_TEST_FLAKY_TESTS'), 'Test is unstable on G=
itLab')
>    def test(self):
>        do_something()

Can we also say here that when marking a test as flaky:
 * we should raise a github issue giving details of what goes wrong
 * the URL of that issue should be in a comment above the @skipUnless
   line ?

That way we have a history of why we disabled the test and we
might even manage to fix it some day, in which case we'll know
we are able to unmark it as flaky...

> +To run such tests locally you will need to set the environment
> +variable. For example:
> +
> +.. code::
> +
> +   env QEMU_TEST_FLAKY_TESTS=3D1 ./pyvenv/bin/avocado run \
> +      tests/avocado/boot_linux.py:BootLinuxPPC64.test_pseries_tcg

The "env" here is unnecessary (assuming a standard Posix shell);
"VAR=3Dvalue foo" will run "foo" with VAR set to 'value' only
for the duration of that command.

thanks
-- PMM
