Received: by 2002:ac9:4144:0:0:0:0:0 with SMTP id u4csp584793ocg;
        Fri, 7 Oct 2022 09:17:01 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5XMbsnF9LttD/PWa1kn0+/99jl+mJbEgDFXI93rPBgro4os1QHygluoGJ3QIvFZtRGrluN
X-Received: by 2002:ac8:5e54:0:b0:35c:c7f1:7234 with SMTP id i20-20020ac85e54000000b0035cc7f17234mr4947346qtx.656.1665159420685;
        Fri, 07 Oct 2022 09:17:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665159420; cv=none;
        d=google.com; s=arc-20160816;
        b=TZD2GGIBjU2a33RZmFQQ88ettbZn9eJo8PqFHyzMF2ZJaIrb/9ApzMTmWosNMKLhkk
         zAkyQAC+KYPdHiTtZ14g+3wOp1omyMBEPfRKz/HkQv+phl87h8LKpWuwlL7AyOApDUDN
         45vUAQGDrt3YPYucsxcRXRcX+qYU0F3p/y5PRIjRgIqx9a8sPHKaIrkd/tA0PKd2o3WP
         fwfQQSkoRU8i72jXLmGZyHbqoMAhJZb42019GDCmbbDB9w0wol04BMhleusQXKQknWD+
         sRcDOu2LK+J6EVO2y/Z4Kotc3i/UR1R8E0fw1DiAcjO+btVoT32+Pci7vS6vipFp1kM5
         zWbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=1+Lo3AC1nsFpB5DKHvmL7jrTlqjaFxxL7arLwBA6Apg=;
        b=y19cc/ZqJzqAniIJx5P6DxyqLDxnfHXTCnrn18a05rifDXZuQ4PWrSc21JqclUdyXO
         Ub+7T8m3w9KMhEpJFFlpF5mZDgkB9gv1acTr8oeDKQ2NUR5UaXoytDeLUVUQvRhTfr6y
         TMF/8SkTJ+Va1TwQIwP7hXsbKidMng4lfbTLYrxLFD10VoPUFJyjWKLL4WLyGLz5itKb
         zZueqvVlsqBC/hH8KDzbLcEu7aPX6/viOuCtsvViasOAwcotfeRbd06HNCV7QHudK34I
         OCEJntplZ9D9KaCTsxQI9z849Siu11rgiMIM5ORzkNfy1urEdNC2Fkgjwl4QXaDMrc+S
         TSWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Dl3nHAJM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r26-20020ac8425a000000b0035cea7128afsi1282575qtm.287.2022.10.07.09.17.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Oct 2022 09:17:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Dl3nHAJM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ogq20-0002Ar-9p
	for alex.bennee@linaro.org; Fri, 07 Oct 2022 12:17:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogpQ1-0006mS-RU
 for qemu-arm@nongnu.org; Fri, 07 Oct 2022 11:37:46 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:44572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogpPz-0000Hh-WA
 for qemu-arm@nongnu.org; Fri, 07 Oct 2022 11:37:45 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 t10-20020a17090a4e4a00b0020af4bcae10so5045285pjl.3
 for <qemu-arm@nongnu.org>; Fri, 07 Oct 2022 08:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1+Lo3AC1nsFpB5DKHvmL7jrTlqjaFxxL7arLwBA6Apg=;
 b=Dl3nHAJMFyvlXrsYTy/L8UPy5ahqzVMihAzicyXqpeOj1cmwwo5xMHBkkuqIBLxGrP
 rzsdN8dpPVz6SV5oIg/M8s/Xl+whQ766daatvSy99CVxFY6qAhaPaGp73ipviGeJqYsb
 T7ZO99AgWEAIlgg3lYWSSg6HLRatJHZCAUbFLMiqRRWSLUzdax4Z8nMC9okEgWOmAcz8
 ML22pMMIu9doHOY7Kb7hdQkCLQmURpru9tNvGaC/+kHKbjApGCFqjaCTeN6aIbnuIqbI
 noC4IcaLoiAnwAkPF6Posq1anKfgMbMk1kCpO5XAv6HUXHq/WT/gnnuKA/UUfVpwNsZk
 9nuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1+Lo3AC1nsFpB5DKHvmL7jrTlqjaFxxL7arLwBA6Apg=;
 b=xfWuA4v1vJiihlsUvxBhWIz4Thr5U8NWgru61t269v7zQCnM82NlHP8LzyssdKMszt
 fU1oblqttewLMdIBH8JnxymdR8B5xJA1F6kvq2rXjteOLPlpCuuPLxFqQU7GowAM9PtM
 WQbeA3ZSm5txtEV/APc3RTcT0ApyHca6LjQn4n6rMluAgoMVV8cKAiwDEhcTMvNl+HmZ
 LxL8VkmuZZFWExMk5HkWVoHmAtK2qrey4aQSu8RQwrvyYwvIhFnBCh5fLyli1izia/vg
 t+B7AvLe3ueazEbXwgxj0gjt2JDs+f9TqXDmrmLBJuQqc1PUoZPBtNT0aE3lJvr5EPt4
 4J7Q==
X-Gm-Message-State: ACrzQf1J6sSSP+C89PlxJ7WzqzgIi9fJo8J5qRGgaQfUsENU4V00UgeQ
 PwyixV3uXhFnQzVu3+pbxL7GAn9qbtBoCQ==
X-Received: by 2002:a17:90a:14e5:b0:20a:db09:a355 with SMTP id
 k92-20020a17090a14e500b0020adb09a355mr17764515pja.74.1665157061407; 
 Fri, 07 Oct 2022 08:37:41 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:3b6c:3864:9643:140a?
 ([2602:47:d49d:ec01:3b6c:3864:9643:140a])
 by smtp.gmail.com with ESMTPSA id
 f14-20020a17090a4a8e00b0020b092534fbsm1630627pjh.40.2022.10.07.08.37.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Oct 2022 08:37:40 -0700 (PDT)
Message-ID: <21eab094-34a5-6e02-6bf4-3ac4c70955dd@linaro.org>
Date: Fri, 7 Oct 2022 08:37:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 32/42] target/arm: Extract HA and HD in
 aa64_va_parameters
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20221001162318.153420-1-richard.henderson@linaro.org>
 <20221001162318.153420-33-richard.henderson@linaro.org>
 <CAFEAcA94XFJ1d0Trn08cMvxnDCxd+SGwJuG1ZQZaUb9g_FZg_Q@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA94XFJ1d0Trn08cMvxnDCxd+SGwJuG1ZQZaUb9g_FZg_Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.699,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OTWbW1QOzZ4L

On 10/7/22 02:24, Peter Maydell wrote:
>> +        .ha = ha,
>> +        .hd = ha & hd,
> 
> This is a bitwise operation on two bools, should be && ?

Bitwise works fine, but I can use boolean if you like.

I'd be surprised (and filing a missed optimization bug) if the compiler treated these two 
operations differently in this case (simple bool operands with no side effects).


r~
