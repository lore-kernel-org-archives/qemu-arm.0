Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3275351dye;
        Tue, 1 Jul 2025 09:22:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUpv2wNIGJopvxuNdaMyCqeFJkBm4AYxliOH+qFRu3m/9htADRw7hRuPwClVYVbJu9vtYnYiKbIHHwofg==@linaro.org
X-Received: by 2002:a05:690c:6383:b0:712:c55c:4e5c with SMTP id 00721157ae682-7163ee697a8mr63815467b3.5.1751386925328;
        Tue, 01 Jul 2025 09:22:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751386925; cv=none;
        d=google.com; s=arc-20240605;
        b=Kn32egP2i2/zueVV/JNV9dKC6UJ9OZu5j42fYWjCDcmjC4XP97ww6ikp1PDwHl4iIS
         VTrK2orQjSj4YzJnREMJvcmI56lOr0c/TK/OtGWs6B9O+QKqC153Fd7oow5UffnokCOw
         OaucPf36Iku+uk8fWlGzfb5cmyVonmZS17tI69ncP51Orf92EBkxr91JookPe120fnar
         PRV7kY19/u0AYSDCdGhdn9q+JctbyFadnsOkWuVilG8fj1ObtdTWi9cY+uw6RU/fbIWy
         wjmpX+sXCiweZE3E03YGOJuZmPMe9m0Cush10EWTwPhBr1KK3Lp6ZFX/U+Ad03FgUrCV
         c4Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8ExA9I6n9mEFV/h0Xvk4Dw216G4bffe2efKYjgHrqHg=;
        fh=9FEQ5MQRgg0aExGeDp97YtbuJIYkE8GxqGmif9Sw0tE=;
        b=ev7rggjKIHe32CB5IQlNF3PlQEmALWRfuSbXd1U9nOBGljtgJwAwm7C28TkSCJCTA2
         NnliW0X+J2iF2jyNcOQ9iqH9EKRx/JGfGKfGOoYklVLNmitqwjliTiIY9R4xqqmZ8h98
         ioW3laESv0b4UQ1nyVyjcHStFWrk5f2ACjqLHY2pO8VnmQpMQfdi3o2DyKnpuZ2q9Unh
         Fqc8GVS71ouELYNCui2/TODtJbBqsNoOmX74qtOgDphH1k63062yio+MCTaVFKpfayFQ
         d7myKJ1grLYR3e+x81V0CHZhtiT15sVWE07ulB2QZhJzsAobdOBm8gkd3xLIxEW0wwiv
         x4aA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VVqRjrEL;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 00721157ae682-71515c6f639sor53168167b3.5.2025.07.01.09.22.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 01 Jul 2025 09:22:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VVqRjrEL;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751386925; x=1751991725; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ExA9I6n9mEFV/h0Xvk4Dw216G4bffe2efKYjgHrqHg=;
        b=VVqRjrELAGQTz17MUH4VBnnW0JWUhXcpWknaIOqmvLVLVxxgS+1YeMhPWmLhdhFcXa
         DOZhNjyZ4vL9OuhiuhJjJHiiBo0wXpMIUigAqo+cR9aYw/14Jd556YL8x9ioxcrkjFWZ
         Ftt92azvgrBWqUAxDZrSoghZ39wNS/ps/yaFMlnbounyf/PZLid8ZfRlMyJuigBNghEH
         msRAKTQPIc3Q+S+h3b/RUb6Wi21LMCmkHoeccKeZSrC0lcAF7DWjP06h0Ibo1szl3Wzx
         TJ4Np/qETWjijiGJ+iI3iThSwMAc+xtFQM0sqiaVKizuVEdwrZ6wgBm3tgGSQz+mqoy8
         Nmmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751386925; x=1751991725;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ExA9I6n9mEFV/h0Xvk4Dw216G4bffe2efKYjgHrqHg=;
        b=wEb/yGgFEf3HTOBgVgzteZJ/r3LFWQcoGbLmfluwuR9O67l83Bk+LXTgTjzfxgPIUn
         EU2dMnLd4S6000MyeYWG51OeRFFJUE1xFw6CjTq2cTPNxdSOPiRr/RxcoDAd5yUWttQf
         7cNQoLQEXUGCtL0q4K4UX2LmoKVYUF9pjtHgctp2T3KuLjMMk3ijJn5VGQgaVho0HEm/
         m234GZtoq5Q3I6SPwUWcyWTdKy/Y0AmtDMC6DT1+4G6VGHg5o7xoI7F69evJLDF912/5
         ITTZn3+IcktcrP8CBWnyfHRXzoGeBoJHaJ3XP8Q1jWrJwITHg2k8MC/R0ClWb2YE58lW
         weVA==
X-Forwarded-Encrypted: i=1; AJvYcCVNFkYtcPsvuHRIx85HHlFn4PvcYFZWxZxthRYj7AC/zpWrPq3kojCzb/YBT2yVmMcCcB88canl34qudg==@linaro.org
X-Gm-Message-State: AOJu0Ywr9TACakQVgbBNTbY85KajWNu3ekRXOS/MsaipgJzqA2UH9v+o
	q2ggHyfjaCxRA7z419SCHnIzp5F+ihggN9lwQMH6OpZc7zRY0fXlWC3dAzEedOBSFsMQ57/fGfd
	FommNGHWX7j0qEVVttfHBW4pRfw3yc4z5kZ+YRNVUBKHT
X-Gm-Gg: ASbGncu8pFbLMq5OHDxdCHUWZdDD2VJ5LwQfKkYfQlSEKfy/osyYDSoXTGVxEPYRQ9G
	683G9Qd5BP3duBfjO1jsFzyFtNoE7BAczT8AX4yBXaM4TSG6s/koWSbsHInssl+iMy73ifieJ3+
	AEUO6ZE2m4mhOY/avbSgPBH//P02gBvr5CNaPuROooutpa
X-Google-Smtp-Source: AGHT+IGIclKVjViD0WW3iV4YwGI3dhj48xyfWmiyY3aBzOAs9kfGDc0yU1Ej0pH1/RrI6013XX48ffAzkmY9zk2fHf0=
X-Received: by 2002:a05:690c:700e:b0:70f:8830:809c with SMTP id
 00721157ae682-7163ee96597mr60163237b3.12.1751386924710; Tue, 01 Jul 2025
 09:22:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250623121845.7214-1-philmd@linaro.org> <20250623121845.7214-26-philmd@linaro.org>
 <CAFEAcA9MLMJBFk+PQCJT8Bd+6R+vaho9_vXmDCjPU5cp6B7LfQ@mail.gmail.com>
In-Reply-To: <CAFEAcA9MLMJBFk+PQCJT8Bd+6R+vaho9_vXmDCjPU5cp6B7LfQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Jul 2025 17:21:53 +0100
X-Gm-Features: Ac12FXzEimJKLq31uljceBjRMKAA4MUmsh56mOzsO1SwCyld8EJ-MmtJd7PAg0s
Message-ID: <CAFEAcA_=Jo5aDsKHjNwz7DNAqoS7iGDudSEvbjYVhcEZ9P+keQ@mail.gmail.com>
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
X-TUID: nbkRhEKirAAq

On Tue, 1 Jul 2025 at 16:50, Peter Maydell <peter.maydell@linaro.org> wrote=
:
>
> On Mon, 23 Jun 2025 at 13:20, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.=
org> wrote:
> >
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> > Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> > Reviewed-by: Thomas Huth <thuth@redhat.com>
> > ---
> >  python/qemu/utils/__init__.py          | 2 +-
> >  python/qemu/utils/accel.py             | 8 ++++++++
> >  tests/functional/qemu_test/testcase.py | 6 ++++--
> >  3 files changed, 13 insertions(+), 3 deletions(-)
>
> This seems to trigger errors in the check-python-minreqs job:
> https://gitlab.com/pm215/qemu/-/jobs/10529051338
>
> Log file "stdout" content for test "01-tests/flake8.sh" (FAIL):
> qemu/utils/__init__.py:26:1: F401 '.accel.hvf_available' imported but unu=
sed
> qemu/utils/accel.py:86:1: E302 expected 2 blank lines, found 1
> Log file "stderr" content for test "01-tests/flake8.sh" (FAIL):
> Log file "stdout" content for test "04-tests/isort.sh" (FAIL):
> ERROR: /builds/pm215/qemu/python/qemu/utils/__init__.py Imports are
> incorrectly sorted and/or formatted.
>
> I'll see if I can fix this up locally. (The missing blank line
> is easy; I think probably hvf_available needs to be in the
> __all__ =3D () list in __init__.py like kvm_available and
> tcg_available. Not sure about the incorrectly-sorted warning.)

Squashing this in fixed things. I guess that going from three
imports to four makes the linter want you to list them one
per line...

diff --git a/python/qemu/utils/__init__.py b/python/qemu/utils/__init__.py
index d2fe5db223c..be5daa83634 100644
--- a/python/qemu/utils/__init__.py
+++ b/python/qemu/utils/__init__.py
@@ -23,13 +23,19 @@
 from typing import Optional

 # pylint: disable=3Dimport-error
-from .accel import hvf_available, kvm_available, list_accel, tcg_available
+from .accel import (
+    hvf_available,
+    kvm_available,
+    list_accel,
+    tcg_available,
+)


 __all__ =3D (
     'VerboseProcessError',
     'add_visual_margin',
     'get_info_usernet_hostfwd_port',
+    'hvf_available',
     'kvm_available',
     'list_accel',
     'tcg_available',
diff --git a/python/qemu/utils/accel.py b/python/qemu/utils/accel.py
index 376d1e30005..f915b646692 100644
--- a/python/qemu/utils/accel.py
+++ b/python/qemu/utils/accel.py
@@ -83,6 +83,7 @@ def tcg_available(qemu_bin: str) -> bool:
     """
     return 'tcg' in list_accel(qemu_bin)

+
 def hvf_available(qemu_bin: str) -> bool:
     """
     Check if HVF is available.


-- PMM
