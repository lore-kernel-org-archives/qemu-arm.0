Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp321436lfe;
        Mon, 16 Mar 2020 10:11:54 -0700 (PDT)
X-Received: by 2002:aca:ed4b:: with SMTP id l72mr361474oih.95.1584378714368;
        Mon, 16 Mar 2020 10:11:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584378714; cv=none;
        d=google.com; s=arc-20160816;
        b=D9P4Xm0WWsjUgk1dEydp0E/dYTbOJHzdrHc+qTLjzwW2RxS+VDtKb5iWsDGEoCkUjw
         sHCt2oPFBWe4S4874b3e4f1TYPtpVOLqL4PaYpjJ3z9bpb7bKcY5QgbAQFWolh6oFstJ
         BV61Jeh4FBNBKsKzVEHIB1+6dWfoVJDbjREf/61ZP9iZ5ZDdMdxGRsbfqkFLPVdfzA4E
         hKi3lhNe7EPc7IN4uh8YsVEPEGYbRdot76h0yj0LguuFLo/acjr90GF9StgQU9Dzx0Zl
         PZGaRGAfAYv2I3eUZjM+Le9eYvv+hpMmAjhyQMlcPlqpi0pQQcDEf6hPdWXuVAUkLWkh
         iE1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jGqYMRdq+LB8A/GFfRTKfqhbPMZ1y7l+2Nofeb6biR4=;
        b=Z9MB9XGFhRR7bg07qdcG0ZoeNkz5s84JG/YlsiSs0MprJi/2Ym/OKxLLyWsvIAH/ll
         7eOWlR8dw4Mht0/laL3j65CAOGR9qbiWBTKgl6jtUy7N5uJ0qAKqorlJjkbgna+WvQfH
         JYZCK23tlZn9vO1oARv7Piiulo3v6kZQV8is35yrQ0oE5mNzK2dp3wHC4rDsrTADrnSU
         hPC3R2tOBIGi90PC0GcmS1AgWsHzTWmk9BcFtNYJphiuGHEZCvKuG/mjQnGrWbxKGOUE
         jb/1s88Q83Xf5R/rUgh/cvgwXNMEhSG6uKuZJ2DEqP79hT1tX2tYeZaeaz6o+7Y+dA3s
         R4cQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YgKbCK4v;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id j93sor178524otj.71.2020.03.16.10.11.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 16 Mar 2020 10:11:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YgKbCK4v;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=jGqYMRdq+LB8A/GFfRTKfqhbPMZ1y7l+2Nofeb6biR4=;
        b=YgKbCK4v/DosAcCr/gjPFUczjd0OmJ6Veyb2qjAruXqGF0EJ02OTVJzlie+LQ4hVRz
         PcDTuEcM9JGw0OH6X88OF/7/08IgrgIoBSyEqJNBcHGkedrd/XCo6ZfD/6DLSgv0LHLH
         ExwvxF5F0Yh1n31FAGH8drqhnJ/ULGamjlBRsJF6KJc0WaKZoDhriC0e+sSNex2TqYi9
         5gDBQgPTFLTDkndw5EiVuHRmwH1LHd7W3E5PP+ChyixvqS1KtqN1r6j2Uq0JiycTup5i
         TgpHYGMOxC0BB+bJl3IsVqsqtRjVLppyFw2N+w4y9Eb+2n0Ct75Q3H2bk+88FA87Sdh0
         Wdog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=jGqYMRdq+LB8A/GFfRTKfqhbPMZ1y7l+2Nofeb6biR4=;
        b=ZKj5F62s2ZLv/F/876SkLAPs5hLeZiUJyCOn/tGhPsMiyqHKfjixVG7H79dSJ523Xl
         mg5JtE/pqAJ7Tb+L+KBvI+UDz89eMgf9T8azLaInt0fmY7TI+/B5e0md+WGkAwBxCM+4
         vpmqjSxcnxXiCjpZbN++MTWORBLXJ5IDQ7OCUfquYsNEKOoftZvJtE9RFF3zq5es13mQ
         gQnLSSdfjoyD5xn5bsdvMo0aD+6mq0qQK6c70xzF4ZR+3kZu55j869GWbyCSDBUN9+kH
         UdQ3j4p0zp9HRwAtNDK6p2nWn9EYwxJdHJ4/D5YclyuFOy+hTPNWBqy00dWAuTeVtE29
         jnqQ==
X-Gm-Message-State: ANhLgQ2RqFUEIxc9ofNVWz4abX4GoUOpLclnZDfYpKqwp1x6qOL0eY2/
	b3hK6oxYPkfzhM5ri0gqaUhX/tcUQ7RYXXnQ+X6hkA3r
X-Google-Smtp-Source: ADFU+vvoWGysq3r5lRnRM5NKLd1UWK0pjHyrPiNZU34PNJZFCmSxBRDw8Ugb5d9gZs9dpVzqX8nq0ix0va8GcoCMtHM=
X-Received: by 2002:a9d:1d43:: with SMTP id m61mr213922otm.91.1584378713933;
 Mon, 16 Mar 2020 10:11:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200316160634.3386-1-philmd@redhat.com> <20200316160634.3386-19-philmd@redhat.com>
In-Reply-To: <20200316160634.3386-19-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Mar 2020 17:11:42 +0000
Message-ID: <CAFEAcA_bXb_RZFxMSYJ8FAoAahAxrq3c0PBzidu+Z0iXTzZqFw@mail.gmail.com>
Subject: Re: [PATCH v3 18/19] hw/arm: Do not build to 'virt' machine on Xen
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	kvm-devel <kvm@vger.kernel.org>, Thomas Huth <thuth@redhat.com>, qemu-arm <qemu-arm@nongnu.org>, 
	Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>, 
	Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, 
	"open list:X86" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: JxRAa8gq8CGi

On Mon, 16 Mar 2020 at 16:08, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> Xen on ARM does not use QEMU machines [*]. Disable the 'virt'
> machine there to avoid odd errors such:
>
>     CC      i386-softmmu/hw/cpu/a15mpcore.o
>   hw/cpu/a15mpcore.c:28:10: fatal error: kvm_arm.h: No such file or direc=
tory
>
> [*] https://wiki.xenproject.org/wiki/Xen_ARM_with_Virtualization_Extensio=
ns#Use_of_qemu-system-i386_on_ARM
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Anthony Perard <anthony.perard@citrix.com>
> Cc: Paul Durrant <paul@xen.org>
> Cc: xen-devel@lists.xenproject.org
> ---
>  hw/arm/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 8e801cd15f..69a8e30125 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -1,5 +1,6 @@
>  config ARM_VIRT
>      bool
> +    depends on !XEN
>      default y if KVM
>      imply PCI_DEVICES
>      imply TEST_DEVICES
> --

This seems odd to me:
(1) the error message you quote is for a15mpcore.c, not virt.c
(2) shouldn't this be prevented by something saying "don't build
guest architecture X boards into Y-softmmu", rather than a specific
flag for a specific arm board ?

thanks
-- PMM
