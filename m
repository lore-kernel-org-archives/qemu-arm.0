Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp1879898lfk;
        Sun, 30 Jan 2022 15:34:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwUIvP2s9NeK3I4zQdgviG7fkNZaLNfywiUwG+WBNhs/t6HPAMG8Be68eNXHkN9KOLxrBbS
X-Received: by 2002:a25:2d43:: with SMTP id s3mr26568011ybe.646.1643585692892;
        Sun, 30 Jan 2022 15:34:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643585692; cv=none;
        d=google.com; s=arc-20160816;
        b=wA6JrNJaZZxzyvOEfRDmyqE2NeLJKqw5haqaTwLwY5zgL2Yy0rEVznk9CaUfAwak7x
         dLxvDQ0VxMD4dWOnGp6t8MYpdMLvPUjGdo9V9GsUMTq3Cjkqz6LwXDY4Wew/ypwZ5kSW
         zQLaUkXYDXXRMMPoVZmcnerHOYMyfPUojzWwRozQsUN0qvohS0IDaQaMJ6X+UZSKSiKX
         oEQPJgjVOZ8daHh1ycT2jrLE0OkQ9em4JGKLCRjkr1BC1IkjTz1BYkJTB+F0HD833W8d
         47+wZ7gkW3RysKJbP5xn8pOm/YiJ3G2oPWZz7vqB1XzR4VjhpV27MlhKuDvb75dxqzy7
         jWvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=iTrs49JFnEUqXfx3rIFfiYwMCbrGbWGY+Wp72dbfbTs=;
        b=hJf0d+DutDoLyeHHsHZtWJ9ZtLJk3QoYiUs0uVUeHVfpoff8WI4NpVM7jgxOKyq3YN
         /otzWv1IgmsedFqG62XWxKUGD1SY6TEZQqt/bcJL1i8Wy5Uiwq+qnRbm4KQoLHYNOsYz
         Z5wH6FHhI853+M3Nt49tBe/Nesv8eXJnz6e+/5XrhO/JneDeablsgWf/OQEem5c6nULt
         nl/E+OHaRV8cZEhF0D8LtG96TcbkjtXfuWa7V5v6gVxXEFD/+mRt1+4KfsPcbbHKLzCH
         PngA1pkpQoAPzOEQwMY4WyRc0tL6Q66fIHeBChw3/O8hDfo4SN1lTbsJqigpUxGQfEaH
         gZ8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=aVNpu08Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s7si10270425ybc.113.2022.01.30.15.34.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 30 Jan 2022 15:34:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=aVNpu08Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:33864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nEJie-0002uG-Aj
	for alex.bennee@linaro.org; Sun, 30 Jan 2022 18:34:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nEJiN-0002s0-R9; Sun, 30 Jan 2022 18:34:38 -0500
Received: from [2a00:1450:4864:20::429] (port=36686
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nEJhq-0003eU-5T; Sun, 30 Jan 2022 18:34:03 -0500
Received: by mail-wr1-x429.google.com with SMTP id u15so22029153wrt.3;
 Sun, 30 Jan 2022 15:34:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=iTrs49JFnEUqXfx3rIFfiYwMCbrGbWGY+Wp72dbfbTs=;
 b=aVNpu08ZvU8cW2ZuU9P1LgqP3s56+Ggs74xnI7JsPx/rcaKM+Dil3uYeEyN+cuy0P3
 U0bc5nVfWcZeBsDC9zTO234Gl+6XrNmsEsspl9JL4/npeTDYWFqGEBDkGOGqbpaGGwRH
 aLXtShh89vjQniI64qTVOkMAtWPwtKmqnsUqmc1qXk+gXkMq7Euwu7FgkrSQiIk3qrVc
 ENVijfgLX+KmK2l77S7i/rnHYDjKw8T7ZhzoWjzwwXibnEGxhdjt30xZXVLs3iuqdbNi
 gMFIkRfPOA71DUa0ocTDKGxeyYS5HWOLeyFC7d8EYRYCBZf7yfJbQ5EZYVqlf9EFMJVQ
 Gumw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=iTrs49JFnEUqXfx3rIFfiYwMCbrGbWGY+Wp72dbfbTs=;
 b=Wje8ERTyRVFFoHAOkhmrWMGkBYZtT8gxIYGLF15ZF9g5xcAOOKSbCI70tAnaaYlaOJ
 lS3dJJ4UzJKMtss3DDhakAiTIzFEeJeakhS6VZRZ4Ny02Xf2LECwA1WeIowk1iD09C65
 +nB1CZnqxz6ji13KICcn0br60GJpmaOKSqJttHA9Q1VakIvA4HSQ/JxLJH/4DwO7WNmK
 XO2ec1CjOZetsEvukuSCsY6lkI9HPkwm/zTfEddEhLNt+5qL0SmhWYzqwJr0CrlFTcQS
 wERNCJ1kWetlOtjSdU+BuuAWP84iK1Pm08zqVXGrBRBskwzI/uN0wxvygQ97VPWHRM43
 L8KQ==
X-Gm-Message-State: AOAM531PmKuKHQcZ+ulwu7WTWBSRMeMOKamuEwj08BrteAeQ3Ae0fBdK
 D3qmF6CX5YCx+xuprQ+QykA0P7jH0po=
X-Received: by 2002:a5d:4e52:: with SMTP id r18mr15146563wrt.420.1643585638664; 
 Sun, 30 Jan 2022 15:33:58 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id 14sm12289377wrz.100.2022.01.30.15.33.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Jan 2022 15:33:58 -0800 (PST)
Message-ID: <e1f64ee1-3a8b-6209-52d5-c456c56401a7@amsat.org>
Date: Mon, 31 Jan 2022 00:33:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH v1 4/6] hw/arm/xlnx-zynqmp: Connect the ZynqMP CRF
Content-Language: en-US
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, luc@lmichel.fr,
 sai.pavan.boddu@xilinx.com, frasse.iglesias@gmail.com,
 alistair@alistair23.me, richard.henderson@linaro.org,
 francisco.iglesias@xilinx.com, frederic.konrad@adacore.com,
 qemu-arm@nongnu.org
References: <20220130231206.34035-1-edgar.iglesias@gmail.com>
 <20220130231206.34035-5-edgar.iglesias@gmail.com>
In-Reply-To: <20220130231206.34035-5-edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-arm@nongnu.org>
X-TUID: PYaNpCJhUTeg

On 31/1/22 00:12, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> 
> Connect the ZynqMP CRF - Clock Reset FPD device.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> ---
>   include/hw/arm/xlnx-zynqmp.h |  2 ++
>   hw/arm/xlnx-zynqmp.c         | 16 ++++++++++++++++
>   2 files changed, 18 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
