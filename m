Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp2155301ejb;
        Wed, 21 Feb 2024 12:37:20 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWFL4kwXyKUgFIOmRbOuwwukCfPbwBVs4ddxu9ir9JRPbbdxROLTXKgMDFuTyuwk155g1RTTwFZ0SLi+qSIliLKLDnG24ze
X-Google-Smtp-Source: AGHT+IHDGGxExTm5quxyj4aA2IpdDsfqhZU3P1Od+xmJA8XRfaaQZkaNg6mEPhCEmXlzFLm0GR0y
X-Received: by 2002:a05:620a:55b5:b0:785:c0a7:462 with SMTP id vr21-20020a05620a55b500b00785c0a70462mr21834444qkn.11.1708547839991;
        Wed, 21 Feb 2024 12:37:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708547839; cv=none;
        d=google.com; s=arc-20160816;
        b=xLrATSvxw57b0AsYTmuodD+0Xb5XbxzSgpDPovEsZNDx9wMRVfgtur6oJpKcO9/KT+
         0xNP4TvGuKzhfn3T6I7HrP8sPXh0FxWK7m9gyuQUQxsB6QAJgO3Rolpz55gJlN3Z0Qre
         wAXbsLFkjzbgo4RatFeHGIlP2u3ejHWBS4Yeago6I2+K/hckSC+7zsOqaAosGG4MtVcu
         Gd0sIbx63Mjt/5QVC1m8nvvSoWhvIbRXBvw5VzYYRNocVj1qcDj13qYWRkByWqTfUKhq
         GATVqKJq2Xx/iUWjCN5OYLFWVPKE+IhNTOaseKRzq+TX+8zk0bC6MQSgldqG08BmxXRT
         ZzUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=Mgolz4yoRUWALxvvOjEvE5Ml5l8Hp2k3h4ZtOzVkDCA=;
        fh=ijhtZVYlNOF8+89LFH432Qzr7rZZBCgZlZid3qHD3B8=;
        b=lOIg6pz0sQvx/Q9ICabx9RgddMBiKOpziSvwj+RA1XaucO0w9untqaQJPKw/AVgfs3
         G2nK6D08grEFiO0ISq8UDIEMNRFd/caCsyGQ4rkLWojg/8cq3JEWLCS856z2i4E4Onmr
         T9GxN4j+QNj6/gcyQL5qt4XibWSuMZhYrMhspdJN+6L1wykhekEjXqSgmqwvb2BDKIiO
         BWKi4KuXFyTSedsBr3u/Nm8dg+E/5qHQ8ULjj5uz6q9Ct+f4rdUh993dUdE01RPbNfXi
         4yr+iWGkCCD0Q2wuftoXfVJ0ODrpX/ngOzeja5DQQvjmIvUz4npx5ODQXio9t/LzX802
         leBw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Zq9HMz5v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id os34-20020a05620a812200b0078758a6738esi9931773qkn.498.2024.02.21.12.37.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Feb 2024 12:37:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Zq9HMz5v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rctKu-0000Un-5a; Wed, 21 Feb 2024 15:37:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rctKs-0000UB-I9
 for qemu-arm@nongnu.org; Wed, 21 Feb 2024 15:36:59 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rctKa-0001lm-IJ
 for qemu-arm@nongnu.org; Wed, 21 Feb 2024 15:36:51 -0500
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1dc0e5b223eso25693835ad.1
 for <qemu-arm@nongnu.org>; Wed, 21 Feb 2024 12:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708547798; x=1709152598; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Mgolz4yoRUWALxvvOjEvE5Ml5l8Hp2k3h4ZtOzVkDCA=;
 b=Zq9HMz5vzZUrq5FN/2abI4X54KPDn/gvholknPPSOak7Az/Be8+8xKNniVzZ0BqOAh
 VIySaqiRXb6sjNTFHycPQaqiiuqm+E4sgEaFYySnezjnSXPVOg2Dpm0D4Q2+Jpz0qKPq
 wCYesiG19OFrZLep1ga5vUFfOQCM/4Xh74Jk2wcJ+ar3YnBoyV/FfNwcNYX4Ir+5GgDk
 wvb190hfTo/hiPv9em0vyikKHsVU4tGgDjurkIVUtHxim/n4CpyfRdav4IYsF8g5MaRy
 cndvGsTxuqg9UYn6vQmItBWEPR9w2Xai6EkYWk9oP9Oh0QyZ6jwSTBqi3FgLxAG75tVE
 QxVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708547798; x=1709152598;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Mgolz4yoRUWALxvvOjEvE5Ml5l8Hp2k3h4ZtOzVkDCA=;
 b=XG8cBolFZF+vP9ZKJ/l0HPmAtbg+X17qCsJG2bRA2nts7av87fbA6rotTAUudgewlb
 AyN8dFkwTTZwDs8dVVHXm9eW3xoTCTsjj4fAFIKOlfP2dEtc2JhqjmOq+FalXr408sRz
 vo+jPD+kRtxfVMurFxILJeEvz0yMjiZX+NCw3D+TNZw1+FgjtjSc51fnF8W+Fvr9/OKT
 SjS9hOFLbGiLLkOYpQwZpPvjXuWAk2Iw7p1Z24mXBLbdg4mDnPoD2dYg8vnS890tglWZ
 AR7eWVfiURUMG3lHbOh3N9MhJFdBo+sEGNN4cC2pEUIGMCEJ/N51gz9jKoeAblIS2qEh
 Mpcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUI2MnuUcxENtU22PBcR6GjA1vXK+NxjWdRsnhqMgk1Lx2CmdWl0KCNA911x8YFQG37pBM77oaxjLH+DTwFhvJpmNqg
X-Gm-Message-State: AOJu0YyspcIxD5qxGy1jxN/euZbGlZvNnDzXA/I8lpUOwxe7jl0/1ANR
 fgWsIL6VjtBBSsk9JbuOscyFA5UZP4WAApQpiaF2gfAt41IaW8l8TRX32DJ9FgM=
X-Received: by 2002:a17:902:e84f:b0:1db:de79:8664 with SMTP id
 t15-20020a170902e84f00b001dbde798664mr11954747plg.60.1708547797983; 
 Wed, 21 Feb 2024 12:36:37 -0800 (PST)
Received: from [172.20.1.19] (173-197-098-125.biz.spectrum.com.
 [173.197.98.125]) by smtp.gmail.com with ESMTPSA id
 h18-20020a170902f2d200b001db579a146csm8524173plc.241.2024.02.21.12.36.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Feb 2024 12:36:37 -0800 (PST)
Message-ID: <d2a70405-edd2-494b-bac2-14fd392bcc82@linaro.org>
Date: Wed, 21 Feb 2024 10:36:33 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 10/22] target/arm: Handle PSTATE.ALLINT on taking
 an exception
Content-Language: en-US
To: Jinjie Ruan <ruanjinjie@huawei.com>, peter.maydell@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20240221130823.677762-1-ruanjinjie@huawei.com>
 <20240221130823.677762-11-ruanjinjie@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240221130823.677762-11-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: F0EiO4OLW9CD

On 2/21/24 03:08, Jinjie Ruan via wrote:
> Set or clear PSTATE.ALLINT on taking an exception to ELx according to the
> SCTLR_ELx.SPINTMASK bit.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>   target/arm/helper.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 62c8e5d611..952ea7c02a 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -11540,6 +11540,15 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
>           }
>       }
>   
> +    if (cpu_isar_feature(aa64_nmi, cpu) &&
> +        (env->cp15.sctlr_el[new_el] & SCTLR_NMI)) {
> +        if (!(env->cp15.sctlr_el[new_el] & SCTLR_SPINTMASK)) {
> +            new_mode |= PSTATE_ALLINT;
> +        } else {
> +            new_mode &= ~PSTATE_ALLINT;
> +        }
> +    }

new_mode starts at zero and adds state as required -- there is no need to clear allint 
here... though I see that we do the same for SSBS.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

