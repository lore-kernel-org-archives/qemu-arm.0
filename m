Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp967681wrq;
        Wed, 20 Jun 2018 09:33:59 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIorSb1ueWv2vKIUFKagMRyGSvSIgj1Fh8wCxA+eVimfNDW+IBlpX7swHDbGjuHQVKjzPXS
X-Received: by 2002:a37:255:: with SMTP id 82-v6mr18920546qkc.425.1529512438988;
        Wed, 20 Jun 2018 09:33:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529512438; cv=none;
        d=google.com; s=arc-20160816;
        b=lzlEU0+FQy3pxvQi2jui9YiENTTJ7nqQfKazqPn5LV2jtfOfqwrXNm+g/qYzfIDKMF
         fMM0jM7PLIIpmeM9pxJEC1V6EmWzUyqTUB/L4zclV7VhHr8sJzwLuUTfFSftpeDozhr9
         ZOzijppDQ48lgA3Rd1zWwisLcSp8jN0T+tgNOk581+hARkb6o7KKXGEsNzqaCOPKvuLt
         wfSB7rRnSGghWkAPpkaGz3rMTMzGgC2LuafjYyUFlcAZc5wiVTVTBB0iL5dh+3kwbB1E
         KM2uNh9fm54mOXATIrW5dzEKAkYoUtmljaPaqubZOpkosNMba01PQ79nx9YabHM0GDxE
         WLsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=+PRWgolWswC47GZK40+vw7rjUdeqp9W2VxfV3iFsnj0=;
        b=taTVC28R5VDknRfTJeyBsJQM/Z866IjqvB0Q0GrJ4peAicBfRIavMXfC1xLBJy2TJX
         4S7eCqcZsPSjmhj9p57s6RLwoYknbdRh1iNzLWbkXDEur4HaJ5svH0AFDFIEHLsrW74H
         +mV5ScJCWLB9LG7pzToWXbL6k0nJCp1byaPwT67Xqw0akWEpZLo7CnHk5VsrUoc7XZv0
         +2ueVSSxZ9jQ5Wz9moEKOY4+DA5mDCTO/naiNmE5FqmeT1dAUTw+K04BnqqEZ1e5riRE
         kN0lmJc9Sn6gyMZnlHb2//HeVFguYS1t9OqBz34eaoZTXoGVX4Sdh+8gAlg+3ACYx/zw
         lH0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=d+1pexjP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h14-v6si2477363qvo.159.2018.06.20.09.33.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Jun 2018 09:33:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=d+1pexjP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50792 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fVg3S-0006VK-I4
	for alex.bennee@linaro.org; Wed, 20 Jun 2018 12:33:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57082)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fVg3I-0006TE-EZ
	for qemu-arm@nongnu.org; Wed, 20 Jun 2018 12:33:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fVg3H-0006iS-P8
	for qemu-arm@nongnu.org; Wed, 20 Jun 2018 12:33:48 -0400
Received: from mail-ot0-x243.google.com ([2607:f8b0:4003:c0f::243]:44569)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fVg3H-0006i2-JE
	for qemu-arm@nongnu.org; Wed, 20 Jun 2018 12:33:47 -0400
Received: by mail-ot0-x243.google.com with SMTP id w13-v6so183296ote.11
	for <qemu-arm@nongnu.org>; Wed, 20 Jun 2018 09:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+PRWgolWswC47GZK40+vw7rjUdeqp9W2VxfV3iFsnj0=;
	b=d+1pexjPAp0tGDG1ViWFdGBkU+gzlau3gXSNPA5fbr2FG4TvXjKFcSthLnF/oHFbbg
	TL9Sy1pIM/vfxLCf7Wt+EX/omCVaUjl+SglDpyceR1P2v+u8tel2NZMTp6OU8Djz94mD
	Ej/WWJjBbRG8ARKzoj3kRIVG1oZSchir1C8eg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+PRWgolWswC47GZK40+vw7rjUdeqp9W2VxfV3iFsnj0=;
	b=sG5eh0mC27iPujVWM8fQNZA4LnJBTLjFbilVAcloNTKkVp8HTiiiiXfnhWbddwxbEP
	F0qko+IXEwR5V6CQPzt3foJ2enoxGTKhIGJE1MNNwaoOUI7dBfeMBpVYSDhMJGMp45Zf
	ArWl7LIguhHw1g8cVekojVnViCmcKRmQ0ffni75WL9TSsvyM3LOLkMlvWvaZ2qRAeDVr
	H2PyTbkiG+ZMC+1KCFsYQgRli4AfoM6RKnrIpVHUW0TYigZJ0IgHwGJcqV1xH5zZkKrB
	dbiwIj/PSm4oilJVlrrX0pomkzlMLbW2E87iganNoOl7fPUldwk/RBikj9w7fsoRKd+L
	T5zg==
X-Gm-Message-State: APt69E1UCPJ+DoL8srpYXChgSCcZ+iAnJvZbQ21B20bM3ir+Alc95AB8
	q7aM1SFx5vUvpB0WlWe8fhqCSc7dcWBaerc4IEnbyA==
X-Received: by 2002:a9d:2371:: with SMTP id
	k46-v6mr14381471otd.210.1529512426905; 
	Wed, 20 Jun 2018 09:33:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Wed, 20 Jun 2018 09:33:26
	-0700 (PDT)
In-Reply-To: <CAFEAcA97ZAfbstKJAcjSGoP20P3hao3-N7mG3EeGgtRLVeCcxg@mail.gmail.com>
References: <20180529124707.3025-1-edgar.iglesias@gmail.com>
	<20180620095000.mbhnrfmlnupzeig5@toto>
	<CAFEAcA97ZAfbstKJAcjSGoP20P3hao3-N7mG3EeGgtRLVeCcxg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 20 Jun 2018 17:33:26 +0100
Message-ID: <CAFEAcA9UQtioX=+0uzPff83nOwoTdaHfcvYZN5gkpQtWOVsxYA@mail.gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::243
Subject: Re: [Qemu-arm] [PATCH v2 0/2] xlnx-zynqmp: Change the Cortex-R5 for
 Cortex-R5F
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
	Francisco Iglesias <frasse.iglesias@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	KONRAD Frederic <frederic.konrad@adacore.com>,
	qemu-arm <qemu-arm@nongnu.org>, Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WdTUfVxAo2iB

On 20 June 2018 at 11:02, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 20 June 2018 at 10:50, Edgar E. Iglesias <edgar.iglesias@xilinx.com> wrote:
>> On Tue, May 29, 2018 at 02:47:05PM +0200, Edgar E. Iglesias wrote:
>>> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>>>
>>> The ZynqMP actually has Cortex-R5Fs with the optional FPU enabled.
>>
>> Hi Peter,
>>
>> Any comments on this series?
>
> Oops, looks like it didn't make my to-review queue. I'll put it
> on the list...

...now applied to target-arm.next, thanks.

-- PMM
