Received: by 2002:a17:504:5682:b0:1be9:327d:8ee3 with SMTP id r2csp1094387njx;
        Fri, 25 Oct 2024 07:23:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXXVOqxSzhKWNlPjGI++iH/cKA+T1Huyc3E7VbkLBc4Q0JjxBkqXa+k6C5i7FYPb4Gaa89paCeNBnj8wQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEjuzVb56pmhTIB6pIXsc6PsOVUzmk0j4+UbH2lbdtOELhiTsMWqu1Lqo4IQ4PP1tfazT/R
X-Received: by 2002:a05:620a:24d0:b0:7b1:1cf6:cfd0 with SMTP id af79cd13be357-7b17e5722b3mr1336027685a.33.1729866235340;
        Fri, 25 Oct 2024 07:23:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729866235; cv=none;
        d=google.com; s=arc-20240605;
        b=fMXKbSDaFqMyUXbuDQDv18lkbSbFMC43zKYikXX76nZ6RThRcDEVS/3E8ca4hdJZdQ
         HzQd1mwv2TcSSM+Hk8lUi+Mq9wElckCLPsIvg4eqMHoprf2rGUgv3n13D/xrGi4FYPiv
         wMOyii/C6cCsWEwFFIzgMrbe+6IlPICUS8jW52KH1Hd87MTD1FvrHfN3QyhxnlXznWAe
         wrg2xP8KYjDj7vUoOAjA0Bk3rD/+/1p0gD0CGnuK2dt90gYrMl5leXsdPJ7dZI4q6kNV
         5tj4AMzRVLxybv9tY1+9TxJp6+d5b/WQMIrQBcLPBP7fCjPPWaI0LumOQgnm4GhFQk8F
         xrDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=nLMYlHcdvCVqme3C29S30Xolv4HvZ+Z8lZg76ycL2/E=;
        fh=qiZPS4UC8WZTyfFCFo+5R+0C+WhFaVgWm6qQmIOAEaI=;
        b=Vv9QSa9HkCYXfWO5lPVAnfvedZuNdexS5ZpZ80mX0hJL+mj8R9fGz5/nvLB94NZq4K
         kYtpT8ILgkKMcvvOliCYAIJ0R6QtPeFpFULWtxG8sX7srrZL6noifXUwmsyUGCfZywYW
         sFIWUX7G7CNppRXIvEaSOFV6kVDLEKQ+iPneUfXwAycpeyrjOJEcZZwss2rNOjqBLJlI
         f5KBmZA7G1LzAAhejtjm7PmhpbwCesjxWyaf/2JoT53brX4wNIDv5NRkBCo47KyBntT+
         t/iFs4UsHNEJCJTWA59SE86lRgI/+s3VLx9DCDYGK/c3Dad5qA0Rnlnsgg28yVIGFyeN
         seQQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hKcvEo4T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b18d3599a9si155986385a.533.2024.10.25.07.23.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 25 Oct 2024 07:23:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hKcvEo4T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t4LE7-0004P9-D3; Fri, 25 Oct 2024 10:23:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t4LE6-0004Od-4K
 for qemu-arm@nongnu.org; Fri, 25 Oct 2024 10:23:42 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t4LE4-0000wX-BU
 for qemu-arm@nongnu.org; Fri, 25 Oct 2024 10:23:41 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5c9c28c1e63so2522750a12.0
 for <qemu-arm@nongnu.org>; Fri, 25 Oct 2024 07:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729866218; x=1730471018; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nLMYlHcdvCVqme3C29S30Xolv4HvZ+Z8lZg76ycL2/E=;
 b=hKcvEo4TAJ2IyVNHAe7TxsN856oB1PnSW5LQ61BV4tL2B1ZLoScWbUtecSxAyTTpvb
 xHX2bE3/zs6/EpDkeYE31NzcoN94hfWQosM2J+7Sj8WRyH1cT3+pjrHlpOR5A9pyqNjL
 isF4RfYaGcfhJQlAQBKid5vSDQXtQg0UFvrvJrzzLwMQu3yHsnEvrtdU43ct1X3LRSCZ
 Pdln5cOizbIqW843GvKb0/na3SuyPCIiHvIFEoBW6MUQ5DBDOiyFzTtuiMHJJVSxNXR1
 bbv+4RSHDBrcnUmDOY7PS0gLe/sVN1P7fZ7UEujCgwOyO5QvM1jQJWbUE19+VbO+781f
 i6Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729866218; x=1730471018;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nLMYlHcdvCVqme3C29S30Xolv4HvZ+Z8lZg76ycL2/E=;
 b=jsXVPPxNmRSo2KZqm5a1xKbAFGStSI++9HfunP7pUQG/zqaaaKNki8wuV2DN81XY1k
 J5cVk8P2PUjWawyWzEKov1RYxW6gs1mosCWxxppIonZltkn1HkvsaNZcyCMIB8sRyr0j
 OtbzDd7sNdr2ZfT7Fd6hROrGC8hdJScW0Nj8ktXRSumJyprW6INiNzxLHaTOFpbFe5xm
 gYl7i18k+ZftC4Fq0ZTJZRmXPbK8DStk32n9X6lsCcb+zRXwAhklNmWiLoDWvlQsgtt5
 XgfyTEX4JQHrJGsKW0wSCjyJkb0cV1exdcJIFlQVa+/akK+nEScAt8P8zuRrvzqw2vvH
 sDHg==
X-Gm-Message-State: AOJu0Yyo/GMFQ6lFLILJf9wbyqjV+Sk3JdMyxe+AOuKiZpIR+an6fazi
 A1nlAhTs51gfIN4UQzLWw+SzxWFM7MRg00D/kp2nKa5ndRbu3dgVPKIYTWZyDA32aA3UFtCAd70
 CeO8b7rxZR6qhoCk1wXNzX5iYwvUdYtC+6nf48w==
X-Received: by 2002:a05:6402:3586:b0:5cb:6869:24b4 with SMTP id
 4fb4d7f45d1cf-5cb8aa4368emr7146380a12.0.1729866218146; Fri, 25 Oct 2024
 07:23:38 -0700 (PDT)
MIME-Version: 1.0
References: <20241024063507.1585765-1-clg@redhat.com>
In-Reply-To: <20241024063507.1585765-1-clg@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 25 Oct 2024 15:23:26 +0100
Message-ID: <CAFEAcA-Ee7Dw98a1AmniR4H0VoDDyLowYx=7ZZVC3iGvcNvoOg@mail.gmail.com>
Subject: Re: [PULL 00/17] aspeed queue
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
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
X-TUID: HymAE2dHvNjm

On Thu, 24 Oct 2024 at 07:38, C=C3=A9dric Le Goater <clg@redhat.com> wrote:
>
> The following changes since commit 6f625ce2f21d6a1243065d236298277c56f972=
d5:
>
>   Merge tag 'pull-request-2024-10-21' of https://gitlab.com/thuth/qemu in=
to staging (2024-10-21 17:12:59 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/legoater/qemu/ tags/pull-aspeed-20241024
>
> for you to fetch changes up to 1df52a9ac0897687cff7c38705007b2b58065042:
>
>   test/qtest/aspeed_smc-test: Fix coding style (2024-10-24 07:57:47 +0200=
)
>
> ----------------------------------------------------------------
> aspeed queue:
>
> * Fixed GPIO interrupt status when in index mode
> * Added GPIO support for the AST2700 SoC and specific test cases
> * Fixed crypto controller (HACE) Accumulative hash function
> * Converted Aspeed machine avocado tests to the new functional
>   framework. SDK tests still to be addressed.
> * Fixed issue in the SSI controller when doing writes in user mode
> * Added support for the WRSR2 register of Winbond flash devices
> * Added SFDP table for the Windbond w25q80bl flash device
> * Changed flash device models for the ast1030-a1 EVB
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/9.2
for any user-visible changes.

-- PMM
