Received: by 10.28.173.206 with SMTP id w197csp3886685wme;
        Tue, 9 Jan 2018 08:33:51 -0800 (PST)
X-Google-Smtp-Source: ACJfBov0uWA1i0B4uLOwKaW1aO5cR6Kec6yWkjebVooGIXI49pAFoQpx8hob17mmCeN7i/+NZnJg
X-Received: by 10.37.112.4 with SMTP id l4mr14486095ybc.503.1515515631488;
        Tue, 09 Jan 2018 08:33:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515515631; cv=none;
        d=google.com; s=arc-20160816;
        b=bLhE+dMK5aY2nBfPM3fld5FY9XipexLnTYz8U6FCxVn0RaH1DdBgJxV7UckYbA3nSi
         u7Inmls60WMUrBAL6JKmj8/GWzg9eeugGvB+y5IKtplrY0L1Ts6vZpchBQvDq525SSlN
         RhSahSmSLgG3P5Sw7DHM9pVqVQm0aiGQBetBomt8WwBvWyKDDXJTWT77XiDrBtg7iszp
         SwwW4zBUwJPSUgYxsmSQmAOcaAnqozJwE2LqsixuUB44aYdbLNtwldqZJUu7NhNJnlUN
         N5+XRgMNdPgqCpVrAbMNKIvigxkYo15cao3Q+Lm61XFnQs5Y8v/wTUt6GL8L8T8NdAio
         MXUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=1yaDoXbXPHrju4W3/FWjINN3dOVFsRxrxkHlX+tdvs0=;
        b=ijkarcw8TPgbnZeVfR1uhh2zbcWEGq3rnpM5WUoxiDHQAIUy6kQFgBCcfJ5iT3s0hc
         ODWpZK5/fGV0liqQEy2kb1/DB0qu0Ep9HpaMZn4IQyigvITJla61DpgZ60812WnY5Vo2
         EmPExl+kjsGyDL79/fFikfXEGtguhCg3AarC/to77UpyEfa5auj8sa/hdqzEL89fMbDD
         5Z+skB5LuEj8oLce1143mHEepFgXjdGb8bO5olJty0qrprDcabW0SfaAlzrSd4afeIZG
         YasIn4iGQ5gtZUnr6c2NgfcmTl+HfYOMbjDlTgqlo6FSelVtQhC1XxAeE/tCW9LvJsdq
         Ggsg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o71si832457yba.771.2018.01.09.08.33.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 09 Jan 2018 08:33:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:32949 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYwqU-0003F0-RX
	for alex.bennee@linaro.org; Tue, 09 Jan 2018 11:33:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60810)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1eYwmi-00007W-Fq
	for qemu-arm@nongnu.org; Tue, 09 Jan 2018 11:29:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1eYwme-0002xB-D7
	for qemu-arm@nongnu.org; Tue, 09 Jan 2018 11:29:56 -0500
Received: from mx1.redhat.com ([209.132.183.28]:45698)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lersek@redhat.com>)
	id 1eYwme-0002wQ-7e; Tue, 09 Jan 2018 11:29:52 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 306074D4A4;
	Tue,  9 Jan 2018 16:29:51 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-120-223.rdu2.redhat.com
	[10.10.120.223])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F2C616C512;
	Tue,  9 Jan 2018 16:29:17 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1513183941-24300-1-git-send-email-peter.maydell@linaro.org>
	<CAFEAcA8NbL7ROZs99hWhpAF2Rdi2qEiWLNo3hr_9W7gmgXyw4A@mail.gmail.com>
	<6d20557d-5722-706f-ca4f-489ab85358c0@redhat.com>
	<CAFEAcA-Nn4VmSnxT7Of8Nh+p5QgF9cMzkqZ-VBCC=2zRgk-Xdw@mail.gmail.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <e40cc107-2fe9-d8a5-b4fd-385c0d22c564@redhat.com>
Date: Tue, 9 Jan 2018 17:29:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-Nn4VmSnxT7Of8Nh+p5QgF9cMzkqZ-VBCC=2zRgk-Xdw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 09 Jan 2018 16:29:51 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 0/2] GICv2 & GICv3: RAZ/WI reserved addresses
 rather than aborting
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
Cc: Drew Jones <drjones@redhat.com>, "patches@linaro.org" <patches@linaro.org>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Auger Eric <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /3sSDLPm3uj5

On 01/09/18 17:12, Peter Maydell wrote:
> On 9 January 2018 at 15:58, Laszlo Ersek <lersek@redhat.com> wrote:
>> Sorry, no clue about any of this -- where should I read up?
> 
> I cc'd you mostly as a heads-up since the QEMU bug is UEFI affecting,
> not because I wanted to make you read the GIC specs :-)

Thanks (and, thanks :) ) -- from patch #2, looks like GICv2 is affected
too, and the patch seems to be fixing commit a9d853533cc1
("hw/intc/arm_gic: Switch to read/write callbacks with tx attributes",
2015-05-12).

Is that right? That commit was released with v2.4.0. Should I have
experienced the error? Is it KVM / hardware specific? What are the symptoms?

>> Ard did ask a question though:
>>
>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg500055.html
> 
> Sounds plausible (my UEFI binary I hit this with is pretty ancient)
> but I don't know for certain. It's one of those things that seems
> like it's a bug in UEFI (perhaps now fixed) but which is also
> definitely a bug in QEMU, and if it is a UEFI bug it's pretty
> harmless.

... I don't know the symptoms of the issue either that was fixed by
<https://github.com/tianocore/edk2/commit/28f8d28faabf50a82ef8d137308592c64ea9e2b6>.
Guest crashes with unhandled data abort? (I.e., impossible not to notice.)

Thanks!
Laszlo
