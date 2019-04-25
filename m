Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp2092591wrx;
        Thu, 25 Apr 2019 11:07:08 -0700 (PDT)
X-Received: by 2002:a5d:4b4e:: with SMTP id w14mr22404551wrs.15.1556215628623;
        Thu, 25 Apr 2019 11:07:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556215628; cv=none;
        d=google.com; s=arc-20160816;
        b=DM07z4eD9+WMzogMFLuLvKu0muNEAW5NsTwUCZZNP2TmHuTbSNwDtW3KvcKO6X0cRw
         N8BFpDbG1wNRJl/gk8wOMwy5U7kHlKCDEi5idwU4EJdTZ4TC6jvPMhYTPa6h6bCgwBTl
         6+STfoM5GDh80MnWcvWPQae2vAYe5fCpbREJKYxowQxN9FLcNrRqAI2670YqHrFR5hlS
         U4PdcmIY3PNN/rGhVJk2ujcbw6e7MNlyoxD3FYm2UzeakX9FDhQ5hgCg6bNPmEn+rYIa
         ieOseimAeMI8BBV/na42BUflYWeUnhawOuXwa2QYUzB9HRURRa4mySapPQEPWnNUnUGV
         vrEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject;
        bh=UxMNW3v3XkJRw4c3jaxUPZIB89NNTNyXaxEAjyuDd60=;
        b=weFCpezHrRDqWAr5ylbDrWKa0JX86lI1u18a4V9jeg/B6Ktv4GSJiy0Y/nQ7jOfwjc
         szODj/aQTZZpJIO/huLPokwklBYuRWdc48C5xSvOja8xO68UaJQ2RZG7gh+/fgAQOEfc
         6XtA2T97PaQrEY5AJWrsvBd9TXzPoFET0JrWiQ2v9ES3UkzOes4vrOctje9jrOOIta66
         lRTpdhIdtB3A5tbjDttpScWxlBnYgdIweJUdjk90NeouoBHejjGrXu6MAX57p7LJY7cr
         AhvusGDC49bAkcfQ8PfkC8Cl4J0GZS6BgyjxctRwpWavvlfoeikZ/JVAMemK/mwxtH9p
         LXYg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id k7sor5452431wrx.32.2019.04.25.11.07.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 25 Apr 2019 11:07:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UxMNW3v3XkJRw4c3jaxUPZIB89NNTNyXaxEAjyuDd60=;
        b=CYVOs/16oSCWvOwXJBs/N33vGg5wERoZw9mw6NkdL53mUOniVaqon1LO7uLCkKMlYi
         r86A4+I/7QyiSXWOjzoVed2O4CD+V0B3tekUe1bKSokhywDrfO1eiqAR3tvFAYfW1pmF
         vG7ELT7Ar1olVICweWNCfHqsfbvbU7ufQ2sEb/pNTPAIz21Zw9HQwc5WnfXmsYXRtgsG
         mkl5rPxTpmteNeMz9ybI4r6+wsSDwssk8WY16i2qDEa9wcqBxuTtnjS6TrEFUKE2YUK0
         Zkoaia47wbNmjhcH2A5HVl0AgUc5KZSM9fSqrPLJ1417InjLSLdfVKFXtkCbNW5FmybM
         yg9w==
X-Gm-Message-State: APjAAAUPB7v9MwZznxjbqZS/80u+st/Ot+AE5iyCae+25Kv4o/BtB5kb
	Riv5A5Mo8OLammfdvlpDW/NxHg==
X-Google-Smtp-Source: APXvYqxFbWrwazF8P3W52byqzrxEbZhvyUO79ej+ZkbdKbAhuRV13PFUwRDMJvRqjeU5lovcC74zPw==
X-Received: by 2002:a5d:4942:: with SMTP id r2mr6149415wrs.159.1556215628402;
        Thu, 25 Apr 2019 11:07:08 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.25] (abayonne-654-1-209-122.w109-222.abo.wanadoo.fr. [109.222.216.122])
        by smtp.gmail.com with ESMTPSA id u6sm42307131wrg.72.2019.04.25.11.07.07
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Thu, 25 Apr 2019 11:07:07 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH] Revert "armv7m: Guard against no -kernel
 argument"
To: Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
Cc: Jim Mussared <jim@groklearning.com>, Julia Suvorova <jusual@mail.ru>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Steffen Gortz <qemu.ml@steffen-goertz.de>, qemu-arm <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Thomas Huth <thuth@redhat.com>
References: <20190103144124.18917-1-stefanha@redhat.com>
 <CAFEAcA-B_T9E3ezWFXg-wp3RotMjv3-z3qY7hSJZEoqFBqCWnQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <62b29bc1-cc78-cd64-4377-fc4007ba7189@redhat.com>
Date: Thu, 25 Apr 2019 20:07:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-B_T9E3ezWFXg-wp3RotMjv3-z3qY7hSJZEoqFBqCWnQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: 0JRWrrJOZ8xs

Hi Peter, Stefan,

On 1/4/19 4:16 PM, Peter Maydell wrote:
> On Thu, 3 Jan 2019 at 14:41, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>>
>> This reverts commit 01fd41ab3fb69971c24a69ed49cde96086d81278.
>>
>> The generic loader device (-device loader,file=kernel.bin) can be used
>> to load a kernel instead of the -kernel option.  Some boards have flash
>> memory (pflash) that is set via the -pflash or -drive options.
>>
>> Allow starting QEMU without the -kernel option to accommodate these
>> scenarios.
>>
>> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
>> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

Previous to this commit (v3.1), we have:

$ qemu-system-aarch64 -M netduino2
qemu-system-aarch64: Guest image must be specified (using -kernel)

Now (v4.0) we get:

$ qemu-system-aarch64 -M netduino2
qemu: fatal: Lockup: can't escalate 3 to HardFault (current priority -1)

R00=00000000 R01=00000000 R02=00000000 R03=00000000
R04=00000000 R05=00000000 R06=00000000 R07=00000000
R08=00000000 R09=00000000 R10=00000000 R11=00000000
R12=00000000 R13=ffffffe0 R14=fffffff9 R15=00000000
XPSR=40000003 -Z-- A handler
FPSCR: 00000000
Aborted (core dumped)

This is confusing.

(same happens with emcraft-sf2, microbit, musca-*)

Regards,

Phil.
