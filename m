Received: by 2002:a05:7022:629e:b0:68:46be:293d with SMTP id e30csp2684623dle;
        Thu, 13 Jul 2023 05:34:51 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFJT4JwkYBkF+bnkZ36FoMLd9mrZFGDuOkz9bSjma7cO6kcbVaiI0juGg8crehe/7KaKyrY
X-Received: by 2002:ac8:4e92:0:b0:403:be2b:5aaa with SMTP id 18-20020ac84e92000000b00403be2b5aaamr1604497qtp.9.1689251691517;
        Thu, 13 Jul 2023 05:34:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689251691; cv=none;
        d=google.com; s=arc-20160816;
        b=vV3DpL4ZyyltSAbrMJXsWrsoYIg6qtkhtbqJB81WdE+l8Cji44ihm3AmTqyvNa5U6B
         w/9kghne/dzWgunAI2XhHEzQ7p3YIFz2RqXwpBvigUXwfnWOXDJIEihiVFQSbdDEIazX
         6NOtOOhSmaIdxkfOAefhugUSsFCM3bravqa7aNUrZ27g+M7CN5kAn5JZrrraBjjtGHln
         MQGa9AwZNtddv7WW/0O7/lKpB8kIWXG8FHtixozRGZkxp8gkxZwPnmZXSZHJwncxo2Kp
         DBhOvNAaRMNreKfaNbXcArSgxwKJTXCGSCueGDJ4920QfT8+iEkwgl5oy4TFHVpKXCzQ
         PJIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ru889PnU6EePW+KiYUQ9HktIo2vzu02KCYfTEVGWW8Q=;
        fh=pn3LlZhgu+sbT94yItJDJiGB6vU2uVMcI/rtlc9RJ5o=;
        b=d4b7fSUZsFY6To/sXWhmBMaOWDc1UcpXBgjFeXRacwKWvEnthuJYMWcx1bQsWhFgTt
         X3QJYuVB+SjgmDvB1KHP6nl/J2YzUomjpWBg242oJYoABJfV6NtfeOH2fbKo8EOGIwSz
         f42V7dUQDh7iBdo8XJt2NNjmEReTBVGoRssHfvO+gvkeZzkQRbPuK7RKZRkvbI6Pm0VS
         A3Hi6zDWO0JBQdhS41JEVnBfQ4Mtfk0WxouWDoN81kVBK3e3XLuKoZGBiIGifUxX3iWo
         +glEdR4NL740qGwcrFRsE2drD27bU7w4OyA+RjCWSl874tnm+2pksREb7f67QC2E7mMh
         YXiw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UWX5Su4k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t7-20020a05622a180700b00403be80cfbasi2431389qtc.68.2023.07.13.05.34.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Jul 2023 05:34:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UWX5Su4k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qJvWj-0000zI-IR; Thu, 13 Jul 2023 08:34:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qJvWi-0000z9-MM
 for qemu-arm@nongnu.org; Thu, 13 Jul 2023 08:34:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qJvWh-0005VI-4V
 for qemu-arm@nongnu.org; Thu, 13 Jul 2023 08:34:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689251670;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ru889PnU6EePW+KiYUQ9HktIo2vzu02KCYfTEVGWW8Q=;
 b=UWX5Su4kXyWTNR5PRaiC4P7fzbr86TN7IcKCjM85buyn5l1sC7xSKGwhKPDUeArHKGGyYg
 fd4UrfQt18+0bkJmVenltShbh+ADXT9e0auXbKuEaZskFRb+3tryA+bwCzoQIHpKaoe9DQ
 X/PfPCGVGiaWdKY1exs8Mf2fAESUM9g=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-297-xPCkqVAYN_y2Sil8yiHv7w-1; Thu, 13 Jul 2023 08:34:28 -0400
X-MC-Unique: xPCkqVAYN_y2Sil8yiHv7w-1
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-262e2cb725eso486336a91.0
 for <qemu-arm@nongnu.org>; Thu, 13 Jul 2023 05:34:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689251668; x=1691843668;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ru889PnU6EePW+KiYUQ9HktIo2vzu02KCYfTEVGWW8Q=;
 b=ZKFPumZ8BW1xomQKInVm/oSn4A6hgM7cfYbUHbO6y4P5Kl914Xan4Iipqxp/OCBxlN
 YUcskaAcnRpqPjk+kdoo97KOL/qZYdTFxfZiuUX4a1BXhDQCvRaCz33M1GzYkdBI58Vv
 yyLC2nJRlGDbZeYfm/QWWf5AFtQ47WoCtaQhTolOywFzksuewvPqSo99uMt3QIOiNlFF
 4+S25wrwjJskbRu84E3pXs9YpS3zmK2MtXqrjpWVwqVjbPrzEkFlCZfDOV/Mnb9wy+pj
 xRPUXyyU9nHAiAA/mxjdJb/QC3FgenXJ3iP0n2G2mnoRwlY0PT9EZnTNn9O8GyPeCOt7
 gnzA==
X-Gm-Message-State: ABy/qLZ8vrjCUeBgSDhwB3pkythJWoBqMVomaGfu/1GxJ/XHq0bzanyz
 ZrNPUxs7RRz8BWByvDiUyR+F7pbU7jdTWB2HevQS5QIIOm1uEghQ8L6+dM6iZl7h0f3de1gx0I4
 6W9EHKgaHEQTu
X-Received: by 2002:a17:90b:1b4b:b0:262:e697:f367 with SMTP id
 nv11-20020a17090b1b4b00b00262e697f367mr6465126pjb.15.1689251667705; 
 Thu, 13 Jul 2023 05:34:27 -0700 (PDT)
X-Received: by 2002:a17:90b:1b4b:b0:262:e697:f367 with SMTP id
 nv11-20020a17090b1b4b00b00262e697f367mr6465100pjb.15.1689251667325; 
 Thu, 13 Jul 2023 05:34:27 -0700 (PDT)
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5?
 ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a17090270c200b001b8307c81c8sm5846498plt.121.2023.07.13.05.34.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jul 2023 05:34:26 -0700 (PDT)
Message-ID: <3a392615-5aca-f384-197f-84beb3086a29@redhat.com>
Date: Thu, 13 Jul 2023 22:34:21 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 0/3] hw/arm/virt: Use generic CPU invalidation
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, pbonzini@redhat.com,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, shan.gavin@gmail.com
References: <20230713054502.410911-1-gshan@redhat.com>
 <CAFEAcA8197FCwfNZrnxfO-87RveOko0Ju-KcTJOEi0vfjVtDKg@mail.gmail.com>
 <2d21e89f-c965-e8f1-3705-dfea8367fc7e@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <2d21e89f-c965-e8f1-3705-dfea8367fc7e@linaro.org>
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
X-TUID: w/wq0FG/OzXX

Hi Peter and Marcin,

On 7/13/23 21:52, Marcin Juszkiewicz wrote:
> W dniu 13.07.2023 o 13:44, Peter Maydell pisze:
> 
>> I see this isn't a change in this patch, but given that
>> what the user specifies is not "cortex-a8-arm-cpu" but
>> "cortex-a8", why do we include the "-arm-cpu" suffix in
>> the error messages? It's not valid syntax to say
>> "-cpu cortex-a8-arm-cpu", so it's a bit misleading...
> 
> Internally those cpu names are "max-{TYPE_ARM_CPU}" and similar for other architectures.
> 
> I like the change but it (IMHO) needs to cut "-{TYPE_*_CPU}" string from names:
> 
> 13:37 marcin@applejack:qemu$ ./build/aarch64-softmmu/qemu-system-aarch64 -M virt -cpu cortex-r5
> qemu-system-aarch64: Invalid CPU type: cortex-r5-arm-cpu
> The valid types are: cortex-a7-arm-cpu, cortex-a15-arm-cpu, cortex-a35-arm-cpu, cortex-a55-arm-cpu, cortex-a72-arm-cpu, cortex-a76-arm-cpu, a64fx-arm-cpu, neoverse-n1-arm-cpu, neoverse-v1-arm-cpu, cortex-a53-arm-cpu, cortex-a57-arm-cpu, host-arm-cpu, max-arm-cpu
> 
> 13:37 marcin@applejack:qemu$ ./build/aarch64-softmmu/qemu-system-aarch64 -M virt -cpu cortex-a57-arm-cpu
> qemu-system-aarch64: unable to find CPU model 'cortex-a57-arm-cpu'
> 

The suffix of CPU types are provided in hw/arm/virt.c::valid_cpu_types in PATCH[2].
In the generic validation, the complete CPU type is used. The error message also
have complete CPU type there.

Peter and Marcin, how about to split the CPU types to two fields, as below? In this
way, the complete CPU type will be used for validation and the 'internal' names will
be used for the error messages.

struct MachineClass {
     const char *valid_cpu_type_suffix;
     const char **valid_cpu_types;
};

hw/arm/virt.c
-------------

static const char *valid_cpu_types[] = {
#ifdef CONFIG_TCG
     "cortex-a7",
     "cortex-a15",
     "cortex-a35",
     "cortex-a55",
     "cortex-a72",
     "cortex-a76",
     "a64fx",
     "neoverse-n1",
     "neoverse-v1",
#endif
     "cortex-a53",
     "cortex-a57",
     "host",
     "max",
     NULL
};

static void virt_machine_class_init(ObjectClass *oc, void *data)
{
     mc->valid_cpu_type_suffix = TYPE_ARM_CPU;
     mc->valid_cpu_types = valid_cpu_types;
}

hw/core/machine.c
-----------------

static void validate_cpu_type(MachineState *machine)
{
     ObjectClass *oc = object_class_by_name(machine->cpu_type), *ret = NULL;
     CPUClass *cc = CPU_CLASS(oc);
     char *cpu_type;
     int i;

     if (!machine->cpu_type || !machine_class->valid_cpu_types) {
         goto out_no_check;
     }

     for (i = 0; machine_class->valid_cpu_types[i]; i++) {
         /* The class name is the combination of prefix + suffix */
         if (machine_class->valid_cpu_type_suffix) {
             cpu_type = g_strdup_printf("%s-%s", machine_class->valid_cpu_types[i], machine_class->valid_cpu_type_suffix);
         } else {
             cpu_type = g_strdup(machine_class->valid_cpu_types[i]);
         }

         ret = object_class_dynamic_cast(oc, cpu_type));
         g_free(cpu_type);
         if (ret) {
             break;
         }
     }

     if (!machine_class->valid_cpu_types[i]) {
         /* The user-specified CPU type is invalid */
         /**** the prefix is used in the error messages ********/
         error_report("Invalid CPU type: %s", machine->cpu_type);
         error_printf("The valid types are: %s",
                      machine_class->valid_cpu_types[0]);
         for (i = 1; machine_class->valid_cpu_types[i]; i++) {
             error_printf(", %s", machine_class->valid_cpu_types[i]);
         }
         error_printf("\n");

         exit(1);
     }

     /* Check if CPU type is deprecated and warn if so */
out_no_check:
     if (cc && cc->deprecation_note) {
         warn_report("CPU model %s is deprecated -- %s",
                     machine->cpu_type, cc->deprecation_note);
     }
}

> 
> I can change sbsa-ref to follow that change but let it be userfriendly.
> 

Yes, sbsa-ref needs an extra patch to use the generic invalidation. I can add
one patch on the top for that in next revision if you agree, Marcin.

Thanks,
Gavin

