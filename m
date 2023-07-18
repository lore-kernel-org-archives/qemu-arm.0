Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp6156213eje;
        Mon, 17 Jul 2023 23:12:04 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGf08ouODQGvJ3adc1VcaBAQlSt7+g2pAx+kWFVHxQt4JXGoSLJVWeSm1ixuZE3tMTOkj9f
X-Received: by 2002:ac8:5dcc:0:b0:401:e2bb:e423 with SMTP id e12-20020ac85dcc000000b00401e2bbe423mr13353453qtx.55.1689660724636;
        Mon, 17 Jul 2023 23:12:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689660724; cv=none;
        d=google.com; s=arc-20160816;
        b=Liap0CNBQVqpauYizHda6JFAL23aNJAQiJif4yVnluTcFsdxzU6C7nzGZnQN8eaUfH
         Wuss48iP7N5wwwCOQAGUdKBARK2dC7CkrympdxfSqJqWwBqfIAaKLPOfql6CSWTCrJ2L
         AyqkbcZC6DQJhsxkV1U8lzlaDchcvyYYh1VHXIrnGvhp3aMliV5H6PsKLOkoon7a6k4s
         od6T2KgdOSWf2s8oImv07zDqhMkwvdB5esFOJ3WOwbchGjJBK1n8LEwFcpjoMji/YP5Y
         YOCuo1M5xHG26TL6g6r5vQMA+ib61uGyr0olQrbN1SazecdQ5Wm3wbksO5QeQ4t5Z823
         C3bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=vHRCIhofoweDHT2kk3dm0VqHYPgh/+gcBIxdL+BWBro=;
        fh=X4Ye9k0Azi59yFZkdS2nj7XkoF9z8YkjKl6abeWxd7U=;
        b=T4Xq2SgQY4o1NrbfNJx+sNUQJv56ZTCiJV3TdQhmJudQbwN3P+DYfltRE9/0pjeQ8w
         LHKumRR4OE+fPMMZFsxXPfJGrbcIw99VGfXsSDnfAPcpHm0NgDDRx//3lhe27YKyHD4M
         zCLXiYe6fsq5Hkk+lTb8fexWH+E1ul9MbQy+g23AVA/5GZOaWrcvz6dIuv6RiDeYtE31
         BO4cbUa6ntNCC94xOa6o4D1Y4llT55rel5vBvOqvhcF2BHLQepZIJ+s0b5PdzrZUIMpI
         YLd2TFv0jMWu7aKDFd3bDPsu2+1ilSYK0tOdiReCR0r9zOEzs0WvMeZgn/VlV+Q9ERDi
         v9QQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MhOszm62;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u20-20020ac858d4000000b003e4eaec2617si670095qta.792.2023.07.17.23.12.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Jul 2023 23:12:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MhOszm62;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qLdwD-0004XP-RV; Tue, 18 Jul 2023 02:11:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qLdwB-0004Vb-D7
 for qemu-arm@nongnu.org; Tue, 18 Jul 2023 02:11:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qLdw9-0005Lc-Iy
 for qemu-arm@nongnu.org; Tue, 18 Jul 2023 02:11:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689660712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vHRCIhofoweDHT2kk3dm0VqHYPgh/+gcBIxdL+BWBro=;
 b=MhOszm62UEeZ/GT8ZfoVhYEj52piBlb0AB52AQOwi8IRkB2mwzbOEw4MuHOfe/Y9gnuJUY
 VV9i6SbhaKvyVZXLEjVuioeX7yfE7L+NBOc89j8fZ4Hd31yRXuJb7r7F9ATgzVnN19uD8J
 9+xTyS/OwiBdLJrh5A+apTb7W5/gvOs=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-136-9KkA00zWPJKSaCPUU6tHZA-1; Tue, 18 Jul 2023 02:11:50 -0400
X-MC-Unique: 9KkA00zWPJKSaCPUU6tHZA-1
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-666e3dad70aso4639207b3a.0
 for <qemu-arm@nongnu.org>; Mon, 17 Jul 2023 23:11:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689660709; x=1692252709;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vHRCIhofoweDHT2kk3dm0VqHYPgh/+gcBIxdL+BWBro=;
 b=F2LJzcn5KW+PSTAGWUqTCQJs68nkbDmA9bN8ft06UWay9yXQkcph+5MjV5ci8rm3RW
 9sQcA1rGkKiDF/c70bgwbUlZm68ypgGYbV4Up61Igt8Lz3EdMkwk0vQapYCbP13DtBGu
 niOQakfur7ruPhJATyGeDHUscX2Y/+xl1XjLSOsgjXlHRWpiR2fHgH5VDkaWBmzr7DuO
 j4lCvAGPJfN0OmYYhSQQxezjk98Yif93xCdzOdF0ggxVSAIKxA1DvC4uUpZnk7UP5ZTB
 6iacKlNh7ce3wNKVcFYIVq+OQIZ9FQCuogX9Br7gBoWC2tfKb5/gmutWd23NhnGCdpju
 TCJQ==
X-Gm-Message-State: ABy/qLb38VZ6lXsUi7IcbtmbkVcbHK2PXcdXInEodzM7U7JFMom5RDOx
 DLtrLKGEfyiuCDS+KelKGQckNkg43qNslimlRaxdX7kaykEFnhh8pbPxXQEqHaMUbvO3HIt2sRc
 s3HGAaDYTmnzx
X-Received: by 2002:a05:6a00:14c5:b0:668:83b6:bfe8 with SMTP id
 w5-20020a056a0014c500b0066883b6bfe8mr18939609pfu.9.1689660709254; 
 Mon, 17 Jul 2023 23:11:49 -0700 (PDT)
X-Received: by 2002:a05:6a00:14c5:b0:668:83b6:bfe8 with SMTP id
 w5-20020a056a0014c500b0066883b6bfe8mr18939590pfu.9.1689660708932; 
 Mon, 17 Jul 2023 23:11:48 -0700 (PDT)
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5?
 ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
 by smtp.gmail.com with ESMTPSA id
 u3-20020a62ed03000000b006829b27f252sm765051pfh.93.2023.07.17.23.11.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jul 2023 23:11:48 -0700 (PDT)
Message-ID: <9a97da2f-befe-8b5a-aee6-23bb9212abcd@redhat.com>
Date: Tue, 18 Jul 2023 16:11:42 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/3] machine: Factor CPU type invalidation out into helper
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, pbonzini@redhat.com,
 eduardo@habkost.net, peter.maydell@linaro.org, marcel.apfelbaum@gmail.com,
 philmd@linaro.org, wangyanan55@huawei.com, shan.gavin@gmail.com
References: <20230713054502.410911-1-gshan@redhat.com>
 <20230713054502.410911-2-gshan@redhat.com>
 <20230714140707.5c7c2402@imammedo.users.ipa.redhat.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20230714140707.5c7c2402@imammedo.users.ipa.redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.097, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
X-TUID: Mo6KV7JeoNCw

Hi Igor,

On 7/14/23 22:07, Igor Mammedov wrote:
> On Thu, 13 Jul 2023 15:45:00 +1000
> Gavin Shan <gshan@redhat.com> wrote:
> 
>> The CPU type invalidation logic in machine_run_board_init() is
>> independent enough. Lets factor it out into helper validate_cpu_type().
>> Since we're here, the relevant comments are improved a bit.
>>
>> No functional change intended.
>>
>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>> ---
>>   hw/core/machine.c | 81 +++++++++++++++++++++++++----------------------
>>   1 file changed, 43 insertions(+), 38 deletions(-)
>>
>> diff --git a/hw/core/machine.c b/hw/core/machine.c
>> index f0d35c6401..68b866c762 100644
>> --- a/hw/core/machine.c
>> +++ b/hw/core/machine.c
>> @@ -1349,12 +1349,52 @@ out:
>>       return r;
>>   }
>>   
>> +static void validate_cpu_type(MachineState *machine)
> s/validate_cpu_type/is_cpu_type_valid or better is_cpu_type_supported
> 
> Is it going to be reused elsewhere (otherwise I don't see much reason to move code around)?
> 

The logic of checking if the CPU type is supported is independent enough. It's
the only reason why I factored it out into a standalone helper here. It has
been explained in the commit log. Lets have an individual helper for this if
you don't have strong taste. With it, machine_run_board_init() looks a bit more
clean.

I don't have strong opinion about the function name. Shall we return 'bool'
with is_cpu_type_supported()? Something like below. The 'bool' return value
is duplicate to 'local_err' in machine_run_board_init(). So I think the
function validate_cpu_type(machine, errp) looks good to me. Igor, could you
please help to confirm?

static bool is_cpu_type_supported(MachineState *machine, Error **errp)
{
     bool supported = true;

     :

     if (!machine_class->valid_cpu_types[i]) {
         error_setg(errp, "Invalid CPU type: %s", machine->cpu_type));
         error_append_hint(errp, "The valid types are: %s", model);
         for (i = 1; machine_class->valid_cpu_types[i]; i++) {
             error_append_hint(errp, ", %s", model);
         }
         error_append_hint(errp, "\n");

         supported = false;
     }

     :

     return supported;
}

void machine_run_board_init(MachineState *machine, const char *mem_path, Error **errp)
{
     Error *local_err = NULL;

     :

     /* These two conditions are duplicate to each other! */
     if (!is_cpu_type_supported(machine, &local_err) && local_err) {
         error_propagate(errp, local_err);
     }

     :
}

>> +{
>> +    MachineClass *machine_class = MACHINE_GET_CLASS(machine);
>> +    ObjectClass *oc = object_class_by_name(machine->cpu_type);
>> +    CPUClass *cc = CPU_CLASS(oc);
>> +    int i;
>> +
>> +    /*
>> +     * Check if the user-specified CPU type is supported when the valid
>> +     * CPU types have been determined. Note that the user-specified CPU
>> +     * type is given by '-cpu' option.
>> +     */
>> +    if (!machine->cpu_type || !machine_class->valid_cpu_types) {
>> +        goto out_no_check;
> no goto-s please
> 

Ok. Will be dropped in next revision.

>> +    }
>> +
>> +    for (i = 0; machine_class->valid_cpu_types[i]; i++) {
>> +        if (object_class_dynamic_cast(oc, machine_class->valid_cpu_types[i])) {
>> +            break;
>> +        }
>> +    }
>> +
>> +    if (!machine_class->valid_cpu_types[i]) {
>> +        /* The user-specified CPU type is invalid */
>> +        error_report("Invalid CPU type: %s", machine->cpu_type);
>> +        error_printf("The valid types are: %s",
>> +                     machine_class->valid_cpu_types[0]);
>> +        for (i = 1; machine_class->valid_cpu_types[i]; i++) {
>> +            error_printf(", %s", machine_class->valid_cpu_types[i]);
>> +        }
>> +        error_printf("\n");
>> +
>> +        exit(1);
> 
> since you are touching that,
> turn it in errp handling, in separate patch 1st
> and only then introduce your helper.
> 

Right, it's a good idea. I will have a preparatory patch for it where
the error messages will be accumulated to @local_err and finally propagate
it to @errp of machine_run_board_init().

>> +    }
>> +
>> +    /* Check if CPU type is deprecated and warn if so */
>> +out_no_check:
>> +    if (cc && cc->deprecation_note) {
>> +        warn_report("CPU model %s is deprecated -- %s",
>> +                    machine->cpu_type, cc->deprecation_note);
>> +    }
>> +}
>>   
>>   void machine_run_board_init(MachineState *machine, const char *mem_path, Error **errp)
>>   {
>>       MachineClass *machine_class = MACHINE_GET_CLASS(machine);
>> -    ObjectClass *oc = object_class_by_name(machine->cpu_type);
>> -    CPUClass *cc;
>>   
>>       /* This checkpoint is required by replay to separate prior clock
>>          reading from the other reads, because timer polling functions query
>> @@ -1405,42 +1445,7 @@ void machine_run_board_init(MachineState *machine, const char *mem_path, Error *
>>           machine->ram = machine_consume_memdev(machine, machine->memdev);
>>       }
>>   
>> -    /* If the machine supports the valid_cpu_types check and the user
>> -     * specified a CPU with -cpu check here that the user CPU is supported.
>> -     */
>> -    if (machine_class->valid_cpu_types && machine->cpu_type) {
>> -        int i;
>> -
>> -        for (i = 0; machine_class->valid_cpu_types[i]; i++) {
>> -            if (object_class_dynamic_cast(oc,
>> -                                          machine_class->valid_cpu_types[i])) {
>> -                /* The user specificed CPU is in the valid field, we are
>> -                 * good to go.
>> -                 */
>> -                break;
>> -            }
>> -        }
>> -
>> -        if (!machine_class->valid_cpu_types[i]) {
>> -            /* The user specified CPU is not valid */
>> -            error_report("Invalid CPU type: %s", machine->cpu_type);
>> -            error_printf("The valid types are: %s",
>> -                         machine_class->valid_cpu_types[0]);
>> -            for (i = 1; machine_class->valid_cpu_types[i]; i++) {
>> -                error_printf(", %s", machine_class->valid_cpu_types[i]);
>> -            }
>> -            error_printf("\n");
>> -
>> -            exit(1);
>> -        }
>> -    }
>> -
>> -    /* Check if CPU type is deprecated and warn if so */
>> -    cc = CPU_CLASS(oc);
>> -    if (cc && cc->deprecation_note) {
>> -        warn_report("CPU model %s is deprecated -- %s", machine->cpu_type,
>> -                    cc->deprecation_note);
>> -    }
>> +    validate_cpu_type(machine);
>>   
>>       if (machine->cgs) {
>>           /*

Thanks,
Gavin

