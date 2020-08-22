Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp1356753lfy;
        Sat, 22 Aug 2020 13:12:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyC8j9vOGia4l3CrP/OlD6N8P4PuhDxAPJJtN5JLgOHAoEC9JDRMECmnPglsiO5HQcD6qIj
X-Received: by 2002:a25:9904:: with SMTP id z4mr11938063ybn.150.1598127124435;
        Sat, 22 Aug 2020 13:12:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598127124; cv=none;
        d=google.com; s=arc-20160816;
        b=xmnylnYXEmBFv3zwNalpW3lReCjliRY4NqZWYW6GCwnW7p16n6Vpq/2InOGwu/h3A+
         jJ0xtHnlH7u4BwoptLOuaNEjD+MTLMrDhT17OrU/j4VsqHg6PCjdxinrxMxhhb7AAY5e
         8i8fjmfAhUHBvMuEi0HbEa0mJiQrHl1PUj+XMIu6qJdsprsEaEYtjKTtaWXgNJnvsYjs
         uW2v2m1KQmePWZYJj0dbCotjnQPw/bcs9Wm6AbcOVPXiBimfVq4sxEIMQ5nW3X0lnhLa
         RAJFms2fLIbAejgOYZ8mscwPDIcdKXwa77dMnlT0eqyMmyresIvMPpAzeLeLIHYvhefT
         p3Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=FGrHTi+rXKQ8gTjyG+Q9tPRB04Bdg9e5XS9XpP1Ub18=;
        b=et70H1xwm3zI5IEifqQsebikqCpnN0VtjCqQk8XfGilWhlo2zi74xFE8cjSjHivrT/
         lIqu82ZiTZPuMA0iaBg2mB/+xDDR95/ahTMmxmMOip3FAaY5t2Wm2OcokbhI/190iphL
         uBd8oMs8r+w2Xs1tj8qSnxg3m0K0mVTlfoiaMRShPWU6VeZoT9WAth6tcHcqtv6/QmNT
         Ojs5D0oC+xkJ8tKuvFIDUH0XOk7uWkh7scoNeE3s7TxUn9BJVmgw9NfrVZYKy6WVp0Kv
         NPETgyCmfH3lhDBfQAoOvdy8CARj/MPTNWW3hDbZ6sel2CQgJClZMSfVf83Kqhieo9DV
         q1RQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Gp7jP+y4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 200si6342987ybe.193.2020.08.22.13.12.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 22 Aug 2020 13:12:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Gp7jP+y4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:32904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k9Zrv-0008TD-Re
	for alex.bennee@linaro.org; Sat, 22 Aug 2020 16:12:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k9Zrp-0008Sv-8d; Sat, 22 Aug 2020 16:11:57 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:50274)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k9Zrn-0003f4-Q0; Sat, 22 Aug 2020 16:11:56 -0400
Received: by mail-wm1-x32a.google.com with SMTP id t2so4646127wma.0;
 Sat, 22 Aug 2020 13:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FGrHTi+rXKQ8gTjyG+Q9tPRB04Bdg9e5XS9XpP1Ub18=;
 b=Gp7jP+y40ARESv4g481WL3tfsxGIBJawXsXeuTCivbM/3HumnrbTi2DsYkj1P3MTvM
 yjMcnG4rare9dfomG9ayLL1xKiJcRZrhPpK9myzo3jxcMqjHHxVjqTEkelL0jv3whcri
 V0xXeXpcWXccPYLc1dWeeIu/QDx5xkBRCSCz53ex+v8/kqrSSO/JjUvGkAh0OdNnvT0U
 fsLNkWJjRV14CMEvNfDDtD96qK1PEZBmS13AIUDkAXGtdCSvrqw2L8MOgMb478tj1R4S
 QKtrJV1I2wzam6T9A10y9sHP+tF0BjRLYjZrdG2aAQRFqjLFQrh9eaXLHYP7y6C2eXYZ
 cL8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FGrHTi+rXKQ8gTjyG+Q9tPRB04Bdg9e5XS9XpP1Ub18=;
 b=JVkJTGjx5Xh2C1CWn4VMogd2fVAfuFzy2LS+lA2iCzdVi1LHZsCKT18NUQyJZI6l4A
 JwlhPhHYoGiTcS24Be8oYDpAonLqIJbjtTZR+p88a64DbGmgfrgnd0kBbs3CdD4QUftP
 pdiF5we1F24pe/KJWsNOfGhNigJxEOU10lXxZvyUytuvIwukMP59HTDBH21VxMU9Bp6X
 NGoyeyAnZ++3BDLk1/Nas85n8AdAwaqokxiOt4LPFnJuUfaXSIyEsrZkhwsLUQvTaNbK
 jQ5K6KbRv3YrG1VFyl0ZyUkajJQKlyEHxOiK2fo75W5XnRD8G6bcREVOamiFWDVMB2gJ
 iQJQ==
X-Gm-Message-State: AOAM533ybim/AYVCh6YwfVAA038mDLeRrFU9qs93T4QjZ+4eaw9g5KOB
 mLGjxIzQIKwmzy5nTxjP299OMloOshk=
X-Received: by 2002:a7b:cb47:: with SMTP id v7mr8611027wmj.36.1598127114019;
 Sat, 22 Aug 2020 13:11:54 -0700 (PDT)
Received: from [192.168.1.36] (121.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.121])
 by smtp.gmail.com with ESMTPSA id o66sm14847831wmb.27.2020.08.22.13.11.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Aug 2020 13:11:53 -0700 (PDT)
Subject: Re: [PATCH-for-5.1? 0/4] hw/arm/xilinx_zynq: Call
 qdev_connect_clock_in() before DeviceRealize
To: qemu-devel@nongnu.org
References: <20200803105647.22223-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <1876dc76-567b-fe59-852a-d5a429b7a131@amsat.org>
Date: Sat, 22 Aug 2020 22:11:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200803105647.22223-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VtjXEi+USz7m

ping now that 5.2 is opened :)

On 8/3/20 12:56 PM, Philippe Mathieu-Daudé wrote:
> This is not a critical issue, but still annoying if you use tracing.
> 
> Maybe it is worth fixing for forks that are based on release tags,
> else consider it 5.2 material.
> 
> Anyway we can still discuss if qdev_connect_clock_in() is supposed to
> be callable *after* DeviceRealize.
> 
> Philippe Mathieu-Daudé (4):
>   hw/arm/xilinx_zynq: Uninline cadence_uart_create()
>   hw/arm/xilinx_zynq: Call qdev_connect_clock_in() before DeviceRealize
>   hw/qdev-clock: Uninline qdev_connect_clock_in()
>   hw/qdev-clock: Avoid calling qdev_connect_clock_in after DeviceRealize
> 
>  include/hw/char/cadence_uart.h | 17 -----------------
>  include/hw/qdev-clock.h        |  8 +++-----
>  hw/arm/xilinx_zynq.c           | 24 +++++++++++++++++-------
>  hw/core/qdev-clock.c           |  6 ++++++
>  4 files changed, 26 insertions(+), 29 deletions(-)
> 
