Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp5175976njk;
        Wed, 25 Dec 2024 03:30:25 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWXGZTlWPcVsztR8xPlzZihMhDK3s1J4uLqqcVsIPuE8fzCKGZ2VARIsNQdqWJXxQHXwquEI5EOr2lS6A==@linaro.org
X-Google-Smtp-Source: AGHT+IEio1v2d1T+OaWHet//S0Sc/hmkFoSyK7s7lGYnOSs1VKD0cHmkLVR3t4/e6Vtig2Tq+vYj
X-Received: by 2002:ac8:598d:0:b0:467:5734:d094 with SMTP id d75a77b69052e-46a4b1a9675mr282496851cf.28.1735126225517;
        Wed, 25 Dec 2024 03:30:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1735126225; cv=none;
        d=google.com; s=arc-20240605;
        b=TKYkeIvBQKFnL4ogXlhY5S82K7XS0Nlf1/JPQadrER8D4T/TXDVY7mGb+Nk49sfZDq
         Bjcz7rLPEbsYJpwA21TCnGfAWk0AfvRJh7cYQSG4OTCx5C1PEuzsFedlzGaOJPWNnGW/
         u2TeP3fnJMHabkvo7D7Me6me8PX9Y0th8PeTFQL0Zc5G2RbRgWNz7l2cwQZCXVydPN31
         0BkgXArcQWW60CEPawQcKLdDLwu/V8Ic7mFxeKgdhAsMEnqNTq4Gia7gCPE/JgH64K22
         ZrV/bDFke7KYTngcDZOhUmb9adUEYrcuVVDTejOvt1P2gEbq7tmTcBnUY19jcQmlum5t
         p18w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=NxkE2UA0S3kcUAW1+kUEvg3K6wLT3eoLpL9D8Ygd1iY=;
        fh=0rryuJF9YCVrwVQ7UNsP5qkY9CA5GsLNALXipYjEKBg=;
        b=OvaZ1jEz+8tQsSIRhKtO6hm3LFPbBUY+NncnrHXsVtkTCnZmF2vTkcnRlJYNbw9SN7
         TwnrMr+H8aR83J1M489IGvFdistRyL40Lw8nzwgYgcX8SQqqW817eo7l0wgAeeN0Umjf
         5JfaINCbOfumI+SzOP6NuP3/1vrJDw4BaQMRSgzY1S9+FQMN4gv3dAWfW/265zwK8dE6
         Sh3G+aTKNBbPL6DEvbkcboZ8CDSSI9TLznNaVL/L8iYtG7URc6w4o8zj0BmsdmDXL+S/
         i5FKOJqh1lKzaVwWiEWTfEHMCasFgTf/MMr6WB3a+X+ykJGVUW/JmSpWaTz0yEkKbOrm
         XADA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WhD3UGZ0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46a3ebf989dsi170597001cf.638.2024.12.25.03.30.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Dec 2024 03:30:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WhD3UGZ0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tQPaI-0006OC-L8; Wed, 25 Dec 2024 06:29:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tQPaG-0006Ns-GE
 for qemu-arm@nongnu.org; Wed, 25 Dec 2024 06:29:48 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tQPaD-0008HJ-PS
 for qemu-arm@nongnu.org; Wed, 25 Dec 2024 06:29:48 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43618283dedso56989545e9.3
 for <qemu-arm@nongnu.org>; Wed, 25 Dec 2024 03:29:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735126184; x=1735730984; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NxkE2UA0S3kcUAW1+kUEvg3K6wLT3eoLpL9D8Ygd1iY=;
 b=WhD3UGZ0XRNtaOJhP7XGeqJtcqn4OyRAI7shsn4NdwjnSwektbHr5c2I64GVDLU3FT
 zU6MI0A6FiFKFsm+uIQT4Tc8QAPMWr3nJQJEblcBYm8rtuDfQO0GN50pcv3t8HyOi+rH
 iGyKQSU0XVcO9ABYVfGVOs1NKhx3+3loyAYft5zsllYEiuE9/TPpAScKNuiS1c2UrNye
 EUFdTKhXCrkEAYJJKZMjpMDXcv1VCCVCukGxywrQZeWA1H2oZIkjrZ/IeoGKWmnKP622
 qRk4jidAdDe2Rznr/13v+rbp8SkKj3M2vjAP7vT6YW/1e3r8b17WIjnvvYeme4mFF90l
 kpsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735126184; x=1735730984;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NxkE2UA0S3kcUAW1+kUEvg3K6wLT3eoLpL9D8Ygd1iY=;
 b=C7ZkatNkQhEpHxVGMNAD9xEdYWESOG6gt6rlN+eiHGP12IdPG3S3Vq34c1MDs6DPSu
 JBY3DYFzlB4NOsAqPcaxycW18fW2J3qaPdMiYJRv1lFTMbgsh4Nh4zUbvLQv2p154zXU
 e8GunPz4xJalExnomokeSZzsy3Ek9c1pOyS9lAEF9fW/4SUoU3tebdmZc0ccHe9UgXCg
 u7IgtJguRM+y0HCUjlkF/3AgFAmt6EgsRG34BxouNVgbZ2d3DsIAgcc0pIC82fMkR1jH
 aeff3uHqLg731CGUVP+ym+hJB/Iz6a+oIktzU3akPI+ujh72n5usslcHAEormxKfhlJx
 6sfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrHZC3n05f+Gnqat+YWJZ2S3yu7xjwRNe8dBNh6yjGbvYS+3xHbaLTg4SZdQKfYafNB43MpJJNug==@nongnu.org
X-Gm-Message-State: AOJu0YzL75Qs68laUpdoERtw3JAjW/vm/HuLrEkBECo+aT+hW8sD0kgD
 FVqnGMuEWFpaQcGSli2Tb7RUnyawpkUBTMZEz/5dj0nnYbkcxQi/5wVcSIZbDsk=
X-Gm-Gg: ASbGncvIgqIwT+65BPCnE2jZsuvLwmsEwFA0JKufCZwXlzuuFAgqYSNRF56RAhHmB2u
 MREMFCK8050lEkOXqcbU7Wb6tbu0NOj952cq/SinBO4kKAkcwH5H5eypwuCLaMwa12HZoRIpqBh
 EqnBA6J0k6gk+zPSDRi6igDokC1gGjqDoJGlOSjSZgm5FcwVUsUqIg8RIYYE7lEbKFDSg+b+Vou
 hT1ZsqEJYDXwUMWjAXMKn518GEfu9cnYTLuvqzngu5XLXVV3gvAZfdxcuIQqsGefsA=
X-Received: by 2002:a5d:59af:0:b0:382:4ab4:b428 with SMTP id
 ffacd0b85a97d-38a221ed38cmr16263834f8f.8.1735126184046; 
 Wed, 25 Dec 2024 03:29:44 -0800 (PST)
Received: from [192.168.1.117] ([78.196.4.158])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c8474b6sm16735133f8f.51.2024.12.25.03.29.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Dec 2024 03:29:43 -0800 (PST)
Message-ID: <3a4545ab-d9e7-47d2-b89a-5dd1263de91e@linaro.org>
Date: Wed, 25 Dec 2024 12:29:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] aspeed: Introduce ast2700-fc machine
To: Steven Lee <steven_lee@aspeedtech.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>,
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: troy_lee@aspeedtech.com, yunlin.tang@aspeedtech.com
References: <20241225020311.3718080-1-steven_lee@aspeedtech.com>
 <20241225020311.3718080-5-steven_lee@aspeedtech.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241225020311.3718080-5-steven_lee@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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
X-TUID: h9g+KrS3+OJ6

Hi Steven,

On 25/12/24 03:03, Steven Lee via wrote:
> This patch introduces a new machine, ast2700-fc, which supports all cores
> available in the AST27x0 SoC. In this machine
> - The first 4 cores are Cortex-A35 cores.
> - CPU 4 is designated as the SSP core.
> - CPU 5 is designated as the TSP core.
> 
> Test Step:
>      wget https://github.com/stevenlee7189/zephyr/releases/download/1.0.0/ast2700-ssp.elf
>      wget https://github.com/stevenlee7189/zephyr/releases/download/1.0.0/ast2700-tsp.elf
>      wget https://github.com/stevenlee7189/zephyr/releases/download/1.0.0/bl31.bin
>      wget https://github.com/stevenlee7189/zephyr/releases/download/1.0.0/tee-raw.bin
>      wget https://github.com/stevenlee7189/zephyr/releases/download/1.0.0/u-boot-nodtb.bin
>      wget https://github.com/stevenlee7189/zephyr/releases/download/1.0.0/u-boot.dtb
>      wget https://github.com/stevenlee7189/zephyr/releases/download/1.0.0/image-bmc.tar.zst
>      tar --zstd -xvf image-bmc.tar.zst
> 
>      qemu-system-aarch64 -machine ast2700fc \
>        -device loader,force-raw=on,addr=0x400000000,file=u-boot-nodtb.bin \
>        -device loader,force-raw=on,addr=$((0x400000000 + 748896)),file=u-boot.dtb\
>        -device loader,force-raw=on,addr=0x430000000,file=bl31.bin\
>        -device loader,force-raw=on,addr=0x430080000,file=tee-raw.bin\
>        -device loader,file=ast2700-ssp.elf,cpu-num=4 \
>        -device loader,file=ast2700-tsp.elf,cpu-num=5 \
>        -device loader,cpu-num=0,addr=0x430000000 \
>        -device loader,cpu-num=1,addr=0x430000000 \
>        -device loader,cpu-num=2,addr=0x430000000 \
>        -device loader,cpu-num=3,addr=0x430000000 \
>        -m 1G \
>        -drive file=image-bmc,if=mtd,format=raw \
>        -serial pty -serial pty -serial pty \
>        -S -nographic
>      char device redirected to /dev/pts/51 (label serial0)
>      char device redirected to /dev/pts/52 (label serial1)
>      char device redirected to /dev/pts/53 (label serial2)
> 
>      tio /dev/pts/51
>      tio /dev/pts/52
>      tio /dev/pts/53
>      (qemu) c

Could we have a functional test included in this series please?

> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> ---
>   hw/arm/aspeed_ast27x0-fc.c  | 211 ++++++++++++++++++++++++++++++++++++
>   hw/arm/meson.build          |   4 +-
>   include/hw/arm/aspeed_soc.h |  12 ++
>   3 files changed, 226 insertions(+), 1 deletion(-)
>   create mode 100644 hw/arm/aspeed_ast27x0-fc.c

