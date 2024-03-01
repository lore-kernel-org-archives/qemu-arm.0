Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp1261727eja;
        Fri, 1 Mar 2024 11:04:24 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX8gg+7uKxAo7RhGTjCZdJoQCz/Q86XBZQzc41+WFyFsJzLZBDMsBk/kGyKK7XrOBi185DIfJgEERCHFGMbF32IQgJhA8ys
X-Google-Smtp-Source: AGHT+IHIJ6EjKTLH2lQvyHm+7SSivUSoVUKPA6YEY8VnCaD7gECRJHY5ARLQlqpyleFOYhatCgdZ
X-Received: by 2002:ac8:7fcb:0:b0:42e:bd07:514c with SMTP id b11-20020ac87fcb000000b0042ebd07514cmr2579373qtk.12.1709319863886;
        Fri, 01 Mar 2024 11:04:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709319863; cv=none;
        d=google.com; s=arc-20160816;
        b=J/9mQMmzB00LWe7CjWPKGpKnytWxNSi/unf0FDqRqxYFKu/Dr7XvntSt2JgYFrilcW
         rdO572/AqbwZDS0J13vHPTM6tl4aZwQvXoj2oY5sQ8NJdjJHNitZ3EJxAjLiaPZbecyJ
         EuGH92kHcIEv6Fnhz+FU52otmpc1o/m7TLNJ4m4t2QTisoaL78Lv8hYsNvDp82EVOdBB
         jRlxbZGymHlGF4g78/d8xsSXUCCiRMj965FPj+wtK2WW7qA/scAD292TgxGmDDeSTRhG
         sgA9ufGveGrdBN7crunL7e8JADOec4QOcZbZ9jOHq+gwiscFvuqhgYxydOL46FE/WLn0
         GTWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=M0Nau/AEooc9rNVy96Utg8TkIyXzpzRRRzAVdfocc8o=;
        fh=1H23EXrOQ+QH9IGryYww94/KkiCzhc/XvJOSPwStr1s=;
        b=UHQKQOdFFBcg6B1laaoM54ckau0f8VL6DaM8UevQUau9+63i8pgn/UrvdqQkXV8tIV
         EUGMx9ppuDUOw8U1fiKmWf3Sv/MJ1A02yTDze7cQZUK68dY5tEQi86BM2020fTaaLC5X
         FEBgyXWdb3AQIKsgVyngHlW3ujF28Hh5kWIoX6WAVTnbJfMf/cdN2vbI/DxJltuFSkfk
         TVM8s3JFzGcLzePQ//ULHnLhfQq6opvtiXwbFMZPHRot6s9UBSyCUR9WJj5vizOaj9lX
         xTcTRELyWawpX6Uf4HdAq13hiDMvn01VDyVb6fFuEhZm4t6p60uPeFiuPV+76c7VMkrv
         xZ0w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RAY8zfzE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v1-20020a05622a144100b0042df0409734si4382294qtx.787.2024.03.01.11.04.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Mar 2024 11:04:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RAY8zfzE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rg8Al-0003Rh-0U; Fri, 01 Mar 2024 14:03:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rg8Aj-0003RP-TG
 for qemu-arm@nongnu.org; Fri, 01 Mar 2024 14:03:53 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rg8Ai-00050g-9l
 for qemu-arm@nongnu.org; Fri, 01 Mar 2024 14:03:53 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-412cb6148dfso3806185e9.1
 for <qemu-arm@nongnu.org>; Fri, 01 Mar 2024 11:03:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709319830; x=1709924630; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=M0Nau/AEooc9rNVy96Utg8TkIyXzpzRRRzAVdfocc8o=;
 b=RAY8zfzEJkGI7u0xQpyPHvEpDAgKEBC/9EiIN5vhs79Pnid7B6w+t6bqjXX6Yi3BbP
 /BTw9qg0sDQtGuDLSh1mM4andjlgpCgJusiBFnR9ymPgzAFxNoHe62hmJDqkRNxKH+F6
 AhGML//CHeLi/cIT4Ijn7JOa6PP09os+TR6MQKY79jo6RNxa6nQmXfZCraKgLvtDk9TB
 MAWn7ZjvJM5U36q27+Bag0Vt/kjKJqbn2CR3FqMYJcVIh8B46ECKh8BOdJuuwJmNiuaF
 tXQXY29u0UkKKtQ6T/Kpixd3vp9Yv2K4/b1pxKHUYd4eYt/LUk4FWtSV7vQrF6CgYDwn
 Ig5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709319830; x=1709924630;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=M0Nau/AEooc9rNVy96Utg8TkIyXzpzRRRzAVdfocc8o=;
 b=txUNFwa1zOl5a1buZyWR3hr/6C1Tigm8+bZSgADJAO1Lg9jRkChWUosRQqHQgIWCjT
 Rt9DToSZprzBPHRKc5qELgbbmIgTyqRFq3pP7H6Fk0tMPY5/bKwOvfS0Jx1+st8mjQ6F
 qd7w8ZAsTw81q8ZqNU9ixeQ0XDNHMuY5HfYddELLARbE7FOzTUCmuzpJtVUj61f/Dop2
 YTn9qTsHi7T3yiLh0BzkG5H3ftjaP5o78xmYv+6qEJKsxpI5EX4NSC3YESv9MOPWrUvd
 izHVCs0ciAqoTzoZIjsKHzBYgyTMjCSu4C/4wwMuH1wvzmaaS5Hj2Nznh58TpxvRVUjj
 PIQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdHfbDiqBo96aBn96tki5BfuGcz0k+nSDfd4G4ezAl3bHGEUGQ2dKgLeno8sUrurrSRGbc8v5YMwbSJ+p3gpMhR3ey
X-Gm-Message-State: AOJu0YwRSEubfKYGp4wh1X+OtraHMJRnW/2yrP1AYCkFmdB53s6ukok/
 XwMBmBtGkH2kTk0DeL9ZnBzSZNlXAW5MUDL2fZCn/REN5IRdj457VobZgrT0wnA=
X-Received: by 2002:a05:600c:3b12:b0:412:a266:f5e2 with SMTP id
 m18-20020a05600c3b1200b00412a266f5e2mr1800674wms.27.1709319830442; 
 Fri, 01 Mar 2024 11:03:50 -0800 (PST)
Received: from [192.168.69.100] ([176.187.210.84])
 by smtp.gmail.com with ESMTPSA id
 s16-20020a05600c45d000b00412b67388f0sm8572229wmo.6.2024.03.01.11.03.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Mar 2024 11:03:49 -0800 (PST)
Message-ID: <01425b01-0975-4805-b302-af774abb795a@linaro.org>
Date: Fri, 1 Mar 2024 20:03:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] target/arm: Move some register related defines to
 internals.h
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20240301183219.2424889-1-peter.maydell@linaro.org>
 <20240301183219.2424889-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240301183219.2424889-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: 7fTWePiH8biV

On 1/3/24 19:32, Peter Maydell wrote:
> cpu.h has a lot of #defines relating to CPU register fields.
> Most of these aren't actually used outside target/arm code,
> so there's no point in cluttering up the cpu.h file with them.
> Move some easy ones to internals.h.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I want to add some more CNTHCTL_* values, and don't really
> want to put more into cpu.h. There's obviously more that could
> be moved here, but I don't want to get into doing too much
> all at once. I pondered having a different file for these,
> but probably we'd end up pulling it in everywhere we do
> internals.h.

Yeah, have been there before :/

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> ---
>   target/arm/cpu.h       | 128 -----------------------------------------
>   target/arm/internals.h | 128 +++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 128 insertions(+), 128 deletions(-)

