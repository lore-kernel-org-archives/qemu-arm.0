Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp2229110wrq;
        Sat, 16 Jun 2018 11:54:00 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLZvDnHIGbNrP5mjCkJRRZd4szWWgMU1w6xfyxISGS7cRLrlEjgEEbwdOYFXcb1DizFCs4c
X-Received: by 2002:a37:f713:: with SMTP id q19-v6mr5419322qkj.278.1529175240145;
        Sat, 16 Jun 2018 11:54:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529175240; cv=none;
        d=google.com; s=arc-20160816;
        b=FfbSsajReQKmVE0csw8Oi1rh+85rhzKfW9jIha7CWSTRRnO1tVExFZLoCZnAlqwMer
         534Gxcwt9AliEUGe8fxUBM1GWcIfiPw/jN4juPS1gRS9lfNXCYW1m4yBPgkvyfBAEPMy
         1YCeX+BvXhtdE0B6wHZixUmusxKSeIus6EA7mwe0YbOoimwGaEAwdu7lI0+O878mDC/y
         FCdt/0enfbizxgQfgu8VtPFA56cCanY4G0qzhl2Ye6AoZQeM3CAM4Og7tNvEG5s7awqc
         VOcOCjrXuaBE4hkb8sKKWTrUVOdQB62bo2+ZCO1mFSQbCPFO7jDrBNmk3+ltgarOklNS
         +/XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=4Pv9pa89Wu8oJxOsbv1W7l4vYPI0NwmoyAdcehIoAsk=;
        b=IOBzD10FcZ7gxCKwCEO5cc9MuBIOwb+6BLmS3Mm3wNwHOSbfqMwHmfqRibUOGevqAV
         pQ7K0EqA8c7Zbs4eCMki1We7FoX3kd02Sq9H/9dJkL8eA7HTmOjtrXFOaQM9IDwu6068
         mVJTvnh+fPDbV4SyPcXW+hJ/xRXu63Br3Fs1S/tOW2jyECWCYWquFJQTiI+NJj+OBQD6
         gzRuVJxb+FUILtyTmmfU75EkAIwu6HZpSYqBe6SVIsJGgoW9rwe1StRsWlHfZcEAQWMv
         G25TVHIIx+NEnUZNoYrLqopc9uhHBgyoXFFU/4WJcUxFoU+/np93SQVPw2u21uaou068
         CDvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="Mp/mTpjK";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v52-v6si314690qtc.356.2018.06.16.11.53.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 16 Jun 2018 11:54:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="Mp/mTpjK";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52501 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fUGKl-0004nN-Oj
	for alex.bennee@linaro.org; Sat, 16 Jun 2018 14:53:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38283)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <groeck7@gmail.com>) id 1fUGKe-0004n6-B0
	for qemu-arm@nongnu.org; Sat, 16 Jun 2018 14:53:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <groeck7@gmail.com>) id 1fUGKb-00034h-9o
	for qemu-arm@nongnu.org; Sat, 16 Jun 2018 14:53:52 -0400
Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243]:37767)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <groeck7@gmail.com>) id 1fUGKb-00034G-2G
	for qemu-arm@nongnu.org; Sat, 16 Jun 2018 14:53:49 -0400
Received: by mail-pf0-x243.google.com with SMTP id y5-v6so6328009pfn.4
	for <qemu-arm@nongnu.org>; Sat, 16 Jun 2018 11:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=4Pv9pa89Wu8oJxOsbv1W7l4vYPI0NwmoyAdcehIoAsk=;
	b=Mp/mTpjKgWJltn24lnG63Z9mEXqeWMJVWL/XNLaeTGm1NFeEdyjBW3bNtkgXH9VH86
	AIMzpn0JSRHaIHh2I71Jjdu63IOrr44P7icPtYUHn4gbOHSRCp1XdDxwlXmAREYTTnJP
	YOzhZmXXxyQ/WhwOolHQ5hk978i7XUVd0ATy3cEtgclTbIbsQn2L4dpvsJPsW5kCZk3K
	rFbgeql9ftg1TxkY54eMKFoWGyGiuUcIPmTZDODGSmaBwCddvUCMLzuh42OrJ65GXudx
	oy72EZbwi7TxmoNuDe605ujz4E17WoMvz6a8I16zKPBscSwyI5rY8GfO2GxS44q/DoSY
	12yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=4Pv9pa89Wu8oJxOsbv1W7l4vYPI0NwmoyAdcehIoAsk=;
	b=oIAh4snlqtvjPVrTQS+CfOrTeMIPGUThXq7FQ41b1BWp0cAR+CHzRwXeC5v13UayC5
	70WzbNTSW/WFwoWJy8CRW2u29mKn/gJzVI0pYUzAE7TXbHM5K9eDSqnlmjFW8XljCJJV
	QiHgRtumVsW1IQJeLWGziCuBrQyXZgRhU3biwXkhNt+7mFKnkL8rMsJ60IGTJUENHob5
	6ocSC3bB/Qd0/LQsvanhV2b3wpws65zrSQkp3BbIZtWdPe+VA/l9akzFUdvi9sqWPKWi
	FplSUa3JujnGUtMmRe9MDFif0SKqAvmmHmoa64f7kyCURoFhEtgNtLZUhTewBZ1+aUtL
	kViw==
X-Gm-Message-State: APt69E1kbcLKjFZLVbrvJoTsr5PxT0HELcaN6o7tCLDfH37i3//w3i+M
	Iqxbs0mmQb6Ouugz4aoKLAn5ig==
X-Received: by 2002:aa7:810c:: with SMTP id
	b12-v6mr7140313pfi.79.1529175227640; 
	Sat, 16 Jun 2018 11:53:47 -0700 (PDT)
Received: from server.roeck-us.net
	(108-223-40-66.lightspeed.sntcca.sbcglobal.net. [108.223.40.66])
	by smtp.gmail.com with ESMTPSA id
	h16-v6sm15621779pfn.80.2018.06.16.11.53.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 16 Jun 2018 11:53:46 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180614215422.GA29690@roeck-us.net>
	<CAFEAcA-t9G=HAPH2325rduAKFNUEXNE-Jp_m9fMhfdTCbtm28g@mail.gmail.com>
	<4ff384cf-14ad-ef33-5532-4f8dbb8d0ff6@roeck-us.net>
	<CAFEAcA9+nW7nZb0ZaN__xBGGV9WFcBJ0_q=EYTA_DM6=bVfhNg@mail.gmail.com>
	<20180615181331.GA29302@roeck-us.net>
	<CAFEAcA_ua-FMw_SCYExPNPyFoY_jvokns7R=weoODbfVuP82+g@mail.gmail.com>
	<5ebbb70a-79dd-b3b0-6d87-10a1942af1f4@roeck-us.net>
	<CAFEAcA-Jiu-93wqtWuCQqJsQ47g=Zeb4J7y+eAZBsv1ct_QxYw@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <c7910c30-6b71-a376-e945-e30a6f954c0e@roeck-us.net>
Date: Sat, 16 Jun 2018 11:53:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-Jiu-93wqtWuCQqJsQ47g=Zeb4J7y+eAZBsv1ct_QxYw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::243
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
X-TUID: AuOCmAmi7m6a

On 06/16/2018 11:08 AM, Peter Maydell wrote:
> On 16 June 2018 at 16:08, Guenter Roeck <linux@roeck-us.net> wrote:
>> I would tend to disagree. If we get it working, it would exercise
>> both qemu and the Linux kernel quite significantly, thus helping
>> both sides to improve functionality and stability. Also, the changes
>> I needed to make are not really that invasive. Embedding everything
>> on the build process or with a code wrapper would be much more complex
>> and add complexity where I don't want it. I had tried that with some
>> other targets, but it is just too fragile for automated testing,
>> and I don't do it anymore. Your call, of course.
> 
> My general view is that where QEMU takes the path of "do what
> the hardware does", that is straightforward and doesn't lead
> us into future annoying deadends or misdesigns. Where QEMU
> does things that are not what the hardware does, that is where
> it's easy to go wrong. Real MPS2 hardware doesn't magically
> load Linux kernels and DTBs (it boots whatever the firmware
> image is).
> 

... while mine is that I have no trouble running Linux test images
in qemu when it supports options such as -dtb and -initrd, while it
is a pain to run and maintain if I have to have a secondary loader
that isn't part of qemu. Guess we just have different perspectives.

>> Adding support for an entry point and for the rest wasn't really
>> that bad - I did it in armv7m_reset() and it's just a few lines
>> of code. To load the dtb I leveraged the existing load_dtb()
>> in hw/arm/boot.
> 
> The boot support for A profile was also very simple -- to start
> with. Now it is a complex mess of support for 32-bit and 64-bit
> and NUMA and autogenerating or editing DTBs and three or four
> different image file formats and maybe booting in EL2 or EL3...
> 
>>  From this point it only really makes sense to spend more time on it
>> if there a path into upstream qemu. Let me know.
> 
> I think it's worth supporting Linux on this board, certainly
> (and if your issues are due to "missing emulated device" or
> "buggy emulated device" I definitely want to fix them).
> I'm just not really convinced that it's worth making Linux
> a special case that we go out of our way to deal with in
> a way which we don't for any of the other 50 RTOSes and
> other things you could boot on this.
> 

I don't think the lack of led emulation is the problem. The problem
is most likely in Linux; it seems to jump to ret_fast_syscall+2
instead of ret_fast_syscall. But then I am not familiar enough with
the code to be sure.

Either case, I'll let this go. It is not worth arguing with you
about qemu integration, nor with the kernel community about
creating a special Linux image, nor spending the time to write
(and subsequently maintain) a front-end bootloader myself.

Thanks,
Guenter
