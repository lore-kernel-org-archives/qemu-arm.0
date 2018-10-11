Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2796083wrt;
        Thu, 11 Oct 2018 10:17:14 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62IDymLuZ698WgA0Dxl/ndJejMCdEB7n8d/qTDAz18dR3GCtyNSwDeyEYAL99bUl3pWgBU3
X-Received: by 2002:a37:d743:: with SMTP id m64-v6mr2476386qki.322.1539278234537;
        Thu, 11 Oct 2018 10:17:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539278234; cv=none;
        d=google.com; s=arc-20160816;
        b=e6Tg+8dEXPGVZyZAj8niFVYq0vTuge8/fBxzfqJj+idF9HT9fdWnXDsVA3CXd/megH
         HaqP+HqV3PQMgET+gibrxPgzsgsufiM40lx5gl0MmZbR2OT4zqhJHqg+u0aSFeZx3tE0
         IOrJT4xLDyKbap7/XQjTGSwyUgxf/3TuIqEDRZ+Bro5tPMuBE3fkI6wA9g4zdbgE2eat
         JOTm/ouQIR7lFMr2KjPiYsbH4xfUxrYZT72Z2Qh9WQflXIsXkFCSINLOg5YrVW8NTzXA
         4qiGZgZCPvwoOUcE7YXh6rd2ry73AylI9c2cuxq4JN1kypWgcFb9VcibOfRFIkfGfQm8
         KreQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=EqFs3ZJ+fAbRthHams0HQNcZTWbpRyBzaRJKtzQvQI0=;
        b=ro62HA+/ubtla4WaohBIFfz3arIUdzRRzRNZBtgC+kqYDqDXr9IRBBhHLe8qNI+X6V
         ohKPwMbeg5cec3GoGXJfhkan92e5UPCS2iEYCqLcIGh5oSgK/Hc1ZhYVP7DOftU0u3hu
         SilKWt1LtuYKiXb/sPVoZVOvw84k9Uucd48p9HzRr2OF2Tz1xdVQjdhoKVVBeZYx79Wx
         ejyi5O71Cesg4X/2VwSW39BJQ8URYHk96xgaMxVTz1v9X3PImmbgfcND89gUs7yR+8rJ
         H6KCbBCic4/rCnJ92Kugw87jyRuwgsdCvd2WwPnqu+H0C6cXdSMmsBQe6VBSyquTEOtb
         giLw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z43-v6si1956087qtb.1.2018.10.11.10.17.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Oct 2018 10:17:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35641 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gAeaI-0004Ro-0u
	for alex.bennee@linaro.org; Thu, 11 Oct 2018 13:17:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37378)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gAeZU-0004Qj-7H
	for qemu-devel@nongnu.org; Thu, 11 Oct 2018 13:16:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gAeZM-0007bN-R1
	for qemu-devel@nongnu.org; Thu, 11 Oct 2018 13:16:22 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:46110)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gAeZK-0007Xx-Pw
	for qemu-devel@nongnu.org; Thu, 11 Oct 2018 13:16:15 -0400
Received: by mail-wr1-f66.google.com with SMTP id n11-v6so10462236wru.13
	for <qemu-devel@nongnu.org>; Thu, 11 Oct 2018 10:16:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=EqFs3ZJ+fAbRthHams0HQNcZTWbpRyBzaRJKtzQvQI0=;
	b=t9vUb0heDyDWPY2FHndlpdlwIi3Idd+I0z9mMPdPzZ69p95s64Oc4W0mJjVLFjis4f
	DoLorqL9qHGGXbZ8BWj4h5Sb5FaGDoiZkAoX3sFKtQGqy76N1BDRmQ/oMsc+2z0D3CGx
	VaaaKSygO3k0D3xezQZ9o4jrpwFmnhmT3BYSb9QrOYC1zGAh1m9czUlKaHGiE4eNm8vL
	H6BuA4RZeCmAd/O+0EaFhZ9M7ziEGwffnL3/NKEzDu3vidbZ/BRLlCSmjUaGUuxTwaIf
	1khesCjBZUS3hvowLeC9wxB4sh1npYjblxQCKu2xxstl/z55w1xNdJhI0UvPIdpwx1w6
	QpLg==
X-Gm-Message-State: ABuFfohb3ZCxLYUsS6tYsbN9OHJFw1x6XoUB1IAi6+mHJ7cfoDKH2kTU
	u58HPMnpOc5WQkHio5libvF4XA==
X-Received: by 2002:adf:ed06:: with SMTP id
	a6-v6mr2249304wro.262.1539278171730; 
	Thu, 11 Oct 2018 10:16:11 -0700 (PDT)
Received: from [10.201.33.229] ([195.166.127.210])
	by smtp.gmail.com with ESMTPSA id
	c64-v6sm15769045wma.44.2018.10.11.10.16.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Oct 2018 10:16:10 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20181002142443.30976-1-damien.hedde@greensocs.com>
	<08d9d1e0-3c37-4b69-bb68-bf993b91289a@redhat.com>
	<2dddf6d3-4362-9ed1-18b5-f927e850c10f@greensocs.com>
	<CAFEAcA-mv2k=fe_QoBpdow4afm6QR2BPAAaD+aC3hdxEfvcPAw@mail.gmail.com>
	<8bee981b-298c-10ab-7f0d-4d0c2d2c8e02@redhat.com>
	<CAFEAcA8y0X-7njxMj5j6q4v7UGP0FVsn0Gy1oty2e95xa22-xw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <1e386a7d-b383-6a28-8c14-24045be3b4f7@redhat.com>
Date: Thu, 11 Oct 2018 19:16:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8y0X-7njxMj5j6q4v7UGP0FVsn0Gy1oty2e95xa22-xw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.66
Subject: Re: [Qemu-devel] [PATCH v5 0/9] Clock framework API.
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
	Edgar Iglesias <edgar.iglesias@xilinx.com>, Thomas Huth <thuth@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Mark Burton <mark.burton@greensocs.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Sai Pavan Boddu <saipava@xilinx.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, konrad@adacore.com,
	Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qFKdgtLSFHkH

On 11/10/2018 19:12, Peter Maydell wrote:
> On 11 October 2018 at 18:00, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>> On 11/10/2018 18:23, Peter Maydell wrote:
>>> How many devices have a clock and nothing else that would cause
>>> them to be non-user-creatable (ie no GPIOs, no IRQ lines, no
>>> memory-mapped memory regions) ?
>>
>> I'm not sure I understood your question.
> 
> Sorry, let me try rephrasing.
> 
> We started with the question of whether devices with clocks should be
> marked not user creatable. It's already the case that devices with any
> of IRQs, GPIOs or memory-mapped registers can't be user created.
> (In particular, any sysbus device is not user-creatable by default.)
> So the question was intended to ask how often it matters whether
> we can't wire up devices with clocks on the command line.
> Are there any devices which would have clocks, but aren't *already*
> ruled out of being user creatable for other reasons? If there
> aren't any, it doesn't really matter much that we don't have
> a mechanism for command line clock wiring.

Thank you for clearing this out.

> 
> So I think the answer is:
>  * almost all users of this API framework are going to be
>    sysbus devices; those are already not user-creatable

Yes.

>  * any device that uses this framework, and which is not
>    a sysbus device (but instead a plain old qdev device)
>    will need to mark itself as not-user-creatable by hand,
>    the same as if it uses the qdev gpio APIs

OK, you answered my first question, it is now clearer to me :)

Thank you!

Phil.
