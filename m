Received: by 10.25.0.147 with SMTP id 141csp609797lfa;
        Tue, 21 Feb 2017 09:49:15 -0800 (PST)
X-Received: by 10.55.102.199 with SMTP id a190mr17524189qkc.277.1487699355790;
        Tue, 21 Feb 2017 09:49:15 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b24si15572630qkb.116.2017.02.21.09.49.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Feb 2017 09:49:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47444 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cgEYr-0002Ra-3v
	for alex.bennee@linaro.org; Tue, 21 Feb 2017 12:49:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45321)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cgEYl-0002Q0-9n
	for qemu-arm@nongnu.org; Tue, 21 Feb 2017 12:49:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cgEYk-0003vE-Hn
	for qemu-arm@nongnu.org; Tue, 21 Feb 2017 12:49:07 -0500
Received: from mail-wr0-x232.google.com ([2a00:1450:400c:c0c::232]:33976)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cgEYk-0003v3-BT
	for qemu-arm@nongnu.org; Tue, 21 Feb 2017 12:49:06 -0500
Received: by mail-wr0-x232.google.com with SMTP id z61so86686024wrc.1
	for <qemu-arm@nongnu.org>; Tue, 21 Feb 2017 09:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6OauJKK/PUaYkgD+bbHQ9NQmgx+gnuJGOec1Ia4clSI=;
	b=NVbroiIw09mshN5Fqr4z/HQTCx3cYR1nCsbF+VSMIRUCQrUk7iiWZT3cC2FtUu4A4C
	Jba3ZHEt4WQroGPyvrvBOR7meZZy4O7dw+O05x5BiAthCvC4fg9iQoJQ1qxdQ+lujA/A
	6RXLoUZgdnznJmAc9e3Agy1fprE1NcYv7f428=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6OauJKK/PUaYkgD+bbHQ9NQmgx+gnuJGOec1Ia4clSI=;
	b=MvcGQraTBFIRh2F0jhvPnP3Iru45XdVsw+rwwU3MFcvuhDBeVurcqsj3eBX4afoHHi
	Kz4v/jJiQS4USkXob3wTem2vAfmtEpzyc4B3AtLGyIoRto/MD1B4gDBRWAlwbZhHU9l9
	AW6rnkKZzHpef3UH1cZ6ZNSy/BsZln/cf5vY3/SEdX/tIKEqU4zOReYNO73rpIQqbhFn
	R/FWBX8ws27NKbAoLGIPtNqPArUPgpaS5/wBHg+NYIw0W25HI4gV+IrFIaTVd0mpkr3E
	rPX3lSfdhoyZ4PUiZ4U/e37VOo4tko8aE31/jF2xAzGjDa9t59euauz7ZAH6MJuMU1CB
	YTNQ==
X-Gm-Message-State: AMke39lViXhlC8LUkPcqySxofwc55E06ooDedezrOYudeQ7uB0gYFWzf7qFMHP9cAiQQrtNGXxS9i6z0f+0x04/5
X-Received: by 10.223.150.209 with SMTP id u75mr3867093wrb.195.1487699345119; 
	Tue, 21 Feb 2017 09:49:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Tue, 21 Feb 2017 09:48:44 -0800 (PST)
In-Reply-To: <20170221155856.GD2778@thinpad.lan.raisama.net>
References: <1486996099-15820-1-git-send-email-peter.maydell@linaro.org>
	<CAFEAcA98V-3EMDS+o9HnAdY14JDoY4i8yYyFP=OiK8QXMSWvmA@mail.gmail.com>
	<20170221155856.GD2778@thinpad.lan.raisama.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Feb 2017 17:48:44 +0000
Message-ID: <CAFEAcA9762NB0ghnvdST2AGFn_y_i5f_KxT0sdiVbZgzA=fk8A@mail.gmail.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c0c::232
Subject: Re: [Qemu-arm] [PATCH 0/4] cpu: Implement cpu_generic_new()
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: I8ReqXj79wMJ

On 21 February 2017 at 15:58, Eduardo Habkost <ehabkost@redhat.com> wrote:
> On Thu, Feb 16, 2017 at 04:40:43PM +0000, Peter Maydell wrote:
>> I know it's only been a few days, but I just wanted to
>> say that I'd appreciate it if we could manage relatively
>> quick review on this one, since I have a set of patches
>> pending that depend on this and which it would be nice
>> to get into 2.9 (softfreeze approaching rapidly).
>
> I was away from work for the past 3 weeks and I am catching up on
> e-mail, right now. Is this proposal still up, or is this series
> obsoleted by something else?

Given Igor's view that this isn't the way we want to go, I have
decoupled the other patches I mention above from this patchset
(making them do an in-line call to parse_features etc like
the virt.c code etc etc do at the moment). So there's no rush
and we can take the time to decide what the right approach is
(which we can then implement for QEMU 2.10, I expect).

thanks
-- PMM
