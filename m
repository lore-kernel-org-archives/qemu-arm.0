Received: by 10.25.77.65 with SMTP id a62csp562814lfb;
        Fri, 3 Feb 2017 03:26:17 -0800 (PST)
X-Received: by 10.223.172.210 with SMTP id o76mr11730720wrc.21.1486121177551;
        Fri, 03 Feb 2017 03:26:17 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-wm0-x235.google.com (mail-wm0-x235.google.com. [2a00:1450:400c:c09::235])
        by mx.google.com with ESMTPS id h82si1847638wmh.163.2017.02.03.03.26.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Feb 2017 03:26:17 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c09::235 as permitted sender) client-ip=2a00:1450:400c:c09::235;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c09::235 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: by mail-wm0-x235.google.com with SMTP id v77so23187018wmv.0
        for <alex.bennee@linaro.org>; Fri, 03 Feb 2017 03:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=pLVS6qNxCO50dDNs9pCMHTMC7ac8oLm75IKar43ihTc=;
        b=ZSkdXkOAs6n7cBYBHv+6YwNNwdKpsEx5PIiKUTibrpM6zSn4gRzk3Vbq1JToGSNvwn
         ZOjTK5j8xqyufsHVpwL7xAxvFLvcD5xVnrH++dbiCjmUiMLLoPqs+F8Jgm5vIQtfgA4W
         tDtusaRSnIvWCR+CpoHIJuwAHVR3nBpsGTmps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=pLVS6qNxCO50dDNs9pCMHTMC7ac8oLm75IKar43ihTc=;
        b=sksEA9/1iyaNLUJt23JeMjIC7B89kpuF1ly79SSIist+0YZmTL1CH0qgv0hk1YJEZD
         PVFNmLfTZNBSiy3h49iSUlYGMSlvkLSDD6hLvzCuj69BcnpDvKhexV8mYEjo/Y5VZAE0
         I1sFQhOcjCC/3z+5H3C2DzEeBzNqExEz63NJSiKY8yrKLCG9Kzll+bKFkHc8yMDeNRPo
         Rs8+UGP5WzktVC3YBilogVDb4WQACyto+472rYTQDYj3nRjSU2MLT82vsRXAR5JNVJF5
         VLzAkuK2lypbqaWFdugMmppnUkLq3U+ochBT6E22pWO4O0flqCb00xll2WgjEhNrTFYt
         x1jA==
X-Gm-Message-State: AMke39l2sY9F5JbLoDcmQccWv0Mw0iKkO/mfCncOeEDsJ1YTFcGzITEuqXTQWnlAxDSuUJti9g2Vb3doOSRf+cbrvIw=
X-Received: by 10.28.11.135 with SMTP id 129mr921655wml.111.1486121176912;
 Fri, 03 Feb 2017 03:26:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Fri, 3 Feb 2017 03:25:56 -0800 (PST)
In-Reply-To: <20170201150553.9381-26-alex.bennee@linaro.org>
References: <20170201150553.9381-1-alex.bennee@linaro.org> <20170201150553.9381-26-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Feb 2017 11:25:56 +0000
Message-ID: <CAFEAcA8nAQy4NNZ0RG0wOJ6rQoKz54UN22Z9LL2o2EgMdtpObQ@mail.gmail.com>
Subject: Re: [PATCH v9 25/25] tcg: enable MTTCG by default for ARM on x86 hosts
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: MTTCG Devel <mttcg@listserver.greensocs.com>, QEMU Developers <qemu-devel@nongnu.org>, 
	=?UTF-8?B?S09OUkFEIEZyw6lkw6lyaWM=?= <fred.konrad@greensocs.com>, 
	Alvise Rigo <a.rigo@virtualopensystems.com>, "Emilio G. Cota" <cota@braap.org>, 
	Pranith Kumar <bobby.prani@gmail.com>, Nikunj A Dadhania <nikunj@linux.vnet.ibm.com>, 
	Mark Burton <mark.burton@greensocs.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Fedorov Sergey <serge.fdrv@gmail.com>, 
	Richard Henderson <rth@twiddle.net>, Bamvor Zhang Jian <bamvor.zhangjian@linaro.org>, 
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, "open list:ARM" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: NBKv437fnImG

On 1 February 2017 at 15:05, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
> This enables the multi-threaded system emulation by default for ARMv7
> and ARMv8 guests using the x86_64 TCG backend. This is because on the
> guest side:
>
>   - The ARM translate.c/translate-64.c have been converted to
>     - use MTTCG safe atomic primitives
>     - emit the appropriate barrier ops
>   - The ARM machine has been updated to
>     - hold the BQL when modifying shared cross-vCPU state
>     - defer cpu_reset to async safe work
>
> All the host backends support the barrier and atomic primitives but
> need to provide same-or-better support for normal load/store
> operations.

> diff --git a/cpus.c b/cpus.c
> index e3d9f3fe21..e1b82bcd49 100644
> --- a/cpus.c
> +++ b/cpus.c
> @@ -176,8 +176,8 @@ bool mttcg_enabled;
>
>  static bool check_tcg_memory_orders_compatible(void)
>  {
> -#if defined(TCG_DEFAULT_MO) && defined(TCG_TARGET_DEFAULT_MO)
> -    return (TCG_DEFAULT_MO & ~TCG_TARGET_DEFAULT_MO) =3D=3D 0;
> +#if defined(TCG_GUEST_DEFAULT_MO) && defined(TCG_TARGET_DEFAULT_MO)
> +    return (TCG_GUEST_DEFAULT_MO & ~TCG_TARGET_DEFAULT_MO) =3D=3D 0;

This looks like maybe something that should have been squashed
into an earlier part of the patchset?

>  #else
>      return false;
>  #endif
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index a3c4d07817..0ef31db3e0 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -30,6 +30,9 @@
>  #  define TARGET_LONG_BITS 32
>  #endif
>
> +/* ARM processors have a weak memory model */
> +#define TCG_GUEST_DEFAULT_MO      (0)

Do you need the () ?


That said, if Richard is happy with turning this on then
I'm happy to do so.

Acked-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
