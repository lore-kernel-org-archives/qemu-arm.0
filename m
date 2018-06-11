Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp4168714wrq;
        Mon, 11 Jun 2018 08:16:18 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKW+AN/Ai+zOlfFo67k1AIHRaCLIqT4Gg1o/2/FHilp9oea2bzxo/koeFUzvXbhxeh4YHvP
X-Received: by 2002:a0c:dd82:: with SMTP id v2-v6mr15768905qvk.176.1528730178067;
        Mon, 11 Jun 2018 08:16:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528730178; cv=none;
        d=google.com; s=arc-20160816;
        b=o+1CarKtMrwM1C2UuqzXbDGIB3+57jPRdy9ONS8jlD4RMcM/BPegt8CTAkX2ZtxCLQ
         3spTBabqVWsFtVykOy2D199W0hNEQ6IykodMxQI2ziJpd+asQi7Qg1c32mIzxrGrufAa
         E98etToQPPBTYUbq+ICUte7TEpD0rw8cZo0sVZbZi39YwnqvO5bZdrdsFsOv+S+Ul9cL
         DmeBIumjwTN0VN8IpMs67zFfHzhl7yjt1c6G/f9dXfu8xI0r6cMvxCHgEFQIfNwh8Yil
         +GWJSB9VSXL7u182rUw0AcAbz/paNkKAtEWHzqnpiSGHDtZ7Hx1lfeNXyiRckd04vxdX
         OTpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=+QmxWDl5cK5UJTeWPPFMwrhnidyAKEFFvZ3viHyZvVo=;
        b=P5CEdL2Hdyv+WIy9BYUUpXvz55L6vwTab2xthm6K5K1vfof9U1OOPOVy/f4sxzNwar
         3GR9hsZjU/NphNXpkW6+Ydx2kvqGJDZq7D4vLbTawUC384w3WTcK6BI0R2OIFYQbUcUL
         qHq4xKhq+Z5QAbdLhcjNkaddsRH5P/ChP0LB4I0maWYYYWf7jksw0mH1vQBpsgqmcS5g
         KPj+rQMipXInb8mgXyWPWc8SpsIrRE+jJXkgNk9aKpgqeI3zj05OX9TeLZhmbd/F2JcJ
         629c08f10ur3SQvh/sNxOQ1336VJ3MoO7zwozfylce4RJCjxHmc712wHGllWomlNG02/
         ibNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=j5fRXeQJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u11-v6si12203621qke.328.2018.06.11.08.16.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Jun 2018 08:16:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=j5fRXeQJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49471 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fSOYL-0005CA-HJ
	for alex.bennee@linaro.org; Mon, 11 Jun 2018 11:16:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39205)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSOXr-0005AW-97
	for qemu-devel@nongnu.org; Mon, 11 Jun 2018 11:15:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSOXm-0000ga-JE
	for qemu-devel@nongnu.org; Mon, 11 Jun 2018 11:15:47 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:38142)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSOXm-0000gD-Eu; Mon, 11 Jun 2018 11:15:42 -0400
Received: by mail-qt0-x243.google.com with SMTP id x34-v6so20572620qtk.5;
	Mon, 11 Jun 2018 08:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=+QmxWDl5cK5UJTeWPPFMwrhnidyAKEFFvZ3viHyZvVo=;
	b=j5fRXeQJ6fDLMIR1SMRR1jPq4WVH1/1/2HvjfhtA1RBESZLlKCaTD45CHSXlqlB4m9
	DE6SQRoOGj2/F4CvUlzoMIi2ksGx67Q8GM/PudAsbXO4NvmR/ifLctrJEZx6vStNPuce
	uc+NWeF+LmlZXRvjCvh7psElZmfQFEmy+l4SN9YtJg4Y5XnnIn4o9KfQky4TugoyDFfm
	OELHyJIe5vJsrXJJgOkFQjmENz8FjDqh3Zmm0NlbYMVNSjz/eikAab8NQ+azgMLPFpPT
	K0H73CtXCuuV88YxgN08Y53E5YhVrpOqJvsv3ruwa41eBdwMucj4KudxUHb3+oSivf+h
	5PBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=+QmxWDl5cK5UJTeWPPFMwrhnidyAKEFFvZ3viHyZvVo=;
	b=lJXYGs8Q7jl8vEQXgN2a2+OyE6vEc8lMXiFPL8Q2LL2yBmV60899fYb52pdx+y2FyH
	2fJmWP8ZrVA1tf4YPcxd55OUL3JMfNz7+sz5XCoS6XsyuX9IY+GTEK9ZVBMpIZAlj/FU
	elZs3HrITyPiSlnZJroRxW4uLmvS1Ugl58eviOFi0bEorHl99e1kkGyeAPIkkE3Ds4Sf
	7ITbhGcaJVuaY88AIOlY0+iUk/WRGnQD/emwIhzp/0eGgDiI++TrmuFJFaid7lZvQ0v/
	WFajg0hHhKrnf6BUYzWV6KdgoNTVgyB/xdIaZGhBsiEkGOvBg9XSnlS7cQ85jlmqIb+A
	1www==
X-Gm-Message-State: APt69E0yIxuyRekMOk7YxFnA3dQ9yfkWhBZtKVtsV52qnEeJlZs1sabs
	mA7qIg16XoFjWZZEDVow4cc=
X-Received: by 2002:ac8:2f47:: with SMTP id
	k7-v6mr14825276qta.363.1528730141951; 
	Mon, 11 Jun 2018 08:15:41 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	e97-v6sm3149693qtb.78.2018.06.11.08.15.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Jun 2018 08:15:41 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, 
	QEMU Developers <qemu-devel@nongnu.org>
References: <20180601144328.23817-1-peter.maydell@linaro.org>
	<CAFEAcA__A1a3xwdP+_6vzraNafTu3NPY+mj=5vhEAJpEcAY=3Q@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <29b8e247-acdd-5569-dc11-7d17883684fe@amsat.org>
Date: Mon, 11 Jun 2018 12:15:37 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA__A1a3xwdP+_6vzraNafTu3NPY+mj=5vhEAJpEcAY=3Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH 0/2] armv7m: Remove
 armv7m_init() function
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
Cc: Jim Mussared <jim@groklearning.com>,
	=?UTF-8?Q?Steffen_G=c3=b6rtz?= <mail@steffen-goertz.de>,
	"patches@linaro.org" <patches@linaro.org>, Joel Stanley <joel@jms.id.au>,
	Stefan Hajnoczi <stefanha@redhat.com>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QbFK+JEskffR

On 06/11/2018 11:04 AM, Peter Maydell wrote:
> Ping for code review?
> 
> thanks
> -- PMM
> 
> On 1 June 2018 at 15:43, Peter Maydell <peter.maydell@linaro.org> wrote:
>> The armv7m_init() function is a legacy from before we properly QOMified
>> ARMv7M, and it has some flaws:
>>
>>  * it combines work that needs to be done by an SoC object (creating
>>    and initializing the TYPE_ARMV7M object) with work that needs to
>>    be done by the board model (setting the system up to load the ELF
>>    file specified with -kernel)
>>  * TYPE_ARMV7M creation failure is fatal, but an SoC object wants to
>>    arrange to propagate the failure outward
>>  * it uses allocate-and-create via qdev_create() whereas the current
>>    preferred style for SoC objects is to do creation in-place
>>
>> This patchset fixes the only current caller (the stellaris board)
>> to not use it, and then removes the function.

Good cleanup.

>>
>> New board and SoC models should do the two jobs this function
>> was doing themselves, in the right places and with whatever their
>> preferred style/error handling is.
>>
>> (I've cc'd the people working on the nRF51 SoC model, as a heads-up
>> that they'll need to update their code so it compiles once this
>> hits master.)
>>
>> thanks
>> -- PMM
>>
>> Peter Maydell (2):
>>   stellaris: Stop using armv7m_init()
>>   hw/arm/armv7m: Remove unused armv7m_init() function
>>
>>  include/hw/arm/arm.h |  8 ++------
>>  hw/arm/armv7m.c      | 21 ---------------------
>>  hw/arm/stellaris.c   | 12 ++++++++++--
>>  3 files changed, 12 insertions(+), 29 deletions(-)
> 

Series:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
