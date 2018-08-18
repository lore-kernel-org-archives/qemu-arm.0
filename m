Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1349397wrd;
        Sat, 18 Aug 2018 08:08:43 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPzhm2xUJdhX552T9vd0M7aQBN8wojOenVO9p8bozmjfrBG4Z5SXAGVan/uvVX17w+bHeZ71
X-Received: by 2002:ac8:c86:: with SMTP id n6-v6mr37376582qti.324.1534604923207;
        Sat, 18 Aug 2018 08:08:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534604923; cv=none;
        d=google.com; s=arc-20160816;
        b=qkWCbVHG63OmQwWB5+U7HBUZY/62ZBCG5j3/E4wWNzzeXeCKpdaec+UGWS7zHUxETs
         7JS3nCC+GpMVHc1Cd9gvP4V/V3e1etWrqORqmFhhiLbY8+gNBpK9OUtkx9USP7VlmWi+
         h6Kmc28fCCS+BBTadUI8eZfRbBAgF0BjrkLTjCwH3iw2FN2u4Ufa7ozsQxdhgDmSDz9w
         E5LVzpMHFrT9rtnpkl82L9HPmIhiQUjhMvrKg3EyRYykyqd03S6rqWUld6rTQ86fqCbN
         N22V/2l1lnvzkou2MvfjxYmi6jhnvsiMBXnquQQqDwg7uluGEJXr+JwU+soaoRErav3r
         +siw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=YQLa4SR4nwYAn6dHtt7bdbY747+ek37ZomcgTTzi7AE=;
        b=t+8JZLg9L+1WWeHkbRUr6r8KWH9/eAvDoBkGHuy98tl/21DFev/7Aj/t18SYIRd3Mh
         FypmFRttQEl11CfIfkEuOjffLdfvu+JcMV5iltVvYykI5O+qJNrpCc0AmfzagZBpuSvP
         t0DCDdAyZr8kzxVKBMDyUXysdLFqT238Kypfkw8npbKrGiwuxBfQQ72zI5FrUh/Dgcd6
         Fa/4SFOkc0IEjKn2wlpEX+ODDI9r7GbhQABR+uThLGDUVFcMLQyPje3AXomTqUOvJhRy
         Mco9pz0wR0V6aCsm+Neacs9vUX4Io4K0rEOI/vwV8lcZG49mWIen+3v6kkxsAGejdnCp
         F05A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=HaHGsZ2r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o184-v6si2188690qkc.288.2018.08.18.08.08.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 18 Aug 2018 08:08:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=HaHGsZ2r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:39370 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fr2qI-0007d8-Kb
	for alex.bennee@linaro.org; Sat, 18 Aug 2018 11:08:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58816)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fr2q2-0007cR-TD
	for qemu-arm@nongnu.org; Sat, 18 Aug 2018 11:08:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fr2nq-0007Kn-N7
	for qemu-arm@nongnu.org; Sat, 18 Aug 2018 11:06:11 -0400
Received: from mail-ua1-x943.google.com ([2607:f8b0:4864:20::943]:45001)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fr2nm-0007I0-Dp; Sat, 18 Aug 2018 11:06:06 -0400
Received: by mail-ua1-x943.google.com with SMTP id k25-v6so7403140uao.11;
	Sat, 18 Aug 2018 08:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=YQLa4SR4nwYAn6dHtt7bdbY747+ek37ZomcgTTzi7AE=;
	b=HaHGsZ2rhCUOhgxMty5Gf6kERghrFoxLTt/XR45veyKOeKXeT0zOc3zl+kdBFwM4L8
	O1iBrY1krg5hi2ToecRWIKWoVGA4BS4BglNHj75c5F48rD1qoxj4/7g9LGaY8XhJ1JXg
	4RP6zZVqt1d+DgnXUOQM55Rzf0yjMFcvan0fhXnl2JJ3RCk4ucdkgyWpaanPYt2NRfw3
	Ajs6gXViL/vDB5cHi7r3f8kB9R35u5mGiN6755fs3cWeTYlwXNeRsVByXSwis3X6WRBd
	LT2Zq34fK6IXmG8HqcQ2II9c5EYe8oEMoiPyPxmgKHRKSGvpn2nDgtAUrplW9zaMjt5P
	dM9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=YQLa4SR4nwYAn6dHtt7bdbY747+ek37ZomcgTTzi7AE=;
	b=LgHJ/LQFkatgaF4LkoXcqwId4ufw4NXFcuRJC/lGoDVJSU15eX8KAwg/qhL9iNtTTD
	+X2SW+wY2ZE+SGTgjuf3K0bg5g8XstvzvdRd1aub6tEIve4XGhrQ2XGqDSB3f3bWrFrP
	zRaAkHQx6KKlhoc6PaxkA4DdqEcxzf50BXPVzNJqKD0/zsdn/OO+LKuDC7Hs89DApCx/
	ldoRTcJ3bzn99/HRXq4hOwJoOv0Oex45bJmpmTcLA9E7nm8gaLqVxqmlYTzDAtVYkqqv
	lmIzInwm2vWdV7F9mCxwZms5//n1c7Wcxlkd6N2zL0R/r26BJg4sx3DGkQ/CgTVEZeQ2
	iYag==
X-Gm-Message-State: AOUpUlF46nfQJIsCm+wnMn/um1Fu7lk0AW9ThZNsu+D+aJ2SIegJjHNW
	NWeeMaZnyFvMWH0Bf2Eu5SNrVh/G
X-Received: by 2002:ab0:4fda:: with SMTP id
	t26-v6mr25984315uah.1.1534604765876; 
	Sat, 18 Aug 2018 08:06:05 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	m143-v6sm1036379vke.23.2018.08.18.08.06.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 18 Aug 2018 08:06:05 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180809130115.28951-1-peter.maydell@linaro.org>
	<20180809130115.28951-7-peter.maydell@linaro.org>
	<39365f2c-e947-3530-ee8f-9062bbb1264f@amsat.org>
	<CAFEAcA_ZOjNHVkqk1ww5VOLq7EhPJjAEjfHHdk2kjBGdy-MqdQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Autocrypt: addr=f4bug@amsat.org; prefer-encrypt=mutual; keydata=
	mQINBDU8rLoBEADb5b5dyglKgWF9uDbIjFXU4gDtcwiga9wJ/wX6xdhBqU8tlQ4BroH7AeRl
	u4zXP0QnBDAG7EetxlQzcfYbPmxFISWjckDBFvDbFsojrZmwF2/LkFSzlvKiN5KLghzzJhLO
	HhjGlF8deEZz/d/G8qzO9mIw8GIBS8uuWh6SIcG/qq7+y+2+aifaj92EdwU79apZepT/U3vN
	YrfcAuo1Ycy7/u0hJ7rlaFUn2Fu5KIgV2O++hHYtCCQfdPBg/+ujTL+U+sCDawCyq+9M5+LJ
	ojCzP9rViLZDd/gS6jX8T48hhidtbtsFRj/e9QpdZgDZfowRMVsRx+TB9yzjFdMO0YaYybXp
	dg/wCUepX5xmDBrle6cZ8VEe00+UQCAU1TY5Hs7QFfBbjgR3k9pgJzVXNUKcJ9DYQP0OBH9P
	ZbZvM0Ut2Bk6bLBO5iCVDOco0alrPkX7iJul2QWBy3Iy9j02GnA5jZ1Xtjr9kpCqQT+sRXso
	Vpm5TPGWaWljIeLWy/qL8drX1eyJzwTB3A36Ck4r3YmjMjfmvltSZB1uAdo1elHTlFEULpU/
	HiwvvqXQ9koB15U154VCuguvx/Qnboz8GFb9Uw8VyawzVxYVNME7xw7CQF8FYxzj6eI7rBf2
	Dj/II6wxWPgDEy3oUzuNOxTB7sT3b/Ym76yOJzWX5BylXQIJ5wARAQABtDFQaGlsaXBwZSBN
	YXRoaWV1LURhdWTDqSAoRjRCVUcpIDxmNGJ1Z0BhbXNhdC5vcmc+iQI+BBMBAgAoBQI3aGSw
	AhsPBQkmUJgABgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRDj4yws3q3A3nS+EACxKosO
	3DZdwdVPXLVvSAA5y3Ohr2ByWN06RlVEkKWkOxm0lQ96LxBOZ03mDC+He/36DHaP+fujPBTz
	XjTXygWWZUtk0flDWR1w0a4yhX/JHfL5yloMZrxifCwouf2Sv9Yd6D46pzMeGsq8aCvbZYSf
	lDi3KXsVHc+jbmRwxtzJxz7366dsTC1tOJmjVSxc8bE55pHnPFOT1KKM9fxGWZFYx0UqAL/1
	NkrOKP5eXdJ51EhQa5pjivJw6dQlfWMQURG4o4e2+aLe4TkS2FI0r6nTgmoDmTT74u35NzZW
	Q3xjqcfqUX52+0drwlta22guNDbcJ4J+/I6FBF1C7CoSysBiIrldZQ6cJZ19st3jb7NHAoNk
	DcUt5I3gt4EpaiijWEEYAhw1/NSagm9bfn9veBqzVHNQrz76NZMiy2kP2vAxKOvo1XVlcEl0
	8MQ+IAUvYcLvU6yHRB4da7ts+ufqriNI5WBpvoLPRRa0wFDTj0nX/CfWFX9UkTwHA6/SWlhE
	hHau4xrpzFENwF5UDFtMkleo/u5Ipv7q8wYNs5JBpSXGmm4oSV9BbW0gp28D8fY4GGv1+6Dz
	BNDeuIdPf2NX0X55uyphpB0J4d70uNszAWXr7VqGOBbGrHcNHeT62BvoRd8bUQhaEyiJwOyC
	Ny4YIWW+I8W2wXkW+vSrZfEro2GZjQ==
Message-ID: <3df1351a-6d3a-d1ed-38d9-4048c42fb1c6@amsat.org>
Date: Sat, 18 Aug 2018 12:06:02 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_ZOjNHVkqk1ww5VOLq7EhPJjAEjfHHdk2kjBGdy-MqdQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::943
Subject: Re: [Qemu-arm] [PATCH 06/16] hw/misc/iotkit: Wire up the system
 control element
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5mgJcvduAC1r

On 08/18/2018 06:55 AM, Peter Maydell wrote:
> On 18 August 2018 at 01:00, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>> Hi Peter,
>>
>> On 08/09/2018 10:01 AM, Peter Maydell wrote:
>>> Wire up the system control element's register banks.
>>>
>>> This is the last of the previously completely unimplemented
>>> components in the IoTKit.
>>>
>>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>>> ---
>>>  include/hw/arm/iotkit.h |  4 +++-
>>>  hw/arm/iotkit.c         | 19 +++++++++++--------
>>>  2 files changed, 14 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/include/hw/arm/iotkit.h b/include/hw/arm/iotkit.h
>>> index 0f5c5101708..1ffa31d521b 100644
>>> --- a/include/hw/arm/iotkit.h
>>> +++ b/include/hw/arm/iotkit.h
>>> @@ -58,7 +58,7 @@
>>>  #include "hw/timer/cmsdk-apb-timer.h"
>>>  #include "hw/timer/cmsdk-apb-dualtimer.h"
>>>  #include "hw/watchdog/cmsdk-apb-watchdog.h"
>>> -#include "hw/misc/unimp.h"
>>> +#include "hw/misc/iotkit-sysctl.h"
>>>  #include "hw/or-irq.h"
>>>  #include "hw/core/split-irq.h"
>>>
>>> @@ -97,6 +97,8 @@ typedef struct IoTKit {
>>>      CMSDKAPBWatchdog nswatchdog;
>>>      CMSDKAPBWatchdog swatchdog;
>>>
>>> +    IoTKitSysCtl sysctl;
>>> +
>>>      MemoryRegion container;
>>>      MemoryRegion alias1;
>>>      MemoryRegion alias2;
>>> diff --git a/hw/arm/iotkit.c b/hw/arm/iotkit.c
>>> index cb0ec456f39..5d59ed5489f 100644
>>> --- a/hw/arm/iotkit.c
>>> +++ b/hw/arm/iotkit.c
>>> @@ -16,7 +16,6 @@
>>>  #include "hw/sysbus.h"
>>>  #include "hw/registerfields.h"
>>>  #include "hw/arm/iotkit.h"
>>> -#include "hw/misc/unimp.h"
>>>  #include "hw/arm/arm.h"
>>>
>>>  /* Clock frequency in HZ of the 32KHz "slow clock" */
>>> @@ -151,6 +150,8 @@ static void iotkit_init(Object *obj)
>>>                            sizeof(s->nswatchdog), TYPE_CMSDK_APB_WATCHDOG);
>>>      sysbus_init_child_obj(obj, "swatchdog", &s->swatchdog,
>>>                            sizeof(s->swatchdog), TYPE_CMSDK_APB_WATCHDOG);
>>> +    sysbus_init_child_obj(obj, "iotkit-sysctl", &s->sysctl, sizeof(s->sysctl),
>>> +                          TYPE_IOTKIT_SYSCTL);
>>>      object_initialize_child(obj, "nmi-orgate", &s->nmi_orgate,
>>>                              sizeof(s->nmi_orgate), TYPE_OR_IRQ,
>>>                              &error_abort, NULL);
>>> @@ -516,13 +517,15 @@ static void iotkit_realize(DeviceState *dev, Error **errp)
>>>                            qdev_get_gpio_in_named(dev_apb_ppc1,
>>>                                                   "cfg_sec_resp", 0));
>>>
>>> -    /* Using create_unimplemented_device() maps the stub into the
>>> -     * system address space rather than into our container, but the
>>> -     * overall effect to the guest is the same.
>>> -     */
>>> -    create_unimplemented_device("SYSINFO", 0x40020000, 0x1000);
>>> -
>>> -    create_unimplemented_device("SYSCONTROL", 0x50021000, 0x1000);
>>> +    object_property_set_bool(OBJECT(&s->sysctl), true, "realized", &err);
>>> +    if (err) {
>>> +        error_propagate(errp, err);
>>> +        return;
>>> +    }
>>> +    /* System information registers */
>>> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->sysctl), 0, 0x40020000);
>>
>> What about the Secure access?
>>
>>        sysbus_mmio_map(SYS_BUS_DEVICE(&s->sysctl), 0, 0x50020000);
> 
> That should be handled by the general alias set up earlier
>     make_alias(s, &s->alias3, "alias 3", 0x50000000, 0x10000000, 0x40000000);
> which maps all of the 0x5... space to 0x4... if there's nothing
> higher priority mapped there.

Oh I missed that! Perfect then :)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
