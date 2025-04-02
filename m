Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp3262157njd;
        Tue, 1 Apr 2025 23:43:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVTyaiJbsdlZp7BNeptyQ7EjLjTIac/jp1p6dP/AkOxQsAjmx4nVn4z9nvR96ZMb+DU4RUhNF1reWsjxg==@linaro.org
X-Google-Smtp-Source: AGHT+IHDXt6bylKzEL+k4IFsy0FQXvMcgccFeYYUaT1vqJs3fpLkIKaA8Di1z/sypqipZ7pL6nkh
X-Received: by 2002:a05:6214:5081:b0:6e6:61a5:aa54 with SMTP id 6a1803df08f44-6ef02d8e35fmr19684026d6.44.1743576216000;
        Tue, 01 Apr 2025 23:43:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743576215; cv=none;
        d=google.com; s=arc-20240605;
        b=ftDbSipSeKkiSFvC9VioFKHcqNt9XhlM4QyhxcyM7pkhURY86Easmv01lA1cCTh9yU
         L9+jldzoHSZUsI1aYT+2umGPIjgOV8XLHhiKRL4qlJAfdWz366EBGRUJa+OmLVdEbz4W
         mHPVGpUleLFUkPC3ELH+b6D7xpPgKh5K06DDxCNP9TnJHkg5mz0tfMQHGtR74a8nuHEz
         ggfSwWn+I6GbMO74msw108qOqtUemzcZHRu0qgH+u/InTyzEC5pU7Pw0Q6CE9Q0JCY7p
         NEVyfuSH3X15oyEubxJ/neZ2LCTus5J7flkSaRkbgob0RCtatIdb9zMd1l5tTHaNacQG
         s2tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=NXizRdW1yXOdzoyHAL6mQwd9HVYQu/VdZUeM7NUrVqc=;
        fh=6guKr+lUqTTGeZr7F1K1nYwkqn2Ag/h3+VTvaCAU81o=;
        b=TSGK+qRnNJvWW9ptgXjJHbY/uph/HmowmvsSs4GFenvtAtm6E+hePlhb1MLJCDGgV+
         UYZmjRhY4jvLNeJ9ZVI8F5oDY0BkSqc8eapBSJSbEx+L5W7N+OEA7md8qJQyqZA6oS1P
         NN7o9PJHdquA2xWQ65Yncb2foxnYUECmChEc3fHlHXV7yIfgfLGqPetLgslGPHOQnN6m
         hdY4e9wweoKOvRpztPq61wh3NHylacE5l/Bv+P3XnedgS7ecjOuJEHbCwIepWIoWSmIy
         GGbxbOuxJC9Ikb+LkVG6s+ncymLvPn7L/kg3oDUpcq+cJjgNTzPi66linYI9zOy4mdH2
         hW3g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="R8N/o++w";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6eec97d3c4csi102645986d6.454.2025.04.01.23.43.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Apr 2025 23:43:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="R8N/o++w";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tzrp1-0001L4-0d; Wed, 02 Apr 2025 02:43:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1tzrow-0001JI-Fl
 for qemu-arm@nongnu.org; Wed, 02 Apr 2025 02:43:30 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1tzrou-0001CK-R5
 for qemu-arm@nongnu.org; Wed, 02 Apr 2025 02:43:30 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-30362ee1312so11255926a91.0
 for <qemu-arm@nongnu.org>; Tue, 01 Apr 2025 23:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743576207; x=1744181007; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NXizRdW1yXOdzoyHAL6mQwd9HVYQu/VdZUeM7NUrVqc=;
 b=R8N/o++w2JK+WPFMvuPZo5wTSU5+cfOI/igJMWo2TyGBaG75rO8CtjbNw3z349Ft9Y
 YeudWDugW7mr3QzCVV8W/fMCHPgytwqeZuYS7Cc2KUBpHQLRKG0bZWHG7TUJJoAZX8pr
 u73E6OX/VimYS8xknC1+wVBYz6lBEJA7I0hSg9mGrkrpSmpK3oQFk5Sg2pD9jJP3QWxM
 WaAwISqdARd4ReepH8yE4p/DTmmE7mkyZ9Avxi8caaIRmWBzbzYjqxNdTIPLZf7cwLzA
 J/+QnssjZ+cnp2WjpX+/pTc5/t/jlIp9tV2VjbVlomWm86uR/E5DLwbQk+4Gnr54rJhe
 WQoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743576207; x=1744181007;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NXizRdW1yXOdzoyHAL6mQwd9HVYQu/VdZUeM7NUrVqc=;
 b=sojtFACUXHYlGB/QLWDqFLl9ihooi80/x3a/d8ltnLxnvPuBuzmKa/jPSOvyVUD2VM
 g0uUpAyfDRaptN7HjTadxbagE0oCguH45VFWG5dJ2FgFDLou76F2H7EAr7oJKEcTTS9M
 IR29lQByUDtgDQCFhsSVJf78EWPa9lTDHtVrM/y3DxEHXORqv6jUL53GXZvhzUYNepxp
 PtreYWrCbuBdEWzN5yH7a96Zgu1Arwx9/D2XcVW63zo0f6djDNilUHAo5ndjDVUgwEXN
 6vAaxnujHbAd7xel3pb8v4pqqm/gayd2+4MakInhxJ6Iec8apj3fXFM7WSx80SVTjiPL
 97mQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7aU8OXrr2qCFltZOEWEgl8zLG9vVherDF1GnNBRHWaQv7O4cnGEH9efpKqjhUJ42gQ6fs5Xa7NA==@nongnu.org
X-Gm-Message-State: AOJu0YzIMSOHfY1xZ8Bi4J1biVpjHCPX3thbO8i2qiQouyPZZriqrfG+
 xbvbo5uHdW5OxoOnMOOorTe9l4dPF3cmivoxtitcAO5pmmquXYMIjey8p/xTqOI=
X-Gm-Gg: ASbGnctVNyweQGzz0Jl5zodd2FAN2+J2pa6Xn3IiTm4WOi5z9zvh4P0BmtpVjRCyqbY
 /IFCteBVRj9c5AnVX9LdpVOQoHHCf8whLdyAqD5Yf8kHx7TfBflqclrdHxQBFbQY48X2jMg2Gsz
 FSlZkkVOws4druSjnNDIMAltAh6ugvddj3l3PCav5VbJjdQA8CQ9V5zUPIUtrkIo4+9lfkMo1ZU
 /dK99xsqGzXhcLAijnAjvGfAv8TsoLChlZPFjmhiNiABzyg70qa5Nog2CesNmyTn00ePy7QXip1
 gY466Fiau0GvIKTa0JXMofbaXBlFIN/bMYLIlHZMcNT3NSgwSoQC5xPr
X-Received: by 2002:a17:90a:f944:b0:301:98fc:9b5a with SMTP id
 98e67ed59e1d1-3056ee23346mr1863741a91.6.1743576207195; 
 Tue, 01 Apr 2025 23:43:27 -0700 (PDT)
Received: from [192.168.0.102] ([186.215.49.46])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2291f1ce127sm100666035ad.108.2025.04.01.23.43.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Apr 2025 23:43:26 -0700 (PDT)
Message-ID: <957f0d3e-0c25-4d88-b935-ddfe7cc75776@linaro.org>
Date: Wed, 2 Apr 2025 03:43:22 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.0 2/5] qtest/bios-tables-test: Whitelist
 aarch64/virt/APIC.its_off blob
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Udo Steinberg <udo@hypervisor.org>, qemu-arm@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Ani Sinha <anisinha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20250331221239.87150-1-philmd@linaro.org>
 <20250331221239.87150-3-philmd@linaro.org>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <20250331221239.87150-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pj1-x1032.google.com
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
X-TUID: QcFaNxXbsJSy

Hi Phil,

On 3/31/25 19:12, Philippe Mathieu-Daudé wrote:
> Prepare for ACPI table change in aarch64/virt/APIC.its_off.

The comment could be smth like:

Ignore APIC.its_off expected table (blob) for now until
we update it later, after fixing the code that generates
this table correctly.

?


> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   tests/qtest/bios-tables-test-allowed-diff.h | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index dfb8523c8bf..bfc4d601243 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1 +1,2 @@
>   /* List of comma-separated changed AML files to ignore */
> +"tests/data/acpi/aarch64/virt/APIC.its_off",

I think this patch should be merged into 1/2, accordingly to my
comment in 1/5. FACP and IORT .its_off files should be added to the
list as well.

Btw, IMHO the name of this header is a tad misleading, because actually
"allowed-diff" means that "we allow the machine's table to be different
from the tables listed in this header", so it doesn't look like an
allowlist (whitelist), it works more like an ignore list?


Cheers,
Gustavo
