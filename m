Received: by 2002:a17:906:b78f:b0:98d:b2f5:1316 with SMTP id dt15csp2235062ejb;
        Mon, 24 Jul 2023 17:01:32 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFN5/16ap8sLS7nxzkaM+UdJt1ELc55e7/g8rpld3YhRE4pZYdO1V0hWSMDxi1wCeYO8QWW
X-Received: by 2002:a05:620a:a1c:b0:767:6c4:add1 with SMTP id i28-20020a05620a0a1c00b0076706c4add1mr1191450qka.45.1690243292607;
        Mon, 24 Jul 2023 17:01:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690243292; cv=none;
        d=google.com; s=arc-20160816;
        b=UrSUXhlQTHf7cY7RlZ2K4iLIVT41qlAbauu46haNVRa0HG2PJpHiAplBtm1TaQXySR
         4mkghWxaWJ3G8LrrExj4mBaJna9txYkKXIcI7reIhEGvm0WKNyroYKzsShXxejswZ0ko
         gAP9iqjJB9Twt5oYpiCDrIZz3yrcGHmlul1mDRXAYYIsqpzacMR8FRS+r5VSHdGWDKt5
         g0npluXSa6wpDDSnFqRhiA3pJdHN4TRGENlA39F2LBKHrst18kVjVcUTcOvXeQ/F3LK7
         M7j31ihmbWGO9cdqIIJ9Q9O6HULUrENr7KtTZRB5hhM5gpaJOgiblG4WoPvGV034MuVC
         6TiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=AGMLgvPQ9oVQ5a58eOnstHWba90xgOfCvkrBdng9LSo=;
        fh=bhKRZPTQegM9ngYzHPCNUPwAe0pzdMQzbQuG7bFjfgA=;
        b=J6lQiC3AUK9bn+fcTry36HB0PBInajsw4J7g/YqD71ZIU//ItvDHetWqw+g8q8JFVP
         eZKECJ6P+T1B1WfhY6qHCaJK0tkwLfLSSjm4W1K4fWINVN3J0lx5fYIz0X+AvoLlAyyo
         F3zZzbnBlK4gYznbfvHjoQI5UFHdlFNvdDmIxDz2ldwwqXRu9GX6bpQYyvwwCvuPYQOZ
         mvK8l1Kpr/zLasu+OvCktbRA2jAf42jPUV4oU12EWIQoae0lzgEX9HyVCoz79gFqL0Wu
         J4wgWMU8nBqXZHx8m/kMnynxnXw1cjkjhfEb9aG1D730EO2HlmvPuh8Rt7Yq8guYpnYC
         hWXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Lb+8gCY9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ay13-20020a05620a178d00b007621b47d0a7si5705258qkb.392.2023.07.24.17.01.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Jul 2023 17:01:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Lb+8gCY9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qO5UL-0000n3-Nw; Mon, 24 Jul 2023 20:01:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qO5UK-0000mo-Nq
 for qemu-arm@nongnu.org; Mon, 24 Jul 2023 20:01:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1qO5UJ-0001Ge-1m
 for qemu-arm@nongnu.org; Mon, 24 Jul 2023 20:01:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690243273;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AGMLgvPQ9oVQ5a58eOnstHWba90xgOfCvkrBdng9LSo=;
 b=Lb+8gCY96SQNpmSqMByCLLeyO34+uJbrzQB5Fb/Iw94FYLjIyGPorX1fEl8eNsCn5NmWkA
 2WIHlCXw0DLqfovkLs3J+Ta5yJEWGEgYFjVBzUh0Y9gcYMxJlrqsSvPpcY2XGaJoBLdixm
 2AB26YHeU8hY5uAYC/SQb+IzIHU9IFc=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-kLxDL9MaOtWJdc-5DGg8eg-1; Mon, 24 Jul 2023 20:01:11 -0400
X-MC-Unique: kLxDL9MaOtWJdc-5DGg8eg-1
Received: by mail-oi1-f197.google.com with SMTP id
 5614622812f47-3a36b311b5cso10504531b6e.3
 for <qemu-arm@nongnu.org>; Mon, 24 Jul 2023 17:01:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690243270; x=1690848070;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AGMLgvPQ9oVQ5a58eOnstHWba90xgOfCvkrBdng9LSo=;
 b=lKre3Jj+4B5l6/t5H/26XuavJB44pV8nUx8ZPAPBYHOKNDoGFbsWwcNh2BUb6uLFAs
 TKUCPo5i/6IrAhe26ONMCxRWMBI3JMTOMZoI5mOxtVZGcdDWdlktWUHvH+S0gzawA6ZD
 spj3zIeUwAG0m4HH5ADlOMOqUuj2XB6OEF/ZbaoEmFCi57Jmt2oqM7JCLWVtiTS3DWSh
 UWHJhzr4XlC43u5uv4wjYXqoKwyCRQECSxlMx7t6VZ7RUOw6q33KY5yvkRsigorFWxkJ
 vfYgIjik9gUJBIWC9KWDRF4waNCadCk1ER8Lqon6k7Ixh/ceMlgGAvRT3fkM++k+f09f
 fRCA==
X-Gm-Message-State: ABy/qLZjUqAIhQjBy5c6BuAk8sEH2DZRHJ4dor0xSDsbFoJv120W6bpA
 QgnK4Rwhqu5Emr6uklgGmPXhl05kPVD6OxKK8ZEVJUCZBvJgpj7azjKzIqZeGyxQM375PR9MeMt
 kkxfAQnFPM0D4
X-Received: by 2002:a05:6808:1818:b0:3a5:afdf:8ebb with SMTP id
 bh24-20020a056808181800b003a5afdf8ebbmr6830761oib.17.1690243270257; 
 Mon, 24 Jul 2023 17:01:10 -0700 (PDT)
X-Received: by 2002:a05:6808:1818:b0:3a5:afdf:8ebb with SMTP id
 bh24-20020a056808181800b003a5afdf8ebbmr6830750oib.17.1690243270053; 
 Mon, 24 Jul 2023 17:01:10 -0700 (PDT)
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5?
 ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
 by smtp.gmail.com with ESMTPSA id
 y7-20020a1709029b8700b001b89045ff03sm9565456plp.233.2023.07.24.17.01.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jul 2023 17:01:09 -0700 (PDT)
Message-ID: <4a990b57-800c-6799-8c23-4488069ffb76@redhat.com>
Date: Tue, 25 Jul 2023 10:01:04 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH for-8.2 2/2] arm/kvm: convert to kvm_get_one_reg
To: Cornelia Huck <cohuck@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org
References: <20230718111404.23479-1-cohuck@redhat.com>
 <20230718111404.23479-3-cohuck@redhat.com>
 <db578c20-22d9-3b76-63e7-d99b891f6d36@redhat.com> <878rb5g0f0.fsf@redhat.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <878rb5g0f0.fsf@redhat.com>
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
 NICE_REPLY_A=-0.091, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
X-TUID: MG2rkQUaZkfM


On 7/24/23 18:48, Cornelia Huck wrote:
> On Mon, Jul 24 2023, Gavin Shan <gshan@redhat.com> wrote:
>>
>> On 7/18/23 21:14, Cornelia Huck wrote:
>>> We can neaten the code by switching the callers that work on a
>>> CPUstate to the kvm_get_one_reg function.
>>>
>>> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>>> ---
>>>    target/arm/kvm.c   | 15 +++---------
>>>    target/arm/kvm64.c | 57 ++++++++++++----------------------------------
>>>    2 files changed, 18 insertions(+), 54 deletions(-)
>>>
>>
>> The replacements look good to me. However, I guess it's worty to apply
>> the same replacements for target/arm/kvm64.c since we're here?
>>
>> [gshan@gshan arm]$ pwd
>> /home/gshan/sandbox/q/target/arm
>> [gshan@gshan arm]$ git grep KVM_GET_ONE_REG
>> kvm64.c:    err = ioctl(fd, KVM_GET_ONE_REG, &idreg);
>> kvm64.c:    return ioctl(fd, KVM_GET_ONE_REG, &idreg);
>> kvm64.c:        ret = ioctl(fdarray[2], KVM_GET_ONE_REG, &reg);
> 
> These are the callers that don't work on a CPUState (all in initial
> feature discovery IIRC), so they need to stay that way.
> 

Right, All these ioctl commands are issued when CPUState isn't around. However, there
are two wrappers read_sys_{reg32, reg64}(). The ioctl call in kvm_arm_sve_get_vls()
can be replaced by read_sys_reg64(). I guess it'd better to do this in a separate
patch if you agree.

Thanks,
Gavin

