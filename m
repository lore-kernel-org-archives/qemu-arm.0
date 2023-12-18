Received: by 2002:a17:906:d96:b0:a23:4dac:818 with SMTP id m22csp829771eji;
        Mon, 18 Dec 2023 06:29:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFimrBYTLd4qcHZ1++eet7vtHsNiXWTeYIHBIlWOCn30f1IOWPtzRHvwVPQl/gx7pAWoZDY
X-Received: by 2002:a05:6808:1b14:b0:3ba:30dc:56cf with SMTP id bx20-20020a0568081b1400b003ba30dc56cfmr10256197oib.76.1702909761408;
        Mon, 18 Dec 2023 06:29:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702909761; cv=none;
        d=google.com; s=arc-20160816;
        b=Z/uqUeKYb1VzUNjNisoJ4hKsVy9QELNBFbNlVSJhjlbc/lrUoIp0+lEnwLp2xbKNlj
         GLAmeWxWzpym8Lxvlj/p2fIVWXox64ccZvuoRM8OlJ6kasWj5XLHUjgWYLgcuUNp1s/M
         2rlXnjQUjHHLFMASP6STRKBxbnKIl+niOgcL6W3z0l5pKEj4eHPXxfUQRnHzLDpCtvfq
         mIFUxJhV4uIoj2TgjFChTijtUiyfuZvl2ZBNL5wS23Qg9rGtpcJjknB5UpoU6qzfmqxA
         irSpZdFAU/d2U4M1xol0kErNWVt34n7OGzxLfYspSgc2JKmMsZLjo1f0mJ5+6Xbh/N1O
         u+ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=BulE4avwiq0FtjAwcAwi+400X42ErNhJZtlf4GA6FJg=;
        fh=okBdXp2j7ZzUTSUTpGCvfl98J3L9zXWlzkZsOlQF4t8=;
        b=IX6F/5TN9X+Nd+R6G6RDvb6pIEhW8Yw4UAbg4HGTU3ZDPtwQX5kz+vW3wGBpKct0qO
         cMDvHaTZaN7KCR5Y+HZ7o94gLQ204PB55wonrDMXS982Jy5YedcsWEPTaHEjbbWqIbXE
         WrGiwhLjlpzBtaIajo2BNNP9O6M9QhE6tBLQNdxBY4MJoUs/9hk7sAdpH/CmH59HGsAL
         o/UwriPjRjmAT21KgDu8fvpwsK4b8UKARlDLjb4s0NNn7yRoNeOuMXIuf9fg7omkYyyR
         c5E06T39R9aETyWrzFb1Gq4g6QpCJYWuHN9m6itKTmL6s36xabmatAtFPtxhYxdIJ9LS
         Xrrg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=daLWa86+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j9-20020a0cf309000000b0067f3314d4b1si4157612qvl.339.2023.12.18.06.29.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Dec 2023 06:29:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=daLWa86+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rFEcF-00044k-2T; Mon, 18 Dec 2023 09:29:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rFEcC-00044H-8n
 for qemu-devel@nongnu.org; Mon, 18 Dec 2023 09:29:04 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rFEcA-0000V0-MZ
 for qemu-devel@nongnu.org; Mon, 18 Dec 2023 09:29:03 -0500
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-553729ee917so738137a12.1
 for <qemu-devel@nongnu.org>; Mon, 18 Dec 2023 06:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702909741; x=1703514541; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=BulE4avwiq0FtjAwcAwi+400X42ErNhJZtlf4GA6FJg=;
 b=daLWa86+ZLq5Wtc1EQRbLRaPca57MUcQ+3oTZyHF6SvnEcitcstheFJ63L6Oq61djp
 jUdWy47GaGznsAS/qGkDFhtLJZNbBDqWn4auTrT7QfNxAkyQfvBJG+lPJ2A5IU6wXoFl
 foKCsZVTlk896seYVcpor2ETzvBJgxvKzM1rHZyCN0wjbZSkituMspCnPA3dnKdWBQWb
 ja3HmdV8k85gSX44C5PDz3W/1lXA556nK7olber7JAIX/5Regh+znYHLvQdtj1DOuhcK
 7DZt174BdcE9PztyLugLy2e/OGDw/RQfGZaWbhZ8XUf+D4aYSnSfecLQSRO4kgpaLm4m
 5cKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702909741; x=1703514541;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BulE4avwiq0FtjAwcAwi+400X42ErNhJZtlf4GA6FJg=;
 b=KqHuASo04sl/dxymIN8XtCozudIPHONC6Uqqp8aZuIZJxWgdmpB0snfYlsrUVTe3S6
 +34gh+KnW4qhcw4SeEzof5UqbSo4DRCel+4MMP8fWSODg120a1FENTSangDEDS6rOMCt
 fsziuPA44HbYhIskQYYRL0qf2Jz5Ci57jzDjkX3aTmFlYspbONWe+Wa3E8Cta4is3jiO
 cG8lRC8MsupJfaIbb9A/tieUxB1s+8/6oGMk7TwOQEtuZFvTHUrM9plNWWn7/GeCW5xk
 Yp2mWLuKyCLFAlmNHDLqlMKRK3qss4MvZimG+JIwYmODLbzfO/hWMQFM6v6zpc3RUt0D
 716A==
X-Gm-Message-State: AOJu0YzS/K3Fl5+q6LkppR74qdnR3boYxRyI/XQpNyeVjTyi2LYMM2IQ
 nPD9riGQxjMBOjRskfkW6oNKcvCmJtOAlJ+jUbfZxQ==
X-Received: by 2002:a05:6402:5c1:b0:54d:ccf8:1d63 with SMTP id
 n1-20020a05640205c100b0054dccf81d63mr8916602edx.63.1702909740673; Mon, 18 Dec
 2023 06:29:00 -0800 (PST)
MIME-Version: 1.0
References: <20231214211527.1946302-1-nabihestefan@google.com>
 <20231214211527.1946302-7-nabihestefan@google.com>
In-Reply-To: <20231214211527.1946302-7-nabihestefan@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Dec 2023 14:28:49 +0000
Message-ID: <CAFEAcA-TVaRhS1sYKaw5w4uUi8k+xnxWgaJKfVdjEy37wszLCQ@mail.gmail.com>
Subject: Re: [PATCH v8 06/11] tests/qtest: Creating qtest for GMAC Module
To: Nabih Estefan <nabihestefan@google.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 wuhaotsh@google.com, jasowang@redhat.com, avi.fishman@nuvoton.com, 
 kwliu@nuvoton.com, tomer.maimon@nuvoton.com, Hila.Miranda-Kuzi@nuvoton.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: HmISLH6OAlyN

On Thu, 14 Dec 2023 at 21:15, Nabih Estefan <nabihestefan@google.com> wrote:
>
> From: Nabih Estefan Diaz <nabihestefan@google.com>
>
>  - Created qtest to check initialization of registers in GMAC Module.
>  - Implemented test into Build File.
>
> Signed-off-by: Nabih Estefan <nabihestefan@google.com>
> Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
> ---
>  tests/qtest/meson.build      |   2 +
>  tests/qtest/npcm_gmac-test.c | 209 +++++++++++++++++++++++++++++++++++
>  2 files changed, 211 insertions(+)
>  create mode 100644 tests/qtest/npcm_gmac-test.c
>
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 2ac79925f9..e5c31b83bd 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -221,6 +221,8 @@ qtests_aarch64 = \
>    (config_all_devices.has_key('CONFIG_RASPI') ? ['bcm2835-dma-test'] : []) +  \
>    (config_all.has_key('CONFIG_TCG') and                                            \
>     config_all_devices.has_key('CONFIG_TPM_TIS_I2C') ? ['tpm-tis-i2c-test'] : []) + \
> +  (config_all_devices.has_key('CONFIG_ASPEED_SOC') ? qtests_aspeed : []) + \
> +  (config_all_devices.has_key('CONFIG_NPCM7XX') ? qtests_npcm7xx : []) + \
>    ['arm-cpu-features',
>     'numa-test',
>     'boot-serial-test',

This is still changing around what is happening with the unrelated
aspeed board.

-- PMM
