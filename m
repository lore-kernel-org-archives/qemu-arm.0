Received: by 10.28.71.27 with SMTP id u27csp4656146wma;
        Tue, 27 Feb 2018 02:21:19 -0800 (PST)
X-Google-Smtp-Source: AG47ELsN3Co1cDDzSZ2uQtTYObVJfYGygSxKzHEr5EwLnB9VkXFXRCleTMPsVUYrW7nxay6PbM9K
X-Received: by 10.129.112.1 with SMTP id l1mr8718506ywc.383.1519726879700;
        Tue, 27 Feb 2018 02:21:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519726879; cv=none;
        d=google.com; s=arc-20160816;
        b=WDzqHEIpdQ7MqHh8ZUCN4AAXIQ+em/YOTtOBeQiGvda7LIQOVgtRdR4Y6saklAz14o
         iRuX09B/dJDBEYL5afIs679KBGmxUm57TqRP+5GbsminukU9lXXux4tabjLkQhjQuOm+
         OzcWsyejqvohNzUlpQHYflWyWIIPKmNs4Oc+2P0W9Wh7OWDhfJc83HFwxqkTQf9/CrdF
         lRAn0xdbshZQOsA1sVBwD5xuPe2vwy0TvgZ4xT8/os4RVuO+7AHaWSczF7f0XfVFwxOM
         70qR5WtCXFttSlYDHsJW3e1wwfT6x3eefknU5K2RVMJrRGpjMvukkVaDFxWpvnirWhZG
         dM/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=DwJk/ROH6N7fshX5HtN7SSAJ0LVfHYUKkJT7Ld1u8YI=;
        b=WiUhoRqNJlVDhPp5wUU+OQIWPuXp9qTJfu/9eabPXdvTuKcPfMtUjmoryRTnSLzZT7
         emJ0YnrqasxAwm+PEp1Q8hek+Spzf658JswMjC+2o7DABundvKJYDY4ch+wPqFzgRaTI
         XxAwgd4FHAqeIxuaWkLKvjOxstUjJ04eIvxgYt+0fmTZUCQ6zl20SBcYrzsve8zBXafm
         PBuhQby5KUr0psvBhVtf2+JT652Sec1yUfR9y0ml8M0kjYBuNffF0l3vRHRLlEb5X5A7
         PUYY7PqMPIxRWo1+WN85GXpyqO1mqahfJ/kdTjpEWhTkP8kShIz0uQnBvI5cZ3ql+AUz
         EzFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=g4VTt3Ow;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s188-v6si1336906ybb.117.2018.02.27.02.21.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Feb 2018 02:21:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=g4VTt3Ow;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36026 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eqcNr-00075S-3u
	for alex.bennee@linaro.org; Tue, 27 Feb 2018 05:21:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48097)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <linus.walleij@linaro.org>) id 1eqcNh-00074c-Oo
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 05:21:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <linus.walleij@linaro.org>) id 1eqcNg-0008ON-Su
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 05:21:09 -0500
Received: from mail-io0-x241.google.com ([2607:f8b0:4001:c06::241]:44606)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <linus.walleij@linaro.org>)
	id 1eqcNg-0008O0-N4
	for qemu-arm@nongnu.org; Tue, 27 Feb 2018 05:21:08 -0500
Received: by mail-io0-x241.google.com with SMTP id h23so10034953iob.11
	for <qemu-arm@nongnu.org>; Tue, 27 Feb 2018 02:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=DwJk/ROH6N7fshX5HtN7SSAJ0LVfHYUKkJT7Ld1u8YI=;
	b=g4VTt3Ow63JVBXDg58czFaiIqykUpgXGdeRs6qvNB1aw25JieJByXk1kBdnX8EBLmz
	i94nYs3e4xsbTQUtJvlx+jrh2SuvOiM/qCWHQv1yasYgeR2XmYVdw2I65AGmgYXyjJKj
	Ov50b84wGskzbjanFm9vSeUcpSG72ZGMEgAa0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=DwJk/ROH6N7fshX5HtN7SSAJ0LVfHYUKkJT7Ld1u8YI=;
	b=eSr0JnYePthUhB7t0WzPOxpZUYijKg9pjs42pfttb/G5lU5UbN+zrrVQIltlyDYYjh
	7/TDdtKQ9JNrxVJeDbRKyDh5SeiwhnnTXOM7Z3AmFw/dcpxzsT/+VGPv7lAFma6NEEBN
	zkt5YmTsTN2Rv1HtY43zJlrdMleGKhenQKtJFLa8E6JI+CTlhECvQoVnUaDUAcD8lFjP
	MD8xHGUqOArCnJsRuhQ0tircmsElgXen01IsncTUgpZfrxYK6VmqRbrCaH2VrJ9GGZCl
	OX7rO8GrNliqeQC+nHPgmFaQLmkVti1of4TyMoH6s9aiVly+MjcHp3nbHJl3A8ursLFs
	fpvg==
X-Gm-Message-State: APf1xPCdIViriiQkijIZhukopLzSqNUPPnyx/xzDTX/AwQz9m048ZnZX
	FsZvtNwIGIo2y9CsAF8n0s0QaHctk/R4cFe91gR6bw==
X-Received: by 10.107.139.77 with SMTP id n74mr15130921iod.109.1519726868045; 
	Tue, 27 Feb 2018 02:21:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.79.230.25 with HTTP; Tue, 27 Feb 2018 02:21:07 -0800 (PST)
In-Reply-To: <CAFEAcA-jqgBxoEprjTPed0k_vZFGrAVd87Gj5nAfFysau4WrSw@mail.gmail.com>
References: <20180217140051.22731-1-linus.walleij@linaro.org>
	<20180217140051.22731-2-linus.walleij@linaro.org>
	<eff4f015-38ad-60e1-e1de-886bb4f93328@amsat.org>
	<CACRpkdZLwbVr2O5__GpHt+y0pqpk3-j_AXD_qv5JQc3JZNRm7A@mail.gmail.com>
	<CAFEAcA-jqgBxoEprjTPed0k_vZFGrAVd87Gj5nAfFysau4WrSw@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 27 Feb 2018 11:21:07 +0100
Message-ID: <CACRpkdZuNUmZbHnYwUQFJkBNQWADd5tXfc9PYv8amosbO=zn4Q@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c06::241
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
X-TUID: x4fT5Bw04G4c

On Tue, Feb 27, 2018 at 11:09 AM, Peter Maydell
<peter.maydell@linaro.org> wrote:
> On 27 February 2018 at 07:41, Linus Walleij <linus.walleij@linaro.org> wr=
ote:
>> On Sat, Feb 17, 2018 at 7:32 PM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsa=
t.org> wrote:
>>
>>> [Me]
>>>> +#define DEBUG_SII9022 0
>>>> +
>>>> +#define DPRINTF(fmt, ...) \
>>>> +    do { \
>>>> +        if (DEBUG_SII9022) { \
>>>> +            printf("sii9022: " fmt, ## __VA_ARGS__); \
>>>> +        } \
>>>> +    } while (0)
>>>
>>> Can you replace DPRINTF() by trace events?
>>
>> Absolutely but which ones?
>>
>> I do not feel senior enough to also invent new trace events
>> for displays or I2C devices...
>
> Just put a trace event where you've put DPRINTF debug statements.

Yeah, hm the question might be silly or something but I don't
know how to do that.

I guess I should include "trace.h".

#include "trace.h" says it is autogenerated from tracetool.

Is there some documentation I should be reading or a good
example commit I can study to get the hang of it?

Yours,
Linus Walleij
