Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp220157lfg;
        Wed, 5 May 2021 04:49:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxj9grYoB2dIbj/eaW4RmQtPOImNgFsoJc/UPVlOi3YZgH0IIy2InaM+Lg85eJmt/65pECF
X-Received: by 2002:a17:906:32ce:: with SMTP id k14mr27904948ejk.27.1620215391063;
        Wed, 05 May 2021 04:49:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620215391; cv=none;
        d=google.com; s=arc-20160816;
        b=fwSF6H4/ynyXw3vTDiv3v5vPKIbOHdj2BG4z7IgkLnuObgICJqrudSLp9Zjrof12v1
         jRInhrJlku1F+g/Smod75iEg7O+9pmD3V56obWh1gcvANShHAlb+ap1tVvqTKc/LVu8r
         JfmRvecGCJVh4aW9I0mP5+K+rHu/2hAN0LSOQ0CSTb0E8MRnfUSFuTQ+1dSrv6reS8zH
         zqSEQyKWk4ZZYg2TuP6DrdDx4HDs/gEMBlwKez86e8HYbj4hC3EfOCGVaeMgeaDG1g2L
         u1EDz4SP87MImZAl3EouKxEtmRyANWjxYctJR6t5riYDcsZcRBxVn9hkeH2pHwIgU31q
         h7bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=/Foc+EOorem03bggqAaC3TwgLAf5/22fodFDCT7rTgo=;
        b=n2UG5v2j735gJJexBwpuCe5eVcbkYrAoE+nBaHR/JIGl9d7dCXWDmfR2QfMQ/nGZwc
         ciZHTF+om3tFYiQ7/GmU8zEehjnIcYqYsvwGnx8cBeujg6J13i+PrHT0wqJ624QLCOIe
         K4KT2Uy9kybvfc91JZlqmzeaPLXgS9Wj00+jBlOKjQwzvrzYMZrW+q6jWBkQb9Vc5rYU
         yjcS4YFG8iq2C8iFmjz5b9YmivHBtZVJVlwjreVgN5g2AoWxc286LBmYOaEGRrbOHGCw
         bE2JeqAMx7byMY3AMs+PwAbE2PgkPT1Mdyqfwc/yjk2BQpVIRpOiXrX7MeAnH/kMPlF/
         4pqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iY1pIAyj;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id ly14si5213813ejb.79.2021.05.05.04.49.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 May 2021 04:49:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iY1pIAyj;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1620215390;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/Foc+EOorem03bggqAaC3TwgLAf5/22fodFDCT7rTgo=;
	b=iY1pIAyjk1vt1ReXeRy1bbBlfyPu08by1KEu3xtE5Fp9K6vOtepQ04ocWFzK9EQ16Okt78
	XK9GE9x98Ef3aUmfp972DMOAyvHAax+BThIs0ZmDCeyn2kUp6oX+vjctWfTQHtaEEEXUyx
	pSlQRMlO1njLbizg7j5cDcL2HXxxPe0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-lMUC9XAaNZieSpttL_pkVQ-1; Wed, 05 May 2021 07:49:48 -0400
X-MC-Unique: lMUC9XAaNZieSpttL_pkVQ-1
Received: by mail-wr1-f72.google.com with SMTP id i102-20020adf90ef0000b029010dfcfc46c0so608813wri.1
        for <alex.bennee@linaro.org>; Wed, 05 May 2021 04:49:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/Foc+EOorem03bggqAaC3TwgLAf5/22fodFDCT7rTgo=;
        b=VXKjjPtUdIubokK7V+0/M360MG372H8GQVbsI1u4TQ5g3PaTpi0srvNFTKT3+gSwFz
         ubiFGgatbNKiz/y+GgiC82nn2ghu0Wpb2k+AvITE+4qpkL4ShF+5vZF9tzmXyMKTpZYY
         oXquZLxFFbDEutx9ko2KmBEaF4Y7K2vfo00oPD3O29PaEeudEZlSiEt8n8ygGuoE5qTy
         PD9gPKtiElO+4myaVsp6+Vac3/+C6IR60GaBlcjhBS7VZ9r5OTFxBXEC7zhJ0t/tp4xS
         keW0ouOzxIA3ZlYSGhcggMnCnmd3mhSghTDqmHr+TCd4YMUERfxdCRqvy/YqN8rrJQl9
         43YQ==
X-Gm-Message-State: AOAM531yjcQnSrHERGVEx7VBj7xUoEIko4b1htbULURsyZANquGNjG8h
	uUngJz21hqr3J+wH2YegYi9UwPzCm8xLLsdxF1bhnAqolDRUwS9MvQkYQifFZEo2G4H5krrYReD
	u8DFHHGk2hdG2r3cy
X-Received: by 2002:adf:c541:: with SMTP id s1mr37556781wrf.370.1620215387439;
        Wed, 05 May 2021 04:49:47 -0700 (PDT)
X-Received: by 2002:adf:c541:: with SMTP id s1mr37556763wrf.370.1620215387228;
        Wed, 05 May 2021 04:49:47 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.19] (astrasbourg-653-1-188-220.w90-13.abo.wanadoo.fr. [90.13.127.220])
        by smtp.gmail.com with ESMTPSA id m16sm9370290wru.68.2021.05.05.04.49.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 May 2021 04:49:46 -0700 (PDT)
Subject: Re: [PATCH v5 02/10] accel: Introduce 'query-accels' QMP command
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Andrew Jones <drjones@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>
References: <20210501223638.510712-1-philmd@redhat.com>
 <20210501223638.510712-3-philmd@redhat.com>
 <87o8dpvet4.fsf@dusky.pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <918d1fc1-260c-57b7-2dd9-61f1125a2aa2@redhat.com>
Date: Wed, 5 May 2021 13:49:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87o8dpvet4.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: basMH8gKguk7

On 5/5/21 9:07 AM, Markus Armbruster wrote:
> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
> 
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
>> - 'query-accels' QMP command returns a list of @AcceleratorInfo
>>
>> For example on a KVM-only build we get:
>>
>>     { "execute": "query-accels" }
>>     {
>>         "return": [
>>             {
>>                 "name": "qtest"
>>             },
>>             {
>>                 "name": "kvm"
>>             }
>>         ]
>>     }
>>
>> Note that we can't make the enum values or union branches conditional
>> because of target-specific poisoning of accelerator definitions.
> 
> Let me try to complete this argument;
> 
>   If we did, enum Accelerator could only be used in target-specific
>   code.  But we want to use it in generic code, too.
> 
> Which generic code exactly?


cpu.c:133:#ifdef CONFIG_TCG
hmp-commands-info.hx:271:#if defined(CONFIG_TCG)
monitor/misc.c:324:#ifdef CONFIG_TCG
softmmu/physmem.c:28:#ifdef CONFIG_TCG

and more importantly:

include/exec/cpu-all.h:430:#ifdef CONFIG_TCG
include/exec/cpu-defs.h:77:#if !defined(CONFIG_USER_ONLY) &&
defined(CONFIG_TCG)
include/exec/exec-all.h:25:#ifdef CONFIG_TCG
include/sysemu/cpu-timers.h:27:#ifdef CONFIG_TCG

Thomas might provide more cases, IIRC he audited this recently.
