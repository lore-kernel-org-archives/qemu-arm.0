Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp191068eje;
        Sat, 8 Jul 2023 10:39:21 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEWjqzFkX1SgbNwuz2fVvAPUZqv9uxyynNZH1q0PMzG71fPRWb10bMpDu3cMVAKZTmK3dH3
X-Received: by 2002:a05:622a:1352:b0:403:20c7:6d7c with SMTP id w18-20020a05622a135200b0040320c76d7cmr8519871qtk.37.1688837961172;
        Sat, 08 Jul 2023 10:39:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688837961; cv=none;
        d=google.com; s=arc-20160816;
        b=n2VqjpWjXRSwqVPaAohmLoKiL5f+edVOE9qV1yToS0kSBR4001xyyxHtyi3xkIz167
         heU4pq1hulQ8esMFOds+gAryGluMZ3rxhvf1QY4pocUA5OBh5QARlciqOdhC3hGrJFCy
         kFlLrL3HkJAaeNUTYzteegEqiWBxsG0NicZe1UHgM5n9Up67YTJox6abU8WBTgYxhyGo
         liTKvNuupk7FpoULhStcbsjKwlUAZuyWt3zTwG19yxVNORBlHvl9z0rKF1Zb/iqeGpl0
         8H6NfCc8Y/grK+Ua4BAbAlMNUbJbsLNTWd52UK479lx0BFeIK9duWHwvAm1C9zC9ZGHQ
         Hr4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=X9V3mlclSrZnn64RNlPhkleDibYYoVmln79aRJTZDHo=;
        fh=FtWweezahlk5nHHqiBIJQkQHRi1rR/PeDd/4ilHWW+g=;
        b=mai3nqjMkRUmqJrc4gJ6JTbroEkyl8vNimJzXf706bsEYqSKQ4o/rte/e7zJfAigjO
         pNIDK03lGyuYPuZ7yqLIByBhCu6/5ueHJXzR1j84SZzBqWKsP5OqtMCx+S2/r65FZtwD
         QKYkYUUkfGWRPpBQHdDkfywQViIYy+quB2LXEgc7Wdo3/HeVRM3hFsox8ga22LCmB6ta
         bvJDW03d/itF9dFAfI2hD4Gv79q/sCiP9Tt61tnhp4hrflMxaW6FdK/RjiVnwXp/dH6c
         RorvEzzyueVZ25M++3k9ZicYVPSIh28rf9K3q3cNKpxcqDfTwdKgaAirK6y3LPW59L9F
         CNsg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yvSoWskV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v9-20020a05622a144900b003f6a80986f9si4146160qtx.296.2023.07.08.10.39.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 08 Jul 2023 10:39:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yvSoWskV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qIBtT-0000GF-G7; Sat, 08 Jul 2023 13:38:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qIBtR-0000FI-JI
 for qemu-arm@nongnu.org; Sat, 08 Jul 2023 13:38:49 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qIBtO-0000en-SY
 for qemu-arm@nongnu.org; Sat, 08 Jul 2023 13:38:48 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3fbdfda88f4so31168325e9.1
 for <qemu-arm@nongnu.org>; Sat, 08 Jul 2023 10:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688837925; x=1691429925;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=X9V3mlclSrZnn64RNlPhkleDibYYoVmln79aRJTZDHo=;
 b=yvSoWskVNJ6/Y3ZSap6nGL/Bdien/DkvOEeSJJZMItaX6jTWh6FgVhdhz7sQ0XqlKU
 EGSE1hxItCnQgu6K2OrGRYwVYUuzd9wVMCmSGGelPj6qVUOGdhCBRBpKSI9n7E73PThK
 0Shg7HnJBN8asOw04mbuvLJTqEUL5TA1VTDcf/zCA9oKxM4qHNQMfzGaVC6PRHQBNRby
 RCMarjvvgsDXKlp0W1EDRSeCz1lj7pKCsPT4y2QGYLTGk6MHsYw7ES1bsPrv0mz9ZI9V
 T8dFNYgrQkDK6wK6hyolW5vHdXZQfzOXmRlsYMgd8YKHqmivy2hvGKsoACIgHpPhz7gj
 CUOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688837925; x=1691429925;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=X9V3mlclSrZnn64RNlPhkleDibYYoVmln79aRJTZDHo=;
 b=M4ShAEr0/KT5UTYrMYI8ueoK2rh7opI0NlkJzGw69N2IzuEhkj6jP61Mo/E+Df4GOn
 nwFwNCrTYQZxxnODZ7SsCppWnuA99HW9e+bdeev6O5dS81Otj9hDTicjoXW+9KCflcSR
 3bRglVQ6gJqlHNunYgink6cBXuKOz8QemGhIJeNfbvo4yd/MCj/g+5JpdH6v87aQCUE9
 I8cAqk63XBH6IWgA971EmxDs5+Zt9cxbWZ9B6EsuERzfo3Jna2i3YXPCAake+CoWauM8
 Yg6QanIZ+EL5xXnSJzs91O2OPwnk5RYIa+7SnheoCycotWTZwSVugBttqWuCL5fdxOPU
 zLsA==
X-Gm-Message-State: ABy/qLbNeqqnfeBqK0plSqdujmEGfdoDhwW/GTJCi+a8YURBpH6T9vx+
 2/Kuhd+n7wqXaIx3pYDX+xWbJQ==
X-Received: by 2002:a1c:e902:0:b0:3fa:8874:fe69 with SMTP id
 q2-20020a1ce902000000b003fa8874fe69mr6744892wmc.29.1688837924986; 
 Sat, 08 Jul 2023 10:38:44 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.184.32])
 by smtp.gmail.com with ESMTPSA id
 y11-20020a05600c364b00b003f90b9b2c31sm5626969wmq.28.2023.07.08.10.38.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Jul 2023 10:38:44 -0700 (PDT)
Message-ID: <d33e7552-2f53-6669-ff6c-348b7f024967@linaro.org>
Date: Sat, 8 Jul 2023 19:38:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v4 00/37] crypto: Provide aes-round.h and host accel
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Ard Biesheuvel <ardb@kernel.org>
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com,
 eduardo@habkost.net, alistair.francis@wdc.com, danielhb413@gmail.com
References: <20230703100520.68224-1-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230703100520.68224-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.091,
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
X-TUID: 803yb7dv97M+

On 3/7/23 12:04, Richard Henderson wrote:
> Inspired by Ard Biesheuvel's RFC patches for accelerating AES
> under emulation, provide a set of primitives that maps between
> the guest and host fragments.
> 
> Changes for v4:
>    * Fix typo in AESState (Max Chou)
>    * Define AES_SH/ISH as macros (Ard Biesheuvel)
>    * Group patches by subsystem.
> 
> Patches lacking review:
>    12-host-include-i386-Implement-aes-round.h.patch

Deferring this one to Paolo & co,

>    13-host-include-aarch64-Implement-aes-round.h.patch

and this one to Ard :)


Possible cleanup to add in patch #4 "crypto/aes: Add AES_SH,
AES_ISH macros", declare 'extern const AESState aes_zero;' in
include/crypto/aes-round.h and define it in crypto/aes.c.

Regards,

Phil.
