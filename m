Received: by 2002:a17:906:c0c2:b0:a52:4db9:938b with SMTP id bn2csp938936ejb;
        Wed, 24 Apr 2024 15:14:17 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUEoUSD31cSE9/ac9LS8QkM3TlognVlO8sw/0UOpSbZXbcu+QMkwiWh09skWrU7jLZPeOWgxMnniIwQCAGzTzD16CFAWE1t
X-Google-Smtp-Source: AGHT+IESWvtpeOs4MIyzfpyNHFD/zCmNGWdOTLIsdggGFFc4iyBlMcuEzd1q4EyhiLbFGivv6amn
X-Received: by 2002:a05:690c:887:b0:617:ca32:c36d with SMTP id cd7-20020a05690c088700b00617ca32c36dmr3829903ywb.49.1713996857226;
        Wed, 24 Apr 2024 15:14:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713996857; cv=none;
        d=google.com; s=arc-20160816;
        b=XIX3Rde0fdKzadRlPDAezzhWpKO67PsPmwi+1iik0zi6qhD+3N4O0QnRgOaNC94Q/U
         tfNJs77+A1qF0ywNf2A0zoxSXwkX6zFo+7ObAUViNNk7LKOiJw9SetHPUI+ZJyNFFE57
         Njq2KFDTimIoC8KkGZmEFz7fWKndMQnnLV/XdN4uRz7teg4M3IsoNyDiq3HIqUrq7Bwb
         dWsvxmsqKg68L5g7lfYGww6ohCCcU3RtG+UhptJUNb8tVfyp3kyRfCYINJeGHjLTWjvL
         I95awr/dKCkbvA2oIARCdrxhAAGeaG7/gRHIc8JVf62i7DhzNYLPvnmdTUrmQKXuTnDH
         UHZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=3jsaqkhAx+Q50/TX5mvV0NuMIz8/EsB7xtWNvi2d+Bc=;
        fh=2i0sV/dl7ofrr1HVrEwkBtRq1SRYkKUJdhSzCS6PoXk=;
        b=wf5DG1L8mYkXFPjnzSl9GAttoDKtUvsDxxWVGpEhZOYjYXiXe33WeTxYNjCAoSUDN6
         yxPeCQ5NYI16chQ7liIBM1fIq/pzyMq9Uydb7AhAVc2ObgJo2Y1EdkzFy7h21vw8DUP+
         Lu0QqahPdeBBh2VxdnDTX/2Ph1wcJectsMZaTxUtJB7nss/GZYiALWpOZnib1OuNZqNo
         rF4ubCKlRfQdJPV9kvgHS7BfNaFr8A92Fvd8lI5rTrZQwXUDcMhQPpDmPdPnNAqwzB/R
         5CEWqUlMixVT8L9K2sgh03s3iTahuePZudCaN6BtTAdBMmWf7z7rBKAy78WN639HmtGf
         3CSg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FIrsVqYZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d7-20020ac85d87000000b0043a285cdcf7si1899732qtx.785.2024.04.24.15.14.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Apr 2024 15:14:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FIrsVqYZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rzksL-0005SH-88; Wed, 24 Apr 2024 18:14:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rzksI-0005Rs-98
 for qemu-arm@nongnu.org; Wed, 24 Apr 2024 18:13:58 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rzksF-00017w-FI
 for qemu-arm@nongnu.org; Wed, 24 Apr 2024 18:13:57 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-2a6fa7773d3so350134a91.3
 for <qemu-arm@nongnu.org>; Wed, 24 Apr 2024 15:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713996834; x=1714601634; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3jsaqkhAx+Q50/TX5mvV0NuMIz8/EsB7xtWNvi2d+Bc=;
 b=FIrsVqYZJoCpIfyBOfWwLMApt67ciZWBSOaqg/sZ7+6RLYuWIfcKZBlilIrhz2FJsA
 y+a0T5LZ4pnQKEEiB2gZFzxpr1UYtLIZcoBiLlr+fEuKUyFGkP21qHubHVAnsEsKifQW
 92tdZAhqufihpEEOF62TBfbEl/hdDz7chiGgSdPTgENcIPV8whDrz22bCeqNFeKNE5i6
 ZeQCLJako1SWFS+YIMURVkTpQ3G3BN2hIcom6lwD6s5pNBWyjSFKYb6WOSd6fCLW+TXe
 ZwkQGuEx1KZOk2YrAqFP74DK9HvY800571fEs01nuYBRgT9TRVIHogGXFtFrOQ8Hroyx
 ZF6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713996834; x=1714601634;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3jsaqkhAx+Q50/TX5mvV0NuMIz8/EsB7xtWNvi2d+Bc=;
 b=VjmWZxnFubIzTQbv9PkYXB5wAnVMcGW8+GgKBzYuSquRZsj30Cuu0kz98+4zY8echq
 SOCtHxJ+WkJ4bCLRgT0rEDIqXgBqxTW8f1swBAdku2xge/emdR5vJJOG6WyXXEYJufp8
 3YUZ0WAQwQ13nrf0W6Y7G7afRp1/kymvZJFR+l96iQQj5MHTphttNZZ3VtldpMxOk3rj
 owdBH9X8xRvctSN3Im2b0dVF7yQEEHGj5FDdGOPuxEOD7VqRXMjkoGfpNAI1GxKP3aXR
 HDoh2zTIyIHVCuF5JVVJUoZHhi9MxMxlGoZBx5rvztEmB5oFdjQ9DpY26USBbzZe/sOa
 sgQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOQPVGmk6nY/cKdp/HtoYlyQZbt8nbmDSNtQM2iZ3350GZJpIvJJV4JMUpx3p8lcp2iBdZfb5ATwjZXoGysWxiZkOu
X-Gm-Message-State: AOJu0Yz5hrdKP5JBZPtT1/op0Xj/Xup7ym1qShRo858NVUeM4zXyqKyK
 kifOB1avYw13jxqpR8/EkVK6nTkqFrnAui1Jw/5LPjQbXS0oeIJo0xsMUMtiBws=
X-Received: by 2002:a17:90a:4884:b0:2ac:24ed:c930 with SMTP id
 b4-20020a17090a488400b002ac24edc930mr3774718pjh.35.1713996833704; 
 Wed, 24 Apr 2024 15:13:53 -0700 (PDT)
Received: from [192.168.91.227] ([156.19.246.23])
 by smtp.gmail.com with ESMTPSA id
 kh3-20020a170903064300b001e48565b40csm12452094plb.210.2024.04.24.15.13.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Apr 2024 15:13:53 -0700 (PDT)
Message-ID: <dbdada57-3bd6-4d63-b14b-f95ead5ec176@linaro.org>
Date: Wed, 24 Apr 2024 15:13:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] accel: Add new @dirty field on HVF/NVMM/WHPX
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Roman Bolshakov <rbolshakov@ddn.com>, Alexander Graf <agraf@csgraf.de>,
 qemu-arm@nongnu.org, Cameron Esfahani <dirty@apple.com>,
 Reinoud Zandijk <reinoud@netbsd.org>
References: <20240424174506.326-1-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240424174506.326-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
X-TUID: Vul3pV5nlV8w

On 4/24/24 10:45, Philippe Mathieu-Daudé wrote:
> Philippe Mathieu-Daudé (3):
>    accel/whpx: Use accel-specific per-vcpu @dirty field
>    accel/nvmm: Use accel-specific per-vcpu @dirty field
>    accel/hvf: Use accel-specific per-vcpu @dirty field

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
