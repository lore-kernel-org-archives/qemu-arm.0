Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp336885ejb;
        Thu, 5 Jan 2023 06:12:30 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt0ubR9x8fw4MwsEufchcfAKpm1Pcc/dwS7RbU7T0mvvQ4669SSDTxDsslV/ItOldmzFX8j
X-Received: by 2002:a0d:e615:0:b0:37e:9e33:fcd0 with SMTP id p21-20020a0de615000000b0037e9e33fcd0mr45660858ywe.33.1672927950049;
        Thu, 05 Jan 2023 06:12:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672927950; cv=none;
        d=google.com; s=arc-20160816;
        b=WGAi39aXVnOp7TaU+xdFyHnhNzudZTXY+L7g+mgaNSEOJc6GDmqve2rQAUfjjrO6mX
         dXHyyoL6k7nODbAtEbp8JfXMdGjJvxIFYAX+7AqnHBx84uLRgADq5jG6pYeOvny1HsOM
         Y9VE3nCiAektvlfLAfYaiY7GNpZDU+dt2o/eP8411etwELb/yOhV5kc/dlKoq/JMUsQc
         s56jOCa8lJrw+pih/vBWh+AzLnj5Av6rJQYwkpfCHlAHd2GUHhQzSusuhy7XJ9eDRLoL
         QQ8w8/lZAKbJUmsHuwRltGxvzKuYFySkqR4hiSpUvKDxbQkfTjUXBv/Q7ZS437fzOZnh
         DPMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=fKMUz6e++lzgET99/eAxEn9FQmWF7PmC1Ou66z/XW9E=;
        b=mOmnBTfWVKq/UKu5eX12bdt9jpSdX1buI3apbcDKKX/lS/hRkg9zu3q9IdFK5yHSj7
         RJd2l3mvTtIvMrh/nkbHyFVK/WozaveXECReCwGTSZSePM54ZwUOyDRVuvj/09a4sFSz
         yB4ogW10QGJ2aGsCz6Bwq+wAiWAWzDDNt/b3iwMBBCTc71WovMgRD3n6w1S8nIxY6srz
         WDPCf2UST75AgAkQuTLZWKNbpOFzu5hdn8KninKQBhjodXc0Q6z5kkCnC1uQ1eZ3GR2g
         mcdd0T0Fze138fiTbFP952F7mrhPfAO6fUQOOIdfmhtaoq6CLD6WVQJquLzLTr5KSDJo
         WfTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SYGTVBYr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dt41-20020a05620a47a900b00704daf2d9e3si17640304qkb.255.2023.01.05.06.12.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Jan 2023 06:12:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SYGTVBYr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pDQyW-0004nZ-2c; Thu, 05 Jan 2023 09:12:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDQyU-0004nE-Nu
 for qemu-arm@nongnu.org; Thu, 05 Jan 2023 09:12:06 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDQyT-00015U-9x
 for qemu-arm@nongnu.org; Thu, 05 Jan 2023 09:12:06 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 h7-20020a17090aa88700b00225f3e4c992so2157060pjq.1
 for <qemu-arm@nongnu.org>; Thu, 05 Jan 2023 06:12:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fKMUz6e++lzgET99/eAxEn9FQmWF7PmC1Ou66z/XW9E=;
 b=SYGTVBYr1erf/ZGFRHypVY4IRe6/yBsdUKNl5PMm8qzeiXZoErOUzpfg6qCZB0BKWT
 u3f6+WEAuaUEuFDoqcGAAcqmgeREcbpSCa0ra6xPGDErAH20slJ7gG3xwHK8oi+eG48y
 f8EQ4IWcuzzR08W31d68LmkR9KkudpiWsbzaTWTfsjAdPoHwJTSevQYPGb4HNUCXBx2h
 BsLMYJrrM0lpWzEDCGkHeaAM/H8MjXSAAc7T/1JI9Bd71q3D3HB1TQw4v3zehmIUdOy/
 PH04EP6EAQ3PvtZLajS4BP/CizIHiDDeLNr0gBXocUnX/JiaFe64QOE2azlzTcICRHy+
 xdCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fKMUz6e++lzgET99/eAxEn9FQmWF7PmC1Ou66z/XW9E=;
 b=kNkrc5pU9PQVKFV194ZkLKSSS8dq9yRFZUcpTz2iGjAKbPvPU+IzFXNX4y5lhrT6a8
 y0F930JcEsthZBrqPY9Cs51DvgpxDwiGRCvqxYJUJ0wO0d7lNosRJAShWuu5CM+iiL9W
 OzWCY+Giz62B4q+zD/kps+6CbnYHEA6H1xF5HLgl46GX5CZ9tCR3FHpwVwqRz59xK8yy
 Wx+hEx/jDxVaa644ebF2JjntOZPQEj/nPZ0haUMclN1mZL/qRjDvqS6+rZIHxcytw5be
 oKaHDNAz2w1UbxPWDD+r5kiBYMxS9pZ4ZNOHNfsdEvlctNHQsEyF/Yn4p4apdL7agQOA
 ONfg==
X-Gm-Message-State: AFqh2krLWK5PsXspJW8594Q2Cu5H3aS4FJyy1n/SsJ8h5R9iUNV+KPaE
 Y0QS3/BX5bR2YkpmAQ4lZRbRRK3hVgMSwDjFjbT36A==
X-Received: by 2002:a17:902:efcf:b0:192:ea33:5092 with SMTP id
 ja15-20020a170902efcf00b00192ea335092mr471627plb.19.1672927923573; Thu, 05
 Jan 2023 06:12:03 -0800 (PST)
MIME-Version: 1.0
References: <20221220142520.24094-1-philmd@linaro.org>
In-Reply-To: <20221220142520.24094-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Jan 2023 14:11:52 +0000
Message-ID: <CAFEAcA_UA-N-WTCLLS9=CXSYCnjOfESVj0T=ND6KHGhYuwM-Dw@mail.gmail.com>
Subject: Re: [PATCH 0/3] hw/arm/nseries: Minor housekeeping
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102b.google.com
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
X-TUID: agrBIICyY1HB

On Tue, 20 Dec 2022 at 14:25, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Constify read-only arrays and remove some -Wextra warnings.
>
> Philippe Mathieu-Daud=C3=A9 (3):
>   hw/input/tsc2xxx: Constify set_transform()'s MouseTransformInfo arg
>   hw/arm/nseries: Constify various read-only arrays
>   hw/arm/nseries: Silent -Wmissing-field-initializers warning
>
>  hw/arm/nseries.c           | 28 +++++++++++++---------------
>  hw/input/tsc2005.c         |  2 +-
>  hw/input/tsc210x.c         |  3 +--
>  include/hw/input/tsc2xxx.h |  4 ++--
>  4 files changed, 17 insertions(+), 20 deletions(-)




Applied to target-arm.next, thanks.

-- PMM
