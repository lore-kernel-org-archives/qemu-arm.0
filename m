Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp928080lfb;
        Wed, 28 Apr 2021 12:12:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx1oNVAXeH2MOwUaXGdcMB1SZfz3S+PFTbAechagObnBfmkpCQONEoMOHxqUre0roECbxqo
X-Received: by 2002:a17:906:9b15:: with SMTP id eo21mr31918427ejc.237.1619637171143;
        Wed, 28 Apr 2021 12:12:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619637171; cv=none;
        d=google.com; s=arc-20160816;
        b=mm7OC47ilmMsyr1rD6mNOa8OdpzH6+h22oP/iZ+04oLpgKOEmGltkSWQvFOcjpUP5l
         TGePJL3mN+DSevEOGfZ0uLSfJSm3VcAUX50BYYJ8qRG/zwDD9QmcWv/AXwjVkAcrxw8X
         NfWO6dYNmuHcGuC5jhFQbR9RQCTjjiz07hBatQygNL3z0SHCHKA84v3pLB+lZq/La81v
         gnfSjlkqpxtyvIljPfBa7Q5ukNoQ6vyqJQ83uZKb0v4SCQTfL0e9mKPVTUOBqycQwKUx
         L1rhEPyVr84wE4I6Cq1p8gd7cQHq4l7SK7XzbBjya/PZ2Tf1WDP30RXKTTnk9LXifJbK
         NB8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=m0zACldXEPEyo/1LI189tVspnKoaL+R5f+aeOUHi2fM=;
        b=bXv0hw1/f9/rYR+BWAJd5pAbV4zPMu4o1Ek5IgOMfKy5zohJ2neWLqdiU/nxdbqT86
         lORvzc2RV8w+NCp7F83VLIw3iD/EClGaKvtwRxI4/Ap1CmkcyjeEPM29ls1CO3oZObKd
         MxI9WBB7JzUGBMGm1yzEUadj70aXuOSxQ4tOfo7qMeQRbkq0JdXp2SX3VhqfvaViaezh
         u5Mv/+eI5PhvI+zx3HSPkNkL9IBcTggxIEUpowfSRkXpgRlPe3no51Krp+/P2OZGQZAP
         zf6j96Sz/ccH9rn4xt44KboIWnuW/vPBlPWmoHsiOlMZNI1fVTxn67IJkHRcfX8nnoQP
         nM4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FQoC1yK4;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id y3si908956ejj.273.2021.04.28.12.12.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Apr 2021 12:12:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FQoC1yK4;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1619637170;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m0zACldXEPEyo/1LI189tVspnKoaL+R5f+aeOUHi2fM=;
	b=FQoC1yK44Vq2TQanJMuiU4jzGVQZzoCmAHyfV1gmhy3YkiPvIPc3SFRODY5kJXIVbhNlNE
	0kAQrLnzpsHxIQBRE4oguU/EMOTwEkxqkNpH7UTP0Ro5XNcdDdxeFT+3eoPu5SCCeHDAuc
	K2WtOXQLRexiLtx5iNBWBOVqCfn7pbQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-bkGCtx3cOJC9BhwF1oW05w-1; Wed, 28 Apr 2021 15:12:48 -0400
X-MC-Unique: bkGCtx3cOJC9BhwF1oW05w-1
Received: by mail-wr1-f70.google.com with SMTP id 67-20020adf81490000b029010756d109e6so11200742wrm.13
        for <alex.bennee@linaro.org>; Wed, 28 Apr 2021 12:12:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=m0zACldXEPEyo/1LI189tVspnKoaL+R5f+aeOUHi2fM=;
        b=olI+dikFjPkL9e+EWNERt/nJJ0u7jIRstPwm6ncTzHDFPFyw52X3haxRmtCPc17h4V
         48UEcayGYoHvrXkGzQmsCADfkeiI87LtP8ffplPtUYMTyd9oXDugSb5YR1A7xgciemVr
         aA2R2zDjuo5LavMfV/ncIxxP6TjkYcMXsx0l1w/Jp3DG+Fr9AdzFUDSyQUbeW5r51SaZ
         WQs2V0nrTpYp4gjm/Z1TcEN9jJNAsy2dplRHMT8E09YD8t3fSMtN86Mnu56tUDUJ2k5E
         hbOSL+A3rmjIUVxpAsGgqx9Lm9rXO7h8wszqgjAU75guRvy24ymIXeV10ZPfy/9pm8j5
         ZmMw==
X-Gm-Message-State: AOAM5308Bly8K+DpkOUdPfNZEAfa4BDR5uMyrUen88T2KxGBlBO/ukIh
	BnLFyJRCLFZZ2YwJAp5ma8fu+b2JIdHMrM2aCxY6s2E9rJANIsMpgzML78q/347V3egkZKJSRo6
	FhYh5huMxGTIjk5Uv
X-Received: by 2002:a7b:c444:: with SMTP id l4mr33088123wmi.36.1619637166954;
        Wed, 28 Apr 2021 12:12:46 -0700 (PDT)
X-Received: by 2002:a7b:c444:: with SMTP id l4mr33088112wmi.36.1619637166758;
        Wed, 28 Apr 2021 12:12:46 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net. [81.40.121.39])
        by smtp.gmail.com with ESMTPSA id m184sm742916wme.40.2021.04.28.12.12.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Apr 2021 12:12:46 -0700 (PDT)
Subject: Re: [PATCH v4 12/12] tests/meson: Only build softfloat objects if TCG
 is selected
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Igor Mammedov <imammedo@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Andrew Jones <drjones@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Juan Quintela <quintela@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, "Emilio G . Cota" <cota@braap.org>
References: <20210415163304.4120052-1-philmd@redhat.com>
 <20210415163304.4120052-13-philmd@redhat.com>
 <03eed9c3-0670-f262-a2fa-172639b8ad77@redhat.com> <874kfqs5gl.fsf@linaro.org>
 <763dbed9-35e9-0f85-3b94-01bffc7fcbf8@redhat.com> <871raus00j.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <97b2e23c-bbb2-f2cc-bddd-6047d0cbe0be@redhat.com>
Date: Wed, 28 Apr 2021 21:12:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <871raus00j.fsf@linaro.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: bXCRtkEybsUA

On 4/28/21 9:04 PM, Alex Bennée wrote:
> 
> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
> 
>> On 4/28/21 7:06 PM, Alex Bennée wrote:
>>> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
>>>
>>>> Alex, Richard, do you mind reviewing this one please?
>>>
>>> Isn't it already merged (with my r-b tag no less ;-)
>>>
>>>   f77147cd4de8c726f89b2702f7a9d0c9711d8875
>>
>> See ...
>>
>>>   Author:     Philippe Mathieu-Daudé <philmd@redhat.com>
>>>   AuthorDate: Fri Jan 22 21:44:31 2021 +0100
>>>   Commit:     Paolo Bonzini <pbonzini@redhat.com>
>>>   CommitDate: Mon Feb 8 14:43:55 2021 +0100
>>>
>>>>
>>>> On 4/15/21 6:33 PM, Philippe Mathieu-Daudé wrote:
>>>>> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>>>
>>>>> The previous attempt (commit f77147cd4de) doesn't work as
>>
>> ... ^ this comment :(
> 
> Ahh - my tooling was confused having searched by the subject title ;-)

Oh I see, I'll rename as:
"tests/meson: Only build softfloat objects if TCG is selected (again)".
