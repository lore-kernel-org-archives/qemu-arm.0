Received: by 10.28.173.206 with SMTP id w197csp897731wme;
        Thu, 11 Jan 2018 11:10:49 -0800 (PST)
X-Google-Smtp-Source: ACJfBouqZLKVm7fYTfxqRhyXPoOI8/FyKJrVT5FptAaqf1H7NjrWmaeY0YZzcHD7/ajokvAXbQBW
X-Received: by 10.13.234.145 with SMTP id t139mr4921965ywe.346.1515697848939;
        Thu, 11 Jan 2018 11:10:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515697848; cv=none;
        d=google.com; s=arc-20160816;
        b=Z6wPy6kPFDG/3LYycbFey4x2wzsdYwz+IpKWGQdRMokebGHvNOQ8BipWtVvd5FVgwG
         F6hYNG65gBae436gZjLpQ1hOsG9RsuwSvEok3Tz8AA2qn9yt4rxKGWPori5XVkMSJDFZ
         56nOESrl819wl+6hG7LPEJxgY0vopvrcT+dA6NjwUF4WQfeLlrj7sJqWeU4W7f048p/z
         oyX01rMPfOSh0KsjQZZGBk8uQ6GEa0/+gsW2ku0GRD7YroD8nY0ulnx5PzaDLBLLv/j9
         0oiS8tTX6o4rXI7yyJ0VeH+1s6NUSmWlvpGz2fy0oZMASJ3pHeD1rBVwd7kKRpmj6Kz6
         E4mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=rwQJg/SN7Pjhl1f4I7QVYXyugoCZwUVOgg6LqAEZrp4=;
        b=Ln5Af21n7nl5RYpoHz7l5alCifRyb9HkMsEsOrI0MMe3qWW8e2A2u3bmeSsnRw21ZH
         q9H12lf+F4tzPJ7dsQku6PUGXsxBQEfK8UhJNO7W4PQ+iWWksM1CpkYCCDlXVJojzCiF
         NxqzXqEpVX46fRxtyjR39Rgxy957UJmerFxlYp6wF4dVJHJeg/RQ6gysjZQRwTxingSc
         h4Iurdr54EsUxiiox1VvftCPfFunQo0yk9LCuiOc6YhC23SzoAVWTGDK7cjc6PSFo5Uj
         CbBqX7aWoy0xgfToneMao3jiXXqpt3DmjzXtTZ+91WGNgfHltUe+i/hOWhV4FMd0fVdk
         IcMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bO8nzIiT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d5si4132680ywm.43.2018.01.11.11.10.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Jan 2018 11:10:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bO8nzIiT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35427 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eZiFU-0001c5-Bb
	for alex.bennee@linaro.org; Thu, 11 Jan 2018 14:10:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37593)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eZiFM-0001bm-SD
	for qemu-arm@nongnu.org; Thu, 11 Jan 2018 14:10:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eZiFI-0003g5-4R
	for qemu-arm@nongnu.org; Thu, 11 Jan 2018 14:10:40 -0500
Received: from mail-pf0-x234.google.com ([2607:f8b0:400e:c00::234]:34385)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1eZiFH-0003fQ-VI
	for qemu-arm@nongnu.org; Thu, 11 Jan 2018 14:10:36 -0500
Received: by mail-pf0-x234.google.com with SMTP id e76so2376443pfk.1
	for <qemu-arm@nongnu.org>; Thu, 11 Jan 2018 11:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=rwQJg/SN7Pjhl1f4I7QVYXyugoCZwUVOgg6LqAEZrp4=;
	b=bO8nzIiTA1w9wu6dxvVX3hnSquO8lXDYhqtkAFQv/H6hnvuO6TgzvIZDVK4PqfrLNm
	MjQ8/Z61nWVc1mmX6udSN6XjEl1Q7zfsweWw43lA45POHWnu/dSGWes5TJW+U7iGNUyA
	TaJ/2P3P3aI7gCzUOPuLBhkhHtsL0I64f3xYg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=rwQJg/SN7Pjhl1f4I7QVYXyugoCZwUVOgg6LqAEZrp4=;
	b=CFxYU5sPNL5E5Kbf72lzCAiybIgTObI8QQekjxJzwX+gr+Xm9xcvsM8IjDrPVFk10c
	btsIcOEYlfb6CqgQ3JJ1flNom4aRLbfO6k8vFtRSyumpcyrm7Ydy+3EqlcMLjwztHKZZ
	3z9PbsgrFRJc3Oa9rUZDiSOgGSYljINFun+vH7lj4xgEdFTVtuoml8TWspt27ysiaD+r
	S2ca+KSGIwJNAPETkbHZTy9pgBw25ppZoVr4eJaGo0z7+Tjpr3Tcfw1ltMLOfGRmZ0lE
	XxicqLWIQ1lU4fPJVNZ4hHAmTi6siLNgn2H2ZAibYllQudpE6LLnFUPjzKl/8ju4pSZF
	3zwg==
X-Gm-Message-State: AKGB3mJ/v+knsJqO7u7GOeZaQo1nlgxLdeC3RSeAYHbFSz3bhfmX333I
	j4cc/gpAlTTP/ZwtHA7Hx02QVILKBeY=
X-Received: by 10.99.110.10 with SMTP id j10mr18544244pgc.312.1515697834668;
	Thu, 11 Jan 2018 11:10:34 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-183-164.tukw.qwest.net.
	[97.113.183.164]) by smtp.gmail.com with ESMTPSA id
	f71sm3588489pfe.119.2018.01.11.11.10.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Jan 2018 11:10:33 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20171218174552.18871-1-richard.henderson@linaro.org>
	<20171218174552.18871-2-richard.henderson@linaro.org>
	<CAFEAcA_zoqWwAhg5PhuUG=xkRuC3uwT0MF7D3NOvEFg0Z3yKMQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3ffa6112-d2bf-df10-c8ee-e96ead760359@linaro.org>
Date: Thu, 11 Jan 2018 11:10:31 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_zoqWwAhg5PhuUG=xkRuC3uwT0MF7D3NOvEFg0Z3yKMQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::234
Subject: Re: [Qemu-arm] [PATCH 01/23] scripts: Add decodetree.py
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ExGHmuLk1tLY

On 01/11/2018 10:06 AM, Peter Maydell wrote:
> On 18 December 2017 at 17:45, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>> To be used to decode ARM SVE, but could be used for any 32-bit RISC.
>> It would need additional work to extend to insn sizes other than 32-bit.
> 
> I guess we could make that extension without requiring all
> existing pattern files to be updated, right?

Sure.  I would expect that to be a command-line option for the script.

> 
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>  scripts/decodetree.py | 984 ++++++++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 984 insertions(+)
>>  create mode 100755 scripts/decodetree.py
> 
> This is rather large for a single patch...

Ok, but... what bits of it are functional without the whole?

> 
>> +# Pattern examples:
>> +#
>> +#   addl_r   010000 ..... ..... .... 0000000 ..... @opr
>> +#   addl_i   010000 ..... ..... .... 0000000 ..... @opi
>> +#
> 
> I think we should insist that a pattern defines all the
> bits (either as constant values or as fields that get
> passed to the decode function). That will help prevent
> accidental under-decoding.

Hmm.  What do you suggest then for bits that the cpu does not decode at all?
This doesn't happen with ARM (I don't think) but it does happen with HPPA, and
probably others.

I suppose I could either wrap it in a field that the translator ignores, or
choose another character besides ".", e.g.

mfia            000000 xxxxx 00000 xxx 10100101 t:5

where bits [21-25] and bits [13-15] really are ignored by hardware.

Thoughts?


r~
