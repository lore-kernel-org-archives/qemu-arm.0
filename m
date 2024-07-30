Received: by 2002:a17:504:5965:b0:1be9:327d:8ee3 with SMTP id xe5csp2205391njb;
        Tue, 30 Jul 2024 00:24:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUxHNNKh7WBSoxB7NVJax6GV1TD8O9vM1MqdHoxTiVz+q9KL9oX8wuDWZlxQflHX7m8L4NCaziIPUDjIArPorfYuZWd+bmb
X-Google-Smtp-Source: AGHT+IEu7uKVaxUxdWPEvgEzN/V9xpGc9p+JM14JN8o6QUto8pcHUJJSEJ8PqPFzBhLxJd20epuB
X-Received: by 2002:a05:622a:345:b0:44f:ef22:8962 with SMTP id d75a77b69052e-45004f2ab0bmr150532691cf.49.1722324284884;
        Tue, 30 Jul 2024 00:24:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722324284; cv=none;
        d=google.com; s=arc-20160816;
        b=MKOKKLlL/SrSKi0pgvzbqJBoDWcfbS0CGMvpmf905BXIsJZDocNPuuxlMlTjUaGhiT
         yqUGMxBRNAHUpU3ZGAeStXSJM8Np4QwK6GPwSv3NJgCZw+cJu/6jwI/kymQ0NcfUkhQm
         YnGvSZtfdoxgMkljdsv9FVJW48E9CLYV1SPbr7Yb24RI5f00IUbse9WMzM9S3NURMvl4
         to7PyUw+aa1ygCGAbcbSunrbkDfiIcclrfDNe9OQnfXBavNhrBr6o+xIfqtV79mCmXqp
         s38o5T6Qhrik3gWdSwlJARBD4Pbuw12eEtUQEniUE9BAGi00kVP/ruHp4UDKZlE9P6CQ
         L6AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=+hWEeZgmQLWvZKuUcgvuQYHB1gC3yeiQ+90apa7U6ww=;
        fh=UMlouvVl3Ph4Ne7UvGTvosqVcNxKyKMHDiGsZppDwks=;
        b=dU7Ajkvw/J79/JvKpx1MMkfyjwQjiOf7NAKc2GjTEH9oILwNIxfABNJkSy1xEDOPZG
         CYrefCN9Zlza1lpE7onlxcU+zvj9A5RBHbDL2NwrMtqV6+unsUnTBD49m229YxxaOHci
         Gcod2SEDyILYOCiJEeHCIvgnhBrNU4byiDW7PvDvuaMf8k0RgZE0vLhPETSvgmcGCZel
         T1CpkUo9gJlWtjYvDT8Kfhhd0A5Lhrhqt2xtzNOCe4RAapYrK9xCeHPZhPMJjBrTw/6l
         iR1s/pG4dU2mOgtpkSJoQteDEXDkaWvFajBrdyPDHG7VwFa1bIkZFUWhKMHKJrUHfHNW
         GpYQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=loP+S2fj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44fe8425be5si117242051cf.652.2024.07.30.00.24.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jul 2024 00:24:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=loP+S2fj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sYhDb-0007zp-C6; Tue, 30 Jul 2024 03:24:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sYhDZ-0007yb-VB
 for qemu-arm@nongnu.org; Tue, 30 Jul 2024 03:24:21 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sYhDY-0001oJ-8c
 for qemu-arm@nongnu.org; Tue, 30 Jul 2024 03:24:21 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-428101fa30aso23851005e9.3
 for <qemu-arm@nongnu.org>; Tue, 30 Jul 2024 00:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722324258; x=1722929058; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+hWEeZgmQLWvZKuUcgvuQYHB1gC3yeiQ+90apa7U6ww=;
 b=loP+S2fj5rCD79Et3RCMs4HzpngL8RVtWwLrWMXcWiTZ2r5fCc5gQLf6tA5f7IDyTM
 951K6BPOUjqxqwUP+PR3U71e3KtuaDDlUW2olS9D/8rY+6wt07pL4B3UrcggS5bY6VwH
 lBYne7lGqmb6RaJ4sWsga8Ef+D0oKm1QhgKdHv/FwgO6LkOPbXEYWe2HxSDNvaHOlb1V
 cLB9a5XPuo2Uc8FrALDlt15wtaRvp7UnQ/0CAiv7UnTUsiC4n15WEExXkB2vGpr3COrx
 MfcriKn0ZsGFRCucIEYbeqKs4H3dz0NXAAYOayGB40jtU0FrFT4I4YN/j67RjrVMQzw9
 MMoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722324258; x=1722929058;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+hWEeZgmQLWvZKuUcgvuQYHB1gC3yeiQ+90apa7U6ww=;
 b=OnV7jmviXVmuFUjGzv4FEBvhkEgBaO/UIhCOWi5T8t4qh/YfGLXS57/je5P7HPDZkK
 q0IW9X8jAc0HmEjnKSVRkKalPRhi0h9THIoPTTNo8ygussPhItyoikCtINOQd37boMjr
 MXhCszvEI8GgPpkCeRceWbIT4JirSj7XGdRZKseZhixvRfow+LCvESRBj7ok4JVK/bD5
 IvCs8SWn3fuAnJu1rU/FdDzJUJuaibR53Fr+0RB9qpkJc5aae9LpecSnOXNZ8P+Cxbql
 UFDx33j5tzB6DVEyoaYlcRZIFkc6FZFaKAjvz1O12eM3E1MxjFjq1XUkVoK9RwlYpnBG
 qNlA==
X-Gm-Message-State: AOJu0YxBfdTPeNULZq0My7fqXNOpKcD8YMxS9kZ9ZTx8GzH0rZ885LYH
 SLcxN5Nkd/NGr2dCZShrSPuS4RWLYwCGlPzR607iRqLoPd86z8ypRYAkPlof088=
X-Received: by 2002:a5d:56c3:0:b0:367:96d6:4c2d with SMTP id
 ffacd0b85a97d-36b5ceed146mr6509949f8f.25.1722324258253; 
 Tue, 30 Jul 2024 00:24:18 -0700 (PDT)
Received: from [192.168.38.175] (82.red-88-28-10.dynamicip.rima-tde.net.
 [88.28.10.82]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36b36857ca5sm13941730f8f.89.2024.07.30.00.24.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jul 2024 00:24:17 -0700 (PDT)
Message-ID: <89bfc587-8e32-44ac-8039-456b6fa0c663@linaro.org>
Date: Tue, 30 Jul 2024 09:24:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/arm: Fix BTI versus CF_PCREL
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20240730013922.540523-1-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240730013922.540523-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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
X-TUID: 6TSz5BTeEdPr

On 30/7/24 03:39, Richard Henderson wrote:
> With pcrel, we cannot check the guarded page bit at translation
> time, as different mappings of the same physical page may or may
> not have the GP bit set.
> 
> Instead, add a couple of helpers to check the page at runtime,
> after all other filters that might obviate the need for the check.
> 
> The set_btype_for_br call must be moved after the gen_a64_set_pc
> call to ensure the current pc can still be computed.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/tcg/helper-a64.h    |  3 ++
>   target/arm/tcg/translate.h     |  2 --
>   target/arm/tcg/helper-a64.c    | 38 ++++++++++++++++++++
>   target/arm/tcg/translate-a64.c | 64 ++++++++--------------------------
>   4 files changed, 55 insertions(+), 52 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

