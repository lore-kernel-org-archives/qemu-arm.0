Received: by 2002:a17:504:1f11:b0:1be9:327d:8ee3 with SMTP id z17csp213235njl;
        Tue, 8 Oct 2024 07:05:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVx/apPSh35rxu34bwK70/d7ofKLaHCx+ncQMeKCasvgBQqR6DroyCFbJjgxQgrgquELhb+qiue8JqB7g==@linaro.org
X-Received: by 2002:a05:6402:3490:b0:5c9:6c7:8b56 with SMTP id 4fb4d7f45d1cf-5c906c78b97mr3023115a12.7.1728396303088;
        Tue, 08 Oct 2024 07:05:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728396303; cv=none;
        d=google.com; s=arc-20160816;
        b=Sl/dCtKrfqb/nuktIo5Zey+COgmwTUKdEvizogkVrDaCqGmmnZZ46/i9XzH1dVlft8
         1++aKhXKOPL9ZG6D/DbAYgDZGfbEQaHsLMLoNNRS+G72RPmrtdm9LoKI7RLbVWHeIpVl
         jfKiN6lktQf7fHN7ym9hgGZDeGsxYMa8JGUGsl1QwFBLybLuFdVncs8yvPShSFLEUl8p
         Z/SKZtm0g5+/5yDnyUG78W3WG4/M8q/qjD+CQpyUrqVP9p9+TlGATmIG2etfqQUC7mh7
         7BDeCwoAdVc8o2b29YRQn9REraA1jzBV/So0UxsRS8f9Aj60tzXvoi2wgsL88TZH+V5m
         bShQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=aetDmH2NilGTvMf839NYi3b2dnOTF5pYiBjtZB77M6M=;
        fh=SxVlQ+3Uxnix+AhT2p6Oyve5IGqkXJYWcghLlhudvkA=;
        b=P4KPiyN4YnN39ZOTsaqPADuD2tlUTDjqppnh2AiZJXiWQokoAjUcb2mrTGg85XBSoY
         fbT3Q8wpy/HXAwGjckAxafWom70xKuolv1fbHKKRgoJWOEigIOeWrULBVjrKnVcP9TI9
         tcY4adv6YX7oGP8ellW61WdNCGlJQw3VRKV49o8ZTrw8whsrCwmU5md19t8+Vu9tpma6
         QwmNwSP0YWEUnXS09iLZ3jf3N19ao+l5LZUiN1FfruON/97XFFUH2yizxhEvfY83gKE0
         O61uo6AjT7Uwv0KcsfjH7zzC8iyjORf+WGA7Sqi6YrMiyniXnkZ9/ubrdZ7Ux40ZzWHj
         VnUg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=f8ig198n;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 4fb4d7f45d1cf-5c8d9a474e3sor3703908a12.3.2024.10.08.07.05.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 08 Oct 2024 07:05:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=f8ig198n;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728396302; x=1729001102; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aetDmH2NilGTvMf839NYi3b2dnOTF5pYiBjtZB77M6M=;
        b=f8ig198nHhBRxn1OFMI8OwlRrI45Zk5jzajyFYe26ZWsuYjxN5xXczvGpWUiVBo0eu
         vcmMiFxLpH62vv5CMBg1O2eRfC7WLdzU3XoLpQp7wrgUBMbOSeeUUSd4EAonfTtPKR3g
         LChSL4dFcU1uBcamQ+kdCK5nLeueOeM1GtShTcAMI5qVzhVCcxAFAEMEGeuAZGDjkZNP
         zS/vJTpeKgsdk8vcoMlnUBatSj+etmeEZBh3JsqKX/1XIkngdNtWi97PO7SyZvGHl7GL
         w9Wt8mSwKt5Im6fToh3/+zoCch+gMdrmXaIjT1DVIAm5aakopgmn8i4odpmXGWTSDwbD
         JqgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728396302; x=1729001102;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aetDmH2NilGTvMf839NYi3b2dnOTF5pYiBjtZB77M6M=;
        b=mESY1hnHlIADLF9WIC61SBqSrkvrA7EcTio6XsZYQuUT7bCabI9DGA3f3pWUJXuVW2
         FVleLDjZOKpxDdO8iZFZNFoJRGpNBCKCdn98qMCZwuuitPCfaZ+lg5J1kTkhOtRMNw77
         7IYIqpczv5RfbygNih75tz365WmkxmFf8GyC2T59kY89cKdbeUYLti225fZyvC88oi7R
         k5wXW5XI7ckWH0zfZ/5DRFG4oAZjjh3dC+XCph4Q44IzvstbCTZr3nTJeRT8s56ds0sS
         /oe9Gjr2B4FwmDb7ui35LrNOVbbMigOIhBEKj7Rfv6xYt+EHj9qrNNAQq1ZdkhdI4Z++
         Qdgg==
X-Forwarded-Encrypted: i=1; AJvYcCW/Is/8HqRMLjRLDyaf9cjo+je6gCrumxURakVWhbnILCQAo8ZjlDs3pVBBbT+dCE85NMzWYx2qA5TiWg==@linaro.org
X-Gm-Message-State: AOJu0YwNQdo65sl5KEkzOuEhSJbF3xtwb2zK/G5vRTIQU8uYzrxEX3s2
	FK/CEOuaXO+hrbyY19dRduecCmSvHMQSaAwznXs3zUdvrd6DQIIWa6CFnvxJtlw5HTArF05ep+N
	Lg+pPrsTRL99gh49QUrFeX/yzNrlosXrsNjTWrGe/j0kcy/gLhRw=
X-Google-Smtp-Source: AGHT+IF6H3Lvl6/NmA82bxuWyc/gR8SMikRNZ7hPVFOE+nrj/em3ufiBwEctKYWf3rwHepOwHOxLcsK7Ag6vWLVesNE=
X-Received: by 2002:a05:6402:4307:b0:5c9:3f1:e5cd with SMTP id
 4fb4d7f45d1cf-5c905c7a8famr3615578a12.0.1728396302336; Tue, 08 Oct 2024
 07:05:02 -0700 (PDT)
MIME-Version: 1.0
References: <20241005200600.493604-1-richard.henderson@linaro.org> <20241005200600.493604-4-richard.henderson@linaro.org>
In-Reply-To: <20241005200600.493604-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Oct 2024 15:04:51 +0100
Message-ID: <CAFEAcA8L9djaHeeEShySGa0LKt-qDovgBxvFMDTOF_+=J7+u3w@mail.gmail.com>
Subject: Re: [PATCH v2 03/21] include/exec/memop: Move get_alignment_bits from tcg.h
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, deller@kernel.org, alex.bennee@linaro.org, 
	linux-parisc@vger.kernel.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-TUID: q0C8+X5mz/fh

On Sat, 5 Oct 2024 at 21:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This function is specific to MemOp, not TCG in general.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
