Received: by 10.28.71.27 with SMTP id u27csp1062091wma;
        Tue, 20 Feb 2018 05:07:02 -0800 (PST)
X-Google-Smtp-Source: AH8x225hCt+8Fsdxa2E3m3wzpiGtCDMvbPPLWyI0c7QmosvlVgMTK9gHjdH5G3g+TBFUiPe287jn
X-Received: by 10.129.51.148 with SMTP id z142mr8547241ywz.465.1519132022764;
        Tue, 20 Feb 2018 05:07:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519132022; cv=none;
        d=google.com; s=arc-20160816;
        b=ksBioe8IfR1YlnP/c1T6XVuC9cqz8NGjvyl1CSsHUDroHzB+o+Rgih+Z02a/FzSMKK
         1c9qG/K1hNmGy0Rjs25L3kiU2DrW1WRKgtd/guQWns5HyZ8/9yqeUt+rEA+u4HJyK163
         pICvgOiT4vtY7HPh+lenMTXD1vukHzxGen6PZ7LaDNtFEN3TB9cnowqc/ZVEnkfF75nG
         5gz14oo9PR06B3WPXJzPE1OQ33LMIS2uiH2aINecJtXtU1h6tTAQW7b2X6gXPk/9SctH
         TuaGyj1kSKudqyhTJdQlpqvAe+qRtYoObTlORme3FFdFzitcg6GZb7DvD0bPFVSB7vf6
         CvfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject
         :content-language:content-transfer-encoding:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=/zUxSoPH5ESokkvRn2kNWCqDlGggSk8+5tkBg5HZMjg=;
        b=FrbOchfro9QBuhl3eXnFoxTeZbzKHErx4tWMLyLVNSlnTJXn+m+Wxvqq1f+tkZmofk
         KOi7ygRAE7oAd184WU0IPtkC3H5VKMWWVzFXZY/KusZwpIrKnWuUenuQDqgzbErA6Q16
         A2/8eUs3hOKQhK1ZSXEaVyt+LvIXFyQcAH6goR5Eo4/AmCRsBHcryO6isNMRwjgUbvs9
         EIdNKqFVbsGXUReeF8GrmsKlWDhY/fDNVxO0UMkDl8B2kcrCc1JWqG3AORdrcpv5oFaH
         VOLcHfMT9/iy8vhGp271ikIB6reV9cuylhzZN+PjHmDcIqhSnVGXrHPgE67lNakauxy4
         WdcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=DgaJPSrQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n6si2528549ybk.629.2018.02.20.05.07.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Feb 2018 05:07:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=DgaJPSrQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55386 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eo7dO-0001kg-6J
	for alex.bennee@linaro.org; Tue, 20 Feb 2018 08:07:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37316)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tcminyard@gmail.com>) id 1eo7dC-0001iB-Na
	for qemu-arm@nongnu.org; Tue, 20 Feb 2018 08:06:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <tcminyard@gmail.com>) id 1eo7dB-0002NG-EG
	for qemu-arm@nongnu.org; Tue, 20 Feb 2018 08:06:50 -0500
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:45272)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <tcminyard@gmail.com>)
	id 1eo7dB-0002N2-7I; Tue, 20 Feb 2018 08:06:49 -0500
Received: by mail-oi0-x244.google.com with SMTP id j79so5675741oib.12;
	Tue, 20 Feb 2018 05:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:reply-to:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=/zUxSoPH5ESokkvRn2kNWCqDlGggSk8+5tkBg5HZMjg=;
	b=DgaJPSrQlVaVGWEok0BwRW6kF7u/nCiLITpcZoFjW/UQOC8REJYV6k1sF30OWvI+C+
	A+QzDRR1P66VEQ6e4HJBd+I8aT9FMzJiplIYba9t+b+X5gSJkfdAjg0JnZmQqUVZ3Vv8
	wAlfCF22zwIaMG4owtNz2oEJPQGhxuKmV4eBqAyqKFFikoDwtdStv6I5aiw1KvBD8lt6
	KuR3spRBbXtqqAlnwO7csny/xBasefomzGKRUY2yqrgcDrVS1ZiwiFm6Zt6/P1L2IOvn
	N4HYo3PcO/Mu7HvW6oKEWDAE9rTjhbQSPCh3X7xH6i/PSu53/RmYGP7+InfoP1Snf8Bw
	eGpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:reply-to:subject:to:cc:references:from
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=/zUxSoPH5ESokkvRn2kNWCqDlGggSk8+5tkBg5HZMjg=;
	b=Yq8lc7mP8EbpiXrYzoMAaIa0u+/xSgRBP8UiQGL01rof1kJyUb4m8U61JuA3JAdCcr
	CwCAdz8V93TYChoWKz0i0YuHei9AZqB/ejOQEN9lUfmKtfF0zE7TqctTJC4vBrs2NGg1
	LrGR+DF6tHahjyyV8oVSSn79WHJ7mB0pKEm+O/iqFwmjlm8x2o/idlFzUq1QfMHWC3pL
	gj85YR1eNL3IvCnSG/5obB2IRsQohDKheSDiFxAoglyWw87LLYn6mpOT2nRssdQ9ap4j
	ihNwPyEPWXcCKfue6wXUeIR91MqhxrvEPWebYNDPDXuUbjDlBuRdl4Jb80uU3Qr8eOMj
	jDjQ==
X-Gm-Message-State: APf1xPDXklXmxa52woJy3ih1GRrjIYFLX5TcL1Uikl+aNU6nALF+rxMz
	wrnxWX3FxCWZWERDCk/MGQ==
X-Received: by 10.202.175.211 with SMTP id y202mr2971056oie.71.1519132008283; 
	Tue, 20 Feb 2018 05:06:48 -0800 (PST)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
	by smtp.gmail.com with ESMTPSA id q12sm367831otg.24.2018.02.20.05.06.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Feb 2018 05:06:47 -0800 (PST)
Received: from [192.168.27.3] (t430m.minyard.net [192.168.27.3])
	by serve.minyard.net (Postfix) with ESMTPSA id 40FD32F2;
	Tue, 20 Feb 2018 07:06:46 -0600 (CST)
To: Linus Walleij <linus.walleij@linaro.org>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <CACRpkda9B=frmS0QF429p-q+KoCKG=5NON-kQ0Rt-nba2powRA@mail.gmail.com>
	<1519053606-9817-1-git-send-email-minyard@acm.org>
	<1519053606-9817-3-git-send-email-minyard@acm.org>
	<CAFEAcA-jTZMDNTF2rPn20DjSxu=z7n9M+2xo-pNfAYoha_LuzQ@mail.gmail.com>
From: Corey Minyard <minyard@acm.org>
Message-ID: <03f96a6b-3a52-0d72-e634-8b8f167f2992@acm.org>
Date: Tue, 20 Feb 2018 07:06:45 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-jTZMDNTF2rPn20DjSxu=z7n9M+2xo-pNfAYoha_LuzQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 2/2] i2c: Move the bus class to
 i2c.h
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
Reply-To: minyard@acm.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Corey Minyard <cminyard@mvista.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HjSKByjkV3cG

On 02/19/2018 09:25 AM, Peter Maydell wrote:
> On 19 February 2018 at 15:20,  <minyard@acm.org> wrote:
>> From: Corey Minyard <cminyard@mvista.com>
>>
>> Some devices need access to it.
>>
>> Signed-off-by: Corey Minyard <cminyard@mvista.com>
>> ---
>>   hw/i2c/core.c        | 17 -----------------
>>   include/hw/i2c/i2c.h | 17 +++++++++++++++++
>>   2 files changed, 17 insertions(+), 17 deletions(-)
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Linus, Philippe, do you want me to submit this, or do you want
to take it?  You can pull it from:

https://github.com/cminyard/qemu.git tags/i2c-bus-move

-corey

> thanks
> -- PMM


