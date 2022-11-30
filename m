Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp1091286ejx;
        Wed, 30 Nov 2022 02:29:14 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5ppZkvpDV140h344NLwZ0XDEfvfRevyfUJoLfW2Pu28x1rDllAb7flAutoDFDTs7mer8e7
X-Received: by 2002:a37:9a0e:0:b0:6fa:b56e:38b2 with SMTP id c14-20020a379a0e000000b006fab56e38b2mr55108760qke.521.1669804153854;
        Wed, 30 Nov 2022 02:29:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1669804153; cv=none;
        d=google.com; s=arc-20160816;
        b=kqqila3RG0FNwHTLoeNceZiE3RtnA39xo++9Q1zaL6PmwJG3D8JKR7mSSegHf2zK20
         NxGlwjMW3aYM/gwzm48aLL9r1YwUqNOKjcXoe1oHe2QtCQdTZzMsCt9Nqxg7lhDZP6mL
         +WYx9uYdOhx3mTFwF23a5x/J8BIzElo22BTFNTP/jojfvc8fkuTfrhhi54+HNQ8svAsH
         MuNGj6YHYNScpjHeaQ/kRU6z8ZPSRAWPXzhHRHKMmyFzzbIGINv/EtGxhnOL/dr+fv8o
         DlowYemU0MepIAf42Jr9IfCXAhbrG57CzyQHu6zvKm/2y1I3c69vWHs7TOWrmiHEAK6b
         JvhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=Tjn06gbRE4bodmjVg/GqCX0F7nG4EmA0qrgfMk8fzGs=;
        b=Wwu5ihk9Uv1hskkMv5uVlADrtVS9hZEQz8uBwv3YfmQ3O4V/u4z9fpAhT96aQFRdp7
         PQkDe1gE/iuwNpnpYJQQDTBJZZEdbMUdsmONnzG5F/vUkxgFo2g34xzV2ttdwai4MIJD
         MIlM4ULUgBXJgjGBRg8EIWiNhbfA3NErB0vgRnBtPX2U5i4Sh0IeIu8NtDGSBpKMEo2I
         8KMw0PkecWVJ2aXw25PS0iuEeYyFHJpx0fsJqM/Q54S4bUPXm2juYXfU2ZWZhC2+aumj
         Q9cvK8c4yiYkrrNC0qC8x49vr834+4FC/1mKyKG7/JvktL611gzSY4SqPH66WX4mSLDW
         s4Jg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BEelCUCS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x24-20020a05620a0b5800b006fb8db8f20esi547311qkg.144.2022.11.30.02.29.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Nov 2022 02:29:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BEelCUCS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0KKT-0007yD-C5; Wed, 30 Nov 2022 05:28:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0KKS-0007xu-9m
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 05:28:36 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0KKQ-0002MX-OK
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 05:28:35 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 i81-20020a1c3b54000000b003d070274a61so592262wma.3
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 02:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Tjn06gbRE4bodmjVg/GqCX0F7nG4EmA0qrgfMk8fzGs=;
 b=BEelCUCSUEo18MhrRPHm0a2XfGIuhHU5ZdfJwojdQRu0/KZ8j3B6XOgOpz8EURRuIU
 ZXMr7JVd8ifecJNuVhmjrf7tHU7YEU1oNgRVKY2hWpVTdU/j2aXz1w2N3XTp2+rwXVaR
 psdxHdeVUJFzYQvGhmqbfYCWwO++WxiI9XEfrcoSsjWkuiLhsePgmTzb+dpVJgcJaEdd
 KGhugcob7EII03vfhG2PjtDbGC06xUPQOIz4Gjt5XOm+b1mnGOLCtDgKSabUCCwQpJ3H
 kIhMTzB50ZE1NSGN3LuCXzYp5vcSstyreblvnftw8tvPco6mF4Eg/FDNjNswbrZfUP0+
 /FCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Tjn06gbRE4bodmjVg/GqCX0F7nG4EmA0qrgfMk8fzGs=;
 b=mbecgWw5PC5jSUY3y7f0Sd1kZfGyH3IofiQnhILvzUfWWdqqF34C+fiSDQtnEc9v0A
 /cXA5MJCtHMV1sqyla3ofV/HGIe4Dw7qE6iPkOh1g+8KdQNlEQ+t6W93w7js03fwbEBD
 Z2mkROKYyrz1P9fvK/hlIhX9l1GxLuezF7svmiOXz0ATxnZoOBGFcxotM5Y4zKrHrKOL
 JqKG3E/8qNHK8dwPF9z/tXYL9Kz5DOxLTcp2mHl7xud0qxA/BOe2dhOcEMAWFeB6Mwxz
 e5XDbK3FctyqWP6UEezXc/h7k9DSyC3otvsAfz7h8vwUGXuM3IhH+qAtHRnDRCdqzWvd
 dRkQ==
X-Gm-Message-State: ANoB5plFF8b50x987NpRpJMrt1AcidMdov2bh7SZp8vq5rEP9kOW8WN1
 0vHO/BrfRSUbWyr2uEWq8Q1Q5A==
X-Received: by 2002:a7b:ce09:0:b0:3d0:6b76:4e67 with SMTP id
 m9-20020a7bce09000000b003d06b764e67mr4008514wmc.147.1669804113116; 
 Wed, 30 Nov 2022 02:28:33 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 bk4-20020a0560001d8400b00241da0e018dsm1145890wrb.29.2022.11.30.02.28.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 02:28:32 -0800 (PST)
Message-ID: <3b67faaf-bab1-31f1-4dd5-5b9d87feddb5@linaro.org>
Date: Wed, 30 Nov 2022 11:28:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH for-8.0 2/9] hw/arm: Convert TYPE_ARM_SMMUV3 to 3-phase
 reset
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20221109161444.3397405-1-peter.maydell@linaro.org>
 <20221109161444.3397405-3-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221109161444.3397405-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.258,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: i5G237W3m/Zq

On 9/11/22 17:14, Peter Maydell wrote:
> Convert the TYPE_ARM_SMMUV3 device to 3-phase reset.  The legacy
> reset method doesn't do anything that's invalid in the hold phase, so
> the conversion only requires changing it to a hold phase method, and
> using the 3-phase versions of the "save the parent reset method and
> chain to it" code.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   include/hw/arm/smmuv3.h |  2 +-
>   hw/arm/smmuv3.c         | 12 ++++++++----
>   2 files changed, 9 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

