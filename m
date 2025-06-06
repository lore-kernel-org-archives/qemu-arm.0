Received: by 2002:a17:505:6015:b0:1be9:327d:8ee3 with SMTP id us21csp806919njc;
        Fri, 6 Jun 2025 02:53:17 -0700 (PDT)
X-Received: by 2002:a05:6a00:21ce:b0:736:b101:aed3 with SMTP id d2e1a72fcca58-74827e52515mr3871596b3a.1.1749203596766;
        Fri, 06 Jun 2025 02:53:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749203596; cv=none;
        d=google.com; s=arc-20240605;
        b=RufA88Hkeg07JZIkVlxUOzU0dyIz/MWIwKaMDf0xJG6tFJBRqshF8msH6YFfP98tR+
         /JbHExAJ2aKKEpW7biJ/wMmXY7NpXYec+Gqz4IgDH3IqBFyS3yQDTTMYk+r+FrB7nG6e
         mG4ZSal1KWrL6VivxhpkpCvRq22ZWB/iw10p8rDaCQSsXnqqtqtUpOw/4wYyEuUYGkYi
         fWPe8oh7pPud+ONGehYe6tEwSNzxwxO049opbqY6xXsGMK+XDgJwVzwonMQTewFzgM1A
         PnmdgkQxYfK2bT7kJT5FXF5YwLZmvPY8ctdVBJ2uWwt5g2F21G7l7BwrOI6qC00UyD6E
         ttCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=zyGGDdqKLGQ5Qjzh9tHsAmQaWbcXMWVth0sP35Y6J7U=;
        fh=JroDrzw0c2mv5dtfzuDCW9MiSNZISPsyv2KxR3cSBbg=;
        b=HbOnEAIyJwfVPTrQFg9xIoHMkqkBkAFgbAbpe1MUY8aAcB60Upd/qzaerq4nFHWLB6
         8j9ZNMUnr+roosuNhUf1/bmg686maSTuDcjTF0Qllbnl3VaSbFpPPNNYGVbpVjSevuVX
         ivSx/ONeh/jCzVSgfrTbgtjoptNOuVlcMs84276qVS7P57rOPxqybe6AGRUuegJ+E5tO
         v+GkLMBB0DyKaLi6ZdrIBHyimCHA7apFT8zrGjszX9ppdZc/DWz5l6/DojWwQUfWRsvz
         gi2An3zdLoDQrKAxh0An5KihRdXqx27/bc7bPNrl5fGQqOx0yzTotw3rzng4IzuoFhPL
         KrJQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=K9p37ZsD;
       spf=pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=akihiko.odaki@daynix.com;
       dara=neutral header.i=@linaro.org
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7482b06f3a1sor723504b3a.5.2025.06.06.02.53.16
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 06 Jun 2025 02:53:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=K9p37ZsD;
       spf=pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=akihiko.odaki@daynix.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1749203596; x=1749808396; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zyGGDdqKLGQ5Qjzh9tHsAmQaWbcXMWVth0sP35Y6J7U=;
        b=K9p37ZsDRDuyzN3HLjg0pCvO0BmtluoO3ZI9VYWMZp6l1edxRzf5/0l3SPNAk4ctdW
         lXFpJZclrQiYOLDwxX2yFHlul5O9+bcWj/A/X8y8JGat6wHjMdFGofZzMBpsfr0r/F1L
         zstGlyNIIgmaDF/J9N6lLwtUEM/pKpCgX/KejSSZpyao+zIeg6b16nSowA65iFb0Qtsl
         X5fylIF+oYPI+6v2v6YxhyWpsdzW0t8ZkiFYnZnarsCizY6opmcv5aR7ITYP5pwLL5fn
         1U0nEGDD9ZBLUVyE7oE0Q+pvRsmpG+kqZFdermNtPh2lfkzgLUVgt/HySXkphBZ2nKa0
         qeuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749203596; x=1749808396;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zyGGDdqKLGQ5Qjzh9tHsAmQaWbcXMWVth0sP35Y6J7U=;
        b=jpFlM7W19KkYbI4mOGCxWxBH03nVqEaoTzdPSIG5GH8IB+mBhoI98264+oGiLynylx
         Inau8AfytKPmuZVSaXO3tv01/UGCFH4cyOTLdfZqiI2+9pbH6XQfn6arGxNfsq2jy6He
         AvO37sUgKpHBx9wudCFzu8A6LJZhC2LhEVw3wjW/rNsNVS1lNeyHvvkR/xtxFr9uqZBp
         HeMvwxUA64+0fJgBwwNy60G+3qYEpZWkmcT4kSkWnnmAJ39dwZJBVW4qex63TUDjCqr0
         c83UQhnkBaN4Ipyy9oyZZb1uuu7ihox2CJ8M5ClWMBxmANfChAOGtalWaulIVUWYz66j
         Ks9g==
X-Gm-Message-State: AOJu0YxjfXOja4gwPNPdDz+j+RRk9Q22iyjxxHkSv5rrKKDzIfiXTpRX
	03WKiSQahQOrcCpiquaRiKnsoz0kOJ8x/pmzWyIkFuTiD2sRT4P4qZJvEwM+L6BIrhVrHe0J3MS
	ZwyNP
X-Gm-Gg: ASbGncvX6KhJjqMP7m0TlUAb18F1ZUI6Xbry/JKlgt2l4TX0HasPPko7qsSO8A/ga01
	i8mfi8K8vZdREqxt22OUgTjUe0Iqv71ng04MFMx9RR6L0/D2kdV2GAqflEy3FzZJFN4MA1PC2Eq
	L3NTqDyGtyBueHBb0p9irqRb8r/uGgYiWHQhu673aFG9kuMt+23B2nwB3cariZTx/0ivm+kmArX
	iLtxnQgYpBGARDP8R++zKCCrL72Kq+vOuGo2z/Odq0lfukaFS9ftiOg5aKfLHG9S7zfNN0bQN1Z
	w6PHBb6MtnSR5Mmg9EHSnEZEr+d/9Eqb1qDgklkIk6wgeGw686+8U7lvXqNyoB/2QNL6qTtAGC4
	=
X-Google-Smtp-Source: AGHT+IFsX2go6gkm4lPQgiZ5tXWGlQ94n5acYh72a0S9gWitYRJWlx9gQFkid5lkcAnZmv21gyXPGg==
X-Received: by 2002:aa7:888a:0:b0:746:2ae9:fc42 with SMTP id d2e1a72fcca58-74827f1260bmr4563595b3a.19.1749203596160;
        Fri, 06 Jun 2025 02:53:16 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from [157.82.203.223] ([157.82.203.223])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482af7b4b9sm937013b3a.71.2025.06.06.02.53.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 02:53:15 -0700 (PDT)
Message-ID: <a9574643-ec5b-4c8c-aff5-3660c6c701fb@daynix.com>
Date: Fri, 6 Jun 2025 18:53:10 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/17] tests/tcg: make aarch64 boot.S handle different
 starting modes
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Sriram Yagnaraman
 <sriram.yagnaraman@ericsson.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, Peter Xu
 <peterx@redhat.com>, Fabiano Rosas <farosas@suse.de>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Gustavo Romero <gustavo.romero@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Julian Armistead <julian.armistead@linaro.org>,
 Jim MacArthur <jim.macarthur@linaro.org>
References: <20250603110204.838117-1-alex.bennee@linaro.org>
 <20250603110204.838117-4-alex.bennee@linaro.org>
 <e037e38c-dd8d-4f65-b2d5-2629be5f6740@daynix.com>
 <874iwu372j.fsf@draig.linaro.org>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <874iwu372j.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: r6ypjP8ATk0X

On 2025/06/05 17:51, Alex Bennée wrote:
> Akihiko Odaki <akihiko.odaki@daynix.com> writes:
> 
>> On 2025/06/03 20:01, Alex Bennée wrote:
>>> Currently the boot.S code assumes everything starts at EL1. This will
>>> break things like the memory test which will barf on unaligned memory
>>> access when run at a higher level.
>>> Adapt the boot code to do some basic verification of the starting
>>> mode
>>> and the minimal configuration to move to the lower exception levels.
>>> With this we can run the memory test with:
>>>     -M virt,secure=on
>>>     -M virt,secure=on,virtualization=on
>>>     -M virt,virtualisation=on
>>> If a test needs to be at a particular EL it can use the semihosting
>>> command line to indicate the level we should execute in.
>>> Cc: Julian Armistead <julian.armistead@linaro.org>
>>> Cc: Jim MacArthur <jim.macarthur@linaro.org>
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>> ---
>>> v4
>>>     - drop post eret nops
>>>     - proper error string for EL0 error case
>>>     - clamp any invalid target EL value to 1
>>> v3
>>>     - create system stack so we _exit cleanly
>>>     - normalise EL string before compares
>>>     - catch when we start in a lower EL than we asked for
>>>     - default to EL1 when arg unclear
>>> v2
>>>     - allow tests to control the final EL we end up at
>>>     - use tabs consistently
>>>     - validate command line arg is between 1 and 3
>>> ---
>>>    tests/tcg/aarch64/Makefile.softmmu-target |   3 +-
>>>    tests/tcg/aarch64/system/boot.S           | 172 +++++++++++++++++++++-
>>>    2 files changed, 169 insertions(+), 6 deletions(-)
>>> diff --git a/tests/tcg/aarch64/Makefile.softmmu-target
>>> b/tests/tcg/aarch64/Makefile.softmmu-target
>>> index 9c52475b7a..f7a7d2b800 100644
>>> --- a/tests/tcg/aarch64/Makefile.softmmu-target
>>> +++ b/tests/tcg/aarch64/Makefile.softmmu-target
>>> @@ -68,7 +68,8 @@ run-plugin-semiconsole-with-%: semiconsole
>>>      # vtimer test needs EL2
>>>    QEMU_EL2_MACHINE=-machine virt,virtualization=on,gic-version=2 -cpu cortex-a57 -smp 4
>>> -run-vtimer: QEMU_OPTS=$(QEMU_EL2_MACHINE) $(QEMU_BASE_ARGS) -kernel
>>> +QEMU_EL2_BASE_ARGS=-semihosting-config enable=on,target=native,chardev=output,arg="2"
>>> +run-vtimer: QEMU_OPTS=$(QEMU_EL2_MACHINE) $(QEMU_EL2_BASE_ARGS) -kernel
>>>      # Simple Record/Replay Test
>>>    .PHONY: memory-record
>>> diff --git a/tests/tcg/aarch64/system/boot.S b/tests/tcg/aarch64/system/boot.S
>>> index a5df9c173d..8bfa4e4efc 100644
>>> --- a/tests/tcg/aarch64/system/boot.S
>>> +++ b/tests/tcg/aarch64/system/boot.S
>>> @@ -16,6 +16,7 @@
>>>    #define semihosting_call hlt 0xf000
>>>    #define SYS_WRITEC	0x03	/* character to debug channel */
>>>    #define SYS_WRITE0	0x04	/* string to debug channel */
>>> +#define SYS_GET_CMDLINE 0x15	/* get command line */
>>>    #define SYS_EXIT	0x18
>>>      	.align	12
>>> @@ -70,21 +71,172 @@ lower_a32_sync:
>>>    lower_a32_irq:
>>>    lower_a32_fiq:
>>>    lower_a32_serror:
>>> +	adr	x1, .unexp_excp
>>> +exit_msg:
>>>    	mov	x0, SYS_WRITE0
>>> -	adr	x1, .error
>>>    	semihosting_call
>>>    	mov	x0, 1 /* EXIT_FAILURE */
>>>    	bl 	_exit
>>>    	/* never returns */
>>>      	.section .rodata
>>> -.error:
>>> -	.string "Terminated by exception.\n"
>>> +.unexp_excp:
>>> +	.string "Unexpected exception.\n"
>>> +.high_el_msg:
>>> +	.string "Started in lower EL than requested.\n"
>>> +.unexp_el0:
>>> +	.string "Started in invalid EL.\n"
>>> +
>>> +	.align 8
>>> +.get_cmd:
>>
>> Please do not send a new version without addressing all comments for
>> the previous versions or at least noting there are unaddressed
>> comments:
>> https://lore.kernel.org/qemu-devel/7a76e746-9022-48cf-8216-775071e6d631@daynix.com
>>
>> Following the best practices in docs/devel/submitting-a-patch.rst will
>> ensure a smoother patch review. It is fine for me if you submit a new
>> version noting unaddressed comments, but some may disagree.
> 
> There is no style guide for assembler. I have made the strings
> consistently use the . prefix.
> 

Global symbols share the symbol space with C so the naming convention of 
C can be applied to assembly too.

I also pointed out it ".error" was prefixed with a dot probably due to a 
failed attempt to make it local. There is no point of following a mistake.

I don't see a reason to differentiate the string labels from the others 
either.

Regards,
Akihiko Odaki
