Received: by 10.223.159.74 with SMTP id f10csp2657449wrg;
        Fri, 22 Dec 2017 11:58:07 -0800 (PST)
X-Google-Smtp-Source: ACJfBosyQKOmYjSfWPPQbC/bPQ+Wvj5hP7W/xAtzfNGLnG+29VcI/F/A0bD9L7lqydSrrSj7ci08
X-Received: by 10.37.139.144 with SMTP id j16mr11050935ybl.525.1513972687313;
        Fri, 22 Dec 2017 11:58:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513972687; cv=none;
        d=google.com; s=arc-20160816;
        b=bbYqvOLXD892jhRvU017N2eXODwN84rOagegzF25G74yjH6s5oHSepEJpgvYJylz2c
         9iHMyz+0MVDrvak9zqHutX66fV5TyU3KwwS9jGyYg5MyiJ2tIf+rL0Jhv2omWlU7WvXG
         ZYE9qotidTgAvoUObOP93JDCjaMXfXknHx9olTVVAiXrsDOQEA2gtEZkwM8o0Kv0N7um
         jjx0ShY7KbxFjAg++T9Mv5dPo/mhuXJ1fMkxPaaQqnRzRP34O/twRuW+pN07rx6iSrSb
         Epa/Ss2MTPMUT978C+AK3G6C2YR2YLUUBUr38yCmQ3C9WEq5rdno4dNvVLfrIFMBFjEp
         34Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=d2CnRm+mcTo7YAxTriRpmpOxjBitfxPWPM3aPJKVUrQ=;
        b=N0El+MdAZzrAMEEh9CTvPW67gMIpogyEIucZhfDTWXkHeIKtcTB63e/YLe1v0D25ol
         Gh/fL65bIFRG9tDpy++lK53EU6rgAkZW7Yol8caeT9QTnP0i0kCx9v+FlTV2N+IW+JRn
         R8oftKtbQYWEsjp0s3i2VvustSI0NRjOBBj38px/mN4nPVZKOqccW8c46lmuLHGjb92l
         74nWxu8H2yYQSSmyWDYIrIXG9qshbD/sN6KZfdnTAhFw5XW59sUGIpo7Pn/BGvPZA1AM
         Ef3AZsskNJStfwHmHCLfmT4wrgCFTCX9+zIWt68VVY4kAEL3iCe0RrT22pcrvpbSUrzh
         SzzA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=biqBAF7Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o140si4220345ywo.545.2017.12.22.11.58.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Dec 2017 11:58:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=biqBAF7Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36344 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eSTSI-0002p4-Om
	for alex.bennee@linaro.org; Fri, 22 Dec 2017 14:58:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56898)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eSTS6-0002nX-CA
	for qemu-arm@nongnu.org; Fri, 22 Dec 2017 14:57:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eSTS5-0001TI-OU
	for qemu-arm@nongnu.org; Fri, 22 Dec 2017 14:57:54 -0500
Received: from mail-wr0-x242.google.com ([2a00:1450:400c:c0c::242]:35080)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1eSTS3-0001QR-QO; Fri, 22 Dec 2017 14:57:51 -0500
Received: by mail-wr0-x242.google.com with SMTP id l19so16416113wrc.2;
	Fri, 22 Dec 2017 11:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=d2CnRm+mcTo7YAxTriRpmpOxjBitfxPWPM3aPJKVUrQ=;
	b=biqBAF7Y3cbon6ARv3vz1XWPlcc1lF0AHwB6URMwyROe/aAMC35N3Ek9YiDPH+6WcW
	STKwupIXJ9H0Dqy7yetdxtO3lPs3+xsl7JNRRGtAmAOBFtb+59YN7Vp6ijd/BXrStIjI
	8ralGMXz+Mr9l7ufHpR1/lzR2AOYOvNyjzTt4luLhkXR7dCl1MI76BCO58cFRU/DNrMW
	ZsZ0scSa9Ysq084mUfwZHej/rq8DJCwxHNlZAzJJkgkxPW7kDwnQVevz6Kvh+nDJvwyX
	OhRy8BGMHkn4o6IVsoqtple6hWM/ULOHGIw03TraGapdMTKusQizdPEpLPgQKaAKffaU
	5HAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=d2CnRm+mcTo7YAxTriRpmpOxjBitfxPWPM3aPJKVUrQ=;
	b=AE6z1vtcC5uzocRX4JW6DWHUX5sp43IZm75h3vMo8qNTqzOtB6EG3/L/A6NhFRfd+W
	P8ZDapW6XWexMJHiO5qHVhPzTPTDS7ir9aNd/LHg35wywqcjd+kKVeW8E9abuVxd7rww
	OlRgLERLXQpBvj8xO9jgRuHEncc+fcrwQo9yFAJY6QjqUs6cNg1EC5tlklWZ9VptDx0V
	c3Shpk3rXSj0lDwyGkAszwgzdqO5aILKhxdx2YQ0POQID5ILdlj/Q/iP/c0it7ekx6D5
	4Vnx18yFpG3JBmtM2ksoI+lundzbWl8jaQkO5gl9ivVCkAuLerflVV5dMNM6GLz8ia4p
	1BDA==
X-Gm-Message-State: AKGB3mJnqfXMtrW5VZtIJU1L2LCu4h8YHtr+A9keO6Tkv5WnIaHpy15P
	YwZYI44NysLA8FQteB2LNnku+MF7UG4gmYIa5WA=
X-Received: by 10.223.190.12 with SMTP id n12mr8062363wrh.34.1513972670649;
	Fri, 22 Dec 2017 11:57:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.164.69 with HTTP; Fri, 22 Dec 2017 11:57:20 -0800 (PST)
In-Reply-To: <1cfb1217-e32d-8e91-da46-07f1c72be77f@redhat.com>
References: <cover.1513790494.git.alistair.francis@xilinx.com>
	<6bad4084f4cbc290e2e9f1a72fcfcda7223383ec.1513790495.git.alistair.francis@xilinx.com>
	<87lghulqno.fsf@dusky.pond.sub.org>
	<1cfb1217-e32d-8e91-da46-07f1c72be77f@redhat.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Fri, 22 Dec 2017 11:57:20 -0800
X-Google-Sender-Auth: OPophdmIQmdkYxSRGV6PTz0Twic
Message-ID: <CAKmqyKPyL8B5ZjEUePkqVbzP8kVmM48vWML41PRXVVO7LVmMpg@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 04/29] hw/arm: Replace
 fprintf(stderr, "*\n" with error_report()
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
	QEMU Trivial <qemu-trivial@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sdTmrbc7CAPx

On Fri, Dec 22, 2017 at 9:17 AM, Thomas Huth <thuth@redhat.com> wrote:
> On 22.12.2017 16:37, Markus Armbruster wrote:
>> Second thoughts...
>>
>> Alistair Francis <alistair.francis@xilinx.com> writes:
> [...]
>>>  #include "qemu/osdep.h"
>>> +#include "qemu/error-report.h"
>>>  #include "qapi/error.h"
>>>  #include "qemu-common.h"
>>>  #include "cpu.h"
>>> @@ -1311,8 +1312,8 @@ static void omap_prcm_apll_update(struct omap_prcm_s *s)
>>>      /* TODO: update clocks */
>>>
>>>      if (mode[0] == 1 || mode[0] == 2 || mode[1] == 1 || mode[1] == 2)
>>> -        fprintf(stderr, "%s: bad EN_54M_PLL or bad EN_96M_PLL\n",
>>> -                        __func__);
>>> +        error_report("%s: bad EN_54M_PLL or bad EN_96M_PLL",
>>> +                     __func__);
>>>  }
>>
>> This one's different: we neither exit() nor return a "failed" status to
>> the caller.
>>
>> We get here when the guest writes something funny to a certain
>> memory-mapped I/O register.  In other words, it's guest misbehavior, not
>> a user error.  I doubt it should be reported with error_report().
>> Peter, do we have a canonical way to report or log  guest misbehavior?
>
> qemu_log_mask(LOG_GUEST_ERROR, ...) ?

That seems like the best option to me.

Alistair

>
>  Thomas
>
>
