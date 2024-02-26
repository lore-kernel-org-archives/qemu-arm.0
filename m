Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp2017259ejf;
        Mon, 26 Feb 2024 04:22:23 -0800 (PST)
X-Received: by 2002:a17:902:da8e:b0:1dc:a03a:b9ab with SMTP id j14-20020a170902da8e00b001dca03ab9abmr2692285plx.69.1708950142839;
        Mon, 26 Feb 2024 04:22:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708950142; cv=none;
        d=google.com; s=arc-20160816;
        b=qCtgaTU8sAO40NQ48Nvv/YtTIv909F0g9sqS/8ba9ZLR4isL2gsPPYc5eVTbkufMeV
         joElURUhSbgHhyGzAHUUEDRC7uHRBFxmn0i1w4XBm9IqLuiLkFToCNOXwoXS3ft2TDPd
         QstybWsEjlLjy+nF2ha/N3khTyGtNh6dITpOT7zPITPfKATaXCthMNsaCHsASGG+AkO3
         g27uvlxsg1kAm/i3TnoNKb5vmJ8rmPFhXYLWPhU9XfQbiW7W4WXvT5+vVscuLTWHiUGG
         QecSfuEDYpnHg+Ysg9a5nnG4x8d77lsJwAZzkweaQZxZUKwIR6wYLyPBcIZq/mQWr4pC
         BWfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=cDlHDrC2sXx/wFIpF7ENRE5ZHGFJqcpEgzRWGY9SY5M=;
        fh=vMXW8M/QAlC8xuzwTuBKPw8wj798+wVwlNbZ5uJYgXg=;
        b=aG5mF9PAd4hnmoNMTDnQWeZ1xS/3Cd313jp8mRRxsXYCHMTvxMqnrXB6PNKQuxRPzw
         DAWzlurni/Io2xXBVEJ5IISbdDpO8irLf7dpbf6yJBA+CWYQ3TAhtQIVZ1OWMtTWwA1S
         1saSGm6T9GCflJed8Tut1oJ3Qw0Lbf/GX2+XoyMql5HpEq8rmGXlKE/iF//gXcLjZv54
         XXOGrhYRpR4WpolCXZWg7h0qe62O0eZhwLT2+zUMHgAWyUfqdvgqBfm2uzhq5GmjFPFQ
         z0owuT09KjiGb60o7CRL9mH+UlSOHwrVCJl4Qg+J58XJ1hh02Vudx83Uu05J0R3+vp3s
         6cNw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=HkW6s94z;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id q8-20020a170902a3c800b001dba35c927fsor1527253plb.13.2024.02.26.04.22.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 26 Feb 2024 04:22:22 -0800 (PST)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=HkW6s94z;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1708950142; x=1709554942; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cDlHDrC2sXx/wFIpF7ENRE5ZHGFJqcpEgzRWGY9SY5M=;
        b=HkW6s94zezVho4PS/WVe2P5u7852LhaxW1D+HeYO1iDgpgwb6i7hFr6oU6NrIP9vF7
         r6VGk+VoduqqVHV11ttibSf76FDL8yQkgn1+clrtUWMXBd7ou2jwYZryTkJcdwTwv6tH
         Wj+4eMh4heLSRSBQjgRWYpMjsBtrVr0oZM0rwIrcKaQP1yws7qDlgUAmpD7kciQYWA0O
         vgiIDbCks8k4HNKoBLVUDheOjff8J/TETlMPIya1J+NOEOETVgQdzJNk49kpJI8hnEsP
         rDXM5Esh81VHsYF3/l1bXaqCH1Xwxb7wlWrtFdgzvUdW+Lhr8i6kVRqhw6w7qjaErDlo
         Pbsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708950142; x=1709554942;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cDlHDrC2sXx/wFIpF7ENRE5ZHGFJqcpEgzRWGY9SY5M=;
        b=nCHXl9ZuZtFKkSvfALdt6wCmyRNCdJ1IjGD9tdE3jQTSDjOtYhf9uXc0MtfH6qa3Od
         VNq6sK808oPH1eoGKHOiDWMS38OM60TA9UWBszNDj4mcuyDUZiTSWuMhRMrwLZHNR0Oh
         8GTJ0YjBsU1JJvbIGINppC+5fnmCgASNea/fa1R4YV6dKot7gg8UKDQsBiGmGjaC+XWN
         0aDNacPANjA1vZTKHObhmY0wz935KGB5Wk0rKi0wrkrNPeOA+OIIkNn9kDpIfEXRzCg2
         7MGaSmQmPMaOTWcsaqIcCfk2bDziDmPSWYCSxBSnmViXyYqDul52k7MUdpzQfnjze9+n
         QH/A==
X-Gm-Message-State: AOJu0Yw62fmicozGDd6FCCs8nFOWtFHf0+Ss/JHb9JMc8lRd57kroD3N
	CM2XYMY3E64HRICes9rd+2a2d1yU2HFzRC6IkTt4QkQCydSjYxgtpR0YmRPmds64OwtjFdq+pNj
	n
X-Google-Smtp-Source: AGHT+IGujwpUcOVein8hvIc4zxJU7gkmldLs7Wdd8XjfOVtMmR3NGgwcvrIXettxCaZdoiq1724PjQ==
X-Received: by 2002:a17:902:aa81:b0:1d9:3843:3f07 with SMTP id d1-20020a170902aa8100b001d938433f07mr6396069plr.61.1708950142073;
        Mon, 26 Feb 2024 04:22:22 -0800 (PST)
Return-Path: <akihiko.odaki@daynix.com>
Received: from ?IPV6:2400:4050:a840:1e00:9ac7:6d57:2b16:6932? ([2400:4050:a840:1e00:9ac7:6d57:2b16:6932])
        by smtp.gmail.com with ESMTPSA id j5-20020a170902c3c500b001d5f1005096sm3801042plj.55.2024.02.26.04.22.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Feb 2024 04:22:21 -0800 (PST)
Message-ID: <691af6af-bc4f-45ce-b017-7a82269e9381@daynix.com>
Date: Mon, 26 Feb 2024 21:22:14 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 21/27] plugins: add an API to read registers
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Song Gao <gaosong@loongson.cn>,
 qemu-s390x@nongnu.org, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Bin Meng <bin.meng@windriver.com>, Yanan Wang <wangyanan55@huawei.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-ppc@nongnu.org,
 David Hildenbrand <david@redhat.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Cleber Rosa <crosa@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Peter Maydell
 <peter.maydell@linaro.org>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Mahmoud Mandour
 <ma.mandourr@gmail.com>, John Snow <jsnow@redhat.com>,
 Weiwei Li <liwei1518@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Brian Cain <bcain@quicinc.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Michael Rolnik <mrolnik@gmail.com>
References: <20240223162202.1936541-1-alex.bennee@linaro.org>
 <20240223162202.1936541-22-alex.bennee@linaro.org>
 <2a7f0e06-0bc9-4fad-add7-9675a4cc2a0a@daynix.com>
 <87y1b7eay6.fsf@draig.linaro.org>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <87y1b7eay6.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: khwEJ2YyvY1l

On 2024/02/26 20:12, Alex Bennée wrote:
> Akihiko Odaki <akihiko.odaki@daynix.com> writes:
> 
>> On 2024/02/24 1:21, Alex Bennée wrote:
>>> We can only request a list of registers once the vCPU has been
>>> initialised so the user needs to use either call the get function on
>>> vCPU initialisation or during the translation phase.
>>> We don't expose the reg number to the plugin instead hiding it
>>> behind
>>> an opaque handle. As the register set is potentially different for
>>> each vCPU we store a separate set of handles for each vCPU. This will
>>> become more important if we are able to emulate more heterogeneous
>>> systems.
>>> Having an internal state within the plugins also allows us to expand
>>> the interface in future (for example providing callbacks on register
>>> change if the translator can track changes).
> <snip>
>>> +
>>> +/*
>>> + * Register handles
>>> + *
>>> + * The plugin infrastructure keeps hold of these internal data
>>> + * structures which are presented to plugins as opaque handles. They
>>> + * are local to each vCPU as there can be slight variations for each
>>> + * vCPU depending on enabled features. We track this in
>>> + * CPUPluginState.
>>> + */
>>
>> Since we do no longer coalesce registers for different classes, I need
>> to bring my old question back: Why don't you just cast register
>> numbers into pointers and use it as handles?
> 
> In the interest of getting this merged before the fast approaching
> soft-freeze I shall do this for now. However once the plugin system has
> knowledge of individual registers exposed by TCG it will need to track
> internal state so will need some sort of container for that.

Indeed it's likely that we would have containers for registers, but we 
don't know who would own them yet.

These containers may not be held by vCPU classes as you previously 
proposed because we may support different configurations of one vCPU class.

The current proposal to allocate handles for each vCPU may not be what 
we would want to do in the future either. To support SMP debugging with 
gdbstub, gdbstub must know sets of vCPUs that have identical registers, 
and once it does, it's better to allocate handles for each of such sets, 
not each of vCPUs.

Let's figure out how we should manage containers when a need arises.

> 
>> You can even just expose gdb_reg_num with the interface.
> 
> As I have explained before I don't want plugins to treat the handle as
> a pure index in case they start providing numbers that aren't in the
> list provided by qemu_plugin_get_registers.
> 

You can assert the given number has an associated name.
