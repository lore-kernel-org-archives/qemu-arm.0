Received: by 2002:a17:906:18b1:b0:a2e:1324:ea5c with SMTP id c17csp304922ejf;
        Mon, 15 Jan 2024 07:14:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGEA6+GA6UB1lgt+rofYu8drF0z6PcPNSPMz5a0tiXGjwysphYock/KE5nlKSVp5zLSUenb
X-Received: by 2002:a05:622a:1494:b0:429:bfd0:1a5d with SMTP id t20-20020a05622a149400b00429bfd01a5dmr8311565qtx.44.1705331647538;
        Mon, 15 Jan 2024 07:14:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705331647; cv=none;
        d=google.com; s=arc-20160816;
        b=SygH/J7RuO0SifdFaTsDr/JwpJ+lyK3oGggcgT4ZfVIt0Q0oRGLlJxyF3YSiHVhJrI
         DnmKkD27Iq+XwyhtssjBOe+v3RF4OzgkMQBW9UoZm/adPWTSJ0mCzZJ4i2N/d1RKHt4B
         UuPMfPii3G5p5nuJ4PQVfqbhvubHO7PD+hFSJGKgYS6OUA/mJXu648QjQsbtTp1xGbYG
         2egKUztehP5Y7WLGfdbcpGXK3xq9Luv7bf11xHUrpOXnz8o4qYdrqmtsvGM3y5U/gdIL
         4FgycCR4AIvAFcrboMThghABlXlvGjYigI2GRK+0Z7Z+TlVrDhQ/WwwvTGlE2nUYR4a/
         P1vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=k/boiXL+zL3S34IXYq0iuvfMSVp+pYWubNO4fqSWEe0=;
        fh=gdBed72JnSifzQdV0PLkUCrNnp2PjbNCgzXbyzmTG1w=;
        b=o1uvGLUak2SZGf6fUMY18K3devE6MP/waRF/OugHjOVCyWJTQEUhN60qOuE0iqdo99
         6lE8tO+xkB/BKEfOJtL5+KnThJU/SI9XEGr19iZj9gONyYqlL3SYsjvFBVxJq+F0/v7i
         U+xD7P7tSyC9r0Jnvw8GfogpTmrZRFnCjmp/zOBPJminhflRoxVfqptRUVKfKNHl7qxw
         1QziDBg+zaczOviFEemU+50sTqey8N50qfke4M50tnpffSUzHRAJxV1OgOmI07zZlmDd
         Y7uwV/rTnZcxiD/b48zXLJ0AICBoPnOdUC6LPwt4Kg4dj0nTD8zRbNO+V8wduhmE0mdH
         Ihng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="nijbG4N/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i15-20020ac85e4f000000b00429f13848bdsi1768998qtx.760.2024.01.15.07.14.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Jan 2024 07:14:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="nijbG4N/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rPOeu-0001vl-QW; Mon, 15 Jan 2024 10:13:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rPOeo-0001sM-Fk
 for qemu-arm@nongnu.org; Mon, 15 Jan 2024 10:13:46 -0500
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rPOem-0001d3-NO
 for qemu-arm@nongnu.org; Mon, 15 Jan 2024 10:13:45 -0500
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-50e835800adso9668088e87.0
 for <qemu-arm@nongnu.org>; Mon, 15 Jan 2024 07:13:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705331622; x=1705936422; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=k/boiXL+zL3S34IXYq0iuvfMSVp+pYWubNO4fqSWEe0=;
 b=nijbG4N/JSi/vTfIqBwje9+ved7mSk1vkpFL3jNFGvT8azXyluB2akINaZyWBQPhAy
 nq8HclwMb+b1AbYIiSUuksYTNtE3BiARpkXH4xaDrND8sRDmsdiQfKAnFLCLjWy29Giv
 4Oe0zZzEhz5QSVzoK+LGN1r7lmhTlk7sykszX4KAbBZJlc06VZs7+aAyTbo4MQnVKN7c
 UvWg9Y/XacnHJQwdvW8aQuBNsjQWdPoyBPOnvbD5HyBnppzZNbxuEFfRv64GFYTKi8qT
 ujM0pex65d2ABAgSAcvC4+KxgoAlfKC4AT+gFG+MhV/PZmxheyqRTtju8dFgqyOG1CSc
 vJCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705331622; x=1705936422;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=k/boiXL+zL3S34IXYq0iuvfMSVp+pYWubNO4fqSWEe0=;
 b=G8F1LqHazLEIMewrD5JqaH7doURSXtR3x+amMAKnMc5oGm/PI5zrpIIRddFQ2pms1Y
 8vxAqwj4BIIzYWJEvdA3BT3MlZK7Fr+yGOK+b3xoVjF6wQomIoi3PGTkHAiYym2m1QGH
 Cw+izazX20mCaf+ljWpOF+ODjPpeEpm98GUyuYNUwClLUmeA1zpT8B9vfyCGJeA8+HI4
 qaInZzANZLLSQUYtInhVDU7TU3nrKRs3HlVIIWGQoq3AK/TwJlZdFwDorgJ9qjNVExoN
 UIuqakIf7zlEqDCj18vJ68/3DE7wZXzP7EjVJIcwjxjTi5Vxy1ceI564m2BEdVlMgwB6
 hkvw==
X-Gm-Message-State: AOJu0Yza6EDkGsHZcBpU08BaLESsYN0Fnq6a7H0yqV9BQghebPevjxTa
 wMMbfLNY4bQ3d8+/mJD8qITLqjykSKqeTsT9gUihV5ihh5M8EA==
X-Received: by 2002:ac2:5d47:0:b0:50e:8e94:bcfe with SMTP id
 w7-20020ac25d47000000b0050e8e94bcfemr1588156lfd.64.1705331622244; Mon, 15 Jan
 2024 07:13:42 -0800 (PST)
MIME-Version: 1.0
References: <20231208023145.1385775-1-sergey.kambalin@auriga.com>
 <20231208023145.1385775-33-sergey.kambalin@auriga.com>
In-Reply-To: <20231208023145.1385775-33-sergey.kambalin@auriga.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Jan 2024 15:13:31 +0000
Message-ID: <CAFEAcA-PoHE0wOm_sL1dkvrzk43F2woJe-ynh2KEoYd0=jp9DA@mail.gmail.com>
Subject: Re: [PATCH v4 32/45] Enable BCM2838 GENET controller
To: Sergey Kambalin <serg.oker@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Sergey Kambalin <sergey.kambalin@auriga.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x133.google.com
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
X-TUID: pNCSB+YAyXNz

On Fri, 8 Dec 2023 at 02:35, Sergey Kambalin <serg.oker@gmail.com> wrote:
>
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> ---
>  hw/arm/bcm2838_peripherals.c         | 16 ++++++++++++++++
>  hw/arm/raspi4b.c                     | 17 -----------------
>  include/hw/arm/bcm2838_peripherals.h |  2 ++
>  3 files changed, 18 insertions(+), 17 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
