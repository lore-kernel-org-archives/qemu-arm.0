Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp59016njb;
        Thu, 30 Jan 2025 14:07:12 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWoLbB41XjvgTG0lL7l4NIKWvEOF5CPXcNtFUcg/Wgs83lnin0yltfpxfQPo3dt+wG8A15/MfXfCHHP9w==@linaro.org
X-Google-Smtp-Source: AGHT+IEieg8UySTXC+DEyLslZhjbA6D7PCgrLNqPpK59noWFqjZFW7wI/mitZTzHAp5jI2cl5pcw
X-Received: by 2002:ac8:5746:0:b0:467:8630:585c with SMTP id d75a77b69052e-46fd0b6f98dmr142698561cf.33.1738274831796;
        Thu, 30 Jan 2025 14:07:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738274831; cv=none;
        d=google.com; s=arc-20240605;
        b=WqQN/InQmNJWxCUq30DHTNRPrRexS7EJnItwOI1ZRvXTIU8MxzLKYayNSSsolakmIH
         Lqzz8yMKdLbCOSCkkJ8fRql/BfUfcBz37Zqr2sNFByG4v4bselIJDUJTUUSn/SWZNCFv
         7rh8BT/6eVV0/J9RN+LggV6tQE1SPlNuKSJI1xmfvZu+AKyl5rs4Rihx7/mTsLg3Pafz
         3QcgDKVMiqU3XunPh0kuJDu/zcDWEe926TOwsyU5/EN8ibv7awJ0yIrD+/oHkoqubS44
         28SfjwGFUZ4WkigW7ueCDzs7NNDmTfF1fg/iZemHRL8490hCBuuF7/33L29WJ04o6XqR
         sKoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=3DhTxPruFzLIvBQIEPufbWnYLODqX5Zqz9c9MMMl/ug=;
        fh=sgk6UAFYmemndUJRYqSop5+spAAlef1nM1CjYxBraJI=;
        b=ahJz/qSSe6fcwM7EwHh3yaEdNJr8kYFpJCUIYBX74XcVT3owK7ykuKY7b0ph6KZ7kK
         vMYlPXjXrXuvgltX1uYgulghu9MvEjGsR2h7PWpMVkigv3Zc5Tt8nfotjMiiHycF6uQ6
         N7CbgE2KLTQKX86y2PYjIz2kt6vPoI4ev/3RW6wtSGurWMir4puaNL421n41lEYgAP7t
         4ENJH28rB2X6koi+tDyeYzf//ImUBTmLioq73PtPiTL/Kl/MSLh+J3mYz6R2pmZR6Ap+
         AXG+5REnDL3LLV4bXw9QT8Px/LOyBhX9NuleZBqB0MjNTCH9VUr87M9+JVSGMmRMmAJX
         fAyQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mXCGPYAl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46fdf1e21d3si23866021cf.525.2025.01.30.14.07.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Jan 2025 14:07:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mXCGPYAl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tdcgh-0007nH-4k; Thu, 30 Jan 2025 17:07:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tdcge-0007me-UF
 for qemu-arm@nongnu.org; Thu, 30 Jan 2025 17:07:00 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tdcgd-0006Eb-Ca
 for qemu-arm@nongnu.org; Thu, 30 Jan 2025 17:07:00 -0500
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-385df53e559so971419f8f.3
 for <qemu-arm@nongnu.org>; Thu, 30 Jan 2025 14:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738274818; x=1738879618; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3DhTxPruFzLIvBQIEPufbWnYLODqX5Zqz9c9MMMl/ug=;
 b=mXCGPYAl3jmkt72tNxKOczItQzCnWyFB87FS8JuXTF/Kj8Zv+EOxRXA1i7ny2Phb6l
 xCUbDXLJ3tNhvG/fdmo81C/4sw7WeWCmhd7GAR4VE4P0xPhZRXA5jLgoAx80C5J3u9Yu
 DdI6BATXn4Z8NSq26WqbpahFm0sG7PSPRkJp4Hl/qE/OK/48dIsGH4ELeH9p+9hbQGhm
 1ClMzHzvi+KDDQUb/fQFGWi6ZCr/DskGxwC4yLKpyABnamahDMCqOqmWmgx5Agafcyxh
 DH/s/Nzi0zmjzbeDn5jDr2L4KPimZ7l8sK/7sN+qDs26ICewWHhT31bf09ga+eqKevTr
 JJ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738274818; x=1738879618;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3DhTxPruFzLIvBQIEPufbWnYLODqX5Zqz9c9MMMl/ug=;
 b=Q5apk+zBisBT7j5azvgEWVZvL+aElDbQXRauJlDV+GilXRR9FJILY2cKsSHok793sx
 5SZvt7kA6HltDfP0PFZwXMI6yvWiOpRzyBK5lqEkTexdZferoy8oGLi4X76siu7cN8ET
 vroJdEtdu4/yb/Z7CkHeverdKR48KrFsI1gX6xuKm8MO+Sz5ZN5YqUu6UjaAXMXhKeQ5
 DhOEj5dnEUTm611aGU/kYlWaK24ad29VHXAKSL9yvh9xgxTCv3VzuzUOeSP7dq4BgGRd
 MBtbRboo6+9xQSUkzrA3aaIvsFkyvbIQTukR9XNUcnpZs0iJi/hYB/v9hHeeUoPon0cm
 OT3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDBPNv3aur3zBE3+iqUoGIzr4f4wPMC26daGIBZXLgBhiqCxdyxuDSnXKjH2q3Gd8hyW5EIotXvg==@nongnu.org
X-Gm-Message-State: AOJu0YwxoHPOPWK71LTGz2mTu4lLfTFa5TeUWmYy4UqKT6c2+l65FaUN
 zl3Rkq5XVu6ab9KI32X3MthYuwmeIUdzdpj7aIukqqYjZ15/Ty/SZIgDyloayf8=
X-Gm-Gg: ASbGnctoSXF/Ifm0z6Vu/Gt8FFkdG3QwUQLX1ipuy13U9QFBMsZXm7c4dbyYUT8640p
 eM/2+XuPBJzNadnuXDu/onPQPSGZPKQ0PemRKKgwqJeav9+TCbsWi5skYKDg0SGIGGycKnPfr+3
 2EhB4NnS0eEB6J7mpZ0r60gbDoSEcfu+/L7Q+DWKG0K6vtwrn6+VjA2LEhi3b5h+9RPYutz5zI4
 0Oo2wYjebr0r6sTwABwvvvodt5XUkRbE8D0tShphkW28ygqV7KoE8DyLq0mkHhFw8qnOVvA5z+G
 KFUV8BpSjxaiQbGQkITr0THjOZfB8sKEgyhlkpEdjmcprqYuGCu5OjRhlsY=
X-Received: by 2002:a5d:584e:0:b0:38a:8b00:6908 with SMTP id
 ffacd0b85a97d-38c520b0b23mr8475392f8f.54.1738274817737; 
 Thu, 30 Jan 2025 14:06:57 -0800 (PST)
Received: from [192.168.69.198] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438e23d48b3sm37515985e9.5.2025.01.30.14.06.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jan 2025 14:06:57 -0800 (PST)
Message-ID: <ad6875fe-5ea7-43fd-90f1-d8667273f7b2@linaro.org>
Date: Thu, 30 Jan 2025 23:06:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/11] hw/sd/omap_mmc: Convert output qemu_irqs to gpio
 and sysbus IRQ APIs
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Bin Meng <bmeng.cn@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>
References: <20250128104519.3981448-1-peter.maydell@linaro.org>
 <20250128104519.3981448-4-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250128104519.3981448-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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
X-TUID: QuAej4FWE4C4

On 28/1/25 11:45, Peter Maydell wrote:
> The omap_mmc device has three outbound qemu_irq lines:
>   * one actual interrupt line
>   * two which connect to the DMA controller and are signalled for
>     TX and RX DMA
> 
> Convert these to a sysbus IRQ and two named GPIO outputs.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/sd/omap_mmc.c | 20 +++++++++++++-------
>   1 file changed, 13 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

