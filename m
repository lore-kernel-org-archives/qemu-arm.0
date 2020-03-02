Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp2717638lfg;
        Mon, 2 Mar 2020 10:04:49 -0800 (PST)
X-Google-Smtp-Source: ADFU+vsGYbFTLyTeIBD+3rEQyEpkW3zKEB//CZyQ2wbK7U26Petw+utdZ6qqlhZcAb8pvcdjIBxW
X-Received: by 2002:a37:a6d4:: with SMTP id p203mr480718qke.350.1583172289766;
        Mon, 02 Mar 2020 10:04:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583172289; cv=none;
        d=google.com; s=arc-20160816;
        b=f4KA3uXui+8Q63D1fBbZpAUWC1LjXEKHD09wQgmI9yLxdj+YnFYEO4X9sPWiAaBDAp
         RscHJZCcYGKh68i9+DkuReU/oIDx4zIaNYDL+cswS9HwLslrRxtBgifRaQZfcib0h66z
         uUQB3fmrTZQKGmS//ph0iUY/TkZ+z7utVZnBzxDLDjpur4kpsXVFE0/8IbMZyF+QAe+n
         ubr8KyYBryAqCeaFrcrOEZZRBy9DjaHTKNyL7hPMgMTmnEuOjNamLk5cZMuX7M/xseZp
         lJpFIEFzEeOMvGO8VFt7AO4Hhv9s9079EEvL7RFwl6T5S5eollcjMFAoMZDF1hID6SFw
         6L2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=HrOu+vdhVHFpjxG/pfbjlHgkQTWYLKfEvDuxEWVBJxs=;
        b=DBiWQA3cciHI3ViiG7MbzXk4LM2nQsJHUzNfUKKLFjMRwnJPQP1EYcG5Qw2lw3Ju9R
         2LkxLjOsNDIsgQVfM4LeNZ0f8khCTzGrVXM1R6ElBeWk/dEfLn0rlSqlChhnfPdfjmNB
         mlwM6xmWkcdIWeoVioWTXs049WwVzsAAF/Vr/HsHUjvMhQxac6bfb1clXFxQA8K72IhV
         /pRfqCKLDioGIe9uBU3KjwQ1qwSY/DT/4o/ROCnS9ujg7gek3UUTesOQ2ArrWOga9bPd
         mHnEHotFFC7XHeQwn2jwekY+YGq8VslW8w6/CnG7TU7rUei45TqdGGcz2eMDlVGf5N9z
         QcZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=VceoQGOH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l20si6606675qkg.169.2020.03.02.10.04.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Mar 2020 10:04:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=VceoQGOH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j8pQv-0007Th-6Y
	for alex.bennee@linaro.org; Mon, 02 Mar 2020 13:04:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40462)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j8pQl-0007Qr-Pn
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 13:04:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j8pQk-0001Au-Na
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 13:04:39 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:45431
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j8pQk-0001Aj-KB
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 13:04:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583172278;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HrOu+vdhVHFpjxG/pfbjlHgkQTWYLKfEvDuxEWVBJxs=;
 b=VceoQGOHtFVQsrYFyE+Gu5oLDPhwzcGqULTvUuhUSf2Xg4KFQ8gGlbKU33sr4BvpM0Ecbd
 lPf5VOcFFTEwTs33HMc3Pf1FTN3K6CLw2mxJ3Wjhoty4jkYMxXEKBgvkC0cLwgow9Q52Me
 HIbBA1qtMbsZ1QM+2Bx4WKBYgEZlkMU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-mO8p3mYpPvmfhODOKWlkmQ-1; Mon, 02 Mar 2020 13:04:36 -0500
X-MC-Unique: mO8p3mYpPvmfhODOKWlkmQ-1
Received: by mail-wm1-f72.google.com with SMTP id g26so36691wmk.6
 for <qemu-arm@nongnu.org>; Mon, 02 Mar 2020 10:04:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HrOu+vdhVHFpjxG/pfbjlHgkQTWYLKfEvDuxEWVBJxs=;
 b=bqZMc5qFczoObDcVA9SIjSP4KQB6iEmC/RHz9Vmk020XNYWrBFxjlC9FoUTaZzNzst
 ap8gFATpmGpRqNBvnvlKQ0FmfIBCogADaAoTNjQDqct6paKh2DEXzwF7S2OZQdFktUdP
 UKAxC6V85Jh0+V44IC9E5zxFI+IetCxAulSXy+t+kBeZE0SjUkCWAa+A5lT3yo1KNIw2
 8J1AiFtLx2OqY8Rb5hfivrYIPjFvJ6GtGn3MsOYGwn+px6JnNxS9tJ4/fMmDMQO0WFOK
 T5tsuyyDlPOWkO8rFVeOhok0ObNgUPJ/ZCKZhWo8AFXO1O+X1azRJCte9Bu4eML+q7yc
 bI7Q==
X-Gm-Message-State: ANhLgQ2POAAhXZOZijAUP61erXX9Vz59BXyK6MFU/uJ1/A6p7EWNv8pD
 MYp7hiYw9/PIA8DNVNHq+iEcHGPOKHLydbIhOmsG8lH9IPqSOgpDUmJkiaNWgiklcYqkrjIlx2j
 R+h5w24tuBknr
X-Received: by 2002:adf:e686:: with SMTP id r6mr788804wrm.41.1583172275140;
 Mon, 02 Mar 2020 10:04:35 -0800 (PST)
X-Received: by 2002:adf:e686:: with SMTP id r6mr788776wrm.41.1583172274797;
 Mon, 02 Mar 2020 10:04:34 -0800 (PST)
Received: from ?IPv6:2a01:e35:2fb0:49e0:3f7b:4b69:b9c:cdc0?
 ([2a01:e35:2fb0:49e0:3f7b:4b69:b9c:cdc0])
 by smtp.gmail.com with ESMTPSA id v8sm28684314wrw.2.2020.03.02.10.04.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2020 10:04:34 -0800 (PST)
Subject: Re: [PATCH v1 4/4] hw/arm/cubieboard: report error when using
 unsupported -bios argument
To: Peter Maydell <peter.maydell@linaro.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>
References: <20200227220149.6845-1-nieklinnenbank@gmail.com>
 <20200227220149.6845-5-nieklinnenbank@gmail.com>
 <CAFEAcA94U=G7Bhiayt5YyJHFUMjyKwT1m5VNOH+1rV-NMysR7Q@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <52400d43-3890-68cb-0e63-35c3636be19a@redhat.com>
Date: Mon, 2 Mar 2020 19:04:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA94U=G7Bhiayt5YyJHFUMjyKwT1m5VNOH+1rV-NMysR7Q@mail.gmail.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: Beniamino Galvani <b.galvani@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QxDxiGvleWxo

On 3/2/20 4:44 PM, Peter Maydell wrote:
> On Thu, 27 Feb 2020 at 22:02, Niek Linnenbank <nieklinnenbank@gmail.com> wrote:
>>
>> The Cubieboard machine does not support the -bios argument.
>> Report an error when -bios is used and exit immediately.
>>
>> Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
>> ---
>>   hw/arm/cubieboard.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/hw/arm/cubieboard.c b/hw/arm/cubieboard.c
>> index 6c55d9056f..871b1beef4 100644
>> --- a/hw/arm/cubieboard.c
>> +++ b/hw/arm/cubieboard.c
>> @@ -19,6 +19,7 @@
>>   #include "exec/address-spaces.h"
>>   #include "qapi/error.h"
>>   #include "cpu.h"
>> +#include "sysemu/sysemu.h"
>>   #include "hw/sysbus.h"
>>   #include "hw/boards.h"
>>   #include "hw/arm/allwinner-a10.h"
>> @@ -33,6 +34,12 @@ static void cubieboard_init(MachineState *machine)
>>       AwA10State *a10;
>>       Error *err = NULL;
>>
>> +    /* BIOS is not supported by this board */
>> +    if (bios_name) {
>> +        error_report("BIOS not supported for this machine");
>> +        exit(1);
>> +    }
> 
> We don't usually bother to check this, but I guess there's
> no reason not to.

I agree this is confusing to expect the machine boot from a flash when 
using -bios and having to debug until figuring out the reason.

This -bios is a generic machine option, maybe we could move this check 
to the common machine code.

> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> thanks
> -- PMM
> 

