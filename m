Received: by 2002:a05:7022:629e:b0:68:46be:293d with SMTP id e30csp2834783dle;
        Thu, 13 Jul 2023 09:30:11 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGN255roIe9KSTCdOHXSBvKrlTY/sbesVIGxAcV/JqiDEnLPfyl7M7MgmQcrGJh1cN6NJqq
X-Received: by 2002:a05:620a:29ce:b0:767:4a4:f3cc with SMTP id s14-20020a05620a29ce00b0076704a4f3ccmr2766508qkp.26.1689265810918;
        Thu, 13 Jul 2023 09:30:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689265810; cv=none;
        d=google.com; s=arc-20160816;
        b=HSK4VA2YUHOUCgYJd8b258F9rPWosv8b8Uir1H/4zYD7Zci+SUPOQdXQmIEg6b1Yqp
         czWG6tuZoktY9UfonhK6bU906iFy945QGNUwC+O6Yr1/HDczcf5/hjcO2cNdxVKVMuxF
         xO42xviVqIuZvSZR6ALXBPBAuDNe/fBZ1hAgP8ZB2FJyc4BjDsMC0cUZi8td/qsaxxsX
         EVHG1m5skpT1btkKc7rXBh9Q2Ql0PtzgyJ1iMUxQLW1f2ongUBGt4YmDwoDbcidUGKJR
         JfMKK+qjAyHxTKVsCg5DujzeNg4NSJFUjJnVHTklTyVsqY+meEmvB7+FQfe6PppF4AH+
         CiRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=j57510LUxxzsgzXCD2lvplw+84bFWXkvUzpWGy7Vq50=;
        fh=IuJo0gOGepqyNFIqYeA+6iRSAj788u5Q4DsQQJneGn0=;
        b=EIhBLTSw7UCQJ/xIjqFRU5cdlIAzzap5q9F5QVpi4JBVd6YntuOP1omacbY8uR8dQZ
         SUWFt7HD2DW3h4xlcEVjRWQ0uidyZSuP3+EtNZT9iejvY5zUZwhMO2N8Vp6m5LSCPiO0
         kSyhwEdV1RX4ENKioo8JK2e7pYtTT2PChYTWdsKI1HkNSt9Sqzqofjh1vxFzDyZhrn4d
         j8tg1fb7SxpSmbRwW5dNHzFc8xjlLrTDSni+loL/6T0NycHkfvtMRldcSjxjArhHHx54
         7pfxx1qR1Izq9AhYxvTXfYPUGx6C5CiUBXKCCECYCwAbCpzRH2F0HZgQ1tZvFkfi5qOt
         MY/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X8Ms1Udz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bs32-20020a05620a472000b00767d4a7e340si3369478qkb.119.2023.07.13.09.30.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Jul 2023 09:30:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X8Ms1Udz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qJzC7-0003tN-1G; Thu, 13 Jul 2023 12:29:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qJzC5-0003sX-4S
 for qemu-arm@nongnu.org; Thu, 13 Jul 2023 12:29:29 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qJzC3-00063F-H2
 for qemu-arm@nongnu.org; Thu, 13 Jul 2023 12:29:28 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-307d58b3efbso1067735f8f.0
 for <qemu-arm@nongnu.org>; Thu, 13 Jul 2023 09:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689265766; x=1691857766;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=j57510LUxxzsgzXCD2lvplw+84bFWXkvUzpWGy7Vq50=;
 b=X8Ms1UdzjLDOsmHKVLc2YAOoSuwS0yOMrUGiEOi5CpYmszlhVj0G0nVSy/8bgAyFiO
 LiUrlR9WaMDKF0yLD+vQ4VRYDa3ygVYgN2rzjGVR4R4IhcbXFZ+yn5D4c5SyDaeVLhgt
 RlljIuZkdeAuxWPiC5c5HrmSk3g8KZTa1LRS1VQpDtYmB9JeB4pE4hjs8olsxOYwTKrO
 rQTvwRzjWcWrVIU2nfLXUW3nwUyD+WCV+LV5/GWxNXmmaG+EqvNCjvv0EWQO4Hc1xp14
 8acKGrRW5sD0nBj10YHOcdgBtcv25tJVZU8H7sg70+JAM2dudpydnX6oejU3PWWyeBO6
 oucg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689265766; x=1691857766;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=j57510LUxxzsgzXCD2lvplw+84bFWXkvUzpWGy7Vq50=;
 b=Und034fIJNAn89nvBldVXL4SqQhld4FfWTxMl4zvuMfGTd7c9aFXdVYBb4F1StBYQF
 kkzyCMlFMCI4JnbvFaVc8TJEgDtRzG0Nw+VgLSRSpbyTwAT0DFVcRFaoEzQZ0sHduB4g
 21UJ/8E92dpUn5Cw5gJHQ5zTnoCpFG6n/vwHp3zIU+z/eZW3Kd01Q2Nq8XqvqIrc7Z2a
 Bv+Td/HHe+RZDUsXTwatNZDsCLKflpLujxwDovLVWLVTH6uXiopgeFj/BL81mmTWoBFO
 x8Z0tU9p3+8Abn1CVpUAcpLwWxgjA4zp2vGhYZt0sKA7PHAyps77z4k/RjBCrKaToP7o
 Qkhw==
X-Gm-Message-State: ABy/qLaGPX1daek/ogOFvxpCbFaWEcJgYzTZIYTR+8Qf/m6SxH3HIEUt
 68efyoV2pyeEfFOtTGHLwuH5oQ==
X-Received: by 2002:adf:ed4c:0:b0:313:f347:eea0 with SMTP id
 u12-20020adfed4c000000b00313f347eea0mr1871608wro.60.1689265765777; 
 Thu, 13 Jul 2023 09:29:25 -0700 (PDT)
Received: from [192.168.7.115] (m-109-111-99-24.andorpac.ad. [109.111.99.24])
 by smtp.gmail.com with ESMTPSA id
 d9-20020adff2c9000000b00313e4d02be8sm8356290wrp.55.2023.07.13.09.29.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jul 2023 09:29:25 -0700 (PDT)
Message-ID: <7ad244d7-2e29-74b4-e8bf-949925697880@linaro.org>
Date: Thu, 13 Jul 2023 18:29:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH 0/3] hw/arm/virt: Use generic CPU invalidation
Content-Language: en-US
To: Gavin Shan <gshan@redhat.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, pbonzini@redhat.com,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, wangyanan55@huawei.com,
 shan.gavin@gmail.com
References: <20230713054502.410911-1-gshan@redhat.com>
 <CAFEAcA8197FCwfNZrnxfO-87RveOko0Ju-KcTJOEi0vfjVtDKg@mail.gmail.com>
 <2d21e89f-c965-e8f1-3705-dfea8367fc7e@linaro.org>
 <3a392615-5aca-f384-197f-84beb3086a29@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <3a392615-5aca-f384-197f-84beb3086a29@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.096,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: wYm80rWGeTiv

On 13/7/23 14:34, Gavin Shan wrote:
> Hi Peter and Marcin,
> 
> On 7/13/23 21:52, Marcin Juszkiewicz wrote:
>> W dniu 13.07.2023 o 13:44, Peter Maydell pisze:
>>
>>> I see this isn't a change in this patch, but given that
>>> what the user specifies is not "cortex-a8-arm-cpu" but
>>> "cortex-a8", why do we include the "-arm-cpu" suffix in
>>> the error messages? It's not valid syntax to say
>>> "-cpu cortex-a8-arm-cpu", so it's a bit misleading...
>>
>> Internally those cpu names are "max-{TYPE_ARM_CPU}" and similar for 
>> other architectures.
>>
>> I like the change but it (IMHO) needs to cut "-{TYPE_*_CPU}" string 
>> from names:
>>
>> 13:37 marcin@applejack:qemu$ 
>> ./build/aarch64-softmmu/qemu-system-aarch64 -M virt -cpu cortex-r5
>> qemu-system-aarch64: Invalid CPU type: cortex-r5-arm-cpu
>> The valid types are: cortex-a7-arm-cpu, cortex-a15-arm-cpu, 
>> cortex-a35-arm-cpu, cortex-a55-arm-cpu, cortex-a72-arm-cpu, 
>> cortex-a76-arm-cpu, a64fx-arm-cpu, neoverse-n1-arm-cpu, 
>> neoverse-v1-arm-cpu, cortex-a53-arm-cpu, cortex-a57-arm-cpu, 
>> host-arm-cpu, max-arm-cpu
>>
>> 13:37 marcin@applejack:qemu$ 
>> ./build/aarch64-softmmu/qemu-system-aarch64 -M virt -cpu 
>> cortex-a57-arm-cpu
>> qemu-system-aarch64: unable to find CPU model 'cortex-a57-arm-cpu'
>>
> 
> The suffix of CPU types are provided in hw/arm/virt.c::valid_cpu_types 
> in PATCH[2].
> In the generic validation, the complete CPU type is used. The error 
> message also
> have complete CPU type there.

In some places (arm_cpu_list_entry, arm_cpu_add_definition) we use:

   g_strndup(typename, strlen(typename) - strlen("-" TYPE_ARM_CPU))

Maybe extract as a helper? cpu_typename_name()? :)
