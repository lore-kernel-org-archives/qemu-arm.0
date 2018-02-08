Received: by 10.28.71.27 with SMTP id u27csp2312141wma;
        Thu, 8 Feb 2018 09:10:44 -0800 (PST)
X-Google-Smtp-Source: AH8x225jvKvuTDsu6axq1z8Oxz/jRIvpuWx7Y859jTfLZSazgscnevXlh3vcwzr1MVQfxqFWlbVC
X-Received: by 10.37.201.194 with SMTP id z185mr991022ybf.405.1518109844760;
        Thu, 08 Feb 2018 09:10:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518109844; cv=none;
        d=google.com; s=arc-20160816;
        b=I6XH908sh0QNxGFK/y0feY5DL0B3gn5iAlrS8qfFPVQsYIhZndJr8BC5DrjPAK4ZSb
         YW4/VuK+MYKc3ZFYSWZDgEcnNFr7AZS1E/+P75APE9PnDQSm5TlmFSAV/Rd4dqROTyAd
         qtx4Rdvs1per/Q1Au3jqtdkFr3k1hQcw+9UmERG6Usb4g0Wtk2WPlNa4ZXw6KuAjH5Nx
         7o2LzonQOcNrCOOpWccke2x+F+y1K2yDireMfpkiGHyp0MN+6jCvJePPUhhgc8yd44ap
         E6lJ+CLFAn8M2rVYMq7CDz47HVR/12r4Iz3RY9N2W7zS9jmOoMhf9Jo60AcPO1okY4jh
         oYEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=blYE0Fw4pLzabtXm/dUtNxToBAJk5Iu1OS445gHF1vU=;
        b=fSAeXqZSk9nsw/sUvtNpuorKfyWoqtb6i+ZW0foFwA4kGuS0Kzmlt+KxP1mMB4d9Z4
         q91KiMlIIlV1JeKTW6qZ2D8WujANs3QQn/Pafnz/bwXwyAno6YXNxr5mE2e2a2VrTiOi
         YMKZOykEk7HKaE2UixIqhdJjXEmDuZVgf1g6Au9N2dqg3ZeSLAJ+M6SE6N92/oUnj/9F
         jacr6hDh57a70Q/Q2Jrmamvi1AB5kV0iAynNzMk8ABVDihEvthaXxhcEwvTvppCrWLQ6
         qlYd5kM4dkgU1KR8FLYHU2pt0MTk0OpjL/XH1gloSb7LQjQehz24F7vg55RsG5VxoBha
         UDpg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=fdvAHIxr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k125si68428yba.343.2018.02.08.09.10.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 08 Feb 2018 09:10:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=fdvAHIxr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:53079 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ejpie-0000kC-4K
	for alex.bennee@linaro.org; Thu, 08 Feb 2018 12:10:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42694)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ejpPF-00014T-1L
	for qemu-devel@nongnu.org; Thu, 08 Feb 2018 11:50:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ejpPE-0004rh-Ei
	for qemu-devel@nongnu.org; Thu, 08 Feb 2018 11:50:41 -0500
Received: from mail-qt0-x229.google.com ([2607:f8b0:400d:c0d::229]:41991)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1ejpPC-0004qP-2A; Thu, 08 Feb 2018 11:50:38 -0500
Received: by mail-qt0-x229.google.com with SMTP id i8so6984655qtj.9;
	Thu, 08 Feb 2018 08:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=blYE0Fw4pLzabtXm/dUtNxToBAJk5Iu1OS445gHF1vU=;
	b=fdvAHIxrGFPLQMn7YCS4WBhqBlR+qk5QGcPSP21v6iXjXAv84oCsrPkUHYTdwksJQy
	NPCAV3A6qspmLbt38g8SMnlsID/xtjdfpnNFsgbM9LF20znZaFTdnL3Tz9PZyqqKaxSB
	yEi9s4lv7rrqX8B5y4kWOEY6YlsRbo6EfeAtYLvsUjc1ZcGU6UTe1Gi+rjIujwj5SLDG
	52LEadlPkYNp+y+34Vvjlgbnxfso/4iDQT1/kHMAkUoXrpFZpzg8UWlm/YjO72SPM2xi
	VPFRC66xmBfgf9kGGHzaj3HIJBaPuwBqZZF5a840YGMchJL/UpK/4Fr2bX78LisLud2I
	EcSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=blYE0Fw4pLzabtXm/dUtNxToBAJk5Iu1OS445gHF1vU=;
	b=KudZQXw+OWTUbzppXJ7SyqboEZwowUJu3diwNke6VM2vbrYknLmi6TQMZEtMggE70z
	b9etbFRi6IGCHMctPt8Op4WmGmYWPupj59ggb3G4lIGkaWsPQo8zqgaq4Zs3WrR9A3lS
	RLzWYlGvD0WZlEA7TKOb/MGtCu77NmnJlH6TtIMxcdinqJ4qCIzVZVMKOnvjf6ELM1eU
	jWHSE6m5QTBWYRu/TLHkWg+zuV1VwdXxjOPJBJsw54ISCVwRvJt+7B7W/ec/PJNoa7Xk
	6VtgBlVmoj+ZEn22cDy3OIdcrURvAqhyrGvy7LW6sEGBjDPXCY3Hk9YKS5/WsgQRO+dl
	VuoA==
X-Gm-Message-State: APf1xPAUSBQOwZax7HYLPhC4HLFvxWJcrPiDOwYArV+VlD5E7jVxayyE
	9pwmNIhoS93rlzNEw7yCiRFLzhMK/UuvGEDPvWc=
X-Received: by 10.237.45.231 with SMTP id i94mr2167895qtd.44.1518108637305;
	Thu, 08 Feb 2018 08:50:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.101.7 with HTTP; Thu, 8 Feb 2018 08:50:36 -0800 (PST)
In-Reply-To: <CAFEAcA8ERQQadvAdqhWbK+6hbLtvFMrA=X8R7UBcQpAKifDpOA@mail.gmail.com>
References: <20180207042438.15422-1-andrew.smirnov@gmail.com>
	<CAFEAcA8ERQQadvAdqhWbK+6hbLtvFMrA=X8R7UBcQpAKifDpOA@mail.gmail.com>
From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Thu, 8 Feb 2018 08:50:36 -0800
Message-ID: <CAHQ1cqETa2Osx0Tc1EJJ4TiGfg1tMf3fG2AUyGKr6cj25N7F_w@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::229
Subject: Re: [Qemu-devel] [PATCH v5 00/14] Initial i.MX7 support
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@zoho.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm <qemu-arm@nongnu.org>, Andrey Yurovsky <yurovsky@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3W4s9frNLS/E

On Thu, Feb 8, 2018 at 5:49 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 7 February 2018 at 04:24, Andrey Smirnov <andrew.smirnov@gmail.com> wrote:
>> Hi everyone,
>>
>> This v5 of the patch series containing the work that I've done in
>> order to enable support for i.MX7 emulation in QEMU.
>
> Thanks; I'm applying this to target-arm.next. There are a few minor
> tweaks I'm going to make in the process, but I think that's better
> than making you do yet another respin. Those changes are:
>  * dropped stray blank-line-at-end-of-file from a few patches
>  * fixed a couple of over-80-columnns lines
>  * added a ESDHC_UNDOCUMENTED_REG27 define as suggested by Philippe
>    (I didn't reorder the switches to put 'default' last though, as
>    that didn't seem necessary to me)
>
> If you get back to me today about the GPL-2-vs-2-or-later question
> for patch 13 I'll make that change too. Otherwise I'll drop 13
> and 14 for the moment.
>

Awesome, thanks!

Andrey Smirnov
