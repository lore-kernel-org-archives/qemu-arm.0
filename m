Received: by 10.182.158.201 with SMTP id ww9csp1062239obb;
        Sun, 29 Nov 2015 08:37:52 -0800 (PST)
X-Received: by 10.55.20.227 with SMTP id 96mr66663321qku.67.1448815071995;
        Sun, 29 Nov 2015 08:37:51 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 94si41337708qkt.38.2015.11.29.08.37.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 29 Nov 2015 08:37:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=pass header.i=@linaro-org.20150623.gappssmtp.com
Received: from localhost ([::1]:36907 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a34z1-0002lR-M8
	for alex.bennee@linaro.org; Sun, 29 Nov 2015 11:37:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36779)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a34z0-0002kb-1w
	for qemu-arm@nongnu.org; Sun, 29 Nov 2015 11:37:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a34yy-0006VE-QU
	for qemu-arm@nongnu.org; Sun, 29 Nov 2015 11:37:49 -0500
Received: from mail-vk0-x22c.google.com ([2607:f8b0:400c:c05::22c]:33650)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a34yy-0006V4-Hi
	for qemu-arm@nongnu.org; Sun, 29 Nov 2015 11:37:48 -0500
Received: by vkca188 with SMTP id a188so34226316vkc.0
	for <qemu-arm@nongnu.org>; Sun, 29 Nov 2015 08:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro-org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=jaeQOK5woS/c8nqhjQhErxkhdgy8MbZJjm/LyknAv7M=;
	b=qShZgpI634UDVE2wXZjhALldW1Beuo9rsurXGe0A0cXgoJm9SOMs5ciJnlcwtkxGWt
	sgLalMpYJY9ubqXrZkxMLC5HYERAFpaJ6eGu6kVBqyYl+m+8K4N1cC5OXT5ZLDkxDECX
	TyaVtuyirWalVHw5h2lyTYp3ZuMmo2A+vOMuyBGTTvuTJdYJz0aA7j9wKBB82H5BOUbb
	OK2vMUn0xbiJnwqw0UgGcYxH4zzhGoHEWKhI2+aHKDVnT9Uu3osIOSUCDPmXkse+UP1h
	qg8B98c9LfP9LpFiD0p8d2GAoDvAH+LgpiOSTSyqM6tqfWO1+OOPUv2ZhtQMf6Ne3/IO
	T+sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=jaeQOK5woS/c8nqhjQhErxkhdgy8MbZJjm/LyknAv7M=;
	b=eWb6+3V2g7unD9ae8+lx5t2j1re2ihIAyG9cLn+IikO/5/zf/zNqsr2WOi54UliKgM
	XXUD7+rb/UTvIDdoBz0bRsUPx4ho3sIefNqjafw+7ZxrJp1HBzWH5w68XpNzXycUCV+R
	jC3zecxDST5+fezbva2jt/R+02Y7rQwBtoyLwFUYvl3jh34Z1UrGkVurj1hmLJgT5wIo
	O1JJ05EaRJQuDsxTNSCWST5iQqMTyMX+QWPz8PRdpZdRoT5ZjePb4UOqSnJYvfugizVN
	IVKMw7yNaMbvVlzlq/BF4Pmx5h2FdpNpuiD4MV0HxSXtI57RPP2gionCEVv8R54cau0B
	upCg==
X-Gm-Message-State: ALoCoQkuzs+BG1W2EqG9EuFY2Qqe0xxXZfFQADfmto4gI0AmkN/4SWHHGJ5u+5k+OUcUpuNYPAnE
X-Received: by 10.31.52.211 with SMTP id b202mr49442350vka.82.1448815068119;
	Sun, 29 Nov 2015 08:37:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Sun, 29 Nov 2015 08:37:28 -0800 (PST)
In-Reply-To: <tencent_36F2633E3F3DBE7C54299DA6@qq.com>
References: <tencent_36F2633E3F3DBE7C54299DA6@qq.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 29 Nov 2015 16:37:28 +0000
Message-ID: <CAFEAcA878azNUm4AbhyAw09bUXuDWNqMnx7b+5hEnF7iX8nqWA@mail.gmail.com>
To: Jimmy Situ <web@jimmystone.cn>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400c:c05::22c
Cc: qemu-arm <qemu-arm@nongnu.org>
Subject: Re: [Qemu-arm] How to get memroy trace in qemu-system-arm or
	qemu-arm
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
X-TUID: JYGGvVvQcDEg

On 29 November 2015 at 08:30, Jimmy Situ <web@jimmystone.cn> wrote:
> I am trying to capture memory access with qemu-system-arm, and I find there
> is get_phys_addr in target-arm/helper.c
> So I add a qemu trace event in it. It seems this trace can capture some
> memroy access. However, the trace address trace doses not make any sence.
>
> Do anyone know about this get_phys_addr() function. Does it call by every
> memory access?
> If not, how could I capture the memory trace correctly?

No, get_phys_addr is not called for every access:
(1) we cache the results of virtual-to-physical lookups in
a TLB, because they're expensive; subsequent TLB hits won't
call the function again
(2) direct physical address accesses won't go through the
function (for ARM this just means the memory accesses done
as part of the page table walk)

QEMU doesn't currently provide any way of tracing all guest memory
accesses, I'm afraid -- our design is more aimed at running
guest code fast, rather than providing detailed information
on things the guest is doing.

thanks
-- PMM
