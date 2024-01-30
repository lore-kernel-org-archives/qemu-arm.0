Received: by 2002:a17:906:724b:b0:a35:eedd:80b0 with SMTP id n11csp679475ejk;
        Tue, 30 Jan 2024 00:35:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEcJy/gKW9KnKvRU/U/R1wkLU3OlIhcwT9amubGHNXyiJgqo1xHIRCteYjyPELBK4LWwmAs
X-Received: by 2002:a17:907:8e8b:b0:a31:8c73:f42d with SMTP id tx11-20020a1709078e8b00b00a318c73f42dmr916332ejc.28.1706603738014;
        Tue, 30 Jan 2024 00:35:38 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1706603737; cv=pass;
        d=google.com; s=arc-20160816;
        b=aQ7IlMUBc0AYSpm/wCAfHU3STqP3CY+C2zOm2Rd592PToC+kPPIcQmGgU35PjxaIOf
         sL+RdKo8Q1BnBABu/uMOxCDWnG4INIeAd52Wde0IM/thvDhhudLiU/i9B7WcE1bBm0Ty
         lDQwWaISXPfiXVreC/X2LawaZjgxWHUbNL6rMsv8qjXVW1k7wiwFbsjOSaiLMNwppwGN
         u9jqS2y121EUOo4FPikwF9ChKrCZ65m0QpftQ0DVlzMqelYODhpxpHO85Cht5xieGEqn
         Ksq7YUtAF3y6ugO/w07firZxFINNaKvqKLgybXiJ6XiOiX9EGj+280NQGVjPUpjyz74P
         3vrg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:date:message-id:dkim-signature;
        bh=+oxqw9LaaR4ABwL+8F2feAdaVXYVhFV1aHt0UfCnPH4=;
        fh=p9JmXSFO4BYuCWkokE3wzscww6mpCulaCbseCAdY+kU=;
        b=Yai1NAzN2eOMn9APfMwcfMkgEzGZr9aEsc9lYpR/eX7L+whBD8fcrW6EIY5FRtA+89
         0WKwlyD+iv09jvO88o5tZNjRjvoJSHaBiBfp7hgVOkM7qTLWH1VsRytsbtktFj45+rU3
         n+Tco/ySDnpklu7GNChJjbdceA2Bavq4V9tCr7b7XJoPqMtiFeNsGT+L6FFxOiyH6dYj
         ZKwWGYcMDlAYbuzuwrEQcbNWI6TARaYyisfuiTTcBJmjrsuqliMub3aZEfEoZV2L0bEd
         3wYs5NQVwfH7GhE1iu2S4znlFUaPeXx1sIQVygdA3o/C5ycf7x2nenGNDuvIwUaBrMn1
         KNGw==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IIsIfaUZ;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-7452-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="kvm+bounces-7452-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-7452-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [2604:1380:4601:e00::3])
        by mx.google.com with ESMTPS id b1-20020a1709063ca100b00a35eab484b9si1145652ejh.894.2024.01.30.00.35.37
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 00:35:37 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-7452-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) client-ip=2604:1380:4601:e00::3;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IIsIfaUZ;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-7452-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="kvm+bounces-7452-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B2F761F2A1DC
	for <alex.bennee@linaro.org>; Tue, 30 Jan 2024 08:35:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40A5456B94;
	Tue, 30 Jan 2024 08:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IIsIfaUZ"
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB6856745
	for <kvm@vger.kernel.org>; Tue, 30 Jan 2024 08:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706603710; cv=none; b=ijTRhBkvsOq/hFuJcZoAAODkNvelBdoLqQoM4Vr+JrhOW9k/2C0FyLE5NgKkCOF4eoPNLDfONCNkxVytI1oPaNv/vfrRoGEA4cml5bydGN+xlnzA9K6JtauQIMvUjwhEDsQbBkk2tgX5ttU3RfKjtOc/vqWi4vz+1g0GzLTQzKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706603710; c=relaxed/simple;
	bh=HQIxLu6LmLbjUtpAlyjsJual9OO+qVrQDqYMtd3XXd4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TGnlxyM0b3eQMCgimLVMuZ4L6D//8+QWAbdw6/ypyPawKvYLfKc9zkzUenxcwbHB+pXBcOX4na64agzmtjs1wkpG27Lx0i2NWeHiLKKABG9Ns4ifnmZceiqwcqGJCOLkExv6cX/frXD9lzCIoduiq2bh3vhCp0+50TLApRQuOzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IIsIfaUZ; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-33ae3be1c37so1378593f8f.0
        for <kvm@vger.kernel.org>; Tue, 30 Jan 2024 00:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706603706; x=1707208506; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+oxqw9LaaR4ABwL+8F2feAdaVXYVhFV1aHt0UfCnPH4=;
        b=IIsIfaUZhBMTR2hzkNwjGtbgKFFIsIpwZLBEYzuCNmYF1YakUoa4/wF2Yvapzg66ks
         7LjaIX8LU0C4eYb9CFP+pH/xEWMBK0GVywB+HgtWQsMXxuW5Tte8gVplegtSg72FW/Sj
         mor9Nei/zzVGY+FXV1vOmZfwcsmfRujO+YA58U85dpUoUWW+Z2E07RlLhj+GG5yT7yma
         lyvQiT0KXXy5u65tmx+ZS+HOGbdP5mLg/1Azb3IRSdmuQj80QRDcLf5/4R8vsXbb1fw/
         iJINFJ83KjC9QyLTLMZVx6mWHtSPoYb94aPcBlc7MPHKz/xOMuBDyom271ywmicKBiwL
         F2RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706603706; x=1707208506;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+oxqw9LaaR4ABwL+8F2feAdaVXYVhFV1aHt0UfCnPH4=;
        b=d3FdoXFvtymrbZLz3PcyVqM4oRAOYGhd+DtErZpPoqBc4CeN4ieSp2po1osPjc34IP
         YQLceflST2XM4jWDAtSMiMFU7tP9jFivSt72r5le52DjMQy2jmskJBgQ09b3KgPj7KYC
         MvVpv++qMkiYonL8wqAn8UUgICuVyNHH+hWOU0ZgW+RTHL7IXFbizDGJZlJnkRGx77Xo
         JStCmeOMCR/fk4uninqxp4J4ge5ijIhEH8PJYqZQtSwpSXgdAWqD61D6ra7LJcEExhZV
         5EOjKPPeMYxf0N1ysc6yMTvY+Ej2Ku1qR/exsA7ZU6XfbCBbZOvAcv83jfBwxIWgHPuO
         +Wmw==
X-Gm-Message-State: AOJu0YwJEtxaGfy92TGV9pvXHOasSZQsHBCM+TMx3VrlegLOcCtzwmns
	URKC9oopm44411oNOWq/NfNjYcSr9qMf5ijlJOi/XZWia6uhVSJG7s5h2bjBVww=
X-Received: by 2002:a05:6000:12ca:b0:33a:d28c:222c with SMTP id l10-20020a05600012ca00b0033ad28c222cmr723780wrx.11.1706603706469;
        Tue, 30 Jan 2024 00:35:06 -0800 (PST)
Received: from [192.168.69.100] ([176.187.218.134])
        by smtp.gmail.com with ESMTPSA id o4-20020a05600c510400b0040ef7186b7esm5150644wms.29.2024.01.30.00.35.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jan 2024 00:35:06 -0800 (PST)
Message-ID: <1d4cc1d0-7230-4654-b534-339de480a5a2@linaro.org>
Date: Tue, 30 Jan 2024 09:35:03 +0100
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 22/29] target/riscv: Prefer fast cpu_env() over slower
 CPU QOM cast macro
Content-Language: en-US
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org,
 qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liwei1518@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
References: <20240129164514.73104-1-philmd@linaro.org>
 <20240129164514.73104-23-philmd@linaro.org>
 <c1604184-d470-43ef-9530-cb8c0e5c8901@ventanamicro.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <c1604184-d470-43ef-9530-cb8c0e5c8901@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: OamguTs/a1ww

On 29/1/24 22:53, Daniel Henrique Barboza wrote:
> Hey Phil,
> 
> This patch is giving me a conflict in target/riscv/cpu_helper.c when 
> applying
> on top of master. Not sure if I'm missing any dependency.

My 'master' was commit 7a1dc45af5.

> It's a trivial conflict though, just a FYI. As for the patch:
> 
> 
> Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Thanks!

