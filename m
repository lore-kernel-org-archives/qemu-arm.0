Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp856792wrq;
        Fri, 15 Jun 2018 06:32:55 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIs9LIJ9In21+aNVRtWtH8Flhj2spUyUMOX7KKPmAEzTDO6nBfDwojzK9fMSKTfGd5odhOm
X-Received: by 2002:ac8:3886:: with SMTP id f6-v6mr1411504qtc.165.1529069575408;
        Fri, 15 Jun 2018 06:32:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529069575; cv=none;
        d=google.com; s=arc-20160816;
        b=UeS3uIHHEdzyQRyUmKSSSsW090RbwuNBsgaJ7qWzN9jB8SQotOr6RygpvW6iuTdQZ3
         jhw0gAuLExw03sWgCmu9E3Ts6WwNsk2IdX1yyWlSkR5JF6u6nJOjbHEeMQhnJkqmOjEM
         S49DagxmMvL+YzoLNcCTRIniXR6cYR3/ExzivS9Aea4ihZHJl+ite0qge5YDwnrycmlu
         4Hm4zdCb64j0//HneKOHA41V/riFL3M0pDReyFOZkSqhYYUfSzuM1Qf/Gty3LtiN3Ung
         skFLIrned1SaokBRy7EhvJ+3n8TiPmu9KxdN+77sHYmtCFFL4di2T7oG3mRn7YxZqb9V
         wpZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=iS4KziYkKR/cYLSzM88X8dHERJ9HUr/pmOSZ9fPkpb4=;
        b=N8XxgYfoRWMCFCpA13I9RdWMwM5AMloGFBVSOZtgTvaSYSTji9Rd85j4qjc9VtiZLG
         Rv72vixHah6EAky1nN4EtwppoIAKMVlfaSUFJf3DN5HSigKLP7O0pntiPrKVKq/6iWO1
         iatgasJ69n6K1KcCI/XjXltdK+jP6fFseBLx/gOAwH66HBGPYCA08yM9oUut5dGN8RGg
         TtN195Oy4MeIMX80DxI7t/RoIEbwIhB9PGj6k6jQyINKKYc0mafQexhjPof0oMKiW1sE
         6IKJBIVjwlCLs0G5yE5JBIm649CMIvKfJL/xSQNXn/svU1K7A2Y0mcltqQBnfW+pfZVe
         ACoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=WkPHOsFv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c18-v6si2706419qkg.61.2018.06.15.06.32.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Jun 2018 06:32:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=WkPHOsFv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46866 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fToqU-0004X0-Vf
	for alex.bennee@linaro.org; Fri, 15 Jun 2018 09:32:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46686)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <groeck7@gmail.com>) id 1fTooc-0003Pl-Eu
	for qemu-arm@nongnu.org; Fri, 15 Jun 2018 09:31:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <groeck7@gmail.com>) id 1fTooX-00047r-EU
	for qemu-arm@nongnu.org; Fri, 15 Jun 2018 09:30:58 -0400
Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242]:41131)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <groeck7@gmail.com>) id 1fTooX-00046J-71
	for qemu-arm@nongnu.org; Fri, 15 Jun 2018 09:30:53 -0400
Received: by mail-pg0-x242.google.com with SMTP id l65-v6so4447064pgl.8
	for <qemu-arm@nongnu.org>; Fri, 15 Jun 2018 06:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=iS4KziYkKR/cYLSzM88X8dHERJ9HUr/pmOSZ9fPkpb4=;
	b=WkPHOsFvJlzeOqn6To+YCBRTD7Vd3zBFklEVKFsEjRqbIon4kbaIgvqDgd1+GqrZg5
	dynJ6R/Bem8sGUnbmwnO7VYQq6SRwiQyZDOsNFmma2Agb4wVtb12J2m9flsUD6887GIH
	jap8NGysnWfaafy5oJ5t/NO2+MhkcBp/ZTkVSylEuC1LKNrsHCv2DWvynQyAGKIx3dEX
	aN5vJ8FOQac5qeBb0s3hCjeQxO9vuOzLirEf5XEVcNZl80Ljg3Oz4n3OrTLBfbshC4uV
	Yd3ep6cy0bMK95mR7BFSblIODUNDO36ciQQBHPvoj5BxamFLCI0zHx6A0ZtgQWLTiqQY
	lDnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=iS4KziYkKR/cYLSzM88X8dHERJ9HUr/pmOSZ9fPkpb4=;
	b=t1I/SZ0Byw1K3uTQQzpKGUTmdvW8TqW1eMFlV7aojrqh25LhWR611v25M2n+uF2tp7
	w7ZvvZO+9wyrvo6UWaDbf3p9algAbXG26eYMAvYdjh2LFZFDybL0b0oo40hkA/+VCcuE
	v4aPvPX4J4vro3k7e3kJFd/shvHiHIequAFT5W7BdCrUyg7QmJGSZiUlBDCsfSdrDxRV
	aLmtYhhUSryJR5U2bJLvwn8oOkrXz92rAfAKWF8usruVySSLn77bebhlJL8dmm0vTZty
	0Gd122nfK9OcLwtXSqQGqBTbzrQsCR+wIAWpDkT4EehfE2HA4Ahs9aN+PkyFnK1X163v
	ULWg==
X-Gm-Message-State: APt69E1zPejcuYAn3Kvbd00A3jjIrLFZxrPFISKPIVLI6/RS6HkfCCp8
	0rpt/jhTqjyd3bL6Aizx8VzDmw==
X-Received: by 2002:a63:618e:: with SMTP id
	v136-v6mr1642796pgb.100.1529069451808; 
	Fri, 15 Jun 2018 06:30:51 -0700 (PDT)
Received: from server.roeck-us.net
	(108-223-40-66.lightspeed.sntcca.sbcglobal.net. [108.223.40.66])
	by smtp.gmail.com with ESMTPSA id
	k15-v6sm11663792pfi.37.2018.06.15.06.30.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Jun 2018 06:30:50 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180614215422.GA29690@roeck-us.net>
	<CAFEAcA-t9G=HAPH2325rduAKFNUEXNE-Jp_m9fMhfdTCbtm28g@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <4ff384cf-14ad-ef33-5532-4f8dbb8d0ff6@roeck-us.net>
Date: Fri, 15 Jun 2018 06:30:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-t9G=HAPH2325rduAKFNUEXNE-Jp_m9fMhfdTCbtm28g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::242
Subject: Re: [Qemu-arm] Booting Cortex-M3 Linux kernels in qemu
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
Cc: qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SWHk75A0oky9

Hi Peter,

On 06/15/2018 02:16 AM, Peter Maydell wrote:
> On 14 June 2018 at 22:54, Guenter Roeck <linux@roeck-us.net> wrote:
>> qemu supports a number of boards with Cortex-M3 CPU. One board supported
>> by both qemu and Linux is an385.
>>
>> As part of my kernel testing effort, it would be great to be able to boot
>> a non-MMU kernel. However, nothing I tried works.
>>
>> Is it possible to boot a Cortex-M3 Linux kernel with qemu ? If yes, does
>> anyone happen to know how to do it ?
> 
> I've never tried to boot Linux, only a few RTOS-ish things.
> mps2-an385 is probably a reasonably good choice to start with.
> Note that it is missing quite a lot of devices, so you might
> need to configure Linux not to try to use them (and also
> let us know which ones would be useful for us to implement...)
> If you pass QEMU the command line -d unimp option it should log
> accesses to ranges and devices we don't implement, which may
> throw up some useful hints.
> 
> Also for M-profile I'd suggest always trying with the most
> recent QEMU if you aren't already, since we've been working
> actively on it recently.
> 

I tried various versions, but usually I am on the latest version
or even mainline (in this case it is v2.12).

Anyway, my problem is much more basic than device support. Whatever I try,
I always get

qemu: fatal: Lockup: can't escalate 3 to HardFault (current priority -1)

R00=00000000 R01=00000000 R02=00000000 R03=00000000
R04=00000000 R05=00000000 R06=00000000 R07=00000000
R08=00000000 R09=00000000 R10=00000000 R11=00000000
R12=00000000 R13=ffffffe0 R14=fffffff9 R15=00000000
XPSR=40000003 -Z-- A handler
FPSCR: 00000000

even when I use a toolchain specifically built for Cortex-M3 and thumb2,
and no matter which image I try to load. Presumably that means that it
tries to execute or jump to a non-thumb2 instruction, but that doesn't
really help me. Any idea, or should I just give up ?

Thanks,
Guenter
