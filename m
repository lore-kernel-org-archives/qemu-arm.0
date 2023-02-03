Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp1377300ejb;
        Fri, 3 Feb 2023 05:16:16 -0800 (PST)
X-Google-Smtp-Source: AK7set+ry+qfH5dfY50SOqq70FYPYSyfvZxH74EwXS97ZK+EBD2/h3BjjWECxOU2yd0DFb1yVPH1
X-Received: by 2002:a05:6214:cab:b0:53a:6241:a50f with SMTP id s11-20020a0562140cab00b0053a6241a50fmr21163104qvs.9.1675430176335;
        Fri, 03 Feb 2023 05:16:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675430176; cv=none;
        d=google.com; s=arc-20160816;
        b=P7kwCsEhimsK9LnXQDBIJMZ7SZny8qND7EMbZWHIy2sFk91Ex8qYq8bdXapuEtLjkp
         fK0cOJIu4LKN7AC3qxdz/3IFJ1pC1Pckv/XRiAbrBuV5yBIZ9pyALm/CE/1Naw0yrLMZ
         mq9LT76j2hMV0Ek2WELC+fHNmsoE6t79Sv0OKEvSZbN3G0m/V/AOoS6C6XFvpZcsUtfB
         mPEhlNk+/DQLTiLue988C5EpKoj31zLUBWdh30N2dF2mH8bZyekztgeOtxnwAte/WFhO
         nkT73HQymOi1FsMPcFGPVcc764SmGH5Nx6jRJpqe3yhxwlc0ziKTiAzjRCdL9ZuPdVy6
         /ffA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ASDnOZzA5qXWWogItTFFN1JghCtyymOM36MuwylqLcg=;
        b=IyzpSn2H5mIGTZR3IJg276YMlTsl85sqGY5vAaTEzxxfLwpYQ2ZXDz4GGae16KRkhg
         ii2XHbMS5imMsBGoquiFhGnu2e0W1KQKX20Ru5vQzhxIj1SxZdpAsVp5vsXM+WNb78L2
         6K1d2h2ReVS3TaQ5xF/sqq2OiWOj9PPfhuf6IVh6CFRGQaW6eFRfHhavPt8YjpUl4nkx
         Vi5RwPB/6+x8AH28rNn+r3DcBN/XW9rXxoXoSkL6MlmRfLa371GNAfE09mMpYPixlU6O
         R68A0v4lMmicjHzK9Ysl8lqoLaKQHTHLu37+WRCB7twLWdKB9VEroqIgBAONotYUx5bX
         58Zg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=crkj232U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a6-20020a0cefc6000000b005351eb99985si1633876qvt.267.2023.02.03.05.16.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Feb 2023 05:16:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=crkj232U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pNvvF-0001KP-6Z; Fri, 03 Feb 2023 08:16:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNvux-0001Hz-Tr
 for qemu-arm@nongnu.org; Fri, 03 Feb 2023 08:15:51 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNvuw-0005Tw-77
 for qemu-arm@nongnu.org; Fri, 03 Feb 2023 08:15:51 -0500
Received: by mail-wm1-x32c.google.com with SMTP id n13so3836939wmr.4
 for <qemu-arm@nongnu.org>; Fri, 03 Feb 2023 05:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ASDnOZzA5qXWWogItTFFN1JghCtyymOM36MuwylqLcg=;
 b=crkj232U1D0octFL8Vmge3ukGu+7iriMCvXCtOS5Cpid23qPlVhMCFiJTUu9M4263X
 KYXqXHIoRDzir8SLPTyYg+4itAH1tCLNS6lxyiCaWQWNsE32+6Pfn+5LG5tq9+ihzfHg
 ewSB1SPgZQyjFjGhxtk7SznS+Io6LQ0rtlbrM7vWi/jP02f5En+tBvD82iAI3bhvXa9Z
 T7QfaNvkIMVDeIZyT019S0OHdPNKyrPUhPh4naRtXs9tOyL1qE45QUxRy1Wcz99MtiGe
 iTV+FnSEMS4PkTbgVCQJza7FPO57giDuxyEPN5s1hXtHN5y2LrbS2oQKlNXUw6W1oP4q
 lQVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ASDnOZzA5qXWWogItTFFN1JghCtyymOM36MuwylqLcg=;
 b=ecVeiNnc5YwDWpanmT0+N2PYJIXFIJIWRSy7IWn43wRAwxdxcEPY5SH4t+fmYuEsCK
 HreImIZ0BEtJ0BrqOL0BIKEGjL0ofkWBi/vlvOm2NpTVlJeLwLLN2tlMlwUhHEEkNJuJ
 PWvsZwFILsq624wMW40SjVxXXxbMhDBUppezlqG1jDu8OLwH9zQ8dNs2ZxSx+p78epmw
 5xZmudZOwtZ3EGlavIOV0Sqc1/lSgjQ1+bjhx+clynkqUTjk/DMcNPxwKK14iLwOGhfE
 GJRx9WdG8wlUtTLneif8ZFV8J/gOaj2ehINBrKi0zNcRvUvnIb608oYtFLXkFEHo7lwc
 SKqw==
X-Gm-Message-State: AO0yUKUaOUjtj2B6y08D3DegIzbOBIpgeLP+sFCVSHluyZHBXSwT8mSC
 1SbHU2KKUlNqfPHJyxR7hbWX8Q==
X-Received: by 2002:a1c:4b16:0:b0:3dc:50bc:da70 with SMTP id
 y22-20020a1c4b16000000b003dc50bcda70mr9514196wma.10.1675430147906; 
 Fri, 03 Feb 2023 05:15:47 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 r3-20020a05600c434300b003dc59081603sm2436991wme.48.2023.02.03.05.15.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Feb 2023 05:15:47 -0800 (PST)
Message-ID: <3b377013-778e-b5b4-4c40-bfbecaba8415@linaro.org>
Date: Fri, 3 Feb 2023 14:15:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 1/9] hw/i386/sgx: Do not open-code qdev_realize_and_unref()
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20230203113650.78146-1-philmd@linaro.org>
 <20230203113650.78146-2-philmd@linaro.org> <87lelfc4l1.fsf@pond.sub.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <87lelfc4l1.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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
X-TUID: cXp65nxupKVb

On 3/2/23 13:32, Markus Armbruster wrote:
> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
> 
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   hw/i386/sgx.c | 5 ++---
>>   1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/hw/i386/sgx.c b/hw/i386/sgx.c
>> index db004d17a6..5ddc5d7ea2 100644
>> --- a/hw/i386/sgx.c
>> +++ b/hw/i386/sgx.c
>> @@ -299,7 +299,7 @@ void pc_machine_init_sgx_epc(PCMachineState *pcms)
>>                                   &sgx_epc->mr);
>>   
>>       for (list = x86ms->sgx_epc_list; list; list = list->next) {
>> -        obj = object_new("sgx-epc");
>> +        obj = object_new(TYPE_SGX_EPC);
> 
> I wonder why this doesn't use qdev_new().

OK.

>>           /* set the memdev link with memory backend */
>>           object_property_parse(obj, SGX_EPC_MEMDEV_PROP, list->value->memdev,
>> @@ -307,8 +307,7 @@ void pc_machine_init_sgx_epc(PCMachineState *pcms)
>>           /* set the numa node property for sgx epc object */
>>           object_property_set_uint(obj, SGX_EPC_NUMA_NODE_PROP, list->value->node,
>>                                &error_fatal);
>> -        object_property_set_bool(obj, "realized", true, &error_fatal);
>> -        object_unref(obj);
>> +        qdev_realize_and_unref(DEVICE(obj), NULL, &error_fatal);
> 
> Yes, please!  Must have crept in after I converted all realizations.
> I can see two more:
> 
> hw/pci/pcie_sriov.c:        object_property_set_bool(OBJECT(vf), "realized", false, &local_err);
> linux-user/syscall.c:            object_property_set_bool(OBJECT(cpu), "realized", false, NULL);

No: these would be qdev_UNrealize_and_unref(). Do we want it?
Maybe to avoid open-coding it, yes?

>>       }
>>   
>>       if ((sgx_epc->base + sgx_epc->size) < sgx_epc->base) {
> 
> Reviewed-by: Markus Armbruster <armbru@redhat.com>

Thanks!

