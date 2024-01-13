Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp2932378ejs;
        Sat, 13 Jan 2024 04:28:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGn/OqBmPqa1jrra7gsPp88SaR9Vlu6jLwxe0exAr07cFW1q5fPcpcYvbLTOu8pTyNfecgr
X-Received: by 2002:a05:622a:1998:b0:429:bc77:9bee with SMTP id u24-20020a05622a199800b00429bc779beemr2984493qtc.76.1705148917392;
        Sat, 13 Jan 2024 04:28:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705148917; cv=none;
        d=google.com; s=arc-20160816;
        b=D/kvMBleG+YGEXQglQapH9x5OXX/PpRSi6eye+nQ43np59PTxRDcg/6wWRuIYveJGa
         WFarGnLfvo4zd51CDlZ98oJS5qBd1QtVk4NU0jbkfv/4ptwWo9zxd/IyjtLapY1xKnCn
         HHXwGor12MV4r5irUriR9ni8qQxrSzyevM6EPovy0ljfFwJs9aUoYBKMw8uRJKPUs3Hc
         lKyy4yNo+FrVRfSHrq48wQD6CYw+0Wa8JiBx7NN6tNB75n+WcbKmRm2m7BAQRfl9yFsv
         FENjmnKbtHoLe2a5e5l5C96eW3eC9TjKEswqEbVT2+eYdQq1ViIoWRSbUzVUsdaNrQ26
         Di2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=atfGxe1vLKTGP5SfPWMvrSFlCNgr5XOCwebov4xxLik=;
        fh=okBdXp2j7ZzUTSUTpGCvfl98J3L9zXWlzkZsOlQF4t8=;
        b=nYf0lmxuVEPZIETYIryh0O121vWXdbiA2tcf6d4B1FyLTCuq7jkQqLwwIkqi9PualF
         1McadFZjJ0g+qPceeP9hmUi96TN98G3Z4GoY9vsqOgoE7gCOirVrSlt6vgjSfvgNq3Bz
         Zf2B8OQL4U48o2jKDYL8psihzjx+2aRTb8XeCuJ/KGMDgBglWLwEgv5Xa6Fwwwyr6z/p
         yRb64f/iPN2uugYciEujQX/cq7sOwhd1deaaS/wBie6Bxgjl9GmWwO75cQjfmzaH5O5v
         1+68x1udMQAzc8DqMxA3RU1zUFYwuWKae3tL5VT7s3gr3/RPGlsz3dup1V2zTaBxP2bD
         PjDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YwKqFkYM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c3-20020a05622a024300b00429d1d487a8si2434555qtx.563.2024.01.13.04.28.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 13 Jan 2024 04:28:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YwKqFkYM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rOd7D-0000x3-Ti; Sat, 13 Jan 2024 07:27:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rOd7C-0000wM-4G
 for qemu-arm@nongnu.org; Sat, 13 Jan 2024 07:27:54 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rOd7A-0007me-Hu
 for qemu-arm@nongnu.org; Sat, 13 Jan 2024 07:27:53 -0500
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a28f66dc7ffso1518794766b.0
 for <qemu-arm@nongnu.org>; Sat, 13 Jan 2024 04:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705148871; x=1705753671; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=atfGxe1vLKTGP5SfPWMvrSFlCNgr5XOCwebov4xxLik=;
 b=YwKqFkYMSyeblcSDHlbS146eGKcXg5pAHej0lDxTsenJ0UEkAQLUIgZ35RjB2vf8Dj
 fHVOhPO/Qe7QTrHOGslKtyc4RjsqcTlrzubkPyypHR7Nh2JhM+l9H4u2/0fDwOLPfW9C
 m8S58sc3ZIyhxUE3awo+9Qs6+9Vlr4k/rMKm9Zni6sg5VTFigKJ/tn+gMkxGJrgx4AbC
 peOR3Bp96BuJ2QW2coSy5rSSvjNMS/5CtBXpwAIKvpEXVrRc1xS4N64g4TcS+mveFMH4
 0AqPXLbjkq1DclNHiSAZgF97msJLmu4OQ8tQDyjS0gAuMF6SQPvVPBWK9/xA5f2sdMqb
 wzCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705148871; x=1705753671;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=atfGxe1vLKTGP5SfPWMvrSFlCNgr5XOCwebov4xxLik=;
 b=Ofe2LNuxtlmkhiK9ArsbVlaAvXMsE4mrNmaoLzOC9EL/RPRkT93WIYkPgJcz7v/61h
 YI8NQxX4SEwSn11vycgwTo6vT8ImOp2So7WqWEwdsm6Inra4ki9sSgU2cQK6bZUfo17d
 eaoQRxKI3E81fdIcV6NhcYdjvOSn1s52uILx0AuTZwWXD7GltwDHzEHgAjfUwKsQVYCZ
 1sWswzLrjzfHOw/80CncuEqWIXXndggifNARvM0KCz0RPjbmomcg2/H0HAAImP4ScPEY
 5WRRuQQJMSkSbTPgNJdv2x/Zk2VN56mP3N4bSI+oBNvSgCrmmilhmI9DjbAisRHY7h0F
 HWRw==
X-Gm-Message-State: AOJu0YzHvnP4+tIVwW6xlaFJ/8ih4xd+aN5Q3UCZ6AJ1SHdUUQOOKfKi
 PmBdArw7ZZb2PSeex4l5qPlfmZELNMqw902U0bLL3wid708g8w==
X-Received: by 2002:a17:906:6ad4:b0:a29:d805:20ec with SMTP id
 q20-20020a1709066ad400b00a29d80520ecmr3218437ejs.22.1705148870986; Sat, 13
 Jan 2024 04:27:50 -0800 (PST)
MIME-Version: 1.0
References: <20240110234232.4116804-1-nabihestefan@google.com>
 <20240110234232.4116804-2-nabihestefan@google.com>
In-Reply-To: <20240110234232.4116804-2-nabihestefan@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 13 Jan 2024 12:27:18 +0000
Message-ID: <CAFEAcA9BmpHNbf_MkD=VOqmr+N6dvw0bUti_eYCA2Xqf9kTByg@mail.gmail.com>
Subject: Re: [PATCH v12 01/10] hw/misc: Add Nuvoton's PCI Mailbox Module
To: Nabih Estefan <nabihestefan@google.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 wuhaotsh@google.com, jasowang@redhat.com, avi.fishman@nuvoton.com, 
 kwliu@nuvoton.com, tomer.maimon@nuvoton.com, Hila.Miranda-Kuzi@nuvoton.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
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
X-TUID: hZlXlJSEySCK

On Wed, 10 Jan 2024 at 23:42, Nabih Estefan <nabihestefan@google.com> wrote:
>
> From: Hao Wu <wuhaotsh@google.com>
>
> The PCI Mailbox Module is a high-bandwidth communcation module
> between a Nuvoton BMC and CPU. It features 16KB RAM that are both
> accessible by the BMC and core CPU. and supports interrupt for
> both sides.
>
> This patch implements the BMC side of the PCI mailbox module.
> Communication with the core CPU is emulated via a chardev and
> will be in a follow-up patch.
>
> Change-Id: Iaca22f81c4526927d437aa367079ed038faf43f2
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> Signed-off-by: Nabih Estefan <nabihestefan@google.com>
> Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
> ---
>  hw/arm/npcm7xx.c                   |  15 +-

This patch shouldn't be changing this file: all the code
that adds the device to the SoC should be in one patch
(patch 2).

>  hw/misc/meson.build                |   1 +
>  hw/misc/npcm7xx_pci_mbox.c         | 324 +++++++++++++++++++++++++++++
>  hw/misc/trace-events               |   5 +
>  include/hw/arm/npcm7xx.h           |   1 +

Similarly the line adding the include to the SoC's header
is part of patch 2.

>  include/hw/misc/npcm7xx_pci_mbox.h |  81 ++++++++
>  6 files changed, 426 insertions(+), 1 deletion(-)
>  create mode 100644 hw/misc/npcm7xx_pci_mbox.c
>  create mode 100644 include/hw/misc/npcm7xx_pci_mbox.h

thanks
-- PMM
