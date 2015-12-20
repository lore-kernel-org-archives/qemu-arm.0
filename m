Received: by 10.182.158.201 with SMTP id ww9csp2297465obb;
        Sun, 20 Dec 2015 09:15:08 -0800 (PST)
X-Received: by 10.140.223.68 with SMTP id t65mr20459590qhb.65.1450631708527;
        Sun, 20 Dec 2015 09:15:08 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j66si25955662qhd.63.2015.12.20.09.15.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 20 Dec 2015 09:15:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:41425 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aAhZc-0007XA-5c
	for alex.bennee@linaro.org; Sun, 20 Dec 2015 12:15:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43728)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aAhZa-0007Vi-Cr
	for qemu-arm@nongnu.org; Sun, 20 Dec 2015 12:15:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aAhZZ-0006HI-IY
	for qemu-arm@nongnu.org; Sun, 20 Dec 2015 12:15:06 -0500
Received: from mail-vk0-x22c.google.com ([2607:f8b0:400c:c05::22c]:32799)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aAhZZ-0006GM-EY
	for qemu-arm@nongnu.org; Sun, 20 Dec 2015 12:15:05 -0500
Received: by mail-vk0-x22c.google.com with SMTP id a188so90893849vkc.0
	for <qemu-arm@nongnu.org>; Sun, 20 Dec 2015 09:15:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=qGM8hkAhZ1NkjmdsdIZuT8ZQ4h+a3OJmfwWknvHNHL8=;
	b=OKEsfac7KbkmME+cLIwLu6KeTkmd+h/Vm/rfBgxTj1IMJ1Z6g6rLPz5pw/w4UpQEd6
	JdzRP8Efw/jAoPiGuRq7UvyXU0hPPF2QOC44DAqhDM6kr1pGh9+/SVD26UPbdNKgxc0i
	VxGNgiAFIkuWPfIydl0lLuQdmSTcGlbxyZKIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=qGM8hkAhZ1NkjmdsdIZuT8ZQ4h+a3OJmfwWknvHNHL8=;
	b=bs2+LTpFNRvv8Sy+8Wf6oUDnmiSqGggLWjsBmBLW+6ZRspMtF/1uYN08OVjr78ygpP
	9U18rlYL9n2bq+XJT6ikMMlOyjibPQeV/viKL82ilR2T93fyh7aJeNFIp6DL61hySIQk
	WhaaRZ87hDPiHybuFve+t3Joc+PczOTxx63NQ8PXmqi+XL8kSk/r3nCEpsAsDsiamz6f
	3hEMpCeIKwaWjtLw2allUQZ30qeu+FY5mQvPVqGpM1WN7mc93IGO3pRWHR6UGjuQ+QhC
	b1rGQdFjy+KfvHi4kkwoiKgWHt0DTACj9kBtyxrE6u3PQ4c1QFVbwiI8cTwr+cupOxEB
	RDCw==
X-Gm-Message-State: ALoCoQmmlFoYw78qUphbK61ZeHpHdd6yQ65mgtanzUwb5pxyOK4I/diZUetRjx7sF0Ooky3ui39D3xxfI2T+tcmZsHXUndiAadnFyyJCaqVr+1ntqEMxWqM=
X-Received: by 10.31.180.145 with SMTP id d139mr8474038vkf.83.1450631704829;
	Sun, 20 Dec 2015 09:15:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Sun, 20 Dec 2015 09:14:45 -0800 (PST)
In-Reply-To: <20151219214257.GI4164@pcrost-box>
References: <1449851831-4966-1-git-send-email-peter.maydell@linaro.org>
	<1449851831-4966-9-git-send-email-peter.maydell@linaro.org>
	<20151219214257.GI4164@pcrost-box>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 20 Dec 2015 17:14:45 +0000
Message-ID: <CAFEAcA_72XoCHxjHHqDghqrQg-HQx=PJpxZRLe9uUDdF1MMwxA@mail.gmail.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22c
Cc: Kevin O'Connor <kevin@koconnor.net>, Markus Armbruster <armbru@redhat.com>,
	Patch Tracking <patches@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-arm] [PATCH 08/10] hw/sd/pxa2xx_mmci: Update to use new
	SDBus APIs
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: jwBz1IjdtXER

On 19 December 2015 at 21:42, Peter Crosthwaite
<crosthwaitepeter@gmail.com> wrote:
> On Fri, Dec 11, 2015 at 04:37:09PM +0000, Peter Maydell wrote:
>> Now the PXA2xx MMCI device is QOMified itself, we can
>> update it to use the SDBus APIs to talk to the SD card.

>>  void pxa2xx_mmci_handlers(PXA2xxMMCIState *s, qemu_irq readonly,
>>                            qemu_irq coverswitch)
>>  {
>> -    sd_set_cb(s->card, readonly, coverswitch);
>> +    DeviceState *dev = DEVICE(s);
>> +
>> +    s->readonly = readonly;
>> +    s->inserted = coverswitch;
>> +
>> +    pxa2xx_mmci_set_inserted(dev, sdbus_get_inserted(&s->sdbus));
>> +    pxa2xx_mmci_set_readonly(dev, sdbus_get_readonly(&s->sdbus));
>
> Looking at the machine models, _mmci_handlers is only called at
> machine init time. So this should not be needed. devices should be
> triggering an initial call of _set_readonly that reliably propagates
> back up.
>
> If we do need these two lines they should be in the reset handler.

This change is just retaining current behaviour over the QOMification
(we would assert the lines in this function before this patch,
so we should continue to do so afterwards).

We have no good mechanism for dealing with lines that ought to
be asserted on device reset (of which "sd card inserted" is
typically one). If we assert these lines on reset then we're
just introducing a different wrong behaviour where there's
a dependency on reset order. I preferred not to touch this
because we don't actually care much about the pxa2xx boards
themselves except that they're getting a bit elderly and
need updating to QOM.

thanks
-- PMM
