Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp705534ejb;
        Thu, 30 Nov 2023 19:33:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF9r5TrNOhPVpGYxM8Bd7Q7v0NR09jYkZHGInC50sdCoJwZcS4z416D36qoww7EVup3IKx3
X-Received: by 2002:a05:620a:e0c:b0:77d:7570:d7ab with SMTP id y12-20020a05620a0e0c00b0077d7570d7abmr24299247qkm.33.1701401633440;
        Thu, 30 Nov 2023 19:33:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701401633; cv=none;
        d=google.com; s=arc-20160816;
        b=jlm9X4He1fGIw3OqPxFKv9VwRCB9N2K/1/aA+nzTwGJcjTZGe2I13wpmITSCNrdoXl
         m2jXoWq7hcFf/uQHSpecFlDFv7ziIOjDKJ9SDFW5yjrGgQPvtB/6p4a+UyHVjzaaXc31
         X6/UFjzC/9kH7ZojKZCiDdd1VGcyVpwsLl+TDLDYuRzQsfyausv4y3Dp/s110h5QMJfj
         g/wu2NwOJXEA1o6/nJABh0oqv9s5Gz/sfYb2Os6P8Yo/AtfWeFqx02mSG74OWWwKXDnk
         Mo9YHw71leQRlLWxtR5e+fwDenLBdzOXUo3DCC8EZrIxNaewdaQM3JRSwqc2dZCVy4Dx
         26hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=pDA/YtOoP8t8dKReQnD71j9147YsvGu3IU9MGrJu/m0=;
        fh=9cVVd8wk1Y3QsjhZV8Lm/rq5BDfMSBseCDRDhkdwzoI=;
        b=YFYOipaP4uPuGvg5VEJtFD/yaHEn4XTMsrLoTUMCiJDWhOJwAc+Zmt2R5QHL4D1ToY
         T5QLtDdjJAQPKQmzMxyJ462HSfkcBB2y+yWjjuPOn/n/uq1KEWJ+nHQQZ9hMCXQor9O4
         Uta+TOkojQS8Jr9nul+VhSY+MG9qxG6rCrB5/uTiSRMqSLe5Cs0D0u2Tiww/iu2RkJt7
         57S1Jm4u32zO0ve5EJV5lE4pAfibb6eFCO3lBXSWo00PtFwkPH5RUl3EMscXkT22yspM
         QFoJcLixs0VfWbGMNFRhzAwEVYuxMOYpVyxHhy0sQ531nQAef5XXltFbyvpkAkD6ZgQm
         scFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LUhLkzY3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a33-20020a05620a43a100b0077d7a9c2e68si2556457qkp.528.2023.11.30.19.33.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Nov 2023 19:33:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LUhLkzY3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r8uHj-00060o-2J; Thu, 30 Nov 2023 22:33:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r8uHh-0005zs-Hr
 for qemu-arm@nongnu.org; Thu, 30 Nov 2023 22:33:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r8uHf-0007Vh-Fr
 for qemu-arm@nongnu.org; Thu, 30 Nov 2023 22:33:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701401622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pDA/YtOoP8t8dKReQnD71j9147YsvGu3IU9MGrJu/m0=;
 b=LUhLkzY3XkEFm0ChzAeWyZNIRvofheCbwRE6yBRqe/ZcYwZ++fL5su1LH6aFYRFxfrSMs3
 5IHh4p5pKTA1w1WOUfLGlLFM23l+930UTvnrPpRD1oa7fd7zkar8IQ25+DKuU/+ZZO7UN+
 O4uD1sgZgmnQpDvM9ni/QA2XDDlNa6A=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-342-ETACeY-NO2OTdZdEAoTEWA-1; Thu, 30 Nov 2023 22:33:39 -0500
X-MC-Unique: ETACeY-NO2OTdZdEAoTEWA-1
Received: by mail-oi1-f199.google.com with SMTP id
 5614622812f47-3b2e7a8fbbdso117642b6e.1
 for <qemu-arm@nongnu.org>; Thu, 30 Nov 2023 19:33:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701401618; x=1702006418;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pDA/YtOoP8t8dKReQnD71j9147YsvGu3IU9MGrJu/m0=;
 b=fC11gKTPD4SrO94REBznb0agwn5kSBDmv6CNnrIdFe1Gie0ZEUxlBrm0nbma1nkaVD
 EFJeyxRh8HMFT3x1LhvgmgfJVTOzJWNX7a8bnUSOnKrf+Oaaul0CCQJWv8FxUa1Qve0T
 4tbPU3+QLi2IuMcJfq01EMmP0kRcLhp5+WQ+kJaethwj9RMiO3RsVzCq0YcEKr09EQzl
 rwuHEI+x51s8caO5gFXMngWODIPnePN36Em2ita/6sQx6aDCVVSyw2tnqc4IPstF3aD4
 PvO00mng0gMFbxRUgeF4elfbFYKvqM2BVC5W2M301U+5FSpGN0mbFDdy5MaZcpfkO57U
 eVYA==
X-Gm-Message-State: AOJu0YwopcfZ4+yspGgsFeIH8jDkZmL9pCn+huusPgA8EPb1yd6v/GIc
 9PG6c78nrhcmu8kSo8u0KgsL3fF32YaLtvwx1LzQLK8Mj7T9jpxic2CdG3Ilk2goAujIkLWGHKE
 HlKiVQNIwN4l5
X-Received: by 2002:a05:6808:3084:b0:3b8:6151:cacb with SMTP id
 bl4-20020a056808308400b003b86151cacbmr1895379oib.10.1701401618669; 
 Thu, 30 Nov 2023 19:33:38 -0800 (PST)
X-Received: by 2002:a05:6808:3084:b0:3b8:6151:cacb with SMTP id
 bl4-20020a056808308400b003b86151cacbmr1895345oib.10.1701401618359; 
 Thu, 30 Nov 2023 19:33:38 -0800 (PST)
Received: from [192.168.68.51] ([43.252.115.3])
 by smtp.gmail.com with ESMTPSA id
 b17-20020aa78ed1000000b006c06779e593sm2013549pfr.16.2023.11.30.19.33.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Nov 2023 19:33:37 -0800 (PST)
Message-ID: <a1a3a5f9-f785-4b27-9b33-ea5b29e919b3@redhat.com>
Date: Fri, 1 Dec 2023 14:33:26 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/9] machine: Use error handling when CPU type is
 checked
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 peter.maydell@linaro.org, imammedo@redhat.com, b.galvani@gmail.com,
 strahinja.p.jankovic@gmail.com, sundeep.lkml@gmail.com, kfting@nuvoton.com,
 wuhaotsh@google.com, nieklinnenbank@gmail.com, rad@semihalf.com,
 quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, vijai@behindbytes.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, shan.gavin@gmail.com
References: <20231129042012.277831-1-gshan@redhat.com>
 <20231129042012.277831-2-gshan@redhat.com> <87bkbdnf6u.fsf@pond.sub.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <87bkbdnf6u.fsf@pond.sub.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: JWs92UfYIbCn

Hi Markus,

On 11/29/23 19:20, Markus Armbruster wrote:
> Gavin Shan <gshan@redhat.com> writes:
> 
>> QEMU will be terminated if the specified CPU type isn't supported
>> in machine_run_board_init(). The list of supported CPU type names
>> is tracked by mc->valid_cpu_types.
> 
> Suggest to drop the second sentence.
> 

Indeed, it's not so helpful.

>> The error handling can be used to propagate error messages, to be
>> consistent how the errors are handled for other situations in the
>> same function.
>>
>> No functional change intended.
>>
>> Suggested-by: Igor Mammedov <imammedo@redhat.com>
>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>> ---
>> v8: Drop @local_err and use @errp to be compatible with
>>      ERRP_GUARD()                                          (Phil)
>> ---
>>   hw/core/machine.c | 13 +++++++------
>>   1 file changed, 7 insertions(+), 6 deletions(-)
>>
>> diff --git a/hw/core/machine.c b/hw/core/machine.c
>> index 0c17398141..bde7f4af6d 100644
>> --- a/hw/core/machine.c
>> +++ b/hw/core/machine.c
>> @@ -1466,15 +1466,16 @@ void machine_run_board_init(MachineState *machine, const char *mem_path, Error *
>>   
>>           if (!machine_class->valid_cpu_types[i]) {
>>               /* The user specified CPU is not valid */
>> -            error_report("Invalid CPU type: %s", machine->cpu_type);
>> -            error_printf("The valid types are: %s",
>> -                         machine_class->valid_cpu_types[0]);
>> +            error_setg(errp, "Invalid CPU type: %s", machine->cpu_type);
>> +            error_append_hint(errp, "The valid types are: %s",
>> +                              machine_class->valid_cpu_types[0]);
>>               for (i = 1; machine_class->valid_cpu_types[i]; i++) {
>> -                error_printf(", %s", machine_class->valid_cpu_types[i]);
>> +                error_append_hint(errp, ", %s",
>> +                                  machine_class->valid_cpu_types[i]);
>>               }
>> -            error_printf("\n");
>>   
>> -            exit(1);
>> +            error_append_hint(&errp, "\n");
>> +            return;
>>           }
>>       }
> 
> This cleans up an anti-pattern: use of error_report() within a function that
> returns errors through an Error **errp parameter.
> 
> Cleanup, not bug fix, because the only caller passes &error_abort.
> 
> Suggest to start the commit message with a mention of the anti-pattern.
> Here's how I'd write it:
> 
>      Functions that use an Error **errp parameter to return errors should
>      not also report them to the user, because reporting is the caller's
>      job.
> 
>      machine_run_board_init() violates this principle: it calls
>      error_report(), error_printf(), and exit(1) when the machine doesn't
>      support the requested CPU type.
> 
>      Clean this up by using error_setg() and error_append_hint() instead.
>      No functional change, as the only caller passes &error_fatal.
> 

Thanks for the nice write-up. I will take it if v9 is needed to address
comments from other people.

> Whether you use my suggestion or not:
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> 

Thanks for your review.

Thanks,
Gavin

