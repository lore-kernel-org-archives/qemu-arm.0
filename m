Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp827223wrt;
        Wed, 9 Jan 2019 08:35:42 -0800 (PST)
X-Received: by 2002:aca:4405:: with SMTP id r5mr4186524oia.188.1547051742363;
        Wed, 09 Jan 2019 08:35:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547051742; cv=none;
        d=google.com; s=arc-20160816;
        b=cZcWlVeqZ8NyQxmSq3jTRGd70XmVsnLc+fkmkfctilyBSwCr1Cizfs8h23TWjSdC4U
         1A1qPXH2lFSXeT1PTMQbzG/qh4utzflLMXf5eLfEFvXk6F1hqq6bPdOOd4Am7Xcblig7
         o3fLccK8Jnj3bqefXuvpPl7B+kwhceUDG1cw3jDn/kMVBA0mLBlalzirZQeLd1dCHQvI
         6MZAKiOicggodBKdxa/v4E8lD5/qsO1XwzOzkMcpq3SaT7KqI9KwDwqp18ArWVan+dbd
         jF6idwoqQM7iMIao/lum6BmnbFkwOyop8vHNMjo8RGLeqxfC1S6HFznkGw3CE1qc3xWQ
         9b5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2uESkddqXAZJEGNjiyaU2Ulffhkn+4IphWrwlm6wcWc=;
        b=tO0dJTe0guGJZ+d1aoWDl9C6kzjZVy3kLLqdXm3ukmyTwhJaLJbg6TSHZWvsJErumb
         zKCjMt7BIMf0DVzfl8RPBScmgQgFo99z4GbEHCVrfmHfPyX+0fKTaJYz49vkZ2WLE51H
         DCV5FrUzHwdGz9MuxkXSBGHEs8MBumFwah7RDXfE8yvz8d8N4AM1M8X+OKoC1JDRZnLy
         Lw71n5EZjqKu3TFegu79UfhjnV9uUoQ5nhNcGJc8PnoKxNHr8CPzh2DMhpwxDzXB2Iid
         4ikxM2eKU+xFw/tw3QHfwlGdYMw7h/dz+JUJ3R8ZB5JUMGUQ928vW1J9Q90Y9+GzcPV4
         f7tg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FFHuwAUs;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 124sor35761041oif.157.2019.01.09.08.35.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 09 Jan 2019 08:35:42 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FFHuwAUs;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=2uESkddqXAZJEGNjiyaU2Ulffhkn+4IphWrwlm6wcWc=;
        b=FFHuwAUsTod58iQmUwg9DXR9LPQtdG8fEgfOG84l94ehMymT1k/I10bjp1QWpIy6AF
         JLsTAjvVxnpKBixRkQLgVYttGcLqADuYkmFQlhp7vRWSkNRhVvO4x4tqx/Fp0/8D3nDX
         rbn8iWUmRfCMcSWQ4E1/Dz3wFSmcTQLpRdQHM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=2uESkddqXAZJEGNjiyaU2Ulffhkn+4IphWrwlm6wcWc=;
        b=YxMLEuLRAXsqc+B8j91GXujg/svNYFEX3RKd5GHopz8D6TU3DtnmsZIyTMLrmb0+4e
         Q+BjnihFYcWs+dsRBb+tqtxa7ss3ouD7zcdxM3a7ug4IA++11+y6tto5DqgmBIpAuzN9
         DBoJBCbC9A2lZZEUIzdBx7yLFBsbpkTdmSyiX4KBZz/SJF0I21GMYJURXCX7Lp0BtzqZ
         MoWxXGsZPRUgf65EdwsrCkqgVq4S3erVGCfvm34KnbQHB4423cJPJIz38IItTUgMBsQr
         zysjfeD5fNgCBF21hAl7VMHQh5JYLUUCigsO+iTpNSCEab7S7lGaTS29Y/AtP8bfXYsv
         fLVg==
X-Gm-Message-State: AJcUukeDPhgHdZKL/LuqKHotUnbuz3rU1hWMtfmo1Dsym9morqpD44RV
	hX8OT5QG/NOSE2nI5nwEfDqOER0ucp150SUHpw1MBBTfFdgfVw==
X-Google-Smtp-Source: ALg8bN6/RG+fCDEVpz9x6zkVUdKOKVoK0ucna3dOQSytG7mxyNaOO8mWFsxpOW+LpxDi7mPu091ZNsJXrLu0jWfitxg=
X-Received: by 2002:aca:1e17:: with SMTP id m23mr4487358oic.332.1547051741674;
 Wed, 09 Jan 2019 08:35:41 -0800 (PST)
MIME-Version: 1.0
References: <20190109152430.32359-1-agraf@suse.de> <871s5lx14y.fsf@linaro.org>
In-Reply-To: <871s5lx14y.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 9 Jan 2019 16:35:30 +0000
Message-ID: <CAFEAcA_6022cBFxHFmSuZVKVFvrX8bwFtoG2jaTwaQ5RoQ02cA@mail.gmail.com>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] target/arm: Allow to switch from
 MON->HYP on AArch32
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Tom Rini <trini@konsulko.com>, 
	qemu-arm <qemu-arm@nongnu.org>, Michal Simek <michal.simek@xilinx.com>, 
	Stephen Warren <swarren@wwwdotorg.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: M6jwxmp/Xk4a

On Wed, 9 Jan 2019 at 16:11, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
>
> Alexander Graf <agraf@suse.de> writes:
>
> > In U-boot, we switch from S-SVC -> MON -> HYP when we want to enter
> > HYP mode. This dance seems to work ok (hence it's there in the code
> > base), but breaks with current QEMU.
>
> What EL is MON in this case? EL3?

Mon is an AArch32 term and EL is really AArch64, but in
practice Mon is always (Secure) EL3. Note that if EL3
is AArch32 then S-SVC is *also* EL3 !

thanks
-- PMM
