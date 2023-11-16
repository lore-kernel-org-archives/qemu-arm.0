Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp3377940ejc;
        Thu, 16 Nov 2023 02:01:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFF7+Fl5+IixYU7CEbSYAlht4zWVqTqKceMER4ISHF8Y8bdCW4ewvCiAzOgHsuN8/mgbWFF
X-Received: by 2002:a05:6871:4106:b0:1f4:d1f3:6b18 with SMTP id la6-20020a056871410600b001f4d1f36b18mr15300481oab.34.1700128915753;
        Thu, 16 Nov 2023 02:01:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700128915; cv=none;
        d=google.com; s=arc-20160816;
        b=bKObdoTlmgMko3JZcSQ3GBhE+ZePfOfvNQleoTXo3ONo+vwMKoPxL/76/jQSPIBhkZ
         TVRtulu5a/KQUPd9GbWGKXOCiQA2KXG1CXooQAazbRnlSi4LN+zxD+opWORyTjfypZAA
         bmvcKvNqeyy1TmhVavKWqzT18irLmDJjbYJU9jG9rNxpXmZ4mUKbwX4xqoVtduswsE4l
         rILXn2NLkiVOPsm+IjPGVu4HwN1x2lFqzwNTVAakPR4wYoj0yC6PIqywLjK3GYu6klSK
         wca0iqKJr3Ej82eY/XyXESHaS7UwfmR6x8MsuDM1sJR4qJEdoCaW3kHzJAM4Ke7IDhJS
         XkZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=0GOBjPQgq/BDEfRrJAbTfI8qHwKw2XyQ2WJKVxI/iDc=;
        fh=MNy/s+eWWV9V6tfmhb2gUwit/2o7TQkLbQD1zQm6hqY=;
        b=GS5CKBK6Rtt+yCmkoPpfzywiAypPgHiQYazyMggUTtew+KWp4oWfibDDw78umW4jfa
         CoaurEWGt82fX2L5E+T8VWUZZvNBCqsXETCLbhTaIjTM2Fyhdj/b38/NqhCgbuFNyZQu
         DhYZjgSsl18C1L0bDbg/K30AYH5BcraoTfCXjXwkGdbeee3EI9pV7zdWO6pd7Ri/bRKp
         nvHKI7Wg9Vs3toh+fEz7JOe2x3mGl/3ZIQviwxMZR0aHSsNhB181D/ug+G6lEML6NmNG
         ymDgFZ8iTdr/2T8tDrcgwUYxVShIMxEMA/dJFEv6kLH9nhE2tdsAnPB5Jb7kOKPuS3qS
         4MCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dnzR3x3X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m11-20020a05622a054b00b00421b95298d6si10606793qtx.518.2023.11.16.02.01.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Nov 2023 02:01:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dnzR3x3X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r3ZBr-0005An-9B; Thu, 16 Nov 2023 05:01:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3ZBp-0005AK-VV
 for qemu-arm@nongnu.org; Thu, 16 Nov 2023 05:01:37 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3ZBo-0004gn-5P
 for qemu-arm@nongnu.org; Thu, 16 Nov 2023 05:01:37 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-408382da7f0so4984835e9.0
 for <qemu-arm@nongnu.org>; Thu, 16 Nov 2023 02:01:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700128894; x=1700733694; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0GOBjPQgq/BDEfRrJAbTfI8qHwKw2XyQ2WJKVxI/iDc=;
 b=dnzR3x3XyoRymj39V1B8dBe4NOQD0vsjeHFISCC9cXfBWQpLiORDe7qXcYFz/RPpuh
 kROHAJr9fY1vTsDoEcqDlfoP1RfsM/o8Ws7yw5IavvDcdAeqAngvKt9mISJNXmzFB4UR
 C7gB0yp1zkn+6KDVENsnqyE9NrcJ28WFutSoyB+S4Vy234YshMeFJ0H96hxxZZe5k2g3
 MoeSsMM56qkHFenjqSeJ91UMcL/IQfAC9EvdE0acoXQsihsCh4byHfxLOM3KgytCf+o5
 mU+iC84AGaJ6fCxkVdDFkqkC9ha8dCIo73L6p17vJHsvEUhlEiNBIMNvIvpc+zJ4BpnX
 4rjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700128894; x=1700733694;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0GOBjPQgq/BDEfRrJAbTfI8qHwKw2XyQ2WJKVxI/iDc=;
 b=SIEBQEspxHzG6Su45srt/lYz8h6P95EmvEeFiAR/Kug7syyQOQpGIhyemHLfoyKWzH
 iOgznAnm+FAeGhS3kXsyr/opVunf4KPQGcVg0ou//afzIRwuKHh4VfT4Df8PxOQpVU2J
 bxhZtRgX21DyKeUujm06eNUmn5CGWNaEdiAtmPdr3WOidDS3KeeWSH0uFTm7SPlKmGfB
 xWvjJTq5iiDzZb6l+gOOHdFxrwXh9PsJZ34An/3ulffBkZ4fxEF9ZWFKJscAZ8hBl7ib
 YlVGgcNXUzdKkbIN5mbkJSYNBqAYCUFho4hDI9exKU4IMVhetIaQApdLsmqwDfHozq6G
 jyuQ==
X-Gm-Message-State: AOJu0YxbQgcQfnKJI+Ks1ABj1MQHoN+yBVut07WE7JLPHdUdzbBmPQpX
 bPmx2ogy92cnVGWxf9iArcTH2w==
X-Received: by 2002:a05:6000:1250:b0:32f:8085:7411 with SMTP id
 j16-20020a056000125000b0032f80857411mr1396165wrx.24.1700128893288; 
 Thu, 16 Nov 2023 02:01:33 -0800 (PST)
Received: from [192.168.69.100] ([176.187.220.205])
 by smtp.gmail.com with ESMTPSA id
 x15-20020adfffcf000000b0031984b370f2sm13066668wrs.47.2023.11.16.02.01.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Nov 2023 02:01:32 -0800 (PST)
Message-ID: <d5b43eb1-93b4-4e3e-8c37-1dabd5a4cb52@linaro.org>
Date: Thu, 16 Nov 2023 11:01:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/31] Unified CPU type check
Content-Language: en-US
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 imp@bsdimp.com, kevans@freebsd.org, richard.henderson@linaro.org,
 pbonzini@redhat.com, peter.maydell@linaro.org, imammedo@redhat.com,
 b.galvani@gmail.com, strahinja.p.jankovic@gmail.com, sundeep.lkml@gmail.com,
 kfting@nuvoton.com, wuhaotsh@google.com, nieklinnenbank@gmail.com,
 rad@semihalf.com, quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, wangyanan55@huawei.com,
 laurent@vivier.eu, vijai@behindbytes.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, mrolnik@gmail.com,
 edgar.iglesias@gmail.com, bcain@quicinc.com, gaosong@loongson.cn,
 aurelien@aurel32.net, jiaxun.yang@flygoat.com, aleksandar.rikalo@syrmia.com,
 chenhuacai@kernel.org, shorne@gmail.com, npiggin@gmail.com, clg@kaod.org,
 ysato@users.sourceforge.jp, kbastian@mail.uni-paderborn.de,
 jcmvbkbc@gmail.com, shan.gavin@gmail.com
References: <20231114235628.534334-1-gshan@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231114235628.534334-1-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: TOJMD99Trv2g

Hi Gavin,

On 15/11/23 00:55, Gavin Shan wrote:
> There are two places where the user specified CPU type is checked to see
> if it's supported or allowed by the board: machine_run_board_init() and
> mc->init(). We don't have to maintain two duplicate sets of logic. This
> series intends to move the check to machine_run_board_init() so that we
> have unified CPU type check.
> 
> PATCH[01-04] consolidate CPUClass::class_by_name() so that the returned
>               CPU class is checked for once in cpu_class_by_name()
> PATCH[05]    add generic helper cpu_model_from_type() to extract the CPU
>               model name from the CPU type name
> PATCH[06]    add generic cpu_list(), to be reused by most of the targets
> PATCH[07-21] switch to generic cpu_list() for most of the targets
> PATCH[22]    use generic helper cpu_model_from_type() for several targets
> PATCH[23-31] validate the CPU type in machine_run_board_init() for the
>               individual board
> 
> v1: https://lists.nongnu.org/archive/html/qemu-arm/2023-07/msg00302.html
> v2: https://lists.nongnu.org/archive/html/qemu-arm/2023-07/msg00528.html
> v3: https://lists.nongnu.org/archive/html/qemu-arm/2023-09/msg00157.html
> v4: https://lists.nongnu.org/archive/html/qemu-arm/2023-11/msg00005.html

Maybe I missed the comment in earlier series, but what is the plan for
the following targets?

$ git grep 'define cpu_list'
target/i386/cpu.h:2289:#define cpu_list x86_cpu_list
target/ppc/cpu.h:1623:#define cpu_list ppc_cpu_list
target/s390x/cpu.h:922:#define cpu_list s390_cpu_list
target/sparc/cpu.h:673:#define cpu_list sparc_cpu_list

Thanks,

Phil.
