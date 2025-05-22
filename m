Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp1756378njc;
        Thu, 22 May 2025 03:35:38 -0700 (PDT)
X-Received: by 2002:a17:902:e78b:b0:231:c992:3722 with SMTP id d9443c01a7336-231de35fea0mr322473485ad.16.1747910138484;
        Thu, 22 May 2025 03:35:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747910138; cv=none;
        d=google.com; s=arc-20240605;
        b=LtcRpxNMT3QnUUqRaSa25WFFBaHsaSyl0FS0jdNJE6hilyDv6YbIpVOGMsCrBKIdzT
         ecWnKilMRpBS++hEUNj6Iop6cEBCY/Fq2uousclHclm903tp0Ijcp3XYIB8fwXYkRo5l
         D4mrD42jus7CP3aV8CsgACpgm5E+nzYseEXbLWGL1X2qMTXUZkLIHv2XWUUCNpsm1dHi
         eW6VA7lnoaWF2jZiLH0x3Eu2rZMUw8JnNmsw7uSL+PZzGK35nVBgaGKCbCrZ0MrGm+Sg
         w4HI/bZ7IAFhzwaH3bv2Y3aJGYrJEIzHgiaFXmkR2YaixDVRte1Fu1JAkUb58rRmbhBY
         GtBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=+/YDTvjOrO7IViJpwqQz7zuEkqIdZ05kpcKcNyN8J4M=;
        fh=HDsDEV91OvQdWfKzjm8zzIVjoz8U7SBx/00KL0QwJHo=;
        b=iid8QsI1lN7H2/AfMzT/HLsB6w5M+7sxq+1gwkvvPDtG/ChA7UN6Htx+6YIZ64HYos
         Zt1JcCiU5HIs8D07AuW7IjPMiPsKm2Lc2u7a9QYAn6NioIsbWNAt/ajcJbyYE+9mjodd
         DRa+UvVp49n9ogc//4rXLplv0Zqnvs+utY+ecGkAFex5cqbienPu4NFowL4BiVHF5oO/
         5IJRljTg93iUJck8E9nIiGuftnTA0KXZxJtHjX45dFBytyqKCRid3evNL3rsd988ga5M
         zskE+8M4xKiw1jZW7vzayfddlId98mZGu486OI5eHhC/sp4z9HNfopglYar8Roa0CXAr
         dHSw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=L9V5uWHH;
       spf=pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=akihiko.odaki@daynix.com;
       dara=neutral header.i=@linaro.org
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-231d4e8626esor87640675ad.13.2025.05.22.03.35.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 22 May 2025 03:35:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=L9V5uWHH;
       spf=pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=akihiko.odaki@daynix.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1747910138; x=1748514938; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+/YDTvjOrO7IViJpwqQz7zuEkqIdZ05kpcKcNyN8J4M=;
        b=L9V5uWHHEKkLoHyMqNK3vsi70wTKJrA+tYHKd/FTi74K+re19LgNki92+20bRlksMC
         0gy9sHpVDB3/5SqpLpx0VsgXPhBYCXZD6tCuqcuKcICcSsGsI9WikJFvxDcjYN4lLa+E
         NDpg18vuLazwZmO3TSzksFAdYsISZhKlZ7qYojSxM7r89rp1ZSA3h7IYa+n3xRLjhZ8R
         nRXdXyAZK+SYvPUdpWgfr7qBA5XhKQeYAevCkoc6fGAZxGsy/RvdJ/dZmkAD+wFAXe2S
         NxVPAPJukFWqBdI9gXY42VUcSxUNZetU3widO5WucRmhOBHtpJslCLrHoDnx18HNieA7
         ixXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747910138; x=1748514938;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+/YDTvjOrO7IViJpwqQz7zuEkqIdZ05kpcKcNyN8J4M=;
        b=YBiytzbGhh94Irz3/xUcOyacuQZ9TBjO+PFfWLaBOmGx0BA4VKAAPMDtNb2peuhKCv
         K7bJ3/jLtCVcFzh2lNMtVH7psA2GrHeljHZVg4Ybm12C390G6t6S8Tz6W/YLcIhOEifo
         zedw3+JPwnSkPAYpVslNgNdVXN9BYbZDqoPgbdTgevD7R9xLVTJcqsVc2FykhCIrKBof
         SUAgjj5xNmSn9G7V8jD/bcdFsHipUuhTk9GhgEfgKw5pgvFEOj7SCj71iB9zmY/dtiwE
         NZox7zJTmiGpHUoXgb7LKYTmP4NaWtec7S5MxNFfrg4fdADEaneCn18ZzFR1yiZvlkhq
         jA3A==
X-Gm-Message-State: AOJu0YwxZ5FQ4CegBSB1yIGFh8E/oQge4saYJkJLNdWU3do/WcwLk6yA
	fpuXoIo4RgC3lQPR5caj5B4Py/5IQk+VDi58j/KjXRDuSWYoEvKOokoUpmrMvbeEFew50makjlC
	2kYGP
X-Gm-Gg: ASbGncu3odDyWbKqrue3fcRMcaaxvkXN3quBznHaot/SG8BcsSKdzy71L42OB2iR8Fc
	UpYgpuBpmom0KRjSeZJUrFGpL4MTDvlwNoNAmvjQMtJU8O0DWw6XpIcB+iptLSOdNk2B9aVJ9Kn
	FywQ5gEHP61Yaxc1tqyjzO3RxwXE2/Oais49rwcyFfUpeAa4Dcz9DgSqwoxE593UrUtdNvUO2ef
	E9JuefgbvjMkMFP5lZ7z7nB6w2K6IudQTR/PzoeRwQi0tzxcRQOX86khT9aMF89ZI6onJFHkdDO
	V99Kz5zn9hvDQbCh2OrfMsj5t8QgIFEtx8NlS2zpvPNzrOMzxl3sV3LwFHDfZw==
X-Google-Smtp-Source: AGHT+IHPFoFO3WKSRS7xIIAWlCB5S5nbksA/ArsxSJDa7Gg8WdftYamfFsrAIi6ZHaCv3EColsvO8g==
X-Received: by 2002:a17:902:dac5:b0:22e:4509:cb89 with SMTP id d9443c01a7336-231de21d4d5mr323170165ad.0.1747910137815;
        Thu, 22 May 2025 03:35:37 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from [10.100.116.185] ([157.82.128.1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ade028sm106776165ad.82.2025.05.22.03.35.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 03:35:37 -0700 (PDT)
Message-ID: <3d16d571-0f71-49e0-b2d2-b1a144e92e26@daynix.com>
Date: Thu, 22 May 2025 19:35:30 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/20] tests/Makefile: include test-plugins in per-arch
 build deps
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Peter Xu <peterx@redhat.com>, =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?=
 <marcandre.lureau@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Markus Armbruster <armbru@redhat.com>, David Hildenbrand <david@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gustavo Romero <gustavo.romero@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20250521164250.135776-1-alex.bennee@linaro.org>
 <20250521164250.135776-6-alex.bennee@linaro.org>
 <15677d5c-cd86-4d75-a21e-0c011800cd55@daynix.com>
 <87tt5d6ina.fsf@draig.linaro.org>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <87tt5d6ina.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: jF741fFzwTvc

On 2025/05/22 19:31, Alex Bennée wrote:
> Akihiko Odaki <akihiko.odaki@daynix.com> writes:
> 
>> On 2025/05/22 1:42, Alex Bennée wrote:
>>> The user can run a subset of the tcg tests directly, e.g.:
>>>     make run-tcg-tests-hexagon-linux-user
>>> but in this case we fail if there has not been a full build to
>>> ensure
>>> all the test-plugins are there. Fix the dependency to ensure we always
>>> will build them before running tests.
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>> ---
>>>    tests/Makefile.include | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>> diff --git a/tests/Makefile.include b/tests/Makefile.include
>>> index 23fb722d42..7f7f62cbf6 100644
>>> --- a/tests/Makefile.include
>>> +++ b/tests/Makefile.include
>>> @@ -46,7 +46,7 @@ $(foreach TARGET,$(TCG_TESTS_TARGETS), \
>>>            $(eval $(BUILD_DIR)/tests/tcg/config-$(TARGET).mak: config-host.mak))
>>>      .PHONY: $(TCG_TESTS_TARGETS:%=build-tcg-tests-%)
>>> -$(TCG_TESTS_TARGETS:%=build-tcg-tests-%): build-tcg-tests-%: $(BUILD_DIR)/tests/tcg/config-%.mak
>>> +$(TCG_TESTS_TARGETS:%=build-tcg-tests-%): build-tcg-tests-%: $(BUILD_DIR)/tests/tcg/config-%.mak test-plugins
>>
>> I don't think this is going to work.
>>
>> test-plugins will invoke run-ninja, which is defined as follows:
>>
>> run-ninja: config-host.mak
>> ifneq ($(filter $(ninja-targets), $(ninja-cmd-goals)),)
>> 	+$(if $(MAKE.nq),@:,$(quiet-@)$(NINJA) $(NINJAFLAGS) \
>> 	   $(sort $(filter $(ninja-targets), $(ninja-cmd-goals))) | cat)
>>
>> $(ninja-cmd-goals) should contain test-plugins, but it doesn't if I
>> understand it correctly.
> 
> It certainly does:
> 
> ➜  rm -rf tests/tcg/plugins/
> 🕙11:31:03 alex@draig:qemu.git/builds/all  on  HEAD (61e51c3) (REBASING 5/26) [$?]
> ➜  make test-plugins
> /home/alex/lsrc/qemu.git/builds/all/pyvenv/bin/meson introspect --targets --tests --benchmarks | /home/alex/lsrc/qemu.git/builds/all/pyvenv/bin/python3 -B scripts/mtest2make.py > Makefile.mtest
> [1/14] Compiling C object tests/tcg/plugins/libbb.so.p/bb.c.o
> [2/14] Linking target tests/tcg/plugins/libbb.so
> [3/14] Compiling C object tests/tcg/plugins/libempty.so.p/empty.c.o
> [4/14] Linking target tests/tcg/plugins/libempty.so
> [5/14] Compiling C object tests/tcg/plugins/libinline.so.p/inline.c.o
> [6/14] Linking target tests/tcg/plugins/libinline.so
> [7/14] Compiling C object tests/tcg/plugins/libinsn.so.p/insn.c.o
> [8/14] Linking target tests/tcg/plugins/libinsn.so
> [9/14] Compiling C object tests/tcg/plugins/libmem.so.p/mem.c.o
> [10/14] Linking target tests/tcg/plugins/libmem.so
> [11/14] Compiling C object tests/tcg/plugins/libreset.so.p/reset.c.o
> [12/14] Linking target tests/tcg/plugins/libreset.so
> [13/14] Compiling C object tests/tcg/plugins/libsyscall.so.p/syscall.c.o
> [14/14] Linking target tests/tcg/plugins/libsyscall.so
> 

ninja-cmd-goals is defined as follows:

ninja-cmd-goals = $(or $(MAKECMDGOALS), all)
ninja-cmd-goals += $(foreach g, $(MAKECMDGOALS), $(.ninja-goals.$g))

If you run "make test-plugins", $(ninja-cmd-goals) will contain 
"test-plugins" because $(MAKECMDGOALS) will be "test-plugins". It won't 
if you run "make run-tcg-tests-hexagon-linux-user".

Regards,
Akihiko Odaki
