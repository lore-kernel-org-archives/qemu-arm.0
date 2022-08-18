Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp404855ejf;
        Thu, 18 Aug 2022 07:59:52 -0700 (PDT)
X-Google-Smtp-Source: AA6agR61s9On/6DrJRaZU0QarMs6klGxmaAPVOsd5G7X3GJbfX6kD1gkjlRwyWU+eT7KhXogwngG
X-Received: by 2002:a0c:c68a:0:b0:491:76f9:b314 with SMTP id d10-20020a0cc68a000000b0049176f9b314mr2761276qvj.86.1660834791810;
        Thu, 18 Aug 2022 07:59:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660834791; cv=none;
        d=google.com; s=arc-20160816;
        b=GSG2f2bn7KfcW9E8fUtfO79cJg/sqfMHG+sb/LDvVPxl5khC0nyx2mKvJbzeU5NJCw
         MBW54wDh1IVnfVN1+v5YkqRNAf342Fdp7+TH0dLh3Q1/GbHEuXHjPMrDU3RgtUhMVbg3
         jTZLvbAkPGNMDaubQS8FLg6i0/4ze9bEcdQxFHf04sOWWQGfDicsD0HAkV8kveZ4UJbM
         X74c9YX10YC/Evy6a9APL5eM8l9YZA5fCxmAVDKx0peA7yFu9TOG8BI+U5TjDlheKneD
         kv25rWOjdy8T7vPgo+U6AnelZMcGVQNNy5jpHHPTHUaNyxK502CzdvA+bQIv+XHwrwB1
         eXJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=bgqiSKA5S+ohEA7sQE95LemuafEEHdalqBhWPWevwyc=;
        b=eZRPPwF+4jkfkwdWonXifeq1QieT87WQ7wDfQUzkVLBwvHBb7xOUsUK7seXxUPDZYJ
         cBKYBNWBTYLVCohriDr3uzmSmqp7l13wB1x+fjPlMhGHJixlFWJr4HqCthaxhvVuf2dk
         PTZhTjIP+iGSX/70TaZNqAOyKm94bD/v9DFC482Ubcc2DDybqgUcb6BTuQOzZItYmd6p
         j4d5klAAmgFEQNkwj7BZXDJZWwNIsznN3oIrkWUBjNOEBFEM+8s5J60c2Xtr7BKvh1Nz
         y1YOFOx0V0+a1DPxcoG01irop5EAZy7wgPMnnNdHV5ximWMyZlinPeizTPA4WXS1Weln
         02cQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ce8BDW2q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ey9-20020a05622a4c0900b00338cecf8de6si921637qtb.468.2022.08.18.07.59.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Aug 2022 07:59:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ce8BDW2q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:32998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oOgzv-0002pe-AS
	for alex.bennee@linaro.org; Thu, 18 Aug 2022 10:59:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oOgze-0002pD-Fh
 for qemu-arm@nongnu.org; Thu, 18 Aug 2022 10:59:34 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134]:45951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oOgzb-00035N-Qr
 for qemu-arm@nongnu.org; Thu, 18 Aug 2022 10:59:33 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-3246910dac3so47575227b3.12
 for <qemu-arm@nongnu.org>; Thu, 18 Aug 2022 07:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=bgqiSKA5S+ohEA7sQE95LemuafEEHdalqBhWPWevwyc=;
 b=Ce8BDW2qeVUIO2++PuIxZSveWuNY19S7kUFTJfVSfqgI21r1tVLP679EcDLvVoijvI
 reYxNMN3y4095x2/9HqeBLvKdT2lrziYTMtC0/VgGihexg4VsGRRvHFUiDQhybD42Hz8
 a5vUmbPPDxvI4upslvRQdkj7FxzBCafmk0C005va3Fb1i+ddMBCR7RxeS9Srt0gPVqak
 1lKHuTaMd8RKtKUSsN0EI4f621vb9WGE+8RRwI8kShN/xdKV3F6GivrNBtTudyM71c5c
 35GVNd42699XlkLf+aNsy4WbWv7tcd74xFAeX97usnvq3/X8dME5oMcWKHu5n4hODyP6
 OHGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=bgqiSKA5S+ohEA7sQE95LemuafEEHdalqBhWPWevwyc=;
 b=bBneEjequ8fY1WEQmlY2cAqVdul5uEMwQ4lV2fwq1ACmvdD6l5Wj/uB/qW+TYan7sY
 BYeBKbTWU1FXyLKswottiqz1xVj3BcDOc9IqKPVRJabUmVLlzhWTEm7SaZzTLtAlzC9V
 YSIB0SCW8R1Ln6ix9YXkiL5Y52Kjndld5/GPb8+4yXXOXjGRjCr3DCFiai4EZI4zPSDY
 lxZz2Dsms9bs9fgF1ZQhhBZSHxsFnDpisMiS4t2kcrtZ8TkwEOj8LE8xYX97p+Eh9WtC
 KdIcbcpw0jCSDNCyKxqEL61nLhvac+0S6dJZkg7T1IyIOKj+hVooR6v/7SmIXHn4jk6A
 b2xg==
X-Gm-Message-State: ACgBeo3/IBiX+Gzl6N7dEB4KJLYuGIB379JxwhKmoVXbAXxXi4CN80+i
 EImrwZfOZNkVVIj2Q146bUrVa6VLO3WHjY7nOSi2rQ==
X-Received: by 2002:a81:10a:0:b0:333:618e:190b with SMTP id
 10-20020a81010a000000b00333618e190bmr3035672ywb.10.1660834767115; Thu, 18 Aug
 2022 07:59:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220815213458.733701-1-wuhaotsh@google.com>
In-Reply-To: <20220815213458.733701-1-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Aug 2022 15:58:45 +0100
Message-ID: <CAFEAcA_nJzdtuMQtDQN6Fn1dHyTDFA4=qoYDUe1Bpjy8RiQpUQ@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Add cortex-a35
To: Hao Wu <wuhaotsh@google.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Joe Komlodi <komlodi@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Oqyk6HihjKEg

On Mon, 15 Aug 2022 at 22:35, Hao Wu <wuhaotsh@google.com> wrote:
>
> Add cortex A35 core and enable it for virt board.
>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> Reviewed-by: Joe Komlodi <komlodi@google.com>

> +static void aarch64_a35_initfn(Object *obj)
> +{
> +    ARMCPU *cpu = ARM_CPU(obj);
> +
> +    cpu->dtb_compatible = "arm,cortex-a35";
> +    set_feature(&cpu->env, ARM_FEATURE_V8);
> +    set_feature(&cpu->env, ARM_FEATURE_NEON);
> +    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
> +    set_feature(&cpu->env, ARM_FEATURE_AARCH64);
> +    set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
> +    set_feature(&cpu->env, ARM_FEATURE_EL2);
> +    set_feature(&cpu->env, ARM_FEATURE_EL3);
> +    set_feature(&cpu->env, ARM_FEATURE_PMU);
> +
> +    /* From B2.2 AArch64 identification registers. */
> +    cpu->midr = 0x410fd042;

The r1p0 TRM is out, so we might as well emulate that: 0x411FD040

A few fields are missing:

 cpu->isar.dbgdidr
 cpu->isar.dbgdevid
 cpu->isar.dbgdevid1
 cpu->isar.reset_pmcr_el0
 cpu->gic_pribits

(these probably landed after you wrote these patch).

Otherwise looks OK.

Remind me, what did you want the Cortex-A35 in particular for ?

thanks
-- PMM
