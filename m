Received: by 10.28.4.212 with SMTP id 203csp972336wme;
        Thu, 10 May 2018 05:49:15 -0700 (PDT)
X-Received: by 2002:aca:af83:: with SMTP id y125-v6mr630447oie.274.1525956555524;
        Thu, 10 May 2018 05:49:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525956555; cv=none;
        d=google.com; s=arc-20160816;
        b=V/bKEiiKHvF3V7sB+QJDBfPVnVOGVNksWe3766UtpoMmA/4Aqc3Th9okN9yfbjIRcs
         BIEtaGoBrAwFrrzc2UL8E3eK4MjVCXt4nd+GLaG2stPhacCiX0YeZ4cuEUdJQXZBrxfN
         lY+XqaQ8ICDuIA8QDTCSooVEEmq34rM5VLabswlXuLQhIp/IsIVQnDEIvWK2c0UgNKnc
         A4CZ7jWCgdZwjEZwa9i3h+bNZ8OcVSz0sCJdHFI1LBoXCstuPXDQDC6sE3NsgHfsb9K/
         DCDPRza8jf6AxS4R/IDpwStqO1Dz7XE8bNe+DBpP+usXO6M8WAuRa4ZHI/4k1Ksmh3FH
         KYtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=UIVE42cBLBq+maiYU+3o4QBssqpCSh7ejPhwuyqQMrM=;
        b=KVdlbzEWEMBiL/mbqOEIG2dnuArHfuTnZigJankGLU8kD4pExMoFVJBUKwSubFmuDk
         xAe/C/IYtlsyZMH4qmHjUh3R9uOR/6KKSw93LvA/bLgN2FIzFvc5C9S8BAQfuNxaefuG
         8eok4DmdlsdyHniSl6MXIRCjNGUnLYcYkY7nTmCjyf6f6mH4BCQY7EYWWC25Q+2w23Wl
         kRxX/mB6EMJ5N6klOag1VlsrCRGeGv/jMgQ6/db3UeEFbsP0eDE+AXRDnPMsUdgA2W31
         adK40JELuSzRqVeGneZhmJmUGATDQ+A/KWhVggHvrlfXLh7Arom4sdqwFEzhRzRa3WPi
         ZolQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Xyo8Akyg;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id h82-v6sor295454oif.206.2018.05.10.05.49.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 10 May 2018 05:49:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Xyo8Akyg;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=UIVE42cBLBq+maiYU+3o4QBssqpCSh7ejPhwuyqQMrM=;
        b=Xyo8AkygaCIwRc/u7hx0jOTDXRPmVLS0Y8fHRPgiaBc7Anb0Wf3tWm52HXjRLmfpA9
         w1tLZJrCxhF9x+lSGfl7Cde9JwJkXHH1BOABfsmMYLcikB/Wr3zkbVqE179RY1yjT00z
         g/5Tfk+raRD9Hu35RNra50iXr9fcocjNOrICg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=UIVE42cBLBq+maiYU+3o4QBssqpCSh7ejPhwuyqQMrM=;
        b=Uz5rKiSKOy01qnyl0yZVOV8YxL53wOT91RyHN+/F7xzxse3ELX/rxoapqWbvl9Gseg
         Er0eW8wEU7uMH82yqSOmaVTjXkVbDyZP6P0aRlxGUWVwv9uBaTHrV/fM3m+H7YI2Izmo
         YjhEwwOCgk9/5AD+yjxnAp8lMkNO8VpRK2bB9qVFjb2zxVPwnsp0wKcEajGSrgPy37o0
         TvaVVwQdpBMG4eeCdycfArpSwoU6NotIKGdyOkCN6KLszNtEZRUpdCju1k/aGUGo/E/n
         IwddgRTvSs62vh17UfpvcGNdXSnaTSaqfT5ykWxEWPZ9nAGmtrCNS94JCzAZ7hi2fXyr
         giFA==
X-Gm-Message-State: ALKqPwd1UcWYtXkZSkUmot4KV7AT1TMxUgLCtHyRVKYSmF8OU4VbnFAJ
	cmayjr0Tjee1vhb5AzEp4TLxmfHCuPeq4gl0gT7K18k3puM=
X-Google-Smtp-Source: AB8JxZonPPdJW4E9xME2d1F/GXhYq48NrQyxWl/ioRIF1Zxa1qIQCSybZEVm4HeqDq+bRORNX4SSeh+dolPeI6pOBRE=
X-Received: by 2002:aca:4ac7:: with SMTP id x190-v6mr622395oia.11.1525956555009;
 Thu, 10 May 2018 05:49:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Thu, 10 May 2018 05:48:54
 -0700 (PDT)
In-Reply-To: <20180510094206.15354-3-alex.bennee@linaro.org>
References: <20180510094206.15354-1-alex.bennee@linaro.org> <20180510094206.15354-3-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 May 2018 13:48:54 +0100
Message-ID: <CAFEAcA_8OCa_gCWzhTNhWAoabCVVNoNiN9H7zbJ1=6KJAFveSA@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] fpu/softfloat: re-factor float to float conversions
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, Aurelien Jarno <aurelien@aurel32.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: iTXnb2kQ3hii

On 10 May 2018 at 10:42, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
> This allows us to delete a lot of additional boilerplate code which is
> no longer needed. Currently the ieee flag is ignored (everything is
> assumed to be ieee). Handling for ARM AHP will be in the next patch.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
> ---
> v2
>   - pass FloatFmt to float_to_float instead of sizes
>   - split AHP handling to another patch
>   - use rth's suggested re-packing (+ setting .exp)
> v3
>   - also rm extractFloat16Sign
> ---
>  fpu/softfloat-specialize.h |  40 ----
>  fpu/softfloat.c            | 452 +++++++------------------------------
>  include/fpu/softfloat.h    |   8 +-
>  3 files changed, 88 insertions(+), 412 deletions(-)

This introduces a regression where we don't get tininess-before-rounding
for double/single to halfprec conversions. This is because we're
now using the fp_status_f16 status field, and it has not had
the detect_tininess setting initialized. This fixes it:

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index d175c5e94f..7939c6b8ae 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -324,6 +324,8 @@ static void arm_cpu_reset(CPUState *s)
                               &env->vfp.fp_status);
     set_float_detect_tininess(float_tininess_before_rounding,
                               &env->vfp.standard_fp_status);
+    set_float_detect_tininess(float_tininess_before_rounding,
+                              &env->vfp.fp_status_f16);
 #ifndef CONFIG_USER_ONLY
     if (kvm_enabled()) {
         kvm_arm_reset_vcpu(cpu);

(You can see this if you try something like fcvt h1, d0 where
d0 =3D=3D 0x3f0f_ffff_ffff_ffff -- we get the right answer of 0x0400
but fail to set Underflow as well as Inexact.)

thanks
-- PMM
