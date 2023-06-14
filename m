Received: by 2002:a17:906:ae84:b0:982:368b:d395 with SMTP id md4csp981779ejb;
        Tue, 13 Jun 2023 22:20:46 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5ikoP/hBOyMJsffhmCkhG5JzIYDmeoHrWRqFFPgGV+R/B1YHU7WflVUXgNl/sFQ/VFkSOn
X-Received: by 2002:a05:620a:17aa:b0:762:356:adcf with SMTP id ay42-20020a05620a17aa00b007620356adcfmr1670825qkb.66.1686720045996;
        Tue, 13 Jun 2023 22:20:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686720045; cv=none;
        d=google.com; s=arc-20160816;
        b=fdAfdTLSw9kigX8mnwo6mm333evw/7fzZo3DEgjgZfTAR3ccEGPT3DVyvoeOWCtwHA
         uIqzxCgA1u+8X2Ya0IJt2hLVl4fBkygayCDyMHv/N6LKHsPqiJ/96iZJIYd2Nifrw0mW
         zyJNocxkQ453wV1pe+0+ewrxz/FdLTN4U2QJWRtIjMqkZPOAsoTxhtosqDDCWrfLV9bY
         +Cbexe4QHWu8i1aZjHABObDxNzdyFtpGUGyuz5C6vLUW0iyLs+aO0GmfAVZBl4q29xct
         PV++yp/P8YGoULWZ4rVfvu53AESTDZ3bx2cYdF1LbYa6Z+u31HcKBRBOCQy36T1mQkIh
         ZU/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=CYXmt1W0N7aPibpdtdMaCJnDHg/yv9PwrhSdWti+4aw=;
        b=MtejRH9SI68/rijINNYCamxOQ/TQZOraa4eSnKZLOyr04v60EDYM1hzqr8F0wSweZ1
         R/opvgAKqFstHpGoybCyVqIt3J1YTO5ncL+UOdQgaXWR+h07mValDdVu2W9OhJZqdPRY
         kMqp2JQ0yIYQChMMNcVeUUcFTod0ZN2LjKyl/zWK8raGAjRbM2nf71sL8oElHfsoXO9p
         Wa9hL7YVW2uQcHW4c4jlLsmDXIBIZ7ROsKBRgLHrAar3ATGtWGi7FwCgFZGKw0DahH3z
         SKq/6EyUz5cIybvdcmwt41rPI9SvhoI62GH567arBXY+tzgeC1am49VJtaO/Wvbu+lML
         WhLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xuN1XzN6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dy3-20020a05620a60c300b0075d0c5038d4si8080935qkb.282.2023.06.13.22.20.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Jun 2023 22:20:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xuN1XzN6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q9Ivj-0001Ca-Cw; Wed, 14 Jun 2023 01:20:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q9Ivf-0001Bj-CU
 for qemu-devel@nongnu.org; Wed, 14 Jun 2023 01:20:24 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q9Ivd-00022Z-Ah
 for qemu-devel@nongnu.org; Wed, 14 Jun 2023 01:20:22 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f8d61cb36cso3083985e9.1
 for <qemu-devel@nongnu.org>; Tue, 13 Jun 2023 22:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686720019; x=1689312019;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CYXmt1W0N7aPibpdtdMaCJnDHg/yv9PwrhSdWti+4aw=;
 b=xuN1XzN6iBZHMqjXh/oADQnzbbU6/2I2h+7Lmxl6Uh73sHGtVyV6Jv8IYNVO+07iy/
 E47JevRoZpBcKXcKONbFww7Ghl/c657jfyElpsbnpuQBGwSnlCjzRkM3qhhjfaFQSQzv
 l7GGkLmVXwb2l35nYT2+KVSiBdfMIkeMTO6om0Mxtw0XS0Khj0bOP3fBgQE3hk1EBR9+
 PkNiAmntN9DRE34qO9MnhhQWP+GZ4w73Un0TcDcgfpVWpz7wSNUeA7rTpUJzOFeJtP7e
 jyYuFoH6n5hVIZVfqb7fqnDuD9Jsu6+40E90t057dA6R3/ALBvjg8Tzy2aH8kZMMEccV
 PjgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686720019; x=1689312019;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CYXmt1W0N7aPibpdtdMaCJnDHg/yv9PwrhSdWti+4aw=;
 b=IFv4Hr3XBNr4hkPWOspTstmzSW9mJAvBOzSz3AfD/6XtQkcamjrVomd2jKhTyBe3ta
 NQMNskuPHdkwgRtc5h9bHq1J84SNykyZXw0cvWlpWLAMde1zg211M9tEionj2vvBkNvI
 ZQ9EJqKCh/QzPAclNVauqCNkor6ERdzJxRbQeW4xFx/a3F99X9ygSY4B4DTaLCuctPMb
 rZLSNsNAm6CAq+XwsCw4GwxiyfcFP0Mmo5+xmxMEFB1xOqE5VbgQOmV/+NCMDXxT00+k
 Z9LKxLHM/wXQIcvtBpl0966OEwtuqLL+ffqtEd/jtpbKH67JkNG+Ur85fqAAa5XWKuTf
 NoCA==
X-Gm-Message-State: AC+VfDydQbsUuma+qmDA+cn0Yi262IFnvFDZ87JDwpVl8G1md5gB/Q/z
 f1Uo+dhiGHJzGUIPrU0aFsw17ZOXByydbxS674i2uMTz
X-Received: by 2002:a05:600c:210d:b0:3f1:7581:eaaf with SMTP id
 u13-20020a05600c210d00b003f17581eaafmr11545987wml.4.1686720019620; 
 Tue, 13 Jun 2023 22:20:19 -0700 (PDT)
Received: from [192.168.4.112] (90-182-62-66.rcp.o2.cz. [90.182.62.66])
 by smtp.gmail.com with ESMTPSA id
 x19-20020a1c7c13000000b003f7aad8c160sm16192943wmc.11.2023.06.13.22.20.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jun 2023 22:20:18 -0700 (PDT)
Message-ID: <af5a7f0a-50c2-0ce4-4196-0cdf5d06cfb1@linaro.org>
Date: Wed, 14 Jun 2023 07:20:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 04/23] target/arm: Consistently use
 finalize_memop_asimd() for ASIMD loads/stores
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230611160032.274823-1-peter.maydell@linaro.org>
 <20230611160032.274823-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230611160032.274823-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.098,
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
X-TUID: gbAI7NBVgGSj

On 6/11/23 18:00, Peter Maydell wrote:
> In the recent refactoring we missed a few places which should be
> calling finalize_memop_asimd() for ASIMD loads and stores but
> instead are just calling finalize_memop(); fix these.
> 
> For the disas_ldst_single_struct() and disas_ldst_multiple_struct()
> cases, this is not a behaviour change because there the size
> is never MO_128 and the two finalize functions do the same thing.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/tcg/translate-a64.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
