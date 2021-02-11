Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp2475088lfc;
        Thu, 11 Feb 2021 09:40:54 -0800 (PST)
X-Received: by 2002:aa7:8485:0:b029:1dd:bf6a:a9ec with SMTP id u5-20020aa784850000b02901ddbf6aa9ecmr8716108pfn.47.1613065253991;
        Thu, 11 Feb 2021 09:40:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613065253; cv=none;
        d=google.com; s=arc-20160816;
        b=rLamaQ2jvNlZgGcXj9bTjWB4wOyXGZO5kEjXgrppM45w5VPD+zwP0qrI0BEDDao9mE
         IkYJXMtNZvXBYIGpn+WkAqUqyEOUGuA6KrAPbswEE/QxA8UqwYFgqXYjKzQ7zLSpnJ/8
         oaZQfUKDKlmxvsmy5yLXH0fDU8KXUw8fldSExITge5nri6UzG6YwqfwMOq+SfFpqGVKo
         v10YppzNIMHqA2h8wjocpqNq3Ok+GK/aXA2keVT5guhmG78TWmfjDoPzLvGCb7+XgsIN
         Fjk+SDcta1ZBitwezqXf51K0YhFWDVXpZvgCwtZAiEG571eF3Tu5UtdndneCjf/sdddL
         HyWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QziDmZr8TTpasbvFZVUT/329P3XT1UCmwBzrVbDzVt8=;
        b=I/yapR4cy2sKelImRsZKbg6CsEyFjiRf53xyqaiGcCbVapWzIN/ZEUkazNaSjBBfgT
         KKbLz0T+E1W+zOb2tNnv9AcXeB5RiU2BTNC0+UOiMpEdJOduUGALPCWX4MKNIVdEG0aB
         vEVU5ZyIuPnsmb1EHwbJE5Kt4uG6H05yLYccpWmGMXzwHPsxRI5U5NumN1ZRifnZ+Xck
         4vjcjTkQ0cKvow7rOKVbZKyyCwAbIrHewcyfuMNtxVWZWFa/sJCDW0gwgxSd8kxuaqVr
         ZgxjevdFbq9MGQUtbFRjqGMBm02rtP9G1eYiYlt6VtuvZgMz6XADJwM4TYoe2AUURwdz
         tABw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="CZZ0dXb/";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l5sor3113199plb.55.2021.02.11.09.40.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 11 Feb 2021 09:40:53 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="CZZ0dXb/";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=QziDmZr8TTpasbvFZVUT/329P3XT1UCmwBzrVbDzVt8=;
        b=CZZ0dXb/akrEVv2gQQECboWALMHG7RAyWsSQM3mxEpIvbiek4NeIVFxUsJbwfNUS1F
         5l2Hwc3f005aESd3X699lGHhAOb7vfkMWnvZw0TzSLlkXPN/mwcP06Ate3WnBqutLlGw
         1vn4omxqbInwoBzJgbYQLZzODZnev3BBGI9as4f0skV7jhURhiiS4e+3Hb90+uogCy9J
         aDQ71xGirH1r0z2TRzWtPDbX7Me+ZLFWNdBoDZpNfRsHhZI1CEw5JOewM68MuwzUM1X8
         zfhcbbe2jGOmNIGQnCbus3G1gzKLviS5KedNNawoXnCKJUGm0kMO1ZiwAC91PUKILivP
         sGyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=QziDmZr8TTpasbvFZVUT/329P3XT1UCmwBzrVbDzVt8=;
        b=oGNB4TuYy4WcXdZhYHrBGcLVV3QQv2W8/Zbk3139hlyvwUZWfDg714otx6s19grLy5
         m3aVQBO7ypuZTkOU7h5Sp+47qanIoZIzJeQbCaVjgRRnT1Q1BXa2KCtaZd5TCB2xCAWb
         opMf7UNnRNz7/HZpXAs+o8VnjYBACUSgEiIYyNICodxdF9604gEkGS52YRQdphxy3HEe
         wM3YqPddu53CscBRHL2nyv6FwD1SBbXRNFHRuJ1z9hcaxnvMBDH9ZjCpOgqYsa3zOens
         8GzNMj4Fg6BRDCBVup5YOmLEmPkdUdFJnZY4NQE13R3a1UVWHQTa9BI5ZH1cybjS41EV
         RwyA==
X-Gm-Message-State: AOAM532aZ5DozJ7050Qghhuy2hzhxNWbUgfRvnZ7IRiOMhdC68CBEYLn
	K3N2Rz+on3GC5l474YWrMSKmXqXF0j4figQPuCcQKqwtEU78jA==
X-Google-Smtp-Source: ABdhPJwnwxrzPvItcE7Xa8pNbvWQIHYnBMQTywNiPe0cxc7ZYs5qbKGkU8WIgEdLbvZvJ4SMYkxbpVcNIY7Jt3hhMWg=
X-Received: by 2002:a17:902:e989:b029:e2:8c9d:78ba with SMTP id
 f9-20020a170902e989b02900e28c9d78bamr8505067plb.81.1613065253570; Thu, 11 Feb
 2021 09:40:53 -0800 (PST)
MIME-Version: 1.0
References: <20210211171945.18313-1-alex.bennee@linaro.org> <20210211171945.18313-2-alex.bennee@linaro.org>
In-Reply-To: <20210211171945.18313-2-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Feb 2021 17:40:42 +0000
Message-ID: <CAFEAcA82Fv34Ri=s97rx8hUPrqMeL4xOS325DbY1fhoWmiE+9A@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] hw/board: promote fdt from ARM VirtMachineState to MachineState
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, julien@xen.org, 
	Stefano Stabellini <stefano.stabellini@linaro.org>, stefano.stabellini@xilinx.com, 
	Andre Przywara <andre.przywara@arm.com>, stratos-dev@op-lists.linaro.org, 
	"open list:X86" <xen-devel@lists.xenproject.org>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
	Eduardo Habkost <ehabkost@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
	"open list:Virt" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: qUWJccDDKaml

On Thu, 11 Feb 2021 at 17:19, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> The use of FDT's is quite common across our various platforms. To
> allow the generic loader to tweak it we need to make it available in
> the generic state. This creates the field and migrates the initial
> user to use the generic field. Other boards will be updated in later
> patches.

This commit message says this is being done for the generic loader,
but I deduce from the rest of the series that you aren't using
the generic loader (cf discussion on a previous version of the series)...

thanks
-- PMM
