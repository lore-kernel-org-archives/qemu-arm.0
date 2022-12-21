Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp5024804ejb;
        Wed, 21 Dec 2022 01:44:01 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvzPQu3TJ73UVbJZpHiUGZqhsKEWCgNzpjDaQlDvLk8YMaTVXDLxovFCqbCJUqPjIsk/08Z
X-Received: by 2002:a05:622a:230e:b0:3a4:e849:a235 with SMTP id ck14-20020a05622a230e00b003a4e849a235mr1363322qtb.34.1671615841427;
        Wed, 21 Dec 2022 01:44:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671615841; cv=none;
        d=google.com; s=arc-20160816;
        b=qi89cO6+tQ4g5ErINLZ7A3PxzgyPwEFOE7ui854YC8b8GxEc6qsUQ/kebwsPZm+9yt
         hNeeB6fPqsPpbrhqe1h0Q5JV8LvttoXbwQB0o34crupaj66rc98/O5e+jqJ3dAQP3VbA
         cI+5N4hNfj/lTnki5kaygCAmM4aOZnvwnRPusZO/M1TjJJ0KNOYoIVudaJvR6hiq9qM8
         tsb34vN6knCcFtmHng1MxoKhwV+AeD7/T4/fOGY+gHebS+YWJi656pG5dwwF3ruNmLNx
         edUu+eocOlXPJVPp1kHY3vIaV7VpzhhbskidMGT9QQVN6jDnC+07kRfDhyiaunGPDg3Z
         HF1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=l5O7H77fbEf5a3v3V32B4qSp90L7UIUagCASyC3Wou0=;
        b=Uy4bMs35II4/mIOcQ1nVY/7Z3FhCG3jtKYCnhqoaURW45Vdo0eKqGLhye3Y4osOWnH
         mVVP/9Q8Lh9kQ63B8kdz/MGeZsXxcabXpWW9cUGeEDtfdmudtBhRzWW9ljog1mUIMUWj
         3Y+CyTsYjCJDXOyfQQ3yCyhsf0TRAHlDddrol5j6MZT2c+i62g7EsarQjET12SQnHOSR
         uEQ5GNS1oEgceki0GdyRNL6OhLKjOoPj1PCMYRcAi9yIgeVbJl/4kqgr1zc31vNSIB1d
         F1g07S1lfe7q2Pc0UaKWOj8HAOemipSjqed/7K4RQch5HNSWFta7blE6l4O8Q8NLHvgo
         Rt8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=l3VlODuX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q28-20020a37f71c000000b006ffd497f056si5886485qkj.7.2022.12.21.01.44.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Dec 2022 01:44:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=l3VlODuX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p7vdf-0006pN-GG; Wed, 21 Dec 2022 04:43:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7vdY-0006lf-7r
 for qemu-arm@nongnu.org; Wed, 21 Dec 2022 04:43:45 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7vdW-0000Xy-L6
 for qemu-arm@nongnu.org; Wed, 21 Dec 2022 04:43:43 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 c65-20020a1c3544000000b003cfffd00fc0so1089428wma.1
 for <qemu-arm@nongnu.org>; Wed, 21 Dec 2022 01:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=l5O7H77fbEf5a3v3V32B4qSp90L7UIUagCASyC3Wou0=;
 b=l3VlODuXRLqPZJnxhCIiLdVs4UhRgO7qe1sf6+LNPHcUn8rLqggUUWM2+MpS7qSMM1
 2Bk7iMtQ3g8/TQ10GsFLd/hR3sroUNrK7kYbT5PXos8O7D9XzRLqTmBHR2ldcFgyZJR0
 kDGeWyWahZ80U5vGD/h+m1RxUexxZ1jSbxou4ArA13J11akibEYP6lAmYSfdrjImOg6D
 txHAqBSiHSa/oEawpfvKvCwesw4GAU9eHHxQxdz4s5dH2LRyw5pDr+sCWBfALnMPq97s
 C/PjJNL3lWLSA9kNe2yCnoyc21tAXsP6Sf+60i6BP1iVFhlMKYjgmh8UfikBZ7h9kSd9
 8TcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=l5O7H77fbEf5a3v3V32B4qSp90L7UIUagCASyC3Wou0=;
 b=o1rOhzGPpae5q9zdP9cXohS+AFybczpeBDH9A3ljo5OqUq/kTIABuBCaN3PLAkYjOJ
 R2cFFKqQKls2rb19C3q7IXvhu6xLW8XpLUv8aFCDImY8pqnZdbL2m7OmQy4Fu8iywnow
 USHQ4EjaMaCc2MjlQt85LMkMab3dhUf4xq66eTOG8OTMguSe1eR2cP3quYvwUmUEoEKZ
 Ps5s+qqH8lmmKls9oWfc5YdRK/v2iDJNl+a+aAJFZ4smQA4AoE6Fuhqo5jOK/oSa0EoB
 MljN9ern5zuxg7BfLtyv8tdO2JH7V4558oJFu1xmko6uHeoKa9rELAdEWSaSeiL5s8zf
 ycLA==
X-Gm-Message-State: AFqh2kq/cWbjVNXrUd1DZ2TofoFILWxcyKN8o2XXOAGnTSdw1uP/yGdi
 GwNhf60VPyxbx4leI9MiyYy3NA==
X-Received: by 2002:a05:600c:48a8:b0:3cf:7197:e68a with SMTP id
 j40-20020a05600c48a800b003cf7197e68amr825021wmp.18.1671615821025; 
 Wed, 21 Dec 2022 01:43:41 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 k31-20020a05600c1c9f00b003d22528decesm1743716wms.43.2022.12.21.01.43.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Dec 2022 01:43:40 -0800 (PST)
Message-ID: <886e896f-a111-d820-defa-198f05b8fba5@linaro.org>
Date: Wed, 21 Dec 2022 10:43:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH v2 2/2] hw/arm/virt: Make accels in GIC finalize logic
 explicit
Content-Language: en-US
To: Alexander Graf <agraf@csgraf.de>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Zenghui Yu <yuzenghui@huawei.com>, Eric Auger <eric.auger@redhat.com>
References: <20221221092850.61332-1-agraf@csgraf.de>
 <20221221092850.61332-3-agraf@csgraf.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221221092850.61332-3-agraf@csgraf.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.161,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: eE3jovZrdBgy

On 21/12/22 10:28, Alexander Graf wrote:
> Let's explicitly list out all accelerators that we support when trying to
> determine the supported set of GIC versions. KVM was already separate, so
> the only missing one is HVF which simply reuses all of TCG's emulation
> code and thus has the same compatibility matrix.
> 
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> 
> ---
> 
> v1 -> v2:
> 
>    - Include TCG header for tcg_enabled()
> ---
>   hw/arm/virt.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

