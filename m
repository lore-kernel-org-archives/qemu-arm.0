Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp564450wro;
        Fri, 26 Oct 2018 03:50:30 -0700 (PDT)
X-Google-Smtp-Source: AJdET5ecqYi8NOBfP5ALe9VfQ3D54S876auY4HDYG7hSKsIYBBN6kHcpZ6QcBFkm3gKaYF0gLnpI
X-Received: by 2002:ae9:e313:: with SMTP id v19-v6mr2485257qkf.318.1540551030711;
        Fri, 26 Oct 2018 03:50:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540551030; cv=none;
        d=google.com; s=arc-20160816;
        b=fYbhWfry4P5OxcXOzarJQvOhdl7IwO/fRP+Z4S5EkRtU4sOttPnXN9Wh6TYhrC3Nwe
         19dQfv0PS0D23eaEr/dEy11qsh9K1YsvDsXGBfSiZtuNVX3pzi6Ib+Int1sbEJ1y7fVh
         sAx5MfAub/KoV2yT/Y+jDLXyT5SqRZ8KDiwKgR4r33/C2ZleiOPuUiLqDU42ywwvrWG2
         dwOqFyw52Z6kqIPj/kj0qo3p5KjP/Bg3ZK7Ub9k2rlCRV162Xb6YsconklYtRM3rRr44
         aHAYgixYl1oUnvpkZrLA+SU4NYcbvdjOe8OC/yH5K1ll6I7bOyTCngxV+bMM604k6cZx
         Laag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=G/QAilGTrUJA+DHt6L1PtVMvCJxNlPs8cG9LHHdMRQI=;
        b=VtqVBAGekdv06qd59UmE/ijq92LidYZxLBPMwoFR8oxbNdi8i+h/E9Ht2IZ/shDWXm
         nihJw3z++otNnkDfiC53/zACA81AIFO89W2N8xR/TCWajrt+r8LoQ+M5yRSU7U2VoBVV
         01fGorFTwL8/Gqbt8kBd36ENcpKW/oSgVWwbi38B1gVMRw2mVfGiNoJdY2sNOLrI9Ii9
         sTbNQ7rKuf+Jdkdetow0ncCyWia7pEt+72E08FrvxPKn4BCACfY5DIZrN3nCJNBjm8TG
         h42smjod89r3vakHioCqM7S+TjiXrI9He6F7W6ASgDGelqhqDjMIde2HTwnZaK7bzx1J
         ZlgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i18-v6si5944929qkg.117.2018.10.26.03.50.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 26 Oct 2018 03:50:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59450 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gFzhG-0000us-7D
	for alex.bennee@linaro.org; Fri, 26 Oct 2018 06:50:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54832)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gFzh0-0000sW-HF
	for qemu-arm@nongnu.org; Fri, 26 Oct 2018 06:50:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gFzgu-0008Or-MO
	for qemu-arm@nongnu.org; Fri, 26 Oct 2018 06:50:14 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:35572)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gFzgs-0008KQ-HG
	for qemu-arm@nongnu.org; Fri, 26 Oct 2018 06:50:08 -0400
Received: by mail-wr1-f68.google.com with SMTP id w5-v6so872652wrt.2
	for <qemu-arm@nongnu.org>; Fri, 26 Oct 2018 03:50:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=G/QAilGTrUJA+DHt6L1PtVMvCJxNlPs8cG9LHHdMRQI=;
	b=nM4cnNG891Ox4DNHdbmfjZxYt8StebXyjh/xzti4o8JxhSFStlltINwmtLNqnNYXIc
	IYLnZmGxRMd6OdMUFJwdjUbwffMktDDIJRhwluuLZ8noI2O92LQtF/UTNpnPnX1HznIS
	14GuHetU1jpcOGfbAlI7j659ysncaITkgwFthmridTFscvSDbYl5lxJ8+DGcPe6GYEtN
	CnQLl4ywFyeBtd6apGp1fT54TRZN8Ab3W1xfzMKCK2T5WwytXrVoS9u/c3eyH8dsgRjx
	SHVEY1YKQ05Y+sdrPt40dpTPjTATPVxAUOP4MOzgmX3VJDW1dSPq+Tkv750w2UZXJwaS
	iUzg==
X-Gm-Message-State: AGRZ1gJTWvnA0OUHu9oR59vk9zIvkwL/iobxjrUx8i3wbhDDxYva1Jnu
	Xd+kJPKZ3yxvpZHhQipuqCXYjw==
X-Received: by 2002:adf:b64e:: with SMTP id
	i14-v6mr5550116wre.14.1540551002405; 
	Fri, 26 Oct 2018 03:50:02 -0700 (PDT)
Received: from [10.101.215.143] ([185.7.230.216])
	by smtp.gmail.com with ESMTPSA id
	u13-v6sm7031546wrn.11.2018.10.26.03.50.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 26 Oct 2018 03:50:01 -0700 (PDT)
To: Eduardo Habkost <ehabkost@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
References: <20181025133301.16578-1-ehabkost@redhat.com>
	<20181025133301.16578-6-ehabkost@redhat.com>
	<20181025171759.GG2697@umbus.hotspot.internet-for-guests.com>
	<20181026082741.GK4096@habkost.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <6112ad64-267d-16d1-abe5-cdaed3981a95@redhat.com>
Date: Fri, 26 Oct 2018 12:49:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181026082741.GK4096@habkost.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.68
Subject: Re: [Qemu-arm] [Qemu-devel] [PULL v2 05/43] hw/timer/sun4v-rtc:
 Convert from DPRINTF() macro to trace events
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, libvir-list@redhat.com,
	Jason Wang <jasowang@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-devel@nongnu.org, Alexander Graf <agraf@suse.de>,
	Max Filippov <jcmvbkbc@gmail.com>, Rob Herring <robh@kernel.org>,
	Markus Armbruster <armbru@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
	Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IaBRCLjzaAeL

On 26/10/18 10:27, Eduardo Habkost wrote:
> On Thu, Oct 25, 2018 at 06:17:59PM +0100, David Gibson wrote:
>> On Thu, Oct 25, 2018 at 10:32:23AM -0300, Eduardo Habkost wrote:
>>> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>> Reviewed-by: Artyom Tarasenko <atar4qemu@gmail.com>
>>> Reviewed-by: Cédric Le Goater <clg@kaod.org>
>>> Message-Id: <20181002212522.23303-3-f4bug@amsat.org>
>>> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
>>> ---
>>>   hw/timer/sun4v-rtc.c  | 13 +++----------
>>>   hw/timer/trace-events |  4 ++++
>>>   2 files changed, 7 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/hw/timer/sun4v-rtc.c b/hw/timer/sun4v-rtc.c
>>> index 310523225f..13be94f8da 100644
>>> --- a/hw/timer/sun4v-rtc.c
>>> +++ b/hw/timer/sun4v-rtc.c
>>> @@ -14,15 +14,8 @@
>>>   #include "hw/sysbus.h"
>>>   #include "qemu/timer.h"
>>>   #include "hw/timer/sun4v-rtc.h"
>>> +#include "trace.h"
>>>   
>>> -//#define DEBUG_SUN4V_RTC
>>> -
>>> -#ifdef DEBUG_SUN4V_RTC
>>> -#define DPRINTF(fmt, ...)                                       \
>>> -    do { printf("sun4v_rtc: " fmt , ## __VA_ARGS__); } while (0)
>>> -#else
>>> -#define DPRINTF(fmt, ...) do {} while (0)
>>> -#endif
>>>   
>>>   #define TYPE_SUN4V_RTC "sun4v_rtc"
>>>   #define SUN4V_RTC(obj) OBJECT_CHECK(Sun4vRtc, (obj), TYPE_SUN4V_RTC)
>>> @@ -41,14 +34,14 @@ static uint64_t sun4v_rtc_read(void *opaque, hwaddr addr,
>>>           /* accessing the high 32 bits */
>>>           val >>= 32;
>>>       }
>>> -    DPRINTF("read from " TARGET_FMT_plx " val %lx\n", addr, val);
>>> +    trace_sun4v_rtc_read(addr, val);
>>>       return val;
>>>   }
>>>   
>>>   static void sun4v_rtc_write(void *opaque, hwaddr addr,
>>>                                uint64_t val, unsigned size)
>>>   {
>>> -    DPRINTF("write 0x%x to " TARGET_FMT_plx "\n", (unsigned)val, addr);
>>> +    trace_sun4v_rtc_read(addr, val);
>>
>> Uh.. as in v1, it looks like this should be trace_sun4v_rtc_write().
> 
> Oops, my bad.  I can fix this manually in case there's a v3 pull
> request, but I would really prefer that to be included in a
> follow up patch instead of making this block the entire pull
> request.

Oops sorry... I noticed you fixed that in 605be3a8c0, thanks!

Regards,

Phil.
