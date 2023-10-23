Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp1155037ejb;
        Sun, 22 Oct 2023 23:03:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYu8oFFirYu0BRCeGgHuLaIvHdZObS0IBQK61oRFbDHvPi6X6VWR9oXT1Z1AKngXdWwkww
X-Received: by 2002:a9d:7996:0:b0:6b7:56d9:533 with SMTP id h22-20020a9d7996000000b006b756d90533mr7297216otm.28.1698041010052;
        Sun, 22 Oct 2023 23:03:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698041010; cv=none;
        d=google.com; s=arc-20160816;
        b=O87QoBQ+QxDOUFM+bA+z1/Dn+w+0wyOeC3ZBfjnQ2soNxPWaqJFwwtGloFHe3Womds
         rZ4WH7x6RfDbVjcd9qFPeezFfZcEIhYDkqe0yDvV/9PmdP8W7aYHR5ZqGHV0GdIXVSlW
         3HS+VwbgOYHeBkkwuPQfU3UfSf/OrPC642A5XwdMB1VMHhHQNBBqPqfflIrBT6jCWjIB
         lDJMx2sVR0i8u+SL1kYhehm5vwFKf/LopIXZNIJVis6eyihEw81yDn/G5lYSK8I0OHXX
         uJSrdUFofYF8hWV2iRvQOKoxaz5rkgeOfKqUw6YHtA66bumoskuAG6lz6VyBMMZdrJa2
         DNfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=W5MV1gFNb82nnFIYVa5B5yAoXaVdbnLhgg6SAwJYVIw=;
        fh=zNNVme2KZD5WFK75w+CXgH1dcX5eoMXV1AzhmP5xQ/8=;
        b=XUFjOT8P5WyunUGHs+RKhMqmET0Cuf3igPmvIhe9hsUG2aYpxvEbG/r02+rrsLca3U
         9WCdbsgjfoQaWlohoHA5w7BgtLZYuwB/Rh/FqL7SG8T5qbPMRL249E1mJJa3CFfsYtnT
         im0fOar3KZYv64Nhet5Xnj5GC37aDS5k5+1geRKD8/ljsYhKfqWMkri0Wgy+tLCcnpdk
         p3oKIYn53TmjhspkQPTX/Ryaqe8Mv/Z4z1rbA1IOyh0VbrwbZSCRv+RVdyLkyEribBsn
         uZfPz8StiN8jNj2CDaYIgpiKZxyv0n9vzzdXA7EEbB992QRqc9Mw0kJpr1zD1AB+jkNo
         q92g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UcjaWQ+Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dr6-20020a05621408e600b00668da56152asi4929455qvb.208.2023.10.22.23.03.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 22 Oct 2023 23:03:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UcjaWQ+Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1quo1d-000672-4a; Mon, 23 Oct 2023 02:02:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1quo1W-000661-04
 for qemu-arm@nongnu.org; Mon, 23 Oct 2023 02:02:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1quo1K-0003Bx-G5
 for qemu-arm@nongnu.org; Mon, 23 Oct 2023 02:02:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698040933;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=W5MV1gFNb82nnFIYVa5B5yAoXaVdbnLhgg6SAwJYVIw=;
 b=UcjaWQ+Q7kMM7Xa+la5agQvkxKbbtNBUiQslH5gevDX4aIgq39plqfl22e5QNp9XUMo/CN
 szurhdqgcKYeyBw72lQ9B1GHrFvvSK4fqDErsPsVNRhnhddUzcDH5MBl3Ba/36IBxj53fe
 uiQLQ90mCgQxDPTYdAZZ6aA/85GT2Wg=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-467-0RrxmVFkPoa7OsFwzz-oUQ-1; Mon, 23 Oct 2023 02:02:10 -0400
X-MC-Unique: 0RrxmVFkPoa7OsFwzz-oUQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-9c797b497e8so123024466b.0
 for <qemu-arm@nongnu.org>; Sun, 22 Oct 2023 23:02:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698040929; x=1698645729;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=W5MV1gFNb82nnFIYVa5B5yAoXaVdbnLhgg6SAwJYVIw=;
 b=rDmxB2J499Ao9h538DjNuGJ4JJdhGdWqleyrBF1WZrmrEYPNWZBCNfOIDsdL+bHuIv
 kLrz7TLCbksM+xy6zBfVT9x4/x0ExW77VX3rcexmMoiv7h7DBcQnJtzhreYxV7ZHn+rC
 xc9AFLpK9Udl6M9q2PC0yMbJPiuprwBjhYm94ODosBiLElxKVVO4ryltsWKTb01DrSCO
 KDbAgJLiUZ3IYUoTjcOH0cMclLL5GWrAEvGyjKwaZySuE64S1yhYA+Me0KmKDiJ9EFLX
 3/r+vpdBui5ZQ+RmJVL0n8XRAn0ykMB6+T358pySzt2WNu8xV8fT8rZkBlEUeAThR4en
 r/nw==
X-Gm-Message-State: AOJu0YzCz/xBIDQx9om3S+BJDKaVdW1JftmtYpiuxxuCj8VQsReVNmxI
 Iq1Hp+41v1M80XON06HrpG/W/2837rUkIL969qSxdSau0G3dvcQs0dUcml41QrpPdePu9w3klSf
 rFhnEMjq+3f3q
X-Received: by 2002:a17:907:2d09:b0:9c3:a3f2:4cec with SMTP id
 gs9-20020a1709072d0900b009c3a3f24cecmr5604026ejc.0.1698040929158; 
 Sun, 22 Oct 2023 23:02:09 -0700 (PDT)
X-Received: by 2002:a17:907:2d09:b0:9c3:a3f2:4cec with SMTP id
 gs9-20020a1709072d0900b009c3a3f24cecmr5603980ejc.0.1698040928727; 
 Sun, 22 Oct 2023 23:02:08 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-141.web.vodafone.de.
 [109.43.176.141]) by smtp.gmail.com with ESMTPSA id
 a19-20020a1709065f9300b009b94c545678sm6028653eju.153.2023.10.22.23.02.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 Oct 2023 23:02:08 -0700 (PDT)
Message-ID: <76272c6c-f7b6-4fbd-a457-8cf14048ddca@redhat.com>
Date: Mon, 23 Oct 2023 08:02:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/13] migration: Use vmstate_register_any() for isa-ide
To: quintela@redhat.com, John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Eric Farman <farman@linux.ibm.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, David Gibson <david@gibson.dropbear.id.au>,
 Corey Minyard <cminyard@mvista.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Xu <peterx@redhat.com>, Corey Minyard <minyard@acm.org>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>, Leonardo Bras <leobras@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Jason Wang <jasowang@redhat.com>,
 qemu-block@nongnu.org, qemu-s390x@nongnu.org, =?UTF-8?Q?C=C3=A9dric_Le_Goat?=
 =?UTF-8?Q?er?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Stefan Weil
 <sw@weilnetz.de>, Stefan Berger <stefanb@linux.ibm.com>
References: <20231020090731.28701-1-quintela@redhat.com>
 <20231020090731.28701-4-quintela@redhat.com>
 <efef6d37-925c-415e-9a59-85e528eacb7b@redhat.com>
 <871qdpytau.fsf@secure.mitica>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <871qdpytau.fsf@secure.mitica>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: IY7mkHStXcQU

On 20/10/2023 21.42, Juan Quintela wrote:
> Thomas Huth <thuth@redhat.com> wrote:
>> On 20/10/2023 11.07, Juan Quintela wrote:
>>> Otherwise qom-test fails.
>>> ok 4 /i386/qom/x-remote
>>> qemu-system-i386: savevm_state_handler_insert: Detected duplicate SaveStateEntry: id=isa-ide, instance_id=0x0
>>> Broken pipe
>>> ../../../../../mnt/code/qemu/full/tests/qtest/libqtest.c:195: kill_qemu() tried to terminate QEMU process but encountered exit status 1 (expected 0)
>>> Aborted (core dumped)
>>> $
>>> Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
>>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>>> ---
>>>    hw/ide/isa.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>> diff --git a/hw/ide/isa.c b/hw/ide/isa.c
>>> index 95053e026f..ea60c08116 100644
>>> --- a/hw/ide/isa.c
>>> +++ b/hw/ide/isa.c
>>> @@ -73,7 +73,7 @@ static void isa_ide_realizefn(DeviceState *dev, Error **errp)
>>>        ide_bus_init(&s->bus, sizeof(s->bus), dev, 0, 2);
>>>        ide_init_ioport(&s->bus, isadev, s->iobase, s->iobase2);
>>>        ide_bus_init_output_irq(&s->bus, isa_get_irq(isadev, s->irqnum));
>>> -    vmstate_register(VMSTATE_IF(dev), 0, &vmstate_ide_isa, s);
>>> +    vmstate_register_any(VMSTATE_IF(dev), &vmstate_ide_isa, s);
>>>        ide_bus_register_restart_cb(&s->bus);
>>>    }
>>
>> Would it make sense to use another unique ID of the device instead? E.g.:
>>
>> diff a/hw/ide/isa.c b/hw/ide/isa.c
>> --- a/hw/ide/isa.c
>> +++ b/hw/ide/isa.c
>> @@ -73,7 +73,9 @@ static void isa_ide_realizefn(DeviceState *dev, Error **errp)
>>       ide_bus_init(&s->bus, sizeof(s->bus), dev, 0, 2);
>>       ide_init_ioport(&s->bus, isadev, s->iobase, s->iobase2);
>>       ide_bus_init_output_irq(&s->bus, isa_get_irq(isadev, s->irqnum));
>> -    vmstate_register(VMSTATE_IF(dev), 0, &vmstate_ide_isa, s);
>> +    vmstate_register(VMSTATE_IF(dev),
>> +                     object_property_get_int(OBJECT(dev), "irq", &error_abort),
>> +                     &vmstate_ide_isa, s);
>>       ide_bus_register_restart_cb(&s->bus);
>>   }
>>     Thomas
> 
> Ide is not my part of expertise.
> But anything that is different for each instantance is going to be good
> for me.

It's not really my turf either ... ok, so unless the IDE maintainer speaks 
up, I think it's maybe best if you continue with your "_any" patch.

  Thomas

