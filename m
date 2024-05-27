Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp3075036ejb;
        Mon, 27 May 2024 03:12:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUT5hZrjAqolk1Z2r8KFXE9v+0MRO/raX0A0qtjRLDfWBrzYzfyXnJn34x2c8RKNfTFJMdg0/mBL6aLHNz4c4fpCOoVyiE8
X-Google-Smtp-Source: AGHT+IGOt0D5/Jb3mPqOlyqhoXRPOhdN56PcIZCOtMn62gG7vTT85TzafQY10WLUYSSx/cClkJ9J
X-Received: by 2002:a05:622a:301:b0:43b:82d:d2cc with SMTP id d75a77b69052e-43fb0e88c8cmr108376601cf.55.1716804763032;
        Mon, 27 May 2024 03:12:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716804763; cv=none;
        d=google.com; s=arc-20160816;
        b=lgzJ13fDPLFuI86pAMktwA36mzaobYOwVOi79AxlFLz13F3vbuL7IjpVFaBwiuRxWp
         I16mrj/yDTXHd6AI9XyLfBJU6tTT80TFLIBok9v5lA7gUmIXi7+STppDOnx571xzquiW
         iQHH+D4thG+5Y7JY/jXUQ/YCwf7JlEb6xkOm7MZWjjli58tEvd8ukgBjCzpOQl5WnDgT
         8qyReDE4hBrRImHFsictF0yc6JoBbfXerMEc5zvFK9LeA2hkXq0UO5KuLYGZFxLsXOUL
         3QLdcAhiNAWor5st91MJhqH5UBHxUMBvJoJnDBJVJVXFvreA3iMSMPWZdBRI9x0Qj8gi
         HssA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=hejdxdT776/YXS6vd7fdFoEy259e/wrDau3iwUXTDU8=;
        fh=CQVNc+4yaImxOgv9FbDc+7pA5klkTqdmrhGwqp7KW2g=;
        b=uCfnLQe5pgNCIP7zpg/G9Bsn7lzd15NsImZOjvMTl4kITjTKdCyolcn7hx5Ukj9iVT
         86Cu5hVt2Vqy6lNyvQOCsof8s60bSVGkWMpLttVY0owRZXG1Wvik66ONjMtoNu5pMOYz
         TF/E9XeYjAyLQ2dN6kk/BUHMBloO/sFSNQh8joTaR/SarkGq+d2UXnIRUgLo0FQU9yta
         eZ2lh5pSemBUEWOXvXpgeaWJSE512y0vu7FQj3ZrGdr4nc4AUzO8VPrCMl18JGG0m2+g
         masBbA5qB9iOiggJU44L33/TiMgvc6nRLpF34a2IBEVItYNu4Rq6K+9ERv+R03MVQPON
         r+Aw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AA9rp+91;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-43fb18c57c9si89606781cf.580.2024.05.27.03.12.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 May 2024 03:12:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AA9rp+91;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sBXL2-0000u7-AZ; Mon, 27 May 2024 06:12:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sBXL1-0000tO-Cp
 for qemu-arm@nongnu.org; Mon, 27 May 2024 06:12:19 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sBXKy-0003Ac-O6
 for qemu-arm@nongnu.org; Mon, 27 May 2024 06:12:19 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-35507e3a5deso1595970f8f.1
 for <qemu-arm@nongnu.org>; Mon, 27 May 2024 03:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716804735; x=1717409535; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hejdxdT776/YXS6vd7fdFoEy259e/wrDau3iwUXTDU8=;
 b=AA9rp+913GFa4aMmYTGmfAgf3chrNzIJTjzmFrcKiho2BGrm+wux+T+uw/JcnLIwHs
 6mHPuxW/VB5HeXXVEwQk13w0mIQa9Y8Y447rPMrjXLCgwUh+x2xrTazqYGGZZrbD0vXJ
 l3DSw4QJLpGOxQLl5fL7Sv3K6/YRY5B9bi0oWPoRxkA3kOrFxFYXV6QLDrLWm+qIsxc+
 Z6NVGch8GDbXR7oKLiUIqF594iHhh5gyZ/mRHIiTrC6jHyLXdFZ0TY0KoW4j7drMQ57U
 m7VbjDAhLeZMHbZSCdz/w1gfzae/0IwuztKPSjKNEseqdyZDJ32fwlaQYr9Rb9/g4f8d
 G05w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716804735; x=1717409535;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hejdxdT776/YXS6vd7fdFoEy259e/wrDau3iwUXTDU8=;
 b=efVyAlZaI5ZbWAFVzAz+D3peKZidb5bXB/RDCCx6lvyl6sax7S7vqnUbPzoK8M3JZe
 nCzDf6bCNAmuXNzSMNX6CzSxzyCXR4FJCjSXf5gZXEeyGRFLKJeinq9I7ZM3boaazhnT
 2weI6UJ8bbwrj0RmlkiVvo5Fy4AB7UCc6puDAY3GrZE6X94J1d2IHAyzXQVSQsYmkU03
 nEvMmO4Vz9ZaKjLLmQdBCem1OBYmFPyyMynCjLyGXKt8vR0cBsIvhSNd/Uv7BHJ/6nY2
 Lz1aFYVKDS2ypxwY0e+AXKy5r6POo9CCSmV9eMmnqSfQP2jhjj6eYKIuD8acvJn9geFW
 TI9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWl3trjBrcrr9VUcReXtBywKSRn4JBIDTmULEczvY06+lFrBil/h3cN+Z0XlN6kpcUuAFCzMjpI6+1oy/xIiEEhr42
X-Gm-Message-State: AOJu0YxdfstvSYo90iX/Wb+C7LwwOlzT3iiwUiNaLLsuUoJOkRaboA7O
 R/U308pJBVsFKSBYQkGjEQLaelX/o2tXLvRsb2XNMXnPYYzaGnJB0awd9x+yw4Z3gCIDMaTwwkz
 pWlA=
X-Received: by 2002:a05:6000:11cf:b0:351:debf:a39e with SMTP id
 ffacd0b85a97d-354f757d1a5mr10775266f8f.27.1716804734715; 
 Mon, 27 May 2024 03:12:14 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.152.134])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35586a15f7csm8663904f8f.94.2024.05.27.03.12.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 May 2024 03:12:14 -0700 (PDT)
Message-ID: <27cef750-262a-402a-97fe-c4a55700a376@linaro.org>
Date: Mon, 27 May 2024 12:12:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/12] tests/data/acpi/virt: Move ACPI tables under
 aarch64
To: Sunil V L <sunilvl@ventanamicro.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Alistair Francis <alistair23@gmail.com>,
 Sia Jee Heng <jeeheng.sia@starfivetech.com>, Haibo1 Xu
 <haibo1.xu@intel.com>, Anup Patel <apatel@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Peter Maydell <peter.maydell@linaro.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>
References: <20240524061411.341599-1-sunilvl@ventanamicro.com>
 <20240524061411.341599-7-sunilvl@ventanamicro.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240524061411.341599-7-sunilvl@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: tkdyOcP8nJCp

Hi Sunil,

On 24/5/24 08:14, Sunil V L wrote:
> Since virt is a common machine name across architectures like ARM64 and
> RISC-V, move existing ARM64 ACPI tables under aarch64 folder so that
> RISC-V tables can be added under riscv64 folder in future.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>   tests/data/acpi/virt/{ => aarch64}/APIC             | Bin

The usual pattern is {target}/{machine}, so instead of:

   microvm/
   pc/
   q35/
   virt/aarch64/
   virt/riscv64/

(which is odd because q35 is the x86 'virt'), I'd rather see:

   x86/microvm/
   x86/pc/
   x86/q35/
   aarch64/virt/
   riscv64/virt/

Anyhow just my 2 cents, up to the ACPI maintainers :)

Regards,

Phil.
