Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1885278lfb;
        Thu, 21 May 2020 12:55:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyK7xPAjpO87sTrTjcVapiURC1uzo+R/5KkwOWWk1df+ol7E5SeypmhSXUlA6pb/Vo8K5Oe
X-Received: by 2002:a25:bb08:: with SMTP id z8mr18428069ybg.129.1590090938990;
        Thu, 21 May 2020 12:55:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590090938; cv=none;
        d=google.com; s=arc-20160816;
        b=EMG/XD6J3McLIAoXufVEhGy5XzenaxWADFl3wBM7Yt3aa2TsbM4vIWlv/PX12vTOzg
         FwK1k+OHAGkKAcNCr491XzL+B70E34uhvsJXrndKh/txkijSZtjx5JTk+p1KsSKMJ98H
         WrT4QdWqHQ2sofsD0mapW2szF2NkEy1ywmwpkK4WRnaQSsN3B9lKSikkzfsfdgupA0Eh
         VdgnHbYRC1kpYaCyKEIykkHMaBR/bRdvoAOniulPG+Bovi/YkzHFI05T26SPUWkEtA7i
         OQpOH3Ixy8Loxph/GfwaQc9PzSUrRnzw2m+/LQtrteqRQAJLGW1eYZGkdymengpeWL8v
         h6Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=Wc4Xp9iP+y8ib2misl6Q6rQMS1Tn4Or4Kjqx/XnGrz4=;
        b=0vxh47G82dEf7H4pc3AafrzkirF6bvjr+UnAMT6iC2SMgl9qq12ZFZy1ET9ICANi1P
         3qO5U6wQSP9DonvK5Fye0XJMqhcdydWYOaqs+7mwVRbm2jZ9OV9++MHoJJ8ntPI2nvxz
         uBPl9p6f0KzWGGSMQ2FcMWIqhXyE+xcIC2jwAx8y+7eg9aqijOOe8GweyUzVAxa1ZF7F
         0ZAd8++WIYWHVML2FI0yjdC8KlfQxJ+CNQB+i3/BUV6H+XYQIWKxH3BahyfdvYW6VhVP
         +gAgRcGGKfQbofxCoLMBB2HsqMCclX8Qbwd5MGAfTZN1pvXPiza2maYZgkm45P67cU2A
         TcVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=clHdwUue;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id g5si5846953ybg.300.2020.05.21.12.55.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 21 May 2020 12:55:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 205.139.110.120 as permitted sender) client-ip=205.139.110.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=clHdwUue;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590090938;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wc4Xp9iP+y8ib2misl6Q6rQMS1Tn4Or4Kjqx/XnGrz4=;
	b=clHdwUuetl4RqJt0aBdFeuFIyackAB45klWWsTSkU0jCHdHMf1jJkKegx/ekunOx56Duyz
	S6LU1+kNQQqVk4vigRWCPUsNi0mnBsdMydexdn6pYE4C+4d5tuWKnKwlc64vB7QovqkhFz
	csfnaa2Uwmn3bvo23qTG364KX1rpDi8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-HARXqCgxN6a4HdeUMNjECw-1; Thu, 21 May 2020 15:55:36 -0400
X-MC-Unique: HARXqCgxN6a4HdeUMNjECw-1
Received: by mail-wm1-f69.google.com with SMTP id t62so3072372wmt.7
        for <alex.bennee@linaro.org>; Thu, 21 May 2020 12:55:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Wc4Xp9iP+y8ib2misl6Q6rQMS1Tn4Or4Kjqx/XnGrz4=;
        b=rBHPytoXZ9+OU61jGkkq/6px7SFSyx7jcZpIW3voW2Hktp9KIBfijlWO2qB0AVSVSY
         NJ2NTqx1b5aq6wkYlCP0z3PIqOsBP7//o14GOVxUiYVKhHbJvs19JsWFgqmKw62OczCL
         0yKy/ZenmTfH+4hryl3p3xB+GTcfHkxfIaZkDgETlfp3b2p2Vu6/Gm7s9PhOyLofTCT1
         DwT5fiOSeHy0sor5sleZcSe4EPP4tET+1/bRqUrva4dHQLXaj7s+xTSB9qEkHhc+RVVL
         D/7ZbJj0ZuVz2YW1DmgFWj4c4pCIL5qyWn0xoMgsuKIGaAQp25r9ykD4Ryq/RFpElu/q
         NPHw==
X-Gm-Message-State: AOAM533vcO/Z5ctn3Yjakj6RrSap3lsHBw9m8VezM3kEbF+qkk1mildW
	Ndf4xJEu+bofL+pEEzBpmAw7I7ofCe5qbkLZjyiY8DQSujQN4OAtUfWAb8E2UhO4ZhTJArwoovr
	bVSc/Cy0L4oeI1qO3
X-Received: by 2002:a1c:bb0a:: with SMTP id l10mr10217243wmf.186.1590090935418;
        Thu, 21 May 2020 12:55:35 -0700 (PDT)
X-Received: by 2002:a1c:bb0a:: with SMTP id l10mr10217230wmf.186.1590090935136;
        Thu, 21 May 2020 12:55:35 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.40] (17.red-88-21-202.staticip.rima-tde.net. [88.21.202.17])
        by smtp.gmail.com with ESMTPSA id l19sm7846585wmj.14.2020.05.21.12.55.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2020 12:55:34 -0700 (PDT)
Subject: Re: [PATCH v2 10/10] hw/semihosting: Make the feature depend of TCG,
 and allow to disable it
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: Marek Vasut <marex@denx.de>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-riscv@nongnu.org,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, qemu-arm@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Michael Walle <michael@walle.cc>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
References: <20200515170804.5707-1-philmd@redhat.com>
 <20200515170804.5707-11-philmd@redhat.com>
 <a67da86e-8486-9fea-ae1c-db65bf5c4acc@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <2810165c-62f9-1cc0-d610-115525d6a06a@redhat.com>
Date: Thu, 21 May 2020 21:55:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <a67da86e-8486-9fea-ae1c-db65bf5c4acc@linaro.org>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: TS49yQ0YPipp

On 5/19/20 11:44 PM, Richard Henderson wrote:
> On 5/15/20 10:08 AM, Philippe Mathieu-Daudé wrote:
>> +++ b/hw/semihosting/Kconfig
>> @@ -1,3 +1,5 @@
>>   
>> +# default is 'n'
>>   config SEMIHOSTING
>> -       bool
>> +    bool
>> +    depends on TCG
>> diff --git a/target/arm/Kconfig b/target/arm/Kconfig
>> new file mode 100644
>> index 0000000000..3224cac4ad
>> --- /dev/null
>> +++ b/target/arm/Kconfig
>> @@ -0,0 +1,2 @@
>> +config SEMIHOSTING
>> +    default y if TCG
> 
> Do you really have to duplicate the TCG condition?

How so? The semihosting default table is:

       TCG KVM XEN
       y n y n y n
TCG y - - y y y y
     n   - n n n n
KVM y     - - n n
     n         n n
XEN y         - -
     n           -

So checking for TCG is the simpler way.

Maybe I'm not understanding well your question.

The logic is if TCG is selected, SEMIHOSTING is too.
