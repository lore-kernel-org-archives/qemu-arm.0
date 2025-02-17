Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp71640njb;
        Mon, 17 Feb 2025 06:31:03 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXCC77W7PmlpQ0Eob5oYVeK5Rvyh39uq27k2ieBd6tiU129/Lq10cPldlpdVXuVm4fHpPcbbntV45Wi9w==@linaro.org
X-Received: by 2002:a05:690c:6303:b0:6ee:a81f:1264 with SMTP id 00721157ae682-6fb5835015cmr79246587b3.26.1739802663598;
        Mon, 17 Feb 2025 06:31:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739802663; cv=none;
        d=google.com; s=arc-20240605;
        b=a29TOYK2QJiVBcDU5oO3LSSF//1kLZ0j23yoYxGPp7eOjxxXqV2yQsE8xDlpZEeUaV
         TzuD3P+m2RNgGJVxuuieRliRqid0LF9pVIjSaRJIrZWdR7UZhM8SgBOSbmGbLuFrVXvB
         ACrkTN/WYKxv/10SKXJelEd6sQhCOmIWfKNWwVbko+UMieXH8nTGKdYKP2y64bz9G1Fn
         eyVn1OOl9HnNmjkRnKcABpmn8ai5z35S2nw7iKnLfRnhMMk9ZpBUcTWchRsxtboTGac+
         sdekYc8C2BLLnH9xwtO7gk5kfgTrerfS1+HFCDb4cEzEE+bbRbxLpn4xadSdhr809gTO
         ZS5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ARq/1TRKqEsZ4gBUkE4hvwxgchz6MW1Tv8bqqoM9pc4=;
        fh=0TuFzQrpJG23QxcwL9PezoWk4ER09Y1CVvuHBb3tmkc=;
        b=kXKQH8jdD/OtBDgzQPMsitTan+nYMAs50x4Jri0Z6wo8lD58LQCHg91G7ZFam3+d83
         GXNGszs55rBJDz/ot+vwzzFA46uAnmbwwOQ5yJ1ICjLycOk5L9Ec7m+vC0uyhJXyit4P
         QWQqgIgvMF/JOnGWkq5JjaSfaMti5kuHjUWWRfM3KoU/ymbNS/MS3qYC6GkSwaIWASQz
         y3IHeMtDrKrjNk1lg19JFOZJV/SucoyJ86u2uVazSO3uj6YYqmmaK0aHQwvsJw/HxnOV
         vEAV9TuBlYGO2CyZlOGkjad4J4G63t0fXthYaCmyi/Wz9+H/DrxTh8TN02mxJ7F2f5vp
         PK+Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hOb7QeYa;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 00721157ae682-6fb35b3ff98sor46892577b3.0.2025.02.17.06.31.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 17 Feb 2025 06:31:03 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hOb7QeYa;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739802663; x=1740407463; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ARq/1TRKqEsZ4gBUkE4hvwxgchz6MW1Tv8bqqoM9pc4=;
        b=hOb7QeYaDhxsKynCFyAHEcapX5c07KVOSYFxuKqIJ86ct7CJVMEzOuy0X3bJQ5SVDw
         4Sm5QkNVcOaaFnK8FNdz036VGCZQi/TXF1HNwuGSg1yOWWlfq6vjJp14lgm1FlqZnTFt
         6S3XCPzykQGVDJMc+TuHyFYWU45uGW+WSqeIg1UmYNXV6IbKR6gzniTi6AMLkDeKNhvx
         JdB858QtZdDXJSAOskgOazeF/FrmjgxyagLW7D02X3f/wKBy/L+6ncdBmHNLRg5/mgy8
         +LHFcqwqPqtzflKik/VLdR/Opt5ucaDoRYyoEfsamrExkdxre1ZfMgBc9wXaxcJ/frmX
         6kkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739802663; x=1740407463;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ARq/1TRKqEsZ4gBUkE4hvwxgchz6MW1Tv8bqqoM9pc4=;
        b=lRPtTLCWnB7ueFSBS6IRz4I+u8E4BaKQq1SKd1KpQNGTdwnuJO76ascreaOO9xdTE/
         PfFdgsAJx+aRpJjL5MieEqv2AWxT1xDIf2ZcvEfF+5PTWAImLJ/HCAFhCpYat8RJfBPp
         PaLkr9UnxLHH3DdMS5Hv8m40OAOK+ZN/nFbQTjZegNMhdfeJBH9n4QU/eLtiqUhC9lrm
         0sHo5wFgHcVMKOkKjOli2f1b/2+Eb9OzcEIeQ4yvaw5bU/vEYvTbfHYMje905TLrc6Oq
         J4b5C+1squY/K0n2ZEhp62R2QByyceMpFDftIdvRad9uGe9KNPd4Cg7K4eRA5JHzKjfK
         aIkw==
X-Forwarded-Encrypted: i=1; AJvYcCWsoOOG2WcQleKXaEjYrRRAu3tQukCmH6LGPjqKBD3OXbvDKlO2ByNYjVjjJu76ms3F4BG7arU/+VczmQ==@linaro.org
X-Gm-Message-State: AOJu0YyeE5miOqc9BXhc3+NHjOwpV28uiZxsBC3NCphQSRBaEH3bOOy6
	sha61rayUKqwkL1f4G8H2gs9HY9zV7x9VRdM0IUW/qdqWFafzw/MadkWnK01RQGK7c0uRQr6IHD
	v6nTCDpVJZ6XdOTEq3PP3nKBj6BBqBNxik+2KjLuF0nmXtUosds0=
X-Gm-Gg: ASbGncvRhqkDvoF7Yg0ZADJjqEnRoXIMjZGvlk8Ac7iJmotpm6MKWWnof1A2WgzpUC6
	IIvW/Tx9fCGVAoegpSTsmBbMrEtxnGzrK2YkWH2JReOf/wwC/1vmBVq9E6Catqp51wlr6OxOerw
	==
X-Google-Smtp-Source: AGHT+IHmvT+gFOph3mDwoljmjoy7ZNxzNndZtzsN7fnMHh+0YlTlpJxc21zZ11RVTxNieiA4Iy0UP3Qipb1fp4hN2l4=
X-Received: by 2002:a05:6902:f86:b0:e57:37d5:e271 with SMTP id
 3f1490d57ef6-e5dc930450fmr6829252276.47.1739802663008; Mon, 17 Feb 2025
 06:31:03 -0800 (PST)
MIME-Version: 1.0
References: <20250208163911.54522-1-philmd@linaro.org> <20250208163911.54522-7-philmd@linaro.org>
In-Reply-To: <20250208163911.54522-7-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 17 Feb 2025 14:30:51 +0000
X-Gm-Features: AWEUYZlnXlI-NGSvZYeCcYu0_dJAUTjh3skvtj6zlgRnXy4GpGwjgmm_sR2rS_E
Message-ID: <CAFEAcA-r80Di9snxMQ-7x6-9Hn93RUEoR-C8wkw40nRnN7BLjQ@mail.gmail.com>
Subject: Re: [PATCH v6 6/7] hw/char/pl011: Drain TX FIFO when no backend connected
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org, 
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: tN/sm311YTM1

On Sat, 8 Feb 2025 at 16:39, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> When no character backend is connected, the PL011 frontend
> just drains the FIFO.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
