Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp2366113ejb;
        Sun, 3 Dec 2023 15:31:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHzHnRbA7dai856tgKrZko50ap8YnDz39LrdX+xErNfht2HR/stXBGkSFBnGy2lv1xO1jds
X-Received: by 2002:ad4:4986:0:b0:66d:5d31:999e with SMTP id u6-20020ad44986000000b0066d5d31999emr3931448qvx.43.1701646292850;
        Sun, 03 Dec 2023 15:31:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701646292; cv=none;
        d=google.com; s=arc-20160816;
        b=QrSyOyoq/VxqNZSh212uF3Rz8Wu1B+OjlNv+A1mK4bRCobaYxzk3TX1GIT7fFCjWKe
         BgDAR+JO2gI/CegdEx8mUtKqi5K4bkM1TmSrRVHp4cvABUl60Vvbn3/0Arc9dkBYdmjq
         H/dk6dO8QpaXQQsU9tfs7hsAgYFArLFH3Dpgyia1J5LG08BpWRps9TX/TMAq3pdkhR7/
         LmmEV9xXGHbR7xWBH3fcZ+Aqp+ZHeQBHeOsvwjlYLt9G+g55dg1hUPHEIQ2TLTeoX1Sw
         ctaAeCF4DSGPAM2qq5L+55MTvXXCBylN2RRpPCHL/dTvnyIN0J9APyvPpHUkYdBRFV3h
         NLXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=4sLLt6RkTxm9WrXH5ATrYIbizpJhKLEMffigQpTnVYU=;
        fh=EAfdOT7QKaCr63VZMncVOAz/x0cmxf4toYqRCJ9Km4E=;
        b=io1lWb4hxUCc29clmRIWsBFdnbhcyWpA+j1slE0s3Focqobp2E5O6An5AYayLViHwE
         Pz+zDzUXMpmojxWC47rgCjqA5i9+aKpFdT44k51Mp1wYX4WqTCXiZ3PGJ1V41w6k9ZuN
         w8ZYx2jMWHh+GpQ9arz5VE2ArUjP/lKfukVtq9j0xdhK8XniiBHmjQ/GtTdxTfPNeeC7
         aNEsNtje2voV2ku+kqhOHz3RwDsxz6o61LGZhsXAcqiqXqXFe3vT3khVv5DwZ+h8ukWz
         aZ1/Sli4nUVw3Ra7YlGDYuYIaPGVYcKRPQQOFyNX7liodmqVA4SD5gHxrhWcZeIc9Xko
         HVow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Png+uRPC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c10-20020a0cd60a000000b0066cf06339c8si5321507qvj.197.2023.12.03.15.31.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Dec 2023 15:31:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Png+uRPC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r9vvk-0004Ox-Oo; Sun, 03 Dec 2023 18:31:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r9vvZ-0004Na-HG
 for qemu-arm@nongnu.org; Sun, 03 Dec 2023 18:31:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1r9vvW-0004rW-Op
 for qemu-arm@nongnu.org; Sun, 03 Dec 2023 18:31:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701646265;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4sLLt6RkTxm9WrXH5ATrYIbizpJhKLEMffigQpTnVYU=;
 b=Png+uRPCdbLPnm6zBGkr/jcxNKiz6aD0bMY0IDFPk4fs9+9fEwkUxFCj0olV/kKVHSIzHc
 tf+oVvSd7l/X0rpTSFQKm4BovzgC/42x2Gno6InUhybQznBn5OpQz+aScCjZQ2ks7n7fK2
 5j9zry8BIc0PuDOf47v8PErKjcHoijs=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-509-PFY3WjhQNc2A9XYGTAp5ug-1; Sun, 03 Dec 2023 18:31:02 -0500
X-MC-Unique: PFY3WjhQNc2A9XYGTAp5ug-1
Received: by mail-oi1-f200.google.com with SMTP id
 5614622812f47-3b2e7ae47d1so3885286b6e.0
 for <qemu-arm@nongnu.org>; Sun, 03 Dec 2023 15:31:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701646261; x=1702251061;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4sLLt6RkTxm9WrXH5ATrYIbizpJhKLEMffigQpTnVYU=;
 b=RXhJmRZ59yUrpHC6oJkxiPDLD/WMS4eocYpiwbBQd7xJLxHmlhS7RBVLBIpKMrBSOc
 Zs1HLExIbN7dX240EstIhsZmK7zCfIuZYXSfwIrKVObHPvg1mpnrdlVVsQKLb1Vlo1Pn
 DTGkhaBQQ5AvlkSU1VHhyBV/ZnBgKr+3MHzTrKeMur94tGzOLuEfTEqLX8ffNNqIPng8
 xMyAqS1tUrjjwtevjQRF/3TtwQf3683l1s5evCiprAPT7dWFbtmrjAjW7FRWOJOSSGbe
 Ovl9pTqc/8V28uU5PKbTaIQjK9Ddh0y449H2Hfk1KO6YVt9LOfWbZfjsNehQwuha2UGJ
 VykQ==
X-Gm-Message-State: AOJu0Yxvv6z/dscgA1/GvvHh4j82OqxWlVumAwrwHUKThgVwt6Db2os2
 rdjrpZGwHPQRIRHzuay9yaFAoIGbaDpMn8+Hq7b7N672p3mTzY4VJQXpVjOrzJb9Ks1QjOrX7zn
 eon1eIUcorJr8
X-Received: by 2002:a05:6808:208d:b0:3b8:b063:8240 with SMTP id
 s13-20020a056808208d00b003b8b0638240mr3976550oiw.66.1701646261757; 
 Sun, 03 Dec 2023 15:31:01 -0800 (PST)
X-Received: by 2002:a05:6808:208d:b0:3b8:b063:8240 with SMTP id
 s13-20020a056808208d00b003b8b0638240mr3976534oiw.66.1701646261562; 
 Sun, 03 Dec 2023 15:31:01 -0800 (PST)
Received: from [192.168.68.51] ([43.252.115.3])
 by smtp.gmail.com with ESMTPSA id
 x21-20020aa793b5000000b006ce4c7ba43fsm1046633pff.120.2023.12.03.15.30.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Dec 2023 15:31:01 -0800 (PST)
Message-ID: <fbcf6473-9961-4d42-a961-d87e99e46351@redhat.com>
Date: Mon, 4 Dec 2023 09:30:51 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/9] machine: Improve is_cpu_type_supported()
From: Gavin Shan <gshan@redhat.com>
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
 <fa0e8be7-8f18-4d74-ad5d-6dc44d375d2d@redhat.com>
In-Reply-To: <fa0e8be7-8f18-4d74-ad5d-6dc44d375d2d@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
X-TUID: D7k4vg1LsxPm

Hi Phil,

On 12/4/23 09:20, Gavin Shan wrote:
> On 12/1/23 20:57, Philippe Mathieu-Daudé wrote:
>> On 29/11/23 05:20, Gavin Shan wrote:
>>> It's no sense to check the CPU type when mc->valid_cpu_types[0] is
>>> NULL.
>>
>> This case is a programming error, right? We should simply:
>>
>>   assert(!mc->valid_cpu_types || *mc->valid_cpu_types);
>>
> 
> Yes, assert() should be used instead. I will do this like below:
> 
>      if (mc->valid_cpu_types && machine->cpu_type) {
>          assert(mc->valid_cpu_types[1] != NULL);
> 

I meant assert(mc->valid_cpu_types[0] != NULL) and sorry for the confusion.

       if (mc->valid_cpu_types && machine->cpu_type) {
           assert(mc->valid_cpu_types[0] != NULL);
           :
       }

> 
>>> So the check is skipped for this particular case. The constraint
>>> has been taken when the error messags are appended.
>>>
>>> A precise hint for the error message is given when mc->valid_cpu_types[0]
>>> is the only valid entry. Besides, enumeration on mc->valid_cpu_types[0]
>>> when we have mutiple valid entries there is avoided to increase the code
>>> readability, as suggested by Philippe Mathieu-Daudé.
>>>
>>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>>> ---
>>>   hw/core/machine.c | 18 ++++++++++++------
>>>   1 file changed, 12 insertions(+), 6 deletions(-)
>>

Thanks,
Gavin

