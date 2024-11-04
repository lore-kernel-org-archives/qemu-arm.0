Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp2269956njc;
        Mon, 4 Nov 2024 09:16:41 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW3rbw4HPemaOfk5P3ATwIpwQzfvSU8m97nOgSb3Lw+FaTjDY8Xvc9mAIFr/JWvgQDUYN7GIBIutPE60w==@linaro.org
X-Received: by 2002:a05:651c:888:b0:2f7:65c5:c92 with SMTP id 38308e7fff4ca-2fedb792b81mr54486401fa.20.1730740600637;
        Mon, 04 Nov 2024 09:16:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730740600; cv=none;
        d=google.com; s=arc-20240605;
        b=JTesdNjD71vKQqmIHDe7Qr/5LM7sv4hynBDuPQP7ztSLDn/iw/KaaSznqPdXRAtnz4
         LIyBdVu59BlKWlWKpXDYDs12fKMHlAp59OVLO69lDDDjut6syJ+smrkIfhvhMkqhYT32
         /LiFK2DsRhe4RYKvfmknQeAj5MQII1h8RuV9jymRK6yoDI1VoEt+6sMKaReUCVeF4DTO
         8cqTGXeH2oxCByNOeLQiS+gKQ8eCYg9AnA2nPk2yRQPFXF1VzTFj6SB887MjafF2TD3X
         bmRdO1aDwRrdPgyhvWG1DSeSuTO2WyA5lL1fyBxNPDXKSo42dL/gejkaGSIJSuxJG/t1
         6FMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rFdMFrYFoj15tqQwMYYyirispPzAR+g2+flXApqn9fs=;
        fh=ueZ2sW/rsYP7Qj1m6c/Vda5Uhg3ZY4WZ06a3v8Tma4o=;
        b=H/HFG3OH87QEcXuv4CHGjQxg+kNNK1jiPQjHVIbHFRUL6t0WGqP+B5ne6y070Y1Rmd
         BE5qh4QCfmLtVMbdDR0oAVpcEqCJy1jxPfhI3FykkN21AZVb5pQkndH78B4Q1fYB32LV
         WsCJrld9IrUuJEU+Wt75mIjzwQTvBA+Pm5AltSSjJfaO5oeVhPTkEOjHRYT0D7+Kk79U
         TbCdfaj9rZ6Kt33XQA47roV1Daq4gLe9heIN7NK1jhNZYNYe4Rj+jbSKYN2Ij+s2BbMX
         154xLcXiQyRYbSQmMmLbbjQFRt4f+xMEmTDNl1aWHhc0mDFyFoAMGiHWWoPjIaCzUN0A
         8LoA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="U2t/tlm4";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 38308e7fff4ca-2fdef8ce60dsor22470781fa.15.2024.11.04.09.16.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 04 Nov 2024 09:16:40 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="U2t/tlm4";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730740600; x=1731345400; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rFdMFrYFoj15tqQwMYYyirispPzAR+g2+flXApqn9fs=;
        b=U2t/tlm4f3aLUHlU+fZQ+uD9N0ce+32mSvDB12z06YArsat+ZFPnYgzqFrny/p0+KH
         HIRvwwIyYEv6FdpK4mKaQ2edIgy83a+5wZBlNZX67eTPZnCXLwt+KV7RRe/qf15IYrMw
         5K5bHFQUKM/DJuoOfGqz4Br8lhSfg689X4nqYBGriWgsj5wsCYPHbXxVjnsc/S4cpgv1
         Z0x9TaMBZiUNKr7jhzMk32/UgNI5stbIScvNpHsPnL+elIZrJTcm6Y82VDvEsGnVafIr
         QxFWvURROc2lwE8VHngWuJKPVhW2KxTQSftNOOj52BRc+YkJaU87/0YDQE1oxWeVeYGR
         3ong==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730740600; x=1731345400;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rFdMFrYFoj15tqQwMYYyirispPzAR+g2+flXApqn9fs=;
        b=kWDNoDpWFX5aHjAhjYbjxDx0COX/aPK34yQgBtfJMuqgPoIQ006F7rlENpX412KDBY
         1G2B80gylhg+rWaEuD4d6ckWeCTvPLKKxkcWO8WZ9wkdxxd18d5tkPCzavCFTJ6s/Pa2
         ujKhpCDFzcor26vBAOSwUof5kiYhczTJpgUfj9/c472J1qTsTa455aO1gXKLUMsf2+G2
         TrDdQ79BY+MtPy8Vb+w9m3PqI4/9NMWx7aeqF5LuVPv1Q0mAi4+yT7W3OO4y8YeBKgqF
         pHMgFAeDGhiLnpCtNhp9nKgbTwcaEZSytsqiw56oKO5aM0MqLg0bbyVxmBv3LUuxWIQC
         EYHw==
X-Forwarded-Encrypted: i=1; AJvYcCXWd8U5ksKvKzeb4khcGOX/R8ZbkffG7ho9KZ+9/8ktWobWd3knr0VPuBmUFHh+rIB3i7ajTmLxM9tVtA==@linaro.org
X-Gm-Message-State: AOJu0Yw4yO5LPNMklmu3ANyhLFnujhvi0jSEjcNB50w8TQURkwfCB6m6
	6CaP1JruDIHXhHYIV9REf/KT8K3C4T5PPMzcndrEOYCCSb4uBlJhkRnVQeDDtxQ6EB+WD/Dqg3B
	GIIFD6Ge3V5Oeds5rY9Da6lp7O6iVsmMcRctAZ1GLcXUUIhk4j88=
X-Google-Smtp-Source: AGHT+IHqc//LHND71HOSioZxH9lExkg8+Iw31TJF5rdqABwfBOuOfwCGbLalw9AOmeFTDEbdLaw1Qkagq/4QeWTPqk4=
X-Received: by 2002:a2e:be08:0:b0:2fa:d9db:7bac with SMTP id
 38308e7fff4ca-2fedb757365mr58358051fa.3.1730740598449; Mon, 04 Nov 2024
 09:16:38 -0800 (PST)
MIME-Version: 1.0
References: <20241025101959.601048-1-eric.auger@redhat.com>
 <20241025101959.601048-19-eric.auger@redhat.com> <ZxuX4i9NjVRizB72@redhat.com>
 <cb6c8f62-c5dc-416d-865f-fbdf96164dac@redhat.com> <Zxub7ol4p8P_sWF8@redhat.com>
 <CAFEAcA_wQu17y0PyQwxw0wuf2H5y2VE5aX16nLP2-u7QUP2ggA@mail.gmail.com>
 <Zx-9WxXkmkMuGIlQ@redhat.com> <CAFEAcA9w0mb5bcU8p+fScQony-=oqLmNurGWpnL_sBneQCzxUg@mail.gmail.com>
 <Zx_CU9eeQByANMRW@linux.dev> <6c05fc4e-ce14-4000-bb2a-63496bce9e98@redhat.com>
In-Reply-To: <6c05fc4e-ce14-4000-bb2a-63496bce9e98@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Nov 2024 17:16:26 +0000
Message-ID: <CAFEAcA_XhkBrco=V3Ky+cgvyp3cwqHXjDkmm+dP7N2B2av03bA@mail.gmail.com>
Subject: Re: [RFC 18/21] arm/cpu: Introduce a customizable kvm host cpu model
To: eric.auger@redhat.com
Cc: Oliver Upton <oliver.upton@linux.dev>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	eric.auger.pro@gmail.com, cohuck@redhat.com, qemu-devel@nongnu.org, 
	qemu-arm@nongnu.org, kvmarm@lists.linux.dev, richard.henderson@linaro.org, 
	alex.bennee@linaro.org, maz@kernel.org, sebott@redhat.com, 
	shameerali.kolothum.thodi@huawei.com, armbru@redhat.com, abologna@redhat.com, 
	jdenemar@redhat.com, shahuang@redhat.com, mark.rutland@arm.com, 
	philmd@linaro.org, pbonzini@redhat.com
Content-Type: text/plain; charset="UTF-8"
X-TUID: JjVlEWJo0h3y

On Mon, 4 Nov 2024 at 17:09, Eric Auger <eric.auger@redhat.com> wrote:
> Was just wondering if all the writable ID reg fields were associated to
> an official FEAT_ listed in this feature list.
> Let's take for instance CTR_EL0.DIC. Is it associated to a given
> extension or is it just implementation defined?

CTR_EL0.DIC is IMPDEF choice of 0 or 1. There's no associated
FEAT_* -- as an implementation, you are effectively just
reporting here what your implementation's properties are.

(CTR_EL0 is not an ID register in the architectural sense.)

thanks
-- PMM
