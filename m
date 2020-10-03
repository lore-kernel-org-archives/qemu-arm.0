Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp2317438lfq;
        Sat, 3 Oct 2020 02:17:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyQ9ewio/Y9FYKT9YENZsEtsXo1Ywd1fxK50D3vQJCxT1Z9E7fXZpfTjeluy2EvzTwzJKd/
X-Received: by 2002:a5b:302:: with SMTP id j2mr8515840ybp.50.1601716672218;
        Sat, 03 Oct 2020 02:17:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601716672; cv=none;
        d=google.com; s=arc-20160816;
        b=faJv6rSGnn9RZFhUNR2097yp4KhSvVb6BECCRZlULkwo1lGoCIzBFZ4DsLuOIX+BLI
         qYGzL2mvLfW2qYoDFUed2hL8vAkMSWlEDHDB5auCBybTcqXsZbUFqO03JtJRqzxCM5v/
         3bOJBlWwp0B3sUTU9szt3ijg1pM8wZ0/E6GHGKoZdMEyFe2gfGqdhyG3QdQz2cKQBSPv
         qP7TwNhHvMEpJcLXO81TF6aiyt18AWX3ZZ7zUo5Jf07mN1avPcWTI9tnY+DDuBimUfpa
         hAsl7JHmDdbb78gtSF8qCXoJDfAIFxvNOUv4ro/Rv0f4QQiyAuqmINltmU7Ziiy8/BVc
         N9oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=1fzLg32yIxL4nuBAaxGzjjdUPzlfMH4ds5vNoj1mFCc=;
        b=Bgy0PJFpy7Gr363/pmL2E/obqS0XvE0R0LeCtuEJZ4ZrHO/908VAjT+PjH/Qip8rij
         tg8qKm25AZYTlYkuawmVMh4B4BOvGzsEe7Jm3D0wE0wrqXnBSP3N3JzcUJEjWIi7JwUb
         77vSPVhN3cpXtPcWorgUlv8hVF2cuuFy2XAZBFWhJsFjBwP781nY4Jj1ZR/fXGUFF5NN
         4YyB8v2c9o1ua25p9xrq+agakxMWjY6zDaNdrmFQGe8a/iBYT4NmZNJv3q0Cdt3eWou9
         jegCHeRrhBBC0hia/CluJUyKZlYdU691deWlIIiJiEfBmYCHfSAFPgOllGXP5ni91uW1
         Elbg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PF7f3QYO;
       spf=pass (google.com: domain of thuth@redhat.com designates 63.128.21.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [63.128.21.124])
        by mx.google.com with ESMTPS id e81si4707170yba.28.2020.10.03.02.17.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 03 Oct 2020 02:17:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 63.128.21.124 as permitted sender) client-ip=63.128.21.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PF7f3QYO;
       spf=pass (google.com: domain of thuth@redhat.com designates 63.128.21.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1601716671;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1fzLg32yIxL4nuBAaxGzjjdUPzlfMH4ds5vNoj1mFCc=;
	b=PF7f3QYO2zwQNggtWdit2YGXy112+7JBQQvkY8FCa6nJuMgBojorMCpqToN/YqZEr7hgzk
	MJwZwBERVwyROoQ1Dm5V9P5a8AWiIjRowzDUadOWIjkvZabrK23mFRPYE6bnTQ6yIYz7A+
	JPpsh/HbHz2u1xwpU6DhuykyMq09lfE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-448-XzWEcPFZMJi_MD1bMolAxw-1; Sat, 03 Oct 2020 05:17:50 -0400
X-MC-Unique: XzWEcPFZMJi_MD1bMolAxw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB50C1868410;
	Sat,  3 Oct 2020 09:17:48 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-61.ams2.redhat.com [10.36.112.61])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3385510013C4;
	Sat,  3 Oct 2020 09:17:45 +0000 (UTC)
Subject: Re: [PATCH v4 04/12] target/arm: Restrict ARMv4 cpus to TCG accel
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 kvm@vger.kernel.org, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Richard Henderson <rth@twiddle.net>
References: <20200929224355.1224017-1-philmd@redhat.com>
 <20200929224355.1224017-5-philmd@redhat.com>
 <971287b0-fd62-21bb-e80e-8b83c8a5c459@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <4488d878-09ff-5ea6-bc4b-69dda534131e@redhat.com>
Date: Sat, 3 Oct 2020 11:17:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <971287b0-fd62-21bb-e80e-8b83c8a5c459@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-TUID: CuZAPy43ugR5

On 30/09/2020 10.03, Philippe Mathieu-Daudé wrote:
> On 9/30/20 12:43 AM, Philippe Mathieu-Daudé wrote:
>> KVM requires a cpu based on (at least) the ARMv7 architecture.
>>
>> Only enable the following ARMv4 CPUs when TCG is available:
>>
>>    - StrongARM (SA1100/1110)
>>    - OMAP1510 (TI925T)
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>   hw/arm/Kconfig | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
>> index 7d040827af..b546b20654 100644
>> --- a/hw/arm/Kconfig
>> +++ b/hw/arm/Kconfig
>> @@ -1,3 +1,7 @@
>> +config ARM_V4
>> +    bool
>> +    select TCG
> 
> This should be 'depends on TCG' because we can not
> *select* TCG, either we enabled it or not.
> 
> The problem is the machines are already selected in
> default-configs/arm-softmmu.mak, so we can not build
> the current config without TCG.

Is it really a problem? If the users disabled TCG and still have these 
machines in their arm-softmmu.mak, it's a configuration issue on their side, 
so it's ok if they get an error in that case.

  Thomas
