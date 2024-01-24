Received: by 2002:a17:906:590b:b0:a31:23a7:2a34 with SMTP id h11csp598438ejq;
        Wed, 24 Jan 2024 15:07:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEoB3mGVVY5Q4k2ZxHAqM1ApOhSiJtPnjO2TaVdZb4b1wEyTL+qs8HvrM3HRHo0pkFAqqki
X-Received: by 2002:aca:2306:0:b0:3bd:a720:17bb with SMTP id e6-20020aca2306000000b003bda72017bbmr2153192oie.89.1706137625517;
        Wed, 24 Jan 2024 15:07:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706137625; cv=none;
        d=google.com; s=arc-20160816;
        b=uEsMmd0ngfKwEoSKIV6SuQtKJ/GvYYmiZHtBVSqSi1k9FlBAl2QfZsa83tHTnYwWqL
         sMuTqxex56H0Jv6uciiiruALLVBqTfC09UgeNdtCLcDQzcZcBtx3oVKQ+eXfPiA254PG
         pbXtk0m0jTYXURMVcWzfHgp3E5i+UsbQHjEcy2owZ1SnVv8PWBoRDDy7P/nlUcw7zSw8
         +WRh8GGI+Xk4XzxZN0IOEZFYHEw5chofOpxhpmYpsV9r1sVVduSjTKWqVLirjkpBHLxi
         ZjlUQtMqTVUCWcmMXUu0Z+Ycx03LHVhGSrCVO9cqaAcZBG2yOKt6IqKZEHLUdsmPahL2
         yuXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=tZ1IRVJ+J8fP3n+3NMnre9iiPDxgX73g7q2tr64l6fc=;
        fh=BV2EuOiWf6AH5YN8lynj7fi/DnpKhO3Y2LPVLIls540=;
        b=QeKAT0VCCS33R4QeeCMYvfAQMN0w3Uo7RdM9T0E2puSPT0ZRpzLa5BLuWi6rIfy2EA
         DQ6A0YVxKIOxtevAkKJ2AgLg3zQVzl/9pzjzW/Jsk27mY0lXrn8OPSc8ZqngwdrtcKgg
         c+RfkR/a4LUs8Ub7P9RNrMwPytYSfkKdOl81Uj6ujIf4HW8aNmuXAgL4OaYE4YrWbMzC
         6IQQAg+Yt0z9hp954BlBu17hBNBsebxJEL1w7cwdyKMnrdEByZ8Yelh0YPp50IXyPU5T
         XE4TwCGXit+6ifoTEZAwMIwuI8dAd3lHkRn33Z/fObC9XqK9uSVj+MK51WmPkXTb6rSo
         iB9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vC0+llXX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id oq42-20020a05620a612a00b0078390fc3347si10943281qkn.752.2024.01.24.15.07.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Jan 2024 15:07:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vC0+llXX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rSmKj-0003gp-4D; Wed, 24 Jan 2024 18:07:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rSmKc-0003f4-6w
 for qemu-arm@nongnu.org; Wed, 24 Jan 2024 18:06:54 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rSmKa-0008EB-6v
 for qemu-arm@nongnu.org; Wed, 24 Jan 2024 18:06:53 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-29041136f73so3236612a91.0
 for <qemu-arm@nongnu.org>; Wed, 24 Jan 2024 15:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706137609; x=1706742409; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tZ1IRVJ+J8fP3n+3NMnre9iiPDxgX73g7q2tr64l6fc=;
 b=vC0+llXXQGDmzdG185111G/tKn7h471iMPtNxXs2nx8mqHMTjcWI2VpAkms2bbq9zo
 K282j7CMhric7/vVU/nLSNkGS0qM1EnUvb0fwo5upqvStSX/RFJ7d+mBwFLrxyY5SOvL
 w2wQB6m/Fxh8Gb31Er9M2ccwfSSE3K46PiUMCnMfaLjA8dt8aSUAf9197mpEgMOML1rI
 LJU8lNlkI9KxBiC7CO8aY9EJYW9XQEeEdyfyq2yHvdOWcz+pNxhR6DiHZw10D+7OGkjo
 uaspO5J5Ojk6WOxo6RdesZoxFl/1+atS5bB129L9BjVJVMWU++K8urcsqs3hhSaHNt39
 Z9zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706137609; x=1706742409;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tZ1IRVJ+J8fP3n+3NMnre9iiPDxgX73g7q2tr64l6fc=;
 b=PYvDnHPv11BSHss430CG2F5AdqLQKSlhQjPewCNW+7jx5v0Tlp/XlpiVNEXxhONAvC
 0kgrSrmtEaFZXp7+srowAG3O+jAyAe44OfotcgfHa6b1PX+JVXS7OlqyXISxGRR7Wloi
 1EevUqe3kT3RQ4/iUnRORu/PF6zS5YgJoxrQL60l0ZFEpQcFauolNnV0UGdcSbxax75N
 HRgJ3f55wa8TzdFcHSAUWbVy56Bfx3tGeKjauxJAlf/iCRxaEX8R0DJmnPyBQfowLhAx
 ITGRxwR8PtuFZtMjCUv2JbQsWidMskmxGPk+49jmAftDpSMpmgqRex0/LZe1uhgaRDPL
 pSjA==
X-Gm-Message-State: AOJu0YwlkG0/obabjNt7x/h5O0O/sWoVsrqM4tdFL7G44tEti2nkLXEr
 UfcwD3eJ2vSqVPo2nIcNMJr0bKMdD4EZO8M+Na14RGblziSnMkzqvOKFEp/ZKl8=
X-Received: by 2002:a17:90a:ea05:b0:28b:86a1:b8d0 with SMTP id
 w5-20020a17090aea0500b0028b86a1b8d0mr247470pjy.58.1706137609554; 
 Wed, 24 Jan 2024 15:06:49 -0800 (PST)
Received: from ?IPV6:2001:44b8:2176:c800:5fcf:9e3:2e58:9c7?
 (2001-44b8-2176-c800-5fcf-09e3-2e58-09c7.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:5fcf:9e3:2e58:9c7])
 by smtp.gmail.com with ESMTPSA id
 n2-20020a17090a2bc200b0028be1050020sm180008pje.29.2024.01.24.15.06.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jan 2024 15:06:49 -0800 (PST)
Message-ID: <e9da4961-5d46-4cf3-9736-185e913b2c74@linaro.org>
Date: Thu, 25 Jan 2024 09:06:43 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] hw/arm/highbank: Check for CPU types in
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
 <20240123222508.13826-5-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240123222508.13826-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
X-TUID: Lw9j9KcKRwI8

On 1/24/24 08:25, Philippe Mathieu-Daudé wrote:
> Restrict MachineClass::valid_cpu_types[] to the single
> valid CPU types.
> 
> Instead of ignoring invalid CPU type requested by the user:
> 
>    $ qemu-system-arm -M midway -cpu cortex-a7 -S -monitor stdio
>    QEMU 8.2.50 monitor - type 'help' for more information
>    (qemu) info qom-tree
>    /machine (midway-machine)
>      /cpu[0] (cortex-a15-arm-cpu)
>      ...
> 
> we now display an error:
> 
>    $ qemu-system-arm -M midway -cpu cortex-a7
>    qemu-system-arm: Invalid CPU model: cortex-a7
>    The only valid type is: cortex-a15
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/arm/highbank.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
