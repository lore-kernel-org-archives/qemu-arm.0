Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp3350588njd;
        Wed, 2 Apr 2025 03:31:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXWlJWJvMpPjhSd0pRItW3yz+nDxmporuk1A391HxFO40ldqsCgAc+Ttb8QKnPq38WMPgkVSfgpdY4fAw==@linaro.org
X-Google-Smtp-Source: AGHT+IESs9PJAjSgu2J1w6+HSa/ZGfp2Mne7BFBf2VtOiO+e9UE3G901iM8/ZjwN1BIjazEPVjrG
X-Received: by 2002:a05:6214:300b:b0:6e8:f949:38c6 with SMTP id 6a1803df08f44-6eef5ed4831mr97841826d6.33.1743589913625;
        Wed, 02 Apr 2025 03:31:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743589913; cv=none;
        d=google.com; s=arc-20240605;
        b=ZiFSF0nfIN5JyL2giVi8q3148N9nBSfgZ+065zOILhj6WnCKBbEUAzHIGXzQRkA036
         yKdTOdYsD9WDisFGRxZ12uT19Nosi7kRKdEUYacFmFwNt2XddOfLfL6Ar+5FXi05QqNZ
         WuNgU+qOrvvUD07DzpGW8Q3jvGkkxjvNr3hD/KZCCDe+B8wr/J2uGVJqeNPXOVGf046n
         ZQvHUAxt8pqx+PPR8UtOqGwNwfTrjVCYwNo2v/pxFiYlpJ531Yg9KTpDr1of+mo9Y2H3
         9hDf8hc7JzNyq5zwaoZMn8T9t/tNtReRSoj5RkfYQuxH4DSiEZeDVFjQQhhPm4wHIgA/
         8X+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=j+ixtitVW2HwxwjBnn85TjGkrpNw40oFffG8dlas4/0=;
        fh=GhSgxEzHAiFlBNI5vnYiXIUuj/elE76gWv4MiUDUpBI=;
        b=A4qRh3N6FkYWpqNdKI9liK5j4gSnix3MC3fBGPJbnTGWW4h+uvlIJCit3MYFraVvav
         LKyQEmCalw6Ob8Fr6mbXBWieqz9BIn+brYUeVQG28gIKPg/fkhkQrJrHX/iSpdEFcpgw
         NLEndGs0FzZElqxD5v6+Q/vrOwjUoFKBfa2m0oFPbV6pgFD2Eah0S6z3XDDpsjTf/oMR
         jkTYp2mq79DDXrjDvEr98A8F4Pc+cvIJzUOxrrrpOadh8UFyvPHWa1UA0PUwYb3UCC5R
         y8s5oW77jD0z0/ZfrF/0GWVIZq2y+9UV8UKI1InGlUmoJG1gUDRxCqSvaDl4H3apvvSA
         7tDw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QYVUYYOu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6eec962e27fsi103304926d6.65.2025.04.02.03.31.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Apr 2025 03:31:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QYVUYYOu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tzvNt-0007Io-HB; Wed, 02 Apr 2025 06:31:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tzvNf-0007Cc-Ut
 for qemu-arm@nongnu.org; Wed, 02 Apr 2025 06:31:36 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tzvNd-0007es-HS
 for qemu-arm@nongnu.org; Wed, 02 Apr 2025 06:31:35 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43948f77f1aso46535665e9.0
 for <qemu-arm@nongnu.org>; Wed, 02 Apr 2025 03:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743589891; x=1744194691; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=j+ixtitVW2HwxwjBnn85TjGkrpNw40oFffG8dlas4/0=;
 b=QYVUYYOu3rGR4eDdRh7BmkDstuSm6XJ75lgN4JKc78MKecL7TtISRwh6S0WVKjsSBp
 QwDFVnSzAJmOpBd/M2NEhFf2XVzWM6c4K7jIcgjbqMibEEiALhhktfVm62HzJ1A++tfY
 VUP1txgyc6uQcc39i9s8UrYa/yvD5sTlGiUg11IOT3JSBDV7AJkAV/NkgG6rW7Vf1obx
 YjpmKZHkKVuUszTg1QcL8redsNCGyRH9ypuqwmpsCUGL7YAuagE4XwQS4LdPLR656XtZ
 xOvngawNUCFQdxmB0+ASQQ9nyhv13tucJjkz02fNIsHMW91PmTrxp6DkigJTvZl3KDeB
 PxMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743589891; x=1744194691;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=j+ixtitVW2HwxwjBnn85TjGkrpNw40oFffG8dlas4/0=;
 b=MzwszQaC1yy2St3BjSs6CspxZNyX1SiCC2O3oD2rwBIIndFTtYuVCxGj79jnRCT8+h
 m7M6+Co4hdD+h60GLmOJ2e2od6gRRc3uq4MEJ1nJcwxHyDrKcK2OE5yWmwzAl3+3jrrP
 4L+51w8QFrMnCuiS7jfM+uDKWuGqDpGBc3h85W08iMy73cpMAbobbzLwJtPSVsz5SNWC
 tDfyA1Y1rmJUuqdMIvl4jfwRdtVJkcUJKfE7bFsXiFiZejERrhL/yKs+V54JE0oTyKZB
 NnNnS36jpsyPKODOak2O0v3qGYuaDb3HCMl7cfGxX1ihDMlQBtjjrxjJDDJIq7gl09yj
 2rPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGy3w8xCr97ZlSnI6KYH9ZpRGfoUcGS4aMAyyn41G9mPl5LTQMSeEXqGckAqug6YrlBgCbGLzqpg==@nongnu.org
X-Gm-Message-State: AOJu0YzJJW6xxinFwg/gyhcWbLjrpHGgNoeg4jo7EcpkRBs4zbrY4WaY
 CTbZAvT49ZLg9PDVRWVtB38keMJkDaBn5EUxRufbG9zH3s0J4NOcAjqLfnybSFk=
X-Gm-Gg: ASbGncvhGyE1EB5L0pVSI1BrAVzSA/+TFe51mcI+aq0I5Oy77MvzGu0teK+gN0eTvz4
 sczL0mNZahlhPTiW0rRjiqkkQuZHVsCzXaTKYdk7LItFsiUtsOpO8OodyCKAo9eYNqGjuYG3iln
 H/aZ3fxm+XwfdzxuGQ0odgiQgBVGXg4tLhWNBcn0/O63+Pt5Exs+ihdt1NCK3nxvsvNEqFNoJmS
 boQwAEXGkjRZrOat3kSfLMf49dWouTOYWyU+HEgcw9gZnfjBZlbpK16qMCWD+hgFzZQSwohb7od
 YTVziaPSZe7ym52auU676zSPz4FVONeyoj6gRJTMGyWAbxQi2C6gQh0NlIXgoGI49xnxcQWKIPL
 fD8dVK0Rvp4I8Ok1mK1o2Zus=
X-Received: by 2002:a05:600c:5108:b0:43c:f6c6:578c with SMTP id
 5b1f17b1804b1-43db6247df8mr135733155e9.15.1743589891558; 
 Wed, 02 Apr 2025 03:31:31 -0700 (PDT)
Received: from [192.168.69.235] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43eb5fc67b3sm16495685e9.6.2025.04.02.03.31.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Apr 2025 03:31:31 -0700 (PDT)
Message-ID: <dffb0578-e449-4984-9a86-d675eff93485@linaro.org>
Date: Wed, 2 Apr 2025 12:31:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.0 2/5] qtest/bios-tables-test: Whitelist
 aarch64/virt/APIC.its_off blob
To: Gustavo Romero <gustavo.romero@linaro.org>, qemu-devel@nongnu.org
Cc: Udo Steinberg <udo@hypervisor.org>, qemu-arm@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Ani Sinha <anisinha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20250331221239.87150-1-philmd@linaro.org>
 <20250331221239.87150-3-philmd@linaro.org>
 <957f0d3e-0c25-4d88-b935-ddfe7cc75776@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <957f0d3e-0c25-4d88-b935-ddfe7cc75776@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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
X-TUID: AIrboJHZzPSF

On 2/4/25 08:43, Gustavo Romero wrote:
> Hi Phil,
> 
> On 3/31/25 19:12, Philippe Mathieu-Daudé wrote:
>> Prepare for ACPI table change in aarch64/virt/APIC.its_off.
> 
> The comment could be smth like:
> 
> Ignore APIC.its_off expected table (blob) for now until
> we update it later, after fixing the code that generates
> this table correctly.
> 
> ?
> 
> 
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   tests/qtest/bios-tables-test-allowed-diff.h | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/ 
>> qtest/bios-tables-test-allowed-diff.h
>> index dfb8523c8bf..bfc4d601243 100644
>> --- a/tests/qtest/bios-tables-test-allowed-diff.h
>> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
>> @@ -1 +1,2 @@
>>   /* List of comma-separated changed AML files to ignore */
>> +"tests/data/acpi/aarch64/virt/APIC.its_off",
> 
> I think this patch should be merged into 1/2, accordingly to my
> comment in 1/5. FACP and IORT .its_off files should be added to the
> list as well.

No, otherwise the test added in previous patch fails.

> 
> Btw, IMHO the name of this header is a tad misleading, because actually
> "allowed-diff" means that "we allow the machine's table to be different
> from the tables listed in this header", so it doesn't look like an
> allowlist (whitelist), it works more like an ignore list?
> 
> 
> Cheers,
> Gustavo

