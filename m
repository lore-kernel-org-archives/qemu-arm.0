Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp3603815ejy;
        Wed, 5 Jul 2023 07:10:03 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6MZUmOktWLxd7fyHUmWs+K+s9cQgFV2tSkDMqxyElF7B842JrcikyGywIYrjLtR8viA1+E
X-Received: by 2002:ac8:5808:0:b0:401:e052:2c9a with SMTP id g8-20020ac85808000000b00401e0522c9amr23288106qtg.15.1688566203335;
        Wed, 05 Jul 2023 07:10:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688566203; cv=none;
        d=google.com; s=arc-20160816;
        b=FSfyJ634rRoaMQTRzHlG2s3n7y0O/kUJLjJeh92Ky4t57fYc9hiI4NcCqnHU6FYPFN
         9HSTA3Pavg+ldryIjiQC4kiU4XNLQRdz5aYUqyCh5+QXrjZQiFNG91eZa8F6vFl8XJts
         lmOguA9bhITMqdMHBh+HwXxXkakUsSx9nF72IXioZ9C0jC0TVMJ2OvXX1hIWSzov0eJt
         H0A8soRyq/km0S5jhBtJ1PN0XTJjCq1Lkq36oQXod0/Qo9egKyxsYOSUfg+D1w1GC+oq
         5AkNEge/h5lTYWdVMSoOpU5JxoJFKbpTaH+df/dBHa0KgX4M59ixoQLAYYOwVbYr0gLh
         bVdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=IT7VOjXzhE0F6KzYnB2zDoIqc9zBbn9NN57jEFx6LwE=;
        fh=+xj4Yfkfa7hWRbLS+DTrcNY2o0evBrBbm0gAigyTnIw=;
        b=pMeDXPijD4P4J5wEnfauIXhX7bpg9l5M/xuq8hNNvueD0evvFq0Jv6nFJw3ANCRQgr
         RFcSmFQK2lshKGgmTDvBgmsnqaTgHcwqME6UPejMwCBYng8jEKnynWm2i4FX51LMDHS7
         TfDmOtX+hry8KgJo6rEqTc//B7Cd2rLezjZe5zCRieK89csvE+s/xJJTBydUzz/Bh3sM
         BSG3eMEHK7OhZ21k1z5Ggzy5JcvBg8CqKVu/iae3YrluWMDfS9BDrTxCxhF5rJJZX2ix
         /JzSXhA/4PCiC7AJl08rNh/beSwpskbZf7kSJvnmqvHDVj29CFQf2biJ05D/WVHPNHnm
         Rg+g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m57GYkMt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c1-20020a05622a024100b004037526bc11si1713025qtx.687.2023.07.05.07.10.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Jul 2023 07:10:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m57GYkMt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qH3CR-0000Iz-Aw; Wed, 05 Jul 2023 10:09:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qH3CQ-0000Ia-Cf
 for qemu-arm@nongnu.org; Wed, 05 Jul 2023 10:09:42 -0400
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qH3CN-00033W-HO
 for qemu-arm@nongnu.org; Wed, 05 Jul 2023 10:09:42 -0400
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4fb7dc16ff0so10481709e87.2
 for <qemu-arm@nongnu.org>; Wed, 05 Jul 2023 07:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688566172; x=1691158172;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IT7VOjXzhE0F6KzYnB2zDoIqc9zBbn9NN57jEFx6LwE=;
 b=m57GYkMtJwhExeYpuFCL01cZ+44Y0tt76hFPwVfnWA6AHnC78R5F6sVBi7jM+sahsz
 H2un/iiUuU9pgTnq893W1JKsGupNlFzqy4M8f7JFfveW92+FHLAVbQe85/0t4T6GsPeH
 D/rCT5gGvMX6ObaOso1qoaK/Ndkj0cMgbkynrRYnCS7FaZNcEY0uqdR0/jtt7x4qpiId
 gQZlT8N8pJrHbOvn5ERY76uZw4EpbyBUIovhPKse5vztXhD3jjrAXh4m1TG+6ZvKlGbG
 +NqqzqTVnJJlywCY21PncmTrO5yYTXTF2wga1AUR+UvTXvZjUHSpwTzoaR3lu4YWSfHU
 Q/xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688566172; x=1691158172;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IT7VOjXzhE0F6KzYnB2zDoIqc9zBbn9NN57jEFx6LwE=;
 b=bWbHl3zG/O9ZyifgrHtQLMs9sKWHbHnnWfaMuL1mIIl6KXjCq0TJvToePy6wkOI0Gi
 5p5W9mqyenHAr6fE+DbjO4ZTx0uNJ9k66AmitQ8t8pUY7qojN4BPffu17bDMZGMl1Vjb
 9H5W1Mhk0WojfbRtNyrLXC/iTDG4hzeA/IQ45qPu0K4KT8xVApGKvPqIMMOYioBhZJJC
 Uu7UFqf6vPYTUyc7ZT0VaPMCyGAQmel984CgUvhN4rv4RRgbcohlthJ7V0SD3D+pUpDy
 QwIALPjySkuD0mJTalM/VClDKwfoQkpLC1TmoyLxe3nqw6ZWg+eSC87MJgb613sEYU/M
 XeOw==
X-Gm-Message-State: ABy/qLafvwHkKsMxeytYP9kqIn46jtQwst1RnmZ1u5NLCVNtSCrvafpW
 Z6VWSxcVVryD64LHg9R4tXqTPg==
X-Received: by 2002:a05:6512:3606:b0:4fb:89f5:f6d2 with SMTP id
 f6-20020a056512360600b004fb89f5f6d2mr11441969lfs.47.1688566172296; 
 Wed, 05 Jul 2023 07:09:32 -0700 (PDT)
Received: from [192.168.82.227] ([91.223.100.51])
 by smtp.gmail.com with ESMTPSA id
 l15-20020a19c20f000000b004fb8c31c8desm3981807lfc.208.2023.07.05.07.09.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Jul 2023 07:09:31 -0700 (PDT)
Message-ID: <efed6e67-beb2-dc60-18c5-af0fe1431f0b@linaro.org>
Date: Wed, 5 Jul 2023 16:09:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/2] target/arm: Define neoverse-v1
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230704130647.2842917-1-peter.maydell@linaro.org>
 <20230704130647.2842917-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230704130647.2842917-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x12d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: p9Xr1VJuJaLB

On 7/4/23 15:06, Peter Maydell wrote:
> If you're checking the values against the TRM, note that the
> summary tables differ from the register description in the TRM
> for ID_AA64DFR0_EL1, ID_AA64ZFR0_EL1 and ID_PFR0_EL1: we
> trust the versions in the register descriptions. Also the
> MIDR value in the r1p2 TRM isn't updated from r1p1.
> The CCSIDR_EL1 values in the TRM unfortunately seem to be wrong:
> the comment in the patch describes how I've calculated the
> values used here.
...
> +    cpu->isar.id_aa64mmfr2 = 0x0000000000001011ull;

I see 0x0220011102101011, not in your list of exceptions above.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
