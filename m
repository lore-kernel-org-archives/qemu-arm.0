Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp1493171njm;
        Thu, 6 Mar 2025 05:59:38 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUd992ggNB1dYF9ilVSBTFtpZr4h0dKYgGzM2ogyXOehb5Pc2H43BTutomY/a5fLKH4kTRFc+BWJ/ks/Q==@linaro.org
X-Google-Smtp-Source: AGHT+IFvih0EeZVaLkWFGpKA8TLEt7RZ6qBfwhW8mYC6sSCt7Hd4xPO8GfMaxnofHGdBJxDMAu0X
X-Received: by 2002:a05:620a:8908:b0:7c3:d45b:c0bc with SMTP id af79cd13be357-7c3d8ee1838mr1347535385a.36.1741269578430;
        Thu, 06 Mar 2025 05:59:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741269578; cv=none;
        d=google.com; s=arc-20240605;
        b=k5wDwiHWBlkWr13WjHnrk+6YISbqM+ARp4XPPDPYZKv1nn4YNJebTUgm0CkrX9hnA2
         zttyXGbswwLnt1NirJ45CVPxH63miTjkqP5SpHfSWFYjmsaIElgdPMTl1kvuw+R/jrmD
         pwh0cxJmjiM+KD5Fhof642qZGra7QqUW4TJ0nxErPl7YoRavrLHeFmJUOM+jc2BPN72N
         YAwZXDBvS3IXr3k2MTfVGBfgvPBc3R+o+n6Ll+4EC27H3SunNeHR0KI/MC+W/Ru9r2Uy
         7nEf5i2tJaw+IPTX9pDt0pcdy1sck11ogjDEyA3frq5VcQsglUqj7EL7/GKD5LR0Wmip
         2ZvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=nCk7xfTFWFGROlrsmv5jMFrY4lgry6lErJKkNV3UDvY=;
        fh=4yaz5dOFVATUdXWzlJAIfw0ZTFLTJ8YX7p7NFgZfecg=;
        b=iLaU3uGa1YoNYPKXIcYlol+d30waD4MYIssFy9PG2U2yvy9rWZrAAyY+OLG2ZnXHHj
         stewq+aXWoFxWFXgmxikWGRfm9qL6AcbB8sB7zdTOX5ER4+QMgNPcmb9zm9W4vsonWxE
         YbIpiGUhEdxxrl7nOKjcuXQTZa/WEbu7yCg1FlA0nGVZ12RiGnlfKWdgvC8DCiAQlSHw
         o+srBEL62/y6Qncm0Rx6Gt69fHxWofuW8n474645s2q0/2FJw5giYalKUc8dPqJCaccK
         w3qazeoU4Tx9GwdDPSoNUdYsxC+/PGy5l/mqjsRNcf6uydKh5BlT2W81PXsv6VgTV/sP
         lU2w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IAzFldW2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c3e5511dc5si123935485a.420.2025.03.06.05.59.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Mar 2025 05:59:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IAzFldW2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tqBkd-0007aG-TM; Thu, 06 Mar 2025 08:59:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tqBkb-0007YG-R6
 for qemu-arm@nongnu.org; Thu, 06 Mar 2025 08:59:01 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tqBkY-0007tI-Mz
 for qemu-arm@nongnu.org; Thu, 06 Mar 2025 08:59:01 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43bcad638efso4181865e9.2
 for <qemu-arm@nongnu.org>; Thu, 06 Mar 2025 05:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741269536; x=1741874336; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nCk7xfTFWFGROlrsmv5jMFrY4lgry6lErJKkNV3UDvY=;
 b=IAzFldW2NJkY06gM2pYg1eiqGButGn1HWaYnFE+UGCkAcrUS3VUCVJd8jjLhfer9Q7
 lM4UtIZqORPxkXb4GcOoTk2GUU3XqiwQcklLPG0UeyB42FBLjyvikem2IMCRe00j5ArP
 gklM2WB9Zkm7JNr2LQYFAv3oNkyzFAMAJdwkyWmLADdOMPCwG5n5o/5OJiOJM+yFebZD
 FWn2q4Q2F/hEIwxkl50VUuGjwLABDjLG5DZMQbNGhdy9P0EIlTIpK2XYaBZ5yCF9mOOg
 I2/+qs+Se2CHqhmqg3YK+q6UjM8cCJK6JV5smC/rPnmGnQSiC7X5mgZJ5wm5gFpVpaRI
 96Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741269536; x=1741874336;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nCk7xfTFWFGROlrsmv5jMFrY4lgry6lErJKkNV3UDvY=;
 b=mGlv65MhHxGlFFkO9PXAxxoLKCvFpyyEVrY3mbQgf09yRyAGeyyaA0xlZI+8wnxDtg
 Kl3485vxH5OQzpMSLB7BFF2JwXRF7WKh3CI1SMTvqcSSVlwVJaaIxHduxNA9RCEmruEx
 RZqe0ZVbxW1KND6di6x7oHuDd30R5cK6xqHNeoxyQLWqD1UvP6MOp2uhOMEPsTo0tUAr
 t1CZfbqctpkeNh0s19FrIFyt5rO0P43q7AhOaLVorqiNihQbwkh7rYEs/nFH2t1U5/Nz
 9ZKY901aBQjWGOFWHoXnvrlGp+ALV4Ft9jTrXSrnFDwspFNTsHQQ6whq9IarrIHA1gDp
 2D1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMxYWXvP4grIp3u/cQOKE4xS4+m717jZr7XT4MKW23qGE5FyH2IwvKb+b2Of1G3S5ZmWrLcMyFQw==@nongnu.org
X-Gm-Message-State: AOJu0YzFydTzQsOgCYWdYwyg7uVcmH+/3LffSmsn36lQj+Y0P70Jweue
 /go4CRZpvHqH9nyia+V5jzEAMxkIJKQ/Y/gAypKxpqzpW/6+q5uNfg+GAFM/JRA=
X-Gm-Gg: ASbGncvck41eHbksYZ8ZbIIu5A8jCFdriCbHm6UJtZAqAxS3ebEYjBCIqLXeIiu1gry
 Z3hahIrrVyeLzlvgfxXRqMfJjzOYwb4VSmgasoFh1gwc3/QbVnfd646N9d9ZlR7CvAEOXvlKnGV
 Ex3Ex6xBfIUrOz2KVDTpre44pPzEnmDQYcnae2WgIngPUojJTZPzSOOEhTfQLD45BqEPyHpo28s
 Ytu9ZDMhFiHPxSgPP+MpnGdjqZZwCckJZ7AsUzAst9kpXJ+48xlVdvF9eNRZjsFHQX2l9+jmezY
 bFQCyzluFyJSvSH18jaQEAZV9sgJhi5/VXfVIzaTSGJKuR6TSVLWid9lzngxZ1B4HADUjMXKFte
 eMATwGyP4FO2c
X-Received: by 2002:a05:6000:4022:b0:38f:5057:5810 with SMTP id
 ffacd0b85a97d-3911f7567c5mr5613840f8f.25.1741269536557; 
 Thu, 06 Mar 2025 05:58:56 -0800 (PST)
Received: from [192.168.69.199] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912bfba8a9sm2149631f8f.9.2025.03.06.05.58.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Mar 2025 05:58:55 -0800 (PST)
Message-ID: <8a185083-0459-4108-bd57-4bae75d871c6@linaro.org>
Date: Thu, 6 Mar 2025 14:58:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/10] disas: Have CPUClass::disas_set_info() callback
 set the endianness
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org, Thomas Huth
 <thuth@redhat.com>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org
References: <20250210212931.62401-1-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250210212931.62401-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: LCqJNUemOPYQ

On 10/2/25 22:29, Philippe Mathieu-Daudé wrote:

> Philippe Mathieu-Daudé (10):
>    target: Set disassemble_info::endian value for little-endian targets
>    target: Set disassemble_info::endian value for big-endian targets
>    target/arm: Set disassemble_info::endian value in disas_set_info()
>    target/microblaze: Set disassemble_info::endian value in
>      disas_set_info
>    target/mips: Set disassemble_info::endian value in disas_set_info()
>    target/ppc: Set disassemble_info::endian value in disas_set_info()
>    target/riscv: Set disassemble_info::endian value in disas_set_info()
>    target/sh4: Set disassemble_info::endian value in disas_set_info()
>    target/xtensa: Set disassemble_info::endian value in disas_set_info()
>    disas: Remove target_words_bigendian() call in
>      initialize_debug_target()

Series queued with rth's comments addressed, thanks!
