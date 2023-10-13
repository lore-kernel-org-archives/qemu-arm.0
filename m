Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1500762ejc;
        Fri, 13 Oct 2023 06:15:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHp+bHE9Z/Wr2h2KhXt+y0u7RN7NsGuKacpliVv/36IcOPsvlb6dYhB63WI7mWzzs4ofg6A
X-Received: by 2002:a05:620a:1990:b0:775:72b7:9300 with SMTP id bm16-20020a05620a199000b0077572b79300mr33464412qkb.20.1697202912645;
        Fri, 13 Oct 2023 06:15:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697202912; cv=none;
        d=google.com; s=arc-20160816;
        b=ex/PN3hq2gu66Xyb8iOG6izbkMmKWsMnBwpkpSMgQU1CCnkHqCocmiscaPvD0FYNwm
         Rv29i+fEqc1B8F01f5ZIsBMmOSq6cZ8Osar9qcEuJ4HWKzsANGI4jet87oOs7LKW/lW4
         fLeJv8Sq6+4E+17g+XRsplmsm+QF+C7wSAceeutKYG4ALJSyudjrQu6AfCez3oMM762w
         55P3nO1f1vDQO38eRjsb14ndoSXwJReQB9Kqu6XFR+2Io//1xb8YY2Bv9XFPsIBrAqx5
         4xIV0XEULMQDZdLvpA4u8LUv1CgABCEdwDGsu/1fv9NWNlS9S7QSl4lVGKyqak4GVlf3
         V3mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=fJZhZn/fuAqrLtOfejeNJ7txTkdpvsiRI178zZhnyEU=;
        fh=z2tO06SjyNOmLT3KNAor44GrcmlxPUUK65Vo+czywGM=;
        b=mjV2wS94hud6/b0hatpC+GJJylNnbf4kkkaBnbTha0tqRtBVaIi4FUEss1wTczLEl7
         4jeuhtuL82Ih1MCJjzVLPUylsnk9lzB+OlPX2XPc20Rc8Nx1xjDzn2HZ3Ng7Ape/qnQE
         Kfe3GOYyGm4f8R/o+LQ5iTHI10vIomY8zgp6Z49WSQqk3el1lSZYT0Syhu4OCNXsROlH
         RmCcqM3W92oRVsoR3VPaM1yIzMpxwJ0VLx6r7QQ362JRHanlnsIxMcYP1JsgrIWLCqY8
         qbg5twKy3lcPTC27At/CIJy+qCnZw65rD2Pg3zJl8UxEDtCg18oUySfMoA2xMLaQDNe3
         OB4w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GhA6VQ4D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id rl8-20020a05620a904800b007770bfd6336si1151785qkn.569.2023.10.13.06.15.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Oct 2023 06:15:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GhA6VQ4D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qrI0O-0008Kk-95; Fri, 13 Oct 2023 09:15:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qrI0K-0008Ju-VQ
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 09:15:01 -0400
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qrI0J-0006z6-8R
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 09:15:00 -0400
Received: by mail-il1-x12e.google.com with SMTP id
 e9e14a558f8ab-3574f99d236so7747435ab.2
 for <qemu-arm@nongnu.org>; Fri, 13 Oct 2023 06:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697202896; x=1697807696; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fJZhZn/fuAqrLtOfejeNJ7txTkdpvsiRI178zZhnyEU=;
 b=GhA6VQ4DKicLYoND2tNZseQcbtT9UOcKIcEJl+ZgiX52cSnOul/AJJKqkJSswQCSVx
 M1wrykO0ys6Vtc2l4KCYyXcShABeXOpAmEP851m8OhppS3PjF/yapHkt4OK7CluLeOgE
 CiyYx/u9xTbiCB5xSf90J8IuorpXz7xYmJD6BwBYCHukEDtIGxmRAf05i+mjoTJmv3eV
 fW9BcbheULfBwIG4+uG1r7h++WSuB8tKk4Cy4XdDo4d4UFwLe3lRj39sfy8XO6RQAQjO
 Nlst+9hlrIt2KUppgnCFhanYUHc1bSzlqlQxPvf8dNzlaKJO9TCTM2Rej88gskHMJ4Ry
 j07w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697202896; x=1697807696;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fJZhZn/fuAqrLtOfejeNJ7txTkdpvsiRI178zZhnyEU=;
 b=VfTl4q8OGB15Vb9BVh9wJI75VAi+Ef8y5A7MFcDC3KRTCWECOf/OMF3DO0+CB+795s
 KudLUA/Q67bfzPED1EHyoaQ7NrhbepfzYoFyN58C9u8S3QXJrZVi2u2Vbj7s+l9eZnf9
 hUb7ddAwJUm7K8hT4kazLwtSRsNGr19xIHbsupgEr4wpmSCN9SZh/iP/+0SHG+BIWEJl
 u6WafpgqbDcaNN0loNvnDhWwH8WgExBt2PuBnPn75VPm1H+TXAVTQ2AolFZEO1KgylKb
 92xOtdz2SeKSQ7+vvaXdyqeE8FvJGA98bfP9DU0DwZJ4f1AF0SHfrZxBWFJDTYREiaED
 SAkg==
X-Gm-Message-State: AOJu0YwkxdlXQNkc0PxWVMam/SK9wCmu+U6E1BsSqk8bjPLI5BNhPYHt
 vnLPos/0vgvnZ09gcOdc0QPw3w==
X-Received: by 2002:a92:d992:0:b0:357:5d8b:719b with SMTP id
 r18-20020a92d992000000b003575d8b719bmr3381571iln.9.1697202896641; 
 Fri, 13 Oct 2023 06:14:56 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.149.95])
 by smtp.gmail.com with ESMTPSA id
 b23-20020a656697000000b005acd5d7e11bsm834522pgw.35.2023.10.13.06.14.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Oct 2023 06:14:56 -0700 (PDT)
Message-ID: <74d9f5d1-0bc7-4927-8c7a-1f37c2303596@linaro.org>
Date: Fri, 13 Oct 2023 06:14:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/arm/exynos4210: Get arm_boot_info declaration from
 'hw/arm/boot.h'
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20231013130214.95742-1-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231013130214.95742-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::12e;
 envelope-from=richard.henderson@linaro.org; helo=mail-il1-x12e.google.com
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
X-TUID: DmjpmHMqhRmW

On 10/13/23 06:02, Philippe Mathieu-Daudé wrote:
> struct arm_boot_info is declared in "hw/arm/boot.h".
> By including the correct header we don't need to declare
> it again in "target/arm/cpu-qom.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/hw/arm/exynos4210.h | 2 +-
>   target/arm/cpu-qom.h        | 2 --
>   2 files changed, 1 insertion(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
