Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp2586966wrg;
        Mon, 17 Jun 2019 07:45:39 -0700 (PDT)
X-Received: by 2002:a1c:6585:: with SMTP id z127mr20801913wmb.25.1560782739060;
        Mon, 17 Jun 2019 07:45:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560782739; cv=none;
        d=google.com; s=arc-20160816;
        b=uKltX+3EeIozfMRHKVcOU3N5nEBmgLxQFL/0mI38PP85/8xoWJxMBtcGVQJGRziRtA
         XUoVSZvfUYW7AcUSOpcYEef/TYcp/S3XD9/Cfa+0DK4FRCAG45kdT5JwQsmvGTNiDoGP
         s5fRjDiZ8fmYFO6o09sislngSEj5AaqMZ/Kl8rZW4l9yVXGz/G0pf8FIF9KWapY0AwST
         aS5n5fWm54mtrSkGkvvBvHFTaWdyXf73IPLBoAwB25O2knRlHKOWtEX2rhD1owc8dCQx
         KaVuVWJ0oIFLRFRscpz4uAvvm/p5phsMLFZ7AWaovI/uB4oSpoWW5zdijK6tH4WYxE6v
         SoTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject;
        bh=h1yf6Vt1CyQuz/mXleAz0fDL+KIk9GhCVzaElcULaF4=;
        b=tEAY+w9p8iP2xFjyUDmW60Ek8/6F8jyQiqbuNR1+OnVdWt1JwC4RGM+RcJ5IN65M5K
         5NFEUkbpQNR1slVrsFU+lPrCao2Uv2M8MRiVvNQyuKTW147vTOuJkhBoeg0Rzdw/fcSA
         LD4ssJUnFrKE0co0hCwFtsR2ZvaqqMBtMJ9RZBqwAb4XaJxHkDms5+8ipwnQPGGdzpj4
         +dUOkwGHbSmmeQIKfa0r386a5TQKdLOcdRW6djNB8eBM5XipuyRN0JesEsg51a27Mue0
         0vKeYKHy/fJvH525BkCbfWY+cDPf/Iq6g8v1BXy3OZNbEzQFHG+/wsNg7Q9iI3XzrRP6
         6BoA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id y9sor8373567wrt.35.2019.06.17.07.45.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 17 Jun 2019 07:45:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=h1yf6Vt1CyQuz/mXleAz0fDL+KIk9GhCVzaElcULaF4=;
        b=lAUvs/O0Y5Y3z4keGTtcltk04qMUTPcal+ssid0isQCKatH/V6nB2v9du4oxTt4pgz
         eTi/zlEX2aLgtBO6/NofXGBopUXYobFHmMGcu5lgrdpIWG38YruSu6RvB4ZgXrrblL8R
         PfLG4R08J5isCQoHGLp8uR6gx7uLRE0Hvgp3RmA4Z23EjmQ2Nbt4kINpiTxoiM1OgSKN
         qnbT50TZN2xZ4UZ8uAOFyRSfoKvR+ld20U6qdxhXjvrBRebDb1WKxJ6kZUj8w1mCxycp
         97HzR6Eiu/j6o8Y02/m6MNIGdzN1+RFv08oAySv27qa8F4lyDOCMHeH0FTgxoVMzqBF1
         Md9A==
X-Gm-Message-State: APjAAAUuRf335TBlfRoU3zp5pXbwNzrPubTOZwNW2Fa3DiE13miLK2EX
	9GWPgZtS2uy1Dj1DuqcgsLN3RA==
X-Google-Smtp-Source: APXvYqxSEMbpE5GZa+k4KKbZU0/h2LYrjpSFBQwii3aVZgi9pvlBNOr9Y1axBIdn0ljpMIS0KsalUg==
X-Received: by 2002:adf:de8b:: with SMTP id w11mr53694424wrl.134.1560782738885;
        Mon, 17 Jun 2019 07:45:38 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.38] (183.red-88-21-202.staticip.rima-tde.net. [88.21.202.183])
        by smtp.gmail.com with ESMTPSA id a7sm10253325wrs.94.2019.06.17.07.45.38
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jun 2019 07:45:38 -0700 (PDT)
Subject: Re: [Qemu-arm] [PATCH v2 18/23] target/arm: Move CPU state dumping
 routines to helper.c
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Samuel Ortiz <sameo@linux.intel.com>,
 Robert Bradford <robert.bradford@intel.com>
References: <20190615154352.26824-1-philmd@redhat.com>
 <20190615154352.26824-19-philmd@redhat.com>
 <87h88o9svq.fsf@zen.linaroharston>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <78478ee8-6707-a94d-5752-bc095378f502@redhat.com>
Date: Mon, 17 Jun 2019 16:45:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <87h88o9svq.fsf@zen.linaroharston>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: mtQKveQr6W+Y

On 6/17/19 4:41 PM, Alex Bennée wrote:
> 
> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
> 
>> From: Samuel Ortiz <sameo@linux.intel.com>
>>
>> They're not TCG specific and should be living the generic helper file
>> instead.
>>
>> Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
>> Reviewed-by: Robert Bradford <robert.bradford@intel.com>
>> [PMD: Rebased]
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  target/arm/helper.c        | 214
>> +++++++++++++++++++++++++++++++++++++
> 
> Hmm so helper is a mix of non-TCG and TCG bits whereas helper-a64.c is
> basically just TCG helpers. It makes me wonder if we are breaking a
> convention here as helper.c is traditionally only TCG helpers.
> 
> It feels like there should be different file that is unambiguously used
> for both TCG and KVM based workloads where things like the cpu dump code
> can live.

Good idea. What about target/arm/arch_dump.c?

>>  target/arm/internals.h     |   8 ++
>>  target/arm/translate-a64.c | 127 ----------------------
>>  target/arm/translate.c     |  87 ---------------
>>  target/arm/translate.h     |   5 -
>>  5 files changed, 222 insertions(+), 219 deletions(-)
