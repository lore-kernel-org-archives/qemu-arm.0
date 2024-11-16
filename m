Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp1779057njc;
        Sat, 16 Nov 2024 13:21:31 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXl2C94El39BYgbDJGr01TOeGeDtKzR+8n/C5YwxhqKRi4vgbdNP8nwmZl51kpRtNcxqX8GkQD3n6r27w==@linaro.org
X-Received: by 2002:a05:6402:34ce:b0:5cf:99c:a7c9 with SMTP id 4fb4d7f45d1cf-5cf8fc8b633mr4707391a12.9.1731792090881;
        Sat, 16 Nov 2024 13:21:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731792090; cv=none;
        d=google.com; s=arc-20240605;
        b=EiA3N33XpHGWbTeB6vowBwakHtRJGDKu+f9VgYws/W+KeISQbD/y/CuzUFYPs6FiwO
         AB+d/8SYyZol8MLSM3wXG+nXLGbDst4wt5NugYRWlqpIKXbG9ZDaSUeCFfjX3pVmM6Et
         3JMp1mQgMKIuAT+AJ/DgXE7bthv9tOCCeqChJIky34DZZPaB0kMitfoNH6ISgmvFHneo
         /vNd2jWT6hwbz9OB69Vm4WCuyjbm7p2csu+vaKIDKGny5Q1hkbEbcHUkySeUO1p4UO6T
         ZnUpHpKzAKeDnwGZwSz6Dotionqs5kvlhT6qbQnT2YGgufHOLTDa6Eny8+qXiXGq74QE
         B7dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=R0svVznsXJi+KwTmDjSl06FehgpkSPdLwSrxOHWybLM=;
        fh=CjVjtqZrAlRc9afU7poQq0MFkzXIvs0yjhU6LwEXdOI=;
        b=jGORl5UEIaaUflp3jnIcTe7qQqZND4ftvZS8WSRLq2ToAqRJ8OSZ3lh1/Bv1O1IOnx
         DQPfRRqFmAEQUrfyFAWcnwXgsFhtUporgiCzcyqUHGZRsp0t1Yy277WVmzGXdTn9pMqo
         4rdCq6VaxRp4PLkcIoil0XTGvSjaiqdGw9apbpEZvXCzAjLOPfaj2+8vkS6JjJvHpfVT
         9f/ONS5CE6gmJNqdRPnu67lAOADOkcWmJuFEv4ymSUiyph8ImJFA7LMYPZ9GOHkfVdQC
         qloxaZKWTqqo1ZyBgIXYVBcqQpDLOrqXLuu0BsN6s0dcgj07bw/KPlVBuT8TET3lK1+9
         5JYA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OTC7NWkQ;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 4fb4d7f45d1cf-5cf79c0e63esor1745942a12.11.2024.11.16.13.21.30
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 16 Nov 2024 13:21:30 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OTC7NWkQ;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731792090; x=1732396890; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=R0svVznsXJi+KwTmDjSl06FehgpkSPdLwSrxOHWybLM=;
        b=OTC7NWkQZXYgc98SO67PgXeafNJn02Oc9enXQ9JwsaKkZeP7tUww1CeIe2m5DkOzRc
         Iw5PkJ3SDdlsZ8Ci9ht9dumKr2qfmDxIWgMw6IrgTDi73FP8COtqTaYB58Vl9F234CBn
         Y+CkSAOuoRDdSXVfzPMObFagCRm5ws7XpuBfvMIlwDnAjHIGafmEtcxQ5HiGT8O959Fm
         cTj/vWIjxJSvZmnXIPgf7re4EtqlvvGSiHJIE5Id8nijCvEJ8yX2SjHtdGIOYGDmX6t9
         Dp7K7uSYGo1k4ywSTveB+3Jm+eYVdWY3upIcMBJdJsntq5fUoi3PEJ1g+Cne6rOqw5dJ
         phKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731792090; x=1732396890;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R0svVznsXJi+KwTmDjSl06FehgpkSPdLwSrxOHWybLM=;
        b=MnPTzPTKsYZplLWPpdlOANGgASE8ZSdoejfSrKc/zF3YE4vFKODtB0VoOvaWB+EoCG
         KmFs8EG9YSBh9m+QnONNSd9d+ImLL/olR59c5AcmPgOOReMxKWSlQCGV36UF1CqjwxFp
         8dAbrHhqPntt1uhOGGogR+EeJcqejGQ8DCW8jYLC/cnweg+VI1+ovFYU1d6yD1VuorEq
         BQ4cYXS90+wvQPNLMYEB3rEAnwgMx4PjlMGzcfH6NigJHKk4OWmgS7+s668eapOCRT4r
         yjYJnREWmJ1vZg9V7A1zDxUXwFxgOQmfTLmgDqZ1aJ9w8W/nnx8kSc0m7OoRlFmWaJuc
         HSLg==
X-Forwarded-Encrypted: i=1; AJvYcCVHFaHj1uBO3QKa0qdQWS9GFS1IF0oHtmqwnL1HF8CEPAPC0NP00Dyq+rLnuVBZesRmDkv48ysjhrCJrQ==@linaro.org
X-Gm-Message-State: AOJu0YwgS3/uO+LogJmJWxRuAO/329/7qFO4Ja50i3k4d0BisuYfnmxM
	YHnHyPwg8Jz3UDAoiWVErRD7SW+WDQTFeKohnRLFPwOhKhclPQoZ1PrLsKuWLDMu4PH++9UUzS6
	92CJTJcgMK1g5bv/QjGc8AK3/vbhtwohoezpWXy3C2SgNAeEATHg=
X-Google-Smtp-Source: AGHT+IHJpXXN+h/fZR58qw/EGaCnjiUJ5snTWk23QeGNj3pNEAMKzeSTL1Th/bkzBI2S+21D1SNAjst+hriuI+OF5yM=
X-Received: by 2002:a05:6402:2793:b0:5cf:95d4:7b89 with SMTP id
 4fb4d7f45d1cf-5cf95d47d98mr4580665a12.8.1731792090102; Sat, 16 Nov 2024
 13:21:30 -0800 (PST)
MIME-Version: 1.0
References: <20241116181549.3430225-1-manos.pitsidianakis@linaro.org> <7d835e14-c3d4-4aba-b4a9-eeb06f56fdde@redhat.com>
In-Reply-To: <7d835e14-c3d4-4aba-b4a9-eeb06f56fdde@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 16 Nov 2024 21:21:19 +0000
Message-ID: <CAFEAcA9n0+NE=hf4F7PDp9K7bwn96msdPYXpBPaY0h5-9=7+8g@mail.gmail.com>
Subject: Re: [PATCH v1] rust/pl011: Fix DeviceID reads
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, qemu-devel@nongnu.org, 
	qemu-arm@nongnu.org, qemu-rust@nongnu.org, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Gustavo Romero <gustavo.romero@linaro.org>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Pierrick Bouvier <pierrick.bouvier@linaro.org>, 
	Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: JMPefBtpO7JV

On Sat, 16 Nov 2024 at 20:24, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 11/16/24 19:15, Manos Pitsidianakis wrote:
> >           match RegisterOffset::try_from(offset) {
> > +            Ok(PeriphID0) | Ok(PeriphID1) | Ok(PeriphID2) | Ok(PeriphID3) | Ok(PCellID0)
> > +            | Ok(PCellID1) | Ok(PCellID2) | Ok(PCellID3) => {
> > +                // Ignore writes to read-only registers.
> > +            }
>
> This is indeed an improvement over the patches that Junjie and I had
> sent, because the writes would have gone down the eprintln! path.

In our C implementations of devices we usually let writes
to read-only registers end up in the same default case
as writes to invalid offsets, because they're all
guest errors that we'd like to log. That's what the C pl011
model does.

-- PMM
