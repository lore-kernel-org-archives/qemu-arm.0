Received: by 2002:a17:906:494d:b0:a0d:e0d9:b5bf with SMTP id f13csp917157ejt;
        Mon, 27 Nov 2023 02:43:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFqJjv+xUWSOfNGaTMEZdbPiGuock5wGGXujqv5oA83Yq5eX9FeshNZSMak66MUUzfPHf83
X-Received: by 2002:a05:6358:7a0:b0:16e:2c64:7bb6 with SMTP id n32-20020a05635807a000b0016e2c647bb6mr6808119rwj.26.1701081787683;
        Mon, 27 Nov 2023 02:43:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701081787; cv=none;
        d=google.com; s=arc-20160816;
        b=vkiYpFMkP+rOMP0FidI9I73ucW0iSA79NSe/h5gWsfbPXuyyHTNQk7C26YUaprZaMU
         FZWm02m0ZljtxEp6DxsFdPcX0tnFrpmZoJaFKpG7fM+7Sw3FEuFRCxpgoiaMSSiDobbG
         Fdi9vpybZ2ufW5iiMNT7c6XkG93gqVI5sND15kUZDSS7p6RWCKUfO21N84aDk5f+sHcL
         jfsjmOrz5AT/PdNPeewlQGhDG1EGMN5XvuFYo8/mV57X3iwArTvnE2aTB8bUellQlsdF
         6SiU0BP7qPtaUmjACO020xWGUNjU5VWDD5CTXmlztBonv0tz/oEKxBH17VBjx+pCpbHn
         cofA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=QLAXiNn6Mu2Tf5u+jHxJUtR1EYNF/HpPzJEnpWFkQDY=;
        fh=yP29MqULvWgm23LYmFOjskzGuWVDm9tPq1phdPz9jF8=;
        b=dJ9jtcITA5iHdKuOkX8pez96O9Yn74J4l77aa5xmS/wPQ+keViGM8+QVIjk2H54qn3
         PK7NTbz/DStPOfcalEFkmCISsVMXXwD7M8tz1RZM068b2OTNQUpzDU+FBS3Q3seSTkXF
         o0+ZG9r2AxHQ4yZKIiZQ6iJ/sagVTWj4GflGky1nBWLHQPa0wZkBPxiQ7Ss+V4g9+7XA
         7Lp/i7a9dqaBOq5nt148kad7wtDGp+0FI8N/tNKjX2cSybBgk8VDHFtmxynOchlK05Vk
         UHP6NHfUuRMe01EZSgdCydAOLchRbuxJZMibHBMmPlJ3KBCv0VDuHrxJDwCg++N5MLXJ
         szZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fotJOD1J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t7-20020a05622a180700b0042385a0d221si9275627qtc.203.2023.11.27.02.43.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Nov 2023 02:43:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fotJOD1J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r7Z4S-0008RE-Rh; Mon, 27 Nov 2023 05:42:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r7Z4R-0008Qq-Sx
 for qemu-arm@nongnu.org; Mon, 27 Nov 2023 05:42:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r7Z4P-0003Yg-QD
 for qemu-arm@nongnu.org; Mon, 27 Nov 2023 05:42:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701081748;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QLAXiNn6Mu2Tf5u+jHxJUtR1EYNF/HpPzJEnpWFkQDY=;
 b=fotJOD1JGWZ80O/P+4telddNGdZcMtRO8wRkqBp3RiDyOHZkmgvjIclqH07KcuX/jMbCb3
 SpPPElwTyzw08u3CzL4cAW/oyS2iEc1IhfAmww2b4lnSZ3KEjGl1sPdLqGomxhU7g+DM1L
 lsCc80NXHigkukCGHuzMc9Eqk6wXAwE=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-204-3z08sgiaOQGLd3klJkVbVw-1; Mon, 27 Nov 2023 05:42:26 -0500
X-MC-Unique: 3z08sgiaOQGLd3klJkVbVw-1
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-5c1bfc5066aso3353563a12.2
 for <qemu-arm@nongnu.org>; Mon, 27 Nov 2023 02:42:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701081745; x=1701686545;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QLAXiNn6Mu2Tf5u+jHxJUtR1EYNF/HpPzJEnpWFkQDY=;
 b=E7MsGiJTlvdwhxbZ36Z+mEsoXBTb3RGtaiF9a9h3x1VRXL3dP0gr0/BZXfirdL5SoZ
 g1O0kf4qSzwaNmgClBBMRVBpKYVuj7MCikUNZ84GjScICJvFJgwuX3ZV3QseaFzmUSQw
 f9sGlh6e8eJeGCnAZjPidYO0WESi/iuRAPKdqrSPW/uWXBEUL9y9WK4KtAXESHMbiL4J
 u97gGUS5TozNugNBHuIQwJdEENV00g+WWTU9zFHd0Upp6spivdDEIIw+oTzVzppqFGvH
 xwPrYN8RNKifx2iDVZLTaLfD5YRSa1eQaxXN+HZXAvHkD09HT/TpOcLrO1tV838aNQIw
 S2Qw==
X-Gm-Message-State: AOJu0YxGU32WsdvSsT7Tl4EWx5+Gf/EHjDoPrI5apuDvyRigsVzTeRCT
 ZA6jfE5WknMcuhQNTCmu9v7xJ8lBSv1V5TQafbdbRCyBUU3P7Nt9RznMpkaaSeQE1Ufu+xSYfqC
 TAffVbYEBwkcw
X-Received: by 2002:a05:6a21:a583:b0:187:636d:a61e with SMTP id
 gd3-20020a056a21a58300b00187636da61emr13148069pzc.42.1701081745278; 
 Mon, 27 Nov 2023 02:42:25 -0800 (PST)
X-Received: by 2002:a05:6a21:a583:b0:187:636d:a61e with SMTP id
 gd3-20020a056a21a58300b00187636da61emr13148033pzc.42.1701081744895; 
 Mon, 27 Nov 2023 02:42:24 -0800 (PST)
Received: from [192.168.68.51] ([43.252.115.3])
 by smtp.gmail.com with ESMTPSA id
 mz22-20020a17090b379600b002839a4f65c5sm7193823pjb.30.2023.11.27.02.42.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Nov 2023 02:42:24 -0800 (PST)
Message-ID: <7de4520b-1a00-4979-9ebb-38daa02ddde2@redhat.com>
Date: Mon, 27 Nov 2023 21:42:14 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/8] hw/arm/virt: Check CPU type in
 machine_run_board_init()
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, peter.maydell@linaro.org,
 imammedo@redhat.com, richard.henderson@linaro.org,
 quic_llindhol@quicinc.com, b.galvani@gmail.com,
 strahinja.p.jankovic@gmail.com, kfting@nuvoton.com, wuhaotsh@google.com,
 nieklinnenbank@gmail.com, rad@semihalf.com, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, philmd@linaro.org, wangyanan55@huawei.com,
 vijai@behindbytes.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, shan.gavin@gmail.com
References: <20231126231210.112820-1-gshan@redhat.com>
 <20231126231210.112820-6-gshan@redhat.com>
 <c7d6f212-b051-4533-8b89-6241d28658fc@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <c7d6f212-b051-4533-8b89-6241d28658fc@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: lZHPhlUYHwid

On 11/27/23 21:13, Marcin Juszkiewicz wrote:
> W dniu 27.11.2023 o 00:12, Gavin Shan pisze:
>> @@ -2939,6 +2900,28 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>>   {
>>       MachineClass *mc = MACHINE_CLASS(oc);
>>       HotplugHandlerClass *hc = HOTPLUG_HANDLER_CLASS(oc);
>> +    static const char * const valid_cpu_types[] = {
>> +#ifdef CONFIG_TCG
>> +        ARM_CPU_TYPE_NAME("cortex-a7"),
>> +        ARM_CPU_TYPE_NAME("cortex-a15"),
>> +        ARM_CPU_TYPE_NAME("cortex-a35"),
>> +        ARM_CPU_TYPE_NAME("cortex-a55"),
>> +        ARM_CPU_TYPE_NAME("cortex-a72"),
>> +        ARM_CPU_TYPE_NAME("cortex-a76"),
>> +        ARM_CPU_TYPE_NAME("cortex-a710"),
>> +        ARM_CPU_TYPE_NAME("a64fx"),
>> +        ARM_CPU_TYPE_NAME("neoverse-n1"),
>> +        ARM_CPU_TYPE_NAME("neoverse-v1"),
>> +        ARM_CPU_TYPE_NAME("neoverse-n2"),
>> +#endif
>> +        ARM_CPU_TYPE_NAME("cortex-a53"),
>> +        ARM_CPU_TYPE_NAME("cortex-a57"),
>> +#if defined(CONFIG_KVM) || defined(CONFIG_HVF)
>> +        ARM_CPU_TYPE_NAME("host"),
>> +#endif
>> +        ARM_CPU_TYPE_NAME("max"),
>> +        NULL
>> +    };
> 
> I understand that you just move list from one place to the other but also wonder why a53/a57 were/are outside of 'ifdef CONFIG_TCG' check.
> 

I'm not sure about HVF, but a53/a57 can be supported by KVM. The supported list of
CPUs by KVM is defined in linux/arch/arm64/include/uapi/asm/kvm.h as below

/*
  * Supported CPU Targets - Adding a new target type is not recommended,
  * unless there are some special registers not supported by the
  * genericv8 syreg table.
  */
#define KVM_ARM_TARGET_AEM_V8           0
#define KVM_ARM_TARGET_FOUNDATION_V8    1
#define KVM_ARM_TARGET_CORTEX_A57       2
#define KVM_ARM_TARGET_XGENE_POTENZA    3
#define KVM_ARM_TARGET_CORTEX_A53       4
/* Generic ARM v8 target */
#define KVM_ARM_TARGET_GENERIC_V8       5

#define KVM_ARM_NUM_TARGETS             6

And the following QEMU commit gives more hints about it.

[gshan@gshan q]$ git show 39920a04952
commit 39920a04952b67fb1fce8fc3519ac18b7a95f3f3
Author: Fabiano Rosas <farosas@suse.de>
Date:   Wed Apr 26 15:00:05 2023 -0300

     target/arm: Move 64-bit TCG CPUs into tcg/
     
     Move the 64-bit CPUs that are TCG-only:
     - cortex-a35
     - cortex-a55
     - cortex-a72
     - cortex-a76
     - a64fx
     - neoverse-n1
     
     Keep the CPUs that can be used with KVM:
     - cortex-a57
     - cortex-a53
     - max
     - host
     
     Signed-off-by: Fabiano Rosas <farosas@suse.de>
     Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
     Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
     Message-id: 20230426180013.14814-6-farosas@suse.de
     Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Thanks,
Gavin

