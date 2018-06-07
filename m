Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp2225759wrq;
        Thu, 7 Jun 2018 08:15:08 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJf/lviUKte0hfA5D1tTDdBuQpHu2j0XNlQdoV9pl2DNXlM3JziQBFRN6tIyi4AZyLyBd+C
X-Received: by 2002:ac8:5053:: with SMTP id h19-v6mr2151412qtm.71.1528384508894;
        Thu, 07 Jun 2018 08:15:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528384508; cv=none;
        d=google.com; s=arc-20160816;
        b=mHg94VkQx3UrPSnVLL6ODiO8+1MsdzLfo+rJO1DvXafjwqlu0h32PyRMDmpmkZ07pZ
         egvFQryOrGZZ1vm8FSvAjmkluDylN5/Kwc2W3p1PIX28irKEWw3ruf43VMRPY056cI1a
         LoxqEuW951qrcvu5v+gGvTplfCnJ7OMaJfcL0QPtTYA9QnyDcW+cEpuFg99ifxQRpiGe
         W++KJxutwTkx0xDBNmSse5LXhm4YRlsU9JU5JSMQxpdq6+X0wjah663N7dPnkGywYEIS
         AZ1988mJFpinkxAUDfvZuK1omYVNxde/T4eC8OwnRQaQrFUnHoeaSdDbh1a924k/GPs1
         Bppg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=ejrm5KjIBXIz6CpCE6fCelgOdid/0tJHarRhwjmZdyY=;
        b=DjgQHSZkSBP0BDP8rTBGLNi9hzK3CC+LjkcIC3Fj4TC/zEfuj4OWk/xyIabf/+fmHx
         sps/FBohd2HZLz6Z9H7goGlmiVbi4XUwyU+L5JzMtXKTjinB6tqZXvNKYDzwZETxnDUt
         Pxf3hU865BgqScJafw5XnGs+KyFz7T526rWIPyzIqLiqaG9zqFriaAZPkjyuKrvT/9LV
         X5Owjc2oVAvZrUcErZG9hYgCzXXkjlz7xJ4brU0dINtOzNz9oBK0wyNfCZ8qvHsVz/mA
         6/Jy7OLIGDHzqaWJw9M4AzAW3gi1B6g7+6bFxXm2WbgCZKs/Wa7CdVzXy0XRP0bPOzG9
         eEag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=AqX+K+0w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k30-v6si420175qtk.393.2018.06.07.08.15.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Jun 2018 08:15:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=AqX+K+0w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58522 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fQwd2-000603-DS
	for alex.bennee@linaro.org; Thu, 07 Jun 2018 11:15:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55071)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQwcV-0005jR-PD
	for qemu-arm@nongnu.org; Thu, 07 Jun 2018 11:14:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQwcQ-0004Iq-R3
	for qemu-arm@nongnu.org; Thu, 07 Jun 2018 11:14:35 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:34759)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQwcQ-0004Ic-Lg; Thu, 07 Jun 2018 11:14:30 -0400
Received: by mail-qk0-x242.google.com with SMTP id q70-v6so6784759qke.1;
	Thu, 07 Jun 2018 08:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ejrm5KjIBXIz6CpCE6fCelgOdid/0tJHarRhwjmZdyY=;
	b=AqX+K+0wOVStFsibgX8hOmSifmafuoSBEBOc0MsxJwlrmGqGxxeHcp/AY/Fzn4gzau
	9o0uc6FIjiYQZfb6lWrfWfDrR6PfU0XSQd3Modck7ony1+Zrgc95eb/9tbEHnrjKtNmq
	MAuMQxDN+Hy3FQuWQfot7hbR70imXFofQi27snSlau6JdbczWIB701fBos208AMR50IW
	2zbDtk1G5J/VYZsHi3bqnaFAe7JpHP1b+iZwQdQQRjRxa17AYterJYFV3OpRKVyBf6pK
	pOHqkmLERsvzqjVlyB1nbeEJirrkGOKQqPetxFMpimaO4rN6fQ6VrsJHl6BiT6VWSqGG
	6+Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=ejrm5KjIBXIz6CpCE6fCelgOdid/0tJHarRhwjmZdyY=;
	b=uKmysVOJ8X5VhXNiI7FoZ5dSpn6lOXQzGlOw0H4h2pbdWUTeGzWMPyJfobBIc34lK0
	jCGiGGzmA0bY1AcSzFnB8CwbELESVEGH+KVHkPG7xHPNgZ/NlaQoYucBlrbuN6AjvtEj
	QT5c9tEmw/jYI7WWc/VYoMgTXc/tIpI/8dznYJsMGSiaq5JYeuLF5Fsa6b81GMU1lqMF
	fTGvMeyWh2WIi0A9G9hsA+2R7QiWo1TnOAqLX5F08M03y2jbrFQMeytqCwu4gOA8kyuP
	lYq7bO6Dstex5KzufKZ2iI4VVPzzwVDCCkUzBjk8NXAKv4rEj3V+pk1kqO7y4M+gv5Wm
	5cpw==
X-Gm-Message-State: APt69E10a0SzEjJqQM6ag+6u7QRXdPTMSA549Ie3Tg/9OF9Sj1UBxUJS
	xF1VkEvU23vlvKUV82k+qKU=
X-Received: by 2002:a37:16e0:: with SMTP id
	93-v6mr1976269qkw.148.1528384470084; 
	Thu, 07 Jun 2018 08:14:30 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	e25-v6sm2568373qkm.6.2018.06.07.08.14.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Jun 2018 08:14:29 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180603000827.30872-1-f4bug@amsat.org>
	<20180603000827.30872-2-f4bug@amsat.org>
	<CAFEAcA_EDXyOHpdamg05=p35jazqgZsLKP2O+G1tg6BoR4b28g@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <b5db1ee8-68b1-a41a-be34-eba99ef5565d@amsat.org>
Date: Thu, 7 Jun 2018 12:14:25 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_EDXyOHpdamg05=p35jazqgZsLKP2O+G1tg6BoR4b28g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
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
X-TUID: QqjGdUGSzo8o

Hi Peter,

On 06/07/2018 08:00 AM, Peter Maydell wrote:
> On 3 June 2018 at 01:08, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>> This register now matches the description of the header:
>>
>>  * SD Memory Card emulation as defined in the "SD Memory Card Physical
>>  * layer specification, Version 1.10."
> 
> Can you provide a brief justification in the commit message
> of why it makes more sense for us to advertise as 1.10, please?
> 
> (eg a summary of the 1.01 to 1.10 differences and a note
> that we already implement them)

The only differences I found are:

    4.3.11 High-Speed mode (25MB/sec interface speed)
           (This chapter is newly added in version 1.10)

    Though the Rev 1.01 SD memory card supports up to 12.5MB/sec
    interface speed, the speed of 25MB/sec is necessary to support
    increasing performance needs of the host and because of memory
    size which continues to grow.
    To achieve 25MB/sec interface speed, clock rate is increased to
    50MHz and CLK/CMD/DAT signal timing and circuit conditions are
    reconsidered and changed from Physical Layer Specification
    Version 1.01.

    4.3.12 Command system
           (This chapter is newly added in version 1.10)

    SD commands CMD34-37, CMD50, CMD57 are reserved for SD command
    system expansion via the switch command.
    [These commands] will be considered as illegal commands (as
    defined in revision 1.01 of the SD physical layer specification).

The current codebase is a mix of v1 registers and v2 commands (which
were added slowly without updating all registers).
As of now v1 is broken (See the lm3s6965evb machine can not use the
card) and all users are using v2.
My goal with these series is to also support v3.

It might be more obvious to first enforce the current implementation is
v2, then restore v1 support and go for v3. I think this is doable by an
easy rebase of this series (keep v2 and restore v1).

Do you think this is better?

Regards,

Phil.
