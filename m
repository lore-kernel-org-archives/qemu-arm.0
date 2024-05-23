Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp946044ejb;
        Thu, 23 May 2024 02:51:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV8r595S1GaeMNVUsx/UtH7+HZckOtGY0VMLl0fV64OJ4dezFI69tR7zj0wKD2bEwWhB7gQ34GUZcCCfE1G2xHTGX8ssgMA
X-Google-Smtp-Source: AGHT+IG+R+1Kc/uu2LOAT5h3sLgHttTH4R3dgAFxrV6V2f7Iuy0WabC1/u/VoHMXiqwE2W3kMt2l
X-Received: by 2002:a05:622a:44e:b0:43a:ccb4:ea5e with SMTP id d75a77b69052e-43fa74317f4mr25897781cf.6.1716457863419;
        Thu, 23 May 2024 02:51:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716457863; cv=none;
        d=google.com; s=arc-20160816;
        b=KwHj3U4sp0jxZo0vGcdPUOtObnD/oyCyWI18waT0UlvTCFJGwsSz4mMZQtXIFpuju6
         nlvxdfTqfOIYihQzpskeGxudPj6ShSOdhn53szOfZ7s1q+H00Yio6Zd9TiMnSojN2eKa
         HKted+w6JvPNNGOQFKlwF4bks3ThE9wGEPFDzE/Z5207O4PD7r7l9v0dv4IdPIq4paEx
         HzO4JRwrgMjieLUAz66AHYUbGjDouG7v8wWHm9Y/lH7Mb4slvuScuiJaAl/+25Bk5rhx
         ChkEvZ3rbQ30A4gZyvlljc+G4tZ7KNppWwJj4OzNYUmADr/DqoMpPws3KxALefFcNv6F
         yd7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=WHcJe+TvxtDKxywqD/FnM9pJ648Y4FHeJcGEAYNrvpI=;
        fh=vmNKskT86DOaoAWbok8h70BMh0XiB7+pTC/F85Pq0K8=;
        b=RhoBUS//6AtUwR9BiHzHquyF1qElXwd3HG8/Qa6mnto0nDUPKA2QkwxEH97odZhUB7
         7g0gEs5xr5qaJGz/h/ygZDKgFQzdmxVqa0CA8doI8ZY1E0rfo1OpyiJQmz/MPp8RoU2X
         lj3RgE1NuATKPSunlaWmwbGuQSWV3L+JvN6+do8E2uaFxZyWtJ8jVI20AwS48+0UJ0yX
         0bpIJzdGzDrg0Ll7p7yw883nWe2BuL+Fce5VIf1m2uvIXvrRh/6dthrDE9M1OuQtNxZF
         wCZULxnlt+nJb2my+V4af0yLpwv0ogdnv+DCQvDUnYt08EjtybOFckUL735JazWdtw6R
         j4uw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uRCSD4C0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-43df549f6f3si18821301cf.42.2024.05.23.02.51.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 May 2024 02:51:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uRCSD4C0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sA566-0005Dm-0Z; Thu, 23 May 2024 05:50:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sA564-00057p-K6
 for qemu-arm@nongnu.org; Thu, 23 May 2024 05:50:52 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sA561-00026q-Lt
 for qemu-arm@nongnu.org; Thu, 23 May 2024 05:50:51 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5751bcb3139so8710847a12.1
 for <qemu-arm@nongnu.org>; Thu, 23 May 2024 02:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716457848; x=1717062648; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WHcJe+TvxtDKxywqD/FnM9pJ648Y4FHeJcGEAYNrvpI=;
 b=uRCSD4C03Oxo092FpTHQxcgsPXiewycLpZPEQctGb5UfLkDjUJPO6r3ioUyVXBkeqn
 afMJnw+adlVlPjXWl4NZ3CCLdvYzOne4EnpyiOlEUKvjiCIdD4IKWCAFyCpxJn0Yg3j2
 eUQSF9o07RU3HLicEV4jMYOmPPfnuel+ISMm0AyFhj0zQY3vBbGII6c6+HfHKJD3y+lU
 Iil1C3m/KmS3+a48yQckTB8Pi7GcPv5HKMVAKIqGJHyP6NqvAx/3txfjWE+jX1eR5JMO
 7SiNfNXDeVuYFLrN143gEdsXjAt0ekad3jsJ9KbXnWLR+A6h6rcSDTQ37D/KaGFCvw/R
 Ng5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716457848; x=1717062648;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WHcJe+TvxtDKxywqD/FnM9pJ648Y4FHeJcGEAYNrvpI=;
 b=fiuLrKbJUQt+Pd16hAUVPKKKC0Iu8klp4f/AHOqzoqPdzS6hGDh6WqIzXTMH/1sGsR
 hfVjABVVTGnWFOoIqbeg1k1/zH31aBPzx8tZXIvTzgBP096XVcHemiCvQklgPEMpD0g+
 R2s/nVynJtTPEJrThA5dixALQ6gE8/R9RPMfLtmqlTce0Tjgr3dja9067ESBiOGSvePt
 keEYZSEXuqIBd5E1nn+weK1oBgMtGRUHqc8Z7UYJcTYzI2y6trQzrDlopHN7lNmTVCNT
 Dex/pDQ08p8W6vediXa3GOVZpxt+Fub8fECNIx7YYeaAH8mahttkj4SRAkqHF5qjBPZT
 p/pw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2/agBUWqht0zjeYP1S+78EnGKKLYRakVMYBFmJ1CESXS+G8Vx08fLFO09kfY4T0gArdYu2URR7E8tH36N7X2LjWCZ
X-Gm-Message-State: AOJu0Yx6u35TAa/FimN5pF7XN8+2J1KoxZc2+qIq4FwswKQDWDfbpNWV
 RkADOYAN+IKVAjmEL3HfffcuHSuxwdIx4oZbAs/77VjoUGRMJSjdq6joGLZ9nd9fVXvSqocoLN/
 JIINaiBtLmdr43wT/x46WkVdrN5WWabFjbhw/Zw==
X-Received: by 2002:a50:ab46:0:b0:570:388:ee0b with SMTP id
 4fb4d7f45d1cf-57832c8626cmr2684362a12.42.1716457847993; Thu, 23 May 2024
 02:50:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240506010403.6204-1-richard.henderson@linaro.org>
 <20240506010403.6204-4-richard.henderson@linaro.org>
In-Reply-To: <20240506010403.6204-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 May 2024 10:50:36 +0100
Message-ID: <CAFEAcA_VQQsaUAqNwXWWB08aP+OEtQR3griSyHmn2RMVNEkQfw@mail.gmail.com>
Subject: Re: [PATCH 03/57] target/arm: Convert Cryptographic AES to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: DLePPXzgkODT

On Mon, 6 May 2024 at 02:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/a64.decode      | 21 +++++++--
>  target/arm/tcg/translate-a64.c | 86 +++++++++++++++-------------------
>  2 files changed, 54 insertions(+), 53 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
