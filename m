Received: by 10.25.21.156 with SMTP id 28csp2220360lfv;
        Tue, 16 Aug 2016 16:45:23 -0700 (PDT)
X-Received: by 10.55.112.193 with SMTP id l184mr30689001qkc.116.1471391123337;
        Tue, 16 Aug 2016 16:45:23 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d10si17937268qkh.316.2016.08.16.16.45.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Aug 2016 16:45:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:44521 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bZo2s-0006FC-RG
	for alex.bennee@linaro.org; Tue, 16 Aug 2016 19:45:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51706)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1bZo2p-0006Es-1n
	for qemu-arm@nongnu.org; Tue, 16 Aug 2016 19:45:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1bZo2o-00052B-5H
	for qemu-arm@nongnu.org; Tue, 16 Aug 2016 19:45:18 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:34850)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>)
	id 1bZo2o-000527-0Y; Tue, 16 Aug 2016 19:45:18 -0400
Received: by mail-oi0-x243.google.com with SMTP id e80so8294555oig.2;
	Tue, 16 Aug 2016 16:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8R86XCUSAyStLGzmJU548fBNaJy1pZgio60+yI1AQTk=;
	b=QctDTNqW1ZE+QiCSVlKfVOFRkr0iyQWucCTrPAowZO5WU0IqFK5iUlM77SG+iyqcpv
	JFi6tkOKtQyo53okvaN1zVjgw2Gnb9FEPzNYKSBT9rMuYgd37m86jcSuvsD1C9AhWZEf
	OLQpeCDKmY/WZH+sxtLWW/QC8R3jlL+0PLkBPIrpUlDvrpgHkpe/pMhSdiczBtW7+42h
	EipEwHCvx4ME35666qXbn4yi7Uo4awrXYtUGHjsHCln5SJQQSajZPUROMTLbDWdFIabe
	xWhaNPdvxoZ5Qmtp1uR8iFTcgL628gHaJU/gNkAt7cFyBWRxzlr/D6DzEGoJKGO0xebo
	o5jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8R86XCUSAyStLGzmJU548fBNaJy1pZgio60+yI1AQTk=;
	b=Fz+H3R4yrDw4zom+z55ELejBtC52CeJOuEnkNEFXT0g+V6F2GJUXNtArp6rELK7C8R
	7j+h9y96lg/dcKC4CoygXbvy0MmTrOcwIfkndnovkZvNPMC1kmq5NOlYlL1nl60i18L1
	D/u+lUMFOSK/qiHktAX4MSrlMbiYyzIq7r6FGtxwVB1OQW2dX2kh5JNTNQtk3AwbLFaR
	KfK16LuVqIAqUXRg8MTt4x7/iERr5d+GvZ5GF0KXYFPbrIpVa2B0uOmwJ7CmfjznoDsy
	JP5lOE7+pQld3nHg9SSSVkigay5YBmje0aeUwmA9tGSwUw76zXDbdxCvgRs8OVb+U2Ao
	kNCQ==
X-Gm-Message-State: AEkoouss3PWT7PWjDf1YawTmXZoW7fcXq8wzUPDNctTgBr2HTnZQmWxG/5Lph5DZdxdULeuCjCZDzdrt27g9Zw==
X-Received: by 10.202.91.66 with SMTP id p63mr19291497oib.55.1471391117318;
	Tue, 16 Aug 2016 16:45:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.56.244 with HTTP; Tue, 16 Aug 2016 16:45:16 -0700 (PDT)
In-Reply-To: <0f3abe4d-9640-2cc4-41db-7d5e5924e63d@twiddle.net>
References: <1471348968-4614-1-git-send-email-vijay.kilari@gmail.com>
	<1471348968-4614-3-git-send-email-vijay.kilari@gmail.com>
	<0f3abe4d-9640-2cc4-41db-7d5e5924e63d@twiddle.net>
From: Vijay Kilari <vijay.kilari@gmail.com>
Date: Wed, 17 Aug 2016 05:15:16 +0530
Message-ID: <CALicx6uHyUNzgL4a2g+q-VDp-NmHvXiTeiwOn5-8i9ukNZ-FRQ@mail.gmail.com>
To: Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-arm] [RFC PATCH v2 2/2] utils: Add prefetch for Thunderx
 platform
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"prasun.kapoor" <Prasun.Kapoor@cavium.com>,
	Pavel Fedin <p.fedin@samsung.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Vijaya Kumar K <Vijaya.Kumar@cavium.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Qs5UMlJm7ncJ

On Tue, Aug 16, 2016 at 11:32 PM, Richard Henderson <rth@twiddle.net> wrote:
> On 08/16/2016 05:02 AM, vijay.kilari@gmail.com wrote:
>>
>> +static inline void prefetch_vector_loop(const VECTYPE *p, int index)
>> +{
>> +#if defined(__aarch64__)
>> +    if (is_thunderx_pass2_cpu()) {
>> +        /* Prefetch 4 cache lines ahead from index */
>> +        VEC_PREFETCH(p, index + (BUFFER_FIND_NONZERO_OFFSET_UNROLL_FACTOR
>> * 4));
>> +    }
>> +#endif
>> +}
>
>
> Oh come now.  This is even worse than before.  A function call protecting a
> mere prefetch within the main body of an inner loop?
>
> Did you not understand what I was asking for?

No, Could you please detail the problem?.

>
>
> r~
