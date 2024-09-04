Received: by 2002:a17:505:1f8d:b0:1be9:327d:8ee3 with SMTP id pt13csp45729njb;
        Wed, 4 Sep 2024 02:01:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX9ikkhYc3rrLU6vDW7aufm2l1dwLXdBHJwT8NmTIIJrqgo4zS6sozPykCo2rWYPgiF2e3Ld8AqsoPbRQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHfXWZUYhlShER+mSLlsdDdRk25OliI/C8mcL5mqZoVW5qD73DbToqPdcY/K1SOa0eIaeyE
X-Received: by 2002:a05:6808:2006:b0:3df:dc1:4da3 with SMTP id 5614622812f47-3df1b72a837mr14880760b6e.16.1725440518119;
        Wed, 04 Sep 2024 02:01:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725440518; cv=none;
        d=google.com; s=arc-20160816;
        b=CDiWfQxXrYBMjfuZIZLMggLRLfatZvoLaQf0Yxka2Qf+F7+JGGpgD5D3o76TOxS9qJ
         hGgtz9UxVgyFB0NnvA3q5nuvfpeMcClu2qdnL31gndolNfDeN6qpvw6ol7nJQTBwgzGS
         SAjKWd8osvlo5phvKaJiQdJ5tTnB+xHoGAIvdAiFpQYER13GKf5e9/WROZCEOAKyTBuz
         lpi4oAkL5m3K3q16mAuwphAudksRBEERIl05BoMcSVsOrTTcv6Uk/SPs46ifoX+eSFOG
         b+tSpVjkU9Uvkh+LNZG9ZsifKrq7nwhu/KYTD3Xze0CDt3uu90VozSOSb0aMu8ftXRwv
         7ThQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=ew8CZVkx/AZktCKaLycnTdWlbR++RhXgyH2pplM37P4=;
        fh=DSjZHwcSgUkCVTKi3HC4yABnyUL5FUG0cUwHpxobYMY=;
        b=gwkJhhkblwND2khBcqoC25YO6dCI3X5SpbjwU5zMEdjre7ThCmT9Za+cdIf8FgcEm1
         sWbutrB40LX8YXyYT7x6ek2RTifBaq0W+gTvNHHUN2Zii72414eJxakIRXlteqbIEXqL
         zi7VQWSKqkHiD88HOAnswL++2lWmGVKmn7JRWthkTMenQTAv17Ydvh6+xHPKKfbSHwqs
         b5hdGo3GXCw6stFDAlThqRRJcY4FwITOPKSI8pIfZGAd1RI/oD3LGjN1VktWELpr+sNm
         rdgZKP7ZgH2/Jr8zPCwE/KtHBQBwdX47/+gKs+HAqLyzylBNjjLaWYEdxlnOtvk45fjO
         ywCQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=hWyKfVmA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-84871c689adsi74865241.124.2024.09.04.02.01.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2024 02:01:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=hWyKfVmA;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1slltU-0003mx-7C; Wed, 04 Sep 2024 05:01:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leetroy@gmail.com>)
 id 1slltB-0003N3-KJ; Wed, 04 Sep 2024 05:01:23 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leetroy@gmail.com>)
 id 1sllt8-0005fN-RW; Wed, 04 Sep 2024 05:01:20 -0400
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-715e64ea7d1so5353278b3a.0; 
 Wed, 04 Sep 2024 02:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725440476; x=1726045276; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ew8CZVkx/AZktCKaLycnTdWlbR++RhXgyH2pplM37P4=;
 b=hWyKfVmAjfEb87KrY6w5XyjMSCQg8Ryogbms25fIx9GMw9luRZy7F/iKpDc1vl/l5E
 WFSX/7GEjwrgM8wvL7DPyIiVC/oZ9kKX+ZZuXVm0695UDqAQonH4rQe3WQCpy/zLAB34
 pLUJkRlJuSWzItCyQB997V7QvKQ8VELmWyJmJZKHfF6qQdQUPQXJgSo202vRvCArlZqv
 1USsW/uZmBGBiP2TCZeJyUJYtYj1p4C1GYjVLizWkB0TAS+EzFdKtYFNYeG7faO20pei
 MBj4+SafP5phMj8QeleghryfqMKg33s5z41BrasrCRy0Qp2saHQf+xSiudjsUDTySfHn
 B5Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725440476; x=1726045276;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ew8CZVkx/AZktCKaLycnTdWlbR++RhXgyH2pplM37P4=;
 b=G/tFvaSCqBQVGVClEOGLe9hH3KUep51fC3h4ynFHaAC9L5Nwggm4oSyiRKiBPIKrnk
 W/UwOr5ayj4wsAbLaVDR8gtNkIidnyFK+zdtweUUW+3uPvdPJUWehOAMC0ERkxdGDyy9
 61c0geSz6ggL7eqLMuY5nEyXbkG2fEXH/n94z+zyz4VYohJKC6jQ3g3pB+3S5YKzNdO/
 reC3j8r7mnWtIHuBKSZtWa0TCT8DP1yV29Ke1+ibbVARidGFZ71i8Z5z2neW5thI3MiQ
 8eZu2l9o6NGhQGG2jEBHr2dkVaa2DlKLnqJXbUnkTIVR7PJGLv9kKnidyKLHQh54+rRO
 z3mw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0V3hoNjeL13z1w8MJjVujjwYBEn8+IEa2Nldh2jtL9jpT2x9+rmbOAjn1uxQ4FXO5A36qLHZWzg==@nongnu.org,
 AJvYcCXMdC8V3AoqXOxLiFvdJfI0nTP4ZteQm03lznPqlTST8mm7OVGl8lBu+CTbtwlKxIkcpiUGNV8UBWQMvg==@nongnu.org
X-Gm-Message-State: AOJu0YwMq/ByRaY+U58oODPDbMOOuiYfXrlOyrfuo8FHBrAs5vPVCQfv
 DTtY/H9yfzDFHzv2hVG3viUOoyEled8CFLKPF7opZ3yBm1fvdzqhjlhP6mGXdXYZC8s9/05fEkQ
 rdSZvUP3mBR/yGyLZSc0E1TB8Mtw=
X-Received: by 2002:a05:6a21:6b0c:b0:1cc:9fa6:d3a5 with SMTP id
 adf61e73a8af0-1cecdee3cc1mr17286837637.10.1725440475842; Wed, 04 Sep 2024
 02:01:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240903083528.2182190-1-jamin_lin@aspeedtech.com>
 <00aac81e-ff43-4526-960c-782e27ae043f@kaod.org>
 <SI2PR06MB50418DD956AC152E4E0911CDFC9C2@SI2PR06MB5041.apcprd06.prod.outlook.com>
 <c418168b-eb5c-459c-85b1-c7766102e558@kaod.org>
In-Reply-To: <c418168b-eb5c-459c-85b1-c7766102e558@kaod.org>
From: Troy Lee <leetroy@gmail.com>
Date: Wed, 4 Sep 2024 17:01:08 +0800
Message-ID: <CAN9Jwz0cRRb308_ZOuwOsJsPLiKp3sugGJ-YzhvALv3-f+yaCQ@mail.gmail.com>
Subject: Re: [SPAM] [PATCH v3 00/11] support I2C for AST2700
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Joel Stanley <joel@jms.id.au>, Cleber Rosa <crosa@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, 
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Troy Lee <troy_lee@aspeedtech.com>, 
 Yunlin Tang <yunlin.tang@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=leetroy@gmail.com; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: iC2bEciKxPAi

Hi C=C3=A9dric,

On Wed, Sep 4, 2024 at 3:29=E2=80=AFPM C=C3=A9dric Le Goater <clg@kaod.org>=
 wrote:
>
> Hello Jamin,
>
> > Just want you to know that I and Troy are working on the following task=
s for AST2700.
> > 1. Support boot from bootmcu(riscv32) instead of u-boot(Cortex-A35)
>
> Oh nice. This is a good topic for heterogeneous machines !

The basic model for bootmcu(risc-v) is working now, but we're looking for a=
 way
to integrate sram/mmio/dram together.  The ivshmem requires PCI, it might b=
e
too complicate for our use case.  There is an ivshmem-flat probably more
sutiable for us.

[PATCH 0/4] Add ivshmem-flat device - Gustavo Romero (kernel.org)
https://lore.kernel.org/qemu-devel/20231127052024.435743-1-gustavo.romero@l=
inaro.org/

>
> > 2. Support GPIO.
> >
> > After we finish above tasks, we will upstream QEMU and send our patches=
.
>
>
> There is also this issue we discussed privately on SPI write
> transactions failing on the AST27000. It looked related to
> aspeed_smc_do_snoop() but we don't have a good fix yet.
>
> When time permits, could you please open a gitlab issue with
> your findings and logs, so that we don't forget.
>
>
> Thanks,
>
> C.
>
>
Thanks,
Troy Lee
