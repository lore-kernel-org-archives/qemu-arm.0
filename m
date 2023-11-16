Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp3488446ejc;
        Thu, 16 Nov 2023 05:32:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGVG8pgmVTNWZfQiZJlepnEBwj7di5ixukZ5pCwQu1qzFqvZzN/JXy+Y5HpGBx1hBi3xhSH
X-Received: by 2002:a25:af53:0:b0:daf:55b5:50b1 with SMTP id c19-20020a25af53000000b00daf55b550b1mr14770275ybj.28.1700141564054;
        Thu, 16 Nov 2023 05:32:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700141564; cv=none;
        d=google.com; s=arc-20160816;
        b=IXtk9gHW6k8jD07DdqthuQBr+wKRaahTGl2iFJX8rLlQRUYAUtBEYA/gFfnEMdwecJ
         sqSMPj5nIsKx9EhT7zV9SutY9V+kGpEvmatzxGxmuJ7tRQ59mdzLgkmN698nfjs8wmPK
         +RdZP1/1QcDwzYXpMgUjmwXi0+AXfAxGtt4W4TqwPh/OK06pJ20ogsaOQzeWNFf9Cc/A
         43mXD6hxNIavJufIDYzYk3SnUUJiXymN5EAiqkSdDVPMAyj5C1fVkk1bahYwd6Lt+5JH
         IFqlmHkMUX6T7lpq35mm+vyBH5vraialPlPdUr6gx4IZqDGBwkHQDK3G5506HtUimDtD
         jzKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=E2y8hUSUjJmGrsvpGRoq6+3jNLGfGx94GWr64TZCVx4=;
        fh=MNy/s+eWWV9V6tfmhb2gUwit/2o7TQkLbQD1zQm6hqY=;
        b=JWbSwh2LViVZxIWY5Ei1G2YIjc8j0O1PWv6Duzs3X3Y83j1NcIMy5m2hBuea7GiuiT
         sD46DODMkArJiY9E8cQsf/aGjUhsWuaJDhkCk6oghObFu4TKZblOI2PeFZUB63XLM53P
         toYbmEnVNDBqXwvyMgAjU3Mp5JDv1v321eHd88jqRc4OuQvumaG4Ek5o6atvtZC54rdI
         4h3VHHPIzuAPT/i0TU+Nw2rayfW97smXTxaSm25Jaj+KpGtSMBBmRgN1QfTEUemK4kWK
         d/d+4KdjN0tkYfCcmQFJKFEkmzb0C8UzrigOewmNbwlGrvklgvaR7WpyTPlcvEZP5wpW
         ragA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MLA9bLLp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t19-20020ac85893000000b0041986d97773si11831213qta.580.2023.11.16.05.32.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Nov 2023 05:32:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MLA9bLLp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1r3cTw-0006fG-1V; Thu, 16 Nov 2023 08:32:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3cTn-0006UT-S9
 for qemu-devel@nongnu.org; Thu, 16 Nov 2023 08:32:26 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3cTk-0003hd-Ss
 for qemu-devel@nongnu.org; Thu, 16 Nov 2023 08:32:23 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40a4d04af5cso5853635e9.0
 for <qemu-devel@nongnu.org>; Thu, 16 Nov 2023 05:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700141539; x=1700746339; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=E2y8hUSUjJmGrsvpGRoq6+3jNLGfGx94GWr64TZCVx4=;
 b=MLA9bLLpfINhk2BiQguYR1ARUo5i0M5eh3JvWOHIGWpxdBpeBOF7dpSm60KnXWD1Az
 i8YpZ6bUy2oWiRHJR1Xy7xeg3v2B4FfI0rk3jtGS1gOy+jvAbPDgJcKIJLKIGNwoHcu2
 kcG2/E1RpDqCoq4q8NKLi3eQ1ja7DMVtmAq0KSGb8CeCyvdZyGS55a74ykuC6r5PCjS2
 YuYCfC35KNYw5oMbCbfrEKaKisJ75UEWhfUX//UaSkoidllwEdaRsnxFw78G+XZe/w/d
 JK3HrNEK48zYn2BwK+5/a+S4IH18nQue1T4mGkXCCa9pDyAxL+ZD8DiEOk1wJVTQI+0E
 zdoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700141539; x=1700746339;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=E2y8hUSUjJmGrsvpGRoq6+3jNLGfGx94GWr64TZCVx4=;
 b=rkBQfFKMTdj+MQ3W/XAEI2I2m1MURH+PETFLb+JVPd8wMBDl2BbBja1GLYFVz3vEqG
 s1zPD5bENRvrQCuPCYa8xxI/4jrukirnPs1dIPccB+be4GAX9VmNKpwp0mszaKin/eRm
 PKpg/YK82Z3Fc1GkMN+1BpO6q++YlccwfZdudzOXOYv7wJXVfSd3cxfjtufWiz1apdRq
 WW923oD/ElxiPJifMeJj0O2/9ZFOSO1FpTAE0DcYeVef6WWZvLKtFIUv+o4BzU8tbd4+
 zt1ufJ5HCd9uFi8EebfFOqYUgDKC4DqGK+WT7tbz/jtOMWoMXCWuxwORVTYdxie9Nlnq
 lqOA==
X-Gm-Message-State: AOJu0Ywogyi/ZBM2T37DA8gauL7gzPRqre0Ik4BJLvgZtf1WGm+GUla4
 ORbFcO592edgn7YzuU9I0sNHZg==
X-Received: by 2002:a05:600c:3596:b0:408:4160:1528 with SMTP id
 p22-20020a05600c359600b0040841601528mr12797808wmq.30.1700141539198; 
 Thu, 16 Nov 2023 05:32:19 -0800 (PST)
Received: from [192.168.69.100] ([176.187.220.205])
 by smtp.gmail.com with ESMTPSA id
 d15-20020a05600c34cf00b0040a4cc876e0sm3692072wmq.40.2023.11.16.05.32.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Nov 2023 05:32:18 -0800 (PST)
Message-ID: <9632567a-3340-4a18-affd-de8caeecb2f9@linaro.org>
Date: Thu, 16 Nov 2023 14:32:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 22/31] target: Use generic cpu_model_from_type()
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
 <20231114235628.534334-23-gshan@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231114235628.534334-23-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 8S7Z8urLU93s

On 15/11/23 00:56, Gavin Shan wrote:
> Use generic cpu_model_from_type() when the CPU model name needs to
> be extracted from the CPU type name.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>   target/arm/arm-qmp-cmds.c             | 3 +--
>   target/i386/cpu.c                     | 3 +--
>   target/loongarch/loongarch-qmp-cmds.c | 3 +--
>   target/mips/sysemu/mips-qmp-cmds.c    | 3 +--
>   target/ppc/cpu_init.c                 | 3 +--
>   target/ppc/ppc-qmp-cmds.c             | 3 +--
>   target/riscv/cpu.c                    | 3 +--
>   target/riscv/riscv-qmp-cmds.c         | 3 +--
>   8 files changed, 8 insertions(+), 16 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

