Received: by 2002:ac2:446b:0:0:0:0:0 with SMTP id y11csp611112lfl;
        Tue, 15 Feb 2022 13:51:17 -0800 (PST)
X-Received: by 2002:a05:600c:1e25:: with SMTP id ay37mr741040wmb.119.1644961877602;
        Tue, 15 Feb 2022 13:51:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644961877; cv=none;
        d=google.com; s=arc-20160816;
        b=oCWNtbeV3DkHnVVk7ieuIMCshj2YF4D2PIM5e61WLkjM5db2NIQ1x44VSpYRrs/HOF
         SwLvzF0Jq337HdNziad2pQcNlpI4PlF7t6U/5OxNo/1rHAMBBMdhVA9of3Xfi9yd/EaP
         nv0I3Lg7pTettB2bSiWLFJIRtZgMcm5InuFamLcRde2M82AhMZboLoybpLAZooYd34R1
         MxaGgv75cRFCPSS/QjBqVqB8sTW84n9QUCtUa3sGwJeO9lVnViHYSk3Ne4E235O0keOr
         hGMWKqqqpdgX3cQtjtS/PlELOCvBJXyQf5j6lWFcofNRp8ecng8Dds/4GOd3LSDA4VGE
         b3CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=t36FUEOGpHRINEpA1Sme+7ycuYx9AQNz7yDBT0eXplI=;
        b=xXZgIBXplCfvjBWzpkvx0NhX0cQN2Z8wI9lidQ2878OxorPh4M4H09jUmPCcM9ZbPP
         YaNBfKxLwHbTn/MLGwwbXq5DwjRhDrHhKI03CGaTtzSb89Vbv82zWNtm7ewXNjvgb9FQ
         Rcv9Zn660CokLGN++UKXJVvq7Dob2GS61icYmdtNaNFzk9uQoDzIPzN8SRgn7Hs0iNdz
         /8ruqiYU7NvPKgr9dxZTuNh6nx9t5TY+NPvVAUP+isr4r470uIgiDmtyIwOZ+ENuqZRA
         mrQS5rD4XalviY5IbiTL6+vAv3T6B7BWfHtnVjf0IqGQdU9IxDkzTCqfnQd6OY/MimoA
         XVYw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CqawAyRZ;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u19sor3601346wmq.12.2022.02.15.13.51.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 15 Feb 2022 13:51:17 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CqawAyRZ;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=t36FUEOGpHRINEpA1Sme+7ycuYx9AQNz7yDBT0eXplI=;
        b=CqawAyRZHgHGGBVbj7fj3VY9w7wvfYtoCqXXOqpJ/R+bhIKApoRFjYu3qhqPrm6RzD
         3vIMFhvXNyilH3iowJJNsv8PZd5WC/CmHXHKPDcYicjDh4qDb3s1YlObz7RIcY1M/xYL
         WDLxOZEoCD0syhk1J5VGaS8CgoU13OTyKQOdw6P2iMuXoUBzRBDMe1RzfPYKHYSzkDB9
         GUVTEdlfgIsoQDjv4oAFOqDuW3FBRLm1JQFoG1C/OcziWwdJVjb2R1lQLzCkdQ8N+uvd
         0I4f9yDeQVUk+wpcB+fIhyaJ8EI8uXT0rqLOhkGqvFFqqwovdcW32UMj6kbDWIcqkUS6
         U43w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t36FUEOGpHRINEpA1Sme+7ycuYx9AQNz7yDBT0eXplI=;
        b=C7tBQ0e6u1xRflmXcwgxmGZ+6pGz1eL/rNYOtZ25RM1LbMvAIPyp0BQYTIXYEhAN3V
         PxEca2SBCUo0Wks2Ihhq4e5jPwaHSdwfRJ6HO3hkVUdgjY9diQ8Nv3L9I6iPUnaglb37
         p/dQzHx2Zg1Io+XQb5ukhaqp2HIVGi3rR9YjHVdh0XDT9FlzU2doh6KHCGq3Izx9HI0/
         KFckjdTRGQo1YdDs5xPp7SMyGepPIZaTUVBtYE798N/0hVm1dMpY/1q0Id7DkHC0XLgK
         duT+Om/N20o/Fmuw/Zm0TXFg7ufcAivqMLnFafjs9y+XmcPAJUmPBLRBMFtzAQ2voDir
         6wRw==
X-Gm-Message-State: AOAM530CCX6zLJfBUJ5sSmpJaJzJt4ENI57FiNmnwC830pDedHt1Nenf
	2UDY9oqR+uIu5fwpsawxYAoUs7xolCKdD/QbQIHcCBbn
X-Google-Smtp-Source: ABdhPJxEcFP8I5mD54DGKW4yv/VJl7+tWDl3cLJFiXBblLfnBh5gU6QJ72hTY9ohHeps754qyVXcIEGIEiSFD4ibm+E=
X-Received: by 2002:a05:600c:3d06:b0:37b:a5ea:a61b with SMTP id
 bh6-20020a05600c3d0600b0037ba5eaa61bmr54790wmb.32.1644961877322; Tue, 15 Feb
 2022 13:51:17 -0800 (PST)
MIME-Version: 1.0
References: <20220210040423.95120-1-richard.henderson@linaro.org> <20220210040423.95120-4-richard.henderson@linaro.org>
In-Reply-To: <20220210040423.95120-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Feb 2022 21:51:06 +0000
Message-ID: <CAFEAcA-+CTmcqG1F56miTOixvFVAFfFmyUscByhENp7zNMXx3w@mail.gmail.com>
Subject: Re: [PATCH v2 03/15] target/arm: Fault on invalid TCR_ELx.TxSZ
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
X-TUID: MTrJ1ouThMAv

On Thu, 10 Feb 2022 at 04:04, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Without FEAT_LVA, the behaviour of programming an invalid value
> is IMPLEMENTATION DEFINED.  With FEAT_LVA, programming an invalid
> minimum value requires a Translation fault.
>
> It is most self-consistent to choose to generate the fault always.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v2: Continue to bound in aa64_va_parameters, so that PAuth gets
>     something it can use, but provide a flag for get_phys_addr_lpae
>     to raise a fault.
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
