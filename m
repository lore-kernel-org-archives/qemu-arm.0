Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp4432392lfa;
        Tue, 8 Jun 2021 06:38:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJylqEfR0ArdfJp+JbSwGbmyjkddVaC97pQas5tQuasYWPA8mVCQR+VDtyDaufauNs84hmPk
X-Received: by 2002:a17:906:a1d2:: with SMTP id bx18mr23273121ejb.423.1623159517405;
        Tue, 08 Jun 2021 06:38:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623159517; cv=none;
        d=google.com; s=arc-20160816;
        b=hBWW+ANFVs8mXvq1wetHa7TWSm0KPZOdilQeTYv1d6CTCKzUT0MCXv+CQuW4pmUBR3
         /7dCHF7TnNOzAz1QA7IUsbRAO8FPe7yFxmt1ce4IdW40K90R5SaHES0AXMBFXJ4e5AXp
         eLz5kkKyWZ0BdSMSW1GKmTRt+opi5uDFHUeoUvGq4PCHrBR1BA6bw9rihEcgMKcsSY0y
         xqeGRtvw5ehregbMagSMtxracAK5d8CA60tfg6/z2EHGZXbxg05kRE2nlpRbZCjtkM59
         exuXPO8yTS3F4Gi/DP/CrxI1LOmgyelJ6heZFqa4VJ+tYs9sVRTniCFsnTr5TOwO5g2j
         89Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=7/2GUJpm4LhwdNupSozzb9z52vzZ90NUqtA9KjkNXx4=;
        b=I4a9YFQpRu1gYcnakMNhzUdKkidzjFertv10bi3DbMPRQHKb5mZ+Bb3+lL2BfdKFx2
         LyMu2CW8HN3K/SUvzH7Ytwz48g7Co2vwQtlQ2RobKHA2ffATleLYxww6E09QbVswp5pV
         ucwCVYwCGyUPNCJsVrUy7sSIuOsWpSrEzugzB2COZZARz0JAwCEW4IIKEBzSd63uURyR
         V6h7REJ62YvuBtJtdr9Kt/T9PJ2y6gMV5x8uppX0x3XNRbQOjzznDgOnSNPaMCAc5nF5
         e55exWDirh3tq6hD6T9ZGQ+AJw1XgOUmNemQ49q+ZNUt9QKFfu5pHl+syPTV+ap5KWwJ
         TTSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZX+I5fwT;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id v1si7066555ejd.643.2021.06.08.06.38.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Jun 2021 06:38:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZX+I5fwT;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1623159516;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7/2GUJpm4LhwdNupSozzb9z52vzZ90NUqtA9KjkNXx4=;
	b=ZX+I5fwT2Zgli9szUmVOz8KqMGSRJYZYV+Y43oj+lqUn3b565cJgd68bhrPGmwzZPIDi/R
	u+S0ovn1FZbkbNv79PqGix8pQw+u2hq+GUljhFieLPzu9xxLybccppjS+xPAdriz7GGemR
	Qbh32S7DOqE5PXdhISlkHo8mZiT6rws=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-tZSbzORxMTeLkk-ZVrhCSQ-1; Tue, 08 Jun 2021 09:38:35 -0400
X-MC-Unique: tZSbzORxMTeLkk-ZVrhCSQ-1
Received: by mail-wm1-f69.google.com with SMTP id 18-20020a05600c0252b029019a0ce35d36so1217266wmj.4
        for <alex.bennee@linaro.org>; Tue, 08 Jun 2021 06:38:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7/2GUJpm4LhwdNupSozzb9z52vzZ90NUqtA9KjkNXx4=;
        b=TiRRH8aBd6lbAGs1LUiyw0/DuWCAp4AUUwHFI4kOlUSkCXbrJ39Pvmghl/N6rhrPE5
         3xkWWyvH1EUe8NNwbPl8R6JrTtttwjz3kXwBOak8Uuj30ODxU6cIZG3Q0YhiVemUZIIo
         iQrL/mpwg7QmttEyexH46k/YFRSCmfYYRLBJBvuvdw1l9gsPN2GBPG0sJ1aUMsBU7qfy
         zmNaKjw70PEXQHiYl4+teVUwDyupxB0TKROdTctp218QEktcdlsKSrwi7wv9wXWlnvO9
         9Bz7GQA2nkAa+mzwYRL5AD5TCN++vKQLwOftoYXMFx+88Qd+Mj5fRwizOSlplmr7Iok0
         mE6A==
X-Gm-Message-State: AOAM533x4KG5jvz4lIHCJ/1fBaZkC62gPI5b9AlrT1fCOpf33N4GkjB3
	a6oPqpC2tZ2qoa4YvZ3bS3Z2G9jl0Y925tCaa+hpbBMRJESaD2IBhXQZ15+RzNCPt2om+hCx4TL
	avmmDl56lKenTyhEk
X-Received: by 2002:a05:6000:1a8f:: with SMTP id f15mr14348483wry.260.1623159514102;
        Tue, 08 Jun 2021 06:38:34 -0700 (PDT)
X-Received: by 2002:a05:6000:1a8f:: with SMTP id f15mr14348461wry.260.1623159513958;
        Tue, 08 Jun 2021 06:38:33 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.235])
        by smtp.gmail.com with ESMTPSA id l10sm16998130wrs.11.2021.06.08.06.38.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jun 2021 06:38:33 -0700 (PDT)
Subject: Re: [PATCH v8 02/12] accel: Introduce 'query-accels' QMP command
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
References: <20210526170432.343588-1-philmd@redhat.com>
 <20210526170432.343588-3-philmd@redhat.com>
 <af5b2b3a-e223-c8dd-91eb-51f9813d82ae@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <9613547f-2e68-1bb9-5be8-c77f8c5c148f@redhat.com>
Date: Tue, 8 Jun 2021 15:38:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <af5b2b3a-e223-c8dd-91eb-51f9813d82ae@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 47d6ulx/Ja9i

On 6/8/21 3:27 PM, Thomas Huth wrote:
> On 26/05/2021 19.04, Philippe Mathieu-Daudé wrote:
>> Introduce the 'query-accels' QMP command which returns a list
>> of built-in accelerator names.
>>
>> - Accelerator is a QAPI enum of all existing accelerators,
>>
>> - AcceleratorInfo is a QAPI structure providing accelerator
>>    specific information. Currently the common structure base
>>    provides the name of the accelerator, while the specific
>>    part is empty, but each accelerator can expand it.
>>
>> - 'query-accels' QMP command returns a list of @AcceleratorInfo
>>
>> For example on a KVM-only build we get:
>>
>>      { "execute": "query-accels" }
>>      {
>>          "return": [
>>              {
>>                  "name": "qtest"
>>              },
>>              {
>>                  "name": "kvm"
>>              }
>>          ]
>>      }
>>
>> Reviewed-by: Eric Blake <eblake@redhat.com>
>> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
>> Tested-by: Alex Bennée <alex.bennee@linaro.org>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>> v8:
>> - Include code snippet from Markus adding to machine-target.json
>>    to be able to use enum values or union branches conditional.
>> - Use accel_find() on enum to be sure the accelerator is enabled
>>    at runtime (chat with jsnow / eblake).
>>
>> Cc: Eric Blake <eblake@redhat.com>
>> Cc: John Snow <jsnow@redhat.com>
>> Cc: Markus Armbruster <armbru@redhat.com>
>> ---
>>   qapi/machine-target.json | 54 ++++++++++++++++++++++++++++++++++++++++
>>   accel/accel-qmp.c        | 32 ++++++++++++++++++++++++
>>   accel/meson.build        |  2 +-
>>   3 files changed, 87 insertions(+), 1 deletion(-)
>>   create mode 100644 accel/accel-qmp.c
>>
>> diff --git a/qapi/machine-target.json b/qapi/machine-target.json
>> index e7811654b72..586a61b5d99 100644
>> --- a/qapi/machine-target.json
>> +++ b/qapi/machine-target.json
>> @@ -329,3 +329,57 @@
>>   ##
>>   { 'command': 'query-cpu-definitions', 'returns': ['CpuDefinitionInfo'],
>>     'if': 'defined(TARGET_PPC) || defined(TARGET_ARM) ||
>> defined(TARGET_I386) || defined(TARGET_S390X) || defined(TARGET_MIPS)' }
>> +
>> +##
>> +# @Accelerator:
>> +#
>> +# An enumeration of accelerator names.
>> +#
>> +# Since: 6.1
>> +##
>> +{ 'enum': 'Accelerator',
>> +  'data': [
>> +      { 'name': 'hax', 'if': 'defined(CONFIG_HAX)' },
>> +      { 'name': 'hvf', 'if': 'defined(CONFIG_HVF)' },
>> +      { 'name': 'kvm', 'if': 'defined(CONFIG_KVM)' },
>> +      { 'name': 'qtest' },
>> +      { 'name': 'tcg', 'if': 'defined(CONFIG_TCG)' },
>> +      { 'name': 'whpx', 'if': 'defined(CONFIG_WHPX)' },
>> +      { 'name': 'xen', 'if': 'defined(CONFIG_XEN_BACKEND)' } ] }
>> +
>> +##
>> +# @AcceleratorInfo:
>> +#
>> +# Accelerator information.
>> +#
>> +# @name: The accelerator name.
>> +#
>> +# Since: 6.1
>> +##
>> +{ 'struct': 'AcceleratorInfo',
>> +  'data': { 'name': 'Accelerator' } }
>> +
>> +##
>> +# @query-accels:
>> +#
>> +# Get a list of AcceleratorInfo for all built-in accelerators.
>> +#
>> +# Returns: a list of @AcceleratorInfo describing each accelerator.
>> +#
>> +# Since: 6.1
>> +#
>> +# Example:
>> +#
>> +# -> { "execute": "query-accels" }
>> +# <- { "return": [
>> +#        {
>> +#            "name": "qtest"
>> +#        },
>> +#        {
>> +#            "name": "kvm"
>> +#        }
>> +#    ] }
>> +#
>> +##
>> +{ 'command': 'query-accels',
>> +  'returns': ['AcceleratorInfo'] }
> 
> What about Markus' comment here:
> 
>  https://lore.kernel.org/qemu-devel/87mtsoieyz.fsf@dusky.pond.sub.org/
> 
> ?
> 
> If I've got him right, you don't need the command at all, the Accelerator
> enum should be sufficient?

Yes, this is the part jsnow said "we are waiting for Markus to comment"
on the other thread ;) We'd like to only have enums, but QAPI doesn't
seem to allow a "leaf without branch", we need a command or struct to
use the enum else it is elided. Or maybe we didn't understood Markus
idea.
