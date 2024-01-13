Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp2957070ejs;
        Sat, 13 Jan 2024 05:25:41 -0800 (PST)
X-Received: by 2002:a17:907:1b02:b0:a28:ac22:7575 with SMTP id mp2-20020a1709071b0200b00a28ac227575mr5686517ejc.4.1705152340918;
        Sat, 13 Jan 2024 05:25:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705152340; cv=none;
        d=google.com; s=arc-20160816;
        b=1Lj3dlEbQLyClqDk29MwG8GMnOfQSlwp3KEQyyOiTQdrF5dyaixaEzluGneElta4bg
         zYuV5d2oEKSi34aWtMCOKsfg7fpDmLfcYywSEe05C98dFHw8GqZTs4TBXnGUexWK7AhC
         JHunok9Gga0lAy1iho0I6hfao40AwrJHTUea8kl65DqOgmwA4uUet9v5780w+DeE1Egj
         9igSs04fZM2KYnXIMNvmNSW3RZb80Thw8i7uITYRqhIOYHAE2M+1WCtpyBEDhlGulA0G
         ihKbUcVkV+BbYsswVnHVKa+Tp7aBD7JkIn8oiL/sffo7XAqVbcNdeBLxbl/RgMPTLRAp
         qkWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+xwb/pG+4+lZ/N8kjn8ZXif7LxvZAq1yC/392vBJEkw=;
        fh=TdHNMZ8OHJtpmGETXsguxom88UHQqP6xd+te8w86lwo=;
        b=vqmlXw5j7KeA8gtLY8yN8UAdDf8AdhxdKnDaZvMm7TdCNkaH6xjyIBWfhKPE3YK87e
         LxdTqdwhVwjxSzmd0AHYlcLIbEM8Jd1PBPcRoa5+CtDQIPDbza+b8NXRPXeud5gZ1bIt
         Gg72gAmR6MJR9YbmELr9hpjG+iPD4J/+oaKzZ6oJYqVYA9VqMGzZiJ1kAy7HxgJ1zaDs
         a345ALolrF6wbCOwxb6zuTP4yRQkVlNsYkCSxmxJ/1593G/TSee7Mr0R4UCsD1CnEK5n
         Scx2z83LAa/KXdg3888Qk8CMSEMI1KvjwccznINK8g+pkl7hy0qWaxfhxbkGTjKkST4X
         MuSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CJI0KB1S;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id f8-20020a056402354800b00556c6bb4f68sor214345edd.0.2024.01.13.05.25.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 13 Jan 2024 05:25:40 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CJI0KB1S;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705152340; x=1705757140; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+xwb/pG+4+lZ/N8kjn8ZXif7LxvZAq1yC/392vBJEkw=;
        b=CJI0KB1S0kUOsjXXyIDkK9/ZEdZIzGw1MSlGI6z85NvTY7ilXSCBVHWjsi7U2pZ7Y1
         5Nthb5z5sUHymZUgp43l7OhocWaAXLDQRiS1N/c+2thvia3p+mAdc50T8LNtcVdeEuw6
         oEbZyivBEguJboDMI4l7+WsjTgt86El3GcVw9MKKRCzzuFHs9AURTqnA8NET8GRhQ7pm
         q3KGYfCie2VdRPDtoAY326mIumyifCaKo5cUJzlteSG99LBOz3/b7h+NetypY8d2HKQx
         F0zoBDg+9nrADPcPqyJryKPTAugAiXebEdK04LBByH1FVBa2AXz9wMnMJMS0+UAwXKmT
         lS7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705152340; x=1705757140;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+xwb/pG+4+lZ/N8kjn8ZXif7LxvZAq1yC/392vBJEkw=;
        b=xKaztxcTHxMxOGOuJ+k9ElP4zqKa9RbHojuX/GamHAylngYm3Axg++YwSN5Vpzo32B
         pQeUZStRY5NQZqQR8yWeLVe0x8bzSgawNywYL+JELJxUy9CvJswR98R65R/ARpGJuP8e
         9am8BfwDkANnH9R/TLnJyX6Pxb3A6yNl3WkMbHKqti9JVJFDc5qYh1ChniDyvQUEvrLw
         5exdNtF0JvQWSUIa4ar0sxt0VABrGL8n/xQcK7AUE9yaTeWUlefBJKcJLLczcPVZYlOy
         7wnp7ZtRjm0A/dfmZ0bx6k7HmxHyozDbqWWVfAIx151LLENMDnUjfH3JruwfO/Fz3JOw
         +O6w==
X-Gm-Message-State: AOJu0Yx6taybqtdfpU5VNsulSfaZMPqMmW9o/DypC3uOfZPzuBeKwop/
	AQcfg5X27jOi8VwkRz/ONkLdUeh+iIrEZ/hAD0WBRR35kctIRo7+
X-Google-Smtp-Source: AGHT+IHsocBF7/cu2JK0SXST7YGi8MhSkKTcSmXdINw2CLet1TnDdHVlR8823CE151CQ3Y15CFO05uzPC+ZdPcnLuR4=
X-Received: by 2002:a05:6402:3cd:b0:559:144:7dc4 with SMTP id
 t13-20020a05640203cd00b0055901447dc4mr581733edw.21.1705152340575; Sat, 13 Jan
 2024 05:25:40 -0800 (PST)
MIME-Version: 1.0
References: <20240110195329.3995-1-philmd@linaro.org> <20240110195329.3995-2-philmd@linaro.org>
In-Reply-To: <20240110195329.3995-2-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 13 Jan 2024 13:25:07 +0000
Message-ID: <CAFEAcA9Au5TFkmJvEphUXRNH4EvtoBbQ-10MZUJzTn0TPaE3-g@mail.gmail.com>
Subject: Re: [PATCH v3 01/14] hw/arm/armv7m: Introduce cpudev variable in armv7m_realize()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, 
	qemu-arm@nongnu.org, Kevin Wolf <kwolf@redhat.com>, 
	Igor Mitsyanko <i.mitsyanko@gmail.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Radoslaw Biernacki <rad@semihalf.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
	Leif Lindholm <quic_llindhol@quicinc.com>, Rob Herring <robh@kernel.org>, 
	Markus Armbruster <armbru@redhat.com>, Alistair Francis <alistair@alistair23.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: ENaqWye8vEj6

On Wed, 10 Jan 2024 at 19:53, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> We are going to cast s->cpu as DeviceState multiple times.
> Add a local 'cpudev' variable to simplify code review, having
> a single DEVICE(s->cpu) conversion.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/arm/armv7m.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
