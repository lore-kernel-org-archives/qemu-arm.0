Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp2021258ejo;
        Sun, 7 Jan 2024 17:12:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IErA0qUWEG1I1yvS7WSQGv0NU1uyLHB6ijfP2JArqyXNhXGButd5hyWYMwUcm8BNthKrf/h
X-Received: by 2002:a05:6808:201c:b0:3bd:25bc:9b47 with SMTP id q28-20020a056808201c00b003bd25bc9b47mr2322129oiw.43.1704676323590;
        Sun, 07 Jan 2024 17:12:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704676323; cv=none;
        d=google.com; s=arc-20160816;
        b=CKWNYKcSEKfwf3DNXRdmznXVdsgwK8YYKXC1px+08wzK5domBM81gwm2eeWKX/PI0f
         46d7I5DkbBAQUDFQzxe+6ZmBLtkHmnZVPMCDzbVjQypVGQ8zPBaDcDMGJs/tThF4HBJ+
         GL8zlEXFXjOq/ug+kNu3z2dp0YASjzziY2YIlP3RHw2qA+ww18sx0IGWGIkswaMiE0mz
         Xk87s2qKx73VfPbKD92YGCitLd1UxGdMiSB31X5aACMIHbrpj4jH3JJ9C6ztrabTivaV
         PrCJElda2BjftkUAKrVfVi0Q2SNBZEF4EZ0hHQqUdCnTuz1TK6FESd1vVR5tRQGaoqLk
         isDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=o7cD/mjBrtIvD3wAR5CMXxLi16Tcka6XxLuFIx3iJzA=;
        fh=tvKXAvwKki8h/Qttf3tmztvk1NxUymoH788M0EDe2gs=;
        b=R9sjw+6ycMjiq6Z/9Fl9BNuMTB5JN5CSGFJcqm20V1Ix27r/FFykLMIBf4f9SZuYkk
         1V+UDUQ7wfoz8c/FUErwatNx4Gv0d6DYhEnJf/0u7pwU5+JZLFUkDQRDr0K4M+kPWZwK
         sOwyf3eKDwCoxHhDu0TFAsH/nVVgXCXFQ7MmE7u3gxNptIWAHfK1BauvilG33xv/SIkz
         RlQ5fnJxZMVano+LSMkOT77zeYnzlq1tj+vNaFF9WJI3c0Uqn3Neccq37SZnkAcrDWsW
         DZMpLC5pzFupd0CmWH2E1srFRO7qKIrUk0zm+ozQPRlIifwja49ZqYgaqqo5yFszMosk
         XwAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Z+RkVlKf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k5-20020a0cb245000000b0067a21682426si6666968qve.60.2024.01.07.17.12.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 07 Jan 2024 17:12:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Z+RkVlKf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rMeBF-0004LZ-Lj; Sun, 07 Jan 2024 20:11:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1rMeBD-0004LB-N5
 for qemu-arm@nongnu.org; Sun, 07 Jan 2024 20:11:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1rMeBA-0004gd-I1
 for qemu-arm@nongnu.org; Sun, 07 Jan 2024 20:11:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1704676305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o7cD/mjBrtIvD3wAR5CMXxLi16Tcka6XxLuFIx3iJzA=;
 b=Z+RkVlKfSAJXZrTPYd65gs0eq3yACB79TUX4MBWC4THE9oFTJUDBVRLZ67OVj05Z5F5IvA
 U43DgNoQR/KomvSG+9geNSG7inA91XA4lFntee0XGZNnAb5LoRHpNrry9GkffBb1f+qxv+
 f0bVnFhrd54cPJ1lTt6rTR0wEoGIvMI=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641-nNiI5zRyNcqqMOqH0-2__A-1; Sun, 07 Jan 2024 20:11:44 -0500
X-MC-Unique: nNiI5zRyNcqqMOqH0-2__A-1
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-6d9bb5929ecso400111b3a.2
 for <qemu-arm@nongnu.org>; Sun, 07 Jan 2024 17:11:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704676303; x=1705281103;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=o7cD/mjBrtIvD3wAR5CMXxLi16Tcka6XxLuFIx3iJzA=;
 b=sU96QMWRrCu8ioCFX06SuQHaw3n/Obyo60pk+CBy/vB058a2+AioFsW0oq9AQzRxh/
 dQ0W3r2nXJUEboA5zELAPjjgq8c3UcpeHTMXIYV1vX/C1dV4vYvejUpGJeBC3/P4FVLF
 537jBfbRTXyCOUHSDxBzQqhC96rWCQhjfmMos6dXmqZT/bJqiZfZEvJ33XZoF/c70tFZ
 3SZhcyTV5yyUZ3KmGbr4K1BxV+Hx5x0iQ7tS1DCkMWfNaDU4pPk8WboC4X3Fw2jrilVb
 6wDhcryunLsEoEDTXW7cm5/YQoag/Ssw/anMSxPZqIXi6CX9mgnDppm4SlppgajDbKLb
 4jQA==
X-Gm-Message-State: AOJu0YwxbvZ6Vf43gMo5fTF10HZx+CjUxwHMM+m71jQIKIkvgLqnWTuo
 I4WzTNE6U+HE1PRkC6bq4R6MbULIWkaqNFakyLjc9C3nmxRoPlkuaeNfLxUg+7P1KRyRTayArQK
 awLh1O5hj+FsLdrwDXhJE
X-Received: by 2002:a05:6a20:320e:b0:199:8b1c:7feb with SMTP id
 hl14-20020a056a20320e00b001998b1c7febmr385911pzc.36.1704676303371; 
 Sun, 07 Jan 2024 17:11:43 -0800 (PST)
X-Received: by 2002:a05:6a20:320e:b0:199:8b1c:7feb with SMTP id
 hl14-20020a056a20320e00b001998b1c7febmr385892pzc.36.1704676303060; 
 Sun, 07 Jan 2024 17:11:43 -0800 (PST)
Received: from [10.72.112.108] ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 p2-20020a170902bd0200b001d38cae83e9sm4984833pls.104.2024.01.07.17.11.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Jan 2024 17:11:42 -0800 (PST)
Message-ID: <5b667637-2fdb-477e-84c4-9334d473892a@redhat.com>
Date: Mon, 8 Jan 2024 11:11:30 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/9] machine: Use error handling when CPU type is
 checked
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 armbru@redhat.com
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, peter.maydell@linaro.org,
 b.galvani@gmail.com, strahinja.p.jankovic@gmail.com, imammedo@redhat.com,
 kfting@nuvoton.com, wuhaotsh@google.com, nieklinnenbank@gmail.com,
 rad@semihalf.com, quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, wangyanan55@huawei.com,
 vijai@behindbytes.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, shan.gavin@gmail.com, qemu-arm@nongnu.org
References: <20231204004726.483558-1-gshan@redhat.com>
 <20231204004726.483558-2-gshan@redhat.com>
 <0bbd5bff-2f38-4625-9e0b-12245f512c01@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <0bbd5bff-2f38-4625-9e0b-12245f512c01@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.098,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: PEUtvmOyzu+4

On 1/5/24 21:00, Philippe Mathieu-Daudé wrote:
> On 4/12/23 01:47, Gavin Shan wrote:
>> Functions that use an Error **errp parameter to return errors should
>> not also report them to the user, because reporting is the caller's
>> job. The principle is violated by machine_run_board_init() because
>> it calls error_report(), error_printf(), and exit(1) when the machine
>> doesn't support the requested CPU type.
>>
>> Clean this up by using error_setg() and error_append_hint() instead.
>> No functional change, as the only caller passes &error_fatal.
>>
>> Suggested-by: Igor Mammedov <imammedo@redhat.com>
>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>> Reviewed-by: Markus Armbruster <armbru@redhat.com>
>> ---
>> v9: Improved change log                                  (Markus)
>> ---
>>   hw/core/machine.c | 13 +++++++------
>>   1 file changed, 7 insertions(+), 6 deletions(-)
>>
>> diff --git a/hw/core/machine.c b/hw/core/machine.c
>> index 0c17398141..bde7f4af6d 100644
>> --- a/hw/core/machine.c
>> +++ b/hw/core/machine.c
>> @@ -1466,15 +1466,16 @@ void machine_run_board_init(MachineState *machine, const char *mem_path, Error *
>>           if (!machine_class->valid_cpu_types[i]) {
>>               /* The user specified CPU is not valid */
>> -            error_report("Invalid CPU type: %s", machine->cpu_type);
>> -            error_printf("The valid types are: %s",
>> -                         machine_class->valid_cpu_types[0]);
>> +            error_setg(errp, "Invalid CPU type: %s", machine->cpu_type);
>> +            error_append_hint(errp, "The valid types are: %s",
>> +                              machine_class->valid_cpu_types[0]);
>>               for (i = 1; machine_class->valid_cpu_types[i]; i++) {
>> -                error_printf(", %s", machine_class->valid_cpu_types[i]);
>> +                error_append_hint(errp, ", %s",
>> +                                  machine_class->valid_cpu_types[i]);
>>               }
>> -            error_printf("\n");
>> -            exit(1);
>> +            error_append_hint(&errp, "\n");
> 
> This doesn't build:
> 
> hw/core/machine.c:1488:31: error: incompatible pointer types passing 'Error ***' (aka 'struct Error ***') to parameter of type 'Error *const *' (aka 'struct Error *const *'); remove & [-Werror,-Wincompatible-pointer-types]
>              error_append_hint(&errp, "\n");
>                                ^~~~~
> 

Yes, &errp should have been errp. The problematic code was carried from
previous revisions and has been corrected by PATCH[2/9]. It's how I missed
the building error. Thanks for fixing it up!

Thanks,
Gavin

>> +            return;
>>           }
>>       }
> 
> Squashing:
> -- >8 --
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 021044aaaf..1898d1d1d7 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -1487,3 +1487,3 @@ void machine_run_board_init(MachineState *machine, const char *mem_path, Error *
> 
> -            error_append_hint(&errp, "\n");
> +            error_append_hint(errp, "\n");
>               return;
> ---
> 

