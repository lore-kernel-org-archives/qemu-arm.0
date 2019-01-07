Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3190828wrt;
        Mon, 7 Jan 2019 00:05:43 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5qptV8PyzDpkYKYOmcfu1fQssGqWtnSE7CEgyy1kIvOCeK4V+ZtNtr22JhCLLd/FRP1eaU
X-Received: by 2002:adf:a14d:: with SMTP id r13mr49049562wrr.169.1546848343695;
        Mon, 07 Jan 2019 00:05:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546848343; cv=none;
        d=google.com; s=arc-20160816;
        b=mcj0Xwxv9hlTlKHZs2USgufD5+VCGBwSrdpiHKNIWwZQmYbJHMDBUoxdCKtsJHSq80
         QZ+YTmsOA746EGYeI3t6uUmBM7088+tRC/h9KnDDR8Vv5kLzhwoQDXlIoY+R0SocsfLq
         dLaB74P8N/wcmvNSpEHwOb8uAgWBErDuhyepasIN3ggF46nfZov9p2lyq+fyojNB1VEy
         1TsBnKfAaZFoo0Bs7NnDCrfHTWLIWRACgacfSguKWVtozV8YhKTgetX6sex9iXiKp86f
         +LH3Cw6p+5sdztU5IVuH4va2/dTq6j0J//LR38AV3cN8HlijO0xECI6ekwd+sbEdnFOx
         tb3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=7t2B6GJTLfVK120uz2mcVDi1qIBPn7KnAr5LLnTQcl0=;
        b=h10ofzvj9lbcwuBP0klwa+k5kfUi4UtzSB33n4e+RZOsFsgJZ2VQDBSVPWFQy6HIaR
         301ULFbPcuGSanAnIiU4FR0+gl3mCB+gBYK7VZoszfzYwIAfA39Ixjtw6JZw0fOlJKGM
         SN3bY6c8hedPInWoSTMUtfydmaFxZP//e6TBvvPQVRanaBaFTT/GTbUh0pxfu1d57IaN
         qKeksMvz7KGMZuQ8j4cSFuGo4Hp1xcg6pzL5LHoUHBQniBVyTiN873xKgBgF44zNCkse
         T19GoFkhY+9fUXqtv9Xn888aPUntvZQQeSEqCuWwoZIppz4Dg1Cb76gKUqMV8sF29Fw9
         7xGg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o82si4641567wme.57.2019.01.07.00.05.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 07 Jan 2019 00:05:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:43027 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ggPuo-0007DO-Q7
	for alex.bennee@linaro.org; Mon, 07 Jan 2019 03:05:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43094)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1ggPtm-0006cE-G0
	for qemu-arm@nongnu.org; Mon, 07 Jan 2019 03:04:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1ggPta-0006om-Ss
	for qemu-arm@nongnu.org; Mon, 07 Jan 2019 03:04:31 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:37584)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ggPtW-0006mh-Vy
	for qemu-arm@nongnu.org; Mon, 07 Jan 2019 03:04:24 -0500
Received: by mail-wr1-f68.google.com with SMTP id s12so42146088wrt.4
	for <qemu-arm@nongnu.org>; Mon, 07 Jan 2019 00:04:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=7t2B6GJTLfVK120uz2mcVDi1qIBPn7KnAr5LLnTQcl0=;
	b=JUszOws0KIF5svtGugAAZyqJjzPMPd4DZrfadVwvphncdyVMhFUisDyaoMRpln7/Vn
	QLLheZM3u+SrL8OpR/dq7uprrkSMjZDbeYmxzoYWa9kwUP3RsJG2UuGRkFOWjUXeXMMw
	xDnrXNoT1I+P2F3X4OToIlrUyW6o3O0C/oz/hpqHkyk1PBvE7qwwCjhGP+ycLDKaakX7
	sewiDL9vGGzkKIcoPS/gDroPHJuURkexHiym+cWbvv6nWMMO3PApBetIl8p1xDsVVt+g
	/1upVjeH7zWlGeGDSYtaiWkj0keP55xxj8KkvyKc/1ZjQ/nzQDVrt6rg32tuvz+cXU+W
	rhwA==
X-Gm-Message-State: AJcUukdgWRcSPOh9r2rjcN+0VoYYndAkryDmVn6GXu6haeBT/pehKf5w
	9qClptPaEoQqVMS1ibySH4oD6w==
X-Received: by 2002:a05:6000:1c8:: with SMTP id
	t8mr47901226wrx.146.1546848261490; 
	Mon, 07 Jan 2019 00:04:21 -0800 (PST)
Received: from [192.168.1.33] (110.red-83-51-161.dynamicip.rima-tde.net.
	[83.51.161.110]) by smtp.gmail.com with ESMTPSA id
	v132sm7062641wme.20.2019.01.07.00.04.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 07 Jan 2019 00:04:20 -0800 (PST)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20190104175847.6290-1-philmd@redhat.com>
	<20190104175847.6290-13-philmd@redhat.com>
	<222c7009-e950-c27d-89a1-674ada91b1e2@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <649326a8-64ef-0914-b52c-6fc1b3a7e7ef@redhat.com>
Date: Mon, 7 Jan 2019 09:04:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <222c7009-e950-c27d-89a1-674ada91b1e2@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.68
Subject: Re: [Qemu-arm] [PATCH 12/16] hw/devices: Move LAN9118 declarations
 into a new header
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>, Rob Herring <robh@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, Joel Stanley <joel@jms.id.au>,
	David Gibson <david@gibson.dropbear.id.au>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	Peter Chubb <peter.chubb@nicta.com.au>,
	=?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
	Richard Henderson <rth@twiddle.net>, Andrew Jeffery <andrew@aj.id.au>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Jan Kiszka <jan.kiszka@web.de>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fJErxulWwUOS

On 1/7/19 8:29 AM, Thomas Huth wrote:
> On 2019-01-04 18:58, Philippe Mathieu-Daudé wrote:
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  hw/arm/kzm.c             |  2 +-
>>  hw/arm/mps2.c            |  2 +-
>>  hw/arm/realview.c        |  1 +
>>  hw/arm/vexpress.c        |  2 +-
>>  hw/net/lan9118.c         |  2 +-
>>  include/hw/devices.h     |  3 ---
>>  include/hw/net/lan9118.h | 21 +++++++++++++++++++++
>>  7 files changed, 26 insertions(+), 7 deletions(-)
>>  create mode 100644 include/hw/net/lan9118.h
>>
>> diff --git a/hw/arm/kzm.c b/hw/arm/kzm.c
>> index 864c7bd411..139934c4ec 100644
>> --- a/hw/arm/kzm.c
>> +++ b/hw/arm/kzm.c
>> @@ -22,7 +22,7 @@
>>  #include "qemu/error-report.h"
>>  #include "exec/address-spaces.h"
>>  #include "net/net.h"
>> -#include "hw/devices.h"
>> +#include "hw/net/lan9118.h"
>>  #include "hw/char/serial.h"
>>  #include "sysemu/qtest.h"
>>  
>> diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
>> index e3d698ba6c..54b7395849 100644
>> --- a/hw/arm/mps2.c
>> +++ b/hw/arm/mps2.c
>> @@ -36,7 +36,7 @@
>>  #include "hw/timer/cmsdk-apb-timer.h"
>>  #include "hw/timer/cmsdk-apb-dualtimer.h"
>>  #include "hw/misc/mps2-scc.h"
>> -#include "hw/devices.h"
>> +#include "hw/net/lan9118.h"
>>  #include "net/net.h"
>>  
>>  typedef enum MPS2FPGAType {
>> diff --git a/hw/arm/realview.c b/hw/arm/realview.c
>> index 242f5a87b6..e9983c8763 100644
>> --- a/hw/arm/realview.c
>> +++ b/hw/arm/realview.c
>> @@ -15,6 +15,7 @@
>>  #include "hw/arm/arm.h"
>>  #include "hw/arm/primecell.h"
>>  #include "hw/devices.h"
>> +#include "hw/net/lan9118.h"
>>  #include "hw/pci/pci.h"
>>  #include "net/net.h"
>>  #include "sysemu/sysemu.h"
>> diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
>> index c02d18ee61..12e2c3986f 100644
>> --- a/hw/arm/vexpress.c
>> +++ b/hw/arm/vexpress.c
>> @@ -28,7 +28,7 @@
>>  #include "hw/sysbus.h"
>>  #include "hw/arm/arm.h"
>>  #include "hw/arm/primecell.h"
>> -#include "hw/devices.h"
>> +#include "hw/net/lan9118.h"
>>  #include "hw/i2c/i2c.h"
>>  #include "net/net.h"
>>  #include "sysemu/sysemu.h"
>> diff --git a/hw/net/lan9118.c b/hw/net/lan9118.c
>> index a6269d9463..a428b16eda 100644
>> --- a/hw/net/lan9118.c
>> +++ b/hw/net/lan9118.c
>> @@ -14,7 +14,7 @@
>>  #include "hw/sysbus.h"
>>  #include "net/net.h"
>>  #include "net/eth.h"
>> -#include "hw/devices.h"
>> +#include "hw/net/lan9118.h"
>>  #include "sysemu/sysemu.h"
>>  #include "hw/ptimer.h"
>>  #include "qemu/log.h"
>> diff --git a/include/hw/devices.h b/include/hw/devices.h
>> index ba9034050b..ebc45c8799 100644
>> --- a/include/hw/devices.h
>> +++ b/include/hw/devices.h
>> @@ -8,7 +8,4 @@
>>  /* smc91c111.c */
>>  void smc91c111_init(NICInfo *, uint32_t, qemu_irq);
>>  
>> -/* lan9118.c */
>> -void lan9118_init(NICInfo *, uint32_t, qemu_irq);
>> -
>>  #endif
>> diff --git a/include/hw/net/lan9118.h b/include/hw/net/lan9118.h
>> new file mode 100644
>> index 0000000000..340d6681b7
>> --- /dev/null
>> +++ b/include/hw/net/lan9118.h
>> @@ -0,0 +1,21 @@
>> +/*
>> + * SMSC LAN9118 Ethernet interface emulation
>> + *
>> + * Copyright (c) 2009 CodeSourcery, LLC.
>> + * Written by Paul Brook
>> + *
>> + * This code is licensed under the GNU GPL v2
>> + *
>> + * Contributions after 2012-01-13 are licensed under the terms of the
>> + * GNU GPL, version 2 or (at your option) any later version.
> 
> Since your contribution here is after 2012 and the file content is also
> just a trivial one-line prototype, please change the license code to say
> GPLv2+ only right from the start. We should avoid these v2 + v2+
> statements in new files.

OK.

> 
>> + */
>> +
>> +#ifndef HW_NET_LAN9118_H
>> +#define HW_NET_LAN9118_H
>> +
>> +#include "hw/irq.h"
>> +#include "net/net.h"
>> +
>> +void lan9118_init(NICInfo *, uint32_t, qemu_irq);
>> +
>> +#endif
>>
> 
>  Thomas
> 
