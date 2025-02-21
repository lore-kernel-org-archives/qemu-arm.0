Received: by 2002:a17:504:5c6a:b0:1be9:327d:8ee3 with SMTP id dm10csp74921njc;
        Thu, 20 Feb 2025 21:28:29 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWuA/2WwQmGulhfOr66gLMdFxO9/tAUxOLe/DzpxQmyXNCOg3k23JtTuKLMTJK9hINpA8Tnu0Q156J2JQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHl6YuVpOHJ0aJQA4j1ZXjrCmbZFZLreqjeapkqUYqgWifVsgLZ+xnmvRXCr5xOkHTJCBIH
X-Received: by 2002:ac8:7d0c:0:b0:472:636:f60c with SMTP id d75a77b69052e-4722296cd4bmr27099241cf.49.1740115709232;
        Thu, 20 Feb 2025 21:28:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740115709; cv=none;
        d=google.com; s=arc-20240605;
        b=UnqatyWPDF8JavQWR/A34ERqZVagHWcTjsXmgJjcrZ7y1LBuzMqmZ6LjVji3lMAPG6
         37CO2Fwrb5yEg7T3yF8bxy5VghjW+HVHuUk0qpaEXXsgLsIK5msfnd/olddfFLRO+xdK
         WQQeE9rUx1Z6J24MiaufrzQFpjRqc9YeNsqCz7pidAj+zVIoBkwQpNCrraQ6upt1T6iN
         2vIhD8R763xkzTo5IuChDUMcJHxM1IJg6St2R+0lvA/xXwveJpRizE/gefA0ampF5lwd
         K+IIUtUWtwoueg3+7X2ZlgzkgjoFLUt1fmSKjIJbVGnLzCRaqyu1iG/+FVAWpsNKoAfp
         zNCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=DF168dVKgRm6Uv7cc0o/jSNvdzVRIdhtMrj2lWKmhlQ=;
        fh=efizrJ/gkwYH0srNagPy+KvyXokanwUrFiVlcjvoHBs=;
        b=jC0DzZwNXSb9i8TnglumlViVzownRnuRWTw9xMq1lUtwbpI8jjwqrKkakRHAbtOKCx
         LjurctUDv2f8UbapLLTaU5zv1PDQT2RGeM3vPMhiU0A2u5a7neac+RqKxZ+/pSPFrHHD
         qcI0oDw6FUqnTQo0j5VSTsWfUR4Cr+7Xqy1lqph2wlZ6NVxRPs2vh1m9ImHGS7CjapGJ
         c9qwvPnjhQ3X5zBv71gvW9f0xvPE9I9QEd/gB0ar8PJ+ZM4z6X1IRY25mKzScRQB5RUn
         SMZXCqOUNMRmfVh1/qsvzXcEm4oHrN9deaU6JZ7BU/i+13m0WDTDV9XIu17JqWSeuT5f
         llXA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PQWtJJ4D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-471f3ca59e1si81359701cf.600.2025.02.20.21.28.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Feb 2025 21:28:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PQWtJJ4D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tlLZp-0006jN-P9; Fri, 21 Feb 2025 00:27:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1tlLZm-0006j8-Gg
 for qemu-arm@nongnu.org; Fri, 21 Feb 2025 00:27:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1tlLZk-0004dt-07
 for qemu-arm@nongnu.org; Fri, 21 Feb 2025 00:27:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740115665;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DF168dVKgRm6Uv7cc0o/jSNvdzVRIdhtMrj2lWKmhlQ=;
 b=PQWtJJ4Ds9tCn+7V1790IQhxXr5gInsfa+q/dF6w3/l3cIE6dyfxAhPz13Rtl/OQIv46SC
 lQCw0jTxeaE2QlS2hRNM9jtQECWTY+S9ZRN2kttmvA5uYrgnQBId/+9+NzwpRy5hk1TyYA
 qwBObVYFrp+fRaqbkAvut5ikejmcLDQ=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-m-KqVXlnPoW87LWBIDpONA-1; Fri, 21 Feb 2025 00:27:43 -0500
X-MC-Unique: m-KqVXlnPoW87LWBIDpONA-1
X-Mimecast-MFC-AGG-ID: m-KqVXlnPoW87LWBIDpONA_1740115663
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-22112e86501so34391145ad.0
 for <qemu-arm@nongnu.org>; Thu, 20 Feb 2025 21:27:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740115663; x=1740720463;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DF168dVKgRm6Uv7cc0o/jSNvdzVRIdhtMrj2lWKmhlQ=;
 b=vRJj2COTePMGLHTGX/5TGaTs0vFUiLR77RRyZPWD79kZOuuk1xSndnZ9Ejyb9iX6s2
 GbdYIDIodg7RQOinSPCe+mf5jZQ8pdaER42sm5IA2NFTz5IdpKHetmK2lm81Qq+tiprN
 g95LmiSTfqnNfJUraxdO3QXgUII5yb29yiJkPtXmGvfXG4QHfSMmJb3hKSphe8S3GDXa
 YTgQ/utnGnfuBXZYYITCRv3dyybsbLD5BEeh8fCDUHquIF3J5pruckwy/yzieZx+SP0Z
 4xhC86MK7eCLErF2f7E5vbndmZojqcExtDtmlRdHV27PTxJQ+qNlmYMKj8kwf1h4N4Jm
 h0cg==
X-Gm-Message-State: AOJu0Ywm/XjXPsK4joRFQbSbdqSZyL5vi7/Z3EVlX353fMttL+es4eA0
 tP+1XBjskdXw6YE6vpeA8YwKu6Oz6644GMdWlTzJguZz24pkwCwFu8jp3Yu5C9nCHn/xiCT1xN9
 b+3KeFT+ejYI+nHtdTYPiKBIVCoECZ9Pid9AxY0utu0Ofjiwr4A==
X-Gm-Gg: ASbGncufEA9TUwajT3ysSGjVuDHF0kx4ZYEla8yR2guzCOzTW1rtrk5ONDcqLNht8Eo
 edonJRVMHsIgVOIyJx+0a5KFwHbNL0KaXQrXw0sxLGvAq1jUDzxCYSsaX/dcU1xvGDlX3VmyjaJ
 1ywnXwz7fs0rhs4CAb7zgCOfby6QqsEVk+isHLU/iBqTjES99wJlp3PyOsQL8PHnwhROqks2CHJ
 GX3XAuGzpNjUY4AEVOqaUuFpNu3gltVyJRCqd8AuGFLzlrdyiOrZaCx8MKEtMSqL04PF7+XCypV
 hvmHefDkN1bxac+2
X-Received: by 2002:a05:6a20:8409:b0:1ee:da6e:a82b with SMTP id
 adf61e73a8af0-1eef3c8a8eamr3146433637.18.1740115662829; 
 Thu, 20 Feb 2025 21:27:42 -0800 (PST)
X-Received: by 2002:a05:6a20:8409:b0:1ee:da6e:a82b with SMTP id
 adf61e73a8af0-1eef3c8a8eamr3146403637.18.1740115662403; 
 Thu, 20 Feb 2025 21:27:42 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.64])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7325f5d1eb9sm12146578b3a.17.2025.02.20.21.27.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Feb 2025 21:27:41 -0800 (PST)
Message-ID: <7caa54df-abe1-4833-bb59-cb83f8241962@redhat.com>
Date: Fri, 21 Feb 2025 15:27:36 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] target/arm: Retry pushing CPER error if necessary
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, mst@redhat.com,
 anisinha@redhat.com, gengdongjiu1@gmail.com, peter.maydell@linaro.org,
 pbonzini@redhat.com, shan.gavin@gmail.com,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
References: <20250214041635.608012-1-gshan@redhat.com>
 <20250214041635.608012-5-gshan@redhat.com>
 <20250219185518.767a48d9@imammedo.users.ipa.redhat.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250219185518.767a48d9@imammedo.users.ipa.redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sbqk9kdvASzLGAab7aSMmK2LfkZAoPg1uLgA6LyAccc_1740115663
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.457,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SBL_CSS=3.335, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: tmgN/Dj+cjbu

On 2/20/25 3:55 AM, Igor Mammedov wrote:
> On Fri, 14 Feb 2025 14:16:35 +1000
> Gavin Shan <gshan@redhat.com> wrote:
> 
>> The error -1 is returned if the previously reported CPER error
>> hasn't been claimed. The virtual machine is terminated due to
>> abort(). It's conflicting to the ideal behaviour that the affected
>> vCPU retries pushing the CPER error in this case since the vCPU
>> can't proceed its execution.
>>
>> Move the chunk of code to push CPER error to a separate helper
>> report_memory_errors() and retry the request when the return
>> value from acpi_ghes_memory_errors() is greater than zero.
>>
>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>> ---
>>   target/arm/kvm.c | 31 +++++++++++++++++++++++++------
>>   1 file changed, 25 insertions(+), 6 deletions(-)
>>
>> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
>> index 5c0bf99aec..9f063f6053 100644
>> --- a/target/arm/kvm.c
>> +++ b/target/arm/kvm.c
>> @@ -2362,6 +2362,30 @@ int kvm_arch_get_registers(CPUState *cs, Error **errp)
>>       return ret;
>>   }
>>   
>> +static void report_memory_error(CPUState *c, hwaddr paddr)
>> +{
>> +    int ret;
>> +
>> +    while (true) {
>> +        /* Retry if the previously report error hasn't been claimed */
>> +        ret = acpi_ghes_memory_errors(ACPI_HEST_SRC_ID_SEA, paddr, true);
>> +        if (ret <= 0) {
>> +            break;
>> +        }
>> +
>> +        bql_unlock();
>> +        g_usleep(1000);

Igor, thanks for the detailed comments. Sorry for a bit delay of the reply, I
was checking the code to understand it better :)

> even with bql released it's not safe to loop in here.
> consider,
>    a guest with 2 vcpus
>      * vcpu 1 gets SIGBUS due to error
>      * vcpu 2 trips over the same error and gets into this loop
>      * on guest side vcpu 1 continues to run to handle SEA but
>        might need to acquire a lock that vcpu 2 holds
> 

Agreed.

> GHESv2 error source we support, can report several errors,
> currently QEMU supports only 1 'error status block' which
> can hold several error records (CPER) (though storage size is limited)
> 
> 1:
> We can potentially add support for more GHESv2 error sources
> with their own Read ACK registers (let's say =max_cpus)
> (that is under assumption that no other error will be
> triggered while guest VCPUs handle their own SEA (upto clearing Read ACK))
> 
> 2:
> Another way could be for QEMU to allocate more error status _blocks_
> for the only one error source it has now and try to find
> empty status block to inject new error(s).
>   * it can be saturated with high rate of errors (so what do we do in case it happens?)
>   * subject to race between clearing/setting Read ACK
>      (maybe it can dealt with that on side by keeping internal read_ack counter)
> 
> 3:
> And alternatively, queue incoming errors until read ack is cleared
> and then inject pending errors in one go.
> (problem with that is that at the moment QEMU doesn't monitor
> read ack register memory so it won't notice guest clearing that)
> 
> 
> Given spec has provision for multiple error status blocks/error data entries
> it seems that #2 is an expected way to deal with the problem.
> 

I would say #1 is the ideal model because the read_ack_register is the bottleneck
and it should be scaled up to max_cpus. In that way, the bottleneck can be avoided
from the bottom. Another benefit with #1 is the error can be delivered immediately
to the vCPU where the error was raised. This matches with the syntax of SEA to me.

#2 still has the risk to saturate the multiple error status blocks if there are
high rate of errors as you said. Besides, the vCPU where read_ack_register is acknoledged
can be different from the vCPU where the error is raised, violating the syntax of
SEA.

#3's drawback is to violate the syntax of SEA, similar to #2.

However, #2/#3 wouldn't be that complicated to #1. I didn't expect big surgery to
GHES module, but it seems there isn't perfect solution without a big surgery.
I would vote for #1 to resolve the issue from the ground. What do you think, Igor?
I'm also hoping Jonathan and Mauro can provide their preference.

> PS:
> I'd prefer Mauro's series being merged 1st (once it's resplit),
> for it refactors a bunch of original code and hopefully makes
> code easier to follow/extend.
> 

Sure. I won't start the coding until the solution is confirmed. All the followup
work will base on Mauro's series.

>> +        bql_lock();
>> +    }
>> +
>> +    if (ret == 0) {
>> +        kvm_inject_arm_sea(c);
>> +    } else {
>> +        error_report("Error %d to report memory error", ret);
>> +        abort();
>> +    }
>> +}
>> +
>>   void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
>>   {
>>       ram_addr_t ram_addr;
>> @@ -2387,12 +2411,7 @@ void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
>>                */
>>               if (code == BUS_MCEERR_AR) {
>>                   kvm_cpu_synchronize_state(c);
>> -                if (!acpi_ghes_memory_errors(ACPI_HEST_SRC_ID_SEA, paddr, false)) {
>> -                    kvm_inject_arm_sea(c);
>> -                } else {
>> -                    error_report("failed to record the error");
>> -                    abort();
>> -                }
>> +                report_memory_error(c, paddr);
>>               }
>>               return;
>>           }
> 

Thanks,
Gavin

