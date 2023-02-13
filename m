Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp297559ejb;
        Mon, 13 Feb 2023 07:28:37 -0800 (PST)
X-Received: by 2002:a81:c84d:0:b0:527:acf4:2724 with SMTP id k13-20020a81c84d000000b00527acf42724mr18656024ywl.12.1676302117428;
        Mon, 13 Feb 2023 07:28:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676302117; cv=none;
        d=google.com; s=arc-20160816;
        b=uMBwDhSS3KHeNDMG9qasCodIR4PBxl7NQHNrBt+5NfRlfkvHBvaYR2p0W6gS2Zra/n
         W8Aya4c0pOy3CYEWXPLZ++84M1+ouk8vfjFxFWJsMHQtPGm7WMideajf9NcApw49+zoL
         kqeBl/tHxRXUpSPPvnwUHR8LPz65HriBquSnqgdtPtXqH84KBQpDi6RLXNXpS0QKXTng
         sZJ0V2/6+rMlYbV46ObSml/yR/w80Kyxqsgi2EurklScILJYGZkFtZjGsFoJpJ00kVJ3
         wHra5vWD2qYV+yIWzA01b80n4kB9HNoirv7bh7C+r6tYhV+RD4e4cotYnRjluaHDx64B
         p4rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=BSNSfAGjwXwBUfNm6rI5YxIrhmDxNq9yMpPtwQFhIRM=;
        b=CSoyPnnc1Y6LVV8u3E9PGgBsmw5HGaYx1alLPZ7NnENYuB763mv1CRiVRmV7NrrYJS
         Px1/gVLm+8vehunYZf1tDUFGV/+xnfZ8XGeqsozNz0Pnu3o+qAmmhuCAnLiizX/Q7clr
         FcFY9/j0yRwAuFR3g4bS4Zrz1a5yOZ68FoYD1F2257Dc1P0iKRupiclI+1YZKN4H60mL
         LjDpSHumTYd5WoGYcPHsKBa/jLftUYaJhd/h2zQUvbSsyt4VOeuyXQVS+HTeF3j0ZN2G
         a6bR3YX3hvI6ePqG99L4JrnPLxQWvpdP7Xipgdk8G7yWseXkyXnMXqTRApB/WWCjP0pa
         sL6A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b="N5/z4J0H";
       spf=pass (google.com: domain of francesco.cagnin@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=francesco.cagnin@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <francesco.cagnin@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id s6-20020a814506000000b00517ae72e32csor4627507ywa.29.2023.02.13.07.28.37
        (Google Transport Security);
        Mon, 13 Feb 2023 07:28:37 -0800 (PST)
Received-SPF: pass (google.com: domain of francesco.cagnin@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b="N5/z4J0H";
       spf=pass (google.com: domain of francesco.cagnin@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=francesco.cagnin@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BSNSfAGjwXwBUfNm6rI5YxIrhmDxNq9yMpPtwQFhIRM=;
        b=N5/z4J0HqXRl+0HWBud2r842Q3a/52ZqsXfIxjtKJ7UQTxJvbFm2wQvIxn33zfeRdd
         hmdyWSMN/7PGzt3qexJOc4rHZ7u3MYL1Qc7HOXXTmP3Es/wki7WNUT2dwzzdgPedWr9O
         KDn9s0FdqgFTNkmkPYR1n3eW1V9GZ8aovmaDoe1U1a79gGkasFWCuk9MhWZ2+la81BU1
         J+bRVMVhbIPFVMhPLEZ8Z3rETOM7hlpeocPZcZ8zGQcY2NuPBzzevY+5QIk2RBm4AhP0
         XHmj9szgCAWSuR0fv0ezAA5TGeaNQR2oNiAQdjg95EHs1EMSC7ya83LWqji2vlU9bMEn
         Sw+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BSNSfAGjwXwBUfNm6rI5YxIrhmDxNq9yMpPtwQFhIRM=;
        b=oAdGkowpjeBEWBU42deGBolIGKIvtB+3PVKvExc38EZQ1Nt4t7gGmFn3x9+mBJQwWA
         dnmHZ1Mt4P5FreM0HwzDjbLqoGaJe8u/LzlwbTfs0L4bkgfSurAtyLsGQ9IEpVMNdJpt
         5p5/7ToTiF6KUtXBTsqPcbRA7OLuWHEZ3hsifQ1SJoNs/u1A+lUlaHPS1rAi8935zLJX
         m4S3GvzaIncQwa7zlNf44qSFRlsEcNOEPx0dmdvqUOxX1a+guNsEQ8XrctemJ/fyam48
         SQfl5JHGgAQOEGZK2Q/nFUf9073tYS3TnhwvmU5Ks0WuRo6SsJHxIIFBxzB4yHJlctoF
         N1UA==
X-Gm-Message-State: AO0yUKXSrCcj3Biw5CQqoFP/iV88uiTwz1ri0P8vCZXh+0LHV3060NtQ
	7OK3wyLLa+AxDOvE/rogy9NFZrvmon4EueJuSxfE+AHNfHT4QA==
X-Google-Smtp-Source: AK7set9hl/QSX16FESmzrdIymqBrBIU6eeHxT2C34rRBBgRYGCOsq7Fvud/5OL31oWWAK8M2/9T/nzmrOGuAwd6KnSE=
X-Received: by 2002:a0d:c906:0:b0:526:8ea9:49bd with SMTP id
 l6-20020a0dc906000000b005268ea949bdmr2193000ywd.339.1676302116892; Mon, 13
 Feb 2023 07:28:36 -0800 (PST)
MIME-Version: 1.0
References: <20230114161302.94595-1-fcagnin@quarkslab.com> <dd55481f-e871-c412-bf81-36632d20ba7f@linaro.org>
In-Reply-To: <dd55481f-e871-c412-bf81-36632d20ba7f@linaro.org>
From: Francesco Cagnin <francesco.cagnin@gmail.com>
Date: Mon, 13 Feb 2023 16:28:25 +0100
Message-ID: <CAF8_6K=ZQgqU8J=S0UHDxjCjB=z55d_XM4Vza50XJsOAh7YSKg@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Add gdbstub support to HVF
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, alex.bennee@linaro.org, mads@ynddal.dk, 
	dirty@apple.com, peter.maydell@linaro.org, qemu-arm@nongnu.org, 
	agraf@csgraf.de, pbonzini@redhat.com, 
	Francesco Cagnin <fcagnin@quarkslab.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: n3Vu7xmed5Ar

Hi Phil,

> Could you share the test-gdbstub.py changes?

I've just opened an issue on Gitlab:
https://gitlab.com/qemu-project/qemu/-/issues/1489

Thanks,
Francesco
