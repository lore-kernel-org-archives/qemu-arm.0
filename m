Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp1332447lfg;
        Fri, 26 Mar 2021 05:58:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxr1266dJts3MhAEJqRMQDXH9c3rAuufgaiufd06mqu7/ZII68sak2Ma+l2xREwwfCCQqVL
X-Received: by 2002:a05:6638:d4e:: with SMTP id d14mr12020315jak.103.1616763528110;
        Fri, 26 Mar 2021 05:58:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616763528; cv=none;
        d=google.com; s=arc-20160816;
        b=ne8hhOwc5+ry6hv2ptzzpuRjWCWfwdO/kQvQkcy7sb6vwlR98qf+n2ERIp2skgSxOg
         5ipmeJWw5SQ+97hkUB1roSlY8Tm61oR0trXmSodHuZU39nmyst7JwtyqQTbPKti78LAI
         Hwzwrt7vOxIyKXkpVqv4d6/M2JvVfUnEQUzdKznsW56aymxcIiwGXdthXXGPHQm7nqbm
         V7qKA0wwYTajqIj2cKnxU7d7YPTPJbn0X+/Q/Ue3ACz87z02xXkMN1q2mlJ5g6Hh6zWH
         XhXULP1l/W9xYE7y/9MuyhWXiU1RQRkDLOzLQO5rB2EE/molNwJEkkTdrToLF9CM7mdl
         uQUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=tqUbg38dgNYfPHToGB2Y2XgHWCEbAz/MfVp9dWTR8QE=;
        b=Z+KrCG+a4Q0Sf1yQWdVjaNeNcOHU6zhvBj/StfSvajPZgx5CoOtxhET+gRDFh9kKph
         QEe+CJEYPTDpBJAuV4Bj4nSow2g3Pi8MiWcLL+IXsUeBE4T7ezg8kAYDWjgX3r/HFs5q
         aSBayJRJmfCbvz4O/AVkF1LeGBN/ajRrhozL59uzFy3ACUdMM6TqjcUk4ivlAERuSjRB
         X2FRjNqf29VyRhn8oU8ck2cEUB70tMCTAxpSbPGuxu77svBJJbMsqLV0lCw9ZLHR8+sq
         GSU2/ze3IbQZEtHSiF6sYwul3qfntzlZDWSAPcwjlkOVb9D8yOWxSZeiCw75xlOr7hji
         OGpg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="MWZb/ZzH";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x9si5873820jan.85.2021.03.26.05.58.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Mar 2021 05:58:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="MWZb/ZzH";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lPm35-0006CK-Fw
	for alex.bennee@linaro.org; Fri, 26 Mar 2021 08:58:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPm2x-0006C4-Ew
 for qemu-arm@nongnu.org; Fri, 26 Mar 2021 08:58:39 -0400
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236]:45586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPm2w-0008W3-0i
 for qemu-arm@nongnu.org; Fri, 26 Mar 2021 08:58:39 -0400
Received: by mail-oi1-x236.google.com with SMTP id d12so5573345oiw.12
 for <qemu-arm@nongnu.org>; Fri, 26 Mar 2021 05:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tqUbg38dgNYfPHToGB2Y2XgHWCEbAz/MfVp9dWTR8QE=;
 b=MWZb/ZzHVHAwjIS/VHb3WvhLod3JxMlPGJWj1RCoq03u/+K6LN7eic8kZHDCcR+AKZ
 cQoAhnCUMiQgmyc8OiaaX5RKS/FdtoVtIpcZdnCby7/YxJX33ITE6pkZtqoCmaswkx2B
 ehuEDbJggAGOrelm3Y6u+M7QaBJHefymCQD2BqAsJ3rkio9dGJSyo4rihv2hbApJKTJl
 /pwrfwyQiMdaulRXPhkqkJWcIdYqQXtctsiilYfImKA10yR0IOzxSjks0zCod22W1HIF
 mgxLZg3MvpWfx06E4ebf/dqPc3utGNyUrJfdA+UM8eNHpJPwczhx3xeABguFYcNLzKJm
 naFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tqUbg38dgNYfPHToGB2Y2XgHWCEbAz/MfVp9dWTR8QE=;
 b=b/kfQH+yrmiijXghIlq3sO4Rg2/nev7AjxXxxwDgiDqP/KkSkx8vdgaZ56LA/t6/f7
 1TrQcHUrazTG8QiczGXZosuixsoQnntCaG7zrz5oMPpEhe9Cvm+ikXkZPoh0BhMwS2ZP
 sPBe2E8mhyeWUgP8M3pgLDhcJXUfZr5epz9k83paum2DKyFic0DFPLLMYunSDpC777kZ
 c6jzpej1wGtS/l4EkytOMJCQScCfJ7GCXAnzc5wIoPE+dWmtXax/b7O7HndYFp274Hpu
 VjVSdbnUjlOtindbv7P+acQDt6ZgVu1B1IwtqMXAZ+XK9V5/BnIeuorYFTCnUpw7rxs4
 g/VQ==
X-Gm-Message-State: AOAM533+0FXcnLFZUzwAWXgCb/z8CV/6mi2jc9XfyEOIWD5ieb0vaLEP
 mWZS9x/U109//04jVMlJJxdTVg==
X-Received: by 2002:a05:6808:a8a:: with SMTP id
 q10mr9664291oij.167.1616763516649; 
 Fri, 26 Mar 2021 05:58:36 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id p22sm2127578otf.25.2021.03.26.05.58.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Mar 2021 05:58:36 -0700 (PDT)
Subject: Re: [RFC PATCH-for-6.1 00/10] hw/misc: Add
 memory_region_add_subregion_aliased() helper
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210326002728.1069834-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1218f5d9-a9c1-6569-997c-78abd1219024@linaro.org>
Date: Fri, 26 Mar 2021 06:58:33 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210326002728.1069834-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x236.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3Jiee2MVKHEG

On 3/25/21 6:27 PM, Philippe Mathieu-Daudé wrote:
> This series introduce the memory_region_add_subregion_aliased()
> helper which basically create a device which maps a subregion
> multiple times.

I must say, the example mtree changes are persuasive.
I'll look in more detail later.


r~
