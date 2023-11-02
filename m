Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp156174eja;
        Wed, 1 Nov 2023 22:16:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGa/jTS2Wil2wv8+UtFi4uMlmDRVgsodBN7MV4ABTmhSUnpChF3WyEBqiOzmmBFj0TPfjid
X-Received: by 2002:a05:620a:4084:b0:775:8fab:8c6f with SMTP id f4-20020a05620a408400b007758fab8c6fmr6812787qko.29.1698902185170;
        Wed, 01 Nov 2023 22:16:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698902185; cv=none;
        d=google.com; s=arc-20160816;
        b=NpcfFKcIjFksnIblC1cqd81nvJBBNXOWa6WK8JaN5vRbtW9AGKSGCM1o6UlAbsNyOe
         N9Ck/Xeiql7qNKSiEtFilRuJcJBXqScknwaLxUAawb9fVKxIzh6+9axqEIB5ZZlz/kyR
         p82Av8Zcu7gYqFnEygDgb7VUvref/22UnrGJHtWCtqKdBQmMzFsP5XNYEtbH2Oamdn3g
         L/fjN70i4Gwj3STHzPb+wlr5CP5eulxXEoCOuKSR/RXnHh0seDgvYw6jcW7/XOzI4R2p
         0uh7dDsShgZslSbE22t9qiL2fgJf8KSDij4NedFcRi0+CsG2R1ZBYF+qWBxhZV64d1mO
         KOCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=KSs7wB9zucMgPimtZgaZxTvpHjGFkYI/Q2u58f1JcSA=;
        fh=q0jjEPenKFQ50+P8aorIeVEkTtjnNK+o3ieha+1Al3g=;
        b=BkVV+LhBfAGzIidJQHenH/3YzYNwNiHo/hTBYQUsj3EPU+n4w3IEunVMi47/pb9/fo
         q6bQIZy/c1pUsPYeWqefMn0sAu00VOJLwNeDa43/jkZimC7LmUMGHJ3D6O/t8cgylgiV
         kWPBu/giQLMi4M+XCi3u+dEN5GdtTIr/V7vaBOwKV0Q0vD3h8MHRNLbph0dFhKF/ou8R
         jRHX52nsqYeSXwOHIvhebq2UHAqWxnEG7FMwWLKC4jjm8y/ahVRTuiELP4Ha2s4ca4Lz
         mDnthSVqu89ZujOowlGo79AZC0TaZclKbVpdP8iz+4qlePTx/DnmtDafDu2xcV6aUFiJ
         lblw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A6ffur96;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i21-20020a05620a405500b0077703bd9771si4000302qko.364.2023.11.01.22.16.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Nov 2023 22:16:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A6ffur96;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qyQ3s-0007LD-P8; Thu, 02 Nov 2023 01:16:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qyQ3m-0007Hc-P9
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 01:16:04 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qyQ3g-0001pI-V4
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 01:16:00 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1cc131e52f1so13876715ad.0
 for <qemu-arm@nongnu.org>; Wed, 01 Nov 2023 22:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698902155; x=1699506955; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KSs7wB9zucMgPimtZgaZxTvpHjGFkYI/Q2u58f1JcSA=;
 b=A6ffur96RRFMkb+U/J4AH1iicfaHoG0ipmiZweC277fY7IFsHYVpGmpyRQGhK1UXe9
 FTIxia4Rg/kmdO9fibaXJ0/SKq5dlPSwGZN2qkjnVvrJHpCvImlik2KV1cXz5cOJ4fas
 EV/Nq1CzjQheL6jfGNaCudWoXyyjHETYeIzyRvYfepXRBz77xonrkW+gGTxN4qMdPE3n
 Sp6cZN10im/lo1RlskX0RLKHdoCB21oAil9ozTZq7s4G2HHaGJr40gcL0caj7K/puJqd
 9rpvvO01lE3T6SIMpeidkbCXg7JI3MSIBJ/oQDqpnJ5vfVNNZm5i5HtfcaDTY23azEF1
 qH5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698902155; x=1699506955;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KSs7wB9zucMgPimtZgaZxTvpHjGFkYI/Q2u58f1JcSA=;
 b=C2JRYM6C6FgPWVQWs5YbSGk0Qqp7q7xz7aoVpa9Ng0i//B2gXtNRgil1Ru+b04K9sB
 oJTZf6PTXvM4AX4APRKLPZdUgjMK9+pA3r60APMFqX/j7+2qMslzHum1pZFg91QLqbv2
 eGeu83T+jjXwSKDqWw3MeEGVMiL3acXNh14M7UmPIvuiYLhC1N77bFXLhBCzV1AtR6jF
 X66nPeV84o3dn5VoV9hWUtQH5XECFPd6cBtN8wtMJgsL/nsZuUPD+8Uk1Ylxyk+hssos
 FT7ffn5YAj3/Pj7DrBmfTUdAZQEOYG5k8+vY1Vp8VqO/n0HHoOl3gjbfnOwhm3grzuim
 1onw==
X-Gm-Message-State: AOJu0YwyoOMqK1R7WoRhyLS5T7NLEG2A3EntH900rWjpjC7BzigrKcsT
 0cTD8rwmevshRHyja5tzhzqLiA==
X-Received: by 2002:a17:902:e844:b0:1cc:47c1:c2cb with SMTP id
 t4-20020a170902e84400b001cc47c1c2cbmr7565352plg.2.1698902155408; 
 Wed, 01 Nov 2023 22:15:55 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.149.95])
 by smtp.gmail.com with ESMTPSA id
 ja11-20020a170902efcb00b001b8a00d4f7asm2126740plb.9.2023.11.01.22.15.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Nov 2023 22:15:55 -0700 (PDT)
Message-ID: <1aec60ea-99ec-4d87-89e2-b35f79f8fdf7@linaro.org>
Date: Wed, 1 Nov 2023 22:15:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 31/33] hw/arm/sbsa-ref: Check CPU type in
 machine_run_board_init()
Content-Language: en-US
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org
References: <20231102002500.1750692-1-gshan@redhat.com>
 <20231102002500.1750692-32-gshan@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231102002500.1750692-32-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
X-TUID: QlHCPnO4ZlhW

On 11/1/23 17:24, Gavin Shan wrote:
> Set mc->valid_cpu_types so that the user specified CPU type can
> be validated in machine_run_board_init(). We needn't to do it
> by ourselves.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Leif Lindholm <quic_llindhol@quicinc.com>
> ---
>   hw/arm/sbsa-ref.c | 21 +++------------------
>   1 file changed, 3 insertions(+), 18 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
