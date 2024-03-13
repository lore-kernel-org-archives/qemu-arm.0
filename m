Received: by 2002:a17:907:991a:b0:a45:b507:d90a with SMTP id ka26csp2682389ejc;
        Wed, 13 Mar 2024 12:40:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVv0SYFfj6fU1XpECfhpfYIJF4Wl2SKZxpCVGh7s/qPqtoDuvrgD613qGJL6gYtw7yEcGNlqWi3iTGEFeKvi6x91QLzVFlY
X-Google-Smtp-Source: AGHT+IH7rlHO1gUo9w8Cr4/RkysPL9MQIh8PGLdDtwcu/7VrY8qJZfoNqYyRf6Wz9W37nx3x2ZYQ
X-Received: by 2002:a25:2e47:0:b0:dc2:65da:d3af with SMTP id b7-20020a252e47000000b00dc265dad3afmr3165976ybn.65.1710358816388;
        Wed, 13 Mar 2024 12:40:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710358816; cv=none;
        d=google.com; s=arc-20160816;
        b=mdt/xzfMuZgDVgNxO590FUUhMtyApw3Ms8zlYGVIPVw9GXzAlLcs2iRUgowlEUyw+l
         UBsyybe6yP9ki6HdN6dGmUJBKm3qd08+pN43CW2T18ewfzctIDi6XoZKNo1vJhQGOV/z
         rrQI7IAtrOozNsSkIZaF53AYTmmM9IX/5tcSB0JmcdCa8yXE7EKGPnsn/7eiNbO3RPBM
         RC5hyiZQxPDYq5h/bRLRd9wt3oSXG963h9dtncWU4IrKDONUT6GgpxnALVyTSN9q2lys
         4XyaJhRHxm/O4PxqJU+Ql51/NXq3/0/M0izjUgR76V/vJCzqQsvrFi/yK+NBtnz7BHXg
         0cQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=ePwrOhCqD6QcBntpos1ixTsxkp9ZbNWVANNVJnLwFRQ=;
        fh=TVFUa1YK/VzK0DIFyu/eu75uqAbyleQipx6GZWlbHEg=;
        b=QfP5cXdY+Q9Wfcipc0z+XJszfrx4Wi3Hptr+jDLRaTggwUOQM0lSBbTUrkkslQXmfQ
         mEXChwHrtw7Cjlg8dhmIYYozKiK1WB5QJ0KcoUhTvlKH1Qbqcnx1mrP16iVBzm0Vr+3O
         HBli2GtFDsybL3oRmmxg3HifLPxrGxvgeapWioNjIhH3L3+l74PEg02sQL+DDVCisSnm
         nQhb+IUbQzGthVmjYqoevkbyQtmJz2HrmBjcEATYEpanZh0icXdmqzBTqp7sX66vcdAn
         Gd+ttVblmU0/zE/QPVQqL9YTL8Bv4Ey1VTDnlVJHcXt4AHMdi7euz+wwpjA7OgHMVqam
         AEbQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mqQrrVT6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v6-20020ac85786000000b0042f1b27c480si10438911qta.520.2024.03.13.12.40.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Mar 2024 12:40:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mqQrrVT6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rkUSA-0005cu-LM; Wed, 13 Mar 2024 15:39:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rkUS3-0005ap-Rn
 for qemu-arm@nongnu.org; Wed, 13 Mar 2024 15:39:49 -0400
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rkUS1-0003p5-68
 for qemu-arm@nongnu.org; Wed, 13 Mar 2024 15:39:47 -0400
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2d220e39907so2524971fa.1
 for <qemu-arm@nongnu.org>; Wed, 13 Mar 2024 12:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710358783; x=1710963583; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ePwrOhCqD6QcBntpos1ixTsxkp9ZbNWVANNVJnLwFRQ=;
 b=mqQrrVT6obgnOLTHjenvroj4xWhyRt/nKElHaNw+ygvevscY1+15MmrkxQ0YbjxbMI
 ATE65Egry5NnKntwIuhV+OriWj1JqK+Lxgdtn7S49vMw2cRh5/665P3Or+/Rdy3Kq3Hz
 M6khc9TRhdCUpxLBPZ40soGc4vjyCqNIMlB7YR2j9f2ORqhs8Ql16ZJo0mahiSA/R5I5
 lYfUagjTdkNvC7Hminkgeqk4WdvPt7OR1+zsQbrzRWqY8MNUPCd8yOrJmTILOErLo8bV
 QF7BdHkybAsSfJDiGDc7W5XBe3wiHLGDJXGd2SOBROIf25PLwonfxhP4q6jueNNQF5YX
 fZvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710358783; x=1710963583;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ePwrOhCqD6QcBntpos1ixTsxkp9ZbNWVANNVJnLwFRQ=;
 b=fZTklmsnHlFLQ081uNsfrb7S5AeFYKGhvWfLHSUi8Slp75W2AR0Vt4cQT3kNzVNlE/
 JGRNKam65yzG41QQVd250jtDhtvzTQp54M0RhLpKfXIkEEnnJKdgBveeJoGBgYIQVXEn
 zlFgjcfVI2oEPc06CWE/jtcWxbVgCO4Af1M9S+qd1J56T4QXPMKEy5HtzBUV6/OUidmm
 wPvr3T97ZKdWsUx3vuqeS3/9d4w/u8VNzWfKD/DU/pSq0NlNxaOKQxgOfcsLxwEJ2s8O
 9WBcGGGcwcxNKPTkpU9ytqM6pGrS+F+r8EUN7PSe37ZexwoM0CaeqtJ8dg9bSu37Dc3z
 Fpqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzmS7cJTaX934JO2kg1agfqEtJyN/UfQXzLWhcB1eWJbM9xgg1PucW6M+lN7dsoC78GFPHPPyH0v2EZmhLlcmU4+1E
X-Gm-Message-State: AOJu0YxQsU0hekMD/EcU3AbJf8hXYkaY3taPSQrPgDh7EcVAIJMOuNle
 6INkCRJo06eG4orGNfjoR07yfSgD5sgAB41EOl8Mu55Jvm5wzQgzslr6TLLUKXP5CRFKtcc4LuN
 WampxPSYLE5YdrlbINdIHCZznZK1eaF8o3pNpiA==
X-Received: by 2002:a2e:b52d:0:b0:2d4:6a6a:22bf with SMTP id
 z13-20020a2eb52d000000b002d46a6a22bfmr2084044ljm.23.1710358783153; Wed, 13
 Mar 2024 12:39:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240313184954.42513-1-philmd@linaro.org>
 <20240313184954.42513-4-philmd@linaro.org>
In-Reply-To: <20240313184954.42513-4-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 13 Mar 2024 19:39:31 +0000
Message-ID: <CAFEAcA9ZtyRG5G=vLXNJdA3RPKsvLGh-v8MO2tq1mC3ch5_asw@mail.gmail.com>
Subject: Re: [PATCH-for-9.0 3/4] qtest/libqos: Un-inline size_to_prdtl()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, John Snow <jsnow@redhat.com>,
 Alexander Graf <agraf@csgraf.de>, 
 Eric Auger <eric.auger@redhat.com>, qemu-block@nongnu.org, 
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <rbolshakov@ddn.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::22e;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x22e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 4hNcZZCIagjg

On Wed, 13 Mar 2024 at 18:50, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> See previous commit and commit 9de9fa5cf2 ("Avoid using inlined
> functions with external linkage") for rationale.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  tests/qtest/libqos/ahci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/qtest/libqos/ahci.c b/tests/qtest/libqos/ahci.c
> index a2c94c6e06..135b23ffd9 100644
> --- a/tests/qtest/libqos/ahci.c
> +++ b/tests/qtest/libqos/ahci.c
> @@ -662,7 +662,7 @@ unsigned ahci_pick_cmd(AHCIQState *ahci, uint8_t port=
)
>      g_assert_not_reached();
>  }
>
> -inline unsigned size_to_prdtl(unsigned bytes, unsigned bytes_per_prd)
> +unsigned size_to_prdtl(unsigned bytes, unsigned bytes_per_prd)
>  {
>      /* Each PRD can describe up to 4MiB */
>      g_assert_cmphex(bytes_per_prd, <=3D, 4096 * 1024);

It looks like this function is only used in this file, so
we could make it static ?

-- PMM
