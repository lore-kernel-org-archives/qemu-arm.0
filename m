Received: by 2002:a17:906:aa04:b0:a46:bbde:2c08 with SMTP id ko4csp1386605ejb;
        Tue, 19 Mar 2024 08:51:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWbe7FCmq8FlFa8OHniDORoC2sYRpkgpIQvPUctaXjmvqxUce50Xm+QljgKrF2dWneEoCnaojIeCw5tcH9wMZKn3kKgsGP/
X-Google-Smtp-Source: AGHT+IFqLbN397DHRLyZVMWvaGgSl8p5GkAFgMSWxtjXuwaYRVAd/hlN+0Sjc2spj4HI1l9XYIuX
X-Received: by 2002:a05:622a:194:b0:42e:d4c7:4e1 with SMTP id s20-20020a05622a019400b0042ed4c704e1mr18391316qtw.44.1710863490270;
        Tue, 19 Mar 2024 08:51:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710863490; cv=none;
        d=google.com; s=arc-20160816;
        b=oa3bQZroueu0AG5hUIJy20vaXqP9Y/wv+W/jixFYPPwTN+7B0/dWtVWneuP1sNH0aq
         1b20R4wqbsUjouvTRC6M+4nFhAkvof0r1hsJqNOsY79wQVZgdE22H4TLQ1s9AQI2EIxb
         vAE/ZIrAUNrE2Tp9aETAlTfc20P3MEIIU0xnBCQAl+JIh45ONgWuDX4KzKeUZLLu4AZd
         cAqugNB7aKFaTcU65kb+0hnmfMY/wEj8H47a1is2gJeHOsnJ/k9xFvIuDkWgJkRE62By
         58WVNHMqZizGROJp/LqGYysKyNqVPSXH99qaNfwtmDEbAVy1WScV95fNLItc/HW2gWmF
         6gKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=KNVA0EplqCfRRQZvEl5ZxCaAA+iQDrqu4L3CqXyV03w=;
        fh=iTZ9kRm3BsMMKbsl2wYXjnnKEmCld95ZFsXE+AJ6Vm4=;
        b=xfT+SMIag4TG58Geklw5E0u746Gw+K96qxTWHtFD7UmDeuirleEnLs7gdT7kTeukVr
         9q3cmmS8fqLKGTPBEQ+xrIEOgRVfxXoG9gyDRs9DBbouG5TtQMg0SM9A+KI8KJfvaBVi
         mYU9Dgh9CxbEz7yoNCtq8+V9EVQ9tqxW7lWOFsI+qJEZIrcs7VQ0Utal4tEp9ZkrHr5/
         9p/7XIj86eA9T1gesqamxrIt4GdAqE0zPPPFzV05F8PqOhYdz/mIQAKUByIelLpXG69o
         mauBRBpDVA2bZWnJvGrAGhUTSZW4vXT4yooZMDLrJYpHpN2+iTNKTpgGpr04J3cczXoN
         le7g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YtiS486O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k12-20020a05622a03cc00b00430c4684d35si6410660qtx.214.2024.03.19.08.51.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Mar 2024 08:51:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YtiS486O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rmbjx-0007Rf-60; Tue, 19 Mar 2024 11:51:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rmbjl-0007Bx-GQ
 for qemu-arm@nongnu.org; Tue, 19 Mar 2024 11:50:51 -0400
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rmbjh-0006h6-QL
 for qemu-arm@nongnu.org; Tue, 19 Mar 2024 11:50:48 -0400
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2d2505352e6so64783061fa.3
 for <qemu-arm@nongnu.org>; Tue, 19 Mar 2024 08:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710863429; x=1711468229; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KNVA0EplqCfRRQZvEl5ZxCaAA+iQDrqu4L3CqXyV03w=;
 b=YtiS486ODAcmv/ibjgqmyfiFVCwkKR3S6uYZF7Y74Con6kUJnL5QY5GCkIDehUPRXX
 O7OmK7eYkaejezEflp+eApNC/EVzTjg+w2+g2cZfMU4tk0c1v+uGC8gdDSrE3EZ9t857
 9F1DRj0x5KDYdeLOwNwW4w6UrvwO2rMCUBt+nU0+x91Ulfxmf7WdOc3Kg0rRYKaCA1Tl
 O2nq10wau80otHmZF5zb7LOUzNTvD7M/XC0lgWcAdy6WSs8dI21EVD0elv+yuPvFy4HC
 O+hNCnRJPeRSAx0dQuQw+6vLYtzZt/2Nav5wXWAvj+v9cyn6JXekw5JRiyEHjKYD9vyc
 dZyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710863429; x=1711468229;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KNVA0EplqCfRRQZvEl5ZxCaAA+iQDrqu4L3CqXyV03w=;
 b=dvYMnsC1RIUvcf4cxpJn2pCzMiiHNbrr49VsnC+KA0NwIDLmgk0Sf9R/XGmPwMya+A
 d9fnXirUnBpxK9WSPtFnu3krBX9eXdrgU6Y0CLemLC4Sq8Z8KOMMw/RSRdxG7p2B495L
 35hCGhcaoqS73CUShA9RWFtxgrffftM05g5zAe6qm315lC+IyWgA/QrJ/CQQj6WLujqz
 jM9AvMU6NSBruWMt6Os5X1vOE7hQiqel3H0Q1lbhw066GZXvOqmxFIfHMV5GdVdRxIhg
 kmnYP8eVDBBm2eKsFgjRb80wr6GIlG8EOC6HuxgdjnmwtdovfJh7H91nDGbOJjKzFTkl
 hPPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpOo2bC+XJWmdpFAS3fIBP3JvjEfALQUMKUjH3aezVujptV91dRVkJnuYOV3G3kIIf7BcPyWTCUwzN1210EEplcpKJ
X-Gm-Message-State: AOJu0YwVBXnS9YMOHYuK6oIOsPhP8gUx5ampK141ZEst37GMnMgcV3td
 /IF7RYqkTHw7LJI7KRJpYrBCImQolSwTNRBdflF3tdzQ1J2NNym1C2HOApG08tg=
X-Received: by 2002:a2e:8505:0:b0:2d3:e954:221d with SMTP id
 j5-20020a2e8505000000b002d3e954221dmr10053031lji.34.1710863429483; 
 Tue, 19 Mar 2024 08:50:29 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.166.129])
 by smtp.gmail.com with ESMTPSA id
 u6-20020a05600c19c600b0041413546e5bsm5711005wmq.0.2024.03.19.08.50.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Mar 2024 08:50:29 -0700 (PDT)
Message-ID: <e14b6749-b10a-4e9e-98f0-33e78904b1f5@linaro.org>
Date: Tue, 19 Mar 2024 16:50:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] aspeed: Make the ast2600-a3 SoC not user creatable
Content-Language: en-US
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20240319150903.413662-1-clg@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240319150903.413662-1-clg@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::233;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x233.google.com
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
X-TUID: m6epom2x6had

On 19/3/24 16:09, Cédric Le Goater wrote:
> Aspeed SoCs are complex devices that can not be specified on the
> command line. Fix that to avoid QEMU aborts.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2227
> Fixes: f25c0ae1079d ("aspeed/soc: Add AST2600 support")
> Reported-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Cédric Le Goater <clg@redhat.com>
> ---
>   hw/arm/aspeed_ast2600.c | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

