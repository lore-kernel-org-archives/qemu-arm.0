Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3185477wrt;
        Sun, 6 Jan 2019 23:58:52 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4Gjfu0HiHwNoFX4P0NJO5vELmVU1Pjri5Oy00P5LH2kRZ4tq7QLB0HKHIxfPYqfNw8e46U
X-Received: by 2002:a5d:6988:: with SMTP id g8mr48588997wru.33.1546847932969;
        Sun, 06 Jan 2019 23:58:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546847932; cv=none;
        d=google.com; s=arc-20160816;
        b=y+hZ6bz6D3A0L3qsgs4a50B7yIlQeRElU0YaxBIJcTcYu5AKhxaQ6EGQUK17h8T0zT
         CKtB8rd5j14BWQcZRe2uynffLvKR4S069N99QEC61/SRJeeXAlMdMXynCzWe6JOJOSPR
         pNUDfoA8PxYM1Y52cL2I701vh1+eiFPsAi4L3rnFMElerb/qOC8sHyNAoiqlxWB8ZCCM
         Y3YWMm4IUxz7qoJykEpkuv0PwKCmUe/DXbrcAwXuVTyxdMb4FOZJCcUwWURzdvGNlwgu
         kXYMVUnZFzp/OGoBEutfmHuVIc0bHgk2wTQRBKA12gSmcYhjs/QVheoxsJWaZFM1MUdB
         XTsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=Pg+9wCoKjNsbYdMNN0XZuHENstQZPZCIebum758rza8=;
        b=wtX828uC4c0BHyY73/oFMVruwHK0yQwvMtgIh+grkEoxVVddCUc9PbucN9PBDgxvFu
         7qnhF525CXMRp4kNGFAAps3admdWvUtBREyMSFgnrcfOSnbVFgpvWrVIYmsNWHkTQlsv
         IDyCJK+EiFb2yh5YEM40ERidhbtvIJmJBdHomdS6lD/s5fkl1gaUoRQ13/SCq66n8Cql
         XZPBx5Kv+LVr5QT2EgQciA6shtRdFSuXR4rz2SY3HwI5oNcr5ORU449s2zEyJs5CMzcK
         ZhDiiViNMU+wKi+Nx457F8WhgFmMAQQxN4O5Il2uxdzEQvAQ+gbvItel+kNxrwSH/72S
         jFUg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u14si35102750wrt.251.2019.01.06.23.58.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 06 Jan 2019 23:58:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:41399 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ggPoC-00046W-0i
	for alex.bennee@linaro.org; Mon, 07 Jan 2019 02:58:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41086)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1ggPns-00046E-9b
	for qemu-devel@nongnu.org; Mon, 07 Jan 2019 02:58:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1ggPnr-0001Ai-3R
	for qemu-devel@nongnu.org; Mon, 07 Jan 2019 02:58:32 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:50715)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ggPnp-000194-7J
	for qemu-devel@nongnu.org; Mon, 07 Jan 2019 02:58:30 -0500
Received: by mail-wm1-f67.google.com with SMTP id n190so6243148wmd.0
	for <qemu-devel@nongnu.org>; Sun, 06 Jan 2019 23:58:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Pg+9wCoKjNsbYdMNN0XZuHENstQZPZCIebum758rza8=;
	b=U9h9/CEbZRrnPZxzLBrcm+8AQA82eXZ1IWbyFheF6DoBstOpmxj8zHDCWZ9TL0ibbY
	Zl19px3+/z2o8yj+CMkhdGl4yvLJ+NgG77ZfyBgmPLSIyDaZXUEA+tIWDGtYx3aQxWFc
	qyYtAF4RuRCTcYKuVVck+Pbz5G3uUsD0j9xyzvMqyS0zw539OBZOi7kKcScG6M+RJP5H
	T5u/zMFpxDb+g7ABvyyzVj6PfuHrHmyl1QyKkeuAqK4TlSN3Kr2x0pzZCXrhyLkIo9s7
	W0FLMhHLJzAOiGFZH+yqPZwBPj/t7sim+WrNEWElMBE2TDPk0dftS01l18YlNF8KxPJZ
	Gjzw==
X-Gm-Message-State: AJcUukd/5gXliR5mwnclIESWn8dJA3nRNRfds23j6TldT44QmtLW2qdg
	7lP7pu2zs/NNnNQPAzc1XynqCg==
X-Received: by 2002:a1c:6e01:: with SMTP id j1mr7721387wmc.103.1546847907578; 
	Sun, 06 Jan 2019 23:58:27 -0800 (PST)
Received: from [192.168.1.33] (110.red-83-51-161.dynamicip.rima-tde.net.
	[83.51.161.110]) by smtp.gmail.com with ESMTPSA id
	v8sm72155258wrq.53.2019.01.06.23.58.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 06 Jan 2019 23:58:26 -0800 (PST)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20190104175847.6290-1-philmd@redhat.com>
	<20190104175847.6290-6-philmd@redhat.com>
	<ddc16ba0-339e-2d6a-5771-f63f8f084b8c@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <abe790c0-420a-5575-ce3a-c54100e97e47@redhat.com>
Date: Mon, 7 Jan 2019 08:58:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <ddc16ba0-339e-2d6a-5771-f63f8f084b8c@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.67
Subject: Re: [Qemu-devel] [PATCH 05/16] hw/devices: Move Blizzard
 declarations into a new header
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Rob Herring <robh@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
	Joel Stanley <joel@jms.id.au>, David Gibson <david@gibson.dropbear.id.au>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	Peter Chubb <peter.chubb@nicta.com.au>,
	=?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
	Richard Henderson <rth@twiddle.net>, Andrew Jeffery <andrew@aj.id.au>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Jan Kiszka <jan.kiszka@web.de>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 42iZpvdQPeTU

On 1/7/19 7:39 AM, Thomas Huth wrote:
> On 2019-01-04 18:58, Philippe Mathieu-Daudé wrote:
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  MAINTAINERS                   |  1 +
>>  hw/arm/nseries.c              |  1 +
>>  hw/display/blizzard.c         |  2 +-
>>  include/hw/devices.h          |  7 -------
>>  include/hw/display/blizzard.h | 21 +++++++++++++++++++++
>>  5 files changed, 24 insertions(+), 8 deletions(-)
>>  create mode 100644 include/hw/display/blizzard.h
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index dff4b98401..156ce9a698 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -640,6 +640,7 @@ M: Peter Maydell <peter.maydell@linaro.org>
>>  L: qemu-arm@nongnu.org
>>  S: Odd Fixes
>>  F: hw/arm/nseries.c
>> +F: include/hw/display/blizzard.h
> 
> While you're at it, also add an entry for hw/display/blizzard.c here?

Good idea :)

> 
>>  Palm
>>  M: Andrzej Zaborowski <balrogg@gmail.com>
>> diff --git a/hw/arm/nseries.c b/hw/arm/nseries.c
>> index 906b7ca22d..9521be1cef 100644
>> --- a/hw/arm/nseries.c
>> +++ b/hw/arm/nseries.c
>> @@ -31,6 +31,7 @@
>>  #include "hw/boards.h"
>>  #include "hw/i2c/i2c.h"
>>  #include "hw/devices.h"
>> +#include "hw/display/blizzard.h"
>>  #include "hw/block/flash.h"
>>  #include "hw/hw.h"
>>  #include "hw/bt.h"
>> diff --git a/hw/display/blizzard.c b/hw/display/blizzard.c
>> index 291abe6fca..471bd0ed99 100644
>> --- a/hw/display/blizzard.c
>> +++ b/hw/display/blizzard.c
>> @@ -21,7 +21,7 @@
>>  #include "qemu/osdep.h"
>>  #include "qemu-common.h"
>>  #include "ui/console.h"
>> -#include "hw/devices.h"
>> +#include "hw/display/blizzard.h"
>>  #include "ui/pixel_ops.h"
>>  
>>  typedef void (*blizzard_fn_t)(uint8_t *, const uint8_t *, unsigned int);
>> diff --git a/include/hw/devices.h b/include/hw/devices.h
>> index 5ad134232c..25f895b330 100644
>> --- a/include/hw/devices.h
>> +++ b/include/hw/devices.h
>> @@ -28,13 +28,6 @@ void tsc2005_set_transform(void *opaque, MouseTransformInfo *info);
>>  /* stellaris_input.c */
>>  void stellaris_gamepad_init(int n, qemu_irq *irq, const int *keycode);
>>  
>> -/* blizzard.c */
>> -void *s1d13745_init(qemu_irq gpio_int);
>> -void s1d13745_write(void *opaque, int dc, uint16_t value);
>> -void s1d13745_write_block(void *opaque, int dc,
>> -                void *buf, size_t len, int pitch);
>> -uint16_t s1d13745_read(void *opaque, int dc);
>> -
>>  /* cbus.c */
>>  typedef struct {
>>      qemu_irq clk;
>> diff --git a/include/hw/display/blizzard.h b/include/hw/display/blizzard.h
>> new file mode 100644
>> index 0000000000..8132557da1
>> --- /dev/null
>> +++ b/include/hw/display/blizzard.h
>> @@ -0,0 +1,21 @@
>> +/*
>> + * Epson S1D13744/S1D13745 (Blizzard/Hailstorm/Tornado) LCD/TV controller.
>> + *
>> + * Copyright (C) 2008 Nokia Corporation
>> + * Written by Andrzej Zaborowski <andrew@openedhand.com>
> 
> I don't think that this e-mail address is still valid since that company
> has been bought up > 10 years ago... so it likely does not make sense to
> mention it in new files anymore. So just mention the name?

Sure, I had no idea.

TIL: check email domain when moving emails.

>> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
>> + * See the COPYING file in the top-level directory.
>> + */
>> +#ifndef HW_DISPLAY_BLIZZARD_H
>> +#define HW_DISPLAY_BLIZZARD_H
>> +
>> +#include "hw/irq.h"
>> +
>> +void *s1d13745_init(qemu_irq gpio_int);
>> +void s1d13745_write(void *opaque, int dc, uint16_t value);
>> +void s1d13745_write_block(void *opaque, int dc,
>> +                          void *buf, size_t len, int pitch);
>> +uint16_t s1d13745_read(void *opaque, int dc);
>> +
>> +#endif
>>
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>

Thanks!
