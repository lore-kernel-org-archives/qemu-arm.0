Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp3846077wru;
        Tue, 2 Jul 2019 07:09:08 -0700 (PDT)
X-Received: by 2002:aca:5346:: with SMTP id h67mr2857981oib.55.1562076548283;
        Tue, 02 Jul 2019 07:09:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562076548; cv=none;
        d=google.com; s=arc-20160816;
        b=SE8JkT6ir6F2Lhe8uyxdVgWcUtQIUnz/LfkBGY88T7+xFozhaa7ZJa1PkAdZfRi+BY
         IFQOrJnqu197E5TrxwB0kMwxm0csFPCAdlYfGmETX6f/quzB/OnANHfTnLoe3Iil1tYR
         DSJbiG3axFTX5kV0UKKabF4oPqFpV8DQny/97o8h4syzWdWG9Jw5PZjKmFv4nF3jwnLC
         cTqaCiSTheAeN9xJfVPaUQrouwGG76CVKpQrq9qwwIwiFl9hEf6WEZSYNWAfj2XQOyaD
         HF0xzNRBA8Yyg7s4uFU0b7GDebWoFVGRKzQhRfYlpq3rvCQrNzo4r9Hs+FVUCmt4bK52
         komg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LTF46dlc0fdDFj+3L9HfFQ+Er5FxSGY3PKYs9cDf+p8=;
        b=aQiejfqYZnRnrevc/rxpu89eyebyh1vkUhmzVcreCqSJjbx3ncgZpAIovaSctEjhg8
         tOkXqGLn8jxsPzdsmQkEcPc1CpMqidXnHZvayOyjMKKpPXINqhO9E6cVkwYATUy2I/0z
         fjxh+vYk7Qmipah8Fl5XvMCyXrCYRi3zPVBIzCBRwOZNVrwpYeG97FfGEEyyRseM1S/T
         PCYlLTSqpAw9E0vZZeFltnaT7Hkswc+0aslXBQPbwPRn0l0qcH0ZAAWgbzj+eiv20e0H
         jWnU7Os0q4VNHpfXbjPaqB9zUr91+PFXKjGf65DDFjQXtiznEDA2vrvNUMubqAg5l+TK
         jw2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i3wGTlNk;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 42sor6960102otf.49.2019.07.02.07.09.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 02 Jul 2019 07:09:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i3wGTlNk;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=LTF46dlc0fdDFj+3L9HfFQ+Er5FxSGY3PKYs9cDf+p8=;
        b=i3wGTlNkWJxrCEK797uUktKMffpYgMPgoluCUYhp3Wx9bvSCwNaOLI7KvRUIO6MfNc
         2NErLDrHhy3/RywlogXGblgKK7l/GoW7a8QZLtyW7D0xNIgHMAn+Gis3y2oEYyZNrmZx
         erBbOY+N4JtqVGMFgetkAZkjkLVPsP6dJvwpUaD4sKWBI2p99LSEZlMYrvxWWGEF0fBY
         L2Xv8hJCcwpF80dlVQ/D3+5Y6PbKGbpKE5+KUJEIh9+G/Ugy/WphhsE2LpUXoL40TngE
         j1h0xUlw2BK2Qk3YvTBGJEHqaB01RRkaOJ6IljddZL0HxkOIu8lz0MAxg0ftV4koTKdz
         s3ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=LTF46dlc0fdDFj+3L9HfFQ+Er5FxSGY3PKYs9cDf+p8=;
        b=o2uzOn5RYs4ah/sbrW4JcTrNRbzDEyFCvBkmsO5WkVmFKTnQSBpmY8F2I4p+xkoRz7
         q9cva17Qf7EH2Uuv/y9s9gzVQT2iuNoFVu/J2DR580QyEzaWoXud5Q3LdIcCkI25wWrR
         4hAf7eN16oI/i8VON+UPlBGSclpm2bbyFHBohSz8qlm7Bhx/sXLy5lXoAhnDrHhXUTHX
         sNAP5QiiwUVBF9Qx0e2Kzn2QQFo7s0dWFDaWmbh36A24pcJoo/8FFytKc2noWA34jCXn
         TnXl26UyIOyPlVmJ9yAQjaR8pXiwYgSnkCdXsdyFTQjyAUOEC02v3WUAixVMBp7G+LXU
         13XA==
X-Gm-Message-State: APjAAAV0wuj9Te/+9AisQCIEtsGGsEBjN8Jo9Xt+glMigoebwfJQiPjg
	e+qs2l2nEp6RUItKpad1uEcdFyrz+R3GsZBIJ0EQPpcb
X-Google-Smtp-Source: APXvYqydQ3Hb0FNoifyjtVeG5EvJYroH5Qsh0uFNhtxG3ulY/ksuo6+MlP60gXY/nFYkFJnnDdP9bguD9c7iUGliGsU=
X-Received: by 2002:a9d:7245:: with SMTP id a5mr2867511otk.232.1562076547890;
 Tue, 02 Jul 2019 07:09:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190701194942.10092-1-philmd@redhat.com>
In-Reply-To: <20190701194942.10092-1-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Jul 2019 15:08:57 +0100
Message-ID: <CAFEAcA_bWHAe_aoaN1+1RFm3zEvAxmzQtVm1zbatJHG_+CgqmA@mail.gmail.com>
Subject: Re: [PATCH v4 0/8] Support disabling TCG on ARM
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Samuel Ortiz <sameo@linux.intel.com>, Rob Bradford <robert.bradford@intel.com>, 
	qemu-arm <qemu-arm@nongnu.org>, Andrew Jones <drjones@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Yang Zhong <yang.zhong@intel.com>, 
	Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 32l78BSL5rdB

On Mon, 1 Jul 2019 at 20:49, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com=
> wrote:
>
> Paolo motived me to salvage this (other!) previous series fromi
> Samuel Ortiz (NEMU project).
>
> v1 cover from Samuel [1]:
>
>   This patchset allows for building and running ARM targets with TCG
>   disabled. It splits the target/arm/helper.c file into logical TCG and
>   non TCG dependent files so that one can build and run QEMU binaries wit=
h
>   or without TCG enabled.
>
>   The rationale behind this work comes from the NEMU project where we're
>   trying to only support x86 and ARM 64-bit architectures, without
>   including the TCG code base. We can only do so if we can build and run
>   ARM binaries with TCG disabled.
>
> v2: https://lists.gnu.org/archive/html/qemu-devel/2019-06/msg03271.html
>
> Most of the patches from v1 got adapted, except the "Move all
> interrupt handlers" patch, because Peter disagreed with it.
> See threads:
>  https://lists.gnu.org/archive/html/qemu-devel/2018-11/msg03908.html
>  https://lists.gnu.org/archive/html/qemu-devel/2019-05/msg07304.html
> Anyway this is not a blocking issue, and can be done once this series
> get merged.
>
> v3: http://mid.mail-archive.com/20190701132516.26392-1-philmd@redhat.com
> - Addressed Alex's review comments from v2.
> - added RFC patches to remove (pre-v7, M-profile, R-profile) from KVM-onl=
y build
>
> v4:
> - patches 1-12, 14-17, 19-21 accepted, rebased on target-arm.next
> - addressed Peter's comment (described in each patch).
> Based-on: target-arm.next
>
> $ git backport-diff -u v3 -r target-arm.next..v4
> Key:
> [----] : patches are identical
> [####] : number of functional differences between upstream/downstream pat=
ch
> [down] : patch is downstream-only
> The flags [FC] indicate (F)unctional and (C)ontextual differences, respec=
tively
>
> 001/8:[0048] [FC] 'target/arm: Move debug routines to debug_helper.c'
> 002/8:[0004] [FC] 'target/arm: Restrict semi-hosting to TCG'
> 003/8:[0027] [FC] 'target/arm/helper: Move M profile routines to m_helper=
.c'
> 004/8:[----] [--] 'RFC target/arm: Restrict pre-ARMv7 cpus to TCG'
> 005/8:[----] [--] 'RFC target/arm: Do not build pre-ARMv7 cpus when using=
 KVM'
> 006/8:[----] [--] 'RFC target/arm: Restrict R and M profiles to TCG'
> 007/8:[----] [--] 'RFC target/arm: Do not build A/M-profile cpus when usi=
ng KVM'
> 008/8:[----] [--] 'target/arm: Do not build TCG objects when TCG is off'

I'm going to apply patches 1 and 2 to target-arm.next for rc0 (since
2 is helpful to redhat downstream and taking 1 now reduces the
amount of code-movement patches you'll need to rebase). Patch 3
doesn't compile and 4-8 are rfc.

thanks
-- PMM
