Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp621710njb;
        Fri, 4 Oct 2024 11:17:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUDstj9uHLxIrK7Ouw2r+61Qwtt/yJRXZ3O2Fbpx8Ud9GymXeRAtKkwQ1gYbLToJFVwPcxbFrfEiHwiMA==@linaro.org
X-Google-Smtp-Source: AGHT+IG6E0lt5fqfS3Rsi5FaoB4wQo/a+cqkDCXteF6hYxBW9u86p8C7FtnglCCdxSn5B9ZlCRNt
X-Received: by 2002:a05:620a:1a25:b0:79e:ff38:5806 with SMTP id af79cd13be357-7ae6f486848mr607960785a.46.1728065852363;
        Fri, 04 Oct 2024 11:17:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728065852; cv=none;
        d=google.com; s=arc-20240605;
        b=RPJ9OubkJ0214zDPlbjYFTWR8mF4pXDLX3rtY4c97yyug165JnKFqHrYVjd6GUb2/q
         +nLqWdgWdpM9//ep60MNyCXS1j1uLcv3tvFIyEemlbQI80zAH/M11hUhXEKm/chGnXSr
         wMIAOmjNeXKdMS+7kU0OKO5/83GFHHIXAQH88CMQCcE9oPeQSaRsJvZ6sDZJu3fKe3N/
         U4ssxpH64XdaLToA08yQsXGT6e4aNtwsyUWO0dIWcsAshzuy29SJ5uuHF4G9rVs+3tf6
         Iem1rCKnuGF30vQNnRyitxaDF+sgqPRMSLMZOeyZboYBgwjN26rrSaV0T28bkGEetNgw
         B+ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=MpCOpQT1mnf0KEcNztOskBKboRKrECpYZzHTs1f9tMA=;
        fh=XPRit4+GyGpyz5l/IoMDlDVf3o81kIgQJKGRzV3lqrA=;
        b=E6WAGqHf+uutJnrc9TouNl1G64yJPHrM18aOIzaAb8BTPI/2Q6TGDh2Rz/GjO4yx2C
         uNuJ9d1N8cwaepXKfnu2R1DXk5zx3Q7yL7b0tUkP/f9Mmo4RAM0QaVIZavOmvIlF2Omh
         02t3qtH83kbKxAyRU1OskoZz5D3ri8l3Bj6rtf/omamefrjTkkJ+cqx9YIoqX38T9L3L
         HIW6h/DF3cruwVuqV9VMTl/myuqD5zv0K7E27Ink447YUKYM9GW7GJypB9bW6NABGMZz
         6Zu/UVewhLO3bCgxbIp6rWAm5V+85dberQxNTsv66NgPfuN6zdU1O+iWyqYwuqXXbK6x
         jWpw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ltK8Wiei;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7ae757741fbsi15815785a.679.2024.10.04.11.17.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Oct 2024 11:17:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ltK8Wiei;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1swmrK-0008Jy-3p; Fri, 04 Oct 2024 14:16:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1swmrH-0008JN-DH
 for qemu-arm@nongnu.org; Fri, 04 Oct 2024 14:16:55 -0400
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1swmrF-0001xe-Oy
 for qemu-arm@nongnu.org; Fri, 04 Oct 2024 14:16:54 -0400
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-53959a88668so3181689e87.2
 for <qemu-arm@nongnu.org>; Fri, 04 Oct 2024 11:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728065811; x=1728670611; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MpCOpQT1mnf0KEcNztOskBKboRKrECpYZzHTs1f9tMA=;
 b=ltK8WieitQ0zcHqarJscpUfmHSAiny1Fh4JPXeHFTIvwRCplrz+JFb6MMUbFi6n6LT
 4tZUvluzKydVHsXV9FtihyoR4kTh/9s7gyLQ/akFVNkTf5Y+PVMpmR7Q01ZGchCOXIqF
 1nnl43ymUNNYsi3e0L+iUDr97TuE6VtCtc8jPloZpM5qOlVJpUvQ1AGvUK4ppQrHphe7
 80h8jpwd1lXs9tiYeQkK8QzrA22UgHdELtzPYXXrkOHlWiCh06nafQo5uNIeDO9zkJgy
 i+3z+73tzy69ENnoTmCCcK54TaA+fiNx2GFBRPfkcFp+HptblxKALLLWPMo0OYF77NoX
 6tQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728065811; x=1728670611;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MpCOpQT1mnf0KEcNztOskBKboRKrECpYZzHTs1f9tMA=;
 b=YVaVnxSYrUDRne3lVfkt9S912XC+4DvjNNZ3bIBb7OYyjSw/e3Tx3sVq9yGdD6Q2r8
 YSwGQYokSSt3jt+6SaIlKRmrX3BmIRhixD2+iOGuXpm8iHNgcyUCn72yttqKufYryDu9
 tqcqE0M1C0cOVTyspAX68rGWmyBS51e3V3tg09CXerTnWRWW4pobb6+u0NumwzzRJL7c
 mzwJm/YAxNnYmfVZ4clgJCCtwelfIcNj7JVBxGcOYrIHUHd8+IjePKw9xNbaT90NO+RD
 u54+EDwi+XanLj6xU0wy+UUAF4t8ODLNAlYzq31pUb005XlwvuqrrSoQ4Ft5MnJh/iWy
 u/mg==
X-Gm-Message-State: AOJu0YxK8G/6C4M5W1EophpzviuNN/34ISLeM4rzUd52DECEuEPhM53M
 MvrHNpCwUR914Vt5AqIx4RBh3soHvmqJRsbaz2p2SeBwH4tczQQgGNGDvRkEOiXXfOxmEOOgSOw
 E1B5z+b2WP0sdAx0z4QN9ngBswSyJM1w6b5Be57iBvrTGuGMY
X-Received: by 2002:a05:6512:104d:b0:536:54df:bffa with SMTP id
 2adb3069b0e04-539ab9e1750mr2434506e87.45.1728065811282; Fri, 04 Oct 2024
 11:16:51 -0700 (PDT)
MIME-Version: 1.0
References: <20241001095125.26043-1-adiupina@astralinux.ru>
In-Reply-To: <20241001095125.26043-1-adiupina@astralinux.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Oct 2024 19:16:40 +0100
Message-ID: <CAFEAcA-bZt3pqDUk0BsV9Ztav+oNB7Wj0cpXgXspKZqLUDfBXQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] hw/intc/arm_gicv3: Add cast to match the documentation
To: Alexandra Diupina <adiupina@astralinux.ru>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, sdl.qemu@linuxtesting.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x135.google.com
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
X-TUID: /IKdS1nAosFW

On Tue, 1 Oct 2024 at 10:51, Alexandra Diupina <adiupina@astralinux.ru> wrote:
>
> The result of 1 << regbit with regbit==31 has a 1 in the 32nd bit.
> When cast to uint64_t (for further bitwise OR), the 32 most
> significant bits will be filled with 1s. However, the documentation
> states that the upper 32 bits of ICH_AP[0/1]R<n>_EL2 are reserved.
>
> Add an explicit cast to match the documentation.
>
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>
> Fixes: d2c0c6aab6 ("hw/intc/arm_gicv3: Handle icv_nmiar1_read() for icc_nmiar1_read()")
> Signed-off-by: Alexandra Diupina <adiupina@astralinux.ru>

Yep, these look definitely like fixes for wrong code.
I've applied these to target-arm.next (with a cc to stable).

PS: for future multi-patch submissions would you mind
including a cover letter (of the form generated by
'git format-patch --cover-letter')? Our automated tools
expect the cover letter, so patchsets are a bit easier
to process if there is one. (Single patches don't need
a cover letter.)

thanks
-- PMM
