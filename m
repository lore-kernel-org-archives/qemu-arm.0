Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1539916lfj;
        Tue, 3 May 2022 09:45:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxveY0JUvuvhyhMxyfYgyBNoHgFO2/gMLYC6hQo9CMz/Y2RtIT1L8rdwcmd6ky++zxdS5g9
X-Received: by 2002:a05:622a:13c6:b0:2f3:a7e5:2c5f with SMTP id p6-20020a05622a13c600b002f3a7e52c5fmr7548893qtk.558.1651596355251;
        Tue, 03 May 2022 09:45:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651596355; cv=none;
        d=google.com; s=arc-20160816;
        b=f1B6PlTvao9xIIK9T4wu4P5CIa8Exvj68VR5yXn+2WPSB47hoUfxjV+c82eFHX8v5l
         w1HN0TT42FJ12ZhXyrVUCz5c/C5MzqVxLqBkIItP+/99AanjEVmRXcYUC/m8uOYyIDdG
         ax9ajUJ6N2H/dlu2e7HYpfUped91HTaYWY6BdJcVGH0Y5xIdNVRvCN7SojoQhlmYq649
         +D+7He8PBOYIr44tH9nFPq+BMxk8dM9yFv3XM5K3m3dUzjoUqzLX+ZOUo3FU2NzM5uAA
         C9OfbSg/dglNKZoXon0tevVM/4vh3HhP/4BYZ8Uvy7ZPNfJauSWVjnaP3asvvo9SMXqH
         1D4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=RLF5/W3IuH9Yj8t7hqDK7PyODo2uegZZGGlMK7Nstbs=;
        b=GPnZuVBkN/4E/HAmmZmV8MXnphfVzD/AKfyDs58O5bjyqpN7tUbB63iRNf+HkI7Qg8
         cxBA5bG7LwhkBQF4qW4LyQW6zg0Tseg0OxeJwM9QEUUyll55iFIypGPZ5gTTi/gIhFE7
         iP76eonptna+ggQmgzQAwtnaWlYaxv8Uj85nsgzgllkZPkXMp6yvaW8GHIPYef00xVG0
         T3WgJ/IhLu96IlhLYwnbqdJb5VOewr/Io36MQERVPXm4QzCl6mdJcqEKPrSL3XZjhbmN
         B4RlSNIP4BtIgTfy+1pILjPsUxkWLHDL8nBcpB6PHUCuEojVZ1saLbB2+VeJWQMCYtxy
         xjVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x07od6kX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u16-20020a05620a121000b0069f9bcbc996si7362482qkj.174.2022.05.03.09.45.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 May 2022 09:45:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x07od6kX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nlves-00064t-OI
	for alex.bennee@linaro.org; Tue, 03 May 2022 12:45:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlve8-00063U-HM
 for qemu-arm@nongnu.org; Tue, 03 May 2022 12:45:08 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:36367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlve6-0004Dm-5V
 for qemu-arm@nongnu.org; Tue, 03 May 2022 12:45:08 -0400
Received: by mail-pf1-x435.google.com with SMTP id z16so15185179pfh.3
 for <qemu-arm@nongnu.org>; Tue, 03 May 2022 09:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=RLF5/W3IuH9Yj8t7hqDK7PyODo2uegZZGGlMK7Nstbs=;
 b=x07od6kXQobaypaC7asRdxwZe7JV+GiGqZMKrFSpMHp/4j6uVh6yNMJqxgiScC9VBn
 o6u4ZSjwB72cfcuS43/DFjjx0twExbwdZki7BalpdpVj2O1qXHUpywNufqux2PusWHwm
 vjt6QXZaOB5Vp4o1UacgSb3bAWimuKxszFBD4BYy44UbimVss16EPCXpZoJ7lajjL71w
 s9KVZZslQjFgdWWG44s0czfnCJwLhPdTC5x5YP1hvYcN5x51C61/8Mzq5JLNq39MrfBF
 S2yulainJXHgUwRfKBi6Aq6japVvslEPssQYN8RHeLyg5KTPJmVS+RFvWDNl1VdloURq
 dcsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RLF5/W3IuH9Yj8t7hqDK7PyODo2uegZZGGlMK7Nstbs=;
 b=mZS/DYjOhaiNz+mA0ZEuriWHv6TMzYW+rYsyCsI2TZwvTfw1DZLvOwHwL3qjL/ZUei
 EEOQmdwVkf+NAsZW/+EHaYD936W4NZSE18FicUDAyeh/8gb4wy878laAPKGnsn8oB24l
 DV6zwwY7djV6RZiaN5+FzBysKCn8yt2Xoqk+IZdBbcIsUQNWJBRp4Vn8AeZ/efKp9WQt
 vf6OVTmxDeQRqHPmdl7e6wQT30hxhEeLWhWX+22PzRr4mSP++5998QpdbQyzK6SUTLwi
 JkWpEwAuzaMqMVQCUwYzLEOpZpca9GTBSHW937mD3ryOkbRrZmO1dogb2amsS7Dpa3Q/
 5ZFg==
X-Gm-Message-State: AOAM530a2tdxektkxS3MS8SIwb/8y5/cvVMjqW732CM9AoFk31lDblV3
 UPRS+pjBgSJRaU5gcvcZGDBnkA==
X-Received: by 2002:a63:81c8:0:b0:3ab:6025:f43c with SMTP id
 t191-20020a6381c8000000b003ab6025f43cmr14387693pgd.189.1651596304353; 
 Tue, 03 May 2022 09:45:04 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 k15-20020aa790cf000000b0050dc7628174sm6525669pfk.78.2022.05.03.09.45.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 May 2022 09:45:03 -0700 (PDT)
Message-ID: <731de8d2-2a39-862a-39fa-d208d9836364@linaro.org>
Date: Tue, 3 May 2022 09:45:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v4 20/45] target/arm: Handle cpreg registration for
 missing EL
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220501055028.646596-1-richard.henderson@linaro.org>
 <20220501055028.646596-21-richard.henderson@linaro.org>
 <CAFEAcA_i_+MrxapQ821zWBwO7QKs2k=06xQRs9s6ojRB2CyxsA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_i_+MrxapQ821zWBwO7QKs2k=06xQRs9s6ojRB2CyxsA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OId2VuYnfvWF

On 5/3/22 09:34, Peter Maydell wrote:
> "set CONST on the cpreg" is what the code does, but it's not
> what the architecture wants. In particular, if the EL2 cpreg defines
> a non-zero resetvalue then the EL3-no-EL2 CPU will get a
> "reads as constant that value" rather than "reads as zero".
> CNTHCTL_EL2 and MDCR_EL2 are examples of this.

Ah, I'd missed those.  I guess I need a third bit to indicate keeping the resetvalue, for 
e.g. VPIDR_EL2, which is why the code is written the way it is.


r~
