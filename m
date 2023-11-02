Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp154077eja;
        Wed, 1 Nov 2023 22:09:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG75ccFAeM6AKDskyPdI5Q+WySszT91QzB44C/p0YQsT8OPJ98nSfQf2i+R0u22d3a1XaGN
X-Received: by 2002:a05:620a:2809:b0:77a:4462:1037 with SMTP id f9-20020a05620a280900b0077a44621037mr6565439qkp.66.1698901786430;
        Wed, 01 Nov 2023 22:09:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698901786; cv=none;
        d=google.com; s=arc-20160816;
        b=Q+sLRofXkLziuNc3kc+zj+DN7DXUrQEDxxh1jSQn7BVk26qXF3r3PiSTRSniK3i5U5
         cSrjjSLut3wQcs22YegMekYEGCHOKlrJmjbDXyxbV35DGow6hErkWzZHhS6sA8PRG50b
         0QJKluaX2RchqhIaUpStLaIfu6jxnqKAvQvldnotWC4f3wqOPqx2Eh7Cp2WW7NldThXy
         mdXKIW4j0titD/WZ8oxmC7SK1UY006LdX+7lojXilizYIJ8mHyR5gBGM2IzLyXdrK+kx
         UP7Pselwb+7pqmHZvJJ1s2TfDePUR5s/9Pi0PIC5f/MRmXFgZ5eVq6dIZIQ0vUI0BwzJ
         Oz7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=HSSeau0x6Coyf9Le3tpcKWKpnNQEJJX8p5sONzhaqi0=;
        fh=q0jjEPenKFQ50+P8aorIeVEkTtjnNK+o3ieha+1Al3g=;
        b=K2VRq0zitpQqlojbZumovwP743cGbUBH3YP7kk2CrxSBZ1aHZZE+ErHsgNkPjP/ODy
         Io2HP4o7kjNSoJC5xEzCREvgLqDvLVAVKHno1jKhU6APNFadI1/UfTTbEI5R7gNW/AZz
         OEiNRkTx0TNOdiwkKkxQUUjk4BE/n20FwxusAzSSZdMBsiJwVS9/H8KkI/dIpi+GTBTn
         8MH5GsDmgI4eLSIf+yL/9RhbguJ9sYieV1UCJnesEtlgSf4ojcVqGcwaR8dEFYzf1z7C
         BErMk9/vyXrkQAirC2JljxWKGSJCYWI1xXMX404nEgWa59oqaartNkx52MAYKnmLNBd0
         aJRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CrQadiQZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 27-20020a05620a049b00b00778b0f5d4c0si3582405qkr.566.2023.11.01.22.09.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Nov 2023 22:09:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CrQadiQZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qyPxO-0005eB-5v; Thu, 02 Nov 2023 01:09:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qyPxI-0005dn-RU
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 01:09:21 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qyPx4-0006DC-Sa
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 01:09:19 -0400
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-5b92b852442so397025a12.2
 for <qemu-arm@nongnu.org>; Wed, 01 Nov 2023 22:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698901745; x=1699506545; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HSSeau0x6Coyf9Le3tpcKWKpnNQEJJX8p5sONzhaqi0=;
 b=CrQadiQZOs0zvcLsoLTzMaw1smaXgQ4RtGY7P/w7UKQPygKrv60VR4ZJu/IK+dBBon
 ELF0fXq29lrsillYSv/nK4QPN3GRmC6Da4s/+sQibTQBmnuplUaujzQe3IHbaSi6M+3N
 q0ALBbwKxYP6o23vYEl7u3qdHLwt1YguMay+M4tC1VBJVuOf71LYvEal/IbM91RVTpAS
 KO5b5LEH86IVggq9ZpYF6k1Z4AaF6pWYP+mIYMhYSnzve4UsyL6rVnMW+XNSeOt7fcNw
 YRnvc7DJTPXeEGGruBDDL5q5X8sOZURS5K3wQJ+Nj+AgEeX3oRECL3MvcL1+xyPJOVy7
 B3lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698901745; x=1699506545;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HSSeau0x6Coyf9Le3tpcKWKpnNQEJJX8p5sONzhaqi0=;
 b=aSZ3cisAGIFC3Kinf6gLpbicI6jXJFtGyBLjNC/Fvow7226/U5PmFVYxjObXfPz/4c
 ec+4f2zx4diT9CVrvQju+vQb2R3IS7We7LqPPaohyOpC9NcElbCx1Fds6MLBSnlPx8pp
 jhZB6tECBQCwSDOlT7Kd2pl0Tw4sF1g6kogO5Rp1635IYlMd8UKnBzn+2+dUosPucVuN
 Hx+/hfUDW7DUfKkWSdFJG7AqeWK06hw90okh0hr1jam+UzKPDfKLe9cEYmeA9rIntL4L
 g++bvcxHMFFas2aslfa2p0WbeYEn9C48NZ+Cus875GvJXbXtj8bybgG+N+OOMrKMYEgw
 Zzcg==
X-Gm-Message-State: AOJu0YzyXfYXmy3sEAmnIyxVhU78Jf/V9/LtfhGZL6A78SKBbWytl8Bv
 arOkVIJL9U5yy/O6jVdFi0vBPQ==
X-Received: by 2002:a05:6a20:428a:b0:16b:cc6c:d728 with SMTP id
 o10-20020a056a20428a00b0016bcc6cd728mr18721044pzj.44.1698901745289; 
 Wed, 01 Nov 2023 22:09:05 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.149.95])
 by smtp.gmail.com with ESMTPSA id
 iz11-20020a170902ef8b00b001bbfa86ca3bsm2112487plb.78.2023.11.01.22.09.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Nov 2023 22:09:04 -0700 (PDT)
Message-ID: <324841b8-a1b8-4130-a0e3-4ce0abb35ce7@linaro.org>
Date: Wed, 1 Nov 2023 22:09:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 29/33] hw/arm/virt: Check CPU type in
 machine_run_board_init()
Content-Language: en-US
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org
References: <20231102002500.1750692-1-gshan@redhat.com>
 <20231102002500.1750692-30-gshan@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231102002500.1750692-30-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 9lUWH6iaS3LT

On 11/1/23 17:24, Gavin Shan wrote:
> Set mc->valid_cpu_types so that the user specified CPU type can be
> validated in machine_run_board_init(). We needn't to do the check
> by ourselves.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/arm/virt.c | 21 +++------------------
>   1 file changed, 3 insertions(+), 18 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
