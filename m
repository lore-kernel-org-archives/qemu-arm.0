Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp1683198lfc;
        Tue, 3 Dec 2019 07:45:06 -0800 (PST)
X-Google-Smtp-Source: APXvYqz7eyBoymQvR262tcXgxjxFIV3+dYwYYD2KLi1FOLRqoEAqHk3AqmUsyaMm4s8amSl0y8Mc
X-Received: by 2002:ac8:327b:: with SMTP id y56mr5526439qta.161.1575387906573;
        Tue, 03 Dec 2019 07:45:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575387906; cv=none;
        d=google.com; s=arc-20160816;
        b=AGb1jZQDRp0OLDJd5IfbCOQfv+pc2A6wepUTIfi+7DGeAQ24IjUoisjOIb8sP6Ap3F
         /Ooi9dGgbb4yALu/LdN0a5rKmYdoWOREzINuNeDXlQRxO4uo+INB+QymWHMiAXDNSHDX
         o2i7dMrnRzqGUWcH3/BRGs1EK1SjjwqZ7CI2cq7s2HVIPmwlOUq/O13YqEU7bBMTgkTb
         Tv1r4+9aylOt0onQjQl6vxXOXLU8q3SkilgOYtwDTp7kXeSaUgGNvXG5WTof/rlUqnJB
         q3XgMzgbsqP4+ixvBrS5Z63MJyYvD6I9wi0UbNt3WngQDSlHd1BV35yXxPmzW4rd2OQe
         4tGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=WeerkaiTznFWZe+uFrLFBE25ivmPwQ5NX0TUY7VdjnU=;
        b=cTT4G/X2B1qHXZ6R5Qh1EB8GLw6n9nCbHZonGtwbKd2vBovd2ftTZXmAuEtBGQtlsj
         1vREyu6qaRko9JONjcgac3idMnoLXnWbruIH+PmjCuC0AMTRmajfhnFsbWthAYPpKYd2
         om6LvOaL1zc1WrWHqgc01ZND6CXpe4RlNk+OiKdTl2fN+eb1n6EyOoJ0ZVN5lFOaPTq6
         RA/fyUnRq9YtfhazjqfrS07dV+b6Xe5OEoIbZjQ6rVf254ymyebjM9qFdkbO/EEL4a6Z
         y5G/Gq3g9bSdMcSr0K8ZaNYnMglPEqGZBWoOHjGKbNnFZFKKeBgXmjXCA2hljbTHOT/R
         ZG2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Q1+cA51v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v19si2160747qvz.108.2019.12.03.07.45.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Dec 2019 07:45:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Q1+cA51v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1icAMH-0006d1-0b
	for alex.bennee@linaro.org; Tue, 03 Dec 2019 10:45:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47392)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1icA7L-0000YE-Bc
 for qemu-arm@nongnu.org; Tue, 03 Dec 2019 10:29:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1icA7E-0003iZ-IX
 for qemu-arm@nongnu.org; Tue, 03 Dec 2019 10:29:30 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:56163
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1icA78-0003bZ-On
 for qemu-arm@nongnu.org; Tue, 03 Dec 2019 10:29:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575386958;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WeerkaiTznFWZe+uFrLFBE25ivmPwQ5NX0TUY7VdjnU=;
 b=Q1+cA51vv7EbACpYpkWsjpbfYqQeGIIjSJEVxmWMiAasIrbzp2KZrg/q/FbVO614Ejg/lp
 RJjyucd1TdzQRUDbNwkZ7j+jnl7BQb9bOcklPMNKTpf9is5IrS+xk4pzCgQQDiH8r7D7zZ
 EJKuH7J9shSsSSXNlkTU1XeekvuEeyg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430-NkLAkHsWMk67nQG7SyUGbw-1; Tue, 03 Dec 2019 10:29:17 -0500
Received: by mail-wm1-f71.google.com with SMTP id y133so1055335wmd.8
 for <qemu-arm@nongnu.org>; Tue, 03 Dec 2019 07:29:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WeerkaiTznFWZe+uFrLFBE25ivmPwQ5NX0TUY7VdjnU=;
 b=Lcn2sdMEKhZc87W/T0144HN+Q3kwsyEEY8H1I8aP6RaDnbSbxKfOEERSwcpTWsRvkB
 yjNuHHoYOszDLDjxXt7IH5StCzNVzMBIgoD2qghBZ65nD0TyeYN4kklBc5ciQN/6F+aj
 dYtGrRDzdyk0e9FEj9DG8Zs534a4kWGjsZ/6jEaxBeh3H8IY60ZtHIftW8yyDazdrGmU
 4JrzIN4WUxDPf9yOzI1gJNQoiW7lALJZ4ZjNOnb+ocWLiTaDDdh5ZkLE0k6DkcTHmTGY
 gGq/6ZhDTukEbJiJ90euRMzs45kWh4m6rg+gN8LZE9k6k+pz+xI55oWx1Md5tCbM6Kn2
 68sQ==
X-Gm-Message-State: APjAAAUsAAzfDjHxOMny83KnEK2SASmrGSYz3kJJIjJ99cpBjrbQ41A8
 YS6GnaXSFaSFK1MWffS/vR9kr0DHHtRPKLBsqPDdO1TEDXqjbx3bc8j65O94teEiHPmmDmsLZFz
 FcSoAb4WhnmYC
X-Received: by 2002:a5d:4acb:: with SMTP id y11mr6035643wrs.106.1575386955687; 
 Tue, 03 Dec 2019 07:29:15 -0800 (PST)
X-Received: by 2002:a5d:4acb:: with SMTP id y11mr6035607wrs.106.1575386955402; 
 Tue, 03 Dec 2019 07:29:15 -0800 (PST)
Received: from [192.168.1.35] (182.red-88-21-103.staticip.rima-tde.net.
 [88.21.103.182])
 by smtp.gmail.com with ESMTPSA id c1sm3105575wmk.22.2019.12.03.07.29.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Dec 2019 07:29:14 -0800 (PST)
Subject: Re: [PATCH v6 9/9] hw/arm/xilinx_zynq: connect uart clocks to slcr
To: Damien Hedde <damien.hedde@greensocs.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20190904125531.27545-1-damien.hedde@greensocs.com>
 <20190904125531.27545-10-damien.hedde@greensocs.com>
 <CAFEAcA96yu6Uttsi6eZokjyxE8At18ADF+Q6c7Na2ArvdLME+Q@mail.gmail.com>
 <f373af20-0df4-384f-b1a3-10bf873c315e@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <db2836fa-e2f1-d1ab-88be-1b24f5a18302@redhat.com>
Date: Tue, 3 Dec 2019 16:29:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <f373af20-0df4-384f-b1a3-10bf873c315e@greensocs.com>
Content-Language: en-US
X-MC-Unique: NkLAkHsWMk67nQG7SyUGbw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Mark Burton <mark.burton@greensocs.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: m5lixh7Wsw2V

On 12/3/19 3:59 PM, Damien Hedde wrote:
> On 12/2/19 4:34 PM, Peter Maydell wrote:
>> On Wed, 4 Sep 2019 at 13:56, Damien Hedde <damien.hedde@greensocs.com> wrote:
>>>
>>> Add the connection between the slcr's output clocks and the uarts inputs.
>>>
>>> Also add the main board clock 'ps_clk', which is hard-coded to 33.33MHz
>>> (the default frequency). This clock is used to feed the slcr's input
>>> clock.
>>>
>>> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
>>
>> Nothing obviously wrong in the body of the patch, but as with
>> 7 and 8, review from a Xilinx person would be helpful.
>>
>> /* board base frequency: 33.333333 MHz */
>> #define PS_CLK_FREQUENCY (100 * 1000 * 1000 / 3)
>>
>> This is interesting, because it's not an integer... I'll come back
>> to this topic in a reply to the cover letter in a moment.
> 
> For this precise case, what I wanted is the resulting integer which I
> got from the device trees in linux (btw I should probably add this point
> in  comment). Just thought it was more readable this way than "33333333".

FWIW I'm auditing if it is possible to use the float type for 
frequencies (before to ask on the list if this makes sense), because in 
hw/core/ptimer we use timers with periods, and loose some precision 
using 1/freq again.

Also we have MiB/KiB in "qemu/units.h" and I'd like to introduce MHz/KHz.

