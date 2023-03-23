Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp20891ejb;
        Thu, 23 Mar 2023 10:34:31 -0700 (PDT)
X-Google-Smtp-Source: AK7set/6cGufYJWcUDFgrv2dgHzBrQ8L+TGYUZxY+24dwS0uZ5+tzqcaEhQpy1x03Z0Q9t3gB6tR
X-Received: by 2002:ac8:5c16:0:b0:3df:50ef:fafa with SMTP id i22-20020ac85c16000000b003df50effafamr277694qti.4.1679592870828;
        Thu, 23 Mar 2023 10:34:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1679592870; cv=none;
        d=google.com; s=arc-20160816;
        b=AzRhnuyEscxQE/oc5ca3AR6MCPrHpa1kwkbm380r+LpC+ODqLbSpqLxGz6UXnffy44
         vMkT5EmmRFho4MBIgh924YsvPhwfUIrFJkf61HwGfgKnc01ijC+Km8iJ2QOUmUtMNPnd
         OFPfW7NJIvU8zQDLFLdKJrXPjpv9c9+OUb5FFCB44bgb4IuW9sbehps7qxYDu0AVfE/v
         fSWckgAnZSyTfEUGiK1pHp46VGsRAcwAEMVt2RD1iczOEIjCF7YVIDwljWAT6d0PTYkP
         SMWo3bSFIra7NSs9Bk5/DTfH1nezTfzVsQpfIKbgaXyVspiXXr36YM5TeKNyEhFKT2ZI
         zHXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:cc:from:references:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=1DoOBGBUxhoP7443HeZHhbsYxlHpAyri1FdzgqDGvN8=;
        b=uNHroZrDGzB0AJswo/BHNU557wzqVrNgb2WcNLgLX7touZ2eSWXSWQFFUIkvTks/b/
         wAZAzGbk+ubem7ODM+snxgnckI21OLMGwmYyK3FKpddZIE6iQOgB/G+ff/4IUMqNv9cQ
         zOdGpfUo+xeG1LscNtpUgbQVd/NX2dTRriVjpQfXjDGQP6fZDb8I18xExnF2I04+l5KL
         K4/6fuyM7g4DBWVNKRsJ6rKBAwgHTdgHxTDFo81G2Quehrh37MnOK5HDJMWtTHv70YRs
         /bXL4fv4lfBn+TbaIWyl2GyvZjNcN4jlss76Zb5mwLPzBee42hzXSDtBPcXAY5Jn35Ex
         ad4w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CrAX8EIb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 192-20020a370bc9000000b0074679872199si8464407qkl.15.2023.03.23.10.34.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Mar 2023 10:34:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CrAX8EIb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pfOp8-0007t6-Np; Thu, 23 Mar 2023 13:34:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pfOp7-0007sc-HB
 for qemu-arm@nongnu.org; Thu, 23 Mar 2023 13:34:01 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pfOp5-0003gX-Se
 for qemu-arm@nongnu.org; Thu, 23 Mar 2023 13:34:01 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 p3-20020a17090a74c300b0023f69bc7a68so2792089pjl.4
 for <qemu-arm@nongnu.org>; Thu, 23 Mar 2023 10:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679592838;
 h=content-transfer-encoding:in-reply-to:cc:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1DoOBGBUxhoP7443HeZHhbsYxlHpAyri1FdzgqDGvN8=;
 b=CrAX8EIbvxvEQyz83c982wIQZGOx0rAliuwPmqm6YNAK7YPPRHdtRcB53aH/NW/RaJ
 QimM+UpJhb+uja/YLnYCtY4Sq9b1fz1W/VxV2iZJMwoJdR6vrMIqMVeRycCQXGiyToio
 IKNQCw776yKOvFU5gkf9hY+1nF9w7NNBR/V7SX2u7Ly/27Tt00+ZiIPOwvm6C/3dPeey
 yBBeoBg0cmDwL/lVoM+h/vHbO35KphgrqzRSeqFWPBnZjBvzIQGsH44WOv4Lz8h+U/KX
 1Y4Tq7ZSLZwgqjeR+j7IUR/eVHfh3AwRnQgFK62WJKbU99uKbWc9akQ/dCRnRz/OVj+O
 AVdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679592838;
 h=content-transfer-encoding:in-reply-to:cc:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1DoOBGBUxhoP7443HeZHhbsYxlHpAyri1FdzgqDGvN8=;
 b=XYLVczNuaEa6Ao3NfDdkDO/TEix5kApdibvqdbydjszlABcGVhG27Nyum4oXECA9wZ
 RDwfb7qKWJk40+XIrS0YMk68LW7r29qO0FE90ot+9BNT795nE6qbx00GfSaUK2Tl1ICs
 53HZDjmZbLmWskgCr+LSUEx80+xkZqWPxo91gI+vGk57xChHINUoabt7lSPutjuUGvzA
 AALj1BdvmSWJX9OiXurLMSVJvwXAr640EdkpG3UxxBWxZbh2xRY1xictqHHFUyLeX9Ex
 d+FWo8biAmojsprFvoqUjVhKUBuQs0A53YXoQmjZNjbGQDG0TvaGFPs2wAmSj/zOz/+h
 ddVg==
X-Gm-Message-State: AO0yUKU/KBtZKbxW/YUU6hISnLVpoioIwxKjPBJJg8Jn9KARFU9Hh9kz
 p1YyDk29+3hmv4tLHnoe78iWuA==
X-Received: by 2002:a17:90b:3a83:b0:23b:569d:fe41 with SMTP id
 om3-20020a17090b3a8300b0023b569dfe41mr8326352pjb.7.1679592838365; 
 Thu, 23 Mar 2023 10:33:58 -0700 (PDT)
Received: from ?IPV6:2602:ae:1544:6601:226e:47e1:b8cd:a957?
 ([2602:ae:1544:6601:226e:47e1:b8cd:a957])
 by smtp.gmail.com with ESMTPSA id
 hv19-20020a17090ae41300b0023b4d33bedbsm1570202pjb.21.2023.03.23.10.33.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Mar 2023 10:33:57 -0700 (PDT)
Message-ID: <4f8e0e2e-60fd-a38d-5026-524d5bdf17dd@linaro.org>
Date: Thu, 23 Mar 2023 10:33:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 1/8] target/arm: Add ID_AA64ISAR2_EL1
Content-Language: en-US
To: qemu-devel <qemu-devel@nongnu.org>,
 Aaron Lindsay <Aaron@os.amperecomputing.com>
References: <20230322202541.1404058-1-aaron@os.amperecomputing.com>
 <20230322202541.1404058-2-aaron@os.amperecomputing.com>
From: Richard Henderson <richard.henderson@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 "open list:ARM" <qemu-arm@nongnu.org>
In-Reply-To: <20230322202541.1404058-2-aaron@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: WOo7ycuiI/Tb

On 3/22/23 13:25, Aaron Lindsay wrote:
> --- a/target/arm/hvf/hvf.c
> +++ b/target/arm/hvf/hvf.c
> @@ -507,6 +507,7 @@ static bool hvf_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>           { HV_SYS_REG_ID_AA64DFR1_EL1, &host_isar.id_aa64dfr1 },
>           { HV_SYS_REG_ID_AA64ISAR0_EL1, &host_isar.id_aa64isar0 },
>           { HV_SYS_REG_ID_AA64ISAR1_EL1, &host_isar.id_aa64isar1 },
> +        { HV_SYS_REG_ID_AA64ISAR2_EL1, &host_isar.id_aa64isar2 },

Ah, I may have given you a bum steer here.
In MacOSX 12.6, there is no HV_SYS_REG_ID_AA64ISAR2_EL1 enumerator.

Irritatingly, it is an enum not a define we can test via the preprocessor.
In addition, the form of the enum,

     HV_SYS_REG_ID_AA64ISAR0_EL1 = 0xc030,
     HV_SYS_REG_ID_AA64ISAR1_EL1 = 0xc031,
     HV_SYS_REG_ID_AA64MMFR0_EL1 = 0xc038,
     HV_SYS_REG_ID_AA64MMFR1_EL1 = 0xc039,

suggests an encoding of the system register number, so we would eventually be able to use 
0xc032.  But I wouldn't want to try that without the interface being properly exposed.  I 
don't know if some later version of MacOS already does so.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

