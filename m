Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2170782ejf;
        Mon, 26 Feb 2024 08:42:46 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXiSt/6cbzUpC1CDqfEvEV8EQ2isnPPDFwmyJ5fN8o7XCQwxf7gscgjE8xaWmWz7YjZJ+BGZodI+Q7f0FPuAIFYd8LOyOHJ
X-Google-Smtp-Source: AGHT+IGQmULsV5Wj5o3o0kXN3QDSj30xmNdCC/yMPGJKYoQXSc/ANo4uJXhU0DO5YM60cEMBoBdM
X-Received: by 2002:a05:690c:809:b0:607:cd29:8ae7 with SMTP id bx9-20020a05690c080900b00607cd298ae7mr6364653ywb.15.1708965765969;
        Mon, 26 Feb 2024 08:42:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708965765; cv=none;
        d=google.com; s=arc-20160816;
        b=UKwd7GsHV/wb5SMiaPjxt5VIaWGudUgr2rO2sYu0G10f9YEUw0LNeAS4v3LLWzBJS9
         NBCQQVMl1H0Gq2OO2Gzjt3cNGKtSaiQVoaH+j8CzAbUk5yY56Zyfig9tnFxTIG+np6Ia
         MrdxIjlvUxWsMKKEcM7MH63tUgGYt9zk4ij+KYkRqaEq9HJm2kZLtHV4p5ex+2BfrKsX
         E++Kk0JI+6jg2cAWX4srjY39cB0XY6n7XfHnzaCVM125rw1nEnbBZeHyaG/SELu1ehzM
         i6uUZOTAGglVJkIh7NP7l/3dhmDheg3vAuPYKXyAfYrKDYHlCohDoc+//7LFjaPtfzwA
         DkbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=QkBRgOqryAmNxb1waI8xBDsOVAVJ/bcpv8hsuSt+q2Y=;
        fh=gdBed72JnSifzQdV0PLkUCrNnp2PjbNCgzXbyzmTG1w=;
        b=i0C7YzzrB+g0jcgubkEeZL7lxMUjYMKOrm9xYG4j0fAF92eW70zzGNOQWeZLa+RJnU
         yG+pKl1ji8w2L7pXVywLXwiSqTi9MzTmlrfA8U5J7zvUHicVPsI3f8/U4XHc7//wNqxu
         aJkoccU1ctmdriBhQbDU2B/juf2+As18D2wqDWl0S5Cu5bPPUOLVoi2kRxov2jGjAI6e
         XU2T/exBPNXCiNqJNjy7nIpa7akVJVOXNL6iUqPNX5QLC47YzXmj2ob7HPbcqKaRuF4x
         JSMH4cBjSUmRzRooODIiOadmgXE3y2HqENORZliwja7hKxWss53FrFKgCFuyMc7y59Nn
         mUUA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Uc0siva3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q16-20020ac84510000000b0042dd78ecba6si5334433qtn.580.2024.02.26.08.42.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Feb 2024 08:42:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Uc0siva3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ree3s-0000nb-FG; Mon, 26 Feb 2024 11:42:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ree3p-0000ga-6u
 for qemu-arm@nongnu.org; Mon, 26 Feb 2024 11:42:37 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ree3j-0004xF-T0
 for qemu-arm@nongnu.org; Mon, 26 Feb 2024 11:42:36 -0500
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5661b7b1f51so724853a12.2
 for <qemu-arm@nongnu.org>; Mon, 26 Feb 2024 08:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708965750; x=1709570550; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=QkBRgOqryAmNxb1waI8xBDsOVAVJ/bcpv8hsuSt+q2Y=;
 b=Uc0siva3rihPY8xVUKl0wd/zO6CWjZuDzisQJcPjyM9fK70Fl5kvMtyqRSxdGCf4OR
 hgIsSBkeyTITYbrx/6k/mj4It2idiaUzbygTuEs+FKENZ9dkb5l1Smswnjqg/EmOWsCC
 G2T/+iQ5lvrgmCJ0MFMPuzbL1Kc+D5BwPtYasiJcZjHaGKgqg25Zxx4rIHJBsU9DxKJW
 O6jENKlNLZS08pgG80AjWhHA4VEmJiTge/BUz/7dGJ5iFBQl4Z5RrzY+OpGPHFmx67Ei
 vVbe/uGHzHu1Nh/VA8ocnRy21IkfT2ZzzX1JqMh+5sauri+eFOnyOlWZGM/l7UdnwLdE
 wJig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708965750; x=1709570550;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QkBRgOqryAmNxb1waI8xBDsOVAVJ/bcpv8hsuSt+q2Y=;
 b=HZ2okGFblilW8s2GApwwEwpkgNfLzTp7CGy64GeAaemmWBwZSIPgcyHTjKgU2pt1d7
 EXlocjJpngW7z+VzW6DD0S747mw/9FGpJY8kpNMGG/y50zE3ibs8Khx5cBB8YSEsfOye
 By2E0HkBWqFsw8NubeANgtOkGwlnglSoF9zjsDMzHgObMEkuetbqToNAWqwdkZp1CffA
 1juBwlUN5JaiSyOx8aOUzm2vvmBJy6MWRB/PzE1pNaVzYj+oP/5z9RefVb9Ii1V3zkqV
 C7jxCXU5bvZD88jQZ+iw2oyCGGlhn9FcCTlEweBb/eDdxvo1nDsr2O9qBJo+Qu2IqZ+L
 Dgaw==
X-Gm-Message-State: AOJu0Yw/pn9li0chN+rbzTk7NOESQgx9UBhEkM7SEyYr5anf9fnC7FDl
 SLhEOCtJ/oBquh8EF5K6F3SWRINvmO32dXPL4AEx3CEau2mkNTAwtPnTX79tUNvmBRLYiFFU7Xa
 UB+XwnhkEzWjNUgta6P81cVD1Rzq5bCyhDz6Qew==
X-Received: by 2002:a05:6402:3411:b0:564:bcb1:45f6 with SMTP id
 k17-20020a056402341100b00564bcb145f6mr5193402edc.15.1708965750672; Mon, 26
 Feb 2024 08:42:30 -0800 (PST)
MIME-Version: 1.0
References: <20240226000259.2752893-1-sergey.kambalin@auriga.com>
 <20240226000259.2752893-42-sergey.kambalin@auriga.com>
In-Reply-To: <20240226000259.2752893-42-sergey.kambalin@auriga.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Feb 2024 16:42:20 +0000
Message-ID: <CAFEAcA_xdowvZkxFC7ypEFRJSTLDkdx+9E3_fwPNY=S2sK5=UA@mail.gmail.com>
Subject: Re: [PATCH v6 41/41] Add RPi4B to raspi.rst
To: Sergey Kambalin <serg.oker@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Sergey Kambalin <sergey.kambalin@auriga.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-TUID: w4fyfaJ2hsub

On Mon, 26 Feb 2024 at 00:03, Sergey Kambalin <serg.oker@gmail.com> wrote:
>
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  docs/system/arm/raspi.rst | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/docs/system/arm/raspi.rst b/docs/system/arm/raspi.rst
> index d0a6f08b2b..c21b27744e 100644
> --- a/docs/system/arm/raspi.rst
> +++ b/docs/system/arm/raspi.rst
> @@ -1,5 +1,5 @@
> -Raspberry Pi boards (``raspi0``, ``raspi1ap``, ``raspi2b``, ``raspi3ap``, ``raspi3b``)
> -======================================================================================
> +Raspberry Pi boards (``raspi0``, ``raspi1ap``, ``raspi2b``, ``raspi3ap``, ``raspi3b``, ``raspi4b-2g``)
> +======================================================================================================
>
>
>  QEMU provides models of the following Raspberry Pi boards:
> @@ -12,12 +12,13 @@ QEMU provides models of the following Raspberry Pi boards:
>    Cortex-A53 (4 cores), 512 MiB of RAM
>  ``raspi3b``
>    Cortex-A53 (4 cores), 1 GiB of RAM
> -
> +``raspi4b-2g``
> +  Cortex-A72 (4 cores), 2 GiB of RAM
>
>  Implemented devices
>  -------------------
>
> - * ARM1176JZF-S, Cortex-A7 or Cortex-A53 CPU
> + * ARM1176JZF-S, Cortex-A7, Cortex-A53 or Cortex-A72 CPU
>   * Interrupt controller
>   * DMA controller
>   * Clock and reset controller (CPRMAN)
> @@ -34,6 +35,8 @@ Implemented devices
>   * MailBox controller (MBOX)
>   * VideoCore firmware (property)
>   * Peripheral SPI controller (SPI)
> + * PCIE Root Port (raspi4b-2g)
> + * GENET Ethernet Controller (raspi4b-2g)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

For the "no PCI/no ethernet" initial version, I'll drop these last
two lines; we can add them in when we land the pci and ethernet
patches.

thanks
-- PMM
