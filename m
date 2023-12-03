Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp2360134ejb;
        Sun, 3 Dec 2023 15:13:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGlzhusjuuv/E2M65WvnCNkE3NduGubiIRay485O6j92IBaB0XsQ7F4CIEe0nULYVe+TebC
X-Received: by 2002:a05:6358:7206:b0:16f:f398:1dd7 with SMTP id h6-20020a056358720600b0016ff3981dd7mr2683351rwa.29.1701645238356;
        Sun, 03 Dec 2023 15:13:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701645238; cv=none;
        d=google.com; s=arc-20160816;
        b=cT5gGIKrqrbwLtgadBsTtpbBMjMBLL+qkDr7qzz6RH/dNhaP1sJUWgYi8VdfMKkz1m
         WiumzGd20OPCqkzObCGJ+qOQqD3gFsP3HpXpsxxKiSaUePwN+g+b+yUwrDy1y/iWilgc
         9Glwf8O0t/SYnuIOwgIJn5Nd/M3cGez3XsW0D/b9paaR8tMSPPjVVjvG+05E1TyD7wce
         Wbd/VVw3tMSQOPuk1LQhCUrwEJPSP8VnuEM4QwbSqXkir0x1D5MDSEUIZgK9lvImZ6dS
         1ExTaqrLdVKYmpCYxJrmBpevBDVsdgP+wypDitzQflgi6jyEggGYekT3Nge1ig/+gsJc
         5b3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=AddhGMlN52/YRv1w4anICuPDpCboCFFpiOkqpWi288Y=;
        fh=EAfdOT7QKaCr63VZMncVOAz/x0cmxf4toYqRCJ9Km4E=;
        b=bGTnjz3ihrBq39Jy78wP6HM+5/5jJlqdu966Ri+CouCCOeeEez1B7WE9AF6EQbXYwD
         euz90qIZ2PRLxggJhfC5avxfy485wmKDQ5LCUzdBRSdfU1ck9Fe+5qUah1DQxzbnN2lZ
         o7RAb69NxN+9HqcHDYaB/mn0pnSuglaT4b6kiII1xwIbCAy8C0S9oxSA1KUgguvcJgYL
         iS2HjYZykaZkckwlpz/HbWyKSISkXfLikkGjczog4h1hExAGUCIKcfc+1y2u1roIfqY+
         B9VN46ECS6QXLKSPXGVeIkegQDSMCJGY/Jgh8w4z5DkfCe9L2z3PswdlvirLWMoErkID
         /sHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Kl/wJYHY";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c7-20020ad44307000000b0067a98d42519si6336160qvs.33.2023.12.03.15.13.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Dec 2023 15:13:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Kl/wJYHY";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r9veJ-00085b-AW; Sun, 03 Dec 2023 18:13:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r9veH-00084s-Hl
 for qemu-arm@nongnu.org; Sun, 03 Dec 2023 18:13:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r9veF-0006ve-GH
 for qemu-arm@nongnu.org; Sun, 03 Dec 2023 18:13:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701645193;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AddhGMlN52/YRv1w4anICuPDpCboCFFpiOkqpWi288Y=;
 b=Kl/wJYHYvY0sFMyzpgJJ5haVd97/giD1K/Da7lnsU4XlmrOzrczV8nLvPGIdPffU5u+P/M
 43fowZp+r4Gaf5W/7DOhzKQhILPVknjATAnDLc9WfCzHAf2Lazqk6AGE5WZdulxzSwqV/w
 0B3P7IyznCXRAZAaQxHAeYUs81/ijn0=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-98-qcFxQaCgNES5UPHziL8OHQ-1; Sun, 03 Dec 2023 18:13:12 -0500
X-MC-Unique: qcFxQaCgNES5UPHziL8OHQ-1
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-2868fb54e3eso1321815a91.3
 for <qemu-arm@nongnu.org>; Sun, 03 Dec 2023 15:13:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701645191; x=1702249991;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AddhGMlN52/YRv1w4anICuPDpCboCFFpiOkqpWi288Y=;
 b=nDcyUi8X+qaZTXGH9LVCKVUg2XvlZ6gaPQPiGbreOIh3zv1fXveLEzlP8fZfRFmkP6
 7tEXygl4ClAuGeUFF3fvEV/t+8XKpD/V6nOIsvjXG49xa9z6bjhbmNYXOxUmDE+7PjTo
 rmm9SqJ9xMijH1o0Ndc0669DE2oDUrrfJgYdVLFNCv0YFCRdESO7WgnW5ijZi+oYi2g7
 2S+9sTKyWseKROGHtkp/xiBTHotitwNjFvyrjOC+u4zk7rLfD9SOA96uomb9syKygl7e
 DBioCkGKwkLPSnwCsZ/QC6OJmXLkCnsCQWE0Q/wjrAC+x3gijfXSfXSRULX10/7kv9kf
 Fojw==
X-Gm-Message-State: AOJu0YyCr2PDqmWyKVwSy5USrWjB4ujAWMbgYSvGTPXhzrq5i3wnDhg9
 QG2AZqR3nB1ZsQ5eifaxe3W2i6LqdWKhZCua+ITv64zm0fHGZhEiaODuuiRfsH90YmGFfWs0opT
 D8/nCiwmgI8SG
X-Received: by 2002:a17:90a:30f:b0:286:9bc6:c95b with SMTP id
 15-20020a17090a030f00b002869bc6c95bmr880575pje.2.1701645191393; 
 Sun, 03 Dec 2023 15:13:11 -0800 (PST)
X-Received: by 2002:a17:90a:30f:b0:286:9bc6:c95b with SMTP id
 15-20020a17090a030f00b002869bc6c95bmr880565pje.2.1701645191092; 
 Sun, 03 Dec 2023 15:13:11 -0800 (PST)
Received: from [192.168.68.51] ([43.252.115.3])
 by smtp.gmail.com with ESMTPSA id
 p7-20020a17090a348700b00280c285f878sm7252609pjb.55.2023.12.03.15.13.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Dec 2023 15:13:10 -0800 (PST)
Message-ID: <c9f68946-2824-48a5-a0a1-290d7ddba178@redhat.com>
Date: Mon, 4 Dec 2023 09:13:00 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/9] machine: Introduce helper is_cpu_type_supported()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, peter.maydell@linaro.org,
 imammedo@redhat.com, b.galvani@gmail.com, strahinja.p.jankovic@gmail.com,
 sundeep.lkml@gmail.com, kfting@nuvoton.com, wuhaotsh@google.com,
 nieklinnenbank@gmail.com, rad@semihalf.com, quic_llindhol@quicinc.com,
 marcin.juszkiewicz@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, wangyanan55@huawei.com, vijai@behindbytes.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, shan.gavin@gmail.com
References: <20231129042012.277831-1-gshan@redhat.com>
 <20231129042012.277831-3-gshan@redhat.com>
 <fd8715af-ef1c-4ccc-b602-25776a56fc76@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <fd8715af-ef1c-4ccc-b602-25776a56fc76@linaro.org>
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
X-TUID: W9rT0H6KLpbK

Hi Phil,

On 12/1/23 20:53, Philippe Mathieu-Daudé wrote:
> On 29/11/23 05:20, Gavin Shan wrote:
>> The logic, to check if the specified CPU type is supported in
>> machine_run_board_init(), is independent enough. Factor it out into
>> helper is_cpu_type_supported(). machine_run_board_init() looks a bit
>> clean with this. Since we're here, @machine_class is renamed to @mc to
>> avoid multiple line spanning of code. The comments are tweaked a bit
>> either.
>>
>> No functional change intended.
>>
>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>> ---
>> v8: Move the precise message hint to PATCH[v8 3/9]        (Gavin)
>> ---
>>   hw/core/machine.c | 83 +++++++++++++++++++++++++----------------------
>>   1 file changed, 45 insertions(+), 38 deletions(-)
>>
>> diff --git a/hw/core/machine.c b/hw/core/machine.c
>> index bde7f4af6d..1797e002f9 100644
>> --- a/hw/core/machine.c
>> +++ b/hw/core/machine.c
>> @@ -1387,13 +1387,53 @@ out:
>>       return r;
>>   }
>> +static bool is_cpu_type_supported(const MachineState *machine, Error **errp)
>> +{
>> +    MachineClass *mc = MACHINE_GET_CLASS(machine);
>> +    ObjectClass *oc = object_class_by_name(machine->cpu_type);
>> +    CPUClass *cc;
>> +    int i;
>> +
>> +    /*
>> +     * Check if the user specified CPU type is supported when the valid
>> +     * CPU types have been determined. Note that the user specified CPU
>> +     * type is provided through '-cpu' option.
>> +     */
>> +    if (mc->valid_cpu_types && machine->cpu_type) {
>> +        for (i = 0; mc->valid_cpu_types[i]; i++) {
>> +            if (object_class_dynamic_cast(oc, mc->valid_cpu_types[i])) {
>> +                break;
>> +            }
>> +        }
>> +
>> +        /* The user specified CPU type isn't valid */
>> +        if (!mc->valid_cpu_types[i]) {
>> +            error_setg(errp, "Invalid CPU type: %s", machine->cpu_type);
>> +            error_append_hint(errp, "The valid types are: %s",
>> +                              mc->valid_cpu_types[0]);
>> +            for (i = 1; mc->valid_cpu_types[i]; i++) {
>> +                error_append_hint(errp, ", %s", mc->valid_cpu_types[i]);
>> +            }
>> +
>> +            error_append_hint(errp, "\n");
>> +            return false;
>> +        }
>> +    }
>> +
>> +    /* Check if CPU type is deprecated and warn if so */
>> +    cc = CPU_CLASS(oc);
>> +    if (cc && cc->deprecation_note) {
> 
> cc can't be NULL, right? Otherwise,
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 

machine->cpu_type is either mc->default_cpu_type or returned from parse_cpu_option().
It can be NULL if mc->default_cpu_type is invalid, which is a program error. So
assert(cc != NULL) should be used instead. I will fold the change to PATCH[v9 3/9]

>> +        warn_report("CPU model %s is deprecated -- %s",
>> +                    machine->cpu_type, cc->deprecation_note);
>> +    }
>> +
>> +    return true;
>> +}
> 

Thanks,
Gavin

