Received: by 2002:a17:505:d21:b0:1be9:327d:8ee3 with SMTP id vh1csp242064njb;
        Tue, 7 Jan 2025 07:37:06 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXH/yVFHBGN+yNSUvgvIkHyqUeYtbEwc8UV31kvOGjJBPjJQCVu+zID+JcXhnj9S65aGqNuVDR0XKgILQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFxbf54qLsvY/VGJWLHY/+X1VCSXrcV7K+FPUv6fzkznMR6xZMDA54n9CpFD4cNRiFlTej2
X-Received: by 2002:ad4:5de7:0:b0:6da:dc79:a3d2 with SMTP id 6a1803df08f44-6dd2330db64mr1142712976d6.5.1736264226613;
        Tue, 07 Jan 2025 07:37:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736264226; cv=none;
        d=google.com; s=arc-20240605;
        b=COsytKJU6Z2yTgK91yBx6nCISLw16q4Jcg5Dfb/MHvq95HH6hknl4QRXTfWxu8Ah4w
         UTcUnAk7wC4JqzGdhGnF+t19C0ICDdVKI1OpmB51IIVx9XfyGbu4soJuQkNvkcJCsAAx
         F0KTZ8WhookydW3jWRqDxdL8mYKNTKyh6/sgzeyn5fDX0Yf5Mwsl3Uhy6DLAoQWegMG0
         0l2n8t1nCLmuSYYmKESl9bmt9BPir1QMk+2jbVkTAE1cwn9JeLYmmfP8KgG6B3qikzUE
         NNondWkwRw/To5W1fepOBgE/Ri1YQe6zLcNdS6qC2MBJLpj/8LqnH7U/QvCtPC1zMWVs
         qzYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=qgHvuD9mo6flfbAZTuMkYLnQcUOY8FDvBrOYgWFXpoQ=;
        fh=N2nU+iPxoM9Mwm/0MaM4ds+uHqeC/grdRs3qg6jiuqs=;
        b=Z5rUo4OjTmQ4Vs8iMjLK3PD0Q4f4fDbqmyVowJva7BIuWjCO3TyXmahf/dgAwGUOvp
         FZCWl233PmQYCE3SAA0MIDMXUyqmaohtClAFTPXJ1oYWO9l5y5FrOFjhwvWBQAtLwCl4
         Nfy4It1O77wVjLOUg9OwQIqN541vJs5Zmd1IDyhRZE05BnZ/gkF4qanbhxIz5qQeDB7o
         SU847gXQ3QPvjJ3fDzp0A7+zmDP6VdYlU+fEMTA8cvusBp9EuAYh3D4PEEeRm64WKLOQ
         O7Sd66SUu3FlIXjAQlNH2L/BqWetxh+fOzLVjkqhyZzY35BJqjOPN5ZTI5/ausVNtDkj
         cb8g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="M2/dD2EC";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6dd181020c5si453781136d6.65.2025.01.07.07.37.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jan 2025 07:37:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="M2/dD2EC";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tVBbZ-00043B-UN; Tue, 07 Jan 2025 10:34:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tVBbX-0003u0-Bv
 for qemu-arm@nongnu.org; Tue, 07 Jan 2025 10:34:51 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tVBbV-0005CA-I6
 for qemu-arm@nongnu.org; Tue, 07 Jan 2025 10:34:50 -0500
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-216728b1836so211124765ad.0
 for <qemu-arm@nongnu.org>; Tue, 07 Jan 2025 07:34:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736264088; x=1736868888; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qgHvuD9mo6flfbAZTuMkYLnQcUOY8FDvBrOYgWFXpoQ=;
 b=M2/dD2EC1SuxQOqgZBeZYIlxwb4smslEHa76HidfX8DeFMZqTOGhvJ9L8W1Cuc75JQ
 5UG0Ks2g9TuNE5qDCwm8waE4boXIu1Flu8bJPt+pWvOhRFpYg86bvY6apUxczcnbB1gR
 fk8v2YVBFiWaRmc9jaFy+Gr7xySE42qWLIs/ORugMGz9bfLQD+IvDe02m/zfYVIl/ZpA
 6dkpUAB48lqvrQkn4Pog0GbXsTp8zBbz1T9jKHMuQ7gQELXDuS0qrrfiLi8J32vPp8Ei
 Kqdx8POt0TIKQQbJDJZDz72vN0/y3/S6pQY1CI17L6yAZVnovWmSWxv7AZ/HSD8B55oI
 2E9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736264088; x=1736868888;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qgHvuD9mo6flfbAZTuMkYLnQcUOY8FDvBrOYgWFXpoQ=;
 b=c1pRhu2QJw8ztcgU3+sP9s+Xo/NlC/+GueiSuri4MKReIS8OxCCmzYoXW3iWwNtTr0
 pP1TzgJjRqdqcG0VS/AhLND/iQR18ENGAzMSavd5v3HwJMK8OowTblJIFeteh5XNsiay
 H3uzWhQYu9uJ/B+kJvple67Eyp6eMtf9ZyRQ59Ey+uZhIHgnuVYnTo14ytMTTNhTYF/h
 +W8GqsbqkHHgmrlskEAqnAM0QUiXQjwXkoSr2nqbSL08QLHxLoThTQh8osVq1F/XYN7g
 eyA7GQ+xiVAnVAQHmB/17dcsHzU5N6Snf3D2a/YuoR1cDGXk58sc5O/SKU30GAAqH12E
 p3yw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJAa1Wgqg5gxGZYfX2DD6EN9L+n649qLDI6MWkXgrBoSn3WD7A77nRbD+iUPxiSSqkIWeyBngfkw==@nongnu.org
X-Gm-Message-State: AOJu0YxRDENRiROHmYlay0Kw+znK6DG/hOgTm3Lbcog8FR7Q7Nhr1ASU
 WQ7I184cX2QhShJIG/MssDC0qOIW9/OERcU+Dd+S7rFSr1jNC618z7CPRLni6ng=
X-Gm-Gg: ASbGncvek1O4ZcdSJFJyATz7rL/BJWYGXpDkbArIi2yrG4rkS6k/tReBOSSbtB+hhNY
 VDdxBJrt28FVxBbyBULdq+3FPwkLP8OndY8pFhvIGFrog8ORGlVEF0tdwxRomAvMioeX6lGXFQH
 KuFzNST3i1U0dKODoB1gGbLzknAKqmnzHW05UKZ1lGq5MLezjM+p2/Mobir6Y/NK21uhY+07nKW
 E5+ELzXiwIw6/ddflOH6Oyl9kh7h8uTyWje6+NrswWqqtZBkdwNNoQ+jeUw7T3mvOQ35HEILO4y
 eZCDn5ruQRUrXArqWttYDMOxM6maTOw=
X-Received: by 2002:a17:902:d4cf:b0:216:60a5:ebfd with SMTP id
 d9443c01a7336-219e6f5472fmr700569435ad.55.1736264088212; 
 Tue, 07 Jan 2025 07:34:48 -0800 (PST)
Received: from [192.168.132.227] (76-14-228-138.or.wavecable.com.
 [76.14.228.138]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-219dc9705c1sm311335215ad.101.2025.01.07.07.34.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2025 07:34:47 -0800 (PST)
Message-ID: <1db55939-040e-47f5-8550-17a44f3dc129@linaro.org>
Date: Tue, 7 Jan 2025 07:34:44 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] target/arm/arm-powerctl: Restrict to ARM cores
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Anton Johansson <anjo@rev.ng>, Alistair Francis <alistair.francis@wdc.com>,
 qemu-arm@nongnu.org, Yanan Wang <wangyanan55@huawei.com>,
 Zhao Liu <zhao1.liu@intel.com>, Thomas Huth <thuth@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20250107135739.48324-1-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250107135739.48324-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
X-TUID: NT6cwpRouh8b

On 1/7/25 05:57, Philippe Mathieu-Daudé wrote:
> Since v1:
> - Factor cpu_is_of_type() out
> 
> Philippe Mathieu-Daudé (2):
>    cpus: Introduce cpu_is_of_type() helper
>    target/arm/arm-powerctl: Restrict to ARM cores
> 
>   include/hw/core/cpu.h     | 9 +++++++++
>   cpu-common.c              | 5 +++++
>   target/arm/arm-powerctl.c | 6 ++++--
>   3 files changed, 18 insertions(+), 2 deletions(-)
> 

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
