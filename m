Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp1983655ejf;
        Mon, 26 Feb 2024 03:10:49 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWKFjhlaIkW7KU4iox1+QkFlGwUXEWcOjaTiLOHTrttWICq4vYzK3QRvXyDclAh8NcFT0BMHLGvBL2EahZ/E+ytqNeAoPwH
X-Google-Smtp-Source: AGHT+IGhAkB+ld2rFB/cW1Z1ABV8HFQGzYk5RGNqbmpGRCJ7bwx4L20u9YSjmxZk7wGBm/AN0b8d
X-Received: by 2002:a1f:4e44:0:b0:4c0:1cc8:8821 with SMTP id c65-20020a1f4e44000000b004c01cc88821mr2953611vkb.9.1708945849412;
        Mon, 26 Feb 2024 03:10:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708945849; cv=none;
        d=google.com; s=arc-20160816;
        b=ZC0r1s+BmGciIjRGhgkolB00GBohj/lg3vgwQw7p9HuapHuhUCuquryJVhQLohfyvk
         JXaFq6XGBWdBJ6Ml/NWq57R1n42AuxAcRowSgOTC6UxypglGelMvckM8JjU8h4FjBrU6
         7rAMbFz+CSix+vP3644Is2lexHrxvbm8gMGRpjz7U32RnltvQ07zo/1y6+kzWIWA2x/X
         lXoR7X6J+RhzYyCxVTWmvTthaVOMXtznzSUNhYXOO2fjQU+9DnuR4HQxJrqnWJoZdlOh
         HGkTCp5puacs2qvcL0QOLD8ZopYyHlu/C7ikD6ubp/ZyohGe2acQRgsTx6Fw4cN6t4uK
         7Fjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:cc:references:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=qTgeTVZVubBa3N2eaijKi1ll7rNPEQ4SIU28dGs6epI=;
        fh=hXh4WxXpJ3cUjYEKfNlDLWrcaL47P9Uv0kFFAqraOXM=;
        b=WmSrE8M3Tx/zYEY0hNlqnnENWaaVLMdewe6pH3XPSJtcq0Bf42NVKsjDXK/KfAaSNS
         8VWTRDTulhRKOszbbSMkHES7S7tcCNo/JXwmBTFmDz8sGQ/KkVJIcUYRsveZ6xd3Lx/3
         BJBsncc704JGOYVCJvYl46Lf1gvJfZH/05Mjc856XpQY0pE18ETnEbIUuR0szsxhP5wd
         YfxkZVi8b0yDXTMaNBI/Df+pEeFyKYxbDEYZuGgFBECGEiF0pfJ4Ewjr25Ngbrn9Y5me
         2KwWoKtjkL2ZrJuaUtJxdildXhiNs5aQCxU2tcjTCtKp8aory+PfvEgVfHfrT0WOQHTf
         wp4g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BNjEEDgT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t13-20020a05621421ad00b0068f7071cd09si4738100qvc.100.2024.02.26.03.10.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Feb 2024 03:10:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BNjEEDgT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1reYs3-0005PZ-QV; Mon, 26 Feb 2024 06:10:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1reYs1-0005Oj-Hv
 for qemu-arm@nongnu.org; Mon, 26 Feb 2024 06:10:05 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1reYrw-0007ag-B3
 for qemu-arm@nongnu.org; Mon, 26 Feb 2024 06:10:05 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-412a390347dso7227945e9.3
 for <qemu-arm@nongnu.org>; Mon, 26 Feb 2024 03:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708945798; x=1709550598; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qTgeTVZVubBa3N2eaijKi1ll7rNPEQ4SIU28dGs6epI=;
 b=BNjEEDgTR0g0XLG0rhQ3XxO4x+T0cZrsvo2YKuh4AFyikIyub5lg8On494rsRGy7x2
 9MP5qrUuLclJadM+XhcRxEnKyRpPF6wyycLDHrZZXaeTd2Zpn4GdHPvGDJ94Pmv0fT2t
 CYpXdRO87WkDy/1+ZIoOIGHD/fRmCN4yoZEAzdSchyBH6stU0+UK5xnP3ADYBTZl5rje
 9WHnhvixDCz4UE8EfAdpfQ7JV+E2naxiQi8MxiWx0VlezvBVP6XBVtU1+IjlolZ3JVPb
 AVGMKgiN0jHEWRCRsaF8iVcQd6i5ItyEMkOENq1hzfxEA3fuIYCmWRZa91Bfkpoz55w9
 2l4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708945798; x=1709550598;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qTgeTVZVubBa3N2eaijKi1ll7rNPEQ4SIU28dGs6epI=;
 b=B1hwBXr6+Km+YcMAe7PNZEHPnBlfTerkTU+i2yDtwCAM39Y7hF1zJdWWviQJox7QAL
 FGqUWSeB6PxSYdznSzpecffYwK+D6CQdb6gE5fTvYXtVIH1mzji6tzp4TU0xk9XurCpk
 cZSBHfeuxUzcULP7q1h4+JkWC1K9KE42B6QUi3hwykZ9qlCARqtWeGK46w53vtJp+YrV
 OzymlN4RtLT1YG9Dkd1eSer9DGwdghOcFyTW2qP9IjXP2jHRTFeAphsxaCnpKnD28IhX
 cV/AMC1KGErd6HCXGl7Qwn1RO2GA92Orz5crL+k5QbBE0MB3C70EVjZcHlKajzwDsdOL
 r8Jw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWc2c/lfPR8ucpa85BYbk/jYIboV8eKY8YAWAWb1L0jmYeP24UC3hXbIvNtdKoJmDrN8Dyw4LLw0LRCCS3CqGEwhMsl
X-Gm-Message-State: AOJu0YwYsYB2xR1t4WvmEqAXOHxZ0RB+F9WnvU4SG0ZcCYD/abliw9OD
 inomhZN7BPmz8C56Xs4maC5XgQXuh/amfQ700T7YxgALK1kWjvK/kwaKIKFbdjI=
X-Received: by 2002:adf:f80d:0:b0:33d:71c:273b with SMTP id
 s13-20020adff80d000000b0033d071c273bmr1937036wrp.36.1708945798481; 
 Mon, 26 Feb 2024 03:09:58 -0800 (PST)
Received: from [192.168.69.100] ([176.176.164.69])
 by smtp.gmail.com with ESMTPSA id
 m1-20020adfa3c1000000b0033d67791dc0sm7958845wrb.43.2024.02.26.03.09.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 03:09:57 -0800 (PST)
Message-ID: <4f8f7404-977d-4ff2-8987-a704bb260244@linaro.org>
Date: Mon, 26 Feb 2024 12:09:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Emulating multi core processor (ARM cortex M7) on QEMU
Content-Language: en-US
To: ankita suman <ankita.suman7@gmail.com>, qemu-discuss@nongnu.org
References: <CAJSdhPiUcGuHmtZbgaN3Op5qqyDGacN1s9DeGJkmQrx6HL19VQ@mail.gmail.com>
Cc: Gustavo Romero <gustavo.romero@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAJSdhPiUcGuHmtZbgaN3Op5qqyDGacN1s9DeGJkmQrx6HL19VQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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
X-TUID: z39cV/OoR9/r

Hello,

On 26/2/24 11:58, ankita suman wrote:
> Hello,
> 
> I am trying to emulate multi core processor (dual core for now) on QEMU. 
> The processor I am targeting is cortex m7. I tried by running multiple 
> instances of QEMU to emulate multi cores, and use shared memory for 
> communication, but since I am working on a bare metal environment, I 
> don't have the options of libraries for synchronization.

Have a look at the 'fby35' machine in hw/arm/fby35.c, it uses
a pair of Aspeed ast1030 and ast2600 ARM cores.

> Another approach I tried was using inter VM shared memory(ivshmem). But 
> I am facing the same problem. I am able to write and read from the 
> ivshmem device from two different QEMU instances, but it is not working 
> for ARM.

Cc'ing Gustavo who worked on something similar and posted ivshmem
patches:
https://lore.kernel.org/qemu-devel/20240222222218.2261956-1-gustavo.romero@linaro.org/

> can someone please guide me on how to proceed and what is the best 
> approach? If there are library support in QEMU for multi core emulation, 
> kindly let me know, that would be helpful as well.

Regards,

Phil.

