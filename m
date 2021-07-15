Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp1208311lfc;
        Wed, 14 Jul 2021 18:34:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJybqvpzlJVJKSMtEaewWFZNqpckbSnk5wxCoyp2jMCjh7S45p4tC2TQ3X9/Oi7IEysFyeYC
X-Received: by 2002:a67:1a45:: with SMTP id a66mr1820047vsa.15.1626312891192;
        Wed, 14 Jul 2021 18:34:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626312891; cv=none;
        d=google.com; s=arc-20160816;
        b=upj9vrdmXERCt8xXX2nfS+bbsXB6fRoA/49YxLBeJgWGjCdnms2tOoPvkBGs97lQYw
         BLhMau/pe4ln0OAxs8P1Rr3p6QgrTx/bYiPxHden9lgB/vhnOKZb9kammdb59e1+svL7
         6TifsUR7HsMnbBDh0yg7yTGJRSOkxm+MEux0iZf7577X/uQZsd1xInxnIKoEAwuXl5AP
         BFxHqcB8rqKsnrYtn3VIOAKoB1K5dkn5kWOfNZR/ZF5ZXVpNBBJwetV722vmbvY3gXzN
         TkdaxJr8Y07WegdZ+ljLpb5OI4geW/RxFo12re8b71ryidJWHfZHgkgrNCKtQ4q8qw9r
         l3nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=ut1jTfE4OFqm/Gf5IKrUbK6hewQf/kqpytKlUm1g2j8=;
        b=Rq3h362uaDc7nAoXsJqDhjcVGuKrDcKDJFjPdAntV9dHqpk4QVtW9ggLu8akeojgaX
         G/v9x4x5wCACQJ3ovqtfH703Rzm8q+4x0fFfqSynawUJIqDnAd5WEkwV0w8cuCC15f84
         VxzXr50Xq3t961NhHfwxgA4yC9j19QgPBhyjx4UQVjxr8qGIfosWGYU/icdPS/VoX1c+
         jA6Wrm/XQpuI5k3zCAxMDoU8dGAlBPAsVhJszlfF+MkRBozCI43Q1bjCwEeCm5Qe3H0P
         5i3tyKvdpS8CeR2il4HTsEMC37B1D5andNdzmc838DBymuH/WTBqC1JYuYjSX09XlBnM
         SRSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JIOYnFn9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u17si4587082uad.117.2021.07.14.18.34.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 Jul 2021 18:34:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JIOYnFn9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m3qH4-0000Ll-GM
	for alex.bennee@linaro.org; Wed, 14 Jul 2021 21:34:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m3qGw-0000LR-0P
 for qemu-arm@nongnu.org; Wed, 14 Jul 2021 21:34:42 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:35804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m3qGu-00011x-GQ
 for qemu-arm@nongnu.org; Wed, 14 Jul 2021 21:34:41 -0400
Received: by mail-pg1-x52a.google.com with SMTP id 70so1016695pgh.2
 for <qemu-arm@nongnu.org>; Wed, 14 Jul 2021 18:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=ut1jTfE4OFqm/Gf5IKrUbK6hewQf/kqpytKlUm1g2j8=;
 b=JIOYnFn9Yc6Y31f8nCIibRBER/geBG5vGC9CGZ693DHvUZe4WAI29+xyM/MoBoNwHa
 VVpUhz132sB93X/v8U0o2lKC+1BoE/+0BuHLIyBisLq6Fa6JshS640EkqY1nJ3TY+0JX
 4afIV89PASA1obYxzeRfIN+Jg2pJ+CYX8LQ6wee0iPDURc1KQoNT+VWA32np8UlrrlXw
 mNCFCyxzHvCSL+hQlDBeZ94eXR9uXFxI8/610uHPrgAL3/aJxgPKuwGULUD/CFA3kL2+
 +dGn+1pjhsMlm0icljqvj6x5tKtGhZt/Snp1nHhv/8sC8IGs3MP/WE4lnOVLKjV53IGC
 Nx6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ut1jTfE4OFqm/Gf5IKrUbK6hewQf/kqpytKlUm1g2j8=;
 b=qdHMOCkazinOk6pmDx/UdqNAeb+qMDLixa5+nqFCK5HumQgTpIyJht86IZ1c8ozURI
 x30sCsxKdvHNuE+0IiUM+0WGLVynK9vmuU1OEAJBmQ0P/Mo6ZCBeq+x/4JmDh43YAbx5
 Wh3tMR/AUrGAW3JfmzlXO/SUqNpF6kEeX2WHns6wZnVSLzplrEVpMe0o4Kz3u5TlxkyY
 weCLglnWALSux8M9pZFJugc+TC54agpf3G7AG+dDLg8jqJ5plAwnQDHJGNDR+D6MgkLJ
 fVp7PGLtqolt6LNLmZMEDmglSwaNZwQVfhUYaopyiL5yNveykzNohoDQpXHrSPpeanQU
 g3NA==
X-Gm-Message-State: AOAM532jnZQjKvr0Cjnsfixc3uMXRBxuv1wQoGOZ6LA2fLJuLDgwI8xx
 yBiQE+u7eWCKgZ1/pZX1gWDQIw==
X-Received: by 2002:a63:1960:: with SMTP id 32mr1149745pgz.86.1626312878832;
 Wed, 14 Jul 2021 18:34:38 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id b17sm2147164pfm.54.2021.07.14.18.34.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jul 2021 18:34:38 -0700 (PDT)
Subject: Re: [PATCH for-6.2 02/34] target/arm: Print MVE VPR in CPU dumps
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210713133726.26842-1-peter.maydell@linaro.org>
 <20210713133726.26842-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <17e60d79-773e-0c46-5069-165fff17a15c@linaro.org>
Date: Wed, 14 Jul 2021 18:34:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713133726.26842-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: v0xtgtS7VQcK

On 7/13/21 6:36 AM, Peter Maydell wrote:
> Include the MVE VPR register value in the CPU dumps produced by
> arm_cpu_dump_state() if we are printing FPU information. This
> makes it easier to interpret debug logs when predication is
> active.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/cpu.c | 3 +++
>   1 file changed, 3 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
