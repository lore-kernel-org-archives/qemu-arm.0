Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp2010066wrd;
        Tue, 21 Aug 2018 07:56:46 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdZdtxzt2GzRIrh2x51v/qPxHwi1DBwWs3UkiDHFvLLKMDEYc8gsM+UVlAr8ceKsYv46TEcD
X-Received: by 2002:a0c:b752:: with SMTP id q18-v6mr2060314qve.73.1534863406726;
        Tue, 21 Aug 2018 07:56:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534863406; cv=none;
        d=google.com; s=arc-20160816;
        b=nqqDtrFtaaWFvrag42c5a/vYK5BZCB9upqN3ZZ0uiSi7P4jI52OxFy/9HKp4WXhdS5
         qdaZ3QI+EpSwpLBILKhxnVMJlUe/8Zj96lNvX3SXxTNLxn7wp7QVybsn21+DTvwutacU
         nV50Y9nTJ/m4OXQfMap3JVkQk6hh8k/tNSiEttWQ+vc7KlnF9K83ebHCidZlTcPqQDCr
         XfObJsRyV4daIb+22k02xhnOWMPdTjGyj5GDuqrpy4iDofstBaJJ+kPL6ayPoEMiqd/G
         /qbH2oPTHdbT4WAUyl3Npa9jkKt+wSeqzUwkFp24ChyBtgyjLi3d11wbJztxH67H3059
         OsMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=TfmoPRGRUSYa+3iad+IYdNApeUrg6E3Dh3MhZuIfvY0=;
        b=EAERDXJBOiXrLHeTKmGZ6Qp/4uqJolWOfG0MIN3t9VFP7jHyFTJxyuXt88C8fEzinr
         fSHl26PffgjY8pn6z8Zc5GyjKo0QzNJHwtfibcBL0g2fk5tfrNsPr1TPHlxDSvsGpcc3
         sChQGIbXaL3sokgP8W3ohIkCBlkmP4HZppI82l9HJzBLLyzNwnQhAjZicmvIazpJYm6i
         4AnB4B2uLPx6+eNxl1sn8+O7mGnRLkMZH5KBOlU/xCB4NetNzHUeJtdSjkW2RXYU11M5
         4m86bNWPYsKtrKoWkC+geezXWAvTXQ/cyUFBd0Yoz7/iWNvasPGrqVl9mcfYU91MT6ah
         /LWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Q/Gc+tKA";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l67-v6si1901844qkb.61.2018.08.21.07.56.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Aug 2018 07:56:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Q/Gc+tKA";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54135 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fs85O-0001eZ-4U
	for alex.bennee@linaro.org; Tue, 21 Aug 2018 10:56:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60844)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fs7yL-0003FU-CP
	for qemu-devel@nongnu.org; Tue, 21 Aug 2018 10:49:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fs7yK-0002ye-IE
	for qemu-devel@nongnu.org; Tue, 21 Aug 2018 10:49:29 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:33344)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fs7yK-0002yI-BM
	for qemu-devel@nongnu.org; Tue, 21 Aug 2018 10:49:28 -0400
Received: by mail-oi0-x243.google.com with SMTP id 8-v6so32525697oip.0
	for <qemu-devel@nongnu.org>; Tue, 21 Aug 2018 07:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=TfmoPRGRUSYa+3iad+IYdNApeUrg6E3Dh3MhZuIfvY0=;
	b=Q/Gc+tKAz68+zGQ+4j5UzRUz+At89U7QFxM3jDEdKrW3V4OsXWoJIpvO84hvVVScJV
	g1cUWVLqxwl0iPSifYrP1Dm80jUnjivL6n5kUmkmEKgGtbRR6jdTSVgeVD9ViFgj8dD1
	hhyy7iXSuxQV0undIC3O27ukH3uuA2Fj+G3sI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=TfmoPRGRUSYa+3iad+IYdNApeUrg6E3Dh3MhZuIfvY0=;
	b=gMg1GxwnW1zAtFM53eXzYlBH7BrTyZ2BNSu2UYXcyIGv/NCDZU/mRjAUCkWOWbryNl
	i4OeNW+FXOplG7KZ1IlAdd28+DSXsLJv/Ao0Rj4kDQQvO15nANc3c5vIlZjp+zrCHhe0
	B88hQbbatXu/cEf6PV26r2qxHkkg1xZxUlZZrpwS+ZQb3LWVAeYT9J7l659aAOfNPECJ
	6HPuSEvOtW1/uPu36Q5IcaCFQwu2fEajMWKivXT79f4UZpjcwtH9owMkOyPMEH98LBgI
	dvwWhQQSnbGxrWywC7nGdoCNfWvBVYX1NW879o9P4+NvGoT6lVl8OzzviLTBKGSxAVpi
	VHLw==
X-Gm-Message-State: AOUpUlHFUnbILkxO5xsKG9MH+J+KEF/IvrFw7dLMQzDOrAMJYk6W1JqJ
	O+ZPlVoYt9yVIGTXHMS+txvPWq1eepeLW9UOLZC/Ig==
X-Received: by 2002:aca:506:: with SMTP id 6-v6mr19312919oif.23.1534862967741; 
	Tue, 21 Aug 2018 07:49:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Tue, 21 Aug 2018 07:49:07
	-0700 (PDT)
In-Reply-To: <df1b1627-47e4-bffd-e73c-ffa3eb037b2a@steffen-goertz.de>
References: <20180811090836.4024-1-contrib@steffen-goertz.de>
	<20180811090836.4024-4-contrib@steffen-goertz.de>
	<CAFEAcA-vtLpt-ScYpYPFqtQAnECuVqCW-DhKqVgoh6mAG=KfQw@mail.gmail.com>
	<df1b1627-47e4-bffd-e73c-ffa3eb037b2a@steffen-goertz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Aug 2018 15:49:07 +0100
Message-ID: <CAFEAcA-n87TbE_a2zgnWAgTk1=P5=1j-f+xS7yKJ7jMZkNtx1w@mail.gmail.com>
To: =?UTF-8?Q?Steffen_G=C3=B6rtz?= <mail@steffen-goertz.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-devel] [PATCH 3/7] arm: Add chip variant property to
 nRF51 SoC
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
Cc: Jim Mussared <jim@groklearning.com>, Stefan Hajnoczi <stefanha@gmail.com>,
	=?UTF-8?Q?Steffen_G=C3=B6rtz?= <contrib@steffen-goertz.de>,
	QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
	Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: doqaenLoz8iq

On 21 August 2018 at 11:03, Steffen G=C3=B6rtz <mail@steffen-goertz.de> wro=
te:
> Hi Peter,
>
> object_property_set_bool(soc, true, "realized", &error_abort);>>
>>> -    armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename,
>>> -            NRF51_SOC(soc)->flash_size);
>>> +    armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename, 0=
x00);
>>
>> Hmm. Using 0x00 here doesn't seem ideal.
>
> i agree. The actual sizes for RAM/ROM are calculated in the SOC at the mo=
ment.
> I do not really know what impact max_sz has here. I could set the it to t=
he
> maximum code size defined in the memory map of the NRF51 series. Another =
way would be
> to lift the calculation of the ROM size from the SOC to the Board. What w=
ould you propose?

I think we need to specify a value somehow, otherwise we
won't be able to load raw images (which I think are the only
ones where we enforce the limit value). You could just use
the largest possible size, I suppose.

>>> +#define PAGE_SIZE       1024
>>
>> Page size isn't really an obvious concept for M profile.
>
> Flash pages are referred to here, not MMU pages. This constant is moved a=
nd renamed to NRF51_PAGE_SIZE in the upcoming revision. Would you suggest a=
nother name or can with stick with this?

I guess NRF51_FLASH_PAGE_SIZE would be a little clearer ?

thanks
-- PMM
