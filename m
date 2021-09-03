Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1570379lfb;
        Fri, 3 Sep 2021 11:58:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxm+tsGK8xmpwHPFUWDFerroDd6BxC7jgzZAlLvq1GNj5qpNbNBkCNAai6glLQEx+/RzJg8
X-Received: by 2002:a05:6638:1484:: with SMTP id j4mr467455jak.80.1630695537874;
        Fri, 03 Sep 2021 11:58:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630695537; cv=none;
        d=google.com; s=arc-20160816;
        b=ZgQ6lw2ZvSYOMs+PCCwtRVS7VYFNQH8ZCsv8UC0HxL4SBubWeN5N3H3lTYWX1zyfCo
         8+/9tWRkB7hZenv+RLQvDB6epfILSkpp0lFdq3Co/nLH86Ow0SGnmeRWjNslYHCFuZmc
         qWU02kdoGK5QODYVUbNyzWzm/OETjOE+rdcvbP6xbfBfvY1S5J4Z42OHUYT/nBgAPErC
         pFuW9Gnpn10/0Opzy+UVog/XyNOFhuDa9uxjFFco/QQ4Sb6Nb3afN28T1iS1K9hO5/Bv
         HuwJ7g+MSIGwC6jRUEo9jZOk3wMOu35Xx3Ys92D+V0LNdzE15NY1aYhb1n0ekf+Bjlq4
         /qkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=oiQhN56lFLrpiH+pj4hs61ZfHlqK9dWLRHv6bDRQQ3o=;
        b=M62XNPWHZrIORSF5+lpInB0m6CI1oCMuz0Pt+mVcm+e+cTnc2S/NVktgPcr3ZDn1zq
         AiASoFbfkwYKOSuUPBCqx2BKxNk3/qyj8ktZTpkwRFCqhpsJSJ6+jBLGjKZZCRpTYOJs
         AYs50KsYCn6otDOpFlJQZFqQNcgKKvdQhOvzizzyMyvt+hq7Kn+2rj/nJNulcfVm5TWp
         J7hSbhPV13+U+9r2DydEJLtaoqj2/+ZHNMHyHkExv3t65xGdLFhJdurFQNtLkFZeWhen
         50cR0GbKId0B4ussTcxD+3jU5WiiIFGWZlD9+8G0SBMeSlMKT/qXZgf3xQWFdn491E1H
         Fn6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hdjjVASn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m21si294029jaj.19.2021.09.03.11.58.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Sep 2021 11:58:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hdjjVASn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mMEOv-0002Dn-4z
	for alex.bennee@linaro.org; Fri, 03 Sep 2021 14:58:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEOc-0002Cn-OR
 for qemu-arm@nongnu.org; Fri, 03 Sep 2021 14:58:38 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:33560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEOb-0001br-Ck
 for qemu-arm@nongnu.org; Fri, 03 Sep 2021 14:58:38 -0400
Received: by mail-wr1-x429.google.com with SMTP id b10so122399wru.0
 for <qemu-arm@nongnu.org>; Fri, 03 Sep 2021 11:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oiQhN56lFLrpiH+pj4hs61ZfHlqK9dWLRHv6bDRQQ3o=;
 b=hdjjVASnZZts2OG7YHVPHgtc8QfF0KuyagkDs/eVxx+VOavJ//AGXGdwM4qpXoGkEq
 PnGw/DY/AuXGdUwcIdWhDxghCmBJaalDAduseAtNYOzeCN6yybQDoJQS6Z9flKcFTgEc
 EYC8VV6HP7BCZnAb0Vv7Et1S0lLvT88u5Z/9td1B4ZaenkNn1gy1ozkUU49DejP6J2qf
 tS4ke5eGtX4QM0DPUx9G1XM5qOo+wn51YNL+vvG4chwAOEg7qAEMHN0twScb9aFxOfbZ
 2DU6fBm/wl1wXvTirJGOlrG2B4tYdXhnFTz3nAOTiFd4wy+ZjCoRdCi6Xs1NdLS7xkjb
 0C9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oiQhN56lFLrpiH+pj4hs61ZfHlqK9dWLRHv6bDRQQ3o=;
 b=TUjcISwpNkmudvFWYwV9mf+54OGR8dKtA3CDwVpjF0P1wsAupfRBcSqkqzECCycE34
 rNKzlzYBOycu/kN5AvIF7qT4+JXY86dhY76lgharHaO6xcgDF+0SUk8lzjXAam33+sU7
 QWESIDQY7pSklvmRHHUM+QMfr6znIAtVQ7HGAPPw/BNF8rsmiaSyO6XPdsvhYVMPOBvV
 ihjfslpK8FfP0NkhGS3H0Po9fbIHA2cT2IcvRxYcRqom2iB28g/wrTWmjyQzNoKdt1gB
 MV2Qr2I7JUVxiRE5wOekOTq/sXKAQiGw5861MfhJ6+zKg9g3xWxrei9CP5KmPlf3tW/e
 NWaQ==
X-Gm-Message-State: AOAM533xwBCrL3b4drjX3wpMhOtypAx1u2Rv1Pk7wuJR8ap+5iXJiOiE
 58LdsQvD35BR+yvJIKdvBV96gg==
X-Received: by 2002:adf:e604:: with SMTP id p4mr544447wrm.37.1630695515977;
 Fri, 03 Sep 2021 11:58:35 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id l17sm82167wrz.35.2021.09.03.11.58.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 11:58:35 -0700 (PDT)
Subject: Re: [PATCH 02/24] target/i386: Restrict sysemu-only fpu_helper helpers
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210902151715.383678-1-f4bug@amsat.org>
 <20210902151715.383678-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <80295f1a-2156-5866-0208-a29e1b9ead58@linaro.org>
Date: Fri, 3 Sep 2021 20:58:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902151715.383678-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, Warner Losh <imp@bsdimp.com>,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /HOmGSDFX+CY

On 9/2/21 5:16 PM, Philippe Mathieu-Daudé wrote:
> Restrict some sysemu-only fpu_helper helpers (see commit
> 83a3d9c7402: "i386: separate fpu_helper sysemu-only parts").
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/i386/cpu.h | 3 +++
>   1 file changed, 3 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
