Received: by 10.28.71.27 with SMTP id u27csp4659177wma;
        Tue, 27 Feb 2018 02:25:03 -0800 (PST)
X-Google-Smtp-Source: AG47ELudszmgUvLlEKAwYWOK035I8o0hvqNGv2riagYBc+f1SCshk6GsJPd9L14z/MQgb5GBgSK6
X-Received: by 2002:a25:8582:: with SMTP id x2-v6mr5437477ybk.296.1519727103364;
        Tue, 27 Feb 2018 02:25:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519727103; cv=none;
        d=google.com; s=arc-20160816;
        b=rvhuGQ71o9PEF21qT8BGNNPx1xoSlAKNWWvXMI47EG6ThatLSoQwMTsuzNOKAzmUD+
         hAbHPeUQ0xc8/BScgpna2+FrdFI5XEQkP1tpv0L0A3ysTyCa6rH5L4bppu9RBb88BynS
         VQqfRUja1kDduybdgPquRID1qUDlNie4S03FfIfrkBRlC1s9qUdp/YfBL2qiOUOuqEnb
         ggalpNeleGjXsofqfbkor90TKAYlRRbPYkIlyhqX+ih3vU86JGfSEAPaJR9gLQeBWHSK
         zTfq3Djiw/SYrIRJs5V//Uq9ObpsJvngvQkFjEkLmNUdqcoFV/Auyu24VZXTSyLszj2F
         +AmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=OHzTQM/t5u2Dbs2nRn2ApjRukVa5BkBAvD9OtGRMvYQ=;
        b=yh2pjICiI4yDGhYxPgfJOI0Bx3+zmeXFlDorNqvWwddWLRtFeiX59M5IVv9yGqI2cb
         e4JczZ6mrd1vGQqU359+RACSzXxh7u5V8gPLWfQ1AOUndPtU5nGKhw5yckO0cuMhP6Ej
         7QJQkKAVrN4d6WKQyy7kLtTL/AjuN01y9Cp4vY1NfJxIzKBlFR76BphYfv4Dn3MnjozN
         88j8ZcTPFakkVmFmp537FE5HFnaKc4uKu0BuevEYFC8BOC2af1Iym/lfLyOlTPwg/S/Q
         i/lIjrfspvNXL2QCm2hvCBv7KE3sQgE+CXz7OAFgLrM9P9qvpUNglxoo+YeeT8Igyxl/
         SwLg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=T4Cc6Mb8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v67-v6si405328ybc.205.2018.02.27.02.25.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Feb 2018 02:25:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=T4Cc6Mb8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36049 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eqcRS-0008Ek-Ri
	for alex.bennee@linaro.org; Tue, 27 Feb 2018 05:25:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48955)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eqcRK-0008EI-02
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 05:24:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eqcRJ-0001IX-3h
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 05:24:53 -0500
Received: from mail-ot0-x22b.google.com ([2607:f8b0:4003:c0f::22b]:43684)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eqcRI-0001IH-Ud
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 05:24:53 -0500
Received: by mail-ot0-x22b.google.com with SMTP id m22so3284693otf.10
	for <qemu-arm@nongnu.org>; Tue, 27 Feb 2018 02:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=OHzTQM/t5u2Dbs2nRn2ApjRukVa5BkBAvD9OtGRMvYQ=;
	b=T4Cc6Mb8xF80WnsP4WdkO8rB3h0CNKD0nSM/XjEupCvrvN/ZV9KG0NILdYrL2luW8U
	Zx9dh18zsX+dAnSaTQqihmQvBpvuRkv68viSZQEMCQ13reu4dA1wXElHSud2s3UUiBRE
	TpR5FvcASpif0KsgZ/Vv3zF7cXzf3k13oFWEw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=OHzTQM/t5u2Dbs2nRn2ApjRukVa5BkBAvD9OtGRMvYQ=;
	b=Z7Hc6DYs+wV+74ml1jCwTVwnOo7yM7V9udUygwyu0qBfgRPIDUWL3xnmUO7TtTN0Jr
	Xyi1CKVEAltlymQiq1yfjMVNuRuQyfZC2LMS1CwWwFpz3LZLGQNImxRtjDpyho+AyXJE
	Z3d+kPs7LTZSIl75xX7OUMcjODLRFsw46JnExcTvC3GShLxCBvmH7dkFqnROxay6X2bs
	M/+ZPQEeJzMiVMC6WA59gy5JfwOFmPdyWLtMw68CZQXwcfOGoUyLRiMYaK1JFjFwG5SX
	v9wpcVE6AMRbIv+sAmHILjhHXlGFgroEwOe8jRmyOH5vIpRrHbQZFxaUUXx1Y3Fbskyo
	CIRw==
X-Gm-Message-State: APf1xPAl9zHYHLS1FO6uB7B3vroM+1mrx06V02Sf9bfztyWJAKL80N1l
	py72+RM7jDErleDil2Ww+bSqdwrO+S5WfVgB6w4RlQ==
X-Received: by 10.157.7.227 with SMTP id 90mr9372744oto.126.1519727092209;
	Tue, 27 Feb 2018 02:24:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Tue, 27 Feb 2018 02:24:31 -0800 (PST)
In-Reply-To: <CACRpkdZuNUmZbHnYwUQFJkBNQWADd5tXfc9PYv8amosbO=zn4Q@mail.gmail.com>
References: <20180217140051.22731-1-linus.walleij@linaro.org>
	<20180217140051.22731-2-linus.walleij@linaro.org>
	<eff4f015-38ad-60e1-e1de-886bb4f93328@amsat.org>
	<CACRpkdZLwbVr2O5__GpHt+y0pqpk3-j_AXD_qv5JQc3JZNRm7A@mail.gmail.com>
	<CAFEAcA-jqgBxoEprjTPed0k_vZFGrAVd87Gj5nAfFysau4WrSw@mail.gmail.com>
	<CACRpkdZuNUmZbHnYwUQFJkBNQWADd5tXfc9PYv8amosbO=zn4Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Feb 2018 10:24:31 +0000
Message-ID: <CAFEAcA_bZ-w7WWUtr8RE6rU8ELLbZpBmeuDnwZ=rLreXgJ6fRg@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::22b
Subject: Re: [Qemu-arm] [PATCH 2/3] hw/sii9022: Add support for Silicon
 Image SII9022
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BTCdhOVywwx8

On 27 February 2018 at 10:21, Linus Walleij <linus.walleij@linaro.org> wrot=
e:
> On Tue, Feb 27, 2018 at 11:09 AM, Peter Maydell
> <peter.maydell@linaro.org> wrote:
>> On 27 February 2018 at 07:41, Linus Walleij <linus.walleij@linaro.org> w=
rote:
>>> On Sat, Feb 17, 2018 at 7:32 PM, Philippe Mathieu-Daud=C3=A9 <f4bug@ams=
at.org> wrote:
>>>
>>>> [Me]
>>>>> +#define DEBUG_SII9022 0
>>>>> +
>>>>> +#define DPRINTF(fmt, ...) \
>>>>> +    do { \
>>>>> +        if (DEBUG_SII9022) { \
>>>>> +            printf("sii9022: " fmt, ## __VA_ARGS__); \
>>>>> +        } \
>>>>> +    } while (0)
>>>>
>>>> Can you replace DPRINTF() by trace events?
>>>
>>> Absolutely but which ones?
>>>
>>> I do not feel senior enough to also invent new trace events
>>> for displays or I2C devices...
>>
>> Just put a trace event where you've put DPRINTF debug statements.
>
> Yeah, hm the question might be silly or something but I don't
> know how to do that.

docs/devel/tracing.txt describes them, but basically:
 * include "trace.h"
 * define trace events with a line for each in the trace-events
   file for the subdirectory (basically a function prototype-ish
   thing followed by a printf-style format string)
 * call them like normal function calls with a trace_ prefix

commit 1b640aa9292bc00beb441e97d862ba322a7ba18d is a recent one
which converted some DRINTFs in hw/sd/sd.c to trace events.

thanks
-- PMM
