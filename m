Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp3727088njc;
        Sun, 25 May 2025 08:18:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVy5GlHI0PEHJ4mOK1tT21nrsrPEG4IKr7lOudHTIncN1YNQF71xuj0BPfTqXVkHsFbP6cg43/j7xDX9w==@linaro.org
X-Received: by 2002:a05:6000:2003:b0:3a4:d722:526e with SMTP id ffacd0b85a97d-3a4d72253ffmr1466071f8f.44.1748186297891;
        Sun, 25 May 2025 08:18:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748186297; cv=none;
        d=google.com; s=arc-20240605;
        b=Q4r+/7sLYb7LhWoqmpVHWnAQ2sp68k0lfm5YnIPK/eF3wWlIBRjsRcprtKYkw50+MO
         nC0XxmTKz093Vj4shxyNFPwsPCHVCa1BACYDHpbJM1clRX+x/8MM05ZhZodOuF0ahozm
         fqOVWS5uV4lZRct5ykTuegHFn+gALHpEIEchUQwVCJRSs2rHs/wSTmpkAC5ARNfUnHuN
         6I7DxDO0Kwgg1oEvcPyF9bKsvXNdyU1ONRa9AeiStGpF+Ul/uoiVSI2xd/9EOoU3Unbv
         1CIvLMROt1hF9J1M9FK1z2SScIjmvnkHnSje0LsMWHRfbf0d1rPAmxic8g7OCTz7Ja+u
         pRnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=AU1Q4g4d+sPgmefKQY1CITlBd+gjy/DQcmEiu6cXEX0=;
        fh=5s1zB42pWanrWj2zKJNRB+TipPT2c9Pq0A8DWyzY+fI=;
        b=TEHWKAweq+/ODQOff+ryZ3hZlv5opmGZN/WyIxkLgECV3870TkSmupSerR1hHgElz4
         KgfeG51oVbSrYJSmJ2S6nF1WE+47O1yE5DH6GVAYrYSsInpXKug3B1p5Lq9ECX9iqhSZ
         T3HPlb48Y/C3aa89OGMhih4cZwgV7xl//gC7K9pUid4n4QMmnvjp/8nUhcmJOiEO5g6V
         Q73q1DE4iomMWxJITPODTp5PLpIet+LavYhMuzCfTxExs6udFQcE/RmHkduwTjj7sBPs
         lCmE384ibwBazWvsoUWHxI69wblI9GO5v10LE8DxMVg9FtigUWDzqyk6vPTNYwIn+sk+
         WT+A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OQFzik4W;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3a35ca508d0sor6542668f8f.2.2025.05.25.08.18.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 25 May 2025 08:18:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OQFzik4W;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748186297; x=1748791097; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AU1Q4g4d+sPgmefKQY1CITlBd+gjy/DQcmEiu6cXEX0=;
        b=OQFzik4WsKdDAOHSJvsBkICFIYuj3dKFtlsLbH9Uy6VzAjZ6JjUL/TkTMFccGVkjJo
         3UFuEAKMr93jgr+axZYjGgkUjs0zunNkKUp1zIu3Lmlcv4QqW5UIFL4JOnrkUxynzdQZ
         oKuF2m3OIGlIWQX7RCgHVgoju45I6ZwVeo4fwMuSLhD2GgX4UzOf7QJR6KXAAnTCq/b+
         tNYOTYm5zZjF+vwSSrib4IGJX1nx1L+WrESxaPHbvX23ibv3ioP8jhNOHEBVU9vetnC3
         1tg6npSXL69YZTxZrnA9ilAFT39vlwvnjmfi0u5a4gOaKB/ayfaVJJafdeS+wp0VrFHS
         AZgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748186297; x=1748791097;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AU1Q4g4d+sPgmefKQY1CITlBd+gjy/DQcmEiu6cXEX0=;
        b=bz1q9dal7TIqe2qEjHNX74KzUNSz0wOU8febrRXMdxnWsxRmXRIuf3VQRlAw2xfSu1
         HC2kiyPpiAKfKU5q6+TMMNMMRjXWKmR/vLSsDczEKAn9HM8qlNnj4d6AB38Av0Rm8leV
         B9RRAc4pccw9eLZBcOxGGM0jQvnl89v8K0a5wOxaUm3JV6oxTJYwnjhRJYjnh79Vh6EY
         ZnUgiUJa2k6KJIjd1WepZ4KohA4Ext5FWCFtLbGjd6qPiBurKyNkhMqF8EAI1lvfpeR4
         L7dwAIui/7tiFD1MfzI32U5vtwlvHlmog+D4zWjD67X4Mfg0WqImx8gYuidDjR73oYtA
         Egww==
X-Forwarded-Encrypted: i=1; AJvYcCX754xHlhhs6jmFx44QERqBmL67D/0rAAZQI9mO+U61SESD+RxIJrDdPcxwNmBHK7H85A+5V0HlCf03VA==@linaro.org
X-Gm-Message-State: AOJu0YxFOPgT5bHTPY11rcgUKK1rmBKglZsNSsX7l/xXz4svT10/+htW
	U6GPjehFbrhCpzi1pFKWTYLUXyZDCjeY0lApDCTJ0Kj3J0+w83G1hgsZYyJ5rBcTgcK8lQ==
X-Gm-Gg: ASbGncvmEOwH8W+aJ7G22DSil6VzqXoW9EWu5P3LVRfC7Bu+1IB8V+Njsm6KYX3zIO4
	REKLDYksrmBvmwzdFaBvQSSD7TB3KRv6MSf/47/qOb3WyywourfmrM+CcGneCiOZdZGul1L7z00
	MoQhBOWmOXUr0KdAnmMgmIo58Ft5LbMMInevNx7ACVPgPXq+FsdcdEhRogx36ceJpGr7DxwgTce
	iCzwJPG124Pg8CzMgOjaRziLr7CSIL1PKfLuNUKd5UCuqiLC2+Wcbw+cjdLM/Fbcb4eoORuoAmK
	22W0bdtHrYCZhAKGlmImxb9XBXCeN1eSL5omet4vuz1I1ZdI4PvBS8RppHjo9eSRJA/EQBVNfB8
	SI77XpWGR4DS250JM9Z0nk2/SGSs=
X-Google-Smtp-Source: AGHT+IHmcppg9n0GaY9pi7P2vIAqY5tP4DjM0K2YxvBfyRU1ZKtvNwwyeXx6ahuwsXnn2igEWFqOcQ==
X-Received: by 2002:a05:6000:178e:b0:3a1:f702:4589 with SMTP id ffacd0b85a97d-3a4cb4743d5mr5611949f8f.35.1748186297279;
        Sun, 25 May 2025 08:18:17 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [10.132.0.213] (17.red-95-127-33.staticip.rima-tde.net. [95.127.33.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4ccc2c88dsm5076314f8f.69.2025.05.25.08.18.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 May 2025 08:18:16 -0700 (PDT)
Message-ID: <0eb288d2-413a-4e4c-8bd1-fc3fad340b3c@linaro.org>
Date: Sun, 25 May 2025 17:18:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/20] tests/Makefile: include test-plugins in per-arch
 build deps
To: Akihiko Odaki <akihiko.odaki@daynix.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Peter Xu <peterx@redhat.com>, =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?=
 <marcandre.lureau@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Markus Armbruster <armbru@redhat.com>, David Hildenbrand <david@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gustavo Romero <gustavo.romero@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20250521164250.135776-1-alex.bennee@linaro.org>
 <20250521164250.135776-6-alex.bennee@linaro.org>
 <15677d5c-cd86-4d75-a21e-0c011800cd55@daynix.com>
 <87tt5d6ina.fsf@draig.linaro.org>
 <3d16d571-0f71-49e0-b2d2-b1a144e92e26@daynix.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <3d16d571-0f71-49e0-b2d2-b1a144e92e26@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: mV2OpAH0ULAJ

On 22/5/25 11:35, Akihiko Odaki wrote:
> On 2025/05/22 19:31, Alex Bennée wrote:
>> Akihiko Odaki <akihiko.odaki@daynix.com> writes:
>>
>>> On 2025/05/22 1:42, Alex Bennée wrote:
>>>> The user can run a subset of the tcg tests directly, e.g.:
>>>>     make run-tcg-tests-hexagon-linux-user
>>>> but in this case we fail if there has not been a full build to
>>>> ensure
>>>> all the test-plugins are there. Fix the dependency to ensure we always
>>>> will build them before running tests.
>>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>>> ---
>>>>    tests/Makefile.include | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>> diff --git a/tests/Makefile.include b/tests/Makefile.include
>>>> index 23fb722d42..7f7f62cbf6 100644
>>>> --- a/tests/Makefile.include
>>>> +++ b/tests/Makefile.include
>>>> @@ -46,7 +46,7 @@ $(foreach TARGET,$(TCG_TESTS_TARGETS), \
>>>>            $(eval $(BUILD_DIR)/tests/tcg/config-$(TARGET).mak: 
>>>> config-host.mak))
>>>>      .PHONY: $(TCG_TESTS_TARGETS:%=build-tcg-tests-%)
>>>> -$(TCG_TESTS_TARGETS:%=build-tcg-tests-%): build-tcg-tests-%: 
>>>> $(BUILD_DIR)/tests/tcg/config-%.mak
>>>> +$(TCG_TESTS_TARGETS:%=build-tcg-tests-%): build-tcg-tests-%: 
>>>> $(BUILD_DIR)/tests/tcg/config-%.mak test-plugins
>>>
>>> I don't think this is going to work.
>>>
>>> test-plugins will invoke run-ninja, which is defined as follows:
>>>
>>> run-ninja: config-host.mak
>>> ifneq ($(filter $(ninja-targets), $(ninja-cmd-goals)),)
>>>     +$(if $(MAKE.nq),@:,$(quiet-@)$(NINJA) $(NINJAFLAGS) \
>>>        $(sort $(filter $(ninja-targets), $(ninja-cmd-goals))) | cat)
>>>
>>> $(ninja-cmd-goals) should contain test-plugins, but it doesn't if I
>>> understand it correctly.
>>
>> It certainly does:
>>
>> ➜  rm -rf tests/tcg/plugins/
>> 🕙11:31:03 alex@draig:qemu.git/builds/all  on  HEAD (61e51c3) 
>> (REBASING 5/26) [$?]
>> ➜  make test-plugins
>> /home/alex/lsrc/qemu.git/builds/all/pyvenv/bin/meson introspect -- 
>> targets --tests --benchmarks | /home/alex/lsrc/qemu.git/builds/all/ 
>> pyvenv/bin/python3 -B scripts/mtest2make.py > Makefile.mtest
>> [1/14] Compiling C object tests/tcg/plugins/libbb.so.p/bb.c.o
>> [2/14] Linking target tests/tcg/plugins/libbb.so
>> [3/14] Compiling C object tests/tcg/plugins/libempty.so.p/empty.c.o
>> [4/14] Linking target tests/tcg/plugins/libempty.so
>> [5/14] Compiling C object tests/tcg/plugins/libinline.so.p/inline.c.o
>> [6/14] Linking target tests/tcg/plugins/libinline.so
>> [7/14] Compiling C object tests/tcg/plugins/libinsn.so.p/insn.c.o
>> [8/14] Linking target tests/tcg/plugins/libinsn.so
>> [9/14] Compiling C object tests/tcg/plugins/libmem.so.p/mem.c.o
>> [10/14] Linking target tests/tcg/plugins/libmem.so
>> [11/14] Compiling C object tests/tcg/plugins/libreset.so.p/reset.c.o
>> [12/14] Linking target tests/tcg/plugins/libreset.so
>> [13/14] Compiling C object tests/tcg/plugins/libsyscall.so.p/syscall.c.o
>> [14/14] Linking target tests/tcg/plugins/libsyscall.so
>>
> 
> ninja-cmd-goals is defined as follows:
> 
> ninja-cmd-goals = $(or $(MAKECMDGOALS), all)
> ninja-cmd-goals += $(foreach g, $(MAKECMDGOALS), $(.ninja-goals.$g))
> 
> If you run "make test-plugins", $(ninja-cmd-goals) will contain "test- 
> plugins" because $(MAKECMDGOALS) will be "test-plugins". It won't if you 
> run "make run-tcg-tests-hexagon-linux-user".

It seems Akihiko is right, this patch doesn't fix my use case.
