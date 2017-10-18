Received: by 10.223.197.9 with SMTP id q9csp5538400wrf;
        Wed, 18 Oct 2017 03:36:05 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+QaI+PG9B/yRWAH3F5VswXyrKXcFfk+n1kN6+Sodzze4l8OWU8THm9V4gIjBsOzNKzgJI63
X-Received: by 10.55.183.134 with SMTP id h128mr1744924qkf.258.1508322965754;
        Wed, 18 Oct 2017 03:36:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508322965; cv=none;
        d=google.com; s=arc-20160816;
        b=EBI4hi2at9zTWK3eC0s5RUe3q/lud1aCavoEFfHmrk23tL4w3cSLYHUlQoxswcIGC4
         ph0z+j+mbrLbDS/mjI4YCcded6F0qEexe/+tV9GzSqOmIN0kElZK4xbGXebcPd3deAz0
         RRliyAoGm5zTdTACN2LpqQOB2QGaJLB8QtNA8ZAq8j0wnLRhGyp08oNZU1s67wd6ffiS
         NMPAyJUWI9i8iRT3rO98mY2DCWElt3z6cOGY/JsNtw4JnmxWNvUXlmQ8rxCP++HAxZCr
         /wzu8SfmOBR4DaekcuRf2BpNHtYW46usA9na36RwCfY+gPIxDBy25q6UhKKXJnthn74D
         tpXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:mail-followup-to
         :message-id:to:from:date:arc-authentication-results;
        bh=nNK8rRaR4KjQYc5C8yUXbpiCcw7zobzq6d9krp+gN+Y=;
        b=byK4lX9Ns887vRCJ4781ovPecsq5qNGresDY23QPPUZ2XKsk58E0BDGUJVcEi4uNuB
         p8U0TM+lkpKxeBEtYzCPhLOU9SYeG4OVS6Mk1ZBJ7vVDRcC77myuF1AVsC0z+9YXzmiQ
         deru0ZO5lgId0NnjDyctBEu3zgBAKagmoXkE/Gg0/nViAJlsDg7TS5UYOYcoW0jaNe1N
         DU+jvvL798vPCOPKAZca03nWMjzkbbBRQSaGU+7N1Bnqous4tYowVEQy4cG3wyxEjR4C
         9oC/b4z0cIrlW1mwe3b6TdwVnQjF0uXuoicNfSwBV1wMfa0fsuryTnetJHwFVsAtTYnc
         Bkyg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=oracle.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y190si4382028qkc.96.2017.10.18.03.36.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 18 Oct 2017 03:36:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=oracle.com
Received: from localhost ([::1]:43741 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e4lhj-0007pq-IM
	for alex.bennee@linaro.org; Wed, 18 Oct 2017 06:36:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48540)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <darren.kenny@oracle.com>) id 1e4lgo-0007U0-IV
	for qemu-devel@nongnu.org; Wed, 18 Oct 2017 06:35:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <darren.kenny@oracle.com>) id 1e4lgi-0003wa-Q1
	for qemu-devel@nongnu.org; Wed, 18 Oct 2017 06:35:06 -0400
Received: from userp1040.oracle.com ([156.151.31.81]:29399)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <darren.kenny@oracle.com>)
	id 1e4lgd-0003tj-MJ; Wed, 18 Oct 2017 06:34:55 -0400
Received: from aserv0021.oracle.com (aserv0021.oracle.com [141.146.126.233])
	by userp1040.oracle.com (Sentrion-MTA-4.3.2/Sentrion-MTA-4.3.2) with
	ESMTP id v9IAYnbe005836
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Oct 2017 10:34:50 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
	by aserv0021.oracle.com (8.14.4/8.14.4) with ESMTP id v9IAYnux000439
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Wed, 18 Oct 2017 10:34:49 GMT
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
	by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id v9IAYnTm025180;
	Wed, 18 Oct 2017 10:34:49 GMT
Received: from starbug-vm.ie.oracle.com (/10.175.208.173)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Wed, 18 Oct 2017 03:34:49 -0700
Date: Wed, 18 Oct 2017 11:34:45 +0100
From: Darren Kenny <darren.kenny@oracle.com>
To: sundeep subbaraya <sundeep.lkml@gmail.com>
Message-ID: <20171018103445.tyw6k2dsdaewrbxq@starbug-vm.ie.oracle.com>
Mail-Followup-To: sundeep subbaraya <sundeep.lkml@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Alistair Francis <alistair23@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>
References: <1508298038-4156-1-git-send-email-sundeep.lkml@gmail.com>
	<20171018085459.3mt4gynx3s3gndnt@starbug-vm.ie.oracle.com>
	<CALHRZuqhHJftwxP3h5Ne_VERxofwzwRgngeCZMP6G9oXi4UuXA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <CALHRZuqhHJftwxP3h5Ne_VERxofwzwRgngeCZMP6G9oXi4UuXA@mail.gmail.com>
User-Agent: NeoMutt/20170914 (1.9.0)
X-Source-IP: aserv0021.oracle.com [141.146.126.233]
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
	[fuzzy]
X-Received-From: 156.151.31.81
Subject: Re: [Qemu-devel] [Qemu devel v2 PATCH] msf2: Remove dead code
 reported by Coverity
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Igor Mammedov <imammedo@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alistair Francis <alistair23@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7zaAvc2y5oH9

Hi Sundeep,

On Wed, Oct 18, 2017 at 10:10:07AM +0000, sundeep subbaraya wrote:
>Hi Darren,
>
>On Wed, Oct 18, 2017 at 2:24 PM, Darren Kenny <darren.kenny@oracle.com>
>wrote:
>
>> On Wed, Oct 18, 2017 at 03:40:38AM +0000, Subbaraya Sundeep wrote:
>>
>>> Fixed incorrect frame size mask, validated maximum frame
>>> size in spi_write and removed dead code.
>>>
>>> Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
>>> ---
>>> v2:
>>>         else if -> else in set_fifodepth
>>>         log guest error when frame size is more than 32
>>>
>>> hw/ssi/mss-spi.c | 12 ++++++++----
>>> 1 file changed, 8 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/hw/ssi/mss-spi.c b/hw/ssi/mss-spi.c
>>> index 5a8e308..7fef2c3 100644
>>> --- a/hw/ssi/mss-spi.c
>>> +++ b/hw/ssi/mss-spi.c
>>> @@ -76,9 +76,10 @@
>>> #define C_BIGFIFO            (1 << 29)
>>> #define C_RESET              (1 << 31)
>>>
>>> -#define FRAMESZ_MASK         0x1F
>>> +#define FRAMESZ_MASK         0x3F
>>> #define FMCOUNT_MASK         0x00FFFF00
>>> #define FMCOUNT_SHIFT        8
>>> +#define FRAMESZ_MAX          32
>>>
>>> static void txfifo_reset(MSSSpiState *s)
>>> {
>>> @@ -104,10 +105,8 @@ static void set_fifodepth(MSSSpiState *s)
>>>         s->fifo_depth = 32;
>>>     } else if (size <= 16) {
>>>         s->fifo_depth = 16;
>>> -    } else if (size <= 32) {
>>> -        s->fifo_depth = 8;
>>>     } else {
>>> -        s->fifo_depth = 4;
>>> +        s->fifo_depth = 8;
>>>     }
>>> }
>>>
>>> @@ -301,6 +300,11 @@ static void spi_write(void *opaque, hwaddr addr,
>>>         if (s->enabled) {
>>>             break;
>>>         }
>>> +        if ((value & FRAMESZ_MASK) > FRAMESZ_MAX) {
>>> +            qemu_log_mask(LOG_GUEST_ERROR, "%s: Maximum frame size is
>>> %d\n",
>>> +                         __func__, FRAMESZ_MAX);
>>> +            break;
>>> +        }
>>>         s->regs[R_SPI_DFSIZE] = value;
>>>         break;
>>>
>>
>> This test, and subsequent use of value appear to be out of sorts -
>> in that while it is testing for the value by ANDing it with
>> FRAMESZ_MASK, it is subsequently using the value without that mask
>> applied to it, which still has the potential to be larger than
>> FRAMESZ_MASK if it contains a value larger than 0x3F.
>>
>> Is that the expected behaviour? If so, maybe include a comment on
>> it?
>>
>
>As per docs regarding [31:6]:
>Software should not rely on the value of a reserved bit. To provide
>compatibility with future products, the value of a reserved bit should be
>preserved across a read-modify-write operation.
>
>Hence we do not care about [31:6] and validate only [5:0] for size
>during write.  When reading size we AND with FRAMESZ_MASK. In other
>words we let [31:6] bits like scratch bits where guest can read and
>write. I am really not sure how hardware behaves if [5:0] is
>greater than 32 hence guest error and write wont happen. If this is
>not right we can discuss :)

That sounds fine then - definitely would suggest some sort of
comment w.r.t. the fact that we are intentionally preserving these
extra bits - in case anyone looks at this again in the future.
>
>
>>
>> Also, it might be useful to include the incorrect value in the
>> logged output too, not just what the maximum is.
>>
>> Ok I will change.

OK

Thanks,

Darren.
