Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73DACCD4F54
	for <qemu-arm@archiver.kernel.org>; Thu, 28 May 2026 12:56:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wSaHV-0008GR-3J; Thu, 28 May 2026 08:56:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wSaHS-0008Fr-Ng
 for qemu-arm@nongnu.org; Thu, 28 May 2026 08:56:10 -0400
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wSaHO-00080b-LM
 for qemu-arm@nongnu.org; Thu, 28 May 2026 08:56:09 -0400
Received: by mail-yx1-xb133.google.com with SMTP id
 956f58d0204a3-660390acd71so943546d50.1
 for <qemu-arm@nongnu.org>; Thu, 28 May 2026 05:56:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779972964; cv=none;
 d=google.com; s=arc-20240605;
 b=i2ZwnKk9VOFcQ0dvBS4A+jNyZshDxRJSzx2/VqrbtydhveQ0hzkpvlxoPHPGGPsQXN
 kaQ/EqgUYaNk7Yjn/quejsru7EL1vCRLAZVGzjg59/W17xP5/r2WsyX+w+Rqr1+9udLp
 02HYM00ZcFUyFYQiD6ZyJjVuAk5Cq3zWAuqdxUqKHSPIEcCzf83OsfoLxKPgScku0Pd1
 oDnwPcuRykWXxxmyR/sEPxjD5vnw1qy8Xr04hOXl/es5MBQiOOP4cBD6uPSnXHhABSGU
 Rm3ZuU8191DV4sEpEZZ0ysnAXCxbfKKYsoJ6LhpuC4hpqm2E7TfTXJLkmhmae11FR1Lr
 sPmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=+5yjlEgM1kw2CqWiW/w+YsADSYuG4xsPIjdO5G70lcI=;
 fh=aatruMxyOhPib/Oxg2zmlWgERSQXaiPC+Th8poB4b7U=;
 b=UMapYKjv2e718NylwhAzxLMH85U9YF5JYYNTCHp2Ijo5XyQtRPSd5uEv6vlmRKDJp4
 ji7gSU32E/4JQe88FIvZFsaIXPO3ty1XdnxaXHPH9U6TCBiJkqjPJEQT0WrF9FbEztle
 XIihMO7Pb68aIUIA2xoFHwtZFoK2JnWPTQ89/MgOYyqqJZwOs6/Y94zOsprZCjw3x4rx
 dOmPMZCnN1An62WR3M/k4PWTblvQ5ScHItj+e5eJMOwFa+wh2EdKNPa92ja2DVg8leC6
 U+RllRnnhAQH03heKVhWCRTgpnJdC7nJ/RwLEaUZ9jgyrpPd+Ev/gDvSum8X7vIAL6Zo
 af8A==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779972964; x=1780577764; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+5yjlEgM1kw2CqWiW/w+YsADSYuG4xsPIjdO5G70lcI=;
 b=f7tWuw0vqhS6Y3x0JKll8xttwP0Fneox+nMUbvz/LYbPdbzI1MLVbWB2Cw1YaY0A14
 WzmyRZrqrtMpLYRHXgJ0JT5HepLeVBnOuJJ0NSTnl5A1QlocXEo7gc/yQWCLQKSY1ezM
 T9pW6G/so78RuhRQlIk5dwttb0ZbGwvyN/b50Qv200+s0Q9EoYKD+UyxAYCQTyd1uk11
 QOAV7h2NitqrH52BlJ2tVHbJrSb0TfNqwh8txmLyR2HZ+AtkdVlzzPmmieRFTqlKq/UQ
 ersGodsllx69PZuPqyTI1WYGh9yYoEXZwmZq9HZiGp6R66sM0/PhvhiXQZy9nsbu6K5X
 CCFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779972964; x=1780577764;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+5yjlEgM1kw2CqWiW/w+YsADSYuG4xsPIjdO5G70lcI=;
 b=YV/FSemBf0w0++h+N8sryGIzyffSHIAPkwEOFIa59D2aaMawOZVw9ffeiMeDfSX9VH
 utQrn23bR8VD1Pf8GtU8iBhr+PyKfYlYzfq47l676cNzgXTbsWJ+55MyfNPZExM67Pu/
 IGkWKiSEFX121balsl6ooDCUxvH3vNOkzXBnRP9f1/vAbPRsFLUEX1tX3AQHE4fJ9V8+
 Z5ecXR7209umJ4aOGXJSqDPthxiEjsI2fsncNiZBgORTyV6raFhe3w0pD1YLCchT8kG8
 tzkCq3HYGosOoa8OeVOYRQjTMGbXjMn751hQ0NRgSNGiDjPaz0sOHtgLFGHUaTGdsG4X
 QmNw==
X-Forwarded-Encrypted: i=1;
 AFNElJ89MlNaSXPJZe4pSGN80bsCRTFjYwNNSZGZNvyc0M5dx4B6ejjJ38uvZk2K0CHDIfBmGLu05yrfxg==@nongnu.org
X-Gm-Message-State: AOJu0Yxfv8q7F6lRKyzTx1xa7pbHimm2UvGyfMJ0nSk0IpMO80DEuBO6
 /z2l0G6rHU6+3b/Tev+yEdOEUgPtReT+OdRzcyjPPM/i6WMxTwR9QNanGT+WwOjYoHvpf+0579M
 RqYVHB7XBJNdVUvo1HUhibHe+DBzL1oR1TX4pIjILXg==
X-Gm-Gg: Acq92OGyhVq5EFyvjTu9VSjPBmnC4kAthdCFuAu3pfRV20I63jvxSy3ZDu+2gURUweq
 wzNWxGLFMyD1ahWEM25K0B2jdfb6nmideqPAdzVeLhCFvpCqgLSOFyE94ucrk0GFoQIYIpgwfSb
 VWYAU8H9QCJ748RvR+0I/Q2+oit/EPcUaBpouhAdB5kBi60t6V021bL4GEep2dwLxShqVR5Bk/N
 f5MKpH1YImE8S/hdfIhx5y2bYSD6j+tRomk7xmLHqSd6RYXMi4YoUv/8hE194ky67DsYI3IJbFz
 X8U7CDpreDD6i+xpod/zf2G+Rjt6fPw7SDu71Ttvf1buH7kneqEHXFuN3+tX9xBK3W44ZJ58+1A
 wBaFASER/BuoP
X-Received: by 2002:a05:690e:1905:b0:65e:1cab:c245 with SMTP id
 956f58d0204a3-66044a2bb05mr838417d50.4.1779972963907; Thu, 28 May 2026
 05:56:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260518073401.11279-1-corvin.koehne@gmail.com>
 <20260518073401.11279-7-corvin.koehne@gmail.com>
In-Reply-To: <20260518073401.11279-7-corvin.koehne@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 May 2026 13:55:52 +0100
X-Gm-Features: AVHnY4Jkhz-x12OW3l2kTK4Rewu23FBHsdOw3HZOqpuj8D8Xdgj_OJIzavx74Jo
Message-ID: <CAFEAcA85HGU2zw95oyVL9m1iYnFXs9WwTH-k5hvXX=KLTd9a5g@mail.gmail.com>
Subject: Re: [PATCH v7 06/16] hw/misc: Add dummy ZYNQ DDR controller
To: =?UTF-8?Q?Corvin_K=C3=B6hne?= <corvin.koehne@gmail.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Yannick_Vo=C3=9Fen?= <y.vossen@beckhoff.com>, 
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?Q?Corvin_K=C3=B6hne?= <c.koehne@beckhoff.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org, 
 Kevin Wolf <kwolf@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 qemu-block@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb133.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Mon, 18 May 2026 at 08:34, Corvin K=C3=B6hne <corvin.koehne@gmail.com> w=
rote:
>
> From: YannickV <Y.Vossen@beckhoff.com>
>
> A dummy DDR controller for ZYNQ has been added. While all registers are p=
resent,
> not all are functional. Read and write access is validated, and the user =
mode
> can be set. This provides a basic DDR controller initialization, preventi=
ng
> system hangs due to endless polling or similar issues.
>
> Signed-off-by: YannickV <Y.Vossen@beckhoff.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

