Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp2203415njb;
        Mon, 10 Feb 2025 12:35:59 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVFmCnCxcjqvTil76wq5l28NmA7gMCdcBaR2rCUr9MHhSE9tF55bs13AwBknE1wWN7bmdaJLZqICLbOdg==@linaro.org
X-Google-Smtp-Source: AGHT+IHYQWtTmeja9yQOBYHdotQf2XhwkOonF1uYr0kIlfSyVVDst2Lu8Avb4Bfxm/7tEIbsQufk
X-Received: by 2002:a05:620a:29c9:b0:7c0:68af:3c8b with SMTP id af79cd13be357-7c068af41a6mr148000485a.50.1739219759220;
        Mon, 10 Feb 2025 12:35:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739219759; cv=none;
        d=google.com; s=arc-20240605;
        b=aB5uXVahGT5mwklL3EgWNOT9fDqegRaef/ltXy/NSF3oxyNxDnsGR3bY5hulfRsTc6
         Zx43MoIty9LXbl1OfvgozKp+4ukAPIH37It0ltjewhswQ2Iyuy1tTCuddevUOOT1kfZj
         eOpz0qT5F4YGCCJ+NVJ55uDzPU36e7BHBhaZjhdbleBo9a+PSaY2QuSQRBZ1oClTQUoH
         dYNwEQ6wYHUhxMKJex8rShQIzhsXynMzyi/yLYd/avV56cBFIsUUViH8gcWMI4E+YSOq
         5WOoi2ACJB4L41t5zp039FNsckjSOkqkkuxyvgiX6plR9kfp+FFrkMOKuIaV08vhYOAI
         UjQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=1OPLDx3OlnXW7DyyBBfUvXbj6MJEsG2ibdWPRJVsC4U=;
        fh=UuLcsH/bPqKl0B5ONY/Eh/RAPqdyvdeeCia0XFQKrJQ=;
        b=ZUfag8FXVmUVZ6RAGW0z+AdeBsREBHeEk3f9Io9J2IN+vHz+UtDuWSDV4ExwZIeHce
         pihEKGQq5F58gw3Ekurgen2BfU/wDWJsGU+tuCfDYVtlHSZzcw4egST8okdU8N89Gpwa
         6YNTM5GxgkRUQGMaUPNRtu405v2UIwGc0HvyY8owLd7hsCm6rGbTbpm2HMneZIermfMA
         pDdfpB/SGiFWz1nvRuX8z9gxyZfFXl64GXoUYQ3hcNJyBoU1TFxY66RmMGPrqT+AeJhx
         ApSxqPpK9HiYZjOZ+cVjCAOre+ClsJn+W0kZfYsJHyPrWRgBr7tIfOgoxXYrjVAAt1aJ
         hR/A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZNc3zlGe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c04ed7a686si575754485a.404.2025.02.10.12.35.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Feb 2025 12:35:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZNc3zlGe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1thaV3-0001lv-Bf; Mon, 10 Feb 2025 15:35:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thaV0-0001l9-Vf
 for qemu-arm@nongnu.org; Mon, 10 Feb 2025 15:35:23 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1thaUy-0002ZW-DB
 for qemu-arm@nongnu.org; Mon, 10 Feb 2025 15:35:22 -0500
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-38a8b17d7a7so2462543f8f.2
 for <qemu-arm@nongnu.org>; Mon, 10 Feb 2025 12:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739219718; x=1739824518; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1OPLDx3OlnXW7DyyBBfUvXbj6MJEsG2ibdWPRJVsC4U=;
 b=ZNc3zlGeFs8n3DdXnw2yk77hTXlGdbtw0vbP28mYBA7agPOH0ZLheieeaXG9yjZTuN
 PFVnvbcp1T4WcRmlmNvXR4SfKKfeNu/g8yXLSIxWwLjgMZGAVTria7GTTwAHkn1OA66O
 yhSlkIcjMQrd9XRn2Ox1xpbkfkh/CfSj12ncM8ca+xdq3MzWzYIlDruXiBe7bvVivako
 DWaI5fJhmQ5IJyDKD7elg3uy/0ACNrlUSEjSNKW79EMRF+PBBkO3Ri+yLpY843hT7kVo
 nCaZDsSfFfwuv35qMGjt4VzCmoeQwb2+KiGfI/sNDzG5KuyoVWKMVAuabPJikyo5CXwh
 1Cxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739219718; x=1739824518;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1OPLDx3OlnXW7DyyBBfUvXbj6MJEsG2ibdWPRJVsC4U=;
 b=sGagpaWn/soqwxq43iJchePFYrau5FGRjfZTkhJi+T4d/uKqJnQQ4PpvIIYp4AshXq
 /XRvqjpAH7ytxqk6A/WeqHsVQgr967J3xbyHFpUZCGvnjjfthboX1V7XWZhnUa2fuomq
 n75kA4vYWqUUENcM54i+QyV7LTjucgaDlCx9ruyO9cxeFYEh12hDMut1NbrGMHKzw5Qa
 CxC9ol6f+u2ackhwXCdqU42RSxJtPCkAaphFTKIpW8mehL3nm+SUk5oj03jmrge0F0/Z
 lvCTOdY5FhZOnyvR2NxojX1JGSGXMiXLdcVkP+EOJThodZWncWJYbI3bToYGbjmfbnML
 6ngg==
X-Gm-Message-State: AOJu0YzKfVvgV5U14jVuW2NPH8IiFG4tfYcM5epJsARNXy5sl4s85Cdg
 bCEP3qbUotsFNXji0eDSG05ObwNh2EaYYC6I+zDt7P41ZdyA56na5zZOyIvdajw=
X-Gm-Gg: ASbGncuOfFtNKif1sK1IFnpWIlrewhbKnrpIw1iLYRdWlDgXjoR6VWm7XrLjXtrkCeD
 ei4S46fcKRwY+RHEN/fJGzGrVzyZ04fO9MwBJj2XNY/QLPRDhlwq+vI1Y0p+h6S2ankHZGW38/+
 yvxVn48ULBgY7I0HKQcMGLl0ieQS/o/XDAXB5akA5G8ycVUKNrzoPjDLP+tFk4WY+Qr0eEubtTM
 vtk1ZRHz46xfwmhzYEztgniKH7nHoQ5iJY5BDXto23o5AKt5y6SkwzUWJvtLQ2nrmU03R1I3QQD
 dTKQVG/X9e2IG3Pg11KGXnRwYTPHiZYXOGSmdxlcRekVj9rkXFYglmMX3Kg=
X-Received: by 2002:a5d:6d0d:0:b0:385:f1f2:13ee with SMTP id
 ffacd0b85a97d-38dc935f47dmr11658801f8f.46.1739219718491; 
 Mon, 10 Feb 2025 12:35:18 -0800 (PST)
Received: from [192.168.69.198] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dd44c5e3dsm7704453f8f.62.2025.02.10.12.35.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 12:35:17 -0800 (PST)
Message-ID: <029d71fc-6710-4553-9a96-584e544aedf5@linaro.org>
Date: Mon, 10 Feb 2025 21:35:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/16] hw/microblaze: Allow running cross-endian vCPUs
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Anton Johansson <anjo@rev.ng>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20250206131052.30207-1-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250206131052.30207-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
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
X-TUID: uTN85w+PvG33

On 6/2/25 14:10, Philippe Mathieu-Daudé wrote:

> Philippe Mathieu-Daudé (16):
>    hw/intc/xilinx_intc: Make device endianness configurable
>    hw/net/xilinx_ethlite: Make device endianness configurable
>    hw/timer/xilinx_timer: Make device endianness configurable
>    hw/char/xilinx_uartlite: Make device endianness configurable
>    hw/ssi/xilinx_spi: Make device endianness configurable
>    hw/arm/xlnx-zynqmp: Use &error_abort for programming errors

>    tests/functional: Explicit endianness of microblaze assets
>    tests/functional: Allow microblaze tests to take a machine name
>      argument
>    tests/functional: Remove sleep() kludges from microblaze tests
>    tests/functional: Have microblaze tests inherit common parent class

Since there is still an open discussion about what machines to
include, I'm queuing patches 1-6 & 12-15 for now.
