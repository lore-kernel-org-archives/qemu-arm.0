Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp2809912wrp;
        Mon, 23 Sep 2019 08:40:22 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzb///qKzHVS8R1M16TQ32cdhW2Fd78eouwreDnKNraQB2gIlP4NbgHCCS2QA6atcpQfoK1
X-Received: by 2002:a37:a946:: with SMTP id s67mr435786qke.470.1569253222886;
        Mon, 23 Sep 2019 08:40:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569253222; cv=none;
        d=google.com; s=arc-20160816;
        b=iqVw7DvsUJHJb49icdHbr2ksr48t1NwKxvdS3IJxYYakYEKhxEESomvnza8jvgN7u9
         X0ds02E9Eq31VtQxkhZJJlmFg+D8diYqQfkB6T0QE285hS7fA5TOlHy51hERmH4cRX/q
         8pxiXJ0L2Yze5dghM5EWkVzd9RC8o7dzck41Oxm9vN+jYPvfIxLPK+PSN9bePR0hDtPz
         ei/LxVNav/at/TrgrfdedCVX6SZv00c9KJm1zpT0CU01SDrIRLmFAreTBe3sG8mKJ+6g
         PyY0P9QffI0l1pij5UEUqQx15PO234rLeIa8yrKVITnmHJal9NC5qLrju5VRTrulMEyO
         0oXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject;
        bh=AMFkxltNvKcjgNyq6lsWcB5cj2MXillWQNT1EsA8qL4=;
        b=krK7vaZrj0a4dsBhui9YLvi2ZjHywWhmu1Yjer3jm4cIOaZ30NwV5KQdg1UqW+mgQU
         rBRnqMn9xiqcps01ixi/WQ0VZ96/D5vX/40N8NbuJ699BxBtT9DUUu+dBvi7Mez6nMps
         zDntOYu6um8NN8rn2lkDkFvVnkarpb3VJ6B6O0jaxLi9YEFnlWI7TcH7VeqGroajM7lu
         SkMGmzer2utqG8AjAt75qYuoSdeMSAwuQglFrgkV6FCDViXR51TlqFa20Owa1mZYBipR
         PqP603kDzs52tar+4jCmSx606CiJ/U6rqbWm6BiXJhayYqKPBEAee0GnIXSNXPHn/yj6
         iPhA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d10si9120525qtg.260.2019.09.23.08.40.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Sep 2019 08:40:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iCQRq-0000xa-1y
	for alex.bennee@linaro.org; Mon, 23 Sep 2019 11:40:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50813)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iCQRW-0000x3-Vl
 for qemu-arm@nongnu.org; Mon, 23 Sep 2019 11:40:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iCQRV-0003H5-3M
 for qemu-arm@nongnu.org; Mon, 23 Sep 2019 11:40:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45942)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iCQRU-0003GY-Ro
 for qemu-arm@nongnu.org; Mon, 23 Sep 2019 11:40:01 -0400
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id DF29085536
 for <qemu-arm@nongnu.org>; Mon, 23 Sep 2019 15:39:59 +0000 (UTC)
Received: by mail-wm1-f71.google.com with SMTP id o8so4920175wmc.2
 for <qemu-arm@nongnu.org>; Mon, 23 Sep 2019 08:39:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pcPFpcKUi523Ys3CU2Lb1ssw8BTF69fob0LEa6188aQ=;
 b=tXM10CDLOKhkLW48tcbBpWpmECDf5CYAgLGfotD5LFAkgvl2qX+y7+27NiMtmHNB0t
 FGCZ35L0S86mN4A+yUo/CWo4L3IMImMmuSMjXRR9gQDnqbfBV0DUWbjrj74sNxkdFmSq
 9hTZbTCBGQrsX+O3dZRPFJsCpUy12PBMImGvN/UBSHzOqwXjKTGBshc1mcjFym8igJl9
 5snD8khcO+w5pOa8F04pdSsfx0ToBejWv92E8R9sQQKOOraXlskJBY5OlxIKjLiDmhbk
 Yvkbm/SE9Gjti/tWziF0ZUhl1h/zqe/7XoabC5knsmZeGZiT9+VNthmfxbrMn77D+Bje
 PFBQ==
X-Gm-Message-State: APjAAAWostgqnUMHOk7HdBOycSrKqdRA6RGv1wOdjDEEMeDF1X0BpogT
 sBMTJkJXfHr5hBoRJezz3rJa8NIIwoSP1kibvt6gKPJb6ZuNseBiJNpq5NAYwWF4S50b3SRuvsO
 FxI5oSFQR7k1V
X-Received: by 2002:a7b:cf3a:: with SMTP id m26mr211584wmg.73.1569253198705;
 Mon, 23 Sep 2019 08:39:58 -0700 (PDT)
X-Received: by 2002:a7b:cf3a:: with SMTP id m26mr211567wmg.73.1569253198521;
 Mon, 23 Sep 2019 08:39:58 -0700 (PDT)
Received: from [192.168.1.115] (240.red-88-21-68.staticip.rima-tde.net.
 [88.21.68.240])
 by smtp.gmail.com with ESMTPSA id z189sm17971177wmc.25.2019.09.23.08.39.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Sep 2019 08:39:57 -0700 (PDT)
Subject: Re: [RFC PATCH 0/2] hw/char/bcm2835_aux: Provide full 16550 UART
 support
To: Peter Maydell <peter.maydell@linaro.org>
References: <20190820123417.27930-1-philmd@redhat.com>
 <CAFEAcA_6uBtREzj2UaSwDp_VWd=oPsD-dARcOPeJdcMpO5kaHw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <93b7cd93-e03d-d0c5-7cae-7f571a9b8ca1@redhat.com>
Date: Mon, 23 Sep 2019 17:39:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_6uBtREzj2UaSwDp_VWd=oPsD-dARcOPeJdcMpO5kaHw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zzs8L9iND4ir

Hi Peter,

On 9/23/19 3:26 PM, Peter Maydell wrote:
> On Tue, 20 Aug 2019 at 13:34, Philippe Mathieu-Daud=C3=A9 <philmd@redha=
t.com> wrote:
>> Since there has been some activity on the list asking about
>> Rasberry PI USB support, I had a look a some previous unfinished
>> work and rebased it to share, in case it helps hobbyist interested
>> in improving these machines.
>>
>> This series is some proof-of-concept on improving the AUX UART
>> support. See the commit description for various TODO/questions.
>=20
> Apologies for not having got round to looking at this
> RFC patchset sooner...

No worry, this patch is not very important.

> I think my question here would be -- is using the 16650 emulation
> really the right thing? The BCM2835 documentation says
> "The implemented UART is *not* a 16650 compatible UART. However
> as far as possible the first 8 control and status registers are
> laid out *like* a 16550 UART." That suggests to me that it would
> be better to just improve our model of this hardware rather than
> to replace it with a 16550 model which isn't what the hardware
> really is.

Some registers are the same as the 16550, some others only implement
bits (identically placed). None provide extra bit (a new bit not present
in the 16550, for that they used new registers).

My idea was to reduce/reuse the chardev code.
I think a correct way is using the "hw/register.h" API to mask the
unimplemented bits.

This patch reduces a lot of [LCR/LSR/MCR/MSR] "register unimplemented"
when booting Linux, but from the emulation point of view they are
harmless, so we can ignore this patch for now.

Thanks,

Phil.
