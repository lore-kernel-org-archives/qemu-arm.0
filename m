Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp1512560ejn;
        Fri, 28 Oct 2022 12:40:23 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM74L4uRmyKsKpPGxm9iFYy3nEOQEJTD5KQrronNHsA8eOKLpC99MhFBJu7S5fWJ9iDUf1Gc
X-Received: by 2002:a37:bec6:0:b0:6f7:27c3:3110 with SMTP id o189-20020a37bec6000000b006f727c33110mr752637qkf.46.1666986023736;
        Fri, 28 Oct 2022 12:40:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666986023; cv=none;
        d=google.com; s=arc-20160816;
        b=LmXIfi5fSygUKaxMS/2sWZvR1ddt2CAbLsIyf33O+jqMjaLTMlvx/WfNtCeDFV2yt9
         OzLdw9zeRK9r5EiNn8xQgtgdsL2c3fW+YBdCR86o0+WDt9C+prTz02ziBgmjBOW3jgUY
         VaikArwxFCACSrVmHR5111hEmcxHYNsRIwZcOPo5EeOzZcfVAHKBvKl6EixE3xnEtxJO
         mec2DwOJBtoMy5ht6ciJrWCxW1PMkYH/FlVUyKMl2q4QlkcAitGRgsabZ3PD9jAnjzDT
         K/1d5rNj05ATjbdLBfi3UX++Jc0HbIgUVYgBXpS9o0S8LyUtNtjXzr5JvYQTrjh5ASd0
         gWCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=AgdF5glLeDqAa+j/aW34oueDg9BwHSdoQjaIrJbNRak=;
        b=DylVvtctkNXguJ4j/7fjMgGJcL9fm12YkjlN462cYKSQAJXq4heD9PBJOEWNmfGT0B
         5LtnIsw3/o16oKZhot2nDcIZe/LJaqyAcTCzg46XZXzyP1W4jYu6JgkdKBgXviUmEXIQ
         4/MAbd6HBlX9Iqzosizs63vozQCNinbApmSP43WW9Jvf6L5Z+SmEDWDmHgSr/aa7TNld
         sV8tsY0xnHBmrqJXhPnMgtcc4HCdjAHZqEStsLvzOafzoq0Cw9ZFvtlUnYCjybXmeT8k
         Yl/EjaEzjmdiil4a6tAToaqgLkAsdtRNLTd0SvDmi4TYw98epRTJsMDgNigXhVoo6ych
         neWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="LkWMtZW/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c26-20020a05620a0cfa00b006ecf4e2a9a7si3116694qkj.413.2022.10.28.12.40.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Oct 2022 12:40:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="LkWMtZW/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ooVCp-00010m-Pw; Fri, 28 Oct 2022 15:39:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ooVCk-000105-88
 for qemu-arm@nongnu.org; Fri, 28 Oct 2022 15:39:46 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ooVCi-0006Qm-OW
 for qemu-arm@nongnu.org; Fri, 28 Oct 2022 15:39:46 -0400
Received: by mail-pl1-x631.google.com with SMTP id y4so5715308plb.2
 for <qemu-arm@nongnu.org>; Fri, 28 Oct 2022 12:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AgdF5glLeDqAa+j/aW34oueDg9BwHSdoQjaIrJbNRak=;
 b=LkWMtZW/6jck8RhFlpHJn0avMeDgkwLDU1y6L0xd3bv0w75i9k+ZAizB08p29RkVUR
 OgZEd6/vvt4ZNtEDa2Km4gj/iuGTzAQRU4DE05iHqsPaaYKm3oDphLepk03+R0rRB1Vn
 gUanETgbh+ZzSr3V7KcXKK41r1UqI9iL4/P0tr5yX9GK54yvcDPChzRqaTPOLQQ/Zj4x
 Q3RSvXkYtKDukmldH7d8Rwf+L7JdjDJ9X0F3peqkttZUi5iFnGV3Lre8qkpKIPaGX0fF
 7pZPsVgmQfwFcsRhv4hGwhQEycj5Xx8yP3QhGRAPixSFaxjsFA+QJQzL1e9ZAuZTDLNF
 5pGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AgdF5glLeDqAa+j/aW34oueDg9BwHSdoQjaIrJbNRak=;
 b=GRlhqRt6sppsA6DClnGn7WkDCgeot8hKiixKsJ5fut9RzMb8lkBCjR4HA/nKSRuJ2H
 nHYS9sFqxykBqJzfPe0PEzqStfVNk3ePsfNlVCMLaM2Eur2JaaL2NMuEqk5HgqQoCUqD
 qhFYf84VDiVsoTzvJ4AqLIkziWXQzHsLwKHpFjnLPl48VIjfAmC0ahPA20sE6fbmeG+S
 FOnJb5ww9Uhe2cIAQwW8iZ50aQf3y712cuE+wqtYGpFSuGCz3WNX2ov/4udfBHY9+vST
 WMtTMXFfDbP5TyumHZZgz/fMV76KP92wFiALuVC5aBrqhmAOTU5yj1CcO61cTViIb4GP
 LJHA==
X-Gm-Message-State: ACrzQf2knRxdG/TqRhKcW78fknu3EjHNlxLrF2rJyJ3MazBa+/1cqw1a
 44+nv3M+QwqQeuvhEBkjh1qzBsEHEBxJe0PH
X-Received: by 2002:a17:902:bf46:b0:179:eba5:90ba with SMTP id
 u6-20020a170902bf4600b00179eba590bamr634227pls.16.1666985982956; 
 Fri, 28 Oct 2022 12:39:42 -0700 (PDT)
Received: from [10.0.0.64] (180-150-56-70.b49638.mel.static.aussiebb.net.
 [180.150.56.70]) by smtp.gmail.com with ESMTPSA id
 y76-20020a62ce4f000000b0056bad6ff1b8sm3150511pfg.101.2022.10.28.12.39.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Oct 2022 12:39:42 -0700 (PDT)
Message-ID: <d813bda6-d84c-f97a-fb0c-753975e63a75@linaro.org>
Date: Sat, 29 Oct 2022 06:39:37 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 3/7] target/arm: Implement HCR_EL2.TTLBIS traps
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20221028134002.730598-1-peter.maydell@linaro.org>
 <20221028134002.730598-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221028134002.730598-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: mLOklRi0d19Z

On 10/29/22 00:39, Peter Maydell wrote:
> For FEAT_EVT, the HCR_EL2.TTLBIS bit allows trapping on EL1 use of
> TLB maintenance instructions that operate on the inner shareable
> domain:
> 
> AArch64:
>   TLBI VMALLE1IS, TLBI VAE1IS, TLBI ASIDE1IS, TLBI VAAE1IS,
>   TLBI VALE1IS, TLBI VAALE1IS, TLBI RVAE1IS, TLBI RVAAE1IS,
>   TLBI RVALE1IS, and TLBI RVAALE1IS.
> 
> AArch32:
>   TLBIALLIS, TLBIMVAIS, TLBIASIDIS, TLBIMVAAIS, TLBIMVALIS,
>   and TLBIMVAALIS.
> 
> Add the trapping support.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper.c | 43 +++++++++++++++++++++++++++----------------
>   1 file changed, 27 insertions(+), 16 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
