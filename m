Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp997337wrq;
        Fri, 8 Jun 2018 08:09:41 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLoxBI/L74CsC8EXfvnIe11XvmNWH3ItmlSz4JZXiU5M5dRwRwJ9Y2FFdl1ZJHlfDln8j+N
X-Received: by 2002:a37:3147:: with SMTP id x68-v6mr5640663qkx.358.1528470581872;
        Fri, 08 Jun 2018 08:09:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528470581; cv=none;
        d=google.com; s=arc-20160816;
        b=eRFgx8YbOJ4Myn1BaUOkS1/4dJ8P2mDTwtO5vfIhYK6FuvYYPWQIiXdCLd6q4cRdy/
         ln1BBWhckB0nXV5i6wewsmT754GD0sKh/l9iXwmOT+9J/tbwliXgxZ33MAmBsK7CLBW6
         mXujTCwO2LUWCPTqZLC3dKieUH37+MAl5Tm6NmVi4Q6sFYYGwUWSCg7JtcNuT5bN8Dxb
         XwplH4qlr6+kCidxDNWpt7VssKMadxxBwaE+pT6qxiNvcJQTH32UCOmqtgv+u2FtynNt
         bV28+b6yRv2tzKIAYclbJAOtTqh1a5arEhCVZhHjfmvEuwgVuCoHz833xnADI4+trmn8
         Sp0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :arc-authentication-results;
        bh=QOt505UZCAePdr5ioHaIY34FQ7qc6OihUeYBCZti3gI=;
        b=F3l10UlVJM1WrE39WvOvA4cTOAZ2FZzciOM+JtOdCO3+KfRFVoXLl9JDqA71TXwTYx
         GmXSiPkD8B+UALAg5wHXs3Z4g7vvr3y4DLlx3RxZ7V5sqW1aZ0TUKGQtIaJZFdbIu8wq
         G4NwTerI/8PXyT/Wq9+lXx5dx28SbZLdhAw13FCNoBofnJYR95o2jxPBtTxLB1/tA1M6
         VxoS52MUPy73Az/j4K48UpfaaX0f1GMeEeZ+87W6eTU5u0tWghQSMspe7jjN+u1i6uzy
         ISKQOHBieyhYgKIeahlcfqjZCr9G+EszWRND9aZVZTp+BSyaWu9Gh7rR4Fpe8DgamtNi
         KldA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e187-v6si1410049qkc.193.2018.06.08.08.09.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Jun 2018 08:09:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36446 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fRJ1J-0008Lh-9l
	for alex.bennee@linaro.org; Fri, 08 Jun 2018 11:09:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36175)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1fRIzF-0006iR-54
	for qemu-arm@nongnu.org; Fri, 08 Jun 2018 11:07:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1fRIzD-00059c-7Y
	for qemu-arm@nongnu.org; Fri, 08 Jun 2018 11:07:33 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:43946 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <jsnow@redhat.com>)
	id 1fRIzD-00058c-1f; Fri, 08 Jun 2018 11:07:31 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0B0CC40251D5;
	Fri,  8 Jun 2018 15:07:30 +0000 (UTC)
Received: from [10.10.123.151] (ovpn-123-151.rdu2.redhat.com [10.10.123.151])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 125071C73B;
	Fri,  8 Jun 2018 15:07:28 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180606152128.449-1-f4bug@amsat.org>
	<b4903491-f450-1a54-2a70-a084c30cd8c6@redhat.com>
	<CAFEAcA_xP37u4KMdvPe8MyU3y_6re88pAx3KTLY_DOP0qWQzqA@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jsnow@redhat.com; prefer-encrypt=mutual; keydata=
	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
	NRhibLIrSP2g5nqXONyQrFxb1HtVaoR+Nrk=
Message-ID: <e67c1e7c-a720-beb9-4858-2459f7001091@redhat.com>
Date: Fri, 8 Jun 2018 11:07:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_xP37u4KMdvPe8MyU3y_6re88pAx3KTLY_DOP0qWQzqA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Fri, 08 Jun 2018 15:07:30 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Fri, 08 Jun 2018 15:07:30 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'jsnow@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 00/11] misc: Add trailing '\n'
 to qemu_log() calls
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair@alistair23.me>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Palmer Dabbelt <palmer@sifive.com>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Laurent Vivier <laurent@vivier.eu>, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Walle <michael@walle.cc>, Michael Clark <mjc@sifive.com>,
	qemu-ppc <qemu-ppc@nongnu.org>, Paul Burton <paul.burton@mips.com>,
	qemu-arm <qemu-arm@nongnu.org>, Yongbok Kim <yongbok.kim@mips.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Antony Pavlov <antonynpavlov@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HLS1ruff72ZC



On 06/08/2018 06:54 AM, Peter Maydell wrote:
> On 6 June 2018 at 20:43, John Snow <jsnow@redhat.com> wrote:
>> so error_setg must be used WITHOUT \n and logging must happen with \n?
>>
>> If we're sure that's the way we want to have things laid out, we really
>> ought to augment checkpatch to catch this -- because there's 0% chance
>> that we'll keep it straight on our own otherwise.
> 
> It's a historical side effect of them being basically separately
> designed APIs. error_setg() takes the "give it the entire error
> message" approach. logging is printf-style and gives the caller
> flexibility to compose more complicated lines of logging with
> multiple calls. Consistency between the two might be nice but
> there are an awful lot of qemu_log calls in the codebase to check
> and change to the other convention...
> 

Well, there's a pragmatic reason against having it be uniform.

If logging lets you build more complicated statements, perhaps a
checkpatch /warning/ that you've omitted the newline might be nice.

--js
