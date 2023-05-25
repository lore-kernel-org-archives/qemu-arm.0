Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp396913ejb;
        Thu, 25 May 2023 05:21:41 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7j7hatXh4VqjUsA0fkWNwAvGLAZB+pab3Fhb8dOjRikfx3mEMpjK/MYxeJNOEV6GhkojOz
X-Received: by 2002:a05:622a:188a:b0:3f3:b1d4:744f with SMTP id v10-20020a05622a188a00b003f3b1d4744fmr32591698qtc.0.1685017300992;
        Thu, 25 May 2023 05:21:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685017300; cv=none;
        d=google.com; s=arc-20160816;
        b=Jo8oRMgDgzOh3iswoS9RwoNCoF+togxhrLfwRmpArKvJIrH0z4pvN1oluMz8SF5r4M
         yRZwyUGqj82AHKQwEflvq23OvFlVAdJ8+X+39yw+ziTiOJ+6iKlQb7yGl1J9b40qdabo
         i/UXwJOR1S5Wz2k7SLo9j4KoyoA47w1dYz7BRuFH5YQwOBh7/nbCu00uLkaqM9XUUkq+
         jQ7BOT/MyXHsfMy4l8LRitZGHu5XznYt7hSLyEgoFCjxgrA1IlvfmiGsN/rZjlc+AHb1
         cNsHSvj5trcBfedy39fTOrins1NWZqIyxF3TeEftLrbfck5vs2kiOxKF+PDP+/xI8eqa
         NaKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=xt73mBk/BF3DP3yChIeQbwO/64UdUHjyoYKQoOnbBmU=;
        b=nFwiylVUdiBYNSvqQmVErO/rYgc/ql3JZo1HGppkqk/vNeigAINQD4XyZi91zqAnLT
         xr+9Qj2a5c3HjdncImCy6d6/OUxAvltUJ0pT/oosFmtg9HKDhQLBgJlBTXjudaSULvN7
         LhhYZ7Z/7q4UPiRkfZZMJQbuYEFhe87ga0d/mUTgyccEx2eaPGpPGcamc6LUFgfOFul6
         JDFDOHigj14kff1cRioVM6EYm8hi8dHKKH4nldJ8A5n3W5hMSHVxXI2xrMUuZbTy93ij
         9xr1Z6dfqA4x41qFonGk2bz2A3/HovYUYIg/uey53xt/NtPyomAwe/o9BA2dAHcwbGjR
         L6+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iPOhRAYr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d13-20020ac85acd000000b003f6c51a5c34si401805qtd.358.2023.05.25.05.21.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 May 2023 05:21:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iPOhRAYr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q29xz-0003pq-OR; Thu, 25 May 2023 08:21:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q29xw-0003pP-De
 for qemu-arm@nongnu.org; Thu, 25 May 2023 08:21:12 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q29xt-0003HH-Tx
 for qemu-arm@nongnu.org; Thu, 25 May 2023 08:21:11 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-510b7b6ef59so4519129a12.3
 for <qemu-arm@nongnu.org>; Thu, 25 May 2023 05:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685017268; x=1687609268;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xt73mBk/BF3DP3yChIeQbwO/64UdUHjyoYKQoOnbBmU=;
 b=iPOhRAYrHJ42CkOi2u2lvNoOXrzjUGWmA/iQKjVqco0cBiGwJ6FEzHOQ8UZXumOk33
 4n3l0XS0WrqD7B3SHkNxl2UYWHVWQnFI+R+yYpHVpkAzL/malAx5+EO5r7qJWQNRN01j
 Hu5XQAG7N4SWOtVtLMlN2KB7BgwriAjut2EpkZWOmI1VpssSTqpdbcMsdoLaPZenFtnC
 BqGbVuGGDn8Fe783kSWulw3GZ6DbxmeO5xgtabwJ2bASTzUHK8Zg4tEPL2RWwiEwPfD7
 MNngMC8iJMBNwPTiBuNGIIn5bIX/CPPvMteJZh+hFxbwhUbBrbvOQuQ36YguP/xviwH7
 d6sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685017268; x=1687609268;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xt73mBk/BF3DP3yChIeQbwO/64UdUHjyoYKQoOnbBmU=;
 b=Vew1ZZjfTrlS9V+4wLJRfv5NFJshZLjVtMWHczinN+KnhAQ50TsksunhtXjtUUOhNS
 2qBRycVayF5LVf46LLshv3lOBHHKFUXX+M2VgDhiKJvOoJ8KthjTVAyeeBfiTLYiEJHo
 cQotHwiOXHl8CljkZpWUZuY4YrIfc1y8gD5OS6/AvLo+MkzwmrVz2PzfW7sa2ODbX5nq
 66yCVxQKSPPOQ5MKDIBfNj75Sq8jmRxTCVMGhziSiX89EQB5WiUI2ogDsof+DeShK26t
 r9XwD+n0SOoMpxX1SSUpV8Epa3hu4+2k5XrWYv2p1+pZmSODe4ElRYmeAmJcEikXB85b
 CgPA==
X-Gm-Message-State: AC+VfDzh1uvU+89uQG2E5JyhAjwSqDDlM6QFKEDG1FkRNzmU5CJBp6Aj
 NBNsrt0BKNFh71mQw+t/Q9OHaJy4Wdf3eRdkKixk5g==
X-Received: by 2002:a17:907:360e:b0:96a:ee54:9f19 with SMTP id
 bk14-20020a170907360e00b0096aee549f19mr1419675ejc.48.1685017268318; Thu, 25
 May 2023 05:21:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230524080600.1618137-1-thuth@redhat.com>
In-Reply-To: <20230524080600.1618137-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 May 2023 13:20:57 +0100
Message-ID: <CAFEAcA_eNTydi4cnX0E8Pg6aO_b-1zL=tMNibcn-vO97JdJYXQ@mail.gmail.com>
Subject: Re: [PATCH] tests/qtest: Run arm-specific tests only if the required
 machine is available
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, Fabiano Rosas <farosas@suse.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
X-TUID: bk8Pp2GtavjJ

On Wed, 24 May 2023 at 09:06, Thomas Huth <thuth@redhat.com> wrote:
>
> pflash-cfi02-test.c always uses the "musicpal" machine for testing,
> test-arm-mptimer.c always uses the "vexpress-a9" machine, and
> microbit-test.c requires the "microbit" machine, so we should only
> run these tests if the machines have been enabled in the configuration.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  tests/qtest/meson.build | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 4c5585ac0f..087f2dc9d7 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -198,14 +198,15 @@ qtests_arm = \
>    (config_all_devices.has_key('CONFIG_CMSDK_APB_DUALTIMER') ? ['cmsdk-apb-dualtimer-test'] : []) + \
>    (config_all_devices.has_key('CONFIG_CMSDK_APB_TIMER') ? ['cmsdk-apb-timer-test'] : []) + \
>    (config_all_devices.has_key('CONFIG_CMSDK_APB_WATCHDOG') ? ['cmsdk-apb-watchdog-test'] : []) + \
> -  (config_all_devices.has_key('CONFIG_PFLASH_CFI02') ? ['pflash-cfi02-test'] : []) +         \
> +  (config_all_devices.has_key('CONFIG_PFLASH_CFI02') and
> +   config_all_devices.has_key('CONFIG_MUSICPAL') ? ['pflash-cfi02-test'] : []) + \
>    (config_all_devices.has_key('CONFIG_ASPEED_SOC') ? qtests_aspeed : []) + \
>    (config_all_devices.has_key('CONFIG_NPCM7XX') ? qtests_npcm7xx : []) + \
>    (config_all_devices.has_key('CONFIG_GENERIC_LOADER') ? ['hexloader-test'] : []) + \
>    (config_all_devices.has_key('CONFIG_TPM_TIS_I2C') ? ['tpm-tis-i2c-test'] : []) + \
> +  (config_all_devices.has_key('CONFIG_VEXPRESS') ? ['test-arm-mptimer'] : []) + \
> +  (config_all_devices.has_key('CONFIG_MICROBIT') ? ['microbit-test'] : []) + \
>    ['arm-cpu-features',
> -   'microbit-test',
> -   'test-arm-mptimer',
>     'boot-serial-test']

Applied to target-arm.next, thanks.

>  # TODO: once aarch64 TCG is fixed on ARM 32 bit host, make bios-tables-test unconditional

Aside: I wonder what we meant by this... Added in
commit ab6b6a7777449905a in 2019 with no further detail.

-- PMM
