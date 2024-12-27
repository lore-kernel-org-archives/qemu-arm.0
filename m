Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp6252203njk;
        Fri, 27 Dec 2024 02:55:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHxJlGR9rdhM1htyMWvafoNBTyVOEpHz40BxP2z+QJqddwf8l9UxbM83I/6fBsrZRQlphgb
X-Received: by 2002:a2e:be06:0:b0:302:4147:6d21 with SMTP id 38308e7fff4ca-30468552157mr69816921fa.4.1735296943277;
        Fri, 27 Dec 2024 02:55:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1735296943; cv=none;
        d=google.com; s=arc-20240605;
        b=fatwa6cDGIQkAWksBhYzf6E2xHtAQAkxCTg3DDESQFdVU7ifAi2I4Af1ADXiYXLhBx
         RDC/KH0Gm4eFOP7uSg/MrQdyCSCCf/BeLNhNDeuDz6s7sNQzo8YGT3IuRYn8Eo60YXJS
         W4oqWwF0Jns+NKgodIH8xEx3QcCYyqLUh4MP9tX/c69iQSnkRRp6lv1MQ1FibMFxckW8
         7Q6mlJldqfdcJiXNzyNZGzHAdAzbiMDWoqO/DpLqs9d611pMLcsK8+Noj3Z75xYIhhov
         2+wBhzojBPx/K/S/8FdZ8kTMDAorw1hiIu8Jm3eG8I3wc+/QrP5gRDT1kFRXz5/rnKvC
         O2pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id;
        bh=g9op08Td8o8EZPiUT51UVoPBWIQbSv/w39KRTl/m9gY=;
        fh=Y99hNYMEdDibNdq83eWSEOA1UMJJ0O3PnhhybkEvyJk=;
        b=TZ7ka7gwoLTVGFguKCLetVuymIZvb/JnRzsUw0f91FyK1Px7v5L/nHUZSU7rPeeuyP
         nTYgmgBycQqGG9dRBpYs4pSBPSs8U74VoZCtCiZbBVA03VIfuY+L9uUTOd0pGTMAR1ri
         3pG8NjGB06wYSvzbXUutlBBCkcIyMbe3oafuafM/zviKe9oHV68aQzqeERIgh0IFQE7A
         xSrF8wNIGxwlRof4s2D/5G1fYXuSNqCtEDuNWpqqUdsZ8rrkhVHb5vrEtz6XpNvnrNel
         /CKqxLtKTmAvHf3Zrpj7Tq5jdKI1kE71DjEX4vk3u6aO8pWgasDTPqcHInwCJ8zNX51V
         6iaw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of tsogomonian@astralinux.ru designates 37.230.196.243 as permitted sender) smtp.mailfrom=tsogomonian@astralinux.ru
Return-Path: <tsogomonian@astralinux.ru>
Received: from mail-gw01.astralinux.ru (mail-gw01.astralinux.ru. [37.230.196.243])
        by mx.google.com with ESMTPS id 38308e7fff4ca-3045b0cccdbsi61397661fa.594.2024.12.27.02.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 02:55:43 -0800 (PST)
Received-SPF: pass (google.com: domain of tsogomonian@astralinux.ru designates 37.230.196.243 as permitted sender) client-ip=37.230.196.243;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of tsogomonian@astralinux.ru designates 37.230.196.243 as permitted sender) smtp.mailfrom=tsogomonian@astralinux.ru
Received: from gca-sc-a-srv-ksmg01.astralinux.ru (localhost [127.0.0.1])
	by mail-gw01.astralinux.ru (Postfix) with ESMTP id 3BE4B24B61;
	Fri, 27 Dec 2024 13:55:41 +0300 (MSK)
Received: from new-mail.astralinux.ru (gca-yc-ruca-srv-mail03.astralinux.ru [10.177.185.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-gw01.astralinux.ru (Postfix) with ESMTPS;
	Fri, 27 Dec 2024 13:55:40 +0300 (MSK)
Received: from [10.198.18.100] (unknown [10.198.18.100])
	by new-mail.astralinux.ru (Postfix) with ESMTPA id 4YKMpz4q5nz1h0CG;
	Fri, 27 Dec 2024 13:55:39 +0300 (MSK)
Message-ID: <e2773daa-f819-4b71-b5c7-7ff8efc8d6b6@astralinux.ru>
Date: Fri, 27 Dec 2024 13:55:28 +0300
MIME-Version: 1.0
User-Agent: RuPost Desktop
Subject: Re: [PATCH] hw/misc: cast nand_getio value to uint64_t
Content-Language: ru
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 sdl.qemu@linuxtesting.org
References: <20241226141626.28722-1-tsogomonian@astralinux.ru>
 <87msgikqkq.fsf@draig.linaro.org>
From: =?UTF-8?B?0KLQuNCz0YDQsNC9INCh0L7Qs9C+0LzQvtC90Y/QvQ==?=
 <tsogomonian@astralinux.ru>
In-Reply-To: <87msgikqkq.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-KSMG-AntiPhishing: NotDetected
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Envelope-From: tsogomonian@astralinux.ru
X-KSMG-AntiSpam-Info: LuaCore: 49 0.3.49 28b3b64a43732373258a371bd1554adb2caa23cb, {Tracking_arrow_text}, {Tracking_from_domain_doesnt_match_to}, new-mail.astralinux.ru:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;astralinux.ru:7.1.1, FromAlignment: s
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiSpam-Lua-Profiles: 190100 [Dec 27 2024]
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Version: 6.1.1.7
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.1.0.7854, bases: 2024/12/27 07:57:00 #26921502
X-KSMG-AntiVirus-Status: NotDetected, skipped
X-KSMG-LinksScanning: NotDetected
X-KSMG-Message-Action: skipped
X-KSMG-Rule-ID: 1
X-TUID: JY4oxxnpm9QZ

27/12/24 01:49, Alex Bennée пишет:
> Tigran Sogomonian <tsogomonian@astralinux.ru> writes:
>
>> s->buswidth = nand_flash_ids[s->chip_id].width >> 3;
>> <= 16 >> 3 <= 2.
>> x <= s->ioaddr[offset] << (s->buswidth << 3)
>> <= max_uint8_t << 16
>> With x << 24 overflow is possible.
>> Other cases are similar.
>> Thus, need to cast return value to uint64_t.
>>
>> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>>
>> Signed-off-by: Tigran Sogomonian <tsogomonian@astralinux.ru>
> This code was removed in 192f75ad11 (hw/misc: Remove omap_gpmc)
Yes, I saw that upstream master doesn't have this code, but some users 
use stable-9.1. I suggest adding these changes not to the main branch, 
but to the stable-9.1 branch.
