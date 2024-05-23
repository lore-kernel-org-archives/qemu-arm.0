Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp997164ejb;
        Thu, 23 May 2024 04:38:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXmUZZexjGU5vQu59N0PYa4bbU83JH8WLCETF60XM3UcoY3+gRhhw8vT6nH3nIkfSKeVfoX31P3fonj7/zXUbtlR/MU3kp2
X-Google-Smtp-Source: AGHT+IG2XXj/CkcA1dP47bUYhTzcr2bkyEkUdllUIt+IZlGPyySEb4hptfFDd9rPzizpAnBqyrwC
X-Received: by 2002:a05:6214:5c48:b0:6aa:fe61:1e54 with SMTP id 6a1803df08f44-6ab7f34cac5mr45277966d6.16.1716464334906;
        Thu, 23 May 2024 04:38:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716464334; cv=none;
        d=google.com; s=arc-20160816;
        b=GeUkFLtUIJAedxFAjlOdgUZAnVoJxcg2PnlMYtX9H/jkT1BFNYupCg4vZ7emRMUGRi
         WkPXpyhx7MzHTDFPueDcFAdM0SS55t1WSXo58w62NVPNXvdVTmZpCkUyYrP+f3ZW6Snj
         m5wCAkihDjq4UTovjH3+MqYVZaIEFqyvfpONpmtXLM2AqfS5mLZcO3kMW9zMsUH1/B1q
         MsgOjNLCvuOeXNocHjZicCKFKDmru2uAGpZcA6+DSfX4c6hujYuoJwC42/9fpZ1FOuC/
         V8PxOOFUZ68aUucZ3WL7u5ZtpwKxGkgGskMBJrh17aSJ55NQlKjsjlOXOMjdpgZ+aHqz
         Qzlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=W1puet64s5158zwEXqnlgcBncY+3lTT8aH2pqomzJVs=;
        fh=Ujw7LGigAvStJUGhZTKJfS9G8Zcm7feeLjKhANwUhd8=;
        b=Qe3UmMMD93Dj88LUCxFQcaHE+tX+f6FrZu1yMD9PEKggs4lwBWUYlE0en/mpTWu18X
         j8CSUp8uHTGs/T2GKDXJzo4LFeAtCI3Y6pPvWFp9eHGJ0Sde2rzhFJcLkGl+7QJGIY5B
         UQdvuTar5dUKVLZ927dpgggKH1lAingR8nKfo1eqVxdmFsnSg5gg93etkTzAAbwPD3v/
         cdoTnGxvujBgssvgtQjxWJ8uoPcjZk9eu1axVlcNFHG1fUerTGasuXvX10ZcwGl1hWLa
         YD8W9n2I4ihhTnQ8rrA5ZqwQUsAA5Fy2vi4nt+/1DyiDUuGXuG+Asw7XxqOnOgB3v8Mv
         1Z0w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UF7v5eB7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ab70cd02bfsi16492046d6.100.2024.05.23.04.38.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 May 2024 04:38:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UF7v5eB7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sA6mS-0003gc-H5; Thu, 23 May 2024 07:38:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sA6mQ-0003fx-OX
 for qemu-arm@nongnu.org; Thu, 23 May 2024 07:38:42 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sA6mO-0006DR-2X
 for qemu-arm@nongnu.org; Thu, 23 May 2024 07:38:42 -0400
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a59ad12efe3so535171666b.3
 for <qemu-arm@nongnu.org>; Thu, 23 May 2024 04:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716464318; x=1717069118; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=W1puet64s5158zwEXqnlgcBncY+3lTT8aH2pqomzJVs=;
 b=UF7v5eB7nhup9SmZSS4PX6mDxnFGTCb1X/ggLdfzFLnXAIihRX6/t1kE+P0MKYr0fc
 CRkNab/uBe0eI1WVI8x1g2vle8k8B2Mea18NRVHIkfxJO7SWvWTwyI+MhkGuVklm6hbi
 Di2gIQ3Zvoc2vyKY2gy9Ce3Gi+TlK65IfyrJJ1IAQytUVHJ1iQPZXLHB1m18YzHUIOl5
 1Ck7sO+o7LYivrI1Fdz49k4RQPJhmfgEKzKmIOVUaRWA8G/IaKCBin7IoBk4Hluquhdy
 bGr2hZ5p2E3F4Efz2hd59rKuE0jdKPBloxL+yOkVIhIcrj7mkbiA2f5eynw2whvZ01dh
 Ha9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716464318; x=1717069118;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=W1puet64s5158zwEXqnlgcBncY+3lTT8aH2pqomzJVs=;
 b=bftwvCXfbdU/U37L5Dg5JnrSt/3TnXnJP2FCXUgJSaAF4bgRV9chgXTuftQ+f2Uw3z
 NnCZXAlT3a7k/pFbOTif8N75y8zOzn/F/jBKrFI9ajviu+grSO3xmCzo3GyZj+b5Btys
 2TwOUQ2K1PdVKBoArcGN6Efs8OQT7FsL1oe5ZO7wjN9B0jQG0BCfidsAs3/3iQ0bOrCO
 LvZP30oYl5C4kiAitlMUpCm2kOelgzdEfpVEqRMWG2ILSxUcJE8apITTXBODUMUH6ogt
 1n37/YvogWgtt1KgpqLTeUxczUXBO8GiWPSlP3PSkc0ZLFp9nfGl7XMf0rON5ssvFhD4
 fO6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWw6WQtnx3cp8huP26BpkYe0z6SByqbvBg1wSPfUWLukkWYhjgD6zrQptVh3Zdj21FbL35JoWZt+ao1wFTh148/P0Qn
X-Gm-Message-State: AOJu0YzU/bwbioZCeRamWj+aTmgtbbJEypXvG4ZlycqDxzrDzRwRNAQu
 bEsRmMttdKjYL3g/PXiUayEi8dZL5T60NfbsF8vHYQLZLtiwXFp6YYm2H6hemAZWPnA/xV/ddPG
 BIdRRuRcqFKDj2T+9GI2ND6+okWv3bMEaT2aO9w==
X-Received: by 2002:a50:a6ce:0:b0:56e:10d3:85e3 with SMTP id
 4fb4d7f45d1cf-57832a4a1fcmr3759879a12.13.1716464318196; Thu, 23 May 2024
 04:38:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240506010403.6204-1-richard.henderson@linaro.org>
 <20240506010403.6204-15-richard.henderson@linaro.org>
In-Reply-To: <20240506010403.6204-15-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 May 2024 12:38:27 +0100
Message-ID: <CAFEAcA9Y3MDSN_sUmcNe7U6W2rPyDKMyp97N+0cdX+skbLTHLw@mail.gmail.com>
Subject: Re: [PATCH 14/57] target/arm: Convert FMAX, FMIN, FMAXNM,
 FMINNM to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 2LbSorrWlFCv

On Mon, 6 May 2024 at 02:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.h            |   4 +
>  target/arm/tcg/a64.decode      |  17 ++++
>  target/arm/tcg/translate-a64.c | 168 +++++++++++++++++----------------
>  target/arm/tcg/vec_helper.c    |   4 +
>  4 files changed, 113 insertions(+), 80 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
