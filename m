Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp1130436ejb;
        Thu, 2 Feb 2023 23:07:59 -0800 (PST)
X-Google-Smtp-Source: AK7set8Rkjv07r9DMNWbFxj+6MKFxhHAluxPro3B5EgE48BATq49UINa03lvV1pFNb9o5G66OOS8
X-Received: by 2002:a0c:f6d1:0:b0:538:e6a7:6a78 with SMTP id d17-20020a0cf6d1000000b00538e6a76a78mr2748123qvo.43.1675408079611;
        Thu, 02 Feb 2023 23:07:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675408079; cv=none;
        d=google.com; s=arc-20160816;
        b=n5j5C6aOnJiWZDp0tdYDar697PobiL+3EuInf0F49ZxhgOmsboG9+CdTaYKg2sjOiC
         jrn2gD+WbEEmjSrNdY6JmHu83HYSpGdoGz7AbpCsRjGSDRKv1lL/Wp5ss332wZRTjtoK
         ix2LItVHrFG7pW9+d3hp2DzBZrwnLTz0MV6QBp5/W9zE+Mn4MUQGDgCmjgps+0tRYJdB
         2QrFP3v35pso0kvkQwVgULjEOIpzBXkzW93hM1Z7QJuuFt8jDa70CI29DEYlted5iMF0
         AuFdagiO6d5tFFKf9/GMA56yWXUjENZihTEDp6sMic4TvLCBEQooeTJE03lZxluZIZ8G
         ekOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=UkwoTA5crTfD+nLksGxp7i1c+xcG75GH3whjkQPM5+4=;
        b=qfWC2fENDRUwbXVdbaRkuTXvYoT5Lcwh0FqGE/cut3dS7kVVLu/HErnnTHBKcZPf5U
         1YqtiFEn1r8fdX7Dhlgxux+f8Os6yjIRCfI51DeLAkMgVRjlKoFFsLaFIPn0MmcOVUvq
         B5c1BYNs68ugu0P2mHvqXt3g/STKKUtbI1Y/Ka5PdZmjgGovW0jx1mnxpD9FHWo1p+oY
         GACAhAN2HCm+90Ds4UJgfblnQ57CrMfvaDhX2Wdqzxtqn9bpUGKyBQnaI855lwqHnmBA
         4VFdBot7hmfdVPDqDDMFFfHT3H0Wnbgu7BNTIucs9uQlqSp/vtZnegm+RjwJ5/7ClO+2
         w2ug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cY+MUI6D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v17-20020a0ca791000000b0053c83eb203asi1151483qva.90.2023.02.02.23.07.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Feb 2023 23:07:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cY+MUI6D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pNqAU-0007yM-HC; Fri, 03 Feb 2023 02:07:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNqAT-0007y4-F6
 for qemu-arm@nongnu.org; Fri, 03 Feb 2023 02:07:29 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNqAR-00074r-P2
 for qemu-arm@nongnu.org; Fri, 03 Feb 2023 02:07:29 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 m16-20020a05600c3b1000b003dc4050c94aso3128851wms.4
 for <qemu-arm@nongnu.org>; Thu, 02 Feb 2023 23:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UkwoTA5crTfD+nLksGxp7i1c+xcG75GH3whjkQPM5+4=;
 b=cY+MUI6DZRt0R3a3FrXksGwRWxwcWIaCa1u9vpJ2pT4Q40wQ9OcxAtAMWkyRDDsa9O
 AnBNeee+Dk1Cnlrxd9nHJgq03nVN5RNd4X6fkU4Tm67ZncM47n+wX4EX8xb5IEWyxIGk
 pey1y87m/LcZMCKjmL7aQ4+VUXMvFwdYNtBweGZX5QreezKobJoD26ivDB+Vmn9CNAyq
 FlJsbKnSTLDGmiwsSd2C4/mMJ0X9KtUhwZPModlysiCb5x9/8F+6Cibvi9V1cVXquYcz
 p38CR2lEvgE5AkpJFg17XNT18GRvPx+mtz0fdXvRgrFXCAxTdObzxO/cKDUSs09lWZ4p
 Rxww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UkwoTA5crTfD+nLksGxp7i1c+xcG75GH3whjkQPM5+4=;
 b=6ds79bjT/Wf7xQi/9xLii52ysPJqy4MfV+9PoXRjytfmzBgr+H80nlx7ShOrgYKubZ
 3jbhFSuPpr4PUtBP9U0finN/5eGf2T7FgpMuDT/IgEZSNXf8Oud65t6a5fkrBpJQW4uS
 /WKPyYu8cklCBLPF0uCSPmTqCrQU3ay9MIquhQLuzuC2JNhH6k7W3HxyHd/NTj5Sj8fq
 34DV9AFzqfavNYKHBkk9/sXvyAwVTh8IU6GY+37lqQjBm7xPyXMfep54IuXA9qgvZbDp
 xcU0LpuUa+YaCXkgX5d4ctsCNed+4pyznCat1GpUaNMNtx7LdZn3XbbqeN+f80Ghcjsl
 DbRw==
X-Gm-Message-State: AO0yUKWaG5OfKGSViTek/o0tvhduNM1Zz72+XtSAEq7+L0T+fSmRkSUi
 BTk6SbZYAPPZXO1+05Zehdh9IQ==
X-Received: by 2002:a05:600c:3544:b0:3dd:1c46:b92 with SMTP id
 i4-20020a05600c354400b003dd1c460b92mr9213005wmq.16.1675408046205; 
 Thu, 02 Feb 2023 23:07:26 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 c14-20020adffb4e000000b002be0b1e556esm1205973wrs.59.2023.02.02.23.07.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Feb 2023 23:07:25 -0800 (PST)
Message-ID: <d4ce9573-6f8c-1970-a2c5-f798fa8403dd@linaro.org>
Date: Fri, 3 Feb 2023 08:07:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v3 0/2] hw/arm/virt: Handle HVF in finalize_gic_version()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, Alexander Graf <agraf@csgraf.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Zenghui Yu <yuzenghui@huawei.com>, Eric Auger <eric.auger@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>
References: <20221223090107.98888-1-agraf@csgraf.de>
 <CAFEAcA8Aim73+og4dr5hD93mTZ8xSWZ-oxMSEY0x6Zs+vTC2pg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA8Aim73+og4dr5hD93mTZ8xSWZ-oxMSEY0x6Zs+vTC2pg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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
X-TUID: w9RrjiuLkhtR

Hi Peter,

On 2/2/23 18:57, Peter Maydell wrote:
> On Fri, 23 Dec 2022 at 09:01, Alexander Graf <agraf@csgraf.de> wrote:
>>
>> The finalize_gic_version() function tries to determine which GIC version
>> the current accelerator / host combination supports. During the initial
>> HVF porting efforts, I didn't realize that I also had to touch this
>> function. Then Zenghui brought up this function as reply to my HVF GICv3
>> enablement patch - and boy it is a mess.
>>
>> This patch set cleans up all of the GIC finalization so that we can
>> easily plug HVF in and also hopefully will have a better time extending
>> it in the future. As second step, it explicitly adds HVF support and
>> fails loudly for any unsupported accelerators.
>>
>> Alex
> 
> 
> 
> Applied to target-arm.next, thanks.

Did you squash the changes mentioned here?
https://lore.kernel.org/qemu-devel/3278ab81-ccdc-9ccc-e504-dca757db5658@linaro.org/

