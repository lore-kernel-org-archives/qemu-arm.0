Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp845524wrq;
        Fri, 22 Jun 2018 06:39:03 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcnCyQ9FC8+twUjmXrnjbM9PqCo/brLk9ZxGBTuq1ZlqZJgiPqc7dYQ0qqQfef0RyR3w3dc
X-Received: by 2002:a0c:d205:: with SMTP id m5-v6mr1452516qvh.144.1529674742976;
        Fri, 22 Jun 2018 06:39:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529674742; cv=none;
        d=google.com; s=arc-20160816;
        b=Didmn/ebAvjalFJ/Sh4EMFO3DsKJYvxW26UtZ+wh4ZgOuMmOPDfwcmcw53pNH102kI
         +qRyjCfkkDCR9pdQoj6SrqEgJ2xfH7pouiib76h401rkApNHPvyrkhyHs8UhUA6eiblt
         xN2R2SJjcQQFLBjnlzk6QCMQUYoku7eC7GyBEqExXpzOyW3TYrYNbUugoEQAeNGDbjVG
         GOi2lQL+3vqYM90J1hQUsapkYmR8PtmL704kNqnxMofR9zpU5OFJWPCUBvDM2z4dHAjk
         M8kS0A69CnHbT50sEl5kr2Xgy8M7Dpz5eN5Dm0zaEtR3xjRnrbwztv7srwix8qyylvkK
         RcCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=WokhsUVBbzAkqKpAEJ747jLaGMR2KkSvBeDZftg7QiI=;
        b=n1Himr3m53KQr491Z2GPqC/9i+8e8OKYhFz1mwGSUutXvXeco7PlogrglDn7exQCAs
         1VaLbu7WwAgQw3wVxSLqlSma7haWWIlH1T2eaq0pS6jtzazmZrtWuKm2zADR+hctysrm
         ACb8Lxu1H3KlGpstmoCeD/cFLapLb/cFQslATOvS1hKy72hWBvS4qUxX9wvdgyuv5OU2
         WFd7cAUFMAE5sD+uehbFaO9QJMnWo7ooScNOZNhFGolyJ2e6KHRTBgHo1pDdtwtnaqsG
         R/3gxA5NHa9FQG4dG4z4CDlWf8CqBDTAcvoJZhf0twofXpQzPcvq5qbA9U7q14iIh8sH
         cIJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=jyjHVj7a;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l190-v6si1943731qkf.37.2018.06.22.06.39.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Jun 2018 06:39:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=jyjHVj7a;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:33983 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fWMHG-0003MS-4x
	for alex.bennee@linaro.org; Fri, 22 Jun 2018 09:39:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56158)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWM3R-0000eM-Rd
	for qemu-devel@nongnu.org; Fri, 22 Jun 2018 09:24:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWM3M-0005yn-Uw
	for qemu-devel@nongnu.org; Fri, 22 Jun 2018 09:24:45 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:36562)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWM3M-0005yh-Qw; Fri, 22 Jun 2018 09:24:40 -0400
Received: by mail-qt0-x242.google.com with SMTP id o9-v6so5875157qtp.3;
	Fri, 22 Jun 2018 06:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=WokhsUVBbzAkqKpAEJ747jLaGMR2KkSvBeDZftg7QiI=;
	b=jyjHVj7ayEUV0uof9IJLM0VLA8WV3JOicv5YdWuhVOmsybBxa05XE+pfv4caLRY7N0
	fb1DVvoe95jnvHCx+8ZVUwUuU0ebENfSnPL0bYnr8Lk3fnu95SRpBmUkw5SaDzSljZbW
	EyKTmGQoiGzkzMsMsUtCQMSEzRwL0R8/3xBn2lE4OOcw+PNU8bctoaQqWi1hH2HWes3F
	tgqiPmK0PnToHEPhsOZsdIclWXo2GaTSwbl8TybK+tPpFkTTKJgwT6EZHgSCcunG2EgL
	ju3CwbRahgZecFwcgS4zVM2ua3vJPkuHg6MCi7lHUMHKPgagOkRGo/VGk3jADs0p/Syk
	LaCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=WokhsUVBbzAkqKpAEJ747jLaGMR2KkSvBeDZftg7QiI=;
	b=NJDelxIyERDYrd23KUymgU1oL9fJN9rny1Cg5uPyt1sWuvdaFys6oGIpEAwjMuX8M8
	lHen+MAETyKHHaDV/RWx/noXKJZw3eJv6+V6+dh1lLSqZajcF38+uW2xmJsaYiEvzi3t
	xjjZATC0N2x7qjOXZaj0R/5yfrBDnayAyuVFBk4WBjqS3NrUcywiKaHhoK96VRm1QaXc
	hzAeVzmTx34oyGAfJtbsukRtVtgGoaqViUpAj/z5TYU83aH0kSIJo4urtrx9rZ+ToYpm
	1w1E7fZDEft9bXUKVh0z3JgLd1O9NAdJkvJqZ16DYy5pVTArlutmmhWCmi/doxviM+qp
	jxiQ==
X-Gm-Message-State: APt69E1VcTExgNnljkJTWQwQ9w7hsU8tgLh0/sM5AoPvhnOXWKV0IxZE
	j0fWd07AG7AfF2edw9e+ZICIVy3D
X-Received: by 2002:a0c:b5af:: with SMTP id
	g47-v6mr1378187qve.94.1529673880161; 
	Fri, 22 Jun 2018 06:24:40 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	v56-v6sm6132613qtv.50.2018.06.22.06.24.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Jun 2018 06:24:39 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20180621180224.8312-1-f4bug@amsat.org>
	<20180621180224.8312-11-f4bug@amsat.org>
	<8b75e080-6c68-0bdc-1f2c-8ca6c0f80089@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <44d9b737-073f-983e-fe19-03b908e7c9a3@amsat.org>
Date: Fri, 22 Jun 2018 10:24:36 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <8b75e080-6c68-0bdc-1f2c-8ca6c0f80089@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: Re: [Qemu-devel] [PATCH 10/11] hw/net/stellaris_enet: Use
 qemu_log_mask(GUEST_ERROR) instead of hw_error
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
Cc: qemu-trivial@nongnu.org, Jason Wang <jasowang@redhat.com>,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nKNmYfsHNtsh

On 06/22/2018 05:43 AM, Thomas Huth wrote:
> On 21.06.2018 20:02, Philippe Mathieu-Daudé wrote:
>> hw_error() finally calls abort(), but there is no need to abort here.
> 
> Additionally, hw_error() is also only meant for CPU errors (since it
> dumps the CPU state). We should really rename that function to
> "cpu_hw_error" one day to avoid that people use it in the wrong spots...

Another painful cleanup series...

> 
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  hw/net/stellaris_enet.c | 9 +++++++--
>>  1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/net/stellaris_enet.c b/hw/net/stellaris_enet.c
>> index 04bd10ada3..188adcbd15 100644
>> --- a/hw/net/stellaris_enet.c
>> +++ b/hw/net/stellaris_enet.c
>> @@ -9,6 +9,7 @@
>>  #include "qemu/osdep.h"
>>  #include "hw/sysbus.h"
>>  #include "net/net.h"
>> +#include "qemu/log.h"
>>  #include <zlib.h>
>>  
>>  //#define DEBUG_STELLARIS_ENET 1
>> @@ -343,7 +344,9 @@ static uint64_t stellaris_enet_read(void *opaque, hwaddr offset,
>>      case 0x3c: /* Undocuented: Timestamp? */
>>          return 0;
>>      default:
>> -        hw_error("stellaris_enet_read: Bad offset %x\n", (int)offset);
>> +        qemu_log_mask(LOG_GUEST_ERROR,
>> +                      "stellaris_enet_rd%d: 0x%" HWADDR_PRIx "\n",
>> +                      size, offset);
>>          return 0;
>>      }
>>  }
>> @@ -442,7 +445,9 @@ static void stellaris_enet_write(void *opaque, hwaddr offset,
>>          /* Ignored.  */
>>          break;
>>      default:
>> -        hw_error("stellaris_enet_write: Bad offset %x\n", (int)offset);
>> +        qemu_log_mask(LOG_GUEST_ERROR,
>> +                      "stellaris_enet_wr%d: 0x%" HWADDR_PRIx " = 0x%lx\n",
>> +                      size, offset, value);
>>      }
>>  }
> 
> Could you please keep the "bad offset" or a similar error message, so
> that the user knows that there is really something wrong here?

Sure.
