Received: by 2002:a05:7022:629e:b0:68:46be:293d with SMTP id e30csp2851923dle;
        Thu, 13 Jul 2023 12:28:12 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHuyQpVrswv3HAg0OHMfFii7CotwKp86qSIw90EzinQqJxWSIUqWXAEWXBUJlOkhZr+V5pk
X-Received: by 2002:a05:622a:15d1:b0:403:a93b:2c02 with SMTP id d17-20020a05622a15d100b00403a93b2c02mr3219036qty.21.1689276492337;
        Thu, 13 Jul 2023 12:28:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689276492; cv=none;
        d=google.com; s=arc-20160816;
        b=FvBJq8RC05q3E4rA3aoyYBeU9JFCpKmgbj46pwd7LDRI5tF8Pa8Jq27dMP5z/oc0h0
         +UWikr6XYAqMm0YOKXwV8qvHGuRwmrA+RbQGJRTCzqE33PopdLh4++O6C3cfyLL78cPP
         r5+Fi/dDyjceH9Yx3KvoyVj7uYZ2+wMvy+obH8ptskhNMRFV8o0rkKSW86wj5nC5krDP
         FwJv810l9MhYvvzQ4IyrEiyUhc4/Vw1s1QyS0DJXQfm9pkYlwWNEnUP0phIX67dnq4gL
         M6uM8NvcFfpVxx9yrokLJBo11KPlV3HwRwzdEfw1JtYOgWSI1BuoekuJG5tvOf8EUn9M
         hXFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=0B6arGw+NdeZ6QBvsCOTbLXVf4WMh9swLYm9vsORCxg=;
        fh=0mf4HQ168FIxLcfWG5s0on+C+P+rpC0gMd3m+evklyw=;
        b=zFMvqK/CHbZPnE16ZTfPJGuqufcZ+UuBSXedXIuL6SQWFuOobLp7MNgmDEQ9MjMl5D
         c8wxO2d6rFn+DVitw8l0CE/h6El7fY/oFY5WwrTeK7fK07wxMwwHbW25KhPtpIxdbVF0
         lcvPAlk3JktBJchLoFDGcAUbBs3shQnhiCT30kCvkyoVyDvYFKtyZg7bEIrbtX6GW6+y
         cV4Yznn4bFUDA6RIILbWmktX6hNChK32zW8ldsRofDJ5guwJG7GPu1PAZnQdTQ8Wu+64
         tjCXOKf4qfIgMb3wYZ2B0CbTWxUfUNxyP4AcHdEL+wttfe+4lOf0XPG6nZVn5lanSsh+
         cFtg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MF9WjM2E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 13-20020ac8594d000000b004033eed7d78si3571884qtz.203.2023.07.13.12.28.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Jul 2023 12:28:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MF9WjM2E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qK1ym-00073P-EK; Thu, 13 Jul 2023 15:27:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qK1yf-00072B-QH
 for qemu-arm@nongnu.org; Thu, 13 Jul 2023 15:27:49 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qK1ye-00048M-2w
 for qemu-arm@nongnu.org; Thu, 13 Jul 2023 15:27:49 -0400
Received: by mail-yb1-xb29.google.com with SMTP id
 3f1490d57ef6-bd77424c886so1069325276.0
 for <qemu-arm@nongnu.org>; Thu, 13 Jul 2023 12:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689276465; x=1691868465;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0B6arGw+NdeZ6QBvsCOTbLXVf4WMh9swLYm9vsORCxg=;
 b=MF9WjM2E9o97kWuZyAiq3BXkDHO7dUPQZCcw2q3+vJhMmmikvsq+t3ICIKdLmL77oc
 qdY7izGQ/OF6C3V82kbLSEET8h9WaKIWz8dSbhGIP6otiT5yHr0vVeyDJuy6QKHW4KMR
 r7h22sWUFXSrdP/5Wuf5oFxuAGoV8bvO5/EUXrchtjEU+xr453A/am3pSxaWmICguUm0
 eEcvNYJzkAl8JpiqxYhoat/ie82fiT27d+8eDzE89knjJNBZVy8tM4YaxCiZwAYj6rbQ
 +rnUmsblmt8DlCJ4ae/0KJYj/ImFU9gg4l/0XZCxyAO1m7MkHbuSfo43A+h3K/tearTY
 E/8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689276465; x=1691868465;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0B6arGw+NdeZ6QBvsCOTbLXVf4WMh9swLYm9vsORCxg=;
 b=Eh6KPG94WfnUJn9wysMlfM6e8Ig6ZOVjn/9HzuSfcuZXj0AMJOJ3h9jSl41oroAtpv
 Ct8a2eKH9TRmoP+FA0wdYDeb25+vt/59L1Y2M70dm/19REw1g+W/Il6OEwrxSYyHOMss
 y1YPtc6Er33MNSVxIHkFNfjnmw+I1N1rAa6/F6GiIVYqM2Uxu19xiFg8OoAWQzw9gBnf
 Kfx09Jn2zsasuYYWGNqqs7bcemjEnCEmUaOIeQQSbdzzaL1gfYhcMm3+bsiZcOp5qeLV
 QQFTmlgctE2H0ojUXl2kJ0Z+jO9EVFhTWPWBTDYGT8sfwwQXHSrxK61jD8gJCagEoq+R
 rpyw==
X-Gm-Message-State: ABy/qLYmI3+pwFkf75phhQ53k4RzXSzf1A8Dl7Ai8emhRrtPL/J1+QLr
 d7trxmWIQyJAXujwQjiLtX7Ngg==
X-Received: by 2002:a25:e74e:0:b0:cb9:77ef:da4b with SMTP id
 e75-20020a25e74e000000b00cb977efda4bmr558649ybh.50.1689276465097; 
 Thu, 13 Jul 2023 12:27:45 -0700 (PDT)
Received: from [192.168.88.227] ([172.58.139.107])
 by smtp.gmail.com with ESMTPSA id
 66-20020a251145000000b00ca6d2ad070csm799291ybr.29.2023.07.13.12.27.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jul 2023 12:27:44 -0700 (PDT)
Message-ID: <21752231-e869-033f-2a48-d5f06d001a48@linaro.org>
Date: Thu, 13 Jul 2023 20:27:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 0/3] hw/arm/virt: Use generic CPU invalidation
Content-Language: en-US
To: Gavin Shan <gshan@redhat.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, pbonzini@redhat.com,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, shan.gavin@gmail.com
References: <20230713054502.410911-1-gshan@redhat.com>
 <CAFEAcA8197FCwfNZrnxfO-87RveOko0Ju-KcTJOEi0vfjVtDKg@mail.gmail.com>
 <2d21e89f-c965-e8f1-3705-dfea8367fc7e@linaro.org>
 <3a392615-5aca-f384-197f-84beb3086a29@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <3a392615-5aca-f384-197f-84beb3086a29@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=richard.henderson@linaro.org; helo=mail-yb1-xb29.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.096,
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
X-TUID: /vDrbSQc4Ll3

On 7/13/23 13:34, Gavin Shan wrote:
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
>> Internally those cpu names are "max-{TYPE_ARM_CPU}" and similar for other architectures.
>>
>> I like the change but it (IMHO) needs to cut "-{TYPE_*_CPU}" string from names:
>>
>> 13:37 marcin@applejack:qemu$ ./build/aarch64-softmmu/qemu-system-aarch64 -M virt -cpu 
>> cortex-r5
>> qemu-system-aarch64: Invalid CPU type: cortex-r5-arm-cpu
>> The valid types are: cortex-a7-arm-cpu, cortex-a15-arm-cpu, cortex-a35-arm-cpu, 
>> cortex-a55-arm-cpu, cortex-a72-arm-cpu, cortex-a76-arm-cpu, a64fx-arm-cpu, 
>> neoverse-n1-arm-cpu, neoverse-v1-arm-cpu, cortex-a53-arm-cpu, cortex-a57-arm-cpu, 
>> host-arm-cpu, max-arm-cpu
>>
>> 13:37 marcin@applejack:qemu$ ./build/aarch64-softmmu/qemu-system-aarch64 -M virt -cpu 
>> cortex-a57-arm-cpu
>> qemu-system-aarch64: unable to find CPU model 'cortex-a57-arm-cpu'
>>
> 
> The suffix of CPU types are provided in hw/arm/virt.c::valid_cpu_types in PATCH[2].
> In the generic validation, the complete CPU type is used. The error message also
> have complete CPU type there.
> 
> Peter and Marcin, how about to split the CPU types to two fields, as below? In this
> way, the complete CPU type will be used for validation and the 'internal' names will
> be used for the error messages.
> 
> struct MachineClass {
>      const char *valid_cpu_type_suffix;
>      const char **valid_cpu_types;

While you're changing this:

const char * const *valid_cpu_types;


> };
> 
> hw/arm/virt.c
> -------------
> 
> static const char *valid_cpu_types[] = {

So that you can then do

static const char * const valid_cpu_types[]



r~
