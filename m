Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3041556dye;
        Tue, 1 Jul 2025 03:05:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUPahECZ9Q+lYJaKHtDemXaEjIgmVt0UCJLBvt+e6Uq9/cxbu4mY7tlhsmeverGslf8u4TAIRqMukpp4Q==@linaro.org
X-Received: by 2002:a05:690c:6907:b0:6fb:1f78:d9ee with SMTP id 00721157ae682-71517169b48mr254886647b3.15.1751364330425;
        Tue, 01 Jul 2025 03:05:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751364330; cv=none;
        d=google.com; s=arc-20240605;
        b=UjYpbKSHkp8yE1LmIc7ldDn8fpaJBRs9DHBWuACRYVbGI3jnh019quKGwfzDCKbn4+
         /9OlNhjelSOb9MBwiIY2vAEwbjXo8ei+Ib9waX2zNdxwwBYtqwW75zuuRZUVUu97Pr+e
         O4yr6CXQ06mZgx9z13zxT6MK9H7lduxc9wVp9YETS9fIwG3b4A6392gMtq/RvZ/OwGoC
         fOuMHAsaCwknnujPFGUAlA4dNUIlsbuLZsYB8LJj82xJAJJpUaHwG6rFDhEGyOoWT+IA
         QbYhGMkpFdTbKLH5XXhROVOOhzYsKdTsby+QFyd1qVFU75AQOHAo2CfIOuH01lwzwMuc
         q0Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8kfjRtLV5ssMj94wMWxrtiAx9c7qnsX2Z+NOkWxYACI=;
        fh=+vqT8KBRzTgkK+vjHQGPEYy7sOHWyLGleEtjQeVmWvY=;
        b=X/bWdbqMmvoxLLMbXpScXaqP+d3ZH6Lct9Mc0lE2BU0MNJRzXiVXMKGc2wz1RSKe8U
         2iT+bsjnFn7sgo/9yB3dl8tNZNsYlLJK8D+Hj8bb1xCrADmRlmt3IKYgB+hfdeSbfz8D
         F0PdWGaxxm81GYkFw0V7L79Hohzcs61y9NV7gR2S1A7r2Kh7J/KzizwG5pxSMm3LRFcl
         L4k7aRqQTmJK9fm+sMdouAj9ufa6+K/x0qJNpj+GFG8hHx1uymyfQtG+YjigPOs4KTCO
         nS5ze0e2ldVcAUeBjAnuvWVTe/tGppxvQCTFlEEuxczYwhf4b7aVyYllkcDLIuxWV1mM
         L9Lw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qNhmXJp0;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 00721157ae682-71515cc20e7sor54360597b3.13.2025.07.01.03.05.30
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 01 Jul 2025 03:05:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qNhmXJp0;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751364330; x=1751969130; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8kfjRtLV5ssMj94wMWxrtiAx9c7qnsX2Z+NOkWxYACI=;
        b=qNhmXJp0wMrswyDRADg79251B8Y9PFFg0Q6C0f7fm9WHU3krPJhQ+q/inentiZqU0J
         dPZ0FEy0GvzmrqEVhUMKsXIL7mCcTZ3/bqV4Mq+R+PmOvWbKkNcaf/K//jYpy497+LVy
         fn7uAfr9dfmFGWsFK3UODZ3AM3VCjeFW/BXyqKnF2pzm38EupRIk+ZRx5/uyVWk4ZjQR
         PoMWF1QoUK35TcYStrQqsxQTJzMVlpsH4TaOQSU8ks6z2FM1bKPFZmKup34OK3vvs3xv
         hNiRN/EJXWT4iI4JUHBpNwOO2s8zCB9wmD+tveJ5X4Ibypzc4Qs2shYgwcDoiDaRRNNX
         36lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751364330; x=1751969130;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8kfjRtLV5ssMj94wMWxrtiAx9c7qnsX2Z+NOkWxYACI=;
        b=AT45e6HeIuYUHHBygdGalH1Re1AoMDXPj/DsvmRif/sKd8tZeqG2iwXdO/75Ni5Aty
         0V6Q1C7082OfKzp6L+xvzpIMLBY2u0jYNmeI3TvrhsBhqiE4TlI2SX87buMvNWf20rHc
         3bR+INjFCSOBAtdXquL2AcfhHN5yTXmrtTYDVHOkBTRgeqs5nuKCQ5hxz+u3xHymeqrc
         2wqodWKDQnuts2dzy3JPBb3B4fMYTBcz7yUmIB41lqhMh9pw6dqbv/pyIWFWTE5zhpA5
         v2qGtnTef/Y0qQh5n8T3ZY2ZIUB3U9qogbXxgOU/eNmGqJtI5pRuMCHFd0YnJd1g/tvQ
         duAg==
X-Forwarded-Encrypted: i=1; AJvYcCVWY80fnxIyHXH/tySF1O+d6R569lNVR+f+C/QYjel5r73ZoqrNi3gh7C5saf7cHsYyjT00BM4JEoc/bQ==@linaro.org
X-Gm-Message-State: AOJu0YzN0WJmUjlppl+5uK360VljQzvlt9rFkvS+RYJrcTi5mA3HNZcO
	fTKL2Z9Ul/rg+SbraN3lleYUn8KVMzwBt5Vdl9zKmNSG3ju7mdmdxDSDKRRE6S7CLCM4Ld1Vswq
	LJz8Wz/iNSEW+44qAX1UFTO49/qGadzRO1a5hdbtn5Ykn
X-Gm-Gg: ASbGncuEyNMPIxk/CmG+SKZGjpmEOu4sWPvB3xVzRCdymNzX33RDCEJIjz3NEVVcH9w
	f1RDyHD+FQR7SmTccXJJQdTwQPHdrcnCpGmDFLE/wo4NA3d3inDVYegzU1J2NZAa2TGzJJ9nyP/
	JfLzM+lcuyEr49oBHK7JHtkyBBHSH5BEK/vwo+YfMqmtHt
X-Google-Smtp-Source: AGHT+IGOpIzUKfVZ51suWX9MeleA4XpykzcLNH+i6xXehvun3Xncgjy5GjPloXM/LCbq34wBW2AkLyClhKEvOdHIBxM=
X-Received: by 2002:a05:690c:6109:b0:711:9770:161f with SMTP id
 00721157ae682-7151715b6f0mr247333597b3.2.1751364329873; Tue, 01 Jul 2025
 03:05:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250623121845.7214-1-philmd@linaro.org> <20250623121845.7214-19-philmd@linaro.org>
In-Reply-To: <20250623121845.7214-19-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Jul 2025 11:05:18 +0100
X-Gm-Features: Ac12FXwOiStkTc29Xq_uInkklsV0tTSFUxB5oz_6xMzY-cgZwTpqcNIDDEe6VkY
Message-ID: <CAFEAcA_M+nXYL5HaN7QUUwWywJw8VaxU3T54YCMQsVd42PQ+PA@mail.gmail.com>
Subject: Re: [PATCH v3 18/26] hw/arm/virt: Only require TCG || QTest to use TrustZone
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
X-TUID: aw7ZQscVK+xV

On Mon, 23 Jun 2025 at 13:20, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> We only need TCG (or QTest) to use TrustZone, whether
> KVM or HVF are used is not relevant.
>
> Reported-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  hw/arm/virt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 99fde5836c9..b49d8579161 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2203,7 +2203,7 @@ static void machvirt_init(MachineState *machine)
>          exit(1);
>      }
>
> -    if (vms->secure && (kvm_enabled() || hvf_enabled())) {
> +    if (vms->secure && !tcg_enabled() && !qtest_enabled()) {
>          error_report("mach-virt: %s does not support providing "
>                       "Security extensions (TrustZone) to the guest CPU",
>                       current_accel_name());

The change is fine, but the commit message is odd. You
only get to pick one accelerator. The reason for preferring
"fail unless accelerator A or B" over "fail if accelerator
C or D" is that if/when we add a new accelerator type E
we want the default to be "fail". Then the person implementing
the new accelerator can add E to the accept-list if they
implement support for an EL3 guest.

For the not-yet-implemented case of a hybrid hvf+TCG
accelerator, it's not clear what to do: in some cases
where we check the accelerator type you'll want it to
act like TCG, and sometimes like hvf.

I'll take these patches, with an updated commit message.

-- PMM
