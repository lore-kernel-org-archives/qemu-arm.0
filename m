Received: by 10.223.197.9 with SMTP id q9csp2593062wrf;
        Mon, 9 Oct 2017 08:57:51 -0700 (PDT)
X-Received: by 10.55.43.227 with SMTP id r96mr10466016qkr.216.1507564671818;
        Mon, 09 Oct 2017 08:57:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507564671; cv=none;
        d=google.com; s=arc-20160816;
        b=XA0fMbbO+G4feOadds4r0o2Qs/GuUTo1IAaFWt1qvTpQWuMtM4fNZjQPbmjmd5Y67g
         cbBN0sRHDqi4H7Rb8AxOjU7DOyHQ3wa1tz1M0Af+CGBnR2Zkh8blOtDy/jNdrrh90IRT
         LIxQkdfWQOI9TPdy5vRIibPapLtVdy2xk3dPrPh57w2Z9G6dri2nJxtS2vsIH3ihfwKP
         ScNQHWVH9uXKxLdkjQmvHy6GZoSVvOLeysXykafDiSRhd8UC6VHRmhHSqOnRelwcnV71
         enO1HBK2JfyqVpM7QJ4nCUnkAtzx0xyRopERRiE07dJNIteavvFgqlVDZQLkAOLH+fTW
         1vMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=t+cw0MvXDMrUOpTgcfZaqQTE3uP1kHVuuhBZ77P8I8I=;
        b=v4sMeaIaqqIDtdiQ6UTUTaeLjZkk5ovDAmfSIrXhfucFpK6wI3HxCUL2GTBQ12gdXu
         3k6S7mwh6E109DWk95OD5uFl/Dal6aaSkdBeGTcg8mrEYDQcVnxD48f58/WFF+tN/50m
         Py2MyGKLK/IQvqsLpuvejmzhVw4V5A0wV7yf8H6ZVMLrr4mOE4fs9LZCRy9+seK0toCl
         t9w1vjKikJLrnejaAdvWFzE6KDb7efCQLH6bTfLubUcBl9BS6vLJIQxSrMrZGdS4UQUm
         BMXraMdwIYovnyNy/1XfeUwagmtPM2dj5gpPpC19SnZR9+7OJ9yau7JD4qAjiv/1JiZT
         QIIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=V/mlTy03;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f83si2817881qkb.318.2017.10.09.08.57.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 Oct 2017 08:57:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=V/mlTy03;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58511 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e1aRD-0001iv-9X
	for alex.bennee@linaro.org; Mon, 09 Oct 2017 11:57:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51339)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1e1aPL-0000ZL-Rg
	for qemu-devel@nongnu.org; Mon, 09 Oct 2017 11:55:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1e1aPL-0007Ky-4T
	for qemu-devel@nongnu.org; Mon, 09 Oct 2017 11:55:55 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:35130)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1e1aPJ-0007HW-1q; Mon, 09 Oct 2017 11:55:53 -0400
Received: by mail-qk0-x241.google.com with SMTP id w63so15056304qkd.2;
	Mon, 09 Oct 2017 08:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=t+cw0MvXDMrUOpTgcfZaqQTE3uP1kHVuuhBZ77P8I8I=;
	b=V/mlTy03tmni1XHnFt+AV5AtJ4pPH8CjFDygWzcBQLVqKpZc+VV6sLNl8vkJ64gQa8
	KNtZqNgF8M1seIXyA4cwZ2xwg/1rwE4WLKp+9tBNIaGdtd9s595iuY0LM7T/PbRsVzgV
	KZ2TaPjCCcUUgUsSErCqlbpQ+OG2h0aYxuP/qxI05p+OLRIWEqwuvmEUVMyg4pZmUDuX
	ipwmWC5+Cc/HrDrUTfhlMWvpHQfMkd5K1KUbE/eYsiP3TZMCxb2qeNiSiTcAMLpJNVrY
	RlIBTgK7CH+XHlFAwod80ICMofeOx+kwkVZOadQKMK/li96K3UdjWJnFmHlc3FTlKf3t
	Z/ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=t+cw0MvXDMrUOpTgcfZaqQTE3uP1kHVuuhBZ77P8I8I=;
	b=G88iWI9WSsw4ItQtozo7oWRNN2LAlyAFw9x4qqfXDKghaOwyjhyI4OX68a4TB7rE41
	ekwFZy8NmeadvltHomThNr5h1+PqzOZIUQlyCUS9wziIIW2fwHKoK/3NSQQWElJigw33
	H0IQvcmfhdyCEx4h9GAvUlmt9/Ahg4hwIAEB53rIYl5mFhenbSiIPsniNt9A9dUu8n0t
	4siWHql599nR+SX6U5x+2r3OmekQs56T/UGtBlB5qBCkGKLca/FfULi/qOJNAIbbJHMT
	J29NoOu4krpSW0PCCT+ahtFVTl97e0ypmG39zBO0C9JamxZp+CYqaECCZlKEiOBehosk
	W2+g==
X-Gm-Message-State: AMCzsaUa+c1d2zB9L0PjqEm0JNRIsxGKISXE0kcd2Vom1KkWfSUTF67V
	Fon53k2p3bmwX3AXaDTaaxtFBUWuJi7DhSTzM2/jog==
X-Google-Smtp-Source: AOwi7QDeOdH1MzfjA1BvrNLIFOLm/B73teRtfJSH02jBsmB24nz4m8Rf77BX0HQVQlda51Ruqqg+764erAa5VDZRxG8=
X-Received: by 10.55.186.71 with SMTP id k68mr10219840qkf.100.1507564552393;
	Mon, 09 Oct 2017 08:55:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.165 with HTTP; Mon, 9 Oct 2017 08:55:51 -0700 (PDT)
In-Reply-To: <CAFEAcA_3vf8=0VhZVWX=1RQBqshvWNgHn=LrUw8BBtkUtDig0Q@mail.gmail.com>
References: <20170918195100.17593-1-andrew.smirnov@gmail.com>
	<20170918195100.17593-16-andrew.smirnov@gmail.com>
	<CAFEAcA_3vf8=0VhZVWX=1RQBqshvWNgHn=LrUw8BBtkUtDig0Q@mail.gmail.com>
From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Mon, 9 Oct 2017 08:55:51 -0700
Message-ID: <CAHQ1cqEJ6OJHL+gTAtXnNJPKUhu3mbYkMWWC=95fOxK9_VFMWA@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: Re: [Qemu-devel] [PATCH 15/17] include/qemu: Add sizes.h from Linux
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Andrey Yurovsky <yurovsky@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jqoD/Thn6zBj

On Fri, Oct 6, 2017 at 7:13 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 18 September 2017 at 20:50, Andrey Smirnov <andrew.smirnov@gmail.com> wrote:
>> Add sizes.h from Linux to have a more readable way of specifying
>> MemoryRegion sizes.
>>
>> Cc: Peter Maydell <peter.maydell@linaro.org>
>> Cc: qemu-devel@nongnu.org
>> Cc: qemu-arm@nongnu.org
>> Cc: yurovsky@gmail.com
>> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
>> ---
>>  include/qemu/sizes.h | 47 +++++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 47 insertions(+)
>>  create mode 100644 include/qemu/sizes.h
>>
>> diff --git a/include/qemu/sizes.h b/include/qemu/sizes.h
>> new file mode 100644
>> index 0000000000..9aedb9f8f6
>> --- /dev/null
>> +++ b/include/qemu/sizes.h
>> @@ -0,0 +1,47 @@
>> +/*
>> + * Copy of include/linux/sizes.h
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License version 2 as
>> + * published by the Free Software Foundation.
>> + */
>
> Not really convinced of the utility, and it's gpl-2-only, so no thanks.
>

OK, will drop in v2.

Thanks,
Andrey Smironv
