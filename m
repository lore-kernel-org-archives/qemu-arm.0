Received: by 2002:a17:90a:ad88:0:0:0:0 with SMTP id s8csp880896pjq;
        Fri, 31 May 2019 09:40:33 -0700 (PDT)
X-Received: by 2002:a1c:7711:: with SMTP id t17mr1061937wmi.111.1559320833309;
        Fri, 31 May 2019 09:40:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559320833; cv=none;
        d=google.com; s=arc-20160816;
        b=z8+h41U0IOsOA9bXnOSp3Qa9EELU/aAewb3G5LsOQGKIPHSkP/hrnhcZvrQSNanxjD
         IXYhWHH57POxSbAgyPTote37qNc/IkIfj8T1+32Xd60uxIjrS7j/QI4X79V5VjKX5qhF
         7PrHy63p2xiPuoq0gLqNkiEHrbMJYfF2APbCr7vbkgBsdA84tDJqC0u9afKyJbBnTOdJ
         qTsN7xRIt8Q2Ov6I4dEW/ADI+A9ZHmDfKmoYgKfoCXk91BYgfvjCOT5T7Xtt35AlJStD
         bI2CyP0sRgE+xILcUdaQddsUL8Uu9c9j3LefQAUdZjI+v+XMkbPQNYJTZxBXfKXApxyw
         kLEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject;
        bh=arjCHb58x12BUOgTbM8YeO65qdXrGPkTtcxs9sdPUP8=;
        b=WMnM3pdPJ2LQDOxQrZZa+S2l2OzVPHvge+DMC/gMvsDlpJQRiH3mGkOJsyXwKiPL0U
         IhX7al2W6F2yqtzz76BdK17qlUw2b9nA9Zc0+vzFGzojWjQgxOCk8VthgnknEPSUN4Me
         I22MZn1WWi6inwTTd1K6SvN+gnp112TdvLUE9FfOG8Iv+OGHU0bIbkw37Enp0/1h8W2Z
         WW2D9TtbOVDTwDPaFeSMONh4eRGmLfXQpZCyVvWh8qG6sszoKgMXB+ELE4rj4fBIUDXE
         Lgu0ZrqNClP5Yd1GsBFQjLGWKQfCzgVq0Ej7vXNcj1h3tURJFi2M+2FLDhoVcS4TKAtg
         2H4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id v17sor3812324wrn.11.2019.05.31.09.40.33
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 31 May 2019 09:40:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=arjCHb58x12BUOgTbM8YeO65qdXrGPkTtcxs9sdPUP8=;
        b=JBUGe7b0oGQ/5H3w22KQoWZGK1TWmFaXfiUZu4SYQaJUtllKrJgNP/W7MfNERAmp5Q
         5LBgRAeif1kQTqGHmmIo2ifNNeS32KoT2RPqMezVAGdN+xzRK790kyuafwank9dl8JWT
         u4jVAfn9q69mqIRX2zToujDzjOcV+4VzgroJAGkswqQOEkj/+kN29Y5E+uje8Pza5hDj
         jjY1hN2n8gb4ELuh/t+1zkXFmZlKfrDGkX/5d3yotsLZCUJ08ZjlPZMqq2/KPk40jvb8
         CZXP/QaZibEy/0qEbswOqMR3jCerEdK1FQ48z/Wcp3P/PPQVYNF4+m3mIbFBdfKE4Da3
         BDNA==
X-Gm-Message-State: APjAAAWAhBjDvyRAUYy/CytdJ9HGfo3Mg2kwkds60aRZvb6l6yGFXVRQ
	HhzQGVTQ+WBK8g0l+ttBybac6g==
X-Google-Smtp-Source: APXvYqwi1HcbCpieRvy0CirRtDBOMrahE6N+jE6vyLbnWCHdM9n9yBoOSZEoUNXb5Y6Bw+7yl0gIFA==
X-Received: by 2002:adf:e841:: with SMTP id d1mr7340562wrn.204.1559320832943;
        Fri, 31 May 2019 09:40:32 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.43] (183.red-88-21-202.staticip.rima-tde.net. [88.21.202.183])
        by smtp.gmail.com with ESMTPSA id u9sm13705282wme.48.2019.05.31.09.40.31
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Fri, 31 May 2019 09:40:32 -0700 (PDT)
Subject: Re: [RFC PATCH 0/2] target: Build with CONFIG_SEMIHOSTING disabled
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Miroslav Rezanina
 <mrezanin@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Aleksandar Rikalo <arikalo@wavecomp.com>, qemu-arm <qemu-arm@nongnu.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Aurelien Jarno <aurelien@aurel32.net>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>,
 Rob Bradford <robert.bradford@intel.com>
References: <20190531154735.20809-1-philmd@redhat.com>
 <CAFEAcA9TJGq-8fMv2amQEEGz9QKCNWYwJxCXrjqSh=Yc87yTww@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <947e851b-4b95-3126-2eaf-d5d16f8b831b@redhat.com>
Date: Fri, 31 May 2019 18:40:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9TJGq-8fMv2amQEEGz9QKCNWYwJxCXrjqSh=Yc87yTww@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: jY66XuFT2ZI2

On 5/31/19 6:21 PM, Peter Maydell wrote:
> On Fri, 31 May 2019 at 16:47, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>
>> Amusingly Miroslav and myself hit this issue at the same time.
>>
>> Currently there is no way to pass a CONFIG_X to sources in target/,
>> except via a Makefile rule (and filling with stubs).
>>
>> Paolo says this is on purpose, CONFIG_X selectors are meant for
>> devices and we try to avoid having config-devices.mak in
>> config-target.h.
> 
> ...but some things in target/ are devices (like the Arm CPUs,
> which inherit from TYPE_DEVICE).
> 
> Is there a way we can have a Kconfig fragment that expresses
> "if you asked for an Arm CPU then this should 'select SEMIHOSTING'" ?

Yes, but inversely, we can also deselect a feature, and all features
that requires it get deselected. My guess is Miroslav is building a
KVM-only QEMU, but upstream does not allow to build ARM without TCG.

I'll see what happened to Samuel series "Support disabling TCG on ARM"
and see if it can be salvaged:
https://lists.gnu.org/archive/html/qemu-devel/2018-11/msg02451.html

I suppose in this thread:
https://lists.gnu.org/archive/html/qemu-devel/2018-11/msg05641.html
you refer to this series (not yet merged):
https://lists.gnu.org/archive/html/qemu-devel/2019-05/msg03137.html

I'll try to figure what "KVM injection of interrupts" is.
