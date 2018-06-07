Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp2323762wrq;
        Thu, 7 Jun 2018 09:47:36 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIu6zVRYlKGZ0kDUDGcmx5cqW3FwCw8gx/k/vaXhzftdNoIPUjOL1S4y+YMR04rNt1gXZuu
X-Received: by 2002:a37:270b:: with SMTP id n11-v6mr2176380qkn.91.1528390056523;
        Thu, 07 Jun 2018 09:47:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528390056; cv=none;
        d=google.com; s=arc-20160816;
        b=Ezag0gzhBzHQcg719Y/9XWP11HDHwmum4zodjNNPPZGG6ilJtBMO4DHxsyzl/0nVTO
         xh537MtkKaDdP8j7ZdgE1KdaXYnHbjQ40qQ/Iy/zOGOutGxWm1HWcMV4bAjADS4VXMTq
         kmUm0dsExN3hY2Atv0k6RmPCCm/u7ScnR2eWI3W8MD/Bp4GaKRbfzM3J8is1pQ2KyPFP
         h5aMeviA7EQiyLfbQ70TYd0yYNOAilNyAPk8zYRWdrgeFUC0Pe2pXBpgVO9Ubs+yEUNr
         0i1/nzkkSCVeBfLtPBsuAq8CC2RqZw2VAZxmU/R5dVT4YuEv+ZNs7PMHPMOmnpQa8swT
         OOyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:references:to:from
         :dkim-signature:arc-authentication-results;
        bh=nT0f/ZWMvLcz8tOaCH7sPOhgb8Kn0hXiYrweI/f0jBE=;
        b=pbHiFa7Jf1fC36al+taA2OKNTun4oxSQvq8Ja/tcmnLTurCtOxG088htQmU9zkjFUq
         PiD9I5HCvtkiYVfnBRchh6n/BUf2fayOTJoIoterl1Av1fadSIm4P9oQnag1li0e68AT
         y6+jBNB22lqPT8lgRXWMbqJiPBDK2JGnHeckjjjn9SW3+B8GKohJrFhfimeoyaEsupsJ
         s+VWD/ey31edEcDHil6R9SdvcIxFwsdKLGmOWmS9LQQc5v2DTXmcLIpvLHSfQVrkHMsQ
         dPsqOmPSlTWQv+92nA2lNKKNhlnTpZTCN36f6vONWbtOD2iyvT+6s0XEBtY+GSnQ7eu7
         En5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=j6x6jjVm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m47-v6si7627263qvg.8.2018.06.07.09.47.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Jun 2018 09:47:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=j6x6jjVm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59194 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fQy4W-0008Vg-2G
	for alex.bennee@linaro.org; Thu, 07 Jun 2018 12:47:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54528)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQy4O-0008VU-Gv
	for qemu-arm@nongnu.org; Thu, 07 Jun 2018 12:47:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQy4K-000806-EZ
	for qemu-arm@nongnu.org; Thu, 07 Jun 2018 12:47:28 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:43223)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQy4K-0007zo-Ae; Thu, 07 Jun 2018 12:47:24 -0400
Received: by mail-qt0-x242.google.com with SMTP id y89-v6so10513783qtd.10;
	Thu, 07 Jun 2018 09:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:from:to:cc:references:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=nT0f/ZWMvLcz8tOaCH7sPOhgb8Kn0hXiYrweI/f0jBE=;
	b=j6x6jjVmsY9coBpHDGYrUZ0x5xEW26ReqWp7MVuFBOe6pWbygRcED6nt7l+7UOXvWJ
	fstdvpg6pgBaoPRyQ/k0u6lMWbZNYTzRiEE3NSS7Dbt8/UeSpDKbH+Y2fwcHNqThWcLv
	xVkas23HajzojgQY2VzdKV/MLjMh8TPex1ymD/AVO2FU8iJzwiSBSANwDtZOxRdKdcuA
	/IdedNKmQ4kqCs6bB3PWV8noB3hhAj/l9ZxQfot1GhqV8aOzucvrjvUiaTCNYIXMXaTp
	oizouPj5l2LTarx8+uhi746aozajHswTG5YgyAE4XKSs+83zsMKCGW1LV1e450SsGih+
	es8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:from:to:cc:references:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=nT0f/ZWMvLcz8tOaCH7sPOhgb8Kn0hXiYrweI/f0jBE=;
	b=uEFXTEwnHdjNMyv26rD/tW8zkZnncDDsfDjsCOU5KoaaGtFkXZ/2myKUpVmuBzP5xb
	n10ef5ab0bj61bBXTKPsW3FzExBvzNuJkNIf9A06exHejFhjW21ygAtiWB+52l05WBOS
	ifqBnvnV85C5+spi96AbdU0z1Q1kOnXglOdnpS/aof8OEONiWJpYXCf3ali9xyc6DzOY
	zgQMa7TCyizIMTgzF/+ZtnWcWHF+si76wlbFWQfdHLtAhLgzxIl+c8PxrxrP9QN1R+ER
	gy/NN5c0LyVOkuNiOKLCICuyM3+uxXdSx+VcfFQntRek7ORy6isDQuZoIXNydn6J8TUw
	2pug==
X-Gm-Message-State: APt69E1BsGNCTSLxNQlBSuOcpO+VmwB7TMBVSFayIkvwp+qUfUSQMKJy
	UHgY2u0hUkmXXKFAkY5nX/Y=
X-Received: by 2002:ac8:388:: with SMTP id t8-v6mr2491657qtg.194.1528390043636;
	Thu, 07 Jun 2018 09:47:23 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	k6-v6sm5556871qtm.30.2018.06.07.09.47.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Jun 2018 09:47:23 -0700 (PDT)
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180603000827.30872-1-f4bug@amsat.org>
	<20180603000827.30872-2-f4bug@amsat.org>
	<CAFEAcA_EDXyOHpdamg05=p35jazqgZsLKP2O+G1tg6BoR4b28g@mail.gmail.com>
	<b5db1ee8-68b1-a41a-be34-eba99ef5565d@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <f52778c1-f556-22f2-635f-7b85e0eab39b@amsat.org>
Date: Thu, 7 Jun 2018 13:47:16 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <b5db1ee8-68b1-a41a-be34-eba99ef5565d@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: Re: [Qemu-arm] [PATCH 1/8] sdcard: Update the Configuration
 Register (SCR) to Spec Version 1.10
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9HYeIrMH8AUL

On 06/07/2018 12:14 PM, Philippe Mathieu-Daudé wrote:
> On 06/07/2018 08:00 AM, Peter Maydell wrote:
>> On 3 June 2018 at 01:08, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>> This register now matches the description of the header:
>>>
>>>  * SD Memory Card emulation as defined in the "SD Memory Card Physical
>>>  * layer specification, Version 1.10."
>>
>> Can you provide a brief justification in the commit message
>> of why it makes more sense for us to advertise as 1.10, please?
>>
>> (eg a summary of the 1.01 to 1.10 differences and a note
>> that we already implement them)
> 
> The only differences I found are:

And I shamefully missed:

    4.3.10 Switch function command
           (This chapter is newly added in version 1.10)

    Switch function command (CMD6) 1 is used to switch or expand
    memory card functions. [...]

    This is a new feature, introduced in SD physical Layer
    Specification Version 1.10. Therefore, cards that are
    compatible with earlier versions of the spec do not support
    it. The host shall check the "SD_SPEC" field in the SCR
    register to recognize what version of the spec the card
    complies with before using CMD6. It is mandatory for SD
    memory card of Ver1.10 to support CMD6.

> 
>     4.3.11 High-Speed mode (25MB/sec interface speed)
>            (This chapter is newly added in version 1.10)
> 
>     Though the Rev 1.01 SD memory card supports up to 12.5MB/sec
>     interface speed, the speed of 25MB/sec is necessary to support
>     increasing performance needs of the host and because of memory
>     size which continues to grow.
>     To achieve 25MB/sec interface speed, clock rate is increased to
>     50MHz and CLK/CMD/DAT signal timing and circuit conditions are
>     reconsidered and changed from Physical Layer Specification
>     Version 1.01.
> 
>     4.3.12 Command system
>            (This chapter is newly added in version 1.10)
> 
>     SD commands CMD34-37, CMD50, CMD57 are reserved for SD command
>     system expansion via the switch command.
>     [These commands] will be considered as illegal commands (as
>     defined in revision 1.01 of the SD physical layer specification).
