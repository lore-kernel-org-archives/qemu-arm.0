Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp624831njb;
        Fri, 4 Oct 2024 11:24:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXVyytOldjBOkfhHJPv52lw7eAYXbL2ywwRaG+CqhQJ79LOh4DGfRLipGS5ihbjCy0XbuiNPl/Xmo2+wQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFv5WHXeeDANYaeIdXeAc/MjswPYKDUxQ9gMn+aKC6f8GsmhQoi/IUSvnAIeCkJ/iPu8fdZ
X-Received: by 2002:a05:622a:5c7:b0:458:532c:1e66 with SMTP id d75a77b69052e-45d9ba87308mr60136291cf.33.1728066262511;
        Fri, 04 Oct 2024 11:24:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728066262; cv=none;
        d=google.com; s=arc-20240605;
        b=DAK3oItZDOmUyZ074SABp03PFkBUERE9Q3IWnUISA0C4pG9D611wAD1zB8W6VWjrC/
         RsZbOnWYuO3SdB8wbHu4OltzoSDdKSc/2xxIWBpqr6cED9lU1f8bTOT4WPKIBD+agk7m
         HyyB9X21tmUbmFtWLSviEjqJTo14mQY2VMb+UiUMCgPwChXVwJeStvLcA4JnxYQTvc4q
         NX99XFyfzceNwaFXTk2DUt+vd6fcvJMZPtJoe0IgfGBKuLwU7Ewy6pSCRM7IwYTae2QR
         TXDji9MbgxdGGwhAEmEWfGK3+AMUSzp2MWsEf8lVq1Tqwy3qUTvJjWq9KzQ8e/DKFdDY
         Hgng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=daj2G7v6GYNNMy/YdduAt2P4YOw8SO/gZvr0DGLa6xA=;
        fh=cw98dB6PlZTkfkvoi68yEJS+JjHyOgPJRZssRvNnllo=;
        b=eAeFOCagvSXXAxZaR4S1muI706i7RsbUYtur1uMRsxhLX2O95vX9Bzdu0s2gPBd6Vs
         oYREYpPUNaH0/oBIcFezOX55hyRjaZ3wXry94+SSsjvlB2k7DhCi2+XvkpPZ7QpLkH80
         7WCeRPj4af6Ofrmg9Dte5lOTMCvcpn1z61UKtl91k1h5tSI7yEFXwu1+mIzONClqDrdK
         tmf5CA5qjp6iMlAbLE0W4cVvXT+TTguJKQKfuVvBtU8zTrHZdsK349eCRtFmeqDZkbE2
         F7wa+oZA4HbfjB3tUXj7Lmuhhn5NFR2aub5yqE1Sw68QOTcKDk6pf0eJN09NAxMMn5H1
         bCrw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=h3q0omy8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45da74e673csi3154881cf.207.2024.10.04.11.24.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Oct 2024 11:24:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=h3q0omy8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1swmy8-00012e-FT; Fri, 04 Oct 2024 14:24:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1swmy6-000127-VO
 for qemu-devel@nongnu.org; Fri, 04 Oct 2024 14:23:58 -0400
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1swmy5-0002ZS-Fs
 for qemu-devel@nongnu.org; Fri, 04 Oct 2024 14:23:58 -0400
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2fac47f0b1aso30897811fa.1
 for <qemu-devel@nongnu.org>; Fri, 04 Oct 2024 11:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728066236; x=1728671036; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=daj2G7v6GYNNMy/YdduAt2P4YOw8SO/gZvr0DGLa6xA=;
 b=h3q0omy8BpO9FP5XKwlgTc0q0+1Fn6+/aY5eCf0jNPBYTkXfE9JMcEWKsXLelQkFId
 A2TYzC/RsqCw/9rjej45EtNbhQabADpZc4Becs3x2Q52NL4cobi+vdeoF//ubPyxGX5z
 3ChcGL4T5m48WCHWCYWowEZV1qt1+th1BL40Q/x7CBjKu0urLF08zr/z1tkCiiYTU0mY
 4/yZAT7zTOceDlPd6E6pjGPKJKaewLN0zB87OPBAcBRcgZmwuRIhomJrshfUgHlLGkIb
 vS0Ruyp2OWK4jDwAbEeOgOjYTycoMbaUTKn0tYG0msNFfCsvKN3m1+lZVjUTu9uEMKkS
 fc4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728066236; x=1728671036;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=daj2G7v6GYNNMy/YdduAt2P4YOw8SO/gZvr0DGLa6xA=;
 b=YZRubMfi/R8HW1JwvXUigu557umkUX8SWnL9Pu8h7+ipEfTntqJUSf/DPTc8No58OC
 8FqGpMkJ6YXIXRNvgL8pBSXLYvV0GnfqcYzqXoSdOAMqBSUiqqgFJA925cpjiIbPbIGc
 GisswsxUuq7cCWrV3Bh76QLYUNRLqmzhSoiZqTBdSV4jG0RuNUJoMykz6jSPdxO3zLvF
 Pl4MBaPiqavVHnnc2ReUgXmh5Ypjd1GEm9EQJVf4H2hniLvzGmYTfYKnnWdekehPaaKR
 lMYVUCQ5LHCFY/eN5P7C5yd7a+IuctZNs2MiTxO6aR4L6RKZL5NdbM/eco50Os6RIDTz
 75ng==
X-Gm-Message-State: AOJu0Yz3xQjEJeksQINjuvW7KihT8ni4yvf4NHYA3rhWrWHgmgH4cKG5
 wJw3RCKuDbMnDgrSrv2kWr2yATnvzsL8r1Yjc6DxIx0eVp+gN9NTDh5zCBSflv4EwS6zpzx48w3
 j33701ZI+6gb49yF5AMRWplq95uNduVXe1PPsdg==
X-Received: by 2002:a2e:d1a:0:b0:2f1:a19b:d5a4 with SMTP id
 38308e7fff4ca-2faf5cdead9mr13292311fa.22.1728066235764; Fri, 04 Oct 2024
 11:23:55 -0700 (PDT)
MIME-Version: 1.0
References: <20241003081105.40836-1-ines.varhol@telecom-paris.fr>
In-Reply-To: <20241003081105.40836-1-ines.varhol@telecom-paris.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Oct 2024 19:23:45 +0100
Message-ID: <CAFEAcA9=We-DwTezYw6=KApSQ14iExgdek8YLPTzU6HLLv_jpw@mail.gmail.com>
Subject: Re: [PING PATCH v5 0/3] Check clock connection between STM32L4x5 RCC
 and peripherals
To: =?UTF-8?B?SW7DqHMgVmFyaG9s?= <ines.varhol@telecom-paris.fr>
Cc: qemu-devel@nongnu.org, Arnaud Minier <arnaud.minier@telecom-paris.fr>, 
 Paolo Bonzini <pbonzini@redhat.com>, Luc Michel <luc@lmichel.fr>,
 qemu-arm@nongnu.org, 
 Thomas Huth <thuth@redhat.com>, Samuel Tardieu <sam@rfc1149.net>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Damien Hedde <damien.hedde@dahe.fr>, Laurent Vivier <lvivier@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::22b;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x22b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: cAJqosT7fymf

On Thu, 3 Oct 2024 at 09:11, In=C3=A8s Varhol <ines.varhol@telecom-paris.fr=
> wrote:
>
> Among implemented STM32L4x5 devices, USART, GPIO and SYSCFG
> have a clock source, but none has a corresponding test in QEMU.
>
> This patch makes sure that all 3 devices create a clock correctly,
> adds a QOM property to access clocks' periods from QTests,
> and adds QTests checking that clock enable in RCC has the
> expected results for all 3 devices.
>
> Thank you for the reviews.
>
> Changes from v4 to v5: none
> (just added new reviewers in commit messages)

Thanks for the resend -- I've applied this to target-arm.next.

-- PMM
