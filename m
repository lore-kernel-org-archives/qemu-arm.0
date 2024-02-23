Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp685758ejf;
        Fri, 23 Feb 2024 08:56:44 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV8hqdZAzg43Ffx9xUTiTWLlcxv0D6rjyYUYtK2ke/GRF5V86SNCTVVCXMO44gVK1fN8eI8cTLqDquvJEtL9Z2b03kSsjiK
X-Google-Smtp-Source: AGHT+IF+AJVMBKM+O87iYf0R7HNPhg6LkgbjsVBF3FFWPJiX+c/PeAMqQKXEzPcRG+7yFAQ5nfEu
X-Received: by 2002:a05:6870:e413:b0:21e:5ca7:4dbc with SMTP id n19-20020a056870e41300b0021e5ca74dbcmr432745oag.12.1708707404275;
        Fri, 23 Feb 2024 08:56:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708707404; cv=none;
        d=google.com; s=arc-20160816;
        b=LMlD7tcjitzvBbHxwUAC9HJIuwug3FqOxUDANQCxqOM/bXc41ITu4ET4sYh1IMBJYA
         IE7td/+ZqtUpXiCqWBpLy+mT7+osXUrArGKYTI6ijelbbOo2xX66O7tRmhMjohEMWPzh
         ZOkunVxKr1DPmsX2K1Ns9RuuMWGgEDMqnRvBiMeXGspbT20FFctZKnVt4Ax+h++7/nWA
         cIIznDwckIE1nnGlY3qQxxDI8X7Z6JZWFP/ywJwLGmj59Ta3zRQv954jeP3H+CwGhbrI
         H2e2QV4sjP1dMUjA4uA17B/BOhP1gA5PP+9PkJdq4D7/PPSoFEhNGtIzBitHdM9T3LGs
         c74A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=uwc3skI/3lhWv27HfxcoZupOGYnPlBilnkVkbOqzDSc=;
        fh=gdBed72JnSifzQdV0PLkUCrNnp2PjbNCgzXbyzmTG1w=;
        b=CR+3QXG9fyxkCTg+1ge+B3rCo1iawGrbPY4IA3MxulXzO0BVGBCWMdVakwqa2gaH22
         U86GGhHFxmlpjzlq/22/PrEjXRa3s1zvxgfn/LZdNBoJAOps7uSWa4Ky1QazohVgycGY
         /48EclzXQcNbVMw4qkaj19eK3xdaGiNoPZJOlyhgusbQO+0/B+PxagiurU6v9p8GTAIZ
         df4jqp8hQExj8AR9Seu9cihZx9JCDRIaE72odk/RzkhK5XJMpCEDlgbXH/uwnhJmawbP
         gIAq0VaZRe6FnFKZOPaJirckgzKHqhLXdEmbxF/RFKgiP+RixsaITWYVBqiU1nQS5QHH
         zKwg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XttGcnAM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f25-20020a05620a12f900b007873e889546si2116811qkl.129.2024.02.23.08.56.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Feb 2024 08:56:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XttGcnAM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rdYqJ-0007u6-5u; Fri, 23 Feb 2024 11:56:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rdYbw-000395-F7
 for qemu-arm@nongnu.org; Fri, 23 Feb 2024 11:41:20 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rdYbv-0000zI-0u
 for qemu-arm@nongnu.org; Fri, 23 Feb 2024 11:41:20 -0500
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5640fef9fa6so1336076a12.0
 for <qemu-arm@nongnu.org>; Fri, 23 Feb 2024 08:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708706476; x=1709311276; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=uwc3skI/3lhWv27HfxcoZupOGYnPlBilnkVkbOqzDSc=;
 b=XttGcnAM2hwBTcOasfxt0rI4bknHrQVg8evwEc4HJ7/F0SA4h8TLDQLz0xu8O5DgE2
 RW+jGREqs7KmgzTFsEP5xPz8a0kR+nj2jTRRZcfpPMQYGfMS3/I1i02TTEbPw8QMO0TM
 0gGRHG6/qIhcq3CJ0L5MGL7zuw6J5xMDymbQBvfEub0/qHz4CPGJIHa+kWCqR31RddIz
 FWP6wR/s1sPpE8lW0sc+4Orj3bP0xRsqEtaVWLca/nn+CvxJGwOoogq6mr5HFtwCWKGY
 iPF/f03SKwEaCOgF+RMC7TxztU3YmlItdL6uaaZwlOKm42Jj2H/7sbsonvXUaIPL5sW3
 nygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708706476; x=1709311276;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uwc3skI/3lhWv27HfxcoZupOGYnPlBilnkVkbOqzDSc=;
 b=lmtz32gniJRLPRJuOCuHiy4kv3KRPjIDvnUDEMpj62HELO3F0q4jZqIlqKv4c2Zahw
 zyhAMHYgh1782J8AbP+3OwNk4f7dZnGmSSvTSZj9Ci0OlHQ+vOkXR5qibbrVlC5V7vLc
 VgpqHST438VPoUcjq2aSIgMExLnffkV1b/E3cWljjEB8XtD9okrNGCiieFTezUmqUREr
 K2/b8ecrXE/HgzayvzxOPTOJX23Spk89vqzUiHuOBfBjay750oOWYevulq9H1JX/7fFU
 wXGl4BiP/UK8wL6G2MosbiBibE3ePimMLFGI5Ay/NR/qyZbBUGXtP64G5GADvi4liawc
 4UlQ==
X-Gm-Message-State: AOJu0Yx33nGbyFJG+vD56brnBYrUvOxolFC0rv2nr4utiRakEo2yBPmx
 TaVoYD3Fhjecn7+UZJsPfnbNhZZspSEUvd3042IMP7piXEFXikZRzWwGT/On16OIvhucNS+Lzss
 EPdZOVQQ97jcLn9gsNBn97mQpETBOLhigs7PYdx0Gi0nTsoin
X-Received: by 2002:aa7:d6cf:0:b0:564:a4e9:3683 with SMTP id
 x15-20020aa7d6cf000000b00564a4e93683mr278019edr.16.1708706476481; Fri, 23 Feb
 2024 08:41:16 -0800 (PST)
MIME-Version: 1.0
References: <20240219011739.2316619-1-sergey.kambalin@auriga.com>
 <20240219011739.2316619-6-sergey.kambalin@auriga.com>
In-Reply-To: <20240219011739.2316619-6-sergey.kambalin@auriga.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Feb 2024 16:41:05 +0000
Message-ID: <CAFEAcA9Vm7GYiObgdA2CiN=LKCY1yJ2qGTqN-Qx3ZN_-Hsi_9g@mail.gmail.com>
Subject: Re: [PATCH v5 05/41] Add GIC-400 to BCM2838 SoC
To: Sergey Kambalin <serg.oker@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Sergey Kambalin <sergey.kambalin@auriga.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 7YQ+0XX/a5VQ

On Mon, 19 Feb 2024 at 01:20, Sergey Kambalin <serg.oker@gmail.com> wrote:
>
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> ---
>  hw/arm/bcm2838.c                     | 167 ++++++++++++++++++++++++++-
>  hw/arm/trace-events                  |   3 +
>  include/hw/arm/bcm2838.h             |   2 +
>  include/hw/arm/bcm2838_peripherals.h |  37 ++++++
>  4 files changed, 207 insertions(+), 2 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
