Received: by 10.223.188.70 with SMTP id a6csp5107851wrh;
        Tue, 22 Aug 2017 08:48:18 -0700 (PDT)
X-Received: by 10.55.182.6 with SMTP id g6mr1580822qkf.326.1503416898215;
        Tue, 22 Aug 2017 08:48:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503416898; cv=none;
        d=google.com; s=arc-20160816;
        b=dgUASsfHPwqC6H2l52U888B9Dw96HbIdx0duqKhlH6fbr0pXE+YUTlrEJSsXj/7JEK
         IjLiSFmEIe9nnxGuzG3KIFUVx4C2nHD2uLrtRUs0vJ4HQtFcM/PU++IqFDfzBN3b0fPT
         5wbFOyP0IHlhtQjcZaaflBySvXaud9gDWXumjU/YTlHoxFqPENMyuvCxGjeqpZ0kK3M+
         MvN67aPWauiPZbxAnKa6Aw/QjCyxs0OJ3FYDKZb4ENjK9q4vhBmEJGfsItfNZDk197+f
         B2YRxSMHmYom/xx+AwrwNzJze+wVe18Y88eYzejMoYdAYJMMy7MA8iT/dTnKQVXi0GN/
         aFig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=K689UJ20caYraXmMmfDxf9wN8+vASUJEbWGNufvR6Xw=;
        b=Ujan2vHeXbVbyu/L25Xv8U4UwJk7CUwxmSe8wqQy9AFvYL2ZkAF3VoA+YkmgjOLslZ
         gNBcdqVowbdkkFrh4poisbjmQ2LWA+4reyWXWaOolya98escHvvFu2MBhLKpdAL0az5L
         Xq+AyV1Ok08UoP47JhXyn6dz5rWlWJs8iZwHo0Go0ZnjZJCcf7veFPcExkHeJeTlwe1A
         hycx0hY7BYadMQ2rPwzXYMFy/R8iVBsoZXsDguRyzDd07dirZTe3z6+dWIwJNdj4Wqch
         sBLXd2reZCUhihwkQLaY2qxg1unKLS7JHaQ+tQOZF6t6PsPPzljzvsUaPORugzFVC8re
         Qvhg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AHu+XPlT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o68si6412762qki.153.2017.08.22.08.48.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Aug 2017 08:48:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AHu+XPlT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56197 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dkBPb-00005w-P3
	for alex.bennee@linaro.org; Tue, 22 Aug 2017 11:48:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60167)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dkB8h-0008QY-Ur
	for qemu-arm@nongnu.org; Tue, 22 Aug 2017 11:30:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dkB8g-0003TF-94
	for qemu-arm@nongnu.org; Tue, 22 Aug 2017 11:30:47 -0400
Received: from mail-wr0-x234.google.com ([2a00:1450:400c:c0c::234]:33364)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dkB8g-0003Se-2V
	for qemu-arm@nongnu.org; Tue, 22 Aug 2017 11:30:46 -0400
Received: by mail-wr0-x234.google.com with SMTP id a47so14345764wra.0
	for <qemu-arm@nongnu.org>; Tue, 22 Aug 2017 08:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=K689UJ20caYraXmMmfDxf9wN8+vASUJEbWGNufvR6Xw=;
	b=AHu+XPlTpEUu+3CKIhB8x93ocMFtRZ1JRsO3eggImBkOdwyerUjRbVw3O4GJEVFsyN
	YPf+t6nlzqrQeL5IpYOraQcjC2OLMzDiV7y1byjLc1ZYhTTtkT6RpccPe9W912wHBLLp
	9vbCvFSBWGAR9Gjg59waxoG3amkEoCBjovTmg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=K689UJ20caYraXmMmfDxf9wN8+vASUJEbWGNufvR6Xw=;
	b=RLAQkEi9nGEkUOz44XUiNgbr1KBDj5/fraMySju7vkeGMlTkM1frfX/jffpp3vf5Rk
	zF4jqn6+gAQX9nF7Ws/2oBEZ7yEidMp4fpflYEITptowiWEoZLlG0+BRndT7uepwIzLx
	qAo/A87s7qrNqb5A7rjc7ywyl4m1cGjA4Wc7zyQQRnhos2RnxZzJ7QoI6B3TqZEv+DWg
	Q2MFOKWPyBBEL7AS3Kv6eIxdusoK2LIcy7zlhHGUr93wc2vds6V2K+d7RD2lab5T//Ji
	aSMxra7Dke3Czohy5jU/G6Qqu8FogFzfkvdnAntSnyBHaTJ8fllgdZkw13tP/OBrGjNS
	7McA==
X-Gm-Message-State: AHYfb5imsy1mXfrkF6HjQAprzilAbObg5C6RiZvS5BIutWbmmfwFGWuc
	U1tBdQKh83qci1BWGn7k1kpkQfMP4D9l
X-Received: by 10.223.167.138 with SMTP id j10mr682990wrc.97.1503415844860;
	Tue, 22 Aug 2017 08:30:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.54 with HTTP; Tue, 22 Aug 2017 08:30:24 -0700 (PDT)
In-Reply-To: <443135b4-4b36-bae6-b50a-12fb4a55a858@redhat.com>
References: <1503414375-21009-1-git-send-email-thuth@redhat.com>
	<CAFEAcA-92Jjz2uCC387oX2u0NWfijPwB_8zGaagC1m=sKD8zhQ@mail.gmail.com>
	<443135b4-4b36-bae6-b50a-12fb4a55a858@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Aug 2017 16:30:24 +0100
Message-ID: <CAFEAcA-AG5XoOJr3p_UU9dACjawp3OtKDy8GMRMpdFfE8foqTA@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::234
Subject: Re: [Qemu-arm] [PATCH] hw/misc/auxbus.c: Mark the aux-to-i2c-bridge
 device as non-hotpluggable
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	KONRAD Frederic <frederic.konrad@adacore.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ltbutMc0IqaU

On 22 August 2017 at 16:26, Thomas Huth <thuth@redhat.com> wrote:
> On 22.08.2017 17:12, Peter Maydell wrote:
>> Why is our default "hotpluggable" rather than "not hotpluggable" ?
>> We must have way more non-hotpluggable devices than hotpluggable
>> ones, and it takes active effort to make a hotpluggable device
>> model, so it seems like it would be much less bug-prone to
>> require hotpluggable devices to set dc->hotpluggable true
>> rather than all the non-hotpluggable ones to set it false...
>
> I think most devices are already non-hotpluggable automatically because
> they sit on a bus that is not hot-pluggable (e.g. sysbus devices). The
> problematic ones are the devices with .parent = TYPE_DEVICE. And for
> these, I think it is quite hard to say whether they should be
> hot-pluggable by default or not?

To implement hotplug you need to write extra code (notably some
kind of unrealize method to undo whatever you did in realize),
at which point also setting the hotpluggable flag is trivial.

> Anyway, according to my tests (I'm currently working on a test that
> automatically does device_add + device_del for all devices, as you might
> have guessed already), there are not that many devices that cause
> problems here, so I guess marking some few with hotpluggable = false
> should be OK?

The problem is not the devices we have today but the ones we're
going to write tomorrow. Having hotpluggable default to false
"fails safe" -- the worst that happens is that somebody writing
a hotpluggable device finds in their testing that they need to
set the flag to make it work. Having it default to true fails
non-safely -- as you've found, people writing devices that
were never expected to be hotplugged don't try to test the
error case of attempting hotplug anyway, and in code review
the absence of a line of code is very hard to reliably spot,
so we get devices in tree that crash QEMU if you try to
hotplug them. If we make the default be not-hotpluggable
we fix this not just today but forever.

thanks
-- PMM
