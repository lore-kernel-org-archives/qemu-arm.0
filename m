Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp960150njk;
        Fri, 24 Jan 2025 09:18:08 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVg5EYytMcpumrJHVMN88TSawYnIs/zMcWcgeTvC1qrSPQ2U8IQu8M6lYoqhJ6mFPv/tRvGiRmXLGD9WQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFub3pqsERBf/y8yctnxDHy1R7eKly1hMXwVrLd7mSjbkYQyr3vQM27H/1DUc8mGO9ffF2P
X-Received: by 2002:a05:622a:1aaa:b0:46c:7276:7997 with SMTP id d75a77b69052e-46e12a3fb1amr499012101cf.13.1737739088257;
        Fri, 24 Jan 2025 09:18:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737739088; cv=none;
        d=google.com; s=arc-20240605;
        b=GSTsqRiKJPdC+8MI2TIJdgU1vBiE9mFyuHI2OhFj980m0ENqK6JgWZJbtpTWbp3+ms
         CxmkIZLaiS/+flURgh4qx60+mJJ58AXQ9Cp2isEk0d0/dNA/A3QLwzP4NBN8zdA4wAcM
         o1gOtLjnlQr84EmzZ4luPFh4QKTN4/F/toZhCVDII0m1bYXdo4DPEwIP/Zfr48hm0nCI
         EvNrPZTiLNChG+/eEs1CnCn54a83TsXVXyUk5uDDqmVAVrW2KHM8K+iuS+iRr6tSVqQr
         Gwc0qDk0DC430OB+eZvrWMg00Exj5vu28/m4MIRTn4Zw/mf+TDjtXRsIUtTBNFHU717c
         uhAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=qBZiO4D1FqmlXSnrN8yKjuP8R99OxjLQaJMiyy6bpiQ=;
        fh=iRdBN1YoLJCvVUiTTWybEyEWQ1TrofmoeyQxLE4Z5mQ=;
        b=VcqtKdFpJFacjca/yoSytLvVNgVAzJbjC35GGygdI+FZmpRmnje32zyERXaxesfFz6
         68y3zh6Csdv52rqZIUXKQxu223iNMx5suM4GTErr33IX1mrW7Omf8C/KfenTSHC8zRWM
         6NVanIWN1ciQve9FTwsZrRenGRg+1ol4rbMlPuwvet5JjncsVCJbqBrwZPhzruGIG5mf
         4aPy6jujABZZYeO6IIlC9SLV93S2ZW9rSBz0tbc06dpHTmadxzIx+R/7hPxm/cT51SY7
         u0Axk4oFgGKBI4Izk2G5J+AAdkM3bCiaz2GJh8EV7CfLLGHzDhfmt8ozcoDxpNYVAIQS
         H1wQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WmrVrdFy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46e66b6b9a3si28187611cf.242.2025.01.24.09.18.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jan 2025 09:18:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WmrVrdFy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tbNJL-0005vJ-P9; Fri, 24 Jan 2025 12:17:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tbNJK-0005td-2N
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 12:17:38 -0500
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tbNJI-00070x-Lg
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 12:17:37 -0500
Received: by mail-qk1-x72a.google.com with SMTP id
 af79cd13be357-7b6f0afda3fso166758785a.2
 for <qemu-arm@nongnu.org>; Fri, 24 Jan 2025 09:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737739056; x=1738343856; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qBZiO4D1FqmlXSnrN8yKjuP8R99OxjLQaJMiyy6bpiQ=;
 b=WmrVrdFyYsvReqWlk5GBs8PDdKtJR0/NI+w6OW2CYIH1EwonVzwa1x0xclkh8AfRFp
 wCLHv8oXe/11X26YjWf9ViBMxJibY4H9PQgluMyoH1DJOoZxRbtOTwOjBL9qO79FMZ98
 IHn2CV/t/uWwt9Bpc8RKPLDddwWs4YccV1CtNtUxmuDA3vAvusrzlsYJBVY8f8n6tO7t
 UXyTdBGjzSjKWVbUhUImgMyQpDaeQg8+ZlbuCG/qwI/+hwVUn0rKKm7C9qUP63DkY9RM
 CNpDqGTDCnlp/6MDhZdgrNrLev2f67ITaEgfAlJvLNSEkQJIhp6NKO4FqOygNsb7JDaL
 9/Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737739056; x=1738343856;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qBZiO4D1FqmlXSnrN8yKjuP8R99OxjLQaJMiyy6bpiQ=;
 b=ZNZSakSxH8OOt9hYbB9g8vlcPCfNIBJNl/qcTEMTx4mrpkse80NWh/ORQUFbxgT5qf
 JPjRk/qcQyJYeBJB0PZUdAnItemZ7x13jtjHniIkSuhKsieGeQEq8zTBhtMu3jeznPKe
 HriN5Y6LcaqC4NX1DwiboWc6opxwTbU0092qYRaxv5j61ZiiO3iZ37zBgcoILtOunDqA
 3nLTku+aqLgoLhQIhBTtJHgI2Ev5c9wK/OwzBzO8fHyq4e18Pa31qGnw9acLoJsMqQlb
 4RKyGID/nS6de9cIQC7ktM7E1ZyRZJt2xYbCk+8ekKPvgqRgYQAXNAV4WGwOEcHL/woZ
 BbJA==
X-Gm-Message-State: AOJu0YzJlnXm+mhpKHv4rs5frzoy4Bsc2977Ctqb6jtEubtkBRfR6tsx
 9ZZ6cZSlag4fbz2XXKzgRs159BLZNrhZEJDRFf0PdChZemMBU8AM0GY0HwKq8RU=
X-Gm-Gg: ASbGncv/OVrzvqbnbudn63C/eZUVTd179/quq34Wyrgd4XgEDLM3OlUFHeA7gqIoXpN
 RBWEmfGfmWeTKT5P8yViaFyb+t6iuj3cyLDGgHAA6CNHAUCATpKRwtz0/avBc6RTlOCjSfJJDBJ
 qNrPDvXtmbIVWjGoBrPQCS8JQPK3vfpj4pbdh8cDZrNgymo/Uhd0iHtl5Au51UGBDN/+VlYPlLz
 Y5pf8V3iivbsxwqdTp6J+epYeRnFdX3p+2sxiayXrpe8f9s4XDWmfReq5mu9gXsgHt+p5aMfOP5
 Dvp+CBEq0RN0NNDcLJ+PL/Yuc6cnFw2SI0oPzSuPW50PJ7S8hSScEKVz9Eltc7Htkg==
X-Received: by 2002:a05:620a:2a13:b0:7b6:d8aa:7ef9 with SMTP id
 af79cd13be357-7be6320c0f9mr4759858985a.32.1737739055757; 
 Fri, 24 Jan 2025 09:17:35 -0800 (PST)
Received: from ?IPV6:2607:fb90:c9e1:9829:9eed:533c:6788:9f4a?
 ([2607:fb90:c9e1:9829:9eed:533c:6788:9f4a])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7be9aeec6b8sm112525785a.84.2025.01.24.09.17.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jan 2025 09:17:34 -0800 (PST)
Message-ID: <16332db7-6ed6-44eb-b266-8a3e9c7f34b8@linaro.org>
Date: Fri, 24 Jan 2025 09:17:32 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 21/28] target/rx: Move has_work() from CPUClass to
 SysemuCPUOps
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20250121142341.17001-1-philmd@linaro.org>
 <20250121142341.17001-22-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250121142341.17001-22-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72a.google.com
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
X-TUID: SMJwoeokjqJx

On 1/21/25 06:23, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/rx/cpu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
