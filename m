Received: by 10.223.159.74 with SMTP id f10csp3874771wrg;
        Tue, 12 Dec 2017 06:19:31 -0800 (PST)
X-Google-Smtp-Source: ACJfBot+glwVADgb/10fXvvEi23Zt8ysmHyqXcIZ2ehtLxf3fR58StIYZ/R4ptxC/EVyOgF1CmPN
X-Received: by 10.37.231.129 with SMTP id e123mr2903486ybh.137.1513088371280;
        Tue, 12 Dec 2017 06:19:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513088371; cv=none;
        d=google.com; s=arc-20160816;
        b=IANhifOcx+PCoGX+5z/YcQxKsT/rbDdCwlFcWaIMBqJh9iOqWuHBXwebdhLU7ovk0q
         GP0+gqmlAQs21HOpe+D/NvzacHDwg5W5F3emcgnwLw4noX0TIettbRSbrhq7r9zwwpXp
         UEUGa9hdVVRIkQtotVFMnaEDn+3HGqDgf8c+mEZIGwxiz5VhxEhh4Mt2f65e3NKj6885
         h4Y9LgeoIz+TuBD1MPrzl/AL6ZY6bEgbpbTuXt9GMM0X9UsjCaCHXl5MpLXe7HJ0sKIl
         uZHtzXRtcX0sWs/PHn+pYkKJY+odGqzCXUFL1TycYD+GyHNlw+W39pvADrNUWaGaREq6
         xDKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=dn/cWjNkZ+651ThcizW4H8hO6PWmI0tOgpbSoozeZoA=;
        b=QPMico3El0qDfj2j6tLy3I7vP9YtEwVtK5DVSK8ogek6zp3MGtGvxgCXkDzgIzaHOM
         +Hth7lWHMFzpXoOLmdNI9vl45hGZWKHrHpNMA86oaJYlvejwOLQA04ngZP1tWbyNV5dn
         epHZ91HSPGv2895wff3Y7Hubd54S8I8w7f462q1pDXfmr0AdPDbR5aUAUdM9DVkatyGv
         C19FCm3SyLQ9XtYsfbdjDqD9BxX9mHG5Hxg6vRDEujI+odI2UwWgZQOiOr6tjLa/Sz7y
         LsrWNaXhYRxkdGEHRy9ni9stiDXeH38PYpPQl/YhpAqqMdW0YUpvaSW/IBpjBmoB2EvO
         KcMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=F7/e8hnt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q19si3450263ywg.506.2017.12.12.06.19.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Dec 2017 06:19:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=F7/e8hnt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58599 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eOlP8-0003of-LV
	for alex.bennee@linaro.org; Tue, 12 Dec 2017 09:19:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45063)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eOlNr-00031n-NF
	for qemu-arm@nongnu.org; Tue, 12 Dec 2017 09:18:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eOlNq-0007RX-Nq
	for qemu-arm@nongnu.org; Tue, 12 Dec 2017 09:18:11 -0500
Received: from mail-ot0-x244.google.com ([2607:f8b0:4003:c0f::244]:39658)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eOlNq-0007R6-J4
	for qemu-arm@nongnu.org; Tue, 12 Dec 2017 09:18:10 -0500
Received: by mail-ot0-x244.google.com with SMTP id v21so17898562oth.6
	for <qemu-arm@nongnu.org>; Tue, 12 Dec 2017 06:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dn/cWjNkZ+651ThcizW4H8hO6PWmI0tOgpbSoozeZoA=;
	b=F7/e8hnt89AmTmKO2l8A7j+QtVFK3TSrzG1Bi8WfuaccCCNY/0x8uecdA6vYF3Aa+P
	t86yGtqFG6rtokYMiIhpM9D9ouuTjRqWG0AJaP8I7FOM989iL/om+VoitiD5wOixwLnE
	xMejo5lst+iWk1D+NTjRgqnlUixUS3i6TwT+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dn/cWjNkZ+651ThcizW4H8hO6PWmI0tOgpbSoozeZoA=;
	b=G92FuhatOwkSNkkHYDutUO/jd8n1fmxnKR4yFPZUIQ3TfC1KsCrOBPnLD4c1w+xmuz
	jGDre7nFCOShYRLvTyNhvU6X7wVuNthctvdR3szGeh7q+FxczAGs5QFVgKUYTd4rkiwn
	B1ExRN7F176yeVuhWl8pyacvnEBNbmALEqgRh8PpKtgp5EZHo/NfKbhXvNPTYkcaKlrz
	LXC8NLfNYjGjoYlV+59ma5nb8Fm5spQGXKB/CqB3Ot2jbegHAhzqryP2AiFXMtAD05wY
	HA9A9kwnfgjJuo6iehFj3NOyDUngNn5W3+sOfbmYcExAWGFe8dfTbv0Hq16+wDTpZq1d
	OoTw==
X-Gm-Message-State: AKGB3mJkamKFAmH3ArJxvGHBYGGzsG0NxrklFFl/nK5fJssZ3+DFb+cn
	S+XKIPsITrXSh+Vuw1QT2HCDKlcaD8qFhuF0FIBv1Q==
X-Received: by 10.157.37.61 with SMTP id k58mr3495966otb.110.1513088289920;
	Tue, 12 Dec 2017 06:18:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.63.74 with HTTP; Tue, 12 Dec 2017 06:17:49 -0800 (PST)
In-Reply-To: <CAKv+Gu8gZ-Y4-zV2GRgbXPcignAg3vi8__XaFXqAhYOZOL7GcQ@mail.gmail.com>
References: <1512745328-5109-1-git-send-email-peter.maydell@linaro.org>
	<1512745328-5109-4-git-send-email-peter.maydell@linaro.org>
	<5A2F6ED9.5030605@huawei.com>
	<ac182406-8011-9f19-38e7-37328434095b@redhat.com>
	<CAFEAcA_9pee99KpL4zwVS5jJuiv2MCGp79crufpU1kH1Okg-Hg@mail.gmail.com>
	<6b4b6351-eeb4-a4d3-8ddf-5401516671ae@redhat.com>
	<CAKv+Gu-Ugm1g8twoKwgXAPtDfETvXntk2h4WzMVuUTDF7GhMvA@mail.gmail.com>
	<5e3798f7-e280-b6c3-1504-828283617c52@redhat.com>
	<CAFEAcA_+NnpeP9Le7bp9yrYQDwtuP79pt8GpVzJ4RBDMx1iomA@mail.gmail.com>
	<09e7b89f-27f2-1787-b371-7b0c0eff78b8@redhat.com>
	<CAFEAcA-357eVt3s_7ULWxssQttvAV0DkUv_tGkyk8umVgfH1QA@mail.gmail.com>
	<d776710c-2255-947b-22c6-336e9491bb81@redhat.com>
	<CAKv+Gu9e6qwJ4=t=UHHGsVs1XM26agh17Mgy0ckAvUsy+2xi2A@mail.gmail.com>
	<CAFEAcA9JzK8sNF5TmENfXZ-NBJwfp03b2La4YQ=N2i1ZCzrNBw@mail.gmail.com>
	<CAKv+Gu_mzynBKSBSdtUhKRgNd3KmuJTwiNZpmvPCfkRDo_QCgA@mail.gmail.com>
	<CAFEAcA9HAcZTi6bT-FbsG9LtqO=4s7rpcz0niZbimG834t4uHA@mail.gmail.com>
	<CAKv+Gu8gZ-Y4-zV2GRgbXPcignAg3vi8__XaFXqAhYOZOL7GcQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Dec 2017 14:17:49 +0000
Message-ID: <CAFEAcA8OY3PFk_bermKxQBuF_th7SudHgaRk8wf76EAGYnoCGw@mail.gmail.com>
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::244
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 3/3] hw/arm/virt-acpi-build: Add
 second UART to ACPI tables
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
Cc: Drew Jones <drjones@redhat.com>, "Jason A . Donenfeld" <Jason@zx2c4.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Andrea Bolognani <abologna@redhat.com>,
	Shannon Zhao <zhaoshenglong@huawei.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: df7x8FBiRKAJ

On 12 December 2017 at 14:16, Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
> On 12 December 2017 at 14:13, Peter Maydell <peter.maydell@linaro.org> wrote:
>> On 12 December 2017 at 14:12, Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
>>> On 12 December 2017 at 14:10, Peter Maydell <peter.maydell@linaro.org> wrote:
>>>> That doesn't actually usefully separate debug output from the
>>>> console, though, because stdout-path is also going to point
>>>> to the UART with the lowest physical address...
>>>>
>>>
>>> By default, yes, just like is currently the case. But I would assume
>>> this new serial port could be appointed 'console' and put into
>>> stdout-path by QEMU, based on the command line options?
>>
>> We don't have any command line options for doing that, and I'm
>> generally reluctant to introduce new command line UI, especially
>> new command line UI that's specific to Arm and not also needed
>> for x86.
>>
>
> If stdout-path is always going to point to pl011@0x9000000, why would
> we need to parse it?

If you had always parsed stdout-path, we wouldn't need to worry
about the order in which the UART nodes appear in the dtb...

thanks
-- PMM
