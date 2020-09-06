Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp2737415lfc;
        Sat, 5 Sep 2020 21:00:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7Uv+uGuoIuCo316mjtn67/AZxFgiR6PRN5pMXXi1HOgLueBbU/nTd2txon5D80alw7tch
X-Received: by 2002:a25:d70e:: with SMTP id o14mr9754790ybg.508.1599364810956;
        Sat, 05 Sep 2020 21:00:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599364810; cv=none;
        d=google.com; s=arc-20160816;
        b=vht9zpC4mVMR7vrQ/yx3dsiVmtUVYH2aHpnFZy/ThYZypSj9slPjV6I5TieqlEx2AR
         x0+LnBZuC2s25JHcPX/k18hHW9VoPrfY0LY6m4QBtSxbbYHzcBM3tkJ6qiXFzNixa3Ml
         Oh12O7E0pZB8eVC9Em3PwR/U6n/U31bHXC0Sajh4H1TukpyWeipEbVssOVS8SjhGSeNq
         8ECHOmRz6SoY0CGUixIM8BtxV3MmSgk8GVt+Op5BnSPHyqgHyc3qiJMqc3kDg2y20g30
         0rPINJOVKEth14t5CjrdJdyt9tK5lA9EYTsPA5Ltx7dvZCTnGpCa777yXjDD/0oYisH0
         nVYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=5lybWbpOHe/PDWuXx4ITu7hdnEIIfq2Qd0mXlGdbAfk=;
        b=iI4kTc1WMVPx2weq1/xP9BvhiEAjFugcmo859hcy405RUUm0uYqdqhhnEK0SoO3Cnk
         loMfm4i9AmdHIUcZKd93x2KEy22fGYw+LhSQwMy2hHbBlPf183zA5GK4pZvthwFT9wtG
         N3NgGt0Aatk8Gcv5SLflxAqt71tiOqlN4m6NOX07RZnGBARPoEPC5QUxjvAr+ldCsmSh
         MSheyxN96T9evKfTN16Mw9oyG3uvG6wDjpCBTC18dMwTeldB8vkGG3kESDTc4Y8H+vVt
         NleZ3DHg+HOc0s9w7uSu5AEV8lZCJr7yP0EHm0IfdGV6xRlgC7Th9GSPhOy7Y/1xrL52
         hqCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="m0WPo3/z";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d1si11134872ybe.473.2020.09.05.21.00.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 05 Sep 2020 21:00:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="m0WPo3/z";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kElqc-0008QC-Ch
	for alex.bennee@linaro.org; Sun, 06 Sep 2020 00:00:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kElqR-0008PG-V2
 for qemu-arm@nongnu.org; Sat, 05 Sep 2020 23:59:59 -0400
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:35039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kElqP-00057R-HV
 for qemu-arm@nongnu.org; Sat, 05 Sep 2020 23:59:59 -0400
Received: by mail-pj1-x1042.google.com with SMTP id g6so4851891pjl.0
 for <qemu-arm@nongnu.org>; Sat, 05 Sep 2020 20:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5lybWbpOHe/PDWuXx4ITu7hdnEIIfq2Qd0mXlGdbAfk=;
 b=m0WPo3/zoh/ujdrUw5tueEGqrVuvEoneL1l6my7dBoD3rU5h2e+gaa205FgJ8952GJ
 08r5nfG0ZGP35uKitFukky+6ZuX3mMuvzjWcS1ct3l1f7yQ0l76s8WVgulOxr2riMdIq
 eItwwwWfim0Llat8RPPIcEStuoO4h9/b1QOMpz7S8BCyw4GNiSY83ST80CDL/ItEO0Oc
 QmEgFHwmtQtyZ5l4pFNK7N/hrj4R65icFQkNtskThCr4Y8Az8YRGSnvZQ0twQeW92O8z
 mhyNvaMZTM/X0uWt+yNlLZthYT3O0u3BZsqxCGCdxk3k7aRZ84cqyWN5qZ5l4xXYxSvq
 YF0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5lybWbpOHe/PDWuXx4ITu7hdnEIIfq2Qd0mXlGdbAfk=;
 b=i7QcTIs7kYzL+oQvWYSRWebrNCn46OMjBBda/kHk5Y1urIIlpNouK9P+aYVe7oSrwq
 BnGH0RvnxvTLifmo6w4yWz06wpPM/Gml5/9iHsKycJk5DAemnPiTvjecqS5hdABbf4Hb
 hkaF07xNnm9FFLyLF+RysFQBbWPkzX8JY7xQYcC/c1s6F1zCK5/9PS/Rb4qMwmhbQv+C
 uUSMtjEcHdX5ZGVfI2kidSde8kqLEePJ6a5lt+kPiazKr5fZHEQOBVe7U5hL7apPuRDH
 6KgVjq3rhNggT46ivoB05We71sAGgWGGAXoMky6Aly+zAT+auNj4Po88rq46tqFMLGcu
 73Ag==
X-Gm-Message-State: AOAM531I4t5KjQpqZiR6Pv0YlA0D1bosvrSEqlEnMjpSWO4F1O9131yM
 MZ9uIC6malrjm8XaIoYY9Vm5Eg==
X-Received: by 2002:a17:90a:ad48:: with SMTP id
 w8mr14820945pjv.179.1599364796430; 
 Sat, 05 Sep 2020 20:59:56 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id t5sm8710221pji.51.2020.09.05.20.59.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Sep 2020 20:59:55 -0700 (PDT)
Subject: Re: [PATCH 08/13] dma: Let dma_memory_valid() take MemTxAttrs argument
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20200904154439.643272-1-philmd@redhat.com>
 <20200904154439.643272-9-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5adab944-14a8-6f68-bbcc-92d193db554c@linaro.org>
Date: Sat, 5 Sep 2020 20:59:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200904154439.643272-9-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1042;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1042.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.107,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Richard Henderson <rth@twiddle.net>,
 Laszlo Ersek <lersek@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Beniamino Galvani <b.galvani@gmail.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-ppc@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ij9gujYCIT3a

On 9/4/20 8:44 AM, Philippe Mathieu-Daudé wrote:
> Let devices specify transaction attributes when calling
> dma_memory_valid().
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  include/hw/ppc/spapr_vio.h | 2 +-
>  include/sysemu/dma.h       | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

