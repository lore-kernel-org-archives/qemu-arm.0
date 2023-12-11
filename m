Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp289524ejo;
        Mon, 11 Dec 2023 07:41:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHmDcYPwT0LQdieHaOxjkxHphzoRen8abMW4a46JjoBX6OVbcxGGk0H3yel1hx1t6lKuxU+
X-Received: by 2002:a05:620a:3:b0:77f:3535:87ca with SMTP id j3-20020a05620a000300b0077f353587camr6025391qki.106.1702309314850;
        Mon, 11 Dec 2023 07:41:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702309314; cv=none;
        d=google.com; s=arc-20160816;
        b=W5WzOMRFBCMNE5fssITd3vlwwRy1eDLaFxURxLsGe2FVjj9bmLFSIOY7a2sT/zZUUD
         4kvmUidzkJqfiPFERHp08V3Bdbe+c0gGvvfUJ0QjREojcBQSwE05qAiuL/6mJmzvuX8U
         v0JO6Xr/hBRAl2dJIa9H+QyDrrMjzv7U2LtA31x2Ri0h4VC32/Mq5kBDzzrzb7QZDIyj
         AS9rQ5j0qIs6SLngKB3FpOm4cgmOu2zo3PkZceeGAFMvHf/+PiYZV0ngPGLJgOVpdB5m
         c1QovBO97Ic6PykF44NstxNYOrucCPsWENbMLh+QYZTqxkvJ+AGsBG1bzm15lZwbZ3Ec
         TBOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=jR2GEF0BnAY6HyvVJuXTO6tJSvNHXRwQ8RHT+QBI1Do=;
        fh=Fynti4igEyd80lPm5jsUDnPPmXGC+AeBht9O6m1eJ68=;
        b=YXUxXo2KeG7QKRjR5N4CO9jaecerDO9DgCtbazTgVXrmYYA6vYvGOOmPOWFndM/gm4
         Fq1pQEGDDy2MR9R8d9pifkEjaS2p2iZGRxmpvasqy8aTYuU/ttaOHXtkc4NaGL86L0L5
         d+F56U6b/4yAh3cbB2TwGgkjkVCnA6RJRTFZ6xCG2NMWfw2Ghi5ByC1VX1/NnkTcufTM
         AYydVULbaU/h6MeekCH8kQaPtctBSGj8J9Pwrjn7h1KZmvFvp4DUEYpD/FtMSEYlZnH7
         mZoeexeozTk5kX88PIG+y9h59py3LgwKIbEdoPb+4OCaER9sEgVviOf3W7fO6a+uyZgN
         l3Bw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mbqPT5T0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 10-20020a05620a040a00b0077d7da0e988si8177526qkp.337.2023.12.11.07.41.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Dec 2023 07:41:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mbqPT5T0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rCiPN-000550-Uk; Mon, 11 Dec 2023 10:41:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rCiPJ-00054B-VC
 for qemu-arm@nongnu.org; Mon, 11 Dec 2023 10:41:21 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rCiPE-0007vv-IM
 for qemu-arm@nongnu.org; Mon, 11 Dec 2023 10:41:20 -0500
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-54cfb03f1a8so6220097a12.2
 for <qemu-arm@nongnu.org>; Mon, 11 Dec 2023 07:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702309275; x=1702914075; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jR2GEF0BnAY6HyvVJuXTO6tJSvNHXRwQ8RHT+QBI1Do=;
 b=mbqPT5T0AMbD1V8CWCiis//WEDNedUQ1QSfwK3YFaaDOwZgKp7gG7L7IxPsnxNLYdA
 CoUX3yYcVjYa6xCAf2jDZjSCMPCRPs9XvmDAZlwaVBVjvV+U9DQQM83ajE3V/FApGiT3
 VFyo9d5NmKft4TcYagvlZsYaKZT4edKWs3lSwFFUlJlizGr11IFOl6eoKN3b6BZThLmf
 Qgdzmd+svw3I9kqh7Xoer85IHGDR7CY3R0FMpXCdiF+sPM0/ku/3tlp4tBR1/j61h41a
 ClcbJAZbI8uu/dU6a3reFuBYf76nDkWgulfyGZYaFJPMjyd8ez+pE8A1rJtvCiuVMH04
 zgYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702309275; x=1702914075;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jR2GEF0BnAY6HyvVJuXTO6tJSvNHXRwQ8RHT+QBI1Do=;
 b=EDXFCWr+iTlgDuAQtZLLLhwS2JsgZEIbDxmcBWQCB4juAgcOVgMDcgyxaciEnuCIrw
 yRSOvRPORH2GProDlcLTR2xjhkqxg/hGVyrdAuREgz8NzgILgBy3JSBrBc4yX5uxkaUc
 0LkryS+VLiKlEtSH3vABmgZVulfVeqp8Zl7/C3In9eoym90lALR7CztSaw05ZaEEnKxG
 i5mwDkw/9+XWw0WAlP6/oy0MexAAWDjGCIZ2QSFGGmuxXCCJeUnHo3fgLnTUnR/fbQAC
 ytNGSldaa+NvOHjkc01Ww46qr+HN8CMXgN+E/JFy/JK26B+GgcCbjHkwhdTc95emSZ1p
 +KGQ==
X-Gm-Message-State: AOJu0YzJjgW0B//MXN5J4XWA4DxEPX6aafmf3rlKv5iS9IVsQIuUZZD2
 IM7lI4gfxiLoOffpO8+FqN/Bty4Q+5SSvSBS6FwD9Q==
X-Received: by 2002:a50:bb49:0:b0:54b:d16:4c4b with SMTP id
 y67-20020a50bb49000000b0054b0d164c4bmr2678625ede.19.1702309274900; Mon, 11
 Dec 2023 07:41:14 -0800 (PST)
MIME-Version: 1.0
References: <20231027175532.3601297-1-nabihestefan@google.com>
 <20231027175532.3601297-7-nabihestefan@google.com>
In-Reply-To: <20231027175532.3601297-7-nabihestefan@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Dec 2023 15:41:03 +0000
Message-ID: <CAFEAcA8ABPROeGEp+eEiBVzDj-NMbX7Extwv=ZAziZygwCYDrw@mail.gmail.com>
Subject: Re: [PATCH v5 06/11] tests/qtest: Creating qtest for GMAC Module
To: Nabih Estefan <nabihestefan@google.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 wuhaotsh@google.com, jasonwang@redhat.com, avi.fishman@nuvoton.com, 
 kwliu@nuvoton.com, tomer.maimon@nuvoton.com, Hila.Miranda-Kuzi@nuvoton.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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
X-TUID: kcP0ZqDVBo/o

On Fri, 27 Oct 2023 at 18:55, Nabih Estefan <nabihestefan@google.com> wrote:
>
> From: Nabih Estefan Diaz <nabihestefan@google.com>
>
>  - Created qtest to check initialization of registers in GMAC Module.
>  - Implemented test into Build File.
>
> Change-Id: Ib0e07f6dacc1266b62b4926873ccd912250cf89d
> Signed-off-by: Nabih Estefan <nabihestefan@google.com>
> ---
>  tests/qtest/meson.build      |   7 +-
>  tests/qtest/npcm_gmac-test.c | 209 +++++++++++++++++++++++++++++++++++
>  2 files changed, 211 insertions(+), 5 deletions(-)
>  create mode 100644 tests/qtest/npcm_gmac-test.c
>
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index daec219a32..205c60aadc 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -205,9 +205,6 @@ qtests_arm = \
>    (config_all_devices.has_key('CONFIG_ASPEED_SOC') ? qtests_aspeed : []) + \
>    (config_all_devices.has_key('CONFIG_NPCM7XX') ? qtests_npcm7xx : []) + \
>    (config_all_devices.has_key('CONFIG_GENERIC_LOADER') ? ['hexloader-test'] : []) + \
> -  (config_all_devices.has_key('CONFIG_TPM_TIS_I2C') ? ['tpm-tis-i2c-test'] : []) + \
> -  (config_all_devices.has_key('CONFIG_VEXPRESS') ? ['test-arm-mptimer'] : []) + \
> -  (config_all_devices.has_key('CONFIG_MICROBIT') ? ['microbit-test'] : []) + \
>    ['arm-cpu-features',
>     'boot-serial-test']
>
> @@ -219,8 +216,8 @@ qtests_aarch64 = \
>    (config_all_devices.has_key('CONFIG_XLNX_ZYNQMP_ARM') ? ['xlnx-can-test', 'fuzz-xlnx-dp-test'] : []) + \
>    (config_all_devices.has_key('CONFIG_XLNX_VERSAL') ? ['xlnx-canfd-test'] : []) + \
>    (config_all_devices.has_key('CONFIG_RASPI') ? ['bcm2835-dma-test'] : []) +  \
> -  (config_all.has_key('CONFIG_TCG') and                                            \
> -   config_all_devices.has_key('CONFIG_TPM_TIS_I2C') ? ['tpm-tis-i2c-test'] : []) + \
> +  (config_all_devices.has_key('CONFIG_ASPEED_SOC') ? qtests_aspeed : []) + \
> +  (config_all_devices.has_key('CONFIG_NPCM7XX') ? qtests_npcm7xx : []) + \
>    ['arm-cpu-features',
>     'numa-test',
>     'boot-serial-test',

Why does this patch remove a bunch of existing tests for non-npcm
board types ?

thanks
-- PMM
