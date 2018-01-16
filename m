Received: by 10.28.173.206 with SMTP id w197csp4089697wme;
        Tue, 16 Jan 2018 07:37:28 -0800 (PST)
X-Google-Smtp-Source: ACJfBou5wSbhP8Pl6QImzzfloVhNU2+2v05x0sqPxC8C8XaSWzvCqEo82BrjZZdfLcwI4yqTQiRk
X-Received: by 10.13.218.2 with SMTP id c2mr11104407ywe.13.1516117047993;
        Tue, 16 Jan 2018 07:37:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516117047; cv=none;
        d=google.com; s=arc-20160816;
        b=HL7VRIqKSPt2TImTDkIDvVcCtnpe1A+bJ6RKyPu5MNUWIGpxctqAM2ULEE+l5hWaX2
         Kh0erfA5ltxw1+Xl4khJKiuJP3Dl6kBovpcIDPuvI/ARP5EYy3eb9ZMPYKnUtiibB1Sb
         kKaKHaM8j4XpGQQ0mE2ZaoSq/pMklAc3oAXTQBrWBknofxCU3gXbUChFSj7IyJI5GwgN
         psMynq9t+ckY30uM51CMjnVLy4KF4pjZM00v2MRGNTjaHbe5H+OtO5eLk44bUcJ3hhVd
         MOlMsdLG+3pI3lEcApeFdv1bx0knxRxMLO5puYBoVC4lKyPer8XTVZNZgk8rDBRPOcIn
         CliQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=4uYNyvh1ZxesT78EWbG+sPcwBgWFnZI9ikmuZJBnVDA=;
        b=ysmvQWfG3UppaHAxM4SgJV0M+3KFEnK7NM6SH35J4LLiNkwZw2rFHTdIDBVzr7I8w1
         wcMSnNR5+C+tpGZEOLafJD6SXs5kr1NtDgZohUjSItiMYobQYIGwmW+Z4v3hpu0VvoHQ
         I8k2Q+Jd22vl/9K3PPI0a+8BWELWWLN7rDYYwasbb6lonmqU54SBtLx9O3w3qmqiwa3V
         FX/RcPxZo4dtpEl8tkba19cvE9L9DBX/GNCXEHzez2hD1iDopNtGElc8r1RgH6p+UFcF
         192AoAcAlBIW9neVWXlftgSJ589b7Zc4S4MQJJfDbXZthTmrKdiNFmADXv9RRF7kf2vl
         /3rA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hXD7XnTt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w141si557837ywd.802.2018.01.16.07.37.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Jan 2018 07:37:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hXD7XnTt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41922 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ebTIl-0006wG-Dh
	for alex.bennee@linaro.org; Tue, 16 Jan 2018 10:37:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39486)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ebSrb-0004SP-1U
	for qemu-arm@nongnu.org; Tue, 16 Jan 2018 10:09:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ebSrX-0000eG-7w
	for qemu-arm@nongnu.org; Tue, 16 Jan 2018 10:09:23 -0500
Received: from mail-ot0-x234.google.com ([2607:f8b0:4003:c0f::234]:38511)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ebSrX-0000du-3g
	for qemu-arm@nongnu.org; Tue, 16 Jan 2018 10:09:19 -0500
Received: by mail-ot0-x234.google.com with SMTP id v5so3525374oth.5
	for <qemu-arm@nongnu.org>; Tue, 16 Jan 2018 07:09:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4uYNyvh1ZxesT78EWbG+sPcwBgWFnZI9ikmuZJBnVDA=;
	b=hXD7XnTt61QKyEGxfwwcKSLDFp0wHOMT2CfJl+ta83VBp91je0Scbogj2hStF3hi2U
	kMNvneaxuLVyggDjl7obvxCpfC+Y5CIjtS0Wu9iXTIKLiwO7Meas2X19eYLvqM7L1BX8
	ija/wP/DHNKwaZ4waJ2ihlj2Qnvc8FkaFKjNU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4uYNyvh1ZxesT78EWbG+sPcwBgWFnZI9ikmuZJBnVDA=;
	b=SSdO26sYYuYnq9bJuiuNh8W66uU3AoaUGVu4LC69PzkW/OGZEeETmfdZd90hQeXKhm
	0bPzLKVt1HujwzKvIpFTm0J0E1ol171GSu5V/2+OPh2q1Aj5cq1W2xmYweoF8ITCKIT8
	yapyob2Gzrix0rSWy0m3mSEZ4r/czuh7S4ueoUw7jeEEUNHZjzQg0ArZ3vUYsX2zJBZw
	D7yOSfAQNytVQk2YKFEIUINtOOtc0aTUKcpzVoB5De6hSfTVGMdmU6e3y7FFYKze6jCP
	y6Navk8ieGd9zwlshsWSt9AM/HplivUnB+UGX9UyXT1+81L0cK2ByWA77QWQeLCagNFk
	/BMg==
X-Gm-Message-State: AKwxytfCh5RmDkg2x7HMzWehUWrZKjW+fBJRKVc+p/avBFQqAchqlnSC
	/S0pP5Yq55TIx/DZYJ4Fj5dBMU1bRHJQSnHicNingg==
X-Received: by 10.157.2.8 with SMTP id 8mr4568958otb.116.1516115358529; Tue,
	16 Jan 2018 07:09:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.15.71 with HTTP; Tue, 16 Jan 2018 07:08:58 -0800 (PST)
In-Reply-To: <20180116013709.13830-1-andrew.smirnov@gmail.com>
References: <20180116013709.13830-1-andrew.smirnov@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Jan 2018 15:08:58 +0000
Message-ID: <CAFEAcA8uJpwwVSAMWY+rFm1+3YFdtuShAyz6PB4yNto_YOVCbg@mail.gmail.com>
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::234
Subject: Re: [Qemu-arm] [PATCH v4 00/14] Initial i.MX7 support
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	Andrey Yurovsky <yurovsky@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jPWho4BCGuU4

On 16 January 2018 at 01:36, Andrey Smirnov <andrew.smirnov@gmail.com> wrote:
> Hi everyone,
>
> This v4 of the patch series containing the work that I've done in
> order to enable support for i.MX7 emulation in QEMU.
>
> *NOTE*: Patches 1 and 2 are provided for the sake of completness and
>         are going to have to be adapted once Philippe's SD changes
>         land in master. As such, they are NOT ready to be
>         accepted/merged.

I've just pushed a pullreq including Philippe's SD changes to master,
so you should be able to do the final versions of these i.MX SD patches
now. I've also I think now reviewed everything except the pci patch,
which is a bit out of my competence area.

thanks
-- PMM
