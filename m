Received: by 2002:a17:906:5ac8:b0:98d:b2f5:1316 with SMTP id x8csp421825ejs;
        Wed, 16 Aug 2023 08:04:56 -0700 (PDT)
X-Received: by 2002:a17:903:230e:b0:1bc:7001:6e69 with SMTP id d14-20020a170903230e00b001bc70016e69mr2994054plh.23.1692198295884;
        Wed, 16 Aug 2023 08:04:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692198295; cv=none;
        d=google.com; s=arc-20160816;
        b=TIBZdJAcVuqPsmo1EyAywZM775wG+6xf6Pre2DqI/PjqrJjqfepFv9tdRHJtU8wYD2
         awr4HDZmP2WemQLwlGS8dRRpVKt11S9gYMwYZ6wHx/z74yRx7W7D2JvXuVkBH9DIOLIQ
         +3kW+oLFU0UpB35iR09y+TUwyPmZWF476n2raN/sP7IyvxneBBKDp8LCMR3HmxfzKqwq
         1O3C5pmZnqtdJuQh0xdBDtgPg/Oo7zZ5dARG9S/KQG6sCi3Qg9CaxPEFGtoHtWSVccOB
         s2aCSZ/IE8i7fPwolJF/6ooHidkcOzny90x4oiMhSeY+BXw0pBvZmnfaCII/R4O5uEe/
         +TFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=spCUFVdjDT/l80JdlzLeqn0kF7ADg+0QZ3H7hNfAWdc=;
        fh=EcO5he7kBhkq1+blo3bftTd/gQjAs68nzvCtO96H+rw=;
        b=KH7pSZd0UZr8e/Q+O6//QM28hQsFea+Eo97cIjxHstUbqRg/pUMNph/LHZGszQKneR
         STmvWbE7nXeayW4qdFmfrvV+BKKS01ZsQvAjr3Fd8Awjn7NdEe7GrLeDjU3EH036Bpog
         Y/70v36zCC1g0ic0dgRBztYKFNze+YF0FMsKUtEcfD0ky9OTGOVzr3JZsqjHcUJthCpr
         sWf0oR8WhtAAm4FAwrySvdXh6u/laJex1BIrcV31qplDDUfub2j9A6Q6HVwudnz3bxbf
         7ixOpIoE9/Onniq6xlqkeZsc8oGQTH8U0vC8mR0mX2NNVxZVPtfcuSf+RS3R46WJG+Vu
         LXFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=nYSVqIQI;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id y4-20020a170902ed4400b001bbb270510fsor1773058plb.0.2023.08.16.08.04.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 16 Aug 2023 08:04:55 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=nYSVqIQI;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1692198295; x=1692803095;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=spCUFVdjDT/l80JdlzLeqn0kF7ADg+0QZ3H7hNfAWdc=;
        b=nYSVqIQIMq0Bjo+CIrgdDde3EJPJuj/MJ9uTwbDZ6RyfEyxCU7M4X7UBFiGs9qcrMC
         VeoxXj9CK5JBYNjr8yerHF/vFCd7Ojr5q3tGrYvYLPmJmtxfk9krsjYHD7JYjJyADOid
         HxzTpMBO7TucX0pjBONox8wJqz2c7WGZotTTOqiup/9oIna6tF0JVMFHqj1S8H9TMWaC
         d+yBzLYyU88We5hYKlsegfpWmKQbi1wnv83N1wjNSGA4sxHfGS3PnnWEYxSriceQgWQu
         ddHFa9+TucrohYT71IsRI0v3nQyHm8SMePXDc+4muaZvX9FxaZjVKfCbozWAffO0z8+T
         VWFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692198295; x=1692803095;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=spCUFVdjDT/l80JdlzLeqn0kF7ADg+0QZ3H7hNfAWdc=;
        b=BOlhNA8va6LHqTLld83hZHH5Klwy76EZiS4oxiQ5SERJGjivnEobeU2uPlxKiuNQYc
         EpewKfOws03Z8xdYUVByDpm99MnWQ5F29MssxzVvKBHL6Bq93npDw4+pI0+Wb7frrnMh
         WKvxEoePST6NatckaJW2O7I/bfK0Rc1w8s6e34xdY0F1f3dYdP7YMAgv3vHRxLHUc1Fq
         sYJssn9KiQL3n5IkMr3qXxWCXVC8jRON8iSsleOT6Yk27EuP4b1V1jedGf5jYnzq48Kd
         XaHnhZknh9CYGlMtjowwy6NfMEPqWaw/wkct+oJDwaK5pbFKQ4yvRFvitVKJytxJMlp7
         XWVg==
X-Gm-Message-State: AOJu0YxjYtA0oydEEnLcY9lUlWhLI9b36LGlHb9VYiJ/KNCwwv1ygM0Y
	9ezFcBHvFMOD6qdwzneBGAha3JT1NSD/JKZAWFg=
X-Google-Smtp-Source: AGHT+IGqXgAIw6g805RTzCsYUKME2etnxfetoohdotLB6/EfbqsYWmEFcmJOdy2UTTkeqcKF6VxSbg==
X-Received: by 2002:a17:90a:648e:b0:268:3ca4:6152 with SMTP id h14-20020a17090a648e00b002683ca46152mr3023992pjj.15.1692198295212;
        Wed, 16 Aug 2023 08:04:55 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from ?IPV6:2400:4050:a840:1e00:78d2:b862:10a7:d486? ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id b22-20020a17090a8c9600b0026d034f6badsm691307pjo.38.2023.08.16.08.04.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Aug 2023 08:04:54 -0700 (PDT)
Message-ID: <1e77c6b2-646d-42de-9ed5-df60a3c7d3b8@daynix.com>
Date: Thu, 17 Aug 2023 00:04:44 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 24/24] contrib/plugins: Add cc plugin
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour
 <ma.mandourr@gmail.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Michael Rolnik
 <mrolnik@gmail.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Brian Cain <bcain@quicinc.com>, Song Gao <gaosong@loongson.cn>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Laurent Vivier
 <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org
References: <20230731084354.115015-1-akihiko.odaki@daynix.com>
 <20230731084354.115015-25-akihiko.odaki@daynix.com>
 <87pm3pprv8.fsf@linaro.org>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <87pm3pprv8.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: K1icX897C6Xv

On 2023/08/15 0:23, Alex Bennée wrote:
> 
> Akihiko Odaki <akihiko.odaki@daynix.com> writes:
> 
>> This demonstrates how to write a plugin in C++.
>>
>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
>> ---
>>   docs/devel/tcg-plugins.rst |  8 ++++++++
>>   configure                  | 15 ++++++++++++---
>>   contrib/plugins/Makefile   |  5 +++++
>>   contrib/plugins/cc.cc      | 15 +++++++++++++++
>>   tests/tcg/Makefile.target  |  3 +++
>>   5 files changed, 43 insertions(+), 3 deletions(-)
>>   create mode 100644 contrib/plugins/cc.cc
>>
>> diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst
>> index c9f8b27590..0a11f8036c 100644
>> --- a/docs/devel/tcg-plugins.rst
>> +++ b/docs/devel/tcg-plugins.rst
>> @@ -584,6 +584,14 @@ The plugin has a number of arguments, all of them are optional:
>>     configuration arguments implies ``l2=on``.
>>     (default: N = 2097152 (2MB), B = 64, A = 16)
>>   
>> +- contrib/plugins/cc.cc
>> +
>> +cc plugin demonstrates how to write a plugin in C++. It simply outputs
>> +"hello, world" to the plugin log::
>> +
>> +  $ qemu-system-arm $(QEMU_ARGS) \
>> +    -plugin ./contrib/plugins/libcc.so -d plugin
>> +
> 
> I'm going to assume this is useful because you have some out of tree C++
> plugins? I'd drop the last two patches for now until there is a slightly
> more compelling use case.

The out-of-tree plugin is mentioned in the cover letter and available at:
https://github.com/shioya-lab/sniper/tree/akihikodaki/bb/frontend/qemu-frontend

This plugin emits a trace of execution for use in Sniper simulator. I 
believe it's useful for other people doing microarchitecture research 
since processor simulation infrastructure is often written in C++.

> 
> The C++ compiler detection moved into meson in b485458e00 (configure,
> meson: move C++ compiler detection to meson.build) so I don't think
> there is currently a compelling reason to bring this back into
> configure.
> 

It is necessary because TCG tests use Makefile and config-host.mak is 
emitted by configure. We can remove C++ detection from configure when 
TCG tests or the config-host.mak generation migrate to Meson.
