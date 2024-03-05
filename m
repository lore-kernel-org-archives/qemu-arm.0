Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp137654ejb;
        Tue, 5 Mar 2024 13:53:20 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWmVsSul/BQiI/kFCqJoY6necwRx3bbT65THIjJlZtovm8rErW90EayxFIlazuN8ZCw9UVQ8ZwImH03Tg1VI0JzKKxnKGAo
X-Google-Smtp-Source: AGHT+IHqxJvKmoAzjJi64WXemUk344LG6UaQ1oyANBXb7YqtqPLKuR1JobrBdMEGb9zjK72b3lB3
X-Received: by 2002:a05:622a:16:b0:42e:7814:4564 with SMTP id x22-20020a05622a001600b0042e78144564mr3833378qtw.6.1709675599846;
        Tue, 05 Mar 2024 13:53:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709675599; cv=none;
        d=google.com; s=arc-20160816;
        b=j3A0QGDE5f2HAsAXdMlUoNwNszJdEvQdYq+nf0rQtfxGBRP/q5laVNC5Uol4SKGSTr
         VTh+TrCw58L3EN1m+KjB7OuhmT/WKy9cn0b7LsyIFnVAMDiFaD3XGRCadGc7FurO/XM6
         MutR8fI6DhdOquShDNw5ZbvdTSctjr1oIVwgG2NAslHc9qq83O+TNGY2mZPstRjUnhtP
         xF6GarjwWYN6NNL9tRzreelPs98KyP4ucf5ilhIAKFVgotNeFlt+xA6vP6IViSXD61oy
         fAvqKr1/ztJGNiK/ncg2mhYl/t/6yXVZ0aFOHRuBxnaFQGGWNmT3UFu4hW+7RlUktXbi
         xthQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=pN+jAz/uqt8BcB5VrIhGDt250gxQrv2+wbXBwbJPQ/c=;
        fh=iTUpOL3hIwDb1Y1wismrLQI+MMdK6M7LqGHL2FjLQ/M=;
        b=uOzhOqRoAgKNF62GzXlsq+E7iNEFQ60iyp/LS7HX9tTXA2bFn4pxq5gq6489Eywfxs
         HDdVDWfLao0rWJiJqtFGIABodd8Zw9kksQIH8XHixQM7JcQ6yoehBD0SiheWTPIfPSLY
         wOmrfxCLFyjk0vPbIcHzPU1ee/eOweyB69HseIHl438e8NgKgiDMWQauHfF2vzJz1adK
         BrnzqbBSvfEVCDMNyDt7RE5Rfy+KpFYSP2iY8Y+ZpRF7NHhXRzvyv+JltUGfQ9t0haYZ
         GyYCcMNFjFiYixyecZ37feGKu931iATaLUaHmwfananAIe1N2p3g4ppb1VXcg10Qyc7w
         Trag==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A9Pzu4hC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g16-20020ac87d10000000b0042ee00439d4si8221790qtb.630.2024.03.05.13.53.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Mar 2024 13:53:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A9Pzu4hC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rhcil-0002pC-C7; Tue, 05 Mar 2024 16:53:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rhcij-0002og-SW
 for qemu-arm@nongnu.org; Tue, 05 Mar 2024 16:53:09 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rhcic-0006AV-NU
 for qemu-arm@nongnu.org; Tue, 05 Mar 2024 16:53:09 -0500
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1dd178fc492so19267345ad.2
 for <qemu-arm@nongnu.org>; Tue, 05 Mar 2024 13:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709675579; x=1710280379; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pN+jAz/uqt8BcB5VrIhGDt250gxQrv2+wbXBwbJPQ/c=;
 b=A9Pzu4hCOzot+zQ3Fh84VS87KmS7LVxR1lCbZJyyBT9A0MmcKzCCNbTL1KWIjz2oJ9
 p512Oi0JkGN/rJ8KhSgOcudenx7mdXzQNCqQ1TMq4LP/Zg5fCkH5qweLETC2okYFO2S9
 tFvek3P934AtVR7Vt5TDW5gw5052QEwSTBZHKiOC5WJ8kVHBfvjL/WBuAKFd/A14o/lG
 ygFtvhY+LcxDaMz50qUpgWoO1dDdF+Ys4qnUFgOphc/2SYo+LjeXvL2UVT5uAPv7bqhk
 NmdCTsGHslRHLUaFr5uOAbtnf+OxW/jY7EzKmR2vOY2xwP69+oVuFB7JM3q0/D5U5aT4
 jaJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709675579; x=1710280379;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pN+jAz/uqt8BcB5VrIhGDt250gxQrv2+wbXBwbJPQ/c=;
 b=RzKrvw1eVMCGuta5yetuRX56dE0jgW3InyXfiHWTSlHctTfw4T9yWVqlJhTTYRE0cN
 PCUpOd8Sy+qDRTNurXLJgHTk2Sjnm4vWap6c7eVTGGG52RRiA+b3wlefN54Txu0311aT
 HmhCKYqxXEujF6B0UTP0/75WcumOGZwccIUFeq4e/F8xcJaJ03aRamVjDJPxLj6KxcCK
 bPLLalH35vEK22ehfzPBbEhUM2F15wCWpzrkgFfrsrspxqghBHz4o4/KUXeYtN50xYmc
 3fEtdHsjG1OxzHTE7FxM31EbsQIjqfgvsPqhYb7nfQmKBY6sVInp8aFp/cY2h84nyufQ
 wwnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7r2BC4qYQ+megwIs0xNUAS7mPXOAFIg9KnWVmOnQd+y0ohwmZxEFNrpn/VFBfxsCMiKi6Hq5lMRARbP8swcgLIP2G
X-Gm-Message-State: AOJu0YxXNKmPm0achvaQhqb+RoZ4Ct1zt7g940OP6dVP0JKHPyr15H4y
 n3fs3Ah68cci9+xQLoP2SEeiUMXc8/IND/CamVVeoYMMPpPOGmB2D/6U8gBHYgs=
X-Received: by 2002:a17:902:d590:b0:1dc:3294:f09b with SMTP id
 k16-20020a170902d59000b001dc3294f09bmr4100364plh.26.1709675579591; 
 Tue, 05 Mar 2024 13:52:59 -0800 (PST)
Received: from [192.168.6.128] (098-147-055-211.res.spectrum.com.
 [98.147.55.211]) by smtp.gmail.com with ESMTPSA id
 h12-20020a170902f2cc00b001dba356b96esm11131789plc.306.2024.03.05.13.52.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Mar 2024 13:52:59 -0800 (PST)
Message-ID: <dcd9fccd-63fe-49df-9af5-f78409576f68@linaro.org>
Date: Tue, 5 Mar 2024 11:52:56 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v6 18/23] hw/intc/arm_gicv3: Handle icv_nmiar1_read()
 for icc_nmiar1_read()
Content-Language: en-US
To: Jinjie Ruan <ruanjinjie@huawei.com>, peter.maydell@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20240305070331.2151131-1-ruanjinjie@huawei.com>
 <20240305070331.2151131-19-ruanjinjie@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240305070331.2151131-19-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
X-TUID: dc3rZbMSY55F

On 3/4/24 21:03, Jinjie Ruan via wrote:
> Implement icv_nmiar1_read() for icc_nmiar1_read(), so add definition for
> ICH_LR_EL2.NMI and ICH_AP1R_EL2.NMI bit.
> 
> If FEAT_GICv3_NMI is supported, ich_ap_write() should consider ICH_AP1R_EL2.NMI
> bit. In icv_activate_irq() and icv_eoir_write(), the ICH_AP1R_EL2.NMI bit
> should be set or clear according to the Superpriority info.
> 
> By the way, add gicv3_icv_nmiar1_read trace event.
> 
> Signed-off-by: Jinjie Ruan<ruanjinjie@huawei.com>
> ---
> v6:
> - Implement icv_nmiar1_read().
> ---
>   hw/intc/arm_gicv3_cpuif.c | 50 ++++++++++++++++++++++++++++++++++-----
>   hw/intc/gicv3_internal.h  |  3 +++
>   hw/intc/trace-events      |  1 +
>   3 files changed, 48 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
