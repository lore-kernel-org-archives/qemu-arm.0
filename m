Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp4816002lfg;
        Tue, 16 Mar 2021 11:25:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxcTrMQ12u7d1vvlZlElmZerTxgbshkVPQu7krq5GmdiLzsGFfUNWefRiSHj/ZeEYCeNQ8N
X-Received: by 2002:a05:6e02:1206:: with SMTP id a6mr4669274ilq.54.1615919126493;
        Tue, 16 Mar 2021 11:25:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1615919126; cv=none;
        d=google.com; s=arc-20160816;
        b=zC+rgUnma4xBlXSdSAn3f6To6ZD/275dINZonrBJwjMgSq4hlPtBtpX8Twysi0SmDw
         JNINyELVH3Uopa7W+DRZv3j/oaWvFAtaoEyt4x1IqrEfFTa5021E6jM9hAjtoJxLqp0q
         pPeXRqhMkwqliGe7QcugKwN7iUXcUQAoGWGmBCcgc19HjqGOZ0Y9k4qH3f5xDgP3rMNA
         kxNe8WTpmxrqgyR13H9zopGfLQApztDkhilHnZogiRLMMk0EDpUix26cD01c9EdfxawE
         UsYp4uBgItc3z3raIeykC+acOnBySt99Dx9Q/V/nUVcG/lxvSTcqx+QukUTV8jjE5B/r
         UjuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=H/aq40AbW+M8XRbGim5Lfa5I8urvhxjNhOkLiGDZN2s=;
        b=GLIBkW6sQCmIBbbaqQDtqLGa4/xDB7D8qj7wvvqRE45OHbHnjJ+O4ezxzDeWLdVytG
         aIyGJlR4Uy5jYcqBdxiiUyhHBKXtBgEfiZoh2/Rdjq15A9gRZ0q+PIORSiZGUGxna+Ya
         pAy8k4fYDTXiGmY4R4F/kHNV5P/MqKepzyNohfvorZFpbDwx64b0hr0DMm5ICd+YtMXy
         YlIAMS+NKWJ0D9/Pibjq6HHPUHabe8lARXb93l/UUucAyPrl29no6Yj0NaoqskMdTnC4
         GxwP/5+yiM/GH8X3/URJUv1tYk0i4dLCrho4brbklcx9N2gOx+16afSNrPLN6gU+kuIJ
         I3mQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=EfwvZV+1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g19si14976986jat.91.2021.03.16.11.25.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Mar 2021 11:25:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=EfwvZV+1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lMENh-000852-ND
	for alex.bennee@linaro.org; Tue, 16 Mar 2021 14:25:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMDzX-00008C-PW
 for qemu-arm@nongnu.org; Tue, 16 Mar 2021 14:00:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36984)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMDzS-0001pa-JO
 for qemu-arm@nongnu.org; Tue, 16 Mar 2021 14:00:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615917620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H/aq40AbW+M8XRbGim5Lfa5I8urvhxjNhOkLiGDZN2s=;
 b=EfwvZV+19oGytf5yO9+qSLsO1ClpzEGqQnX8YDsy9bwg2uBnGlpx9zLMoV7amJa1jXHojZ
 Q0Tsq/QIiacqglV9c7p8WT8v7ZiUuQQCLfiQildj/7tCH98ka6mzs2R9SCGUi+5zzqmwKu
 qctiMbvaQrmnRB3EPMKbLin/ZLqJ4GQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-bHXQpAjmOKqlngvgBPuDoQ-1; Tue, 16 Mar 2021 14:00:19 -0400
X-MC-Unique: bHXQpAjmOKqlngvgBPuDoQ-1
Received: by mail-wm1-f72.google.com with SMTP id i14so9897671wmq.7
 for <qemu-arm@nongnu.org>; Tue, 16 Mar 2021 11:00:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=H/aq40AbW+M8XRbGim5Lfa5I8urvhxjNhOkLiGDZN2s=;
 b=t4rQl6HhcYvVCCVOZrqNww+njyMF0Uy07iI16ixHSQ7XcC1FvTbYwJXxzXhZiD1ThN
 RoaSFzrhR24Rklpp9PdnwM++1C3BF2SIFjeA6p51k/d8p61UgM1TM+CEMo1hWbN51+WU
 0ohmPYXwysfGxDgUQDDOhCizGSEMx+LPxY85P8+yesulCT0jZoEgGhvp1vKfrC4Q+W4f
 sNr0XAC/k6WvQ+0dj76j440FyFVyfceBslIxVPSPQlKmkAQo6UTB02EAxnPe0BjbOY4U
 axg4PC+oG3WCvGmreU77RuY+7dTrxPmGuvJArhJ26QOX38fRM24OSJyvbOLvFqFYsD2J
 LBWA==
X-Gm-Message-State: AOAM531AtxJppf76oaj08je80E80C62dEJ10h+8HCaqzx0GbpPsDhKdO
 pafT9QYSoLdrjLvyPJRsOBjf1hMdd5kgNe3CaXBXYaP6e+B9egGemUEUhouZcFp14KBofNDWzDC
 9Bj9r0bN1RlPE
X-Received: by 2002:a05:6000:118c:: with SMTP id
 g12mr197207wrx.353.1615917617844; 
 Tue, 16 Mar 2021 11:00:17 -0700 (PDT)
X-Received: by 2002:a05:6000:118c:: with SMTP id
 g12mr197167wrx.353.1615917617509; 
 Tue, 16 Mar 2021 11:00:17 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id u4sm24297120wrm.24.2021.03.16.11.00.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 11:00:17 -0700 (PDT)
Subject: Re: [PATCH v2 1/4] accel: Introduce 'query-accels' QMP command
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
References: <20210316172449.3148634-1-philmd@redhat.com>
 <20210316172449.3148634-2-philmd@redhat.com>
 <6f87212e-d00f-751e-1a2c-1dd4950698dc@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <c6bc96c9-80c1-8fbe-4fa8-9fcaf561a7e5@redhat.com>
Date: Tue, 16 Mar 2021 19:00:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <6f87212e-d00f-751e-1a2c-1dd4950698dc@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Andrew Jones <drjones@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GMv7hYbCPxxs

On 3/16/21 6:29 PM, Eric Blake wrote:
> On 3/16/21 12:24 PM, Philippe Mathieu-Daudé wrote:
>> Introduce the 'query-accels' QMP command which returns a list
>> of built-in accelerator names.
>>
>> - Accelerator is a QAPI enum of all existing accelerators,
>>
>> - AcceleratorInfo is a QAPI structure providing accelerator
>>   specific information. Currently the common structure base
>>   provides the name of the accelerator, while the specific
>>   part is empty, but each accelerator can expand it.
>>
> 
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>> Since v1: 'type' -> 'name' in comments
>> ---
>>  qapi/machine.json | 55 +++++++++++++++++++++++++++++++++++++++++++++++
>>  accel/accel-qmp.c | 49 +++++++++++++++++++++++++++++++++++++++++
>>  accel/meson.build |  2 +-
>>  3 files changed, 105 insertions(+), 1 deletion(-)
>>  create mode 100644 accel/accel-qmp.c
>>
>> diff --git a/qapi/machine.json b/qapi/machine.json
>> index 330189efe3d..610252fc25c 100644
>> --- a/qapi/machine.json
>> +++ b/qapi/machine.json
>> @@ -1471,3 +1471,58 @@
>>  ##
>>  { 'event': 'MEM_UNPLUG_ERROR',
>>    'data': { 'device': 'str', 'msg': 'str' } }
>> +
>> +##
>> +# @Accelerator:
>> +#
>> +# An enumeration of accelerator names.
>> +#
>> +# Since: 6.0
>> +##
>> +{ 'enum': 'Accelerator',
>> +  'data': [ { 'name': 'qtest' },
>> +            { 'name': 'tcg' },
>> +            { 'name': 'kvm' },
>> +            { 'name': 'hax' },
>> +            { 'name': 'hvf' },
>> +            { 'name': 'whpx' },
>> +            { 'name': 'xen' } ] }
> 
> Shorter, but semantically equivalent:
> { 'enum': 'Accelerator', 'data': [ 'qtest', 'tcg', ... ] }
> 
> I'd mention in the commit message body that we can't make the enum
> values or union branches conditional because of target-specific
> poisoning.

Good idea.

> With that,
> 
> Reviewed-by: Eric Blake <eblake@redhat.com>
> 
> If we're trying to get it into 6.0, it is a new feature, and so we
> should get it in a pull request before feature freeze today.  Otherwise
> we'll have to s/6.0/6.1/

There is no rush for this, I posted it to scratch it from my today's
TODO list and be able to focus on the next task.

I'll wait for other review and repost with 6.1 (except if someone judge
it is useful to get this for 6.0).

Thanks for your review!

Phil.

