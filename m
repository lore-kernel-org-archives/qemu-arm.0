Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp1638223njc;
        Wed, 21 May 2025 22:37:51 -0700 (PDT)
X-Received: by 2002:a05:6a20:12c3:b0:1f5:6c94:2cd7 with SMTP id adf61e73a8af0-216219f81dcmr33308039637.42.1747892270771;
        Wed, 21 May 2025 22:37:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747892270; cv=none;
        d=google.com; s=arc-20240605;
        b=SYu9POtS4PYrPMVwzGUT2Rc7cGNk/495jcur8W+PIVrVs768Bh2BhDy0hlmnzVhR9L
         9+bXjUwjfzfBy9et8Rem2In0ltXWJ8m9NI4klMdtWAh3xwIPk9/oF7ZD1n2kuwuI2Xw4
         S7LwKAjy/ip0wIaB5gwNKmYtlXK3BDjcMjlY9Mi6sS6Th2pcJ810m1jeYm1IaKJpWjFW
         f2tIo8Ax4oLGMUYvVZtAHCJU7RWw4fFUjpeh8lAtur1Nxa5amTZO88M1o9gTcKP7k7Tq
         9zGqJBSz4v9WXfHEG7ERQ9+ncmH7NupDmi3Ix5qEpH4jzEMDmjvy2y+4+3Ht4PPuB598
         muOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=D/WW7gFMS5n6X9DhlmFAqeQexSMZm71tGcMm/uNUx/E=;
        fh=0BpcUhEAu/ygqO2hQQNVjK8pf3EEaf00vml9Hn/yKkw=;
        b=CveYQb2bbEeCrVlSvHqtJr7BZt+lr05NCI8FTh/q6Acyo677DTVceWAqBYbs34bgrR
         d3iX2wc8UtnC6Vh5zgSqp4YLfz8M396+EIKnZ2FX5TNmhZRl6KoJDMJfnn7eeE9GzPYZ
         ECtmmA98TYQfKgCGp4CMic7kmzjpyr/I4MB3pmemWoQHSay3QSoMwKWlgUw3uJypVGdh
         rSPrR/a2chX4FAcA53WMekPLICKiEEYoU7S9q1B1y+ao1ZaBv4NWWdJyXJUPq6W9EXBT
         +wk7HMe288FrqFPid5O5FTxvjBFT2AKNNBjNi5HUMFccIe9zuQpm0imA+b/18YvIVnlB
         oaig==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=U2TC47bZ;
       spf=pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=akihiko.odaki@daynix.com;
       dara=neutral header.i=@linaro.org
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-742a985b24fsor8217371b3a.10.2025.05.21.22.37.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 21 May 2025 22:37:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=U2TC47bZ;
       spf=pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=akihiko.odaki@daynix.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1747892270; x=1748497070; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D/WW7gFMS5n6X9DhlmFAqeQexSMZm71tGcMm/uNUx/E=;
        b=U2TC47bZEo//1s9kJ0PRRYOGan+Ti3T8Czkpw6DgwTo6ydWWWckH820u6jWIolkds1
         sZusOWoTXtPnhk8EO4tLzR5zOA5IqCXxKkqzoIeQCv42sUYVlIiSQ0erlUlusgOlQuDZ
         mFQ5Hno2hjVH8czwuuMMYkAUPy1GDUqu0IVzy4tRKFYgE8UJGWC69IhewG6W4LlZOOEH
         nQ4elKyxPyNqok76sBO7TyL+nATFmknqEQLV5kZ2mmftAVIV+nULz65hj9Jl5MU5OtbD
         VkilrOtrRIpQhCjlod6XJOlSWsUjwDE8QmDu4jTiCtLM5iIUWuJ6yVAI5U1BCCPzMfYE
         koWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747892270; x=1748497070;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D/WW7gFMS5n6X9DhlmFAqeQexSMZm71tGcMm/uNUx/E=;
        b=q6KT7IuvjB5j2ktnPK6Q+t7h2IcMS+UUh/wse/TQgHtnyQlpHHmr1GahNedA1sLTnB
         jbswNS5925xqyRQphClmJ1hlO8NuzQzRegxsvppsDglz0+3crkuAIi5U2X1I61P0jD7m
         Y5SIiggGe6xs+aD9wto3jR0KhoyQxvGeczlCf7mHwqvyq2VxXchad7189wDRo6SlR1K+
         Cd0gnvpAYX11GIEU2K3/OK3iPNKM+oo2ZyFcG8EGEkVlM6pDEGoPk7s2ks/5+A+luo0f
         JSvZjDSA8dfuMlBiqBNF4Sf4Hj4zi58TCh+SImKYOK0IHJUBGr+JWh+VRLxPwoi/cumJ
         zo9w==
X-Gm-Message-State: AOJu0Yzm11YiMdDXsVXWid769/7C7M7GZy+ZgHOLlWiP7bBmYsFdfKGh
	1Lj3vealGyH5YChaPPFJeK2oDGARqCt9ihcB6rlFx6etYYG8NSHm2Xje+y7TOybh7Qp4dPA4QbS
	OWauX
X-Gm-Gg: ASbGncvVh+9uyXO2+qo/Ma1M8+gI7dXxkMlifzERyyRCkG0Apj7XpmNnXYU7+swcMpn
	7jvpFYMYGOP0hhLotSpWaio1bdIyjbsk//RGBI+878GGtDmZlDaPzDbrlzVl7rYiOOAKIC8dBQB
	s+ijYvLBEhXhI05O03Zwf7O3zJxzzb7pnA1NYS4FrTY92n2Yap0zV7kqp7S6DCzI4Y0nRIvVHNF
	FCgeafMWV+sQvOWckjfBqUpOMHTauN37ouiv6OM2yZPZ2FJyqDUNej5dkPmMEsdFOGHZ1pmUHF+
	rbFzCnVGWQ7uKv5loNbiBwF7l5gyQ28PV9PXiVCAzrlcKHm//WuHZXUFJaj83w==
X-Google-Smtp-Source: AGHT+IEOYM57uiObFmkje+0PJRJ03xAWB9mXFfxxWST0ML3udBCH2luGW74caFQtW0DbVY986bg0pA==
X-Received: by 2002:a05:6a00:3d4d:b0:742:3fb4:f992 with SMTP id d2e1a72fcca58-742a97c3f4dmr30575214b3a.10.1747892270067;
        Wed, 21 May 2025 22:37:50 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from [10.100.116.185] ([157.82.128.1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9876e62sm10779205b3a.147.2025.05.21.22.37.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 22:37:49 -0700 (PDT)
Message-ID: <15677d5c-cd86-4d75-a21e-0c011800cd55@daynix.com>
Date: Thu, 22 May 2025 14:37:44 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/20] tests/Makefile: include test-plugins in per-arch
 build deps
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@linaro.org>,
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
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20250521164250.135776-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: q3sE2M5awJV+

On 2025/05/22 1:42, Alex Bennée wrote:
> The user can run a subset of the tcg tests directly, e.g.:
> 
>    make run-tcg-tests-hexagon-linux-user
> 
> but in this case we fail if there has not been a full build to ensure
> all the test-plugins are there. Fix the dependency to ensure we always
> will build them before running tests.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/Makefile.include | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/Makefile.include b/tests/Makefile.include
> index 23fb722d42..7f7f62cbf6 100644
> --- a/tests/Makefile.include
> +++ b/tests/Makefile.include
> @@ -46,7 +46,7 @@ $(foreach TARGET,$(TCG_TESTS_TARGETS), \
>           $(eval $(BUILD_DIR)/tests/tcg/config-$(TARGET).mak: config-host.mak))
>   
>   .PHONY: $(TCG_TESTS_TARGETS:%=build-tcg-tests-%)
> -$(TCG_TESTS_TARGETS:%=build-tcg-tests-%): build-tcg-tests-%: $(BUILD_DIR)/tests/tcg/config-%.mak
> +$(TCG_TESTS_TARGETS:%=build-tcg-tests-%): build-tcg-tests-%: $(BUILD_DIR)/tests/tcg/config-%.mak test-plugins

I don't think this is going to work.

test-plugins will invoke run-ninja, which is defined as follows:

run-ninja: config-host.mak
ifneq ($(filter $(ninja-targets), $(ninja-cmd-goals)),)
	+$(if $(MAKE.nq),@:,$(quiet-@)$(NINJA) $(NINJAFLAGS) \
	   $(sort $(filter $(ninja-targets), $(ninja-cmd-goals))) | cat)

$(ninja-cmd-goals) should contain test-plugins, but it doesn't if I 
understand it correctly.

>   	$(call quiet-command, \
>               $(MAKE) -C tests/tcg/$* $(SUBDIR_MAKEFLAGS), \
>           "BUILD","$* guest-tests")
