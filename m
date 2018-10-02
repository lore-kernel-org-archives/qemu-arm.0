Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp4852413wrt;
        Tue, 2 Oct 2018 02:56:02 -0700 (PDT)
X-Received: by 2002:aca:6a48:: with SMTP id f69-v6mr7177283oic.279.1538474162670;
        Tue, 02 Oct 2018 02:56:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538474162; cv=none;
        d=google.com; s=arc-20160816;
        b=ppS2sSOMwygKS2jfjQSazus5oQC7y1RBmzDLlRxGG7DKrJ91WU5c/UMVQY8GCVNFkA
         yGeMcGgPcBccdg8b7Byb89cBPZFqG0cjlgQo56nuTdEjZE3LbjmUb3tiu4i2OVFc4fhz
         QIaFL3LRf5UVZN4nhJXy7BbyFpVEnpcjbhf8Iq1NXg9JoE2H51OCq7/rFJM5a+yzj7zH
         xif/ii0NAHbdUeahP82Y/7IKROoHy+HiP1pBYAE8oF3bZnSkqy4Ke0KtyPsMzarDAxl+
         zaNnqFjJiMy0UCaM3QOTy07D7oscvsgIAW8hZPTuydldPK17HoeOhXDLIK3Lgu7vnwWO
         zxUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=beGdNSORuyDRjf6I4FRpVh5C3emSwtWpVU7uMDiKQs8=;
        b=X7yvzJpzwiJumuK8SkzHtd2uldIJG2L4lTr4QViqvd+EFm/lNeVRiH7O/A+poTC94G
         jCFycDDAmRKiWZ0IWCgQSJy7FHifeut6tBUIJlLk5fDGYuaRJSeItmN8ST0XjQzFdzzw
         Rm9NFdGoyCXL0urm4upV2ZXHtpwhn3GYzaBXrjtOeh2q1sjDpFTs6dx+DfwVspQ2wseq
         8emVCvGob0/riQiG7OygZ18fUql/P1+a7gx0Z1XprB1DgEVDbIdZ5aSTZJRymEKZBrcL
         vw9+mWJecEWMqrv70YUUjQ+ondRc7AudJkuZc9cnp1tUr9Ug7c3OfYi+eRz5W9TKHotE
         Gc4g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="BG/rMjia";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id w192-v6sor365503oif.102.2018.10.02.02.56.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 02 Oct 2018 02:56:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="BG/rMjia";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=beGdNSORuyDRjf6I4FRpVh5C3emSwtWpVU7uMDiKQs8=;
        b=BG/rMjiayOqdiiM4vBv/1Vp5BgZmmNb+dyU25qBIC5CbIdvGI7/R1CbPmy4jOpf8uf
         7sWmbSZp2Obkack82fviBEoKj4exLDxaKfsrLDg3rfUFXtxKQGHkXpS0bIcyhcXNRHHp
         xGYVk6jM8pv+XkKRRh4pEGs8kEcjBDBcTFpp0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=beGdNSORuyDRjf6I4FRpVh5C3emSwtWpVU7uMDiKQs8=;
        b=QmwwL6R8NEoRj322A82fAJgyTkvQ/ATqkkm6O+BrXDm/dVyguWaWIPfA9eu1hvGD6M
         itmHxVkM3eD7RQlHa5CL6EJGaCvlH3yEq58p1WsakLkITBF76exl2UdT6VxTGoLbldY/
         EGUTI9IfxeG+u6+G9l7cgbzanzmX79+MgvKP3nO1DaA2xqT9jloPc1HSkHX/HcqYRR+8
         xdA7e5aYlxpCohL+6NliVergzwZS7DGzFNBtpZRWKp99yKv0mRXFgzvNQRoXDxZ+NOX+
         hTXHbICy62lNnkmErmMJzR63Bbkl793gt3zc9k4V7h8ALrGvDYJh2bxjwhjNY/wRTzNA
         fZmw==
X-Gm-Message-State: ABuFfoicF46djGcd4zJbdt3GBXIAAbO1rNbYJOosEinNQ66bSkAwenPg
	reEJUQSLkEUPvMcZTlPdqOTF/2uBHaxZEshSikzXwtSlchvFCQ==
X-Google-Smtp-Source: ACcGV624syCXj+gJQtzb28vXJzaIu2zhr47Tl+45kvLHRuzOCk8x95KdDhsEOwC5q8n21CbS6cNfTXD2TOSavwXDfAQ=
X-Received: by 2002:aca:3bc1:: with SMTP id i184-v6mr4403554oia.156.1538474162237;
 Tue, 02 Oct 2018 02:56:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:20e3:0:0:0:0:0 with HTTP; Tue, 2 Oct 2018 02:55:41 -0700 (PDT)
In-Reply-To: <20180926112048.17778-3-alex.bennee@linaro.org>
References: <20180926112048.17778-1-alex.bennee@linaro.org> <20180926112048.17778-3-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Oct 2018 10:55:41 +0100
Message-ID: <CAFEAcA-KK6s6DFLHkHQzQAi_Lx-UJ=2E0FaLdfN5m_oR4YgdzA@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] target/arm64: hold BQL when calling do_interrupt()
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Omair Javaid <omair.javaid@linaro.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 5spbFc09o5XG

On 26 September 2018 at 12:20, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
> Fix the assertion failure when running interrupts.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  target/arm/kvm64.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
> index 80ad07ed0c..346e1f1a73 100644
> --- a/target/arm/kvm64.c
> +++ b/target/arm/kvm64.c
> @@ -984,7 +984,9 @@ bool kvm_arm_handle_debug(CPUState *cs, struct kvm_de=
bug_exit_arch *debug_exit)
>      cs->exception_index =3D EXCP_BKPT;
>      env->exception.syndrome =3D debug_exit->hsr;
>      env->exception.vaddress =3D debug_exit->far;
> +    qemu_mutex_lock_iothread();
>      cc->do_interrupt(cs);
> +    qemu_mutex_unlock_iothread();
>
>      return false;
>  }
> --
> 2.17.1

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
