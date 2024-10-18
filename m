Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp892647njb;
        Fri, 18 Oct 2024 08:29:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW3vlGPprXCkDcoHqQe91GQi2KYdpfrWw/0A0lv8yksC1XLYiSGQLr1O/GGxAQTvxs83EGAjfIeylAdig==@linaro.org
X-Received: by 2002:a05:6402:42c8:b0:5c9:6bd9:68db with SMTP id 4fb4d7f45d1cf-5ca0ac44297mr2158514a12.3.1729265383624;
        Fri, 18 Oct 2024 08:29:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729265383; cv=none;
        d=google.com; s=arc-20240605;
        b=EdyFmRfhCxZZjEuB7U/6TfHC2CiN6PnbvpG19hMKqB01Lb4ny8hXwCTLeSjPTKfWJ0
         A74KJAKATVQXRsIOo7/0Q9Vr4Zqvo2NIbhoEKjF0+9I600nKAopI6q+QDc/aYnDmraPv
         ys/zcYDym+5ic6WIbU1wxWpOCMfhF1TKKd8IbsYstlFGfaiWG77pvUE0Mp0YrTLpJI/W
         Kd66SmQS6byIDGC/mC8sKwXasv947g1YPLDAxHcUhz1NCzV/+fwl/mrZNuTR9J2Wof7s
         jfIibnW01avx+ZArPFMuPzTurUlwGQ+W9klP6ztGYgi4uKCQoMAzN/wHBTdl+vtzuX/p
         93BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=35TxFoBwE/Ru8ZV4fXJd7kbiQXfCKpRq6FMpSUnsZJg=;
        fh=tkCuc/E3rZGlynKHdnv8xo0ZzhGe917CCMf/UnwIo5E=;
        b=TU8zW0PNkswOJaojG+zwBBLRk3ik7YQtN5KTwre4Xru9+TgrLcAT2bMODCMXh9JjL3
         jUOrFAT52fBf1r4ztrIshBcTLexlfCur8KR14Wzz7/QyjO7wj4kMqr6SMtzejbzNhKin
         GZU7vuCY0L42NZJ6cGFaX1pqgDh77u/bJW0E9dmSziSxBcBsOoWVoR+ryOVcvhTz03uO
         rH4+x3O5dm1fIcgzKQqSY8seVyn1lzZstW/17Ak/k/lVLQZMWVdjfWiNRuva9jXcOp3r
         suWlNL9dqrIfr4+bEoCdLlkGgxim+a5BO9x003jxTRca6HZXjaYIRfaRe2BX3bnIDh6D
         j2Hg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ejQssNOS;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 4fb4d7f45d1cf-5ca0afbc4d0sor396625a12.0.2024.10.18.08.29.43
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 18 Oct 2024 08:29:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ejQssNOS;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729265383; x=1729870183; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=35TxFoBwE/Ru8ZV4fXJd7kbiQXfCKpRq6FMpSUnsZJg=;
        b=ejQssNOSMY25kT0bU+MEaV0sdHng25ui4oOl12qLFOi+bwoxTORSL/sFDZGJdHxMOq
         pvpe3jNoCFFQmCNV6uPUDYn6/NYsuUSc1SSXlcVtK0AVhZ/li/56p8OwrwphWmSt+VQA
         hKaP6DHT+i3gBrBLxSJWxRQIcm0dGzSZt7NiVCjA4nbL9Ynkjkm4nB1weMzIzBEB/OS5
         yv4Zjt8xO5OfYaT2JeDrwpAEb1NCvauTbekPo1v4TPs/phwxP8H0wz0F922vnyzN5tpX
         2RQo+5FJfU/E58VgTgBxq2PpHsbBXjg5RrHJcnB3c3FQjS/yVOZL2bxDUT1x/GE/4rAE
         V7+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729265383; x=1729870183;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=35TxFoBwE/Ru8ZV4fXJd7kbiQXfCKpRq6FMpSUnsZJg=;
        b=HkEwIkejh11ZD8wKYjykj/23I42mls4bP50I6bEkfh/L6zCIs3eOHSiuKwOhmiFb3T
         pIo2n7P2Q+svuSwDeNlsldoJbTfInTXBowUlILWdlkQwvq81bS3BUipYAp+xM5tjd/8x
         c+fHMM1fxv6pM9/eEP1mPfnl4iH3ktLYwkrzf3Oexz5UYBWIoD1P2n8Y5GUDzblcxg2D
         sFviRtuwvGOoU5qIBRLaIUGMTsYR4eDKnoIHJP97/WWRZOQ+YuaHiqIKmNl7X9Thhhlx
         K3A9I+xbOfv75uQRnBSWnQu6SIJFZV8wuPv6KQthAm30BcsboGLMZvOlgWWwQuOS6c5R
         BIow==
X-Forwarded-Encrypted: i=1; AJvYcCVbSaLrbPl8tBYmC9c/VWM9E+aBmQucU0DNN1mdUfY2YUokd8k/GUnfSt5Gy5E2hIKxZqbFnKacJ3MQAQ==@linaro.org
X-Gm-Message-State: AOJu0YzhJuWQ7Z7+bOxxlaYFVe25ETtVfJ29QG6WOtNnqmXPP20l1CWu
	P10MHdCCv1aK+ySI07tFwIm2357am82dSBhCuxSGFWrbI2FMTfPyf0Il1UWNMCNimsqTzFCHfys
	Wju4rLc7tU8KQ36Qx4HqnIBAZRvwacDus8wFQIJpofl04ZoHva0g=
X-Google-Smtp-Source: AGHT+IG2C1pcmNQERXK6oOc622D1AEjdZx696HcoljlYKND9OBPgEa6D6VS3+3TOsW+8HTGqTr7naSc2QtRU+b/1yfw=
X-Received: by 2002:a05:6402:268e:b0:5c4:1437:4159 with SMTP id
 4fb4d7f45d1cf-5ca0ae8055fmr2170619a12.28.1729265383049; Fri, 18 Oct 2024
 08:29:43 -0700 (PDT)
MIME-Version: 1.0
References: <20241008114302.4855-1-gankulkarni@os.amperecomputing.com>
In-Reply-To: <20241008114302.4855-1-gankulkarni@os.amperecomputing.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Oct 2024 16:29:32 +0100
Message-ID: <CAFEAcA8pErj84CTzBJ-Vd94B4radu2Ta=oDyKV_xYMBNcotQmA@mail.gmail.com>
Subject: Re: [PATCH v4] arm/kvm: add support for MTE
To: Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, richard.henderson@linaro.org, 
	gustavo.romero@linaro.org, alex.bennee@linaro.org, cohuck@redhat.com, 
	darren@os.amperecomputing.com
Content-Type: text/plain; charset="UTF-8"
X-TUID: NslFAiJzFn30

On Tue, 8 Oct 2024 at 12:43, Ganapatrao Kulkarni
<gankulkarni@os.amperecomputing.com> wrote:
>
> From: Cornelia Huck <cohuck@redhat.com>
>
> Extend the 'mte' property for the virt machine to cover KVM as
> well. For KVM, we don't allocate tag memory, but instead enable
> the capability.
>
> If MTE has been enabled, we need to disable migration, as we do not
> yet have a way to migrate the tags as well. Therefore, MTE will stay
> off with KVM unless requested explicitly.
>
> [gankulkarni: This patch is rework of commit b320e21c48
> which broke TCG since it made the TCG -cpu max
> report the presence of MTE to the guest even if the board hadn't
> enabled MTE by wiring up the tag RAM. This meant that if the guest
> then tried to use MTE QEMU would segfault accessing the
> non-existent tag RAM.]
>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>
> Signed-off-by: Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>



Applied to target-arm.next, thanks.

-- PMM
