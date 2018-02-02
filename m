Received: by 10.28.71.27 with SMTP id u27csp1035558wma;
        Fri, 2 Feb 2018 10:26:16 -0800 (PST)
X-Google-Smtp-Source: AH8x227R322NS5gdcgXcVIapDdcR+o612otZEggB6Y2ntaFdiONxy1bC/VvD6PchC3w/WX2D1qCY
X-Received: by 10.129.237.16 with SMTP id k16mr27329965ywm.430.1517595976248;
        Fri, 02 Feb 2018 10:26:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517595976; cv=none;
        d=google.com; s=arc-20160816;
        b=b6iSr5K6eA4T3tyk1Azddxy5slqlQ7VoZ9o9rMyn513pR+2VgtBRdAQb7VAgxYN407
         bR1hyc/8jEX4Fau5CWKLV+skd/s1I5rwpC5JnHUlcPqZpgFNU2v38cxWW4ipRGSbO9fR
         t7nnQxLMJ5vLY56tKNGrzN40nfnEytbRd7Nutl8/N2u30cYhnAh+GdMfAAuMQSzcGabC
         cpLaixmMF0YDNqWLUc57YpSg06LDtCL9u1apoLpwATNbwWKKCg3OfSJvNpo1cavQ0cGQ
         Az8jK9DJDSuVPJst2Ejz7jgf2G6cZHCUM/xacsk+PEg5Qk2LhsoNNY6tVZybPjBrz8sm
         9GsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=12HKHfq/wZZtBY6w7wPfXmK8dGOJmWw7l1ZN1eQ7BFY=;
        b=N38LRG19ENn39VTjJ1tsDDIG89VBXcmIw/s9MqgkBh7W8a7swXNgyhQq0RAkfnE4ze
         izXUHmT4wOPvTcBcpdNcIeca8v9TBWLfdkxVxNzudbnFlTYFgeoQ+OJE3JaKpNIjlGtf
         DwvXACo4n1ui0kmOyzpu5Vwtx6VsV8yaWxW51+fjMlZYRpeqgZP6a9koxbXyVWHcJkOj
         wiGoqFFpgsez5qxk1PKky0psYt7vDcJUezI0YkwXtywWUVybLdMqAhrnlYXHg6Vd/Y0v
         HCbehReTKUNuJMcx7G/tTjD2Ti1RqkYRd8/ZNjQFcKmlRs6m0W4kEilsN7CMeEqaYxx6
         rG6A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=D5IgSROU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y29si531142ybi.261.2018.02.02.10.26.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 02 Feb 2018 10:26:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=D5IgSROU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47713 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ehg2R-0004SF-L0
	for alex.bennee@linaro.org; Fri, 02 Feb 2018 13:26:15 -0500
Received: from eggs.gnu.org ([208.118.235.92]:50429)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ehfbr-0002aj-2b
	for qemu-devel@nongnu.org; Fri, 02 Feb 2018 12:59:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ehfYH-0006f9-DC
	for qemu-devel@nongnu.org; Fri, 02 Feb 2018 12:58:25 -0500
Received: from mail-ot0-x241.google.com ([2607:f8b0:4003:c0f::241]:34244)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ehfYH-0006em-1w
	for qemu-devel@nongnu.org; Fri, 02 Feb 2018 12:55:05 -0500
Received: by mail-ot0-x241.google.com with SMTP id x15so21075582ote.1
	for <qemu-devel@nongnu.org>; Fri, 02 Feb 2018 09:55:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=12HKHfq/wZZtBY6w7wPfXmK8dGOJmWw7l1ZN1eQ7BFY=;
	b=D5IgSROUDLCKh8Gb10QIExb6ELqPe+vIUSf5laOdhbtTFgwtpeelGyhdb5rlC2F46N
	qZTzkbrlQux/eKIlXVnpcMmPtr7SG4Q8qbSfW8DtoAOplmqHuL+f+4s6jRYtA4DtqryW
	pigVoG3+Mgrb23KJI3Civl933kbdAyoCyut3w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=12HKHfq/wZZtBY6w7wPfXmK8dGOJmWw7l1ZN1eQ7BFY=;
	b=fLWG2GG7czF2CST1tmMv5udzl4q09xApnshUVEhYUj6yzSrm6d5KIPbpfqLKqeuaOt
	SxWSj6qMx5KvdfxR8oLmHVaC90+xodcjRDj+W5lc1VBYlURGUTmlLjrftKh2vw3ZWJbU
	XcqkPLfhmy55RCHoxYDcFTnAs2yeX9OmbscAmdxd6Pz8Rlw9ruRuYqY5L1uFm9tYANfY
	AIUMPhITVXjBaOlI8HQy+hyVL+cdYTSSF4VHtPnfOXyKU9yrzJk3r/vwcKkZujIGly+a
	SNzyVqdAFxwV/0uLbx2+UXXPsDljzHuRIFLB6k/NabFzKXHXoZUgzQ9vY3lTVqJhpgJw
	53Dg==
X-Gm-Message-State: AKwxytdOIwqSWz0VP+i7v/6NVtPM/RUrH23KBnhurjsknw90e5De70kg
	tLaEgaSezdtkK7CCkuiJaaPcnmgNPV7TmvyZg8r/Rg==
X-Received: by 10.157.29.131 with SMTP id y3mr9178794otd.335.1517594104132;
	Fri, 02 Feb 2018 09:55:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.61.133 with HTTP; Fri, 2 Feb 2018 09:54:43 -0800 (PST)
In-Reply-To: <fde1ca29-873b-5e5c-76d3-d620301c924b@amsat.org>
References: <1512670493-18114-1-git-send-email-peter.maydell@linaro.org>
	<1512670493-18114-5-git-send-email-peter.maydell@linaro.org>
	<d8c2c2ca-5046-f19b-9514-d3cbef3b7c3a@amsat.org>
	<CAFEAcA9k2KKrXk+2LQd+X7-RFuDQO96bYSo8xi81zfb80+ApFg@mail.gmail.com>
	<fde1ca29-873b-5e5c-76d3-d620301c924b@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 2 Feb 2018 17:54:43 +0000
Message-ID: <CAFEAcA-0wV+DDwFEEnB1=VvUSOsG2yQRCDFBHRF+O=gayPGLVQ@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::241
Subject: Re: [Qemu-devel] [PATCH 4/6] target/arm: Add "-cpu max" support
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
Cc: "patches@linaro.org" <patches@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Richard W . M . Jones" <rjones@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Gyc6HDxAon3+

On 26 January 2018 at 15:44, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
> On 01/26/2018 11:33 AM, Peter Maydell wrote:
>> On 26 January 2018 at 14:29, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>>> Why not use arm_any_initfn() here?
>>
>> That function (and the 'any' cpu) are deliberately only
>> included in the linux-user binaries, not the system-emulation binaries.
>
> why not use the V8 features?

What v8 features?

>> (Also arm_any_initfn() only initializes userspace-visible stuff, it
>> doesn't provide ID register values etc for kernel-visible things.)
>
> I'd still use an unique arm_max_initfn() such
>
>   // initializes userspace-visible stuff
> #ifndef CONFIG_USER_ONLY
>   // initializes kernel-visible things
> #endif

>>> Actually what seems cleaner is to move "any" features here, and kill th=
e
>>> "any" cpu, using "max" for this purpose.
>>
>> We can't kill 'any', that would break back-compatibility
>> of command lines.
>
> and use an alias for 'any' -> 'max' or just
>
>   { .name =3D "any", .initfn =3D arm_max_initfn }, /* backward compat */

Yes, we could probably do something similar to this.

thanks
-- PMM
