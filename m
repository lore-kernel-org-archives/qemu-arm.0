Received: by 2002:a17:504:1f11:b0:1be9:327d:8ee3 with SMTP id z17csp220436njl;
        Tue, 8 Oct 2024 07:12:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVrKkcgttkF4szRu2FLC37nhWOOajAz/XOv26iw1tAdY16pYKRg2kg05Iq1VF00XXkUglMDBQyVnuELqQ==@linaro.org
X-Received: by 2002:a05:6402:234b:b0:5c2:8249:b2d3 with SMTP id 4fb4d7f45d1cf-5c8d2e75c6amr15502741a12.26.1728396773479;
        Tue, 08 Oct 2024 07:12:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728396773; cv=none;
        d=google.com; s=arc-20240605;
        b=hiwV4SjsIjTuyL4n840NpK80z/40v88ub/MhQK+Uoc6rMhvz1xR4xaRpsUHOKX2pF1
         8HXDTwBjmwh75OReC0d72obGj1JCg++jVzuVys4kSLP0OWav7w+ZFKFF56QJqA3mmY3f
         Lc9KkbD0SqJ0mpHgZB/BzDdMxSB7RYHuDUqWnT9XqaIdA+2W3H929Cu7hMjamsXwkW2z
         XxVOwbCwW5IXwMiXWGaxxbmHPiTqcP0pA9ZxFpzrWIERAlHiVSYCZ3RhLOx0HWFQlveK
         5mt2buzUYxbmD1g/HCnNkjPHDXax95VyqPQjk492sxxOS1CExqVcJ52SdOjH03A+zO+g
         mAow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1lXif4RUJBAa4Us8GfRhA66sgDxsm7TrrGS+Pr6tRns=;
        fh=K5vxNdSwF6GndJEF2/ZkLiOUXgBzVwYxV0/l+SWGDAs=;
        b=TbD/MAbSpjkD6qxTo/7BO79auAO3+mJI62rXKqZa5Z24WyeNs69QxMG64y0a3mxZeA
         q+BFWiLzaMekNYp56H55gE9F9rMAZjySN+4HHTZA4bB5K8YCjMEGIS97HJWz6rZBj8mr
         klFYbuW7kATToRAW4jougSc+rtkGrrWhX8AMMBBtJOvDDGzfXsm0toGbgvHHQekEeUij
         VCHGPlAXfi6HSVESAR2/u3I8i3OCGpheLBbrGE3/xZbRs9en5/Dkv0lMD0GIy64YpfQO
         V3gQY8o/v/3ZvFvjZVP0a3uu8VQS3G/Gl+HTFvJUY8K7uJWBCZeJDtTPjwsEy7yyqMLm
         T5Cw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ushS3szW;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 4fb4d7f45d1cf-5c8e05ef384sor1892146a12.7.2024.10.08.07.12.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 08 Oct 2024 07:12:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ushS3szW;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728396773; x=1729001573; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1lXif4RUJBAa4Us8GfRhA66sgDxsm7TrrGS+Pr6tRns=;
        b=ushS3szWVSS1SFLcOuuxOaEAd5cYKG2NzviZasMizG0QAIrgIeU470wD6rmKO6Djrc
         8yx0q/dxtbksvml6GmEl2mjVDjU3XAh439+Cq1x8ffXLF9KEOKBsbcQ2JuJDh7JxM1gp
         fYdq+7v6Kv1eMJ5O7X+eljsxdGPitqTKTEbyNnuBLFzlyHDhx7e5gjVGhKNw8ziqSvBF
         72CCKuMeMU/Ec54lMjSpWhBUwmQvaKT6l2+9wcpN6s2U4hRKOdrwkzhMCvovt6kEHqob
         C6d7lLgQ8Dxdu20U7tR5BDi3Q9TzsyRCcospXM3F2xG/UaSeJsgpcIwbddqRzAIyswbs
         Ud/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728396773; x=1729001573;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1lXif4RUJBAa4Us8GfRhA66sgDxsm7TrrGS+Pr6tRns=;
        b=vvwk0+b3Lpq2q+qjwfrDfEvcuDlAgU/UabC1XzU50ke+6fOc2O8PWGTo6xR6XLu4cx
         tH2rjHeg042/qBGFpdjewgAXjM1kpjufiW+iyZlq4zIREC+lyMdSolXb0pGYLg0V0Z6I
         Ob0REkmHGoAnxR5IClMTRFkpcBgxVt+TKiyaZhKTDW8HZUD2zj6wi+2Jfhdj2RPCLR+u
         Mm96hevEUTRL+QpSzl29GoROYzmSmR0PKWYcCbSw1OEtx2qGdvJNIZWAEp/J6avEVhWX
         oLGVV3K3iyoR/hBa2JsJQ/eppMZzkgtaL4TzrO44Vn3PRnsQCQrG3IYq6z9uZwuHFkTr
         dXqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOTJNjFmkLx7JN0LDKdjgvB7fHefjQ+rudkSul1PespD3NpcTNEfnYLEegxCW7rTVADYyhsLi0wmk/4A==@linaro.org
X-Gm-Message-State: AOJu0YxQ7eV/YTib8+9EYgMf8miqvGY8EVMUaSzQ/akmno4RWKyMUUVq
	50jy5uvZDbGyz7dFhII2/bht7/yPcwuW0f+j3gTz2DXDM1YMFTeSgjWgTAttnC0LCdRba0MWYD5
	Ram96frLwz9sSeKom0skYsLMitIs4uCZt4IQ8PnGh
X-Google-Smtp-Source: AGHT+IEcDc2sIhY+0z9mugT3adwi3ou7mwIvwU3589KDMI2IU3RWaTS2embnO91yYcHNIouo0MisPyWHIBEyQYrQlQs=
X-Received: by 2002:a05:6402:4028:b0:5c2:6343:8ddf with SMTP id
 4fb4d7f45d1cf-5c8d2ea0879mr11698041a12.33.1728396772504; Tue, 08 Oct 2024
 07:12:52 -0700 (PDT)
MIME-Version: 1.0
References: <20241005200600.493604-1-richard.henderson@linaro.org> <20241005200600.493604-7-richard.henderson@linaro.org>
In-Reply-To: <20241005200600.493604-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Oct 2024 15:12:41 +0100
Message-ID: <CAFEAcA944zo89gOGhn8Axdi4P+vWqATo7qGGEEMDcwPyAD==7A@mail.gmail.com>
Subject: Re: [PATCH v2 06/21] hw/core/tcg-cpu-ops: Introduce tlb_fill_align hook
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, deller@kernel.org, alex.bennee@linaro.org, 
	linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-TUID: 4v7+zwEJ6quK

On Sat, 5 Oct 2024 at 21:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Add the hook to struct TCGCPUOps.  Add a default implementation
> that recognizes alignment faults before page faults.  Populate
> all TCGCPUOps structures with the default implementation.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
