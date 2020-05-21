Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1655496lfb;
        Thu, 21 May 2020 08:09:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzqI9rjuOQ5fSzt31gRKrKvfCsfXyl7e8QHhPQ/nVIda/uye9YcaFk6ZvWHkymlGBve8p0y
X-Received: by 2002:a17:906:f9d7:: with SMTP id lj23mr4323674ejb.218.1590073794764;
        Thu, 21 May 2020 08:09:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590073794; cv=none;
        d=google.com; s=arc-20160816;
        b=QtLMW9mtf/A9GAcZGaSfzDSB1hOtZ2XmJnC5vvQC1neY5cJXgf99WLPCnEpFcWqTIt
         fr7d6yFLyC5zAc3Yuhqj2IB+tTmI8u1bW3ubOE53K3S571d0UKwdboWHVaVaxMWf41Ez
         uVeSrPhTGVwZrTSEdnUN5NH2QtkOtuZWVl0wPgtEAcK9WEAow2vphAvSmMi8JrtqQvNe
         gOVp9NS5c0euqLf5f574qOYqyUogE75Xd3jyNWKlneqgXmGVt7mGuc3WN2y2aAwBv1EL
         Mr5c3fzL4Jp8kXD1iTENqwhKSmHnAE1BPpEpKCr+kCIvaS9jL6DwTyRaXkozpyTa/7lR
         rnDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=4C2rlTA9x8STJ/ou3J/Z32EJLvR3kTYr7pxFIXxvcMY=;
        b=Y4qMqtVSASyxnhN78dI7r7OQGGpwr1370ky3BmYDIpn+pKC4JoSPbkvMAWmCRCRm0b
         sT4EB7lfChKOEHqV50di7wEj1L6kx0CtUpfjNuhvWEbAwKek/1asHzimvxcyPIqi4GPS
         qyFKKePC6Ji4rqCFbG/Te6ln3bysqEQ+U2nazOiR4vEOrEfDeXx9p3YSMtU/ZPZKZ5ev
         zftQ7FBTBgQhsBCFaOJ0nJwdE2AllZ+rVcqCLMz4cMujdSkJWXx0ynPNa7DvcsMhiPk3
         d/0BrJ794o3dQvnU2LZx2b+Avp68wMUbZhlr8/q3v4f97fPH/4eiI74KcChInIjYxsWf
         oUbA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=f5PfsRJS;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com. [207.211.31.81])
        by mx.google.com with ESMTPS id dr12si4395385ejc.352.2020.05.21.08.09.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 21 May 2020 08:09:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 207.211.31.81 as permitted sender) client-ip=207.211.31.81;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=f5PfsRJS;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590073793;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4C2rlTA9x8STJ/ou3J/Z32EJLvR3kTYr7pxFIXxvcMY=;
	b=f5PfsRJSfbw+/gC2kGZaijMkHiuMinpf+dwtnYuD/11SlRmjRxwOTkSPMfRebJR1vdnilI
	HhRxmG7yvzkOchkR5ZWFIgRrq54m6B8M78pejx5pWDpbWIkCFR2hzQfr4vvJRFanOKT1eJ
	FKX/oiImLKyUJy2lRrXi5voCMomesus=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-471-4WG4ln5ZM0ql49YgoPFqvw-1; Thu, 21 May 2020 11:09:49 -0400
X-MC-Unique: 4WG4ln5ZM0ql49YgoPFqvw-1
Received: by mail-wm1-f69.google.com with SMTP id j132so1252145wma.8
        for <alex.bennee@linaro.org>; Thu, 21 May 2020 08:09:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4C2rlTA9x8STJ/ou3J/Z32EJLvR3kTYr7pxFIXxvcMY=;
        b=hjyAtrq1mu86VuPLmGahmkFfrHnszLRBA0Slo+vmmTGyYY003ZVWwUtXDqpzL+696C
         6z0Iy1aj0W78PmIg6jbvwLBm7ui3x6ZVkXQJbippi4Ki/CzpPwqfLaC/16v5XN3bf9yt
         yhQwRdiaYpKAe1Awcz6JtZvRfYh0X6f8LLyRJgsHJH53gPQSiAUzlwweFmvoQsoy2j2t
         ODB8eybB/idOxeW6aDYX13a+1S+B/Ne+0be8q6NvbxGuMYqn5J/xASscek3MizurjV4Y
         Iri4jgILXhXGs/K6m2jZQtNEuw/Cx1UsGQ+g5nidvlWt2K0aLHWN/REUAmmTvV0tUIFP
         HBHg==
X-Gm-Message-State: AOAM533kMcFdAbC3TRrCe0b62tCsjsTSrQ+5NjIPWSQqcgN6dkm9Pq1P
	Eg3U7a0NTmdy6hDArux4XF/Koo34MhNSnV32v1rYVkcwpoQDZs8uD+LTReovDL2RK0gGXlGdNkV
	JnoyeS2/SlQbvF4/o
X-Received: by 2002:adf:b354:: with SMTP id k20mr879801wrd.412.1590073788229;
        Thu, 21 May 2020 08:09:48 -0700 (PDT)
X-Received: by 2002:adf:b354:: with SMTP id k20mr879775wrd.412.1590073787981;
        Thu, 21 May 2020 08:09:47 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.40] (17.red-88-21-202.staticip.rima-tde.net. [88.21.202.17])
        by smtp.gmail.com with ESMTPSA id b65sm7154112wmc.30.2020.05.21.08.09.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2020 08:09:47 -0700 (PDT)
Subject: Re: [PATCH v2 02/10] MAINTAINERS: Add an 'overall' entry for
 accelerators
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Max Filippov <jcmvbkbc@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Richard Henderson <rth@twiddle.net>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Chris Wulff <crwulff@gmail.com>, qemu-riscv@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Peter Maydell
 <peter.maydell@linaro.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Marek Vasut <marex@denx.de>, Michael Walle <michael@walle.cc>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20200515170804.5707-1-philmd@redhat.com>
 <20200515170804.5707-3-philmd@redhat.com>
 <528c5bbd-7bf4-4dc8-c69e-5d5b6fa30493@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <8853e7ba-aceb-fbe0-2eb4-b9e18111d81d@redhat.com>
Date: Thu, 21 May 2020 17:09:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <528c5bbd-7bf4-4dc8-c69e-5d5b6fa30493@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 17b3z4R4BOis

On 5/17/20 7:26 PM, Thomas Huth wrote:
> On 15/05/2020 19.07, Philippe Mathieu-Daudé wrote:
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>> Cc: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>>   MAINTAINERS | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index fd88a3de49..659092eb43 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -415,6 +415,15 @@ S: Supported
>>   F: target/i386/kvm.c
>>   F: scripts/kvm/vmxcap
>>   
>> +Guest CPU Cores (other accelerators)
> 
> Maybe s/other accelerators/accelerators generic code/ ?

But then we have HVF and WHPX listed there...

> 
>> +------------------------------------
>> +Overall
>> +M: Richard Henderson <rth@twiddle.net>
>> +R: Paolo Bonzini <pbonzini@redhat.com>
>> +S: Maintained
>> +F: include/sysemu/accel.h
>> +F: accel/stubs/Makefile.objs
> 
> What about accel/accel.c and accel/Makefile.objs ? Should they also be
> in the list here?

OK.

> 
>   Thomas
> 
