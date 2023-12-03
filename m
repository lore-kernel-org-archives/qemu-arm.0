Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp2362855ejb;
        Sun, 3 Dec 2023 15:21:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH232ddAwyF6yDhqgGd8/SrCltFNCcS9f4si/6RhhjDlzeHfqdhOhm7SKIOPyuAAOr1e1h/
X-Received: by 2002:a05:620a:2605:b0:77f:4cd:94 with SMTP id z5-20020a05620a260500b0077f04cd0094mr2919657qko.87.1701645705326;
        Sun, 03 Dec 2023 15:21:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701645705; cv=none;
        d=google.com; s=arc-20160816;
        b=beaINZVb1D+XcLPksznMDS6mH6YqlzemMyrgrxfkWVz1vatZm0mmcJKaweEXcO3I+F
         X2v9m7SWEPFYEErj5h7C1CzoZZdqjPeOVjW/uW4EIFuxhACQlKrspRCfgYBjj60XXtB4
         kAjEWtx8N6thYXAhqHo8RdiPpbQ6g4c/eMHFJ3Y44o9Z7RkYoN9zCtWGz+hrwSGcfD/9
         kiu0o+ahJdvyDSldzytohEKepN6z2qYIpCTQz/V9euqeAQ0CscTnfUPD5wQYcrG7rd+j
         pE09A45SydxsTODx98vYoz8SnVyPcNJeYrvfRInIpzSDLnYAwjBd5cd/WOgrb51Vqgx+
         swKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=spwkLDHgoaxm9u/144CqpiGtbQ9F85ARNRSrmjoTQow=;
        fh=EAfdOT7QKaCr63VZMncVOAz/x0cmxf4toYqRCJ9Km4E=;
        b=hRiiB6/5rn57VJXg35bi4BZZo8W3miZ6uwK/poCeg6kM5AuoALCEPuo3qKoYFKHEuM
         8Uyb9M7NfMmpbwVTyHJi9JIU2+DaYE34/SC63VysgXkIS4tb69Q3435GHsv45XN6CNQb
         +wUP3bZ8rWbm36qFuFMenjXpZdXsTV8mGQcgPitojr430M8ZphFdztbThahy9SNfStME
         SrSXi33B9/4ZY7vcQvYErKLJsGp/OuXzkJMR+jMPpLXOgnpVl5kzvCMTPwMlmB13PPQm
         GqIOi0ELAzAc+D4rSOb9C2/GJxCzWfGHSbHsP3w4y8mjvyrAT1rI5do8RLSQCB/IqAQI
         jIjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="gvVQkT/q";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id qq1-20020a05620a38c100b0077da7c84a50si7858456qkn.5.2023.12.03.15.21.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Dec 2023 15:21:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="gvVQkT/q";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r9vlk-0001pt-BJ; Sun, 03 Dec 2023 18:21:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r9vli-0001pN-TD
 for qemu-arm@nongnu.org; Sun, 03 Dec 2023 18:20:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r9vlh-0000Ut-DQ
 for qemu-arm@nongnu.org; Sun, 03 Dec 2023 18:20:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701645655;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=spwkLDHgoaxm9u/144CqpiGtbQ9F85ARNRSrmjoTQow=;
 b=gvVQkT/q10T7C79kFD17SrUJpuejMfjijjYRh4D4OprW2ctGgpHJpHSgXVweWFXhyOBCFs
 pcBF2EgERKbG2TZHIA1KDIQDwy1CB0+WA0S0pItO6UTDfFH9Bh5IQecAEnZuVtw3s53ORP
 g6+q+JSSEb+X44MX9Rk8EW89FkyuQks=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-322-gwQqO0tTN9ulUegpB-XoOA-1; Sun, 03 Dec 2023 18:20:54 -0500
X-MC-Unique: gwQqO0tTN9ulUegpB-XoOA-1
Received: by mail-oa1-f71.google.com with SMTP id
 586e51a60fabf-1fafc2d40dfso3752898fac.1
 for <qemu-arm@nongnu.org>; Sun, 03 Dec 2023 15:20:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701645653; x=1702250453;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=spwkLDHgoaxm9u/144CqpiGtbQ9F85ARNRSrmjoTQow=;
 b=j3TSY5zqfxsAOjOapeRa1GdkVrW8Ej0lBVE9z2/k+sJ6+7ddm/xPF9Bgut44Fh6zT0
 BExaSM95wHP7u9YPI8AKkfcf5GipTm9r2qxXnk/Zo6GdwvI7ewlrRacJbEQzZBMoeBL2
 2cd9ysvQ9zGZFp/P5UNOphDnzf9lUIURfhf9/vpscPmNbcMBJnEAEytlfudvUoeawK+f
 eLQY0xa1gzHfVVgf/1Hn+LdBcyos6L97z2WNk++xl46vzvW1qph0+o1TDI+4qpKxX8PI
 SWk1h6ltqzmFs8VJERIjpeJVHEn23bBb1OcvOn0E/vlyEJeTKHfubZOuPmt5tlnb4mKS
 HWcg==
X-Gm-Message-State: AOJu0YwXdK9V0uaI6khs0tLFG++zsl2RZx2pQln7/JknNvtUgRypb0Gv
 7DNchDXtBFWDSlJi4RcM8aNo0uTlr6nSSOlHDyiHrmIwV6H+3YjTFpT0eob0FyzaRs3T3rKZjUY
 F1ONyMn48J0Qa
X-Received: by 2002:a05:6870:d889:b0:1fb:75b:2fb3 with SMTP id
 oe9-20020a056870d88900b001fb075b2fb3mr3531170oac.74.1701645653621; 
 Sun, 03 Dec 2023 15:20:53 -0800 (PST)
X-Received: by 2002:a05:6870:d889:b0:1fb:75b:2fb3 with SMTP id
 oe9-20020a056870d88900b001fb075b2fb3mr3531134oac.74.1701645653335; 
 Sun, 03 Dec 2023 15:20:53 -0800 (PST)
Received: from [192.168.68.51] ([43.252.115.3])
 by smtp.gmail.com with ESMTPSA id
 c5-20020aa78805000000b006cb65cfde6dsm6358199pfo.200.2023.12.03.15.20.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Dec 2023 15:20:53 -0800 (PST)
Message-ID: <fa0e8be7-8f18-4d74-ad5d-6dc44d375d2d@redhat.com>
Date: Mon, 4 Dec 2023 09:20:42 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/9] machine: Improve is_cpu_type_supported()
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
 <20231129042012.277831-4-gshan@redhat.com>
 <83046c42-1df3-499e-b202-b123391d39cb@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <83046c42-1df3-499e-b202-b123391d39cb@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
X-TUID: i+ERJ8mTO6kk

Hi Phil

On 12/1/23 20:57, Philippe Mathieu-Daudé wrote:
> On 29/11/23 05:20, Gavin Shan wrote:
>> It's no sense to check the CPU type when mc->valid_cpu_types[0] is
>> NULL.
> 
> This case is a programming error, right? We should simply:
> 
>   assert(!mc->valid_cpu_types || *mc->valid_cpu_types);
> 

Yes, assert() should be used instead. I will do this like below:

     if (mc->valid_cpu_types && machine->cpu_type) {
         assert(mc->valid_cpu_types[1] != NULL);


>> So the check is skipped for this particular case. The constraint
>> has been taken when the error messags are appended.
>>
>> A precise hint for the error message is given when mc->valid_cpu_types[0]
>> is the only valid entry. Besides, enumeration on mc->valid_cpu_types[0]
>> when we have mutiple valid entries there is avoided to increase the code
>> readability, as suggested by Philippe Mathieu-Daudé.
>>
>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>> ---
>>   hw/core/machine.c | 18 ++++++++++++------
>>   1 file changed, 12 insertions(+), 6 deletions(-)
> 

Thanks,
Gavin

