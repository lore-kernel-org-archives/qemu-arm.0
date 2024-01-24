Received: by 2002:a17:906:590b:b0:a31:23a7:2a34 with SMTP id h11csp599969ejq;
        Wed, 24 Jan 2024 15:10:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE9qQ/aDlrI6CYQIKLGCHjQI+viBJ9It1ke0/xS0hY8lkF1Wb7ztzw7YPD7HUcwvP/n6Z2r
X-Received: by 2002:a05:6808:2125:b0:3bd:cc3b:294a with SMTP id r37-20020a056808212500b003bdcc3b294amr2422643oiw.8.1706137835358;
        Wed, 24 Jan 2024 15:10:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706137835; cv=none;
        d=google.com; s=arc-20160816;
        b=uGDMTlU0ArLzaHZs3N6ywDOh33QwFqkmtuEan+OeDDdWyPNCyYqNxhg76YInM7aFDu
         1I08BvkcHAF0xMfpN88NgDaKXIkPyUGj4yGLTbhPQIcc++lKb+WCQuAwxCu0L3UzbqoC
         k83ZHz5L98GsSW6koYrOLnetjbVAFF6PeytW0bCMoXjAFiEtRM1iFCxp9gIQVe4ppoGJ
         TPpX54wuR8V394cO90nPE1TR3mBZuSrJeUdufLXalNgQvluEqiZMnnG69b9/rKfXJoIu
         skxFNOqgN8T5gJzJC1Gautztc+bKwfPPEeghPhWhj+vRDQWlehKT4JC+nmVFU6KD1jOo
         pPmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=FPJsYTCrrJYmiIpsYm+UwPIHv7Gtw161W2iaz3Rf7Jc=;
        fh=BV2EuOiWf6AH5YN8lynj7fi/DnpKhO3Y2LPVLIls540=;
        b=0Clc5CdFev2YoNpSpi5l6bPwb3LQu25LSPD+6lB7ylXN/zAEhivuVlgvg774dyy2/j
         DRUHyN32E6OF2MFVrB2ElPW255qKZ5Z1HuXKHmFGTmcm1yyIyhgcxFIxwVK78tpHx71R
         yxej0Q9KQEuRvjBWwNg4xAcA5oe9USFebRFO/HCIOXxDTSZv88+vgB4IQKk3ahSTrwIL
         e4VTVXq+a4wble5q3mDzVsu+ugghnAqAjAO4MzLVy/I+KhIGsf1e2diEkgrYi6K9oF5X
         uR/GHguleMSsw91vGVLJjhRMERbwSQJK1kn8Wx2I9TNtNDb4N/b/HmMalRmhceew6K42
         vrvA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qJd9Npid;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m7-20020a05622a054700b004283d581a5asi11553875qtx.628.2024.01.24.15.10.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Jan 2024 15:10:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qJd9Npid;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rSmO3-0005kn-8v; Wed, 24 Jan 2024 18:10:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rSmNx-0005iC-Qx
 for qemu-arm@nongnu.org; Wed, 24 Jan 2024 18:10:23 -0500
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rSmNv-0002Fe-Vf
 for qemu-arm@nongnu.org; Wed, 24 Jan 2024 18:10:21 -0500
Received: by mail-pg1-x52e.google.com with SMTP id
 41be03b00d2f7-5cdf76cde78so3405692a12.1
 for <qemu-arm@nongnu.org>; Wed, 24 Jan 2024 15:10:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706137818; x=1706742618; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FPJsYTCrrJYmiIpsYm+UwPIHv7Gtw161W2iaz3Rf7Jc=;
 b=qJd9NpidO3ngqu14ij0CFDlKEAxW5ogQTNnln65GAY7PEKwGq9iN8kUaeydaQ9IqNZ
 js+hZNXFx2vw5FA9xw+Xg2bUUZIrLWTj5S+DXGFkm1bPaTpqwNPqzFMcOTfF6zOwbndD
 4lwiTPVWzwi65gV2rlKzZl1SZUjjHs5QirNdFRNPYISzckB8wq+mk7ssFF9JMcnE1qzo
 +k81fGLZRE/QZQXLc0GKNBnzN5aOv+rkAxo4nAI2OsBSkh+vtEqjx7UiHqLLtzd6TOdg
 T2OOc4mHo04i3iuNBSFFIWr3kPryswDDpPSCZoad86e7XLQPkEqOYdXo2vEVuC1nDqD1
 /9HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706137818; x=1706742618;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FPJsYTCrrJYmiIpsYm+UwPIHv7Gtw161W2iaz3Rf7Jc=;
 b=kQW5u9lZA4IpbGIS9ZL1yOL0ucYZtJ34Bn+JfQjUq194ETC5j6muCSrPHXocfn7zx2
 oLOuL5NPX4HrSdUQbrWcFWFCfqi0+guxmTBcIbviB17FY3jcYmLZjtK8qGTKS8xGMAL1
 4kU5XbU8PRVIqnsuPYeUbqcCLljt8Dd4ZGMDqiwBdJzZLsN9RW763X33Hv6/wW/m61lq
 PY8Jf0d8k0U2k4Q8ZJjosANyCVp15hpCWuO/6Q90y+iDh9vMyZuZp4QdF5JBt3KCPtPK
 pJc19vMD8qEs0baUgSo8hRLw8JUc187ausJyyIdW0/eoRGFS+HfwQmaE9yUF0QYIqStA
 tfQQ==
X-Gm-Message-State: AOJu0Yy+h7P7pp20tX5SQBoVPh2tU5hQnWxoO4sWPS2ZMZrs1AARHw6/
 GWinpmvqS6XijGGNHjHQS9ZsdN7KaWNR2OkBes+XzWN+l6Rjbxz8EaZewknH2vs=
X-Received: by 2002:a05:6a20:da8a:b0:19c:68da:777c with SMTP id
 iy10-20020a056a20da8a00b0019c68da777cmr166938pzb.52.1706137817866; 
 Wed, 24 Jan 2024 15:10:17 -0800 (PST)
Received: from ?IPV6:2001:44b8:2176:c800:5fcf:9e3:2e58:9c7?
 (2001-44b8-2176-c800-5fcf-09e3-2e58-09c7.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:5fcf:9e3:2e58:9c7])
 by smtp.gmail.com with ESMTPSA id
 d1-20020a056a0010c100b006dbc750ea5asm9684090pfu.196.2024.01.24.15.10.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jan 2024 15:10:17 -0800 (PST)
Message-ID: <5b1c79c7-746e-4558-8512-573084755c29@linaro.org>
Date: Thu, 25 Jan 2024 09:10:12 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] hw/arm/zynq: Check for CPU types in
 machine_run_board_init()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Rob Herring <robh@kernel.org>,
 Joel Stanley <joel@jms.id.au>, "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Gavin Shan <gshan@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 Igor Mammedov <imammedo@redhat.com>
References: <20240123222508.13826-1-philmd@linaro.org>
 <20240123222508.13826-7-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240123222508.13826-7-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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
X-TUID: BC++H+gudU5Q

On 1/24/24 08:25, Philippe Mathieu-Daudé wrote:
> Restrict MachineClass::valid_cpu_types[] to the single
> valid CPU type.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/arm/xilinx_zynq.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
> index 66d0de139f..6ec65d4780 100644
> --- a/hw/arm/xilinx_zynq.c
> +++ b/hw/arm/xilinx_zynq.c
> @@ -355,6 +355,10 @@ static void zynq_init(MachineState *machine)
>   
>   static void zynq_machine_class_init(ObjectClass *oc, void *data)
>   {
> +    static const char * const valid_cpu_types[] = {
> +        ARM_CPU_TYPE_NAME("cortex-a9"),
> +        NULL
> +    };
>       MachineClass *mc = MACHINE_CLASS(oc);
>       mc->desc = "Xilinx Zynq Platform Baseboard for Cortex-A9";
>       mc->init = zynq_init;
> @@ -362,6 +366,7 @@ static void zynq_machine_class_init(ObjectClass *oc, void *data)
>       mc->no_sdcard = 1;
>       mc->ignore_memory_transaction_failures = true;
>       mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a9");
> +    mc->valid_cpu_types = valid_cpu_types;

Same comment re default_cpu_type.  Otherwise,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

