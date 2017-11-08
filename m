Received: by 10.223.150.237 with SMTP id u100csp1788753wrb;
        Wed, 8 Nov 2017 14:11:04 -0800 (PST)
X-Google-Smtp-Source: ABhQp+QysIMfvNib82jNkOJ1qSjinyQ2LROYRSRu0e4lv5ubWQyct9YKWupcq4xBC4NetabzAZJL
X-Received: by 10.13.227.68 with SMTP id m65mr1362903ywe.387.1510179064303;
        Wed, 08 Nov 2017 14:11:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510179064; cv=none;
        d=google.com; s=arc-20160816;
        b=if2dvG+OUuGHCHlvJrhT3tvR0yq5FkUFaa6/7JCiWRYXo+h6Rj4jsX/1jg7VgLW2yu
         UCFI+iM3URIER1w32pgdk9553gd+XMspzYaH+JgtJrLOBchwKNH2CV3mfYkGkJ4Sctlw
         6yP5Tgr7P8xiTx0XYc00/Oi4mOzia54wT5Ged6lL2HBrleQfVEg1VZiogLh6ypOn/qCJ
         wCNkY8JyWdZMCEfFI74fZcTLogzXIOZXshuqEquX0XuRP35DD/ijFW2NYrDCmI0VHXdB
         Lm7pO+Ic49dh6tSRHBlEeXdWwyOHcHdVOF3wRAXMx0zGjTJTHXS2C3Rd50dvS/7DxUH6
         EagQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=9BFxTgXmGD8HWgWoaSiWCl+nMuVbzCgoq4Cnf8Jm88I=;
        b=ykKUssodtpUqQjxGGoEV6O8idw6qrRIibJAtDQaGHgpZ+7Vq2UxMae1I+l1ju9zmep
         9QlFvhXRenaWel1+cp1BfycNJs3nMwqXzHBPRfvBLQU2jW+i/jWZmtNnOgdiSRUSDiT9
         rEIxzJfhbMRYSTTXNdebLkcQtOsylr5+MP2yPVqqiKMgFrLCeMXIEHkcareM7LMCGMAW
         viErvnmd6NTgLP03gLQ8pI0TD0hLutHhFZgxkgeWdmGAPSAV5i3/O7ELLC6/2QsSteHO
         5RiQyvgJgZd/YspSITL1UnplByWlHTIh/PaZGJaUV3sfKn7dRmD7DXAFZqYXffN1liot
         3vtA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=EGC2d1aE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p186si1195646ywc.555.2017.11.08.14.11.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 08 Nov 2017 14:11:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=EGC2d1aE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34136 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eCYYp-0004fu-QC
	for alex.bennee@linaro.org; Wed, 08 Nov 2017 17:11:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49223)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eCYWy-0003hV-Cv
	for qemu-devel@nongnu.org; Wed, 08 Nov 2017 17:09:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eCYWx-0005mx-F3
	for qemu-devel@nongnu.org; Wed, 08 Nov 2017 17:09:08 -0500
Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241]:47658)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1eCYWx-0005mU-6t; Wed, 08 Nov 2017 17:09:07 -0500
Received: by mail-wm0-x241.google.com with SMTP id r196so13407694wmf.2;
	Wed, 08 Nov 2017 14:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=9BFxTgXmGD8HWgWoaSiWCl+nMuVbzCgoq4Cnf8Jm88I=;
	b=EGC2d1aE6c0/lL3PM8rbX5xy5m8uN/NjQ+iCi4fAG3nYiO/idcRUUIcRrminr9mPJw
	mhY31Qr3dM0r40x8JqZmBOiROWbY4waj21RWoPXwlLrLJjjp3AZEZ18FMikr+vYR8TRX
	zqysr+iHpfyKjTxY0Iz75FmTLKvt9FagGEPxzISUn+Dsrwuua/rgwuwQU7QAMu0hEnI5
	frmiJkw9h2IKhfviP66JudG36Lj+sGVhUYbRZpFhMy0ogU/oM90NULvsgEDoNc0Pj3Gf
	CewHjI8dZoQK0yPYcKGwzJcdnMFAPFlzl11sat5OBOG/6XnE6jmUF8zMGpFiBhjP8Wad
	itGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=9BFxTgXmGD8HWgWoaSiWCl+nMuVbzCgoq4Cnf8Jm88I=;
	b=QfDRNTS7c5lPRufFocBHEYfYbi547r2Flb+Xcf+eJTk8VMoIC8httO9Aknk5egy2HG
	8k4IXoXAEXJMYCms2lMwdzQvH1bjXoEgrULM+xdu49gAT6HJWgB59NC0AbTzwJlSI6Os
	xv9Sx70ZRE7wO6McQGjnFBERxf00YaqyPDswWHDwBM4tv5mZp4uu/QEv43AGwzDvGI8Q
	roHwahdscpOgVJivom4fh5bjjMNo0kLYomfyJFb8u2Il60uGa6ckiQFSHrrN9Lb9nFET
	oaf1jcE9/jnAQ91uW6QQyvW+8wvoZjIKgJVVJxsQvLSl9jBOtjZ0ms3PflU0Khs1v+b4
	5bYw==
X-Gm-Message-State: AJaThX4vyn5Si1LWjL5jzHbHfgU5CiQmJH3hQnmgS2+SjfFDP/8G9aKv
	S1A9prQzRnGzlMEiypsfr+qJaZnIeAfsZrhGwwk=
X-Received: by 10.28.230.77 with SMTP id d74mr1387882wmh.75.1510178946113;
	Wed, 08 Nov 2017 14:09:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.147.11 with HTTP; Wed, 8 Nov 2017 14:08:35 -0800 (PST)
In-Reply-To: <20171108215212.GW3111@localhost.localdomain>
References: <1509734853-3014-1-git-send-email-cota@braap.org>
	<20171103185610.GA3907@flamenco>
	<20171103200233.GI3111@localhost.localdomain>
	<20171103222407.GA22411@flamenco>
	<20171106141022.GO3111@localhost.localdomain>
	<20171106201332.GA2152@flamenco>
	<73e9c472-82da-b293-27cd-ca9e0ff93179@linaro.org>
	<20171108215212.GW3111@localhost.localdomain>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Wed, 8 Nov 2017 14:08:35 -0800
X-Google-Sender-Auth: 4CnVJx7SE0wWMvpkFVuTXElXUZs
Message-ID: <CAKmqyKNOSdKjxJUVq0dtu7h4ELLqnvT27HDbe_FpVn+tyy7agw@mail.gmail.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::241
Subject: Re: [Qemu-devel] [PATCH] hw: add .min_cpus and .default_cpus fields
 to machine_class
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	"Emilio G. Cota" <cota@braap.org>, qemu-arm <qemu-arm@nongnu.org>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	Marcel Apfelbaum <marcel@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +Ldm8f7yLTMT

On Wed, Nov 8, 2017 at 1:52 PM, Eduardo Habkost <ehabkost@redhat.com> wrote:
> On Wed, Nov 08, 2017 at 10:29:43PM +0100, Richard Henderson wrote:
>> On 11/06/2017 09:13 PM, Emilio G. Cota wrote:
>> > Subject: [PATCH] qom: move CPUClass.tcg_initialize to a global
>> >
>> > 55c3cee ("qom: Introduce CPUClass.tcg_initialize", 2017-10-24)
>> > introduces a per-CPUClass bool that we check so that the target CPU
>> > is initialized for TCG only once. This works well except when
>> > we end up creating more than one CPUClass, in which case we end
>> > up incorrectly initializing TCG more than once, i.e. once for
>> > each CPUClass.
>> >
>> > This can be replicated with:
>> >   $ aarch64-softmmu/qemu-system-aarch64 -machine xlnx-zcu102 -smp 6 \
>> >       -global driver=xlnx,,zynqmp,property=has_rpu,value=on
>> > In this case the class name of the "RPUs" is prefixed by "cortex-r5-",
>> > whereas the "regular" CPUs are prefixed by "cortex-a53-". This
>> > results in two CPUClass instances being created.
>> >
>> > Fix it by introducing a static variable, so that only the first
>> > target CPU being initialized will initialize the target-dependent
>> > part of TCG, regardless of CPUClass instances.
>>
>> Hah!
>>
>> So, I had been thinking of the xylinx ARM + Microblaze case, where we really do
>> need two different initializations.  I never imagined that two different ARM
>> parts had different CPUClasses.
>
> Is xylinx ARM + Microblaze something that already works (and
> would be broken by this patch), or something planned for the
> future?

Something planned for the future, it has never worked.

Alistair

>
>>
>> So I guess it's my initial patch that unified this that's more buggy than not.
>
> We still have the option of reverting the original patch, but (if
> it doesn't break anything) this patch looks like a simpler fix
> for 2.11 than a full revert.
>
> --
> Eduardo
>
