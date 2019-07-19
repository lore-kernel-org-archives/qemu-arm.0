Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp3552386wrv;
        Fri, 19 Jul 2019 05:59:13 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx24IKJBe2I4sFd7Fud8W8Lo0tNKnpa4CZwigJ58CYpV8/AZnSseXvhGgaKIgbAglSgaOEa
X-Received: by 2002:a17:906:cce9:: with SMTP id ot41mr12000392ejb.196.1563541153696;
        Fri, 19 Jul 2019 05:59:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563541153; cv=none;
        d=google.com; s=arc-20160816;
        b=Sq71K7Zu+V4+NKqn44F0NaW+N9qVTxOkcsYP12jMwe9DggbtTVyZUxvQxhOCvSm6P+
         GNiWw+uZcAM4g4wkzbvHoxE0JsyimipfuJPUnqnNeMH+wAF1NvOA/PR3jE3Nh0iALd13
         mITO1sgdnpe7ZwX+uD/aNUuW2bVUfG5tbYBiVxWjaJ+/TQnTMpfQOfziVR01eorNzWiY
         IRL/XHGK3d8vlgtqf/lzFLORU8q9sUNEIc4y0rZLpuqIaviOPZD4OI1bMutN5GmJC/pA
         MNdcI8VbAkxgUJV1RaZ37cD7AqbWqpA0fDoTuoR1OQK9Gv3ruAUiFe1WODuFSVJx0CbF
         ZzcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=4B4nQdZGDsRrXe5YRYbfuq/NMdgbXHtZKN6m44/KPps=;
        b=mvXQIY1R4uprjInBiF2tZpkLP0git+653EU/8Wn8onGz7qJ2Sva2qPZFOCO4lpCEDC
         9Vy5h3UYpDnpKWA3WJfeYKv9uLZzlIW6z0W1YGyIoC6R/50mdYYvZnEEkhhEPOvqsntR
         VzA97CUX1xTuO6TGmKQskGnIDYmYfGCWeiRoQMH9mq0xk1OIXdWl23Kw26OboGD6fn2Z
         Xy59SOFqyqLG0lfuUhztM9wJSM5U1pilrP7eHIFlMSdP8tIbfLRJdejefUgBZCtXgQkz
         H0J0QEvpDTrJOO7KcuAXMa0tlMJ38HvsaQpDskVZr4795aEnKIL9WYNLUNYL+FtK3rDB
         AiCg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z2si326021edz.118.2019.07.19.05.59.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jul 2019 05:59:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hoSTg-00080g-Gh
	for alex.bennee@linaro.org; Fri, 19 Jul 2019 08:59:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56937)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hoSTc-0007zu-6m
 for qemu-arm@nongnu.org; Fri, 19 Jul 2019 08:59:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hoSTb-0005pp-5a
 for qemu-arm@nongnu.org; Fri, 19 Jul 2019 08:59:08 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:41469)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hoSTa-0005oy-Ux
 for qemu-arm@nongnu.org; Fri, 19 Jul 2019 08:59:07 -0400
Received: by mail-wr1-f66.google.com with SMTP id c2so28983550wrm.8
 for <qemu-arm@nongnu.org>; Fri, 19 Jul 2019 05:59:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4B4nQdZGDsRrXe5YRYbfuq/NMdgbXHtZKN6m44/KPps=;
 b=FY4yI/4FhQTPt1a8EdxJa/pkVropOovhmjbyf9mLJX9lGuDr0jQGW/P6c5RX76Bew4
 6D/Jz1H07hcwROMMBcQxBMQWtzYqdWrrHxH85nN2PWBm7PNtv/II3rDDpzJBrOP++xFh
 6kw3hv5rANZsvZ31RpIKhk0XjfLu8hm4JfZGQAWm53VM9Flf+CQXDqb6z5RUqUuwp4tg
 sak4NcR4bCNXmGBG0LtKRlg+M27uvqvwIaqiMrOijMbaIpL3CNKjKX1Dri7iA7A8sgzw
 oR8/UdCVR9ZJ3+vhi4m5m0V2bslOL83UJEMJNPAJ5dnq1ABwbBB2d0qK0Yceummeu6fm
 VjSw==
X-Gm-Message-State: APjAAAU5QjVlRFuIfyL2mQDaVVGyqhWddOic6cxicOFDa2ibdCY5cVLr
 +os6ThLMaeo4Y2YWEFnEFfvYIg==
X-Received: by 2002:a5d:540e:: with SMTP id g14mr9513693wrv.346.1563541145794; 
 Fri, 19 Jul 2019 05:59:05 -0700 (PDT)
Received: from [192.168.1.37] (62.red-83-42-61.dynamicip.rima-tde.net.
 [83.42.61.62])
 by smtp.gmail.com with ESMTPSA id v4sm25441083wmg.22.2019.07.19.05.59.04
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Fri, 19 Jul 2019 05:59:05 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20190719111451.12406-1-philmd@redhat.com>
 <CAFEAcA92mCp6WYb5wVEYbVNEFkPb9TwpedjNwj4SdS9Mb_rNtw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <fb3221bd-3cfd-ebd7-9a80-3f531769fef4@redhat.com>
Date: Fri, 19 Jul 2019 14:59:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA92mCp6WYb5wVEYbVNEFkPb9TwpedjNwj4SdS9Mb_rNtw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.66
Subject: Re: [Qemu-arm] [PATCH-for-4.1] target/arm: Add missing break
 statement for Hypervisor Trap Exception
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 014sO0U8wa+s

On 7/19/19 1:47 PM, Peter Maydell wrote:
> On Fri, 19 Jul 2019 at 12:15, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>
>> Reported by GCC9 when building with  -Wimplicit-fallthrough=2:
>>
>>   target/arm/helper.c: In function ‘arm_cpu_do_interrupt_aarch32_hyp’:
>>   target/arm/helper.c:7958:14: error: this statement may fall through [-Werror=implicit-fallthrough=]
>>    7958 |         addr = 0x14;
>>         |         ~~~~~^~~~~~
>>   target/arm/helper.c:7959:5: note: here
>>    7959 |     default:
>>         |     ^~~~~~~
>>   cc1: all warnings being treated as errors
>>
>> Fixes: b9bc21ff9f9
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  target/arm/helper.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/target/arm/helper.c b/target/arm/helper.c
>> index 20f8728be1..b74c23a9bc 100644
>> --- a/target/arm/helper.c
>> +++ b/target/arm/helper.c
>> @@ -7956,6 +7956,7 @@ static void arm_cpu_do_interrupt_aarch32_hyp(CPUState *cs)
>>          break;
>>      case EXCP_HYP_TRAP:
>>          addr = 0x14;
>> +        break;
>>      default:
>>          cpu_abort(cs, "Unhandled exception 0x%x\n", cs->exception_index);
>>      }
> 
> I think this is right, but EXCP_HYP_TRAP is a bit odd -- we appear
> to use this only for the case of "SMC instruction is trapped from
> NS EL1 to EL2 by HCR.TSC". I was expecting more traps-to-EL2
> to use this EXCP_ variable... Mostly we seem to use EXCP_UDEF,
> eg for CP_ACCESS_TRAP_UNCATEGORIZED_EL2 coprocessor/sysreg accesses:
> this has the same behaviour as EXCP_HYP_TRAP as long as we know
> we are going from an EL below 2 to EL2. Which I think we could
> also use in the one place we use EXCP_HYP_TRAP; or we could make
> wider use of EXCP_HYP_TRAP, since feeding everything through
> EXCP_UDEF is rather confusing.
> 
> Anyway, for 4.1 we should do this.
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Thanks, if you take this I forgot to mention:
Reported-by: Stefan Weil <sw@weilnetz.de>

Regards,

Phil.
