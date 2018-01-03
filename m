Received: by 10.223.134.117 with SMTP id 50csp12447864wrw;
        Wed, 3 Jan 2018 14:35:46 -0800 (PST)
X-Google-Smtp-Source: ACJfBothqfGQCLqc0OmDWssiE+V/j1O8dqhIk7N9S1JgeP6LdcU0mz4so6G6bFAqUk9hRvOCjVgn
X-Received: by 10.13.245.65 with SMTP id e62mr2680408ywf.319.1515018946031;
        Wed, 03 Jan 2018 14:35:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515018946; cv=none;
        d=google.com; s=arc-20160816;
        b=UtETEQnaPscrd2njfjOefmRgd30QYkJNnhLR/DcVIgvMyA8nwN7msFC4oDL4KlWuAJ
         8jUnILzft0Ie03Se2shN2eBrLxSO/1T4wr80+7zqLs7VsdIBnfmzvBQR3mbE0rO/hshw
         MPYwck5KazgLefhKuS23ZjcWr2HlNKuuZMt7Je4V+/y/qoYR2vmkIawnOIPI1evqtTNc
         aYpOmoJwJjmxAI0vYc5fKLB/0662aod9XZtDZ/hrbthfMub/rA1JN+yZ/z+8DI8QKtFq
         tMPniWZesqYuUHVrfi6beWisCey8vURRrkUGd/yZmxpnFJr4pPxS0yTObaoQW1rLSFTr
         1pmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=A3XC7hCec2b6YExsvCpQR8tQcIVm+Jo6AKTkFxIJFxU=;
        b=Rym49t/JhTmdUc7gRtypDWJ+/wKyec7zfvkjKwkci8am9xlU2xTyqtfXmdPeo7qtFE
         uY7W8nUkx3zv86Xghx7dgJI9BSQ0mHZ8yDANki5M07XfwwHTW3Vcx6d04ly6H1z5bk6p
         kTjHlPwI0KcMhnIrS7fJlnUNRukiWEhJneGXcSgdKCHXCjkcURHKRRI33q1d4JDqu3Nw
         wVHIF/M0FFRHioM6dtwn25QeclzhiW6YCyGw6KfU3Wo5/1SvUo/sy2JBeaWtMPtMBGZu
         EUgxTjxJv5CsSF3UmpE/XZNom/lofFABgtFSC7H9HhjdZppPVjJx6MRd7dlwqiah1B34
         NDbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=lPGd3XZv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f7si418108ybj.373.2018.01.03.14.35.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Jan 2018 14:35:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=lPGd3XZv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39719 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eWrdR-0002gr-Fn
	for alex.bennee@linaro.org; Wed, 03 Jan 2018 17:35:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52207)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eWrd9-0002fL-Gv
	for qemu-devel@nongnu.org; Wed, 03 Jan 2018 17:35:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eWrd6-0001C2-MH
	for qemu-devel@nongnu.org; Wed, 03 Jan 2018 17:35:27 -0500
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:43282)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eWrd6-0001BR-HU; Wed, 03 Jan 2018 17:35:24 -0500
Received: by mail-qt0-x244.google.com with SMTP id w10so3974325qtb.10;
	Wed, 03 Jan 2018 14:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=A3XC7hCec2b6YExsvCpQR8tQcIVm+Jo6AKTkFxIJFxU=;
	b=lPGd3XZvqesP0TS0u0In943O98R2qU8cVh+0CnBECrdK1r2yeqX2jvviRYznEzzPb+
	CrbQnt1ccwnJTLPytpVPhK1FlaiKMIy2+1woDXISqad3jqI99APrk/YgxzJRr8GL3NZd
	xpGkVfyt3M7/tZQIJJQl9LpoRAf84TuYMiZa8fMWpWZnYddnZG5Uo/RZA/bWrlcpugLT
	Q+/OSh8Ib535echqJKE4g6sZat2Kwilbt59kz38gVbct/QyHoWq3ImEKGrzWsaYWua+V
	HbBUqyXTK/bWRV6A7GLlibpU9Xe7zCQihR7/ighXxHlQgu9Csi2sfG6oiRR/sz7Y3Q3h
	1GLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=A3XC7hCec2b6YExsvCpQR8tQcIVm+Jo6AKTkFxIJFxU=;
	b=DIVghA/L4RiNIUufzcrCnCCgRGixBjYWIuGkLxGNGHYSBRflir+m4hlWAPiZ3aoQZW
	JxzsNkMRKggKbDnw/wXf11GfQA0rZeUFY6rXco7paU5ZbmROriDyh42IiobzkPDPZrhS
	/3HMKORgMMz8r8V/IFUqFZ1YyxvypizkGMLrm8Xt41As2mx9InjsDy8KpA8qjeo7WI86
	G7gndKptVBxEgQXXkrBM/j0mU9d4QWlgwL97qgovaoO4Nf2B8Beh23OKWvvd/TyliqLC
	NSG9iOzTijLH80f5MOJisZGR6E9gjlX6PWc8Igts+TzljUVsOtVRLYic08hBJhgljDTF
	mlnQ==
X-Gm-Message-State: AKGB3mJ4nt/kepg4TxNHTCGLKD8iB8X+zSDqAYB5gEe0FT4phRNxyF86
	5MzOT33Jg5VAaKOcNxopHoxHSg7H
X-Received: by 10.200.25.78 with SMTP id g14mr3932730qtk.119.1515018923827;
	Wed, 03 Jan 2018 14:35:23 -0800 (PST)
Received: from [192.168.1.11] ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id
	q13sm1258273qta.22.2018.01.03.14.35.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Jan 2018 14:35:23 -0800 (PST)
To: Alistair Francis <alistair.francis@xilinx.com>
References: <20180103164117.11850-1-f4bug@amsat.org>
	<20180103164117.11850-2-f4bug@amsat.org>
	<CAKmqyKM8mmx3g+6Qonr8NQTBi=YLk7KoGyAvzO_46j5VkZEBVA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <3a2d27d2-b76b-04c5-beca-25fc2f3dd13a@amsat.org>
Date: Wed, 3 Jan 2018 19:35:21 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <CAKmqyKM8mmx3g+6Qonr8NQTBi=YLk7KoGyAvzO_46j5VkZEBVA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: Re: [Qemu-devel] [PATCH 1/2] hw/timer/pxa2xx_timer: replace
 hw_error() -> qemu_log_mask()
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AaQ2pbmt+uzi

On 01/03/2018 06:53 PM, Alistair Francis wrote:
> On Wed, Jan 3, 2018 at 8:41 AM, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  hw/timer/pxa2xx_timer.c | 13 +++++++++++--
>>  1 file changed, 11 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/timer/pxa2xx_timer.c b/hw/timer/pxa2xx_timer.c
>> index 68ba5a70b3..cfea0a5e22 100644
>> --- a/hw/timer/pxa2xx_timer.c
>> +++ b/hw/timer/pxa2xx_timer.c
>> @@ -13,6 +13,7 @@
>>  #include "sysemu/sysemu.h"
>>  #include "hw/arm/pxa.h"
>>  #include "hw/sysbus.h"
>> +#include "qemu/log.h"
>>
>>  #define OSMR0  0x00
>>  #define OSMR1  0x04
>> @@ -252,8 +253,12 @@ static uint64_t pxa2xx_timer_read(void *opaque, hwaddr offset,
>>      case OSNR:
>>          return s->snapshot;
>>      default:
>> +        qemu_log_mask(LOG_UNIMP, "%s: unknown reg 0x%02" HWADDR_PRIx
>> +                      "\n", __func__, offset);
>> +        break;
>>      badreg:
>> -        hw_error("pxa2xx_timer_read: Bad offset " REG_FMT "\n", offset);
>> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: incorrect reg 0x%02" HWADDR_PRIx
>> +                      "\n", __func__, offset);
> 
> It might just be my email display, but if these lines don't line up
> can you fix them?

My guess is your email display is correct but my eyes are tired :S

> 
> Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Thanks!

> 
> Alistair
> 
>>      }
>>
>>      return 0;
>> @@ -377,8 +382,12 @@ static void pxa2xx_timer_write(void *opaque, hwaddr offset,
>>          }
>>          break;
>>      default:
>> +        qemu_log_mask(LOG_UNIMP, "%s: unknown reg 0x%02" HWADDR_PRIx " "
>> +                      "(value 0x%08" PRIx64 ")\n", __func__, offset, value);
>> +        break;
>>      badreg:
>> -        hw_error("pxa2xx_timer_write: Bad offset " REG_FMT "\n", offset);
>> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: incorrect reg 0x%02" HWADDR_PRIx " "
>> +                      "(value 0x%08" PRIx64 ")\n", __func__, offset, value);
>>      }
>>  }
>>
>> --
>> 2.15.1
>>
>>
