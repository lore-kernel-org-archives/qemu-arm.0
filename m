Received: by 10.25.77.4 with SMTP id a4csp337744lfb;
        Wed, 15 Mar 2017 07:22:14 -0700 (PDT)
X-Received: by 10.237.53.9 with SMTP id a9mr2973670qte.188.1489587734811;
        Wed, 15 Mar 2017 07:22:14 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m30si1525495qtg.77.2017.03.15.07.22.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 15 Mar 2017 07:22:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37601 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1co9oc-0006yo-B5
	for alex.bennee@linaro.org; Wed, 15 Mar 2017 10:22:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36267)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1co9oZ-0006yi-Bu
	for qemu-arm@nongnu.org; Wed, 15 Mar 2017 10:22:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1co9oY-0000HO-IE
	for qemu-arm@nongnu.org; Wed, 15 Mar 2017 10:22:11 -0400
Received: from mail-wm0-x234.google.com ([2a00:1450:400c:c09::234]:35393)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1co9oY-0000Gw-Bj
	for qemu-arm@nongnu.org; Wed, 15 Mar 2017 10:22:10 -0400
Received: by mail-wm0-x234.google.com with SMTP id u132so12080166wmg.0
	for <qemu-arm@nongnu.org>; Wed, 15 Mar 2017 07:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Pho1Tzd9SMqYOJPBKe6h2G5Zoi5jpDuy8jqrrxSq27A=;
	b=GuKInp/NfbV3pg6giPNzt+kofsD+5LjBkHglHG2aHk/eM9tihawnXPYGIPHcXS4mzY
	or+a/TlPKu6oKgGTRLweF9/9vnGLjRnHmO0C6ZhHAZcQsrwA3CBrl3SM8crNOlE0uE/J
	fNZsVZkrFRqoFT+yy7t9qFmlKvOVGI1BpK7iI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Pho1Tzd9SMqYOJPBKe6h2G5Zoi5jpDuy8jqrrxSq27A=;
	b=USOECgW+EiRcOiq3L854+RwUeUqsb+qio0GKjkduy7BCePW/7Nb7rpnbvrbaYiygtN
	ZMojorM575+CCpitQ8cde899nhqc13x4CJhCY9eK39itpLGmDzpE0QXl2C7rCkEpP+Ml
	jUSoOtZIDFzCSadkhF/dpL3LxcO7CKojHM29bebXkDeBzrkWC87kGqjWUXr/ns/g8z06
	XU0b1a/oTv3aAcJJx0rpX74dwJL4noCLyi9jeqYaUgN7dxnIV3cFvtTHZOx4R6Q/wqF0
	wYhwG6QaE3AdNubh2vJ2al2tHYegmzPOaeJKrXAZLHpso8DnMItol2LhhiIfH8QORvB6
	JM0g==
X-Gm-Message-State: AFeK/H0TrzIObzjhyGVzvi26OF0ALyHxeeEY2vVQ/8sQVT52A0ru1ZvaXouthHPWuseCgFtNPKBPcq+zLUvM/mbn
X-Received: by 10.28.150.194 with SMTP id y185mr19278644wmd.92.1489587729348; 
	Wed, 15 Mar 2017 07:22:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.145.33 with HTTP; Wed, 15 Mar 2017 07:21:48 -0700 (PDT)
In-Reply-To: <20170315140633.jtultotyihql7qlr@kamzik.brq.redhat.com>
References: <1484559214-2248-1-git-send-email-zhaoshenglong@huawei.com>
	<1484559214-2248-7-git-send-email-zhaoshenglong@huawei.com>
	<20170128145551.sknp447ieue56xgo@hawk.localdomain>
	<20170315115044.GO1277@cbox>
	<20170315125113.erfl2gk6fwmbccsn@kamzik.brq.redhat.com>
	<20170315133645.GQ1277@cbox>
	<20170315140633.jtultotyihql7qlr@kamzik.brq.redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 15 Mar 2017 14:21:48 +0000
Message-ID: <CAFEAcA_O3282tyQwK=eAyc5EYPZdETE2RuZT0dnZ7NCEWwP9aQ@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::234
Subject: Re: [Qemu-arm] [PATCH RFC 6/7] ARM64: KVM: Support heterogeneous
 system
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
Cc: Christoffer Dall <cdall@linaro.org>, Marc Zyngier <marc.zyngier@arm.com>,
	qemu-arm <qemu-arm@nongnu.org>, wu.wubin@huawei.com,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	"kvmarm@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gFb4/q/zRMBf

On 15 March 2017 at 14:06, Andrew Jones <drjones@redhat.com> wrote:
> On Wed, Mar 15, 2017 at 02:36:45PM +0100, Christoffer Dall wrote:
>> > If QEMU wants to know
>> > whether or not the host it's running on is heterogeneous, then
>> > it can just query sysfs, rather than ask KVM.
>> >
>>
>> Can it?  Is this information available in a reliable way from userspace?
>
> I don't know much (anything) about it, but, afaict, yes. See
> https://lkml.org/lkml/2017/1/19/380

AFAICT that won't work if the CPU you're trying to
look at the ID registers for happens to be offline at
the time you're looking at it.

thanks
-- PMM
