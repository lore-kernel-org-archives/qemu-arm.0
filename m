Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1599759lfb;
        Fri, 3 Sep 2021 12:36:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxyhz7qQhoHSRMIcNm3EyseQAUd1vsRRcxbXuP1n9DUOiSMeB/IAACabt0nrtIZwJi0Xi2d
X-Received: by 2002:a05:6102:188:: with SMTP id r8mr590898vsq.11.1630697787112;
        Fri, 03 Sep 2021 12:36:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630697787; cv=none;
        d=google.com; s=arc-20160816;
        b=hV6mTZOG6q79pE0YENArfBu71t0UA6mJu6A/fited9gDcKn9B8SjfO6WDT/4+clWeW
         Wb4tGhhB/ImRJm8R+FqIbWGbTgmhB3XPATuALbF+/Ktd3coCW1d2Yta6bWapJlldGh25
         1m3H5qCO9G0ekFva+mkq54hYhjfPkWIfXtfPOgQhE9Gv+MV4fQRgQj1P022xxLwpGRVa
         DxDYXzW2B96Tuz4UmVSb4e1CXoMgL5+OFts2NAld62P/M2m1c9pYtLTbt1cVhUpVOkvU
         /OQ6XBt6DNW6VYblakiID8Jo3HFYo+joQ+Ae8QkI65ZtdYBQ6QpmwdGdhGGNRMlTt9Gz
         4saA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=AirxF/1Ojk+fCoEuiSeMsmyf2tj8ao6FGm012i2T/0Q=;
        b=TREgTT2n55sbY44F1Zp1bDfy/NdDz41GAqyMrKBOB9s2wrDXWYkh+pDmbD8xBmlVXp
         aDLIeelFnDLefTItpWbWyegxu4eMUC5PeS3Of6RVjkLTN+Cfm3zDIdedSqxlS53IkudK
         3siEFMrcwASNvsVvgeuoxPLv/SRamu1SXUrpM4WZO+rBzbiPWtK6qhhj0MGRm6hqlNdD
         rSjvlJwCEgSDS9x4NcJ8OY6DwCjjVhVSsvNLyngVL4snrtC2IGGrXrGYMr3+Y66uJ31n
         l3DKUhAHvhh2kSLBXwdTcA6xFIDdqMzNtg0mYutEI92amphwMm85yXLuC6ZaSdzHw174
         dlbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=sevlGC1p;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l6si66315vki.94.2021.09.03.12.36.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Sep 2021 12:36:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=sevlGC1p;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mMEzC-0001Sk-F5
	for alex.bennee@linaro.org; Fri, 03 Sep 2021 15:36:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEl8-0002B8-LK
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 15:21:55 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:33756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEl3-0003WM-UK
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 15:21:54 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 192-20020a1c04c9000000b002f7a4ab0a49so204150wme.0
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 12:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AirxF/1Ojk+fCoEuiSeMsmyf2tj8ao6FGm012i2T/0Q=;
 b=sevlGC1pCzeVwMoRjtXYJjjBTZwq9vjZq8qqnZ1nplVnGezS1tbdVI2jnKKQWTEM+r
 /FU4J/voy5kXRqAwJylyvasNc1tGY/TV+wYyftUnylcMKzVlr7f2qrwViOoo0LFNIvOR
 zWNz0r3vFv44KPQ5aZq3kDOOWfoSjueMC/2BOjhaM0Q+HooLC3d6vhdxP/FxQhJEvdGB
 OrKUA1idX8HAF5mPpG6ftrB2zOccxyIrf+WAfyfBAfFkp+Gi3FuurnZGY2crEvjKA2wN
 waKk9yDvdGJT8gGdC+Pb/aoJnlljY0eTpsjmApYQtdhPT0BghKXJ0/mMZP88xeGqT8gu
 JULQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AirxF/1Ojk+fCoEuiSeMsmyf2tj8ao6FGm012i2T/0Q=;
 b=R7n4Im7x2oZFbn/9WLpvt6vxVXTiAuadZUB1wIn0XNW/UZqrvYkebyXKg8e3aI7e0V
 VxWj7Qucg1aynRxcN8HvhnAHfeWUZuE66R7/t0Jy6yjAqHz9N6nBRSdYxRSbE3YQnjFZ
 IKX2TEZFR0WVk7uQ6NZhB2KBOnARDxTPNyQopcJjBbVHxJI5KWVgIjlY5nuieqXYIkfq
 ovMPLiSPyfX5d+3k4zvlX4t9+yDtyBi7F6m5pHSB+b2+fR6GEbhb+pZfMktZJ9dMLSJl
 BNxFh6l6xcp8aMeKxVXQ7Y/vX53JEcM0NEz5ZV7WJXAtFJLDNbpbItbNYa7zS+IZFehW
 9n0A==
X-Gm-Message-State: AOAM532+2GEv1FgYLN3R1Rfrm4DnIsDLgX7hEpYsQTKtR7D8WM2TTLAp
 lK8zv81Rw49e3Yc23QnLVCTzyA==
X-Received: by 2002:a7b:c5c7:: with SMTP id n7mr273025wmk.5.1630696908564;
 Fri, 03 Sep 2021 12:21:48 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id y23sm240964wmq.30.2021.09.03.12.21.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 12:21:48 -0700 (PDT)
Subject: Re: [PATCH 18/24] target/riscv: Restrict cpu_exec_interrupt() handler
 to sysemu
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210902151715.383678-1-f4bug@amsat.org>
 <20210902151715.383678-19-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e0eebabe-3e90-0429-1db5-525c02ffa95e@linaro.org>
Date: Fri, 3 Sep 2021 21:21:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902151715.383678-19-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Warner Losh <imp@bsdimp.com>,
 Marek Vasut <marex@denx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 qemu-ppc@nongnu.org, Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yKA7O16lt9d7

On 9/2/21 5:17 PM, Philippe Mathieu-Daudé wrote:
> Restrict cpu_exec_interrupt() and its callees to sysemu.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/riscv/cpu.h        | 2 +-
>   target/riscv/cpu.c        | 2 +-
>   target/riscv/cpu_helper.c | 5 -----
>   3 files changed, 2 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
