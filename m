Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp2164755lfb;
        Tue, 7 Jun 2022 07:46:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyMN6p56U/KWfQtqLdmNNEYZzh2CFsDt4/D/V440tZX8Fo7GDcZ/1ewZ7LEJWtlpLuCVSUA
X-Received: by 2002:a05:620a:4043:b0:6a3:9cf7:f73d with SMTP id i3-20020a05620a404300b006a39cf7f73dmr19585303qko.416.1654613162834;
        Tue, 07 Jun 2022 07:46:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654613162; cv=none;
        d=google.com; s=arc-20160816;
        b=iCDbnyUUKDgj3a/GoaHKuPwcho+XpQG2f+VqnQsZkuUyq+1CPL6snjdnemYnjutUoq
         7KNUafFpNyJAQBBESmc/v/8zo6INtLqIC7GHA6VG3cpzLymb22rQl6ik6rbIMmZvJta4
         ec9Qm8JLQgFH8grNx9jyFC2ApNRvojMYIAnB3vZbA4W68rEi9vnua92Drn0mv/ov82zw
         LRXf4yPhbDEDB0icus5Rq55huS8JC5tL79B/zmyGWALTNlcCo+EOdacOmrBlQ/oHl6Ng
         EECgUgelI6kpzMVkec5CFKyYmE76S4RR7AeqrAvfxQbz8c4crorzbTIZ4I9K72SQRU1A
         3hiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=NYP6EcGuYyM5Kx6C24nF/gjKPhCAJ+oZI03GFIBNpwA=;
        b=VICohLAel/qPBPsyENbKXa3fj318qv+1ccOFAzfjoHAadKllxQm2fXAFcFhKmCEH4X
         FCuksjAuk/TH6PUaKTs54bswg7eCqdxG3QONwe4+qtxnVtjFZDcDnYo9T7/JmrWhPdqs
         K84/Q1VmE4drbaKVFTw7DZY21hCOcQw8YASKj7qyHNHPheqG6MWSAZRRljMhedA9ZoAG
         l2M/+38sRiAF9pku/KIuV3WGF2badkjGJyj4cfV06v0StH0vipsEDYLhTSX36vSbYTT+
         1xsNTbX/6eW1iCsd57meFVakmlq6jz/iBWU53gMsblrtkx6opZZqQjhNDFMqZ3EBig8+
         GHiw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WKqRxD9S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u13-20020a05622a010d00b00304ca068af0si9687766qtw.212.2022.06.07.07.46.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jun 2022 07:46:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WKqRxD9S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nyaT4-0006gv-A0
	for alex.bennee@linaro.org; Tue, 07 Jun 2022 10:46:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyaSb-0006Yw-Hi
 for qemu-arm@nongnu.org; Tue, 07 Jun 2022 10:45:33 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:45773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyaSZ-0006du-6a
 for qemu-arm@nongnu.org; Tue, 07 Jun 2022 10:45:33 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 w2-20020a17090ac98200b001e0519fe5a8so15609724pjt.4
 for <qemu-arm@nongnu.org>; Tue, 07 Jun 2022 07:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=NYP6EcGuYyM5Kx6C24nF/gjKPhCAJ+oZI03GFIBNpwA=;
 b=WKqRxD9SYbRwm/ksYVMtdGY05WMMzCQzXfnOoGufUDd8zWVuE7QX0NHsY3Cz660sD5
 iYOGYf0AxAxrixykk9GMjvRyJusTewihHnbcAz1dTT1qfvQ4/KGBteiap6O/pxHfjaf/
 4Ln+jHKj0iqf7+RFCoGwH5EmZXuP4j2s3HTgbh2gJr5LWQVFw/wZUl0AKOK+VhUYc8r5
 gW5iyoE1jOJMluLH7suhGpaWd43sguz5BXOw7fnSOGR1EWBoGfcjJdzEB3lCK2XSRLPC
 kPJYjfmfmpsNsFl+dmWPgrXVPiM2kmXoipFqyeMv5SEirLaFsBgKPSN55XkqYMu+dbzy
 fYrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NYP6EcGuYyM5Kx6C24nF/gjKPhCAJ+oZI03GFIBNpwA=;
 b=fZ2t8278c1fkpkl9r2REyMP8X9gQ1HbIvylEEF/LxYJrptLVf7SFK4EG6aqpDKctEa
 fifXSjIJRRWZyvwzsgaoFLV4Se/v16AEmVfKDalpxSrbhRBbTp2jCXxggqJuM1YUuZDB
 8gTenU0EC5gepEWS8Drf6hnsjcwEnw7XV/hEDr+Bk/d/7o6eb+DBvn73GuRfybLF7Fi/
 DChHpXPKNJWpqu/tCiQmqgw9cmWfXSeoEq3cpO8Po857NcdyUGaRcKdQAgcT32FrirxB
 k2D+2TsyQE6B3RG1u4jWWuqX05FAy5qeGNHwN+7utWwpFeQOZAMdnSWgTbEuO6Qcmkm2
 ED7A==
X-Gm-Message-State: AOAM53115mGZq5A5Ew3BuQjOSXIsr1N5sGMvX+Eu13oz4ppERVfR65Kb
 sho7VO+khvX1GSjwo5gJlQa1rA==
X-Received: by 2002:a17:902:ed53:b0:166:3e43:7522 with SMTP id
 y19-20020a170902ed5300b001663e437522mr28701095plb.170.1654613129210; 
 Tue, 07 Jun 2022 07:45:29 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:3cf2:c634:5b19:25f6?
 ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 bg13-20020a17090b0d8d00b001e08461ceaesm14666078pjb.37.2022.06.07.07.45.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jun 2022 07:45:28 -0700 (PDT)
Message-ID: <dd67c361-9721-17c9-0d6f-0118a7a9ab0e@linaro.org>
Date: Tue, 7 Jun 2022 07:45:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 37/71] target/arm: Add cpu properties for SME
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220602214853.496211-1-richard.henderson@linaro.org>
 <20220602214853.496211-38-richard.henderson@linaro.org>
 <CAFEAcA-JFvMM3yY=q=nBbrs_Y47056NLgtQTqdYqTKmgLZfWYA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA-JFvMM3yY=q=nBbrs_Y47056NLgtQTqdYqTKmgLZfWYA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zCHJlmjroOR5

On 6/7/22 02:47, Peter Maydell wrote:
>> +void arm_cpu_sme_finalize(ARMCPU *cpu, Error **errp)
>> +{
>> +    uint32_t vq_map = cpu->sme_vq.map;
>> +    uint32_t vq_init = cpu->sme_vq.init;
>> +    uint32_t vq_supported = cpu->sme_vq.supported;
>> +    uint32_t vq;
>> +
>> +    if (vq_map == 0) {
>> +        if (!cpu_isar_feature(aa64_sme, cpu)) {
>> +            cpu->isar.id_aa64smfr0 = 0;
>> +            return;
>> +        }
>> +
>> +        /* TODO: KVM will require limitations via SMCR_EL2. */
>> +        vq_map = vq_supported & ~vq_init;
> 
> Do we currently forbid setting these properties entirely for KVM
> (or just not provide them) ?

I do not provide them.

> These new properties should be documented in
> docs/system/arm/cpu-features.rst, similar to the SVE ones.

Oops, yes.


r~
