Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp3166894njc;
        Tue, 5 Nov 2024 15:09:39 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUohVqEQwFbd2a1hHv7kcy2CF5VznLZpomA3nvkp74w6/cDqX3/TGQJPmg52o1uqjl2HWySqGIvNsxNtA==@linaro.org
X-Google-Smtp-Source: AGHT+IF+tOQYnJZ1+JW0cS9ia2pfBHivmk7XS0WhWTjIAjMPhTIkFe5E9ezBDE/9pYgqlzHL8LFQ
X-Received: by 2002:a05:622a:608:b0:461:2231:67a4 with SMTP id d75a77b69052e-461717069f4mr350330301cf.33.1730848179603;
        Tue, 05 Nov 2024 15:09:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730848179; cv=none;
        d=google.com; s=arc-20240605;
        b=U3H/6xJSVYhfebmMNM3792RxXxOm8iWxHjo2ga8QFFj2mI5IykXOtRy58N0oJvOs5i
         XoZZAloMbSRGL106iD7l5rZIAEalouTD40k0wiXTX7mkp1u/IxMBZubgD05sV8K9Gpri
         Ht4m2dAje7FxQrISeMhqawkZau3bTQzbnK/HPS0LO0wX8CodGsXfl9TexedURNHG1hzo
         Kn4tkYS55Rnim8zDkbkXhKoc2RWEXn4202CQVAbYr4SKaDIFFMzgDLnza35yi0cUaJRq
         MBqxxR5ps0Ib5bhCZ1Zqr7ULQoJYHypoFY6N99tV9HCgPfRMBpjM/NCPZU5NSiGcATWf
         uYcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=t/NQLrzwwv4LD/AoSk7Qyb7P33D2c03EZ4weY/zvYNg=;
        fh=4B724TscFq3YgxLfBn8L4mbf53yx01ZW5gYXbOluzT4=;
        b=NMwCSnfu/t4d/EjhlnHHvtZXnxxW2b5rNrxQ4eQR3YiNH6O0A/tHxXSxC0LWk2MP2H
         6ZPZFfUF5T30/zP+4c/bsqspHTB/aCn7MOyynczTBklT+Jb6psvZmZQdy38oL35wN6JP
         WH3KGMyuMUAgLIMHjdG06WBon01RJ+HwtZxcBDS2aMWT/HnwJa1j1hAPEUpFbpN6lec1
         33uwFdZ6icRY1hvE/U/15iMSX3l561YAIM5WLpP/FQHdaHD1387OAvhCgaiUXTQljCeS
         h+6a2LtG4qqaT0Pb/cgCuuBP2Sr/eseMqO815uLfz7HY+vmfIs1yt2UkniPscMYMN5qE
         63/w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="YOjPOMi/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-462ad1eb8ddsi140351361cf.418.2024.11.05.15.09.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Nov 2024 15:09:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="YOjPOMi/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t8Sfx-0008OL-5n; Tue, 05 Nov 2024 18:09:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1t8Sfu-0008Kt-Ug; Tue, 05 Nov 2024 18:09:26 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1t8Sft-0000Vp-90; Tue, 05 Nov 2024 18:09:26 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4315e9e9642so51956225e9.0; 
 Tue, 05 Nov 2024 15:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730848163; x=1731452963; darn=nongnu.org;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=t/NQLrzwwv4LD/AoSk7Qyb7P33D2c03EZ4weY/zvYNg=;
 b=YOjPOMi/tbgBvIsf/hJCyIpcMKCdioh6YHRxVXjig9zJRc5MvH2qa1rUDwLhJFoCFT
 mVPlHfHrb5gY0aGY5m3afom9DcKW4peEryTYd6h/XTYZ55qb/bohBVsQTrsHmoKXSRSM
 zfwwwuTar3SaqEYI2GblSxlDyLR6I92LsuWA4GpAg2zrEGJm2za/63U+/UwhMXDfkkaN
 8khFiMlxKsCZWbEFPgStYSO/nGTWEQBLngZ20cYckrMfH61KynhVPOSm4OE/xHKamUac
 yYh3YnRrDKXLaOHyU0J2DPQ/AE10PD+xhY0zLXvdc81Exh6NoGnDpjnI3U3FEVywo7Lu
 PySw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730848163; x=1731452963;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=t/NQLrzwwv4LD/AoSk7Qyb7P33D2c03EZ4weY/zvYNg=;
 b=aephLRdgs0FtC9OxmI0KuE93NJfjkzQ7tkmD4m+khvmUh041nkJNe36Lwg5F+zV3Y6
 tuSBESQAGivMwY6uO97JXTf4QTZ+Pd7ZHYlNFF+QaGMOVjKbk/JSYpMBPYFUDQ2uBI5b
 YdOs/8moVA2CPkuvhZ6CH8X9uSZQUGWnktPjHwz/JV20dS9N0eYQ2xAPmSfa42/3g0df
 x5iSpQFM+IZaSJvXEwgiqoifJc3uvIKyYrq4QZvU9na0mrXmiV+9KhqA/pFzRSMwvE2s
 Jfe+P1Z2Rdbv8xFwFbaps96zSbPrfqX3b55oRSWa9yN/97FXiQ1a5+YmbBPo1geutEph
 ctYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGh/ePKRJz4oqZEemHoxgO3Oz5s+ev8G6QXRl1EmxpTnRVIEb9a3m+jn0+g0Gy+xcSkgoS6YW7Og==@nongnu.org
X-Gm-Message-State: AOJu0Yx21QitlFIQEOJtD4TCj3qdvyTHPdcIXXk/2XJchNUB1EthW68G
 5vY0XLtS0nANyWvhLbzxnd1ozbfVOm5ooSIPMlnEyFxI+IQILRzWE5YtFgVKxb4=
X-Received: by 2002:a05:600c:3b14:b0:431:5c17:d575 with SMTP id
 5b1f17b1804b1-4327b6f9521mr182561145e9.11.1730848163000; 
 Tue, 05 Nov 2024 15:09:23 -0800 (PST)
Received: from gmail.com ([89.101.60.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432aa6c6569sm1470165e9.21.2024.11.05.15.09.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2024 15:09:22 -0800 (PST)
Date: Wed, 6 Nov 2024 00:09:22 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Anton Johansson <anjo@rev.ng>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 devel@lists.libvirt.org,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 10/19] hw/timer/xilinx_timer: Only expect big-endian
 accesses
Message-ID: <ZyqloqhuRL0R_n_d@zapote>
References: <20241105130431.22564-1-philmd@linaro.org>
 <20241105130431.22564-11-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241105130431.22564-11-philmd@linaro.org>
User-Agent: Mutt/2.2.12 (2023-09-09)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-TUID: VwafeYk0Yfd1

On Tue, Nov 05, 2024 at 02:04:22PM +0100, Philippe Mathieu-Daudé wrote:
> Per the datasheet (reference added in file header, p.10):
> 'Register Data Types and Organization':
> 
>   "The XPS Timer/Counter registers are organized as big-endian data."

Haven't checked but pretty sure this will break things the same way as
for the intc.

Cheers,
Edgar

> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  hw/timer/xilinx_timer.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/timer/xilinx_timer.c b/hw/timer/xilinx_timer.c
> index 28ac95edea1..3e272c8bb39 100644
> --- a/hw/timer/xilinx_timer.c
> +++ b/hw/timer/xilinx_timer.c
> @@ -3,6 +3,9 @@
>   *
>   * Copyright (c) 2009 Edgar E. Iglesias.
>   *
> + * DS573: https://docs.amd.com/v/u/en-US/xps_timer
> + * LogiCORE IP XPS Timer/Counter (v1.02a)
> + *
>   * Permission is hereby granted, free of charge, to any person obtaining a copy
>   * of this software and associated documentation files (the "Software"), to deal
>   * in the Software without restriction, including without limitation the rights
> @@ -192,7 +195,7 @@ timer_write(void *opaque, hwaddr addr,
>  static const MemoryRegionOps timer_ops = {
>      .read = timer_read,
>      .write = timer_write,
> -    .endianness = DEVICE_NATIVE_ENDIAN,
> +    .endianness = DEVICE_BIG_ENDIAN,
>      .impl = {
>          .min_access_size = 4,
>          .max_access_size = 4,
> -- 
> 2.45.2
> 
