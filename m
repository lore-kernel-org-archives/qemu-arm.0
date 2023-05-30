Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2175218ejb;
        Tue, 30 May 2023 06:25:07 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5oVm+teEdIMLS5fKE99Yr/uai54S/2yNbEYMS2+exPgcaxHDplUdb0DURAIVQWG0bxXekE
X-Received: by 2002:a05:6214:518f:b0:5ea:9fc5:fca2 with SMTP id kl15-20020a056214518f00b005ea9fc5fca2mr2212765qvb.45.1685453106910;
        Tue, 30 May 2023 06:25:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685453106; cv=none;
        d=google.com; s=arc-20160816;
        b=YvpQM/A9ZCAN41SaxTrXcmdvJ9AYVVqHZjLx9SnX6XPHQBN6mTKdVRshxvLk2+Cyi/
         pbXhymxk1uM+dvxPxOUekazLyDlGYzTSu0I7/F4AwZUR134V155rG1GD6X+CZ8AIcPjc
         vGlwFjYZI2hM49ZKIzt08a236BmcyMD93/Hnh6EkiGmynmQjcveZHw2AZKGB4YX/udt5
         bi6DKPJ5HyZt5Z9Gbw3EALzywRt12q8+uYfYFWOREUoPqw/dGVuKwXr4uvetySAgaeeF
         lZJwtMwCCqaePhhAvFnlZBY9WvbRLdz53ExJv3qetPYiufNSJSY2bGUkRCvSyvHZHuH8
         ESnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:organization:references:cc:to:from
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=AsWvSWDFZhMk6DBVlQagesaEKcw2j5MUn28Zz407PQs=;
        b=WE8uBi1EmUq9rK+2A0Uqx/ZmJ9dxn2Z+rLnCtbmE0dyg9dfv4n3Vsy940GkZlpDaiw
         4Kw9ufuwCOi6S7vE3eIFcUGYPGlHguf7nKDpgV3A2ZFwJS2Kdoymn4hv7tM58yJdXMdP
         Os6XSFfD33pOFOEEEGalEmJb6ieT2sVSOG6CD95buBX4ktyNl82tjcd4AphWsSjmfZnr
         HcHT0a6rv613On8w55dDJcv+rouOy4RPNFy8VfZxo2F1W48f5qwIOJzq0Zd+0g5BqIim
         0gZRQBInkpIyXNoJUJ/bqbK9vwcALRZhLgjdf8qIqYDLKs5WiHWYS4PM3XRSC/tNrUnP
         RJdw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UsGwm1AB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gv8-20020a056214262800b005eda1d1d9aasi6499840qvb.598.2023.05.30.06.25.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 May 2023 06:25:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UsGwm1AB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q3zLK-0004Sl-7Q; Tue, 30 May 2023 09:24:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1q3zKr-0004D6-F2
 for qemu-arm@nongnu.org; Tue, 30 May 2023 09:24:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1q3zKp-0000Rp-T1
 for qemu-arm@nongnu.org; Tue, 30 May 2023 09:24:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1685453063;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AsWvSWDFZhMk6DBVlQagesaEKcw2j5MUn28Zz407PQs=;
 b=UsGwm1ABfM9X0muyHQC/lfk4bFsLTDKnJCeeeT+cY1nMeNkPM3vfc/3+3yYzuauB/3WbNF
 3f1T/d+Vyt2WqsdgRqdI7WOu4bQJkOlA0JWS4MY13u1UgROGx/ebv5qvYMJlpO67eCdZ9Y
 0+hRzMPsLIh9kuS+t1JA2PXDWWwBlSU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-296-CPthJGZpO3eRsgeBs4iUFg-1; Tue, 30 May 2023 09:24:19 -0400
X-MC-Unique: CPthJGZpO3eRsgeBs4iUFg-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3079c6648e3so2691427f8f.2
 for <qemu-arm@nongnu.org>; Tue, 30 May 2023 06:24:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685453058; x=1688045058;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :from:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AsWvSWDFZhMk6DBVlQagesaEKcw2j5MUn28Zz407PQs=;
 b=MjvdN5CQGwDBouYbuLzs46ZmQyx2lmMIDaGrGjH1fvTq0V3Ty+0+zwup4i6kBoYc9l
 b+FwIGntgx3SxicofwAlcr+Z9t4RP9HdUtl4GrgQEsbD9CfqkzerJoEsSKpG6ZXrEAvy
 7dqUa0t0B5lv54LexfoOC8TMyjCtN82Nl0ssBI5aXk6h9ktdu3Va+ZsgRQTsFr7q1WiO
 RSrAuv6hcSQvys0sfq3ns7x6jWvK9cYXjwaMIi+H92QH1OiS0up9S87lOVAc97EA5Ais
 7uO8FuhplJ2QwllGNaX3dHCOf4Lx5noU05okM9gFF1iVQ3lK+NDL4RYEbWGgcjrKzfO5
 LSEw==
X-Gm-Message-State: AC+VfDwE4RDW5/oPi12TTXVUqt7QAcPbzow1Dlv52ZNkSDDVMPUkyDw9
 0E5qs5BICCIeDGhcYufhcdqHmFOSGc9jzS+NnogU6UhqODLCABF75PQuC4xGIS5AkaxryXYwWG2
 3aZb5Z6zHhbHLEl0Tok+U
X-Received: by 2002:adf:dd92:0:b0:30a:b46a:a443 with SMTP id
 x18-20020adfdd92000000b0030ab46aa443mr1522367wrl.51.1685453058131; 
 Tue, 30 May 2023 06:24:18 -0700 (PDT)
X-Received: by 2002:adf:dd92:0:b0:30a:b46a:a443 with SMTP id
 x18-20020adfdd92000000b0030ab46aa443mr1522339wrl.51.1685453057798; 
 Tue, 30 May 2023 06:24:17 -0700 (PDT)
Received: from ?IPV6:2003:cb:c73c:d500:78e5:f448:8bef:a30?
 (p200300cbc73cd50078e5f4488bef0a30.dip0.t-ipconnect.de.
 [2003:cb:c73c:d500:78e5:f448:8bef:a30])
 by smtp.gmail.com with ESMTPSA id
 o11-20020a5d670b000000b0030ada01ca78sm3297976wru.10.2023.05.30.06.24.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 May 2023 06:24:17 -0700 (PDT)
Message-ID: <ab0b1cf4-b4a7-8ebe-81f9-d85317d16c35@redhat.com>
Date: Tue, 30 May 2023 15:24:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 02/10] memory-device: Introduce memory_devices_init()
From: David Hildenbrand <david@redhat.com>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <eduardo@habkost.net>, Greg Kurz <groug@kaod.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>, Xiaojuan Yang <yangxiaojuan@loongson.cn>
References: <20230530113838.257755-1-david@redhat.com>
 <20230530113838.257755-3-david@redhat.com>
 <7ff1f897-7244-258e-34a5-a4a781f679dc@linaro.org>
 <2e51c9e4-3716-5f55-b006-30a40b0ea0da@redhat.com>
Organization: Red Hat
In-Reply-To: <2e51c9e4-3716-5f55-b006-30a40b0ea0da@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 4P6rkNQxH5oI

On 30.05.23 15:04, David Hildenbrand wrote:
> On 30.05.23 14:29, Philippe Mathieu-Daudé wrote:
>> Hi David,
>>
>> On 30/5/23 13:38, David Hildenbrand wrote:
>>> Let's intrduce a new helper that we will use to replace existing memory
>>> device setup code during machine initialization. We'll enforce that the
>>> size has to be > 0.
>>>
>>> Once all machines were converted, we'll only allocate ms->device_memory
>>> if the size > 0.
>>>
>>> Signed-off-by: David Hildenbrand <david@redhat.com>
>>> ---
>>>     hw/mem/memory-device.c         | 14 ++++++++++++++
>>>     include/hw/mem/memory-device.h |  2 ++
>>>     2 files changed, 16 insertions(+)
>>
>>
>>> diff --git a/include/hw/mem/memory-device.h b/include/hw/mem/memory-device.h
>>> index 48d2611fc5..6e8a10e2f5 100644
>>> --- a/include/hw/mem/memory-device.h
>>> +++ b/include/hw/mem/memory-device.h
>>> @@ -16,6 +16,7 @@
>>>     #include "hw/qdev-core.h"
>>>     #include "qapi/qapi-types-machine.h"
>>>     #include "qom/object.h"
>>> +#include "exec/hwaddr.h"
>>>     
>>>     #define TYPE_MEMORY_DEVICE "memory-device"
>>>     
>>> @@ -113,5 +114,6 @@ void memory_device_plug(MemoryDeviceState *md, MachineState *ms);
>>>     void memory_device_unplug(MemoryDeviceState *md, MachineState *ms);
>>>     uint64_t memory_device_get_region_size(const MemoryDeviceState *md,
>>>                                            Error **errp);
>>> +void memory_devices_init(MachineState *ms, hwaddr base, uint64_t size);
>>
>>
>> While hw/mem/memory-device.c contains the implementation, all callers
>> are expected to be around Machine object, right? Thus maybe this _init()
>> could be declared in "hw/boards.h", already included by machines
>> (eventually renaming as machine_init_memory_devices() ). Then machines
>> implementation don't have to all include "hw/mem/memory-device.h".
> 
> Some (arm, i386) want to call the hotplug handle functions either way,
> so they'll still have to include that header.
> 
> But sure, we can rename to machine_init_memory_devices() and declare it
> include/hw/boards.h!

FWIW, I went with "machine_memory_devices_init()", to mach the style of 
"machine_run_board_init()".

-- 
Thanks,

David / dhildenb

