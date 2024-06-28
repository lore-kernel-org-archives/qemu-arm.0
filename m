Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp176978njm;
        Fri, 28 Jun 2024 07:55:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUOuyJhv3X8KBqkSqf/qd+M5QXmSWDxyhTZAwiU00dehWaoRazlrN/l5Jti1qEbmXtbvJfqjSPO8lyvTxfkkOwR/u0RP4Ow
X-Google-Smtp-Source: AGHT+IHlEc9/9kao8uA605+lSib9v5enSNjuo9/eqYJKhMCT0SiqYvUla0WrBMABZ9xaPPcEzVWY
X-Received: by 2002:a05:622a:649:b0:446:4bda:5e00 with SMTP id d75a77b69052e-4464bda6257mr46621661cf.19.1719586522235;
        Fri, 28 Jun 2024 07:55:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719586522; cv=none;
        d=google.com; s=arc-20160816;
        b=xsZ5L0MpyrbdAjndOksETTMxFh3DkChqNcg5p215GWPdwEd/bGip2U8HGwDJ9Hs2sq
         8k8Iu4hAxtxxe4aIYq7PcMjdxri4TcIVT4Jw+TTcsBC7bSE6dO3WJ3zPvxDYUdzz/jM4
         fJaWI0uhgEXUbhnGpWy+gDmJ2p2aF+NBPDOr7GYge2DQkPmDyCAajGSHlyLD9jF0C9H5
         nehQIWi6f2++rMROQH8MTJSkGoA8dWrEFy53qHebFMUs1CW7Rjt76G/Z3KM/LXH7WJL8
         yxMfRup2LsXWZoRBVrr5oSH08CWAaydzGKILLVJ1zO4JIEflfegHaRoj4fIsHxeqyajz
         4abg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=97DAXS2tfG8ccBKooFzNy0yi9pdqTX24aMCecatGfio=;
        fh=sPNB+wMByEmOmv0NA5LZ0sZcEjWhHctCq8XojzuPPiI=;
        b=H2w0wwx3eXY4Y/RHYZz4leyfFmlcITiAZMY9RyDl8EFTmt8VHNBV8OiLIwLa9PfD4j
         GgcBAxZGbHihZE5aUJ2t4s9oqm84invkWDolZV+FdpzV8GHqXqOTJ42qnZJ1vr48flUr
         kq8htgyXMsggR4dIcCxBDcVaniwwfyqh15xcNbFzRyh12+kcTUZ+fP810i5AMstKps6u
         fnmOzD1TGL43iiTNN6SY9RPo/qjiBN3go1ABrHmOTShksKmw1dTCyDMCz/mwr7IxdzGi
         q5ZdP5VkywcMwWov3/OKdB0RTipPL62umKwybRX9zOXhiSVGYolMADtx75av7m1rzEHY
         i8Aw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vVXnyGjg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-446514e2324si20597481cf.711.2024.06.28.07.55.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Jun 2024 07:55:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vVXnyGjg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sNCuV-0004EN-T7; Fri, 28 Jun 2024 10:49:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sNCuS-0004DR-Tk
 for qemu-arm@nongnu.org; Fri, 28 Jun 2024 10:49:09 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sNCuR-0000Ht-G0
 for qemu-arm@nongnu.org; Fri, 28 Jun 2024 10:49:08 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-57d280e2d5dso922639a12.1
 for <qemu-arm@nongnu.org>; Fri, 28 Jun 2024 07:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719586146; x=1720190946; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=97DAXS2tfG8ccBKooFzNy0yi9pdqTX24aMCecatGfio=;
 b=vVXnyGjgiEY+s4wKQfnWaK6bAMYNE4kFyx5zLs2zKjhQ/ejwcbd+nB/YsZEfJj6mwk
 wD1cJssvSW7Ks2KoMqwEPuZ5FSZqF2QIi+kcAzaKjdI1cVa2kr8Gx6NAZiuGWhKfZ5Zq
 /W+YU8FrocRLmMiL+aOLu+8kkpFHhY4kWYlWBbbH7STgTP/DeEVWYSO9UMpxGDDkLVkY
 X/S7B5x+3/mRVKsnl+7gZqA3JIhrHZU2tUwkG/OG/lq+Vn9gNL/ASA9nTVYKz4g3Trbc
 SU2WcQLVntGwLfA3fUqEY96GHM3TtQ3RkGLbFiXSANiq6AN0VXKPCt1MoJllD/BOgXua
 pZRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719586146; x=1720190946;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=97DAXS2tfG8ccBKooFzNy0yi9pdqTX24aMCecatGfio=;
 b=vfROBJMfbbgeF7XzI58cK9+Zu7WkOD+ZSB1iAnZczekj8vbmQlz1mxS7k93ethhYeA
 kOsCT8HMVQghWxQ1FRyPcuv+rvUt3trrbu1jG+dMfxS6ypCBWIvO3TS8CyWUtcOt+sb+
 fjpf8Y1bt93tbaEb09pj970R1CyDE/qQAT0Rnf/cBAnQjRh/mzFHaAFJhxWptw5E5KIY
 T7Ii3fkp7yYIE671KqoUud69qSNn+mnwEnBWPQAAiwIJFypJuuWK5RCkpqQzngjeMjkv
 Njp5JMSQ/QRRYUfaOYQbdERP+2xfQpGnruuJ1RKaFpG0uaV3ZdLWyTguwoKeYOAPZ1dR
 HFtw==
X-Gm-Message-State: AOJu0YyxTlVznN4FMIK+Cy/W7g3zirwT4IchmVmAGPLmfmU4RbRQUm9p
 G6h4lE55ADWKePfKL1HUIYxKOMOOtU/ZHLMlGDf8ITFza2V2j9VxMz9Ev2CaLIn+KTpobQz0jjt
 QBe+BN4vxaZX7QZsYaZ/HIfVl/X7Qz2haFGGymQ==
X-Received: by 2002:a05:6402:34ce:b0:586:1517:872c with SMTP id
 4fb4d7f45d1cf-58615178745mr2011348a12.15.1719586145812; Fri, 28 Jun 2024
 07:49:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240621125906.1300995-1-sai.pavan.boddu@amd.com>
In-Reply-To: <20240621125906.1300995-1-sai.pavan.boddu@amd.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 28 Jun 2024 15:48:55 +0100
Message-ID: <CAFEAcA9tMf5oQGtX51NvX04abyfNJCpaEbvSjYtfg-FdprjieQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] Add boot-mode property for zynq
To: Sai Pavan Boddu <sai.pavan.boddu@amd.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>, francisco.iglesias@amd.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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
X-TUID: 7qO6b7sJ/LpG

On Fri, 21 Jun 2024 at 13:59, Sai Pavan Boddu <sai.pavan.boddu@amd.com> wrote:
>
> Add a way to update the boot-mode via machine properties.
>
> Changes for V2:
>     Make boot-mode property work with string,
>     Fixed few code style issues,
>     Added zynq board doc.
> Changes for V3:
>     Mentioned about zynq doc in MAINTAINERS file,
>     Stick to small case for mentioning boot modes in doc,
>     fixed commit message to mention right property name.
> Changes for V4:
>     Use strncasecmp,
>     Fix boot mode names to use small case in few other places,
>     Fix code indentation.
>
> Sai Pavan Boddu (3):
>   hw/misc/zynq_slcr: Add boot-mode property
>   hw/arm/xilinx_zynq: Add boot-mode property
>   docs/system/arm: Add a doc for zynq board



Applied to target-arm.next, thanks.

-- PMM
