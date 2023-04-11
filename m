Received: by 2002:a17:907:2c4d:b0:94e:1233:1117 with SMTP id hf13csp459886ejc;
        Tue, 11 Apr 2023 05:17:34 -0700 (PDT)
X-Google-Smtp-Source: AKy350Y+5YaipjKkOaTkGr/mzrt+1+X6Qqg6+LDYczZmiLRiqfLd8T867cQVRiHz2vyWjsFGWYlJ
X-Received: by 2002:a05:622a:1a9d:b0:3e4:bfb2:1f64 with SMTP id s29-20020a05622a1a9d00b003e4bfb21f64mr15894839qtc.20.1681215454201;
        Tue, 11 Apr 2023 05:17:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681215454; cv=none;
        d=google.com; s=arc-20160816;
        b=0vcGND+YRJn8TDRKqzitKwwpldRVCX5sWAZYJd62taQBQm2zDmjvWqy9bA7w5iBFv0
         az1x7xJp7m3lrZrdJhNp6dwsZjkVNMEcgEsuQeH55AdfOSBSR7tKYZCULdWxAS06YBZc
         46PjN06aa+ZTjKUYmlG4D49LYbM+geK7Q37VFvxoqSEMh9jQb2JA5dzmwX6hg3MMlIBY
         z4IydOOxixuORODEEcpNg29i32e6mFxBEB/WVYUCi7eB7aHaoMTlXpAzItlalcKNnts4
         MjeQpZ+Juy7WFCo3b6lTPwPMQNgQONnsO3XNkIMLs2LXEmBkJ8ahYHrFqQzdZbMYxJhy
         GT2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=fRUKW6u5mJOe+ofai1IWzRGRS5UDuKRXTn5POZtj3ZI=;
        b=g6rUp8nirBCv3szVtIrT5gXWAxv/jX/A6BkC/bQ3i9QhRPttZiFAyYZjEehF9acbpM
         YnpSJ+eR5iYYvkAKZIY6lenVpm7lbsM79bGw9rmATWWvQXsIuo5l6ae3jjiSnxobCzJZ
         13oTBZahGjg9gWbL15bt1fepO49sD+vWsC4wdyvRiZdnnORQ7QXfSaWb874stv968tq/
         qiW6A2ZXLAdqmu8BLTOTbiq9U2ofdA1SfwryQi1Bu6Z93shNK8TBQuPzA58Ix/LBOCCP
         +i6gecFOHRUapNOAcTz2gjappZ73VHC8URtWmgzkKBRxVqGma55k9tVbvMdc0Ut0CiCa
         39Ig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=auuBkAuk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w9-20020a05620a424900b0074883d42522si9063210qko.286.2023.04.11.05.17.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Apr 2023 05:17:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=auuBkAuk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pmCvu-0000fV-U6; Tue, 11 Apr 2023 08:17:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pmCvt-0000d0-FQ
 for qemu-arm@nongnu.org; Tue, 11 Apr 2023 08:17:09 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pmCvq-00069I-PF
 for qemu-arm@nongnu.org; Tue, 11 Apr 2023 08:17:08 -0400
Received: by mail-wm1-x32b.google.com with SMTP id s8so4439597wmo.0
 for <qemu-arm@nongnu.org>; Tue, 11 Apr 2023 05:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681215425;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fRUKW6u5mJOe+ofai1IWzRGRS5UDuKRXTn5POZtj3ZI=;
 b=auuBkAukQ76z7prOYBSVilZAcsLHyAlpyImCjt+HiWRF6mdUgm3AZZcD1aN8cJaEVx
 j2rqls49/AxccVBjWx8cYcKDl/rse8H+nW2JbFph8WPOCcnaAhc7v5pdu5H1GfpbB0g8
 EQnhWBgLivJz0HB3HciNms5H9VVdIRtGZmRNHkyo6UNV2SfBVoHCwO6I/DTiTUaGioJP
 Q0JSyZS5uUQ35D+SGcjyEUayARkyt6MQhebhiAFN69xL9CH3NxFVaK8VWjOUADi51tew
 o4qXlwVJvlEwSxf4YVV/GjoqpucpNrKmugFiA8Wm2bTd57I0Fjs6eJdmotV4ec6vOz0n
 GlDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681215425;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fRUKW6u5mJOe+ofai1IWzRGRS5UDuKRXTn5POZtj3ZI=;
 b=h/YmzYb/FdlaQaVtCMa36k1S8Q6z0gvcAiI0fnCvEHRuXtY2ZH5IvlUSSakgB64suX
 WzrvSMR0zqFmwGoIdsl6Q5P6FP+FZT9lZcO03b3wfpKGWJ76/xwMg2XH29Q6ZgK/Pj2b
 SR9uH6hP8YLMNXwCFU8yf4O8N2ZZwe9g30DFqWTcWxAmpXiSFssrzCzt9RfSF5DxIwlG
 XvDGWURXt3Pg/m8TAQ4EyuSqCpqmNLdeC95Uq9MQleSN9mRbb7J9qFra4fPQUzRjFjap
 mhpGTmfDVPLuKbl4DtAgVyj4v8hZU6zvVJYPOd/Gqou5DholTgCcqW/4IWHObE/ukQKC
 fbtQ==
X-Gm-Message-State: AAQBX9dhGL8/lATHvQKQvJeQY0eOS24YPpqDCrIVesQzrUogcuMgVpP+
 ZNfgjzTwXNwuAvP6aXTiZR5Zbg==
X-Received: by 2002:a1c:7312:0:b0:3ef:128d:7167 with SMTP id
 d18-20020a1c7312000000b003ef128d7167mr10199714wmb.13.1681215424978; 
 Tue, 11 Apr 2023 05:17:04 -0700 (PDT)
Received: from [192.168.1.101] ([176.187.195.239])
 by smtp.gmail.com with ESMTPSA id
 f3-20020a7bc8c3000000b003ee10fb56ebsm16987726wml.9.2023.04.11.05.17.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Apr 2023 05:17:04 -0700 (PDT)
Message-ID: <8f3aec2e-9067-43c7-5161-b393bee98dbb@linaro.org>
Date: Tue, 11 Apr 2023 14:17:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH 24/42] tcg/i386: Use TCGType not bool is_64 in
 tcg_out_qemu_{ld, st}
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230408024314.3357414-1-richard.henderson@linaro.org>
 <20230408024314.3357414-26-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230408024314.3357414-26-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.17,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: LnsyyqWOfNaS

On 8/4/23 04:42, Richard Henderson wrote:
> There are several places where we already convert back from
> bool to type.  Clean things up by using type throughout.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/mips/tcg-target.c.inc | 56 +++++++++++++++++++--------------------
>   1 file changed, 27 insertions(+), 29 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

