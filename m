Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp143949lfq;
        Thu, 14 Jan 2021 01:59:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwpeWCTLAKaIboRiiDnGyg258hGBwB11wdZW32093JQBKga8RHAdlOBv+SdMPAYEB3laJ2O
X-Received: by 2002:a25:4c8a:: with SMTP id z132mr1756613yba.350.1610618374286;
        Thu, 14 Jan 2021 01:59:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610618374; cv=none;
        d=google.com; s=arc-20160816;
        b=ORs0RxKkPq8nNeHrQGFsn83NmJgOcdMa6f6mAQzNy+Sbuo58sdDWsAQBB0KK/ydo/K
         l0exNZHA9vobU7LApkr9v9F7CzbgHij4Oaf8DmGSdMbdFWKTi1Eas57EJWuylOzM/0al
         1nHDt/Xj8xqUBdFvzcCtb8VpSa8QEHiJ73ZKGyJUBlncJeUzm5HSkh0fgsYLVa2Ctdm1
         eanEci8Tj11oOPIuBI8EM+ezG9wOaw7Rz8/I7JGGtFmz7MsvIYGHB9uWTaByqf6YTHV8
         sy3ETJtq6Cb0yfc/jDzq7gXBuZxm183fjdA8k+u5UoSsOTIwE5eV+x7inXDfo7LITbYn
         9lOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=keVhnryVt2H0asSKa5VEmd8Dk4m45NkmEqSQuwlm0Hk=;
        b=VYpHWBGWacW/TAYysH7Zns4Jjuyea+sqJwU9yd6RVZEnBV+Ig3JxakmgsbFWsUjFiG
         suCkp5d3JLz6HJSKKk69o/XaHQMo8op/MVRIzQGHltfitgEQ/eKG+Y5hABzd9fjwhM7+
         znR0M9XL6yMUudwb+eWKBcWyCnLuyA2rak0asaSIqeQKczqrXl/XogQIbSbx1+nJsKv7
         pUATSdS30nCbVkzHYBL674mfH4tJQ6jQt3vJU9Oj5UQyX8bZmoHe1uEl3NVyB5cstu5+
         TyjhMr2OMvXr3GcUkCaR1mWnEIpi5gjgehGx3SOYY7zTFkUyLRLNsj1yK4XEFqjRNEBP
         H4CA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Ec182EYl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u17si5266921ybc.124.2021.01.14.01.59.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Jan 2021 01:59:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Ec182EYl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:37074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kzzPh-0001KN-Lf
	for alex.bennee@linaro.org; Thu, 14 Jan 2021 04:59:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzzPP-0001JJ-4Y; Thu, 14 Jan 2021 04:59:15 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:44059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kzzPN-0003s9-Ls; Thu, 14 Jan 2021 04:59:14 -0500
Received: by mail-wr1-x42c.google.com with SMTP id w5so5085194wrm.11;
 Thu, 14 Jan 2021 01:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=keVhnryVt2H0asSKa5VEmd8Dk4m45NkmEqSQuwlm0Hk=;
 b=Ec182EYlUvHqVCC5r/6klxDDKMQK9pqFzKx2WrVyXmfK3GGNqEuAlw5v4S7JM6kR4z
 s5Gc8jixFWkv4O6v+UUhUCDZO6cZ5WIrbrzs/OVmHHfU0TflQM5QT/fB6o/z1/katOrP
 LArVewL6zQTn4SSFHDSUq54iIP6ouzUu+X9CN767JyClTSlA0dlrdmnTq9EcvN03KUWq
 iqaXHQBsCP+dLxAoQiXIHWztwLZYAnD034GGAJwPDIJoRGdyelV16h1HHg1GRjDHg0dh
 5vOmMAuO8dA+Ll8wExBP9kIxnzznARxLnvsBw6m6bsyVlOSkxzBafrVhW+rOTGeqG6V0
 qsfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=keVhnryVt2H0asSKa5VEmd8Dk4m45NkmEqSQuwlm0Hk=;
 b=N8r6y2evqGH17REsEexjrwE1JUPS9+VfC7kzoBxlm5x7iR2S21mMiuUtmMY2BWi1MM
 oBPznvcWnxaiPGn/MapIc9jjvLyY8Secm6zbgG+CF5BuSgS25qZ7ArHeVlj0omV/0w3+
 03IJG41uvFODCNT83L1HVtyXN/os6sXV7AFeXPpOZYLsQT/wbKvC75AcoqOH/d5GWg7H
 J/NDoPW75p+RIxSdfahmKCM12NlGoGGt3Gfq+JJbpSTZ1TO3LRVHixMnqffcRe088dZi
 WFIHL4Pmrbl4/xCvqoyt5B/6avZ6RYoIZoNsregAOrJyzUIRDen6fPKgwiBjsPGRMB7Y
 ACFg==
X-Gm-Message-State: AOAM530jZYXmOmpqPCILpJRKoouvoVAq2k7mBWysRZhaKGl9+4hCZbuy
 qq2zwj7t6ZTQlg9Y0kIt/C8=
X-Received: by 2002:adf:ffc8:: with SMTP id x8mr7022867wrs.158.1610618347131; 
 Thu, 14 Jan 2021 01:59:07 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id 125sm7468040wmc.27.2021.01.14.01.59.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jan 2021 01:59:06 -0800 (PST)
Subject: Re: [PATCH v2 3/6] tcg/ppc: Hoist common argument loads in
 tcg_out_op()
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210113172459.2481060-1-f4bug@amsat.org>
 <20210113172459.2481060-4-f4bug@amsat.org>
 <bc9f392a-5b4d-899e-f34f-392a3c2b3379@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <fb6ba745-e291-3a12-4fe9-53df0a433fbe@amsat.org>
Date: Thu, 14 Jan 2021 10:59:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <bc9f392a-5b4d-899e-f34f-392a3c2b3379@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-riscv@nongnu.org, Stefan Weil <sw@weilnetz.de>,
 Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Miroslav Rezanina <mrezanin@redhat.com>,
 Andrzej Zaborowski <balrogg@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LAwJqyAaFTFV

On 1/14/21 1:28 AM, Richard Henderson wrote:
> 
> Let's just drop the hoisting parts and only do the signature parts for now.
> I'd rather think of a way to split up this large function than waste time
> optimizing it.

Agreed :) Thanks!
