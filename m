Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6802034wrv;
        Mon, 22 Jul 2019 04:40:58 -0700 (PDT)
X-Received: by 2002:a9d:6508:: with SMTP id i8mr1549716otl.355.1563795658297;
        Mon, 22 Jul 2019 04:40:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563795658; cv=none;
        d=google.com; s=arc-20160816;
        b=SPo+SBPDFZDiPxj4rt4LUR0ignvjV65irLUEhMAy9f8XwpK0wxWWQY+CmNx/u152dT
         3Q8xOOzYzYYrkjMTZCbdNjw0GfjVYfdDQVmgUBSAvb/Lwqn79U8E+lZoaSMTzurBdhHE
         M4zPKEfxv+a2RewtwNTKDpTrtsjDWhm7OcOXrGcnbqSUK7Wovq3PNIiaFdPz1lAJE+Rg
         TlrVCNR6Ie/m5VBCb7XEzS8HkHTXuhopmGxJ9NhJ1/YZHM030bzJMmyazMZryRCgknxL
         b2tH0P1ReL5ZP5rDEl0f7F5QEX6U+VSv2SXBCL5UaQ8IaqGg9LPDsyCzCVj3B0eEABK4
         /CmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J3+CHRfzUWzSxeSeXN6LqlMbpNkcEYHGCmOl1Kk4RaY=;
        b=ANNRvPKnqGIYkuCKo5rx7vJxTILooy1BGvE8NRxpBkkPIR54MwX3yo7WJ8CzQTtVT1
         uPZXPFR3EpjMQBTmzxQAA0pTDroccFwDwE4kO9TAVGbyRxmec022uOZRvQxCX3PLxfP4
         Qqe1hG1pb4flDz0xkA57Rti6zRoIpEPaovQnYicFtJeyeCIDfgevZE6ixL0zbxAu6j9d
         w9Zwxl1TIqxPrpZLEK1cX5Lzqd1ccRa7vKb41UiGDrhrwWuTOnGteZw70GkH2VYo3mOW
         sNA8erWRIuiwzpq+ue0V4jMBu7Q21Bpg3q89B48ptdhCaDOwnuwqLnef0MnFmfUDU9dl
         AjQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iP6+dqTq;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 100sor21005330otg.71.2019.07.22.04.40.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 22 Jul 2019 04:40:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iP6+dqTq;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=J3+CHRfzUWzSxeSeXN6LqlMbpNkcEYHGCmOl1Kk4RaY=;
        b=iP6+dqTqweTEdtjFhyONrDzxGMJe6LFhuUo8hf0b8qzvDvho1Za7pi1+seM4ap4q10
         WYAta+QS2GnNyfXAUoloc0lrWshjNPkVyU73VoSGXq+CxxAWLntXJGCDOJzMJe/HS9kY
         JHmk7SianPZ9i+tbIWmEB2f7CebJEF48yqixpNedE1O+tXD4om+PBneWhvqW+3Kt8LZg
         vE5U2GOGm88a6pKxYoKQs6k9enHgbxpJ7DOORdjgdQw9mdI+j7lOBG/01iyyB3ZllHe7
         lixN5GHi8U8cgGD6jPJZC4ODmTGPPO3TUgFn/y+OUJdarFG2GCNxVJQ1puZRmdf598Ec
         oVYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=J3+CHRfzUWzSxeSeXN6LqlMbpNkcEYHGCmOl1Kk4RaY=;
        b=OYI6fm/HhcjS+nuzM9omD53U1Ml0UE0SjYe6mFEV5mcPKKsqN26p2BCuTaK18Jmt03
         9j9ZwVavVKX1k2pQrLVqJ+XGDKHzR/MOb2nAKeWcgs+wpvtdjNR/74lHAAQEPrtYnHnT
         afwHuJfk2hWlHPXkJ6USS5xGh6M4PyArwQvZ3tx1D2/32KYTqJ4OVmFmCjO7B/kGwVKb
         +cM0EvmNfM+zYpAMtR7nhdp8VHmAXR49FsvFZsBg/gBrdb6crvJXciw/ckCsW8lH3eVW
         bC0FXY+yh3Mgg9pPRtuaLxwdy+Cc02YlKS7zHbEEZXG2ngyHHgcXQZ77gXTfm+pfiH9/
         yAgQ==
X-Gm-Message-State: APjAAAVFy0/G/Y8toVXintdlg/Rhj0EnUZeHK6f/x8k4U0kp5vMDTZ6g
	6cDgajD+5IjkH8RRiYscUjEGCxD9GqCieyEGdPsGFgAfanorLQ==
X-Google-Smtp-Source: APXvYqz1ZCUm+8WMx6gdtIM0WW5UWg+lZBP6ngbrXeYE4D2/yWo9fLOcV30LstoIUA2vZtRYw8p7a2WTGZ6RqYo+7h8=
X-Received: by 2002:a9d:5f1a:: with SMTP id f26mr15263597oti.91.1563795657642;
 Mon, 22 Jul 2019 04:40:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190722111914.28574-1-alex.bennee@linaro.org>
In-Reply-To: <20190722111914.28574-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 22 Jul 2019 12:40:46 +0100
Message-ID: <CAFEAcA_uOX9qkrwRASAaxOfTms9SsQMEyhJ0XwYFiFPVtEnqkw@mail.gmail.com>
Subject: Re: [RFC PATCH for 4.2] target/arm: generate a custom MIDR for -cpu max
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: b4tk3XHBf7xN

On Mon, 22 Jul 2019 at 12:19, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> While most features are now detected by probing the ID_* registers
> kernels can (and do) use MIDR_EL1 for working out of they have to
> apply errata. This can trip up warnings in the kernel as it tries to
> work out if it should apply workarounds to features that don't
> actually exist in the reported CPU type.
>
> Avoid this problem by synthesising our own MIDR value using the
> reserved value of 0 for the implementer and encoding the moving feast
> that is the QEMU version string into the other fields.

Exposing the QEMU_VERSION_* information to the guest is
usually not a good plan. For instance it means that the
MIDR will mysteriously change if you save a VM on one
version of QEMU and restore it on another. We went through
a while back carefully removing places where we'd exposed
the version number to the guest (have a look at the
qemu_hw_version() stuff which has to jump through hoops
so that old versioned machines like pc-1.5 report the
old "1.5" version number, and any QEMU 2.5 and above
now reports "2.5+"...)

thanks
-- PMM
