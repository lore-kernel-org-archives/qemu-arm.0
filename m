Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3253688dye;
        Tue, 1 Jul 2025 08:50:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUduFuep5NRkgaFfS9HAa8sPu/QVbe6O+Pt7WBjSNi6E7t8lyr1SYPPlmwkDY5F/nyD2IvZkBehffH/SA==@linaro.org
X-Received: by 2002:a05:690c:6284:b0:70c:b958:9fbb with SMTP id 00721157ae682-71517150e74mr259331107b3.4.1751385026315;
        Tue, 01 Jul 2025 08:50:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751385026; cv=none;
        d=google.com; s=arc-20240605;
        b=THrEq1dQwU/qgVqNm6ETb2bx3FPdUzb92mFrEHdfdOgv7G4HNChtB0uByrBR4CBGyO
         kZIwaBCrspSCD3cCPc1L0F19p+dYG5V6JT9umSoGk0A1xTc/I1XcHOCcIBmqhYEdHB1D
         jOmDnR4LURwekLBLE+sPeCk0HLeY6c4rmW3c3OAQGadYY6eMIyZogQkAnezcTUO27+Cp
         F22yjQK1oTMNHprS9BfytxLGGVWxILK7+tuzFkmYq9gEzX1Flvp+jvW24f801YzlcHN2
         tmSDpkxvpETkvBKbkqwFc37aLFRtyw7HHZm7o3XkctXv9z2nwL+7aByqvpF2A2sfeoFP
         kUOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NM0m9m6FgXQhqUCQOzdMmZYVj23cYKuGezzGfv9F+qE=;
        fh=sAM3btnl5dfDd2oKrP9ifda/l+nQVYHliVWuw9Lt7q8=;
        b=gEJrfJA43I24kW8ixWICHib/nYQ93j9gaaGt5uxWn0WXxDU5h6txterEcsxbK4JUew
         Bxa3V2GP8PkFA514MLkxbZRXiE90Q+X/QG73//46Tw0ALyqt4Jy1tZCCgt5dLy23ZLp/
         kK90aALI2TAnvE+8htuGRhntI4rsIrsI5/jPH1dWm3CWEVc7YLy9h1VTC0gMe0cWPyHf
         SSluAjNDV69gt6zjVbZccJTHspMLoqP0MKP0HOiS1y+nHCWErVFZA2G3Wkto74MG7Jut
         +IU0t0/OcoagGwqxuNOuTS6seQzpb+2p+U0sEwf8NPZyH2XRFm0T2/qpSdsnRM1xGk8u
         j+7Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=g7jBRf5r;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 00721157ae682-71515be778esor60674277b3.3.2025.07.01.08.50.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 01 Jul 2025 08:50:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=g7jBRf5r;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751385026; x=1751989826; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NM0m9m6FgXQhqUCQOzdMmZYVj23cYKuGezzGfv9F+qE=;
        b=g7jBRf5rU32l+ysM0fhxqmebOS0e7UeDEq/PAV8ulkwZ8i3OgA1Ek9AchP+sqSUqp9
         idHVpS67CNlhaFz2fl8/XVQwj7nLEncjW7nk1IapN90oYf7shZ70T60vT4CpkRLCoaTO
         s0A2dmv5X/wAL+a06OMGjaV8j4gPzF7nyWIkN2Ba7uzK5F4QAJo6ujbyEa1aCNBzTc+G
         yF/X7HU0rVEUqmupY+j9uCv1CMppQWsMuPeSrJZ7z803+fyfwnvgAqB3YcwQ5ehmpmDu
         mOuq2M3KU05hjM5HxgEXNAcChjU/5ZPXH8K+AwIF8ed3VwDX9VWwyM+TAtxoSVKadLxl
         rZhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751385026; x=1751989826;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NM0m9m6FgXQhqUCQOzdMmZYVj23cYKuGezzGfv9F+qE=;
        b=xCMDRgIeTJuIWcS2PWOtaDehTZRBz+IV7lsK4pAPS9O4yVYqqaEYlYvBqQPV3ZrVQz
         /BTyNUlTMWwsMW6E/ppo4zYt5k/jxF1pb/ElgX1+VE9bl13yyDbT2Y1j1yWvmfWf+qUf
         CFIiP2qy9mcBu96/GvpE9Q+fI+T3sMNS1v5EqznH1ec6oem/aBCZj4L4JJJCSyF04wZA
         0Nt71YhH6IlcPKvbymvKkaNuYsIu7HRx5WzxdAEykxF8vOxINcf39H8bNmSXu2q8qOuM
         XPkAmHQoqzq13VcvlwBaD8GRu6hE5269FwwDN64VFUg5d5wHkOflQ/YVLmrCLxQ4ujR+
         6IFw==
X-Forwarded-Encrypted: i=1; AJvYcCXK7aDeMcXNTQZenuygJfXUseHXhe5zr2iCcit96ay7QL9MilUlTaBtNM/n1PT0cCIBnWwMLQMkCPMsPA==@linaro.org
X-Gm-Message-State: AOJu0Yw/7UNSJaMaynoN9HQ9KjbgP3YrJaqMG1Z/jADqN0nczDr74ej1
	q+FbKjckuzuKL8UAHCCqaTm+6lqWeu1W4UJYCUn4+PTrKkvPv2EliJLXCEfh+y+5ES4gnMqrLo7
	htLdD+o5dlsurzIZAYumdASizoLx3njLD7NIcRuViCiLe
X-Gm-Gg: ASbGncvKMywb8cUTgTH4fuGgG3tElxdohtK90TScAa4YfkFF2CBzgUz2q+DubdqdFKw
	nKEBeanoRymMP1CZwJ9hl3uCZK/coVDXHn7h/5zftOD90DWk1CguJ0w2RaiDajuGhOltzuz6l/J
	4KIv5XZ812Sq8CQp6RwPT9PbtJMV3yBkL0/jOMprrvtCBG
X-Google-Smtp-Source: AGHT+IGGy1LiWLJoul/YG8YZ7v1W37zVJZeUDsvzCu+RNL4TBiAeiTy/45xc5PzZQdt8W81oQJcvdTJMl4dmlwVX3uo=
X-Received: by 2002:a05:690c:1e:b0:70f:6ec6:62b2 with SMTP id
 00721157ae682-71517150f8emr253657857b3.8.1751385025700; Tue, 01 Jul 2025
 08:50:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250623121845.7214-1-philmd@linaro.org> <20250623121845.7214-26-philmd@linaro.org>
In-Reply-To: <20250623121845.7214-26-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Jul 2025 16:50:14 +0100
X-Gm-Features: Ac12FXxbbgcWVCUlees7q4LLOO8nBn3R6BKx2RlRYHRfsfQHSIdewGI2EN-Bf0M
Message-ID: <CAFEAcA9MLMJBFk+PQCJT8Bd+6R+vaho9_vXmDCjPU5cp6B7LfQ@mail.gmail.com>
Subject: Re: [PATCH v3 25/26] tests/functional: Add hvf_available() helper
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
X-TUID: XIM5TEaScz0l

On Mon, 23 Jun 2025 at 13:20, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> ---
>  python/qemu/utils/__init__.py          | 2 +-
>  python/qemu/utils/accel.py             | 8 ++++++++
>  tests/functional/qemu_test/testcase.py | 6 ++++--
>  3 files changed, 13 insertions(+), 3 deletions(-)

This seems to trigger errors in the check-python-minreqs job:
https://gitlab.com/pm215/qemu/-/jobs/10529051338

Log file "stdout" content for test "01-tests/flake8.sh" (FAIL):
qemu/utils/__init__.py:26:1: F401 '.accel.hvf_available' imported but unuse=
d
qemu/utils/accel.py:86:1: E302 expected 2 blank lines, found 1
Log file "stderr" content for test "01-tests/flake8.sh" (FAIL):
Log file "stdout" content for test "04-tests/isort.sh" (FAIL):
ERROR: /builds/pm215/qemu/python/qemu/utils/__init__.py Imports are
incorrectly sorted and/or formatted.

I'll see if I can fix this up locally. (The missing blank line
is easy; I think probably hvf_available needs to be in the
__all__ =3D () list in __init__.py like kvm_available and
tcg_available. Not sure about the incorrectly-sorted warning.)

-- PMM
