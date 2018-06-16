Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp2201728wrq;
        Sat, 16 Jun 2018 11:09:27 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIQ3xHA5GRpiY1mFFgNE+UOv+MjhS3jzurQMm6QAkjXK27PT52D8+mBm5Y3OMsIbZfa8X8b
X-Received: by 2002:ac8:2db3:: with SMTP id p48-v6mr6022322qta.345.1529172567264;
        Sat, 16 Jun 2018 11:09:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529172567; cv=none;
        d=google.com; s=arc-20160816;
        b=P8MQ35MHnQc5+d/JqnwqRO74WvqyJkc2gxJz1Rw1lj/LlfrNnKGuQEx8qU5Xrbi5uk
         SS7PqAfxRR8Vs3Qwpw7EQdfoCbFL1dpCEtYJK+yB5A2us2zfD3+66RxKRghzf3OdzLut
         BxkIiRqWJiqKDOgDACu8dRzOqmrZEpnTCfRaVS/LJZBRRBW1DgDPl7U9P47XkMHaB7i+
         Ic0PjjpppD7ATCa2O2F8UprhTA6S6+R+zyPZ+qcVuYQ1uEKk/sk9KjJZPKX60WjdQzbn
         zMAdq3gl+8xEgQ3tYjMpt2zGzq+54t3jKbunf04ZZ9N/qd6qybbBYM+WiulSYSOsQwzW
         wfzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=eJX7+CrBuTGOgJaHMr5jM+AnDSh1rE897QziQN4Z2Rk=;
        b=ytvg6mo6VOzsPm6Sbw0VAjljapPPzh+Nj8pbgoFXbyNWxQ+Kd6g4gTivnBKIK/YktJ
         sEnhfOQSL71nQB0X4+VPKtjDk93zTJJ86F3OkWOzH9WuRZxwI3KXIHdp8qJiWJJ6UBK+
         AZISXKnuQUNtxvEa+2T02zWWVqpORAT7KCa+1g/PHYvCHcw62uvjHyItXIVUxq/NOu9s
         dqz8zpRYLsjIl3fZ9RlAoNQ3j1uC7SMdDUcemrnF7/+JVeC3WUykq9p0do6m2ksH906W
         KjQKMQ1aJFoxJRvDjj6w01Ae6Bi5AdAMu5KZWpJQNEkaR9DRwcu8TllVn0k/vGTIWH+D
         ffZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RrFc0r+U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j65-v6si6737664qkc.74.2018.06.16.11.09.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 16 Jun 2018 11:09:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RrFc0r+U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52405 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fUFde-0005fP-QD
	for alex.bennee@linaro.org; Sat, 16 Jun 2018 14:09:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33249)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fUFdX-0005fK-In
	for qemu-arm@nongnu.org; Sat, 16 Jun 2018 14:09:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fUFdW-0002uF-G1
	for qemu-arm@nongnu.org; Sat, 16 Jun 2018 14:09:19 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:38321)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fUFdW-0002tn-2h
	for qemu-arm@nongnu.org; Sat, 16 Jun 2018 14:09:18 -0400
Received: by mail-oi0-x243.google.com with SMTP id d5-v6so11565758oib.5
	for <qemu-arm@nongnu.org>; Sat, 16 Jun 2018 11:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=eJX7+CrBuTGOgJaHMr5jM+AnDSh1rE897QziQN4Z2Rk=;
	b=RrFc0r+U5i8cCyd4EJDzh6fxEh7F4r//qxNVx3JGVR9UBjHtRd9S1d6l7w12vh/Fsj
	iEAoXNIJ33IBsgj/hJOYOgGCHDpygfpGyeOs6wlWC5onzlyJDoIaSVaSjEslZPiVkfK0
	1FPq7PGA8Pb0G5L7zVVNb9HIJof6T1KjOGUNI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=eJX7+CrBuTGOgJaHMr5jM+AnDSh1rE897QziQN4Z2Rk=;
	b=NW7PU54bL5lCzdqViF/5e6nwtu9p/8A0JJKxsspszQJ10AKJjsI4wfh0fp4EKqvliC
	WrPv/tq26Hm7kO+6Uyfs4qXWvnJUtZOe2O8O3A9khOyCp/gCT3DbkR9wxPzHs12u/I5J
	ezxGZtR2MaOtSh1O2UvXC5LBe7/USXzEhoWheyxH4N/1L6EFmq1v4vIwacJPqy/JH5or
	L+Cvlpw9mo5UGg2Et7tv3RqZaHVoeDBZ6MqkLt3WuM2aP+W6qXSoa5LWgD2Iq8Jdlk2K
	QEIHyd2b7MFQJ3YQqyy3a0IRhQApV3TQe+SwrXb7C73Njt0KP8l+M+uY+Sdu6TTfqhIG
	K/Ag==
X-Gm-Message-State: APt69E0YL1QhKu/h6qkWSIY/n7vARwrN7mlGtFPsU5k5pthkopmYj0bt
	rtEg+tDLzD24J03+I/Ivg6uihq6gcv9F6c2X0AZOdg==
X-Received: by 2002:aca:4ad2:: with SMTP id
	x201-v6mr3271243oia.11.1529172557289; 
	Sat, 16 Jun 2018 11:09:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Sat, 16 Jun 2018 11:08:56
	-0700 (PDT)
In-Reply-To: <5ebbb70a-79dd-b3b0-6d87-10a1942af1f4@roeck-us.net>
References: <20180614215422.GA29690@roeck-us.net>
	<CAFEAcA-t9G=HAPH2325rduAKFNUEXNE-Jp_m9fMhfdTCbtm28g@mail.gmail.com>
	<4ff384cf-14ad-ef33-5532-4f8dbb8d0ff6@roeck-us.net>
	<CAFEAcA9+nW7nZb0ZaN__xBGGV9WFcBJ0_q=EYTA_DM6=bVfhNg@mail.gmail.com>
	<20180615181331.GA29302@roeck-us.net>
	<CAFEAcA_ua-FMw_SCYExPNPyFoY_jvokns7R=weoODbfVuP82+g@mail.gmail.com>
	<5ebbb70a-79dd-b3b0-6d87-10a1942af1f4@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 16 Jun 2018 19:08:56 +0100
Message-ID: <CAFEAcA-Jiu-93wqtWuCQqJsQ47g=Zeb4J7y+eAZBsv1ct_QxYw@mail.gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
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
X-TUID: KQBkctn8Jylg

On 16 June 2018 at 16:08, Guenter Roeck <linux@roeck-us.net> wrote:
> I would tend to disagree. If we get it working, it would exercise
> both qemu and the Linux kernel quite significantly, thus helping
> both sides to improve functionality and stability. Also, the changes
> I needed to make are not really that invasive. Embedding everything
> on the build process or with a code wrapper would be much more complex
> and add complexity where I don't want it. I had tried that with some
> other targets, but it is just too fragile for automated testing,
> and I don't do it anymore. Your call, of course.

My general view is that where QEMU takes the path of "do what
the hardware does", that is straightforward and doesn't lead
us into future annoying deadends or misdesigns. Where QEMU
does things that are not what the hardware does, that is where
it's easy to go wrong. Real MPS2 hardware doesn't magically
load Linux kernels and DTBs (it boots whatever the firmware
image is).

> Adding support for an entry point and for the rest wasn't really
> that bad - I did it in armv7m_reset() and it's just a few lines
> of code. To load the dtb I leveraged the existing load_dtb()
> in hw/arm/boot.

The boot support for A profile was also very simple -- to start
with. Now it is a complex mess of support for 32-bit and 64-bit
and NUMA and autogenerating or editing DTBs and three or four
different image file formats and maybe booting in EL2 or EL3...

> From this point it only really makes sense to spend more time on it
> if there a path into upstream qemu. Let me know.

I think it's worth supporting Linux on this board, certainly
(and if your issues are due to "missing emulated device" or
"buggy emulated device" I definitely want to fix them).
I'm just not really convinced that it's worth making Linux
a special case that we go out of our way to deal with in
a way which we don't for any of the other 50 RTOSes and
other things you could boot on this.

thanks
-- PMM
