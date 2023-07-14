Received: by 2002:a05:7022:629e:b0:68:46be:293d with SMTP id e30csp2856195dle;
        Thu, 13 Jul 2023 17:52:20 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGF7WFF6qbCnmAPWet9irZCz/efkuzChwfcBwOfYBGjivptaQacr/HO+YeNPtnEot0n9jld
X-Received: by 2002:a05:620a:44cb:b0:75b:23a1:361c with SMTP id y11-20020a05620a44cb00b0075b23a1361cmr4440986qkp.45.1689295940466;
        Thu, 13 Jul 2023 17:52:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689295940; cv=none;
        d=google.com; s=arc-20160816;
        b=I2XR9VtEDERkjal3YrYNmqouw81qMVW+GX60Xdnzc+6vA3IBbg/iZzgg6Mc7cHD3+Q
         eWBEqgVdBik52eimFwS8l2w7U/JN8do7mtVpRm2Ex3kG4KbBlorAOcOHrKQbiL3at2oT
         pSMiJsqbYtsUrB9xBu3d0rMg+rNUe6P6FmE+HK2TdaK5BP22TTBuuGUTqjzI8+drgtC5
         v+VqrMELjWeNH3e8Kx/Ssk7kqg7ynVa5HtceSQFAkN01PVfg9r1pLfqG77UaVFzmyVYr
         fEV5HzohRtf2Y1sDJq6Yaw8VxIat8EYM3guBPfJ80qdoDrQ1RpbPi0aqbHluqjsJkxht
         h1Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=vk4ZZPMawWuVAv+zhZ14UFLC8eiGva5gnA3MiCwCLsg=;
        fh=MpOmFnnTiB1Z3ydjoKeB+U7mJF5epIAAk20ciPCQXyM=;
        b=06hEypDBZ8GNFEIfZ2OacrDye2Q6JOS9tkibhwBgZlI8HsYD/SwYGVNtJdQuHFG5kf
         lyK6f2oIL7TJMQsbNSDw6D/j/uvtgaUEuVjsNz7KNR2AXeGHAz29JKyJTBb7g5r26R4b
         jSgfH8PJFZ302zfp9maa8vlwOIRuW10c2WoB/jOJ45bGaULF+5QNG8sRpp7w1iIoUQDK
         noJ7LrjdoRDJbyuVTkxHcXP057PcOGEcMKAFJfDAOt0n1+mSTm0ybAoleRCaJ48qK1Qn
         XNIPCk74FvseNit3FsG+9XrRaozKsVinE0m3Gx7fuZiMYF4/d4pFJhdq1lAHD45D+NQU
         QnCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SkpE6mrT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x24-20020a05620a0ed800b00763b96d1170si3636801qkm.586.2023.07.13.17.52.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Jul 2023 17:52:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SkpE6mrT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qK72B-0007C3-LQ; Thu, 13 Jul 2023 20:51:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qK72A-0007BZ-2W
 for qemu-arm@nongnu.org; Thu, 13 Jul 2023 20:51:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qK728-0008CE-I6
 for qemu-arm@nongnu.org; Thu, 13 Jul 2023 20:51:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689295902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vk4ZZPMawWuVAv+zhZ14UFLC8eiGva5gnA3MiCwCLsg=;
 b=SkpE6mrTucnfhUvRsIL5qhO0CBeyHA5jk5r5HrXVKrP/ZkvJG4g1Rc+bM/YvmFpg1meO/a
 BSUwpmaogwxdpHrgJ9egDdSBCm7qAQvxG4vIxs70Fx31YDO87ebbbF28+rIebH7/aQYWIS
 fV3CrQKo4X13rKu1btIefj+ZJoVXXZY=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-445-47cp-iXxMOyvDv1GL3TfDA-1; Thu, 13 Jul 2023 20:51:40 -0400
X-MC-Unique: 47cp-iXxMOyvDv1GL3TfDA-1
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-262f872fdcdso521223a91.1
 for <qemu-arm@nongnu.org>; Thu, 13 Jul 2023 17:51:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689295899; x=1691887899;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vk4ZZPMawWuVAv+zhZ14UFLC8eiGva5gnA3MiCwCLsg=;
 b=RBLShl0neiAWSvNbO63neTfToqdfhgkyNFxLPjfWdcy6hH4+vy8hi4UXcXQukx4IRj
 nPGeSpPqVFLrINnZjgHU+GR10aZu115QdiCfoxI5Wg+SaSPZdgH+v9leUXXawk742iVR
 0ySx44wxJP0WUJbZgPAodaMLd3j3slfG9B2En+2WbuWw3NvqyRqFoSPf95/s4eg/SP8j
 S54BLsCipRvodd+uMlEvXDsbqD2hpvcb4PLEN9ddAkAJS5c27hCMdfo6wwz0ybOVX+Ne
 ke1v60FNAIPJsFjhhyfH0PoQeAYkcinhldAManMR7m5UTaXhYqRop1Fgfojt4e2gKc4K
 xDrQ==
X-Gm-Message-State: ABy/qLbAkFcyGWSnDgk5dWBSbs847eIxteoL5KC2av8bzxtoFCxQPWwg
 seWYP20nxFyETfJLwZt1SrLkBsx4QCfieJra6QKA+zwi7yjHDZyuSb5N+u0iiHGfaQfwLw04xiu
 IupPFxm78uhH/
X-Received: by 2002:a17:903:32c4:b0:1b3:d4ed:8306 with SMTP id
 i4-20020a17090332c400b001b3d4ed8306mr3005084plr.19.1689295899503; 
 Thu, 13 Jul 2023 17:51:39 -0700 (PDT)
X-Received: by 2002:a17:903:32c4:b0:1b3:d4ed:8306 with SMTP id
 i4-20020a17090332c400b001b3d4ed8306mr3005063plr.19.1689295899114; 
 Thu, 13 Jul 2023 17:51:39 -0700 (PDT)
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5?
 ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
 by smtp.gmail.com with ESMTPSA id
 l21-20020a170902d35500b001b9dab0397bsm6483625plk.29.2023.07.13.17.51.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jul 2023 17:51:37 -0700 (PDT)
Message-ID: <ad1d9972-bb77-b7ad-4a89-2cb7019a79a7@redhat.com>
Date: Fri, 14 Jul 2023 10:51:29 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 0/3] hw/arm/virt: Use generic CPU invalidation
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, pbonzini@redhat.com,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, wangyanan55@huawei.com,
 shan.gavin@gmail.com
References: <20230713054502.410911-1-gshan@redhat.com>
 <CAFEAcA8197FCwfNZrnxfO-87RveOko0Ju-KcTJOEi0vfjVtDKg@mail.gmail.com>
 <2d21e89f-c965-e8f1-3705-dfea8367fc7e@linaro.org>
 <3a392615-5aca-f384-197f-84beb3086a29@redhat.com>
 <7ad244d7-2e29-74b4-e8bf-949925697880@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <7ad244d7-2e29-74b4-e8bf-949925697880@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.096, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: eqD7SWQCwbcf

Hi Philippe,

On 7/14/23 02:29, Philippe Mathieu-Daudé wrote:
> On 13/7/23 14:34, Gavin Shan wrote:
>> On 7/13/23 21:52, Marcin Juszkiewicz wrote:
>>> W dniu 13.07.2023 o 13:44, Peter Maydell pisze:
>>>
>>>> I see this isn't a change in this patch, but given that
>>>> what the user specifies is not "cortex-a8-arm-cpu" but
>>>> "cortex-a8", why do we include the "-arm-cpu" suffix in
>>>> the error messages? It's not valid syntax to say
>>>> "-cpu cortex-a8-arm-cpu", so it's a bit misleading...
>>>
>>> Internally those cpu names are "max-{TYPE_ARM_CPU}" and similar for other architectures.
>>>
>>> I like the change but it (IMHO) needs to cut "-{TYPE_*_CPU}" string from names:
>>>
>>> 13:37 marcin@applejack:qemu$ ./build/aarch64-softmmu/qemu-system-aarch64 -M virt -cpu cortex-r5
>>> qemu-system-aarch64: Invalid CPU type: cortex-r5-arm-cpu
>>> The valid types are: cortex-a7-arm-cpu, cortex-a15-arm-cpu, cortex-a35-arm-cpu, cortex-a55-arm-cpu, cortex-a72-arm-cpu, cortex-a76-arm-cpu, a64fx-arm-cpu, neoverse-n1-arm-cpu, neoverse-v1-arm-cpu, cortex-a53-arm-cpu, cortex-a57-arm-cpu, host-arm-cpu, max-arm-cpu
>>>
>>> 13:37 marcin@applejack:qemu$ ./build/aarch64-softmmu/qemu-system-aarch64 -M virt -cpu cortex-a57-arm-cpu
>>> qemu-system-aarch64: unable to find CPU model 'cortex-a57-arm-cpu'
>>>
>>
>> The suffix of CPU types are provided in hw/arm/virt.c::valid_cpu_types in PATCH[2].
>> In the generic validation, the complete CPU type is used. The error message also
>> have complete CPU type there.
> 
> In some places (arm_cpu_list_entry, arm_cpu_add_definition) we use:
> 
>    g_strndup(typename, strlen(typename) - strlen("-" TYPE_ARM_CPU))
> 
> Maybe extract as a helper? cpu_typename_name()? :)
> 

Yeah, it's definitely a good idea. The helper is needed by all architectures,
not ARM alone. The following CPU types don't have explicit definition of
XXXX_CPU_TYPE_SUFFIX. We need take "-" TYPE_CPU as the suffix.

     target/microblaze/cpu.c  TYPE_MICROBLAZE_CPU
     target/hppa/cpu.c        TYPE_HPPA_CPU
     target/nios2/cpu.c       TYPE_NIOS2_CPU

     target/microblaze/cpu-qom.h:#define TYPE_MICROBLAZE_CPU "microblaze-cpu"
     target/hppa/cpu-qom.h:      #define TYPE_HPPA_CPU       "hppa-cpu"
     target/nios2/cpu.h:         #define TYPE_NIOS2_CPU      "nios2-cpu"

I think the function name can be cpu_model_name() since we have called it
as 'model' in cpu.c::parse_cpu_option(). Something like below. Please let
me know if you have more comments.

     target/xxxx/cpu.h
     -----------------

     static inline char *cpu_model_name(const char *typename)
     {
         return g_strndup(typename, strlen(typename) - strlen(TYPE_XXX_CPU_SUFFIX));
     }

Thanks,
Gavin

     




