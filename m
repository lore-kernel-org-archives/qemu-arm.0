Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp3237440ejb;
        Mon, 27 May 2024 08:17:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVQxQ6ptSO5huqWAuGtmCb5gXEJsmHidJIE8hNZrG8AORQ2JVaVpInfECIuFtTyrOX4XzTfLlqiFe2cw2Ik63zzHiV4jUuV
X-Google-Smtp-Source: AGHT+IHqKKVpc+sQ4xuQ+VdjEK6/dLHlWfe058GIl/czn/YGnQ+DlGt+pnfmZyJdIb1V4dQktPd8
X-Received: by 2002:aca:1813:0:b0:3c8:49e3:c0f1 with SMTP id 5614622812f47-3d1a538c548mr9607648b6e.5.1716823034213;
        Mon, 27 May 2024 08:17:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716823034; cv=none;
        d=google.com; s=arc-20160816;
        b=fl/Kr/gqy/aPkQ//Vd6lEC3o4Cew41NnwM+TUpvXSgZ9X74Ltg8eldIKBYQdL8yuxu
         AhbXxRor90F3xw4hptUcEWc0noUsQWSCMnm+7TuZ1C1wc1M1HofNvFTGCj6DpPN2+oP+
         nYOd7JiZz6pZcnXsj+/qrtarC9np+3nAANzecc4aZ9TwWo+ck16TftGDPlAmpagaF635
         IO6qXd1y1f41ydyFQzA/EFWqwF18RGYC1KXbu9rN1o0nGrN5P416XGSVSxMngdNTiC9g
         kNQTsm0qHJMU+UO/NU7ZMQGXeKIvdhO05hqjykTArH+6P4hMa4rcbMZYxgSpNX4AK6sY
         2A3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=YNZCKIEg/wB7FBJ60uujpf+diVNX2hoPtBar8fDBLso=;
        fh=A6Z9aWHqL3vBX2xTE7mm2Jr8n2JCZbvSCxFWUa3C/9s=;
        b=kM8q7/jEKwJau3NILdtpbNL4/cteMia8NOQ++i9bXgd57T6cx+5nmGww10m9+zmfk2
         0cP9Q/pB5JcOlSSYiSr1HEONNobLT6uTuzd9tixpndQXgYViBFkS/imfazxZawxYvS4i
         u27GEW7iyACw4yEwtNUMil2LKYpRwei08c9Rluat4kUmbcMuCccfluOlAUFvb5XvGuaw
         OE/KFEDMRRoSOProHYnfZo1CpF847awveLfx8Zfvvn+CzdF/08LDLol7hoS3NnVt/04b
         hEb+lbaZM/7aQayOhFHyWRk/8fpych9Nxv4KbmWPrSnGN8QoVH99uTqZUGH9AXS9rvC2
         f/Rg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=Ou3An3L9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ac162b358dsi81252906d6.469.2024.05.27.08.17.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 May 2024 08:17:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=Ou3An3L9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sBc5p-0001tk-IW; Mon, 27 May 2024 11:16:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sBc5l-0001ph-6q
 for qemu-arm@nongnu.org; Mon, 27 May 2024 11:16:56 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sBc5a-0008TX-Sk
 for qemu-arm@nongnu.org; Mon, 27 May 2024 11:16:52 -0400
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-6f8e859eb20so2701280b3a.0
 for <qemu-arm@nongnu.org>; Mon, 27 May 2024 08:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1716823001; x=1717427801; darn=nongnu.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=YNZCKIEg/wB7FBJ60uujpf+diVNX2hoPtBar8fDBLso=;
 b=Ou3An3L9pqcy9wt2QNnRtpKQ1QROQ/xyy6Fi1DEh544yoaPPiPw7FAiKIMjsJ6FENg
 9AfyM5C/qfHaXRlqkinUnoa6jVm6KCF/dIFIkSsGZcg2b794YT45zpv2tl3yxVlg8HNs
 EDZyGH29y8D1f/o9sMnyTWgQDDB6hCRFHT59s1JVX9zuIEIFlLLCVTFw8rF0u4NxKhg/
 w6BJpgZVA9eu1Y2cQtaS28M4UkpAMeO7MQ9sdkKs8ufTtdR/0CEmKffTYnKiLXvfiYRW
 3WbferVNt3aRuXWwv8RUlXeCzJYFwqEmQ5aWB4vzhLilxFQyLKGDWIZIzp/6nV93QYtR
 fBlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716823001; x=1717427801;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YNZCKIEg/wB7FBJ60uujpf+diVNX2hoPtBar8fDBLso=;
 b=gnHxeiSLd9WgWZhveUazG+UOXE5G2v9fCWKkV38Atv6/S4A9GUsA628T336vLuEmRG
 g8UKRdrOOfNwFMHGLcuVTjsaoWNV7vx3eAT5pRZ8S6aZnP7LDzKeB8hidJWKAUiHsd48
 wfuYfz+LtoYWxslJ//NUfihEGjNppzLiMYtXZyaLCDj/aOheTv+32PpjBheukV/IvZNp
 IMKw3GjIZWK4WhgDv1mSg0m1a78preJZN3gyCmqtkdLiUzicas+gu7fNKWfcsuR+mUqU
 JG7RB7RgLnpsXxeutDPfVCHd9zcPni16hmF3ATb4uO7fJAJ0OmZ6xpUvRSfH+rWmVSA4
 Wdnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFxSaFZhTNj0faEb8MpXjixSf8FdMtNg85BFsoBJasswNXgnREc3jlhidOKzwwPcTHWOsnQrf1QkrEhYAyb5jP4b0h
X-Gm-Message-State: AOJu0YzIeauhbYGVYZdQ0IjXFTTzfmP4R1fsKlfyU6DKXvF43EfhKJCe
 T6kQFiz90t8pRQUvqcHjs+uNkD4ajZU4EQ3LbbL8nY7Mq8xJyytPkD3zkSIp4IY=
X-Received: by 2002:aa7:9a85:0:b0:6eb:6:6b72 with SMTP id
 d2e1a72fcca58-6f8f3b454a7mr7501875b3a.25.1716823000697; 
 Mon, 27 May 2024 08:16:40 -0700 (PDT)
Received: from sunil-laptop ([106.51.188.31]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-6f8fbf2e3d5sm4986549b3a.9.2024.05.27.08.16.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 May 2024 08:16:40 -0700 (PDT)
Date: Mon, 27 May 2024 20:46:29 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Alistair Francis <alistair23@gmail.com>,
 Sia Jee Heng <jeeheng.sia@starfivetech.com>,
 Haibo1 Xu <haibo1.xu@intel.com>, Anup Patel <apatel@ventanamicro.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: Re: [PATCH v2 06/12] tests/data/acpi/virt: Move ACPI tables under
 aarch64
Message-ID: <ZlSjzfSj8MwDcJk6@sunil-laptop>
References: <20240524061411.341599-1-sunilvl@ventanamicro.com>
 <20240524061411.341599-7-sunilvl@ventanamicro.com>
 <27cef750-262a-402a-97fe-c4a55700a376@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <27cef750-262a-402a-97fe-c4a55700a376@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pf1-x42d.google.com
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
X-TUID: zh96X8CGKwHf

On Mon, May 27, 2024 at 12:12:10PM +0200, Philippe Mathieu-Daudé wrote:
> Hi Sunil,
> 
> On 24/5/24 08:14, Sunil V L wrote:
> > Since virt is a common machine name across architectures like ARM64 and
> > RISC-V, move existing ARM64 ACPI tables under aarch64 folder so that
> > RISC-V tables can be added under riscv64 folder in future.
> > 
> > Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >   tests/data/acpi/virt/{ => aarch64}/APIC             | Bin
> 
> The usual pattern is {target}/{machine}, so instead of:
> 
>   microvm/
>   pc/
>   q35/
>   virt/aarch64/
>   virt/riscv64/
> 
> (which is odd because q35 is the x86 'virt'), I'd rather see:
> 
>   x86/microvm/
>   x86/pc/
>   x86/q35/
>   aarch64/virt/
>   riscv64/virt/
> 
> Anyhow just my 2 cents, up to the ACPI maintainers :)
> 
Hi Phil,

Your suggestion does make sense to me. Let me wait for feedback from
ARM/ACPI maintainers.

Thanks,
Sunil
