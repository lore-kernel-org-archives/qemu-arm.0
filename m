Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp2959722wrp;
        Mon, 23 Sep 2019 11:09:42 -0700 (PDT)
X-Google-Smtp-Source: APXvYqynDNtbxx1P/nwALDfjhruDJETkuPAipSMK91/IsjGcu6iXC9JOJo5x02nbj1tR4wcfTaYA
X-Received: by 2002:a50:eb8b:: with SMTP id y11mr1452867edr.200.1569262182308;
        Mon, 23 Sep 2019 11:09:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569262182; cv=none;
        d=google.com; s=arc-20160816;
        b=0OZTfIRrYA0mZkzeXg6jR0Xy2vmINrMhKkCwoVz5nPprTQIiTTC3BZvuq/iXKjU1y0
         UIFoGBXvSKMmTsFnuJ/fNroQpDEZhJK95/KilUWshx9rVzkUgrifNax6yqjyFzwI/DE0
         W9gUyEHOu45pnotUSSmbn/5gJraX9YtmhTSm0XLO7EtpFuLT9/99RJWXzImopNMY8iMF
         zkFi9zA+16YDZpu/608GYuKHQutvPnBlyCvXLXW0yhcFuOIMzTHbtMGoR8LaT+f74PlV
         o/rPmPJnbu08cGoprG+AwA/h3MJIQ+UvQi/83R4m0/Q7xDFs/PTzrO8roYoDm7S5P5CX
         OmLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:organization:autocrypt:openpgp:from:references:to
         :subject;
        bh=VCOZyqpSPaEEJ5GJn7eduTsoOddqEr+L+Sl9YUWHnB8=;
        b=UwV/zoP7xA8BBoLPPlLN+p5DYcFMraT0Kw0rGqM+URbyuzPRGy0antOEsn5WhSXnLo
         X0L4EHLuRz0F4tIoKGz/PM4cSsF1qFGTGwGnuAbrD7Fw6ZCS0FqptJkjabzFw5UHDgOj
         FW7vxc6fF+Xhw/ocKOh8k9E+YmYGfV1el9jN+ApSnLkvGhkva3paMqNs38yXHEtUvHFt
         fbg3re6FKJQQvsljeO+X2aCLdE8K88QIbS6b/sjxR9gIzzRTt/XYTlwKGjBanZq4aWA1
         TBaz3LT1N+G6l6mdGbPHiGkDRQhuiMlDve2AmzVucLqHw0W2Q5NGav9biXSXkdM8E4rw
         5P0w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m55si7057754edc.17.2019.09.23.11.09.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Sep 2019 11:09:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iCSmL-00073l-4X
	for alex.bennee@linaro.org; Mon, 23 Sep 2019 14:09:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46917)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iCSm0-00073Z-Vr
 for qemu-arm@nongnu.org; Mon, 23 Sep 2019 14:09:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iCSly-00083Q-Pg
 for qemu-arm@nongnu.org; Mon, 23 Sep 2019 14:09:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42654)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>)
 id 1iCSly-00083E-IJ; Mon, 23 Sep 2019 14:09:18 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 628E03175281;
 Mon, 23 Sep 2019 18:09:17 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-120.ams2.redhat.com [10.36.116.120])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4612919D70;
 Mon, 23 Sep 2019 18:09:09 +0000 (UTC)
Subject: Re: [PATCH 2/4] target/arm: Move cortex-m related functions to new
 file v7m.c
To: Auger Eric <eric.auger@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20190921150420.30743-1-thuth@redhat.com>
 <20190921150420.30743-3-thuth@redhat.com>
 <bd6efd14-9200-98e2-4f76-dda101f85274@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=thuth@redhat.com; prefer-encrypt=mutual; keydata=
 mQINBFH7eUwBEACzyOXKU+5Pcs6wNpKzrlJwzRl3VGZt95VCdb+FgoU9g11m7FWcOafrVRwU
 yYkTm9+7zBUc0sW5AuPGR/dp3pSLX/yFWsA/UB4nJsHqgDvDU7BImSeiTrnpMOTXb7Arw2a2
 4CflIyFqjCpfDM4MuTmzTjXq4Uov1giGE9X6viNo1pxyEpd7PanlKNnf4PqEQp06X4IgUacW
 tSGj6Gcns1bCuHV8OPWLkf4hkRnu8hdL6i60Yxz4E6TqlrpxsfYwLXgEeswPHOA6Mn4Cso9O
 0lewVYfFfsmokfAVMKWzOl1Sr0KGI5T9CpmRfAiSHpthhHWnECcJFwl72NTi6kUcUzG4se81
 O6n9d/kTj7pzTmBdfwuOZ0YUSqcqs0W+l1NcASSYZQaDoD3/SLk+nqVeCBB4OnYOGhgmIHNW
 0CwMRO/GK+20alxzk//V9GmIM2ACElbfF8+Uug3pqiHkVnKqM7W9/S1NH2qmxB6zMiJUHlTH
 gnVeZX0dgH27mzstcF786uPcdEqS0KJuxh2kk5IvUSL3Qn3ZgmgdxBMyCPciD/1cb7/Ahazr
 3ThHQXSHXkH/aDXdfLsKVuwDzHLVSkdSnZdt5HHh75/NFHxwaTlydgfHmFFwodK8y/TjyiGZ
 zg2Kje38xnz8zKn9iesFBCcONXS7txENTzX0z80WKBhK+XSFJwARAQABtB5UaG9tYXMgSHV0
 aCA8dGh1dGhAcmVkaGF0LmNvbT6JAjgEEwECACIFAlVgX6oCGwMGCwkIBwMCBhUIAgkKCwQW
 AgMBAh4BAheAAAoJEC7Z13T+cC21EbIP/ii9cvT2HHGbFRl8HqGT6+7Wkb+XLMqJBMAIGiQK
 QIP3xk1HPTsLfVG0ao4hy/oYkGNOP8+ubLnZen6Yq3zAFiMhQ44lvgigDYJo3Ve59gfe99KX
 EbtB+X95ODARkq0McR6OAsPNJ7gpEUzfkQUUJTXRDQXfG/FX303Gvk+YU0spm2tsIKPl6AmV
 1CegDljzjycyfJbk418MQmMu2T82kjrkEofUO2a24ed3VGC0/Uz//XCR2ZTo+vBoBUQl41BD
 eFFtoCSrzo3yPFS+w5fkH9NT8ChdpSlbNS32NhYQhJtr9zjWyFRf0Zk+T/1P7ECn6gTEkp5k
 ofFIA4MFBc/fXbaDRtBmPB0N9pqTFApIUI4vuFPPO0JDrII9dLwZ6lO9EKiwuVlvr1wwzsgq
 zJTPBU3qHaUO4d/8G+gD7AL/6T4zi8Jo/GmjBsnYaTzbm94lf0CjXjsOX3seMhaE6WAZOQQG
 tZHAO1kAPWpaxne+wtgMKthyPLNwelLf+xzGvrIKvLX6QuLoWMnWldu22z2ICVnLQChlR9d6
 WW8QFEpo/FK7omuS8KvvopFcOOdlbFMM8Y/8vBgVMSsK6fsYUhruny/PahprPbYGiNIhKqz7
 UvgyZVl4pBFjTaz/SbimTk210vIlkDyy1WuS8Zsn0htv4+jQPgo9rqFE4mipJjy/iboDuQIN
 BFH7eUwBEAC2nzfUeeI8dv0C4qrfCPze6NkryUflEut9WwHhfXCLjtvCjnoGqFelH/PE9NF4
 4VPSCdvD1SSmFVzu6T9qWdcwMSaC+e7G/z0/AhBfqTeosAF5XvKQlAb9ZPkdDr7YN0a1XDfa
 +NgA+JZB4ROyBZFFAwNHT+HCnyzy0v9Sh3BgJJwfpXHH2l3LfncvV8rgFv0bvdr70U+On2XH
 5bApOyW1WpIG5KPJlDdzcQTyptOJ1dnEHfwnABEfzI3dNf63rlxsGouX/NFRRRNqkdClQR3K
 gCwciaXfZ7ir7fF0u1N2UuLsWA8Ei1JrNypk+MRxhbvdQC4tyZCZ8mVDk+QOK6pyK2f4rMf/
 WmqxNTtAVmNuZIwnJdjRMMSs4W4w6N/bRvpqtykSqx7VXcgqtv6eqoDZrNuhGbekQA0sAnCJ
 VPArerAZGArm63o39me/bRUQeQVSxEBmg66yshF9HkcUPGVeC4B0TPwz+HFcVhheo6hoJjLq
 knFOPLRj+0h+ZL+D0GenyqD3CyuyeTT5dGcNU9qT74bdSr20k/CklvI7S9yoQje8BeQAHtdV
 cvO8XCLrpGuw9SgOS7OP5oI26a0548M4KldAY+kqX6XVphEw3/6U1KTf7WxW5zYLTtadjISB
 X9xsRWSU+Yqs3C7oN5TIPSoj9tXMoxZkCIHWvnqGwZ7JhwARAQABiQIfBBgBAgAJBQJR+3lM
 AhsMAAoJEC7Z13T+cC21hPAQAIsBL9MdGpdEpvXs9CYrBkd6tS9mbaSWj6XBDfA1AEdQkBOn
 ZH1Qt7HJesk+qNSnLv6+jP4VwqK5AFMrKJ6IjE7jqgzGxtcZnvSjeDGPF1h2CKZQPpTw890k
 fy18AvgFHkVk2Oylyexw3aOBsXg6ukN44vIFqPoc+YSU0+0QIdYJp/XFsgWxnFIMYwDpxSHS
 5fdDxUjsk3UBHZx+IhFjs2siVZi5wnHIqM7eK9abr2cK2weInTBwXwqVWjsXZ4tq5+jQrwDK
 cvxIcwXdUTLGxc4/Z/VRH1PZSvfQxdxMGmNTGaXVNfdFZjm4fz0mz+OUi6AHC4CZpwnsliGV
 ODqwX8Y1zic9viSTbKS01ZNp175POyWViUk9qisPZB7ypfSIVSEULrL347qY/hm9ahhqmn17
 Ng255syASv3ehvX7iwWDfzXbA0/TVaqwa1YIkec+/8miicV0zMP9siRcYQkyTqSzaTFBBmqD
 oiT+z+/E59qj/EKfyce3sbC9XLjXv3mHMrq1tKX4G7IJGnS989E/fg6crv6NHae9Ckm7+lSs
 IQu4bBP2GxiRQ+NV3iV/KU3ebMRzqIC//DCOxzQNFNJAKldPe/bKZMCxEqtVoRkuJtNdp/5a
 yXFZ6TfE1hGKrDBYAm4vrnZ4CXFSBDllL59cFFOJCkn4Xboj/aVxxJxF30bn
Organization: Red Hat
Message-ID: <8585b93b-e239-829b-d634-b89941f27aed@redhat.com>
Date: Mon, 23 Sep 2019 20:09:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <bd6efd14-9200-98e2-4f76-dda101f85274@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Mon, 23 Sep 2019 18:09:17 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6Sxi61zmSiJ7

On 23/09/2019 16.31, Auger Eric wrote:
> Hi Thomas,
>=20
> On 9/21/19 5:04 PM, Thomas Huth wrote:
>> We are going to make CONFIG_ARM_V7M optional, so the related cortex-m
>> CPUs should only be created if the switch is enabled. This can best
>> be done if the code resides in a separate file, thus move the related
>> functions to a new file v7m.c which only gets compiled if CONFIG_ARM_V=
7M
>> is enabled.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>  target/arm/Makefile.objs |   1 +
>>  target/arm/cpu.c         | 146 -----------------------------
>>  target/arm/v7m.c         | 193 ++++++++++++++++++++++++++++++++++++++=
+
>>  3 files changed, 194 insertions(+), 146 deletions(-)
>>  create mode 100644 target/arm/v7m.c
[...]
>> diff --git a/target/arm/v7m.c b/target/arm/v7m.c
>> new file mode 100644
>> index 0000000000..505043febe
>> --- /dev/null
>> +++ b/target/arm/v7m.c
>> @@ -0,0 +1,193 @@
>> +/*
>> + * ARM v7m helpers.
>> + *
>> + * This code is licensed under the GNU GPL v2 or later.
>> + *
>> + * SPDX-License-Identifier: GPL-2.0-or-later
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "qemu/qemu-print.h"
>> +#include "qemu-common.h"
>> +#include "target/arm/idau.h"
>> +#include "qemu/module.h"
>> +#include "qapi/error.h"
>> +#include "qapi/visitor.h"
>> +#include "cpu.h"
>> +#include "internals.h"
>> +#include "exec/exec-all.h"
>> +#include "hw/qdev-properties.h"
>> +#if !defined(CONFIG_USER_ONLY)
>> +#include "hw/loader.h"
>> +#include "hw/boards.h"
>> +#endif
>> +#include "sysemu/sysemu.h"
>> +#include "sysemu/tcg.h"
>> +#include "sysemu/hw_accel.h"
>> +#include "disas/capstone.h"
>> +#include "fpu/softfloat.h"
>
> I guess some of those headers are not needed.

Yeah, I just copy-n-pasted from the source file ... I'll check what can
be omitted (if this patch series has a chance at all...)

>> +
>> +#if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
>> +
>> +static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, int interrupt_re=
quest)
>> +{
>> +    CPUClass *cc =3D CPU_GET_CLASS(cs);
>> +    ARMCPU *cpu =3D ARM_CPU(cs);
>> +    CPUARMState *env =3D &cpu->env;
>> +    bool ret =3D false;
>> +
>> +    /*
>> +     * ARMv7-M interrupt masking works differently than -A or -R.
>> +     * There is no FIQ/IRQ distinction. Instead of I and F bits
>> +     * masking FIQ and IRQ interrupts, an exception is taken only
>> +     * if it is higher priority than the current execution priority
>> +     * (which depends on state like BASEPRI, FAULTMASK and the
>> +     * currently active exception).
>> +     */
>> +    if (interrupt_request & CPU_INTERRUPT_HARD
>> +        && (armv7m_nvic_can_take_pending_exception(env->nvic))) {
>
> so what is the status wrt m_helper.c which stays unconditionally
> compiled. m_helper functions seem to called from target/arm/translate.c
> mostly. Have you abandoned the stub idea. It may be confusing to have 2
> different helper files. At least a comment explaining where a new helpe=
r
> shall go may be useful.

All the HELPER() functions should definitely stay in m_helper.c. They
are required for linking. Or do you prefer a stub file instead? Then we
could maybe make the whole m_helper.c conditional in the Makefile.objs
instead.

However, there's one thing I currently don't quite understand in this
code (since I'm not an ARM guy, sorry) : There are references to "v8" in
m_helper.c, too. Is that related to a separate CPU type, ie. should the
v8 code also be available when CONFIG_ARM_V7M is disabled? Or can the
code in m_helper.c be disabled completely if CONFIG_ARM_V7M is not set?

 Thomas
