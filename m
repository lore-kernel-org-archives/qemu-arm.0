Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp170540njb;
        Tue, 4 Feb 2025 04:25:29 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU+Si5Lh/QdHBYMPUEIZNBmsgeNy7WS/uOg+/8MYs+pZJh3I7oeRthplsZq1NClsQQsfonGHw9A+VQ4tA==@linaro.org
X-Google-Smtp-Source: AGHT+IFRnr8oWpuXGQhfJWCcfvuCgHSKFIwjBCDohl2aSSBG559C7B6WVZBGTyyrKCWVM6XobYyp
X-Received: by 2002:a05:620a:3d94:b0:7c0:34d0:d501 with SMTP id af79cd13be357-7c034d0e820mr97792285a.22.1738671929005;
        Tue, 04 Feb 2025 04:25:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738671928; cv=none;
        d=google.com; s=arc-20240605;
        b=ctT8EIC5UFQC2MXoMMa6cEEw3RcQkbyQ+Gk7aBa2LjakRYWjzBkGEJn4K1fMObAZL7
         bgwskbk6Z5Kr85QB01MGgz2sEFTXjViJvD0qkrfQ3drQC2Pm6bwFC0ayNvqwjHkq6/or
         gZjkTqO/xaDXK7IDn9K/RCUEuhWc4sJNISDlrns3ze6gwLHQf7LTRE6xULLtaI/QWoeg
         g+nNHhK/dH9kEC84apCrBA+KjWEoTZ+1u5/Qvt8Va2nDtG/BNgeI/5Fdf+BT4VgB3fqj
         +yHHVu4pe2mTo73Xqp48Ei9JcW4AAM5iQjzHbdOcn2mDfc7Le51LwW4mnj3TKD4Axyev
         NXqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:content-language:references:to:subject:from:user-agent
         :mime-version:date:message-id;
        bh=7vhynPI7w2YYA+0g9smLzYdqKhcFPJMRHfxQ11Zn+j0=;
        fh=+/qF9KWG+OpR88Kaiggvtpqr888kig7UghiUWIBSM8w=;
        b=SR7U4hECpBviY1ZoRWMAjhVC7G9PmW9NCpSf8pxLiSrQOyHbOO9HZ0cFlG1gMdBp+D
         K3IsBloaUpJ6/hng/CBOy0YtARHvcVW/FforWUFK65ae4d4fAJ3XRUcs5aUUmPRz9kaz
         H6xMvBA7q/Vzv0c9608AF3On6YdGDKkUUfS1hBPasQMmDQbZCNjfsh7fC9T82BccgmBM
         4Ax2dSPmnMBoM367pk8K2AqOLaH9YYGJOcha/QuUo7jn1T6Tk5bViH8rSNvM6i+A7gRT
         4/xev0+F1ZM7Jh8Cjk427dyX7mkKx+FhPYEy79NIn6dW4UGa0BjyOQBlSOIYNg8yJSXJ
         EnVw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c02dbdc829si255462185a.320.2025.02.04.04.25.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Feb 2025 04:25:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tfHzI-0001F5-Qb; Tue, 04 Feb 2025 07:25:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsogomonian@astralinux.ru>)
 id 1tfHzG-0001E4-Uj; Tue, 04 Feb 2025 07:25:06 -0500
Received: from mail-gw02.astralinux.ru ([195.16.41.108])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsogomonian@astralinux.ru>)
 id 1tfHzE-0002G4-J2; Tue, 04 Feb 2025 07:25:06 -0500
Received: from gca-msk-a-srv-ksmg02.astralinux.ru (localhost [127.0.0.1])
 by mail-gw02.astralinux.ru (Postfix) with ESMTP id ADD691F9D0;
 Tue,  4 Feb 2025 15:25:00 +0300 (MSK)
Received: from new-mail.astralinux.ru (gca-yc-ruca-srv-mail05.astralinux.ru
 [10.177.185.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail-gw02.astralinux.ru (Postfix) with ESMTPS;
 Tue,  4 Feb 2025 15:24:59 +0300 (MSK)
Received: from [10.198.25.85] (unknown [10.198.25.85])
 by new-mail.astralinux.ru (Postfix) with ESMTPA id 4YnMy21y05z1c051;
 Tue,  4 Feb 2025 15:24:57 +0300 (MSK)
Message-ID: <168e8cc1-ef0a-4894-84e1-7a2b9fc60c3c@astralinux.ru>
Date: Tue, 4 Feb 2025 15:24:57 +0300
MIME-Version: 1.0
User-Agent: RuPost Desktop
From: =?UTF-8?B?0KLQuNCz0YDQsNC9INCh0L7Qs9C+0LzQvtC90Y/QvQ==?=
 <tsogomonian@astralinux.ru>
Subject: Re: [PATCH v2] hw/misc: use extract64 instead of 1 << i
To: Richard Henderson <richard.henderson@linaro.org>,
 peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 sdl.qemu@linuxtesting.org
References: <20241227104618.2526-1-tsogomonian@astralinux.ru>
 <8ff6dac5-067a-430e-90c2-67e07ba221a2@linaro.org>
Content-Language: ru
In-Reply-To: <8ff6dac5-067a-430e-90c2-67e07ba221a2@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-KSMG-AntiPhishing: NotDetected
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Envelope-From: tsogomonian@astralinux.ru
X-KSMG-AntiSpam-Info: LuaCore: 50 0.3.50
 df4aeb250ed63fd3baa80a493fa6caee5dd9e10f,
 {Tracking_from_domain_doesnt_match_to}, new-mail.astralinux.ru:7.1.1;
 astralinux.ru:7.1.1; d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;
 127.0.0.199:7.1.2, FromAlignment: s
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiSpam-Lua-Profiles: 190776 [Feb 04 2025]
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Version: 6.1.1.7
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.1.0.7854,
 bases: 2025/02/04 11:12:00 #27207681
X-KSMG-AntiVirus-Status: NotDetected, skipped
X-KSMG-LinksScanning: NotDetected
X-KSMG-Message-Action: skipped
X-KSMG-Rule-ID: 1
Received-SPF: pass client-ip=195.16.41.108;
 envelope-from=tsogomonian@astralinux.ru; helo=mail-gw02.astralinux.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: qGI/uGY56953

27/12/24 18:16, Richard Henderson пишет:
> On 12/27/24 02:46, Tigran Sogomonian wrote:
>> 1 << i is casted to uint64_t while bitwise and with val.
>> So this value may become 0xffffffff80000000 but only
>> 31th "start" bit is required.
>> Use the bitfield extract() API instead.
>
> Again, I < 32.  There is no overflow.  The type of value is irrelevant.
>
s->num_leds maximum MPS2FPGAIO_MAX_LEDS (32). For bitwise AND,
the result of shift 1 << i will be converted to uint64_t because
value is of type uint64_t (integer promotion) and for i = 31 instead of
the expected 0b10000000000000000000000000000000  we get 
0b1111111111111111111111111111111100000000000000000000000000000000.
Need to be corrected to value & (1U << i).
>
>>
>> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>>
>> Signed-off-by: Tigran Sogomonian <tsogomonian@astralinux.ru>
>> ---
>>   hw/misc/mps2-fpgaio.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/misc/mps2-fpgaio.c b/hw/misc/mps2-fpgaio.c
>> index d07568248d..04a3da5db0 100644
>> --- a/hw/misc/mps2-fpgaio.c
>> +++ b/hw/misc/mps2-fpgaio.c
>> @@ -198,7 +198,7 @@ static void mps2_fpgaio_write(void *opaque, 
>> hwaddr offset, uint64_t value,
>>                 s->led0 = value & MAKE_64BIT_MASK(0, s->num_leds);
>>               for (i = 0; i < s->num_leds; i++) {
>> -                led_set_state(s->led[i], value & (1 << i));
>> +                led_set_state(s->led[i], extract64(value, i, 1));
>>               }
>>           }
>>           break;
>
>


