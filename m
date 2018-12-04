Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp8073487wrt;
        Tue, 4 Dec 2018 05:33:50 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VdMmKMzuYxCLgeAczhV6J8w8U3uNp/SI5IP5/zVcd1QZiSKGlLVi+h+BsONe5xYrO+jmaF
X-Received: by 2002:ae9:eb96:: with SMTP id b144mr18581954qkg.127.1543930429963;
        Tue, 04 Dec 2018 05:33:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543930429; cv=none;
        d=google.com; s=arc-20160816;
        b=nTRvhfB2nizCiozEpAh0GeQqlrZNHP51rkBtruEiwQgVOrAFKOQmLSZy6+sQDnoz1/
         Kmp+0DGjvYWwxlrrGM3B6o+O1a+l6IUhG4bBRELeHedd5yQ9EpEIrYxDUJbIlHhpG+UJ
         wDEf17x9c67y3bo+yj5ZGCHqKuvJ4BpRSZYt4Yg8M68TmrxsaUxQ255igM9ENfDcFGW6
         etG5Tdg4FMnm4x6k+t07jPCHwug9VVxx3nZzryb69c2OeDIZ5HzFf0EllTOS/cxQ5fmP
         P0dL6UhP/RbH+lt1Bdze8vPnMo0mDjIDdHwjZcawaiOrZZ0im5l9do+lEenxXHGpHH0O
         H3Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=h1MeEjBoPM2D9L5nuKwabqqrY3kmimuFfMoy1luouuo=;
        b=EIuUrkUjLKfibxMfwCbh2DVzb1BpColeyyS5u4QSE/5PueqIcvtFXIbOivMVoXx2H+
         h2pi1NC+J0umAZpmCt8uAv8bhoKLG+q5YmDTVnqJqA15JwYCvEDKpF+6E9O97QJ0gHkw
         Tf8loHSDy6TQVyz0SU8uyH14AWsHdRfnl8DrWX0mOOkzPyVoZqbCFUWODGk2000xoAqY
         OrrbVmeSjixAajWs5nh3DQyRZ9npaoOg1CJFT4+9qSE2uC9JtneoMA8yyXI1Fa8WHp7H
         W92RUW/0J5mmRimprAOHr3u2XZHVKnFA94C3jjY1Z6QG8w2Rnufpw1EDBcTyLdM/zbWz
         KRRA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c198si368040qke.267.2018.12.04.05.33.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 04 Dec 2018 05:33:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56771 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gUAph-0002K4-Fp
	for alex.bennee@linaro.org; Tue, 04 Dec 2018 08:33:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58470)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1gUAn0-0008Sf-L8
	for qemu-arm@nongnu.org; Tue, 04 Dec 2018 08:31:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1gUAmu-0002L4-Qx
	for qemu-arm@nongnu.org; Tue, 04 Dec 2018 08:31:02 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:35514)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1gUAms-000284-Ot
	for qemu-arm@nongnu.org; Tue, 04 Dec 2018 08:30:56 -0500
Received: by mail-wm1-f65.google.com with SMTP id c126so9321060wmh.0
	for <qemu-arm@nongnu.org>; Tue, 04 Dec 2018 05:30:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=h1MeEjBoPM2D9L5nuKwabqqrY3kmimuFfMoy1luouuo=;
	b=q7miEdrxxggc3ijbxFLFHIx7ykHOHYPUsFmmP8Mbzq/wf7lOyrU2V7g5PVTlX2KEdK
	J5M5fy/wQ5vKS2Jv7xrLslycR2WoUohdHboo5DSSzOi5O5MLk336H8p1jRzMe11YZOyN
	HtQ6YitevToPAuN3LZHMg31aNtZ1nYd/FuwX1JS940DyyycYbI7NiBhY1eYEaaGAgbsW
	0YS/UI24SWMBmQsJjXP3XumC636azVrPqPierKdmmCy0ZSlZuk5oQ5nZPioqudwQK1jA
	EDvPvAgV2k7X3Q9YOnr8jaCGOj7GHyCkbBuruKuGRfPWhj8eN2xINcHHjeRnBSqHOpJY
	EMdQ==
X-Gm-Message-State: AA+aEWavPZpWvW7Aq6+hecyrHGHrL0m9qEid7lV0DMkj0fWwhQQRAexQ
	JolaIpUO4R3YG6ZUPn8VewnBXQbJ2MQ=
X-Received: by 2002:a1c:1f81:: with SMTP id f123mr11393543wmf.64.1543930252777;
	Tue, 04 Dec 2018 05:30:52 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:ad4b:b211:833:aaf7?
	([2001:b07:6468:f312:ad4b:b211:833:aaf7])
	by smtp.gmail.com with ESMTPSA id
	60sm28994288wrb.81.2018.12.04.05.30.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Dec 2018 05:30:52 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>,
	"Daniel P. Berrange" <berrange@redhat.com>
References: <1543865209-50994-1-git-send-email-peng.hao2@zte.com.cn>
	<CAFEAcA-oFFz-NtfwHmORxQd4rHsfKa1=tV1kyvPuGQoOZwDB3A@mail.gmail.com>
	<20181204124739.GA17825@redhat.com>
	<CAFEAcA_ovMgKPPjtYVASFqhzM7MX79EJYMZuFY4-FGRh4oqN8A@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <9ad451bd-7eb1-902f-6023-4b48bb84249c@redhat.com>
Date: Tue, 4 Dec 2018 14:30:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_ovMgKPPjtYVASFqhzM7MX79EJYMZuFY4-FGRh4oqN8A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.65
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH V11 0/8] add pvpanic mmio support
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
Cc: Andrew Jones <drjones@redhat.com>, Peng Hao <peng.hao2@zte.com.cn>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JAvq1wTcr6dg

On 04/12/18 13:59, Peter Maydell wrote:
> On Tue, 4 Dec 2018 at 12:47, Daniel P. Berrangé <berrange@redhat.com> wrote:
>> After it had merged there were some changes and the question of turning
>> it into a PCI device was raised. Paolo was concerned that the guest OS
>> is in an unknown state (arbitrary locks held, data structures corrupt,
>> etc) when panic is fired, so simplicity of the I/O port was desirable:
>>
>>   https://lists.gnu.org/archive/html/qemu-devel/2013-08/msg03309.html

(Actually that was Marcelo, I was just relaying the message).

>> Anthony countered that even a PCI device could simply do an outb() in
>> config space:
>>
>>   https://lists.gnu.org/archive/html/qemu-devel/2013-08/msg03325.html
>>
>> So it is not clear using a PCI device is in fact a problem in terms of
>> reliability at time of firing.
> 
> ...and if we'd done it that way in the first place for x86 then
> we wouldn't be having to do anything at all now for Arm.
> That suggests to me that we should do it that way now, and then we
> can avoid having to do a bunch of extra development work for the
> next architecture, or the next interesting Arm board model.

Is there any case where we have anything but ISA and MMIO?  (We have
8250 which is ISA, PCI and MMIO, but that's kind of special because PCI
is only there for hotpluggability.  pvpanic hotplug is not interesting).

Also, while reusing code in general is nice, sometimes there are
platform-specific ways to do it.  For ARM, for example, would it make
sense to use an HVC/SMC that "extends" the PSCI, and pass the number in
the PSCI device tree node?

Related to this, is there a more or less "standard" watchdog device on
ARM that could be added to virt?  There is the SBSA watchdog, but it's
ugly for implementation in KVM because it counts down with frequency
equal to CNTFRQ (which I'm not sure if QEMU has access too, and also it
doesn't play well with live migration).

> I notice also that there's a mention in that thread that the pvpanic
> ACPI table entry on x86 resulted in unhelpful Windows notifications
> about new devices it didn't understand. Is that going to be an issue
> for Arm with this mmio pvpanic ?

Yes, it is probably the same as for x86.

Paolo
