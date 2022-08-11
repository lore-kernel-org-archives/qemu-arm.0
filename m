Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp815861ejf;
        Thu, 11 Aug 2022 16:48:22 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5f6Lauppz0KSdlq+eGvCTcth2GS2Fl0v0X83D8d0NSDgthfrnFqmzpmsHfC3myTXerb/k9
X-Received: by 2002:a37:63c4:0:b0:6ba:c1d3:7ac3 with SMTP id x187-20020a3763c4000000b006bac1d37ac3mr1105851qkb.316.1660261702214;
        Thu, 11 Aug 2022 16:48:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660261702; cv=none;
        d=google.com; s=arc-20160816;
        b=ghWeBVv5o4FQ+wbO9Vx/JP6TSLvmdQd5FRf+8ild64PFNvXPfaTnkIZorLzj+9iTj3
         +rxuEQspZiomtEi9wa1qPi3in0cT+KzfdYhUh+xUDXTJ36CDbjKFpHKBUi8zvo8iBBbj
         fu6aa/NXuY/UAsuv6siNBsBWoHSOzLMfdnuHbdvRaH5BDyVHqhL/vMnMtrZ5jfEtSsNx
         e/xbfGn26oyPjjgu8wzKl7eCFKkatvJ3SxOuWh26BY8sqfVGL24hI73gXPSqWKMtoEJt
         C5atuTcNFEPAHxG2zFr77FfEi4iznnidgFPZzvL7LHvSdfnRoAWbDxE2jwYr7CTQcI4u
         4oEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=PTmWwa9stgUgADGSQ/EvlbYsjUEO8opnJfMY4Da3ESA=;
        b=YdamtgPdZBQWDEWu6t4mUFlCkULeFtBDtJYrk1whf3Yvly/7H0xYYehVpiAIPwMNoK
         2e6J/LNQLtBbR1VQwQE5oYx2f2+6BBMx6e12IVdBsRCTWYD/oYe24kcr5OdjWcuw5KP1
         V0vGuiC0f5dHGpQt1Hdv/8ejstVkcMoPWOy4dAJTDigVY75wcIar2WIrwd2i0G9z94kx
         cl698BcW6NG3EI7ka3GP3CEhVTCG6nA3Ys+7mVZVNUBQNP4A7lTRbC/S6gRDk2JfvoGn
         1tTLvBAS0NwXRmTDr+blQAtXUiJ/vHjMwjQF9J8nPaoZY1FJCDDfL88LGNzTJMo3ymE4
         BQxA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=Z6FSxGIA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u7-20020a05620a430700b006a6d28f482esi460963qko.738.2022.08.11.16.48.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Aug 2022 16:48:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=Z6FSxGIA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:39136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oMHuX-00023q-OH
	for alex.bennee@linaro.org; Thu, 11 Aug 2022 19:48:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oMHs7-0000OK-BR; Thu, 11 Aug 2022 19:46:00 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:38444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oMHs5-00067o-Iy; Thu, 11 Aug 2022 19:45:51 -0400
Received: by mail-pl1-x633.google.com with SMTP id o3so18243268ple.5;
 Thu, 11 Aug 2022 16:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc;
 bh=PTmWwa9stgUgADGSQ/EvlbYsjUEO8opnJfMY4Da3ESA=;
 b=Z6FSxGIAmYJ6YUJNcu8WiL4Cd+7quk3GAdnrhsQnNsBeep+ypzDtIuEO1NwbsUwUHH
 OJNr8AqW7g/gRW/bR+AI3WxziUGy5JQYtC/Y89EsYeiAfY10iKULSIt+FT/tq6UYmz/P
 YZYCyLeOB/IFM0CoZvLNxdw3Aorc1hvkEHDc+WzOJ6bXO8UqelA09H+xUTV1yhSy0dQ3
 u6rYWlLagzYzKA4bLV9p/iMUcjF87EEamg8exIkArxVegbaG5SdVHZwgukKyuowWxvlm
 +87QmoA5VBE8a6gUZYX86orbuCymLjy7273ibB6TDWYS6cDd8oQR0fMlM57NAKtvZx7X
 OCiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc;
 bh=PTmWwa9stgUgADGSQ/EvlbYsjUEO8opnJfMY4Da3ESA=;
 b=piygBhMc71TJy2RMsUtBlRCEQmX+d+AUarMzNvcGoRw/L+c2z1fkB9PuavRdfJyEVC
 VwiAFHdnIgi+80jO0Cf/touSkKvq/9w5iW0c9T5+6AGd07iormoskUbGeuh1+Dx7lkmT
 /Nl8aQ0BFIGeI20uSpzskbq0MEGQwCb5ReeEolScaPo98n+JBjj56dZy8SBZzfAkKLP2
 CVkaPJU+LnX7KXc/eIusPkNQYNXqZax2pQdqX/pCbvUldAupDXIr3O+mrK/FLGrcZO7J
 rbsJQrCvD7lf2wzSNawWra/ZFDyLY3yguoXtEUtHcyWvz8KPS7SFBEJfktVHAK9K64fz
 1E8A==
X-Gm-Message-State: ACgBeo3P0/s4TLV6B+yKsH5cWhc/BZe/jS7lQhC9V6mjqJ76FzFZLOy5
 cZG4plVA/x6xt5YwPLVWSw9ffsAiEac=
X-Received: by 2002:a17:902:b786:b0:16d:a8f3:b2c2 with SMTP id
 e6-20020a170902b78600b0016da8f3b2c2mr1471823pls.91.1660261547458; 
 Thu, 11 Aug 2022 16:45:47 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 w2-20020a170902e88200b0016dd562430fsm238774plg.120.2022.08.11.16.45.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Aug 2022 16:45:47 -0700 (PDT)
Message-ID: <6a4997eb-69d1-d50a-0765-ffdd3d0c7408@amsat.org>
Date: Fri, 12 Aug 2022 01:45:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH for-7.1] target/arm: Don't report Statistical Profiling
 Extension in ID registers
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Zenghui Yu <yuzenghui@huawei.com>
References: <20220811131127.947334-1-peter.maydell@linaro.org>
In-Reply-To: <20220811131127.947334-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-arm@nongnu.org>
X-TUID: 2jMdvmJgSFBQ

On 11/8/22 15:11, Peter Maydell wrote:
> The newly added neoverse-n1 CPU has ID register values which indicate
> the presence of the Statistical Profiling Extension, because the real
> hardware has this feature.  QEMU's TCG emulation does not yet
> implement SPE, though (not even as a minimal stub implementation), so
> guests will crash if they try to use it because the SPE system
> registers don't exist.
> 
> Force ID_AA64DFR0_EL1.PMSVer to 0 in CPU realize for TCG, so that
> we don't advertise to the guest a feature that doesn't exist.
> 
> (We could alternatively do this by editing the value that
> aarch64_neoverse_n1_initfn() sets for this ID register, but
> suppressing the field in realize means we won't re-introduce this bug
> when we add other CPUs that have SPE in hardware, such as the
> Neoverse-V1.)
> 
> An example of a non-booting guest is current mainline Linux (5.19),
> when booting in EL2 on the virt board (ie with -machine
> virtualization=on).
> 
> Reported-by: Zenghui Yu <yuzenghui@huawei.com>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I think we missed this earlier because it happens not to be hit if
> you boot the kernel into EL1, only EL2.
> ---
>   target/arm/cpu.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 1b7b3d76bb3..7ec3281da9a 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1933,6 +1933,17 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>       }
>   #endif
>   
> +    if (tcg_enabled()) {
> +        /*
> +         * Don't report the Statistical Profiling Extension in the ID
> +         * registers, because TCG doesn't implement it yet (not even a
> +         * minimal stub version) and guests will fall over when they
> +         * try to access the non-existent system registers for it.
> +         */
> +        cpu->isar.id_aa64dfr0 =
> +            FIELD_DP64(cpu->isar.id_aa64dfr0, ID_AA64DFR0, PMSVER, 0);
> +    }

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
