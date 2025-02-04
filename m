Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp266133njb;
        Tue, 4 Feb 2025 07:01:49 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVw/lnINQQdQdmJD45GEZ2SKPnznoIRCNxjZsmjEH8NfCcBu0kz5jjxcoKrTwgIK05/Qsqyt3IcEAKllw==@linaro.org
X-Received: by 2002:a05:6902:2490:b0:e58:118d:67e6 with SMTP id 3f1490d57ef6-e58a4cfd0c8mr18856067276.48.1738681309213;
        Tue, 04 Feb 2025 07:01:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738681309; cv=none;
        d=google.com; s=arc-20240605;
        b=H/L83xDQu2Rl+vfDPic+O7Tns6JYg5E832IIsm8eGda9JBflBx/jGJkACEmJ8eWRNF
         KsCQowqjCfJ0iYaKI5IOqu5E55yJ3W8oG6G8cIbtwazOn2QrJS1ruDX6irn3MrweE9kI
         Jwgs0llsJM8AZrTsO+WYzsKb79jyERqQNK+LspZ5Y3Q6cWcT0CX0UT6WTV3ozbjPfWEU
         XZzwlaYUpjg1irB+GmJqpI8nMhpG7BgX1j+ov3o+hEGBuHxvzKyQT47S8zPLEbsYxaVp
         vKoh6p4BAvxJw5l+zF4dqL2x5jSR4bSIrJ8nLIs2EVWctKV1hRUh4mxHU4DL+IXz5/mT
         OBOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i96K6oJTe9yCko7ETubUnTI4pspHh0HcmsrsCYj/siM=;
        fh=davU7tYB67e69bF/TevoU1TD/foksOuQyrhgqtSQe50=;
        b=XFJhZ6RgnjvT38bf4x8vAVxZbLFpRplDQhioQeb1hD39w8zKdLl97j6oAUlkDuvtoN
         8tEk1S4vnIBPkqhfTYVghpCZx2eC6y3pK6Ehtn87wkqLCvr6jilHT0soR4PYQE9UlQkm
         IvvfUbIa1nnSSMXFQQRd2CakN0ewzoxaTC1xjelNEpKFi7OG0iEkYkABaGveN8G05Cp+
         1NqMeQpne1dJiX1LiRR8x+UjaBzqjWQJ8JPeeVJEZKDKpU1vm9yTGJdFkxyauvvcm2en
         Vi1ZUAvykaAyt9K5WeTmoeIVW4u1G0m/5Xbre3VAqF+eVSS5QbQRwI0ravYpth5lR9tg
         I55w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bjPwxgkl;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 3f1490d57ef6-e5acb2839a0sor6384751276.2.2025.02.04.07.01.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 04 Feb 2025 07:01:48 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bjPwxgkl;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738681308; x=1739286108; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i96K6oJTe9yCko7ETubUnTI4pspHh0HcmsrsCYj/siM=;
        b=bjPwxgklCZp3D15ZTJ3TgCM2duCvSkhRwEojcN4e/feEhAKXb2xgGhMJKnrnv7fZx4
         5I1/UZuSk63ixITpMqKN/WyHTRqqpnrf4IKIwt5rnrC2U2j23ogHr/Leq7RakPowZX/H
         6zS6kswoOCKRgG3w+MCzA68ps/LjuDghxRxvZIaTn7Xh88mdArbcmJJxYnwCiRZk6XOp
         ayHPL7QebVHPTzNcKuVMI6KSX9zPHflwU0joHWY3BNwNarRfSUJmadg2mtvCLq7VFcGL
         V453rqCLVVzWiJfh6su5SwbIN02M6VUuusD5KPgq167PCts5DsJs5h+7K3irvsP0kusU
         pYsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738681308; x=1739286108;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i96K6oJTe9yCko7ETubUnTI4pspHh0HcmsrsCYj/siM=;
        b=oTSxHrd+jDS1cTmKAhapUnLZbxE7orVAx0/1mFrOuY/Zv3w5nQpm3a2o6vKrd033RV
         iK+GDS6uTDo+tSEcBS4OqQctGKERz0lomid57zIYBXzG99sjD8rG7uyi9ndDhZevUP43
         r+em0sF/E0r0ATvR2fI6a6ve+QfWlV5rRIPidD4BugUtQSP9bkLEOyLqvdUzhcyzYLoE
         /+x3SZpCBxArQHTv8nIxRgukgJo86VuzLPElTa64Gn3Cyr+MJs3T/sfVldruv5NkqmKp
         1JNcUjfi2Yhs2uCLpsa/DnZ5ZpIgj7bXW5CXM/ne9znvVb0Tt6qwYCN3XR6UJwwDGS94
         iL3A==
X-Forwarded-Encrypted: i=1; AJvYcCVYPFs3nxMaqG04Mq2QcgxqxqkTKqMMC7MkIA8ED/lseKDs7OGd+KW9fgO4RXZiXBvDwwiEyIyPMZUvUA==@linaro.org
X-Gm-Message-State: AOJu0YzUGbud5qNuNg/EnPrElZqjcm3oF+p/iyPR25crh/4u3x3vlCn7
	H69u/5b6aHIu+JBw/Eg01+1W6CUVYSyCbsYgycYLzxR+R/50FpS1q+EuBL4CFuo+W262dcRl2m7
	ShzH6eBIZlPV3ynacHzWemcS1LTWvLbKuCleTduXI
X-Gm-Gg: ASbGncsyJcWbgnd04pnmJpgY2UQADEHNBRrdCIP5fjiOB9yKYG0G1T5qE+8E/wjzyf6
	xU6JOjqg6OHpZTH0y8l4uvYktTKaD+juPUm5vJ2kwIMBJOqhJVFLDnyCOuTETojFzDnclrxPGXw
	==
X-Google-Smtp-Source: AGHT+IGqdRFVVlgvBC9VJmskRtI7WIvKmj7y5vYNXJS+YwDjaPEGEDaekuhEAzi17kMbX4ub1OfNDI3cJcnzBm/H7yQ=
X-Received: by 2002:a05:6902:1549:b0:e57:f841:94b5 with SMTP id
 3f1490d57ef6-e58a4a9c45cmr19114402276.9.1738681299015; Tue, 04 Feb 2025
 07:01:39 -0800 (PST)
MIME-Version: 1.0
References: <20250204002240.97830-1-philmd@linaro.org> <20250204002240.97830-2-philmd@linaro.org>
In-Reply-To: <20250204002240.97830-2-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Feb 2025 15:01:27 +0000
X-Gm-Features: AWEUYZleavtlFLCYcqPwtasPxF3I4nOwiYTgSufdo5qM95M5JBXV4T0flBNl_U4
Message-ID: <CAFEAcA9kabWXcfWBNBmp2o1MtXX3zZ8cqhKuSm54w6zghypwJg@mail.gmail.com>
Subject: Re: [PATCH v2 01/12] hw/arm/raspi: Access SoC parent object using
 BCM283X_BASE() macro
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	BALATON Zoltan <balaton@eik.bme.hu>, Laurent Vivier <lvivier@redhat.com>, 
	Ovchinnikov Vitalii <vitalii.ovchinnikov@auriga.com>, Jared Mauch <jared+home@puck.nether.net>, 
	Fabiano Rosas <farosas@suse.de>, Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	devel@lists.libvirt.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: yHrJbE/XYDhF

On Tue, 4 Feb 2025 at 00:22, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> We shouldn't access a QOM parent object directly.
> Use the appropriate type-cast macro.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/arm/raspi.c   | 2 +-
>  hw/arm/raspi4b.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
