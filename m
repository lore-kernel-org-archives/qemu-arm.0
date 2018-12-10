Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3373800wrt;
        Mon, 10 Dec 2018 01:15:23 -0800 (PST)
X-Google-Smtp-Source: AFSGD/V93GToudVmpND21JAgMl4/v+0NMjI+I9DkPkklshDA8Bra823cPaxYfG4GRAKEe2j06nh5
X-Received: by 2002:a37:3692:: with SMTP id d140mr9958262qka.108.1544433323363;
        Mon, 10 Dec 2018 01:15:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544433323; cv=none;
        d=google.com; s=arc-20160816;
        b=eDsQhdyFtF00jeB319A/Kmq58d3i4mh7By2/r3AMauQiqwNDsXV5CqKaCBN+A9k9Ob
         mQe5669sCeZvAZH2YcAo6I4mhvIuk7HtZohxrm3AjbXDK2r3lRG5crZ9wOaBbOx/pg6Y
         rqOlBFUXXi/wcR/K9MvVsKsQQ9DnFr6jHXA3mBUZ2Z5ClLKz7+2WUVmrLBV5z7WQ+OvY
         mmNcrWlqmJT9+dJMx+WXEwDcqWDJhR/l5tKcloLESamh8daGvyAjJaelWMCa2eSkk4uT
         9A6rQTwNcX7BUB73egcnAJXtMFwmrF+qKQhWUAEky5rWXs9K3DPA85n1XhlN1F68p8Fo
         ZnuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=nOPGsPuATkJMceNTW+9LX4hWQmJvEuYJBKx5Vzp8pBU=;
        b=pib68SGEQchmA1n0OcbGvRycqJ+oJt9zT2zkh7h1mMCa3YqTu6pl/GX+hBlhXjuprm
         aUEbWxbIWFtqBSgSMz2DhBGuEqZ5QDrhGZtP52igKcyWii5yyrZ1Voc5SSMl5XdElmRT
         9nhmc5FkCR0cE7nivj7p4UK+A8Wbiw9MXJx5f28Z/9yBdFdbfWM3jrimeGNDvP89BeUa
         Vop8JiveKZ0dnC7Q63JOKn8CRkwBsp9x8sruQPwF5Qw8jPwPapgwSfw900Z1vyaVRPjL
         W6u6DvZzyJolguP3UaOJ+BQPTo+M59WyW+vqz35Tp9cjlUVWg7zohyJvNu2vumDQSufb
         evYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y78si6302005qkb.169.2018.12.10.01.15.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 10 Dec 2018 01:15:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59833 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gWHes-0000b0-3J
	for alex.bennee@linaro.org; Mon, 10 Dec 2018 04:15:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46013)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gWHdh-0000Gd-Kq
	for qemu-devel@nongnu.org; Mon, 10 Dec 2018 04:14:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gWHde-0008LX-Tt
	for qemu-devel@nongnu.org; Mon, 10 Dec 2018 04:14:09 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:42189)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gWHde-0008Ja-JR
	for qemu-devel@nongnu.org; Mon, 10 Dec 2018 04:14:06 -0500
Received: by mail-wr1-f66.google.com with SMTP id q18so9611339wrx.9
	for <qemu-devel@nongnu.org>; Mon, 10 Dec 2018 01:14:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=nOPGsPuATkJMceNTW+9LX4hWQmJvEuYJBKx5Vzp8pBU=;
	b=kZadcVB2zHlIitl+9+VmQ1WLSUD4eG/Gc34WsusabAnCigwKCi6gGiSQALYYOo36wk
	iiyYx99F4bABgc3FRuxod7jg7gwbrZ8vgjp6t5q+SOzfyEWbT/Op7sHZd+uwBzoqrX6P
	64dsYE9s3v+KoqT68x9fvPJqkx3ew1lQyAj/MHrIpvC+dL5otTYvfTnATNVUbyJkFE4b
	d08nM695dfbzXbP08ce9wER7bev2oEXI/aChC5SU7Fm5VzS6IrRbR1MyEb74p+0cXJZH
	LVQmKggO9MdTP+CnNWWvGctVNaJI1rXzElPFh2k6X+fWQxc468Qu+9lGgqBOiqk6yh3+
	I8QQ==
X-Gm-Message-State: AA+aEWakiOlwuvBfLvB7Wq61Q3xRdkTmNmkysjiEYpEbMMbfjw4yy01M
	3RVkDH+qvuHlUUvrS0whvMGczg==
X-Received: by 2002:adf:e34b:: with SMTP id n11mr8510412wrj.91.1544433243258; 
	Mon, 10 Dec 2018 01:14:03 -0800 (PST)
Received: from [192.168.1.34] (172.red-88-21-202.staticip.rima-tde.net.
	[88.21.202.172]) by smtp.gmail.com with ESMTPSA id
	o82sm18196652wmo.29.2018.12.10.01.14.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Dec 2018 01:14:02 -0800 (PST)
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20181207170400.5129-1-philmd@redhat.com>
	<20181207170400.5129-3-philmd@redhat.com>
	<20181207125716-mutt-send-email-mst@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <5137aa75-6ca3-8779-1320-8e46bacefb7d@redhat.com>
Date: Mon, 10 Dec 2018 10:14:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <20181207125716-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.66
Subject: Re: [Qemu-devel] [PATCH 2/6] hw/arm: Remove unused include
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
	Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: S4JWUuO2F1Uo

Hi Michael, Peter.

On 12/7/18 6:57 PM, Michael S. Tsirkin wrote:
> On Fri, Dec 07, 2018 at 06:03:56PM +0100, Philippe Mathieu-Daudé wrote:
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  hw/arm/virt-acpi-build.c | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>> index 5785fb697c..98d7f7cf20 100644
>> --- a/hw/arm/virt-acpi-build.c
>> +++ b/hw/arm/virt-acpi-build.c
>> @@ -35,7 +35,6 @@
>>  #include "target/arm/cpu.h"
>>  #include "hw/acpi/acpi-defs.h"
>>  #include "hw/acpi/acpi.h"
>> -#include "hw/nvram/fw_cfg.h"
>>  #include "hw/acpi/bios-linker-loader.h"
>>  #include "hw/loader.h"
>>  #include "hw/hw.h"
> 
> 
> This file uses fw_cfg_add_file, looks wrong.

Previously I thought if another include (here hw/loader.h) already pulls
this header, we can drop it, but Peter Maydell explained me this not
safe for refactors:

  Generally I think that if a .c file directly uses function X declared
  in header Y it should #include Y, even if it happens that it already
  includes other header Z that includes Y. Otherwise if we refactor Z
  later such that it no longer needs to include Y, it will break
  compilation of the .c file. (That is, Z including Y is a detail of
  the implementation of Z, not a guarantee made by Z to its users.)

https://lists.gnu.org/archive/html/qemu-devel/2018-11/msg02460.html

I'm sorry I forgot to update this in the series :/

Regards,

Phil.
