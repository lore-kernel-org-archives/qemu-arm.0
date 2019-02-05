Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp4890162wrt;
        Tue, 5 Feb 2019 07:24:52 -0800 (PST)
X-Google-Smtp-Source: AHgI3IaCZTRwPhDCcOwfR07/2zdITeVc0JqbcMHQKRexNSLF0GtX9R57G3KYnTBrtaWxMuQLL/u8
X-Received: by 2002:a25:60d6:: with SMTP id u205mr4444770ybb.326.1549380292308;
        Tue, 05 Feb 2019 07:24:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549380292; cv=none;
        d=google.com; s=arc-20160816;
        b=Dm5t4dloY9rcHMLwNWN2v2qdH15Fn2W1qXc3kxYQ5xe689G+t3Tf7qT7+14+AhNhc9
         kyP5kKQ3lFgA7dwoWVRIooehojQUrVUmUp8C/aRXrjLFS2ZYI+dYWjK06ncPI2tBC92z
         ofrZ4jbUEn9GfjiXpZ2WEYeMLG2VM9SKw/zhphq4EXQGt+Yfeh7FefmRFYiJvl1sLRWJ
         gmOiPJj9YW06xmL9x7xqtOB2kE+ZvnXX7ZBsioIAIF77uICaLBr1dEGZZU9wTbVFUPyb
         9Ft/hRjeNqe1e8obfdc2TkGdPke4uFzg/X6I42wC+6ghO53HlKZroCC9PrY/hTo1Eluc
         nMSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IqDKdDwwh9XkJK1if8Jio6SwfG533wLlwX4/w4gT420=;
        b=C1EWqyr9kpzQeODz61x5436Pl5LyCcvhuUVPsLbWFqOgtursOiBW4RXNnVpr31sm8h
         vHw0cy1W3WaschIJWIfmk9dvYAyb/ob3EZLoxgXUu/DdzoQ02wMkgzNXOHBKVrQy2xPH
         t7KByzwdjHd2rdNs/vUU1yqdjwW2IRE4e9Uj6g8rwiCij4PEc7I5n0zOPcASVgVirKnB
         uxoNvq5vAYeYfHqxfAHavS9HsfqMpbZj/St+Ahxlnxdy2fQa+7ECH2suNEK6bfIuB/WJ
         g9ThcPbnZvWJY6eyXzTyUh2by5f4QjEYCjm7mVscJ5Z6LfVU21Lt7CiQXIW51PBxDeU4
         XnYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=H86FBQzQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o8si2052678ywb.348.2019.02.05.07.24.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Feb 2019 07:24:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=H86FBQzQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:33689 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gr2ah-00086z-Lb
	for alex.bennee@linaro.org; Tue, 05 Feb 2019 10:24:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59345)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gr2aM-0007z4-Il
	for qemu-arm@nongnu.org; Tue, 05 Feb 2019 10:24:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gr2aK-0002Y6-7t
	for qemu-arm@nongnu.org; Tue, 05 Feb 2019 10:24:30 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:36618)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gr2aG-0002Sn-NN
	for qemu-arm@nongnu.org; Tue, 05 Feb 2019 10:24:26 -0500
Received: by mail-ot1-x343.google.com with SMTP id k98so6305374otk.3
	for <qemu-arm@nongnu.org>; Tue, 05 Feb 2019 07:24:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=IqDKdDwwh9XkJK1if8Jio6SwfG533wLlwX4/w4gT420=;
	b=H86FBQzQC8cGYey2zZywH+ooqhz/fLAHjthQgcyvr/hlwwvImeVXfazFuIB5IjJWU6
	Wuzdyg1dI/4pu7diWLGvx0FecttwKt0WcBKxQZGuCJaApydMM2Sez0wydG1q/pbAENov
	8OcpN7DrPdWUVQD1YdoabfDedIHL9uaKLnHFoptj0Scndp0mq/IhGRxL7bhN/G6szPRY
	nT8rOeCZa37FpWKBxecop6tyO7NVXRQ7ienRYpwu3q/sXhq9bqHBUkXTVqNxN84cIHgw
	ktOXP6jGSTyGGI451yd/IO6eyc65WOPl8Uj4aa2pyswKrfg7etUYV8Hqf5FclS5U8Ypu
	RA+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=IqDKdDwwh9XkJK1if8Jio6SwfG533wLlwX4/w4gT420=;
	b=oW+5zaKxZQ0e8DgAN5MdOx9ic1NQThN//h3aXDp6hgmVRAg3pQ/1vXSytKYNG93I4Q
	OhCx50Rb+RWPqKRcUCsx4h5uXeEh0KDFH33yUChvoq1CW1OqQE6APHav4sMqMT9RVZ4/
	6Z38hVUp4Sd3XNOVb7iY3P++TC5oC4hbA0ARHqQhybVoD8gSQKEguuGPTm2G4UnukiST
	dwGkMhUhDyB7F1yFUiyToyZQ1TkQesGQCLTiKpBzCVnvNZ7/GU/UnqNlOx/uG/DIZYsw
	49YfUel6F5Eir+Nbu+m4MuhJ41vLfAPacGNPZVnoY3KW9hTRmPUCTnRtT4T3qe82axwN
	qGWQ==
X-Gm-Message-State: AHQUAuYG48RbnDWkHsatMtN4JqqXIhBIEVa29E8/WWxKCpQAb/OTDyDg
	FAKTDo2XVrUtTKY8Xd1k53vZbANscdAAXtYMNn0amQ==
X-Received: by 2002:a54:4d81:: with SMTP id y1mr2898702oix.18.1549380259751;
	Tue, 05 Feb 2019 07:24:19 -0800 (PST)
MIME-Version: 1.0
References: <20190131112240.8395-1-peter.maydell@linaro.org>
	<20190131112240.8395-3-peter.maydell@linaro.org>
	<20190205161609.1640f733@Igors-MacBook-Pro.local>
In-Reply-To: <20190205161609.1640f733@Igors-MacBook-Pro.local>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 5 Feb 2019 15:24:06 +0000
Message-ID: <CAFEAcA-BP6Oucy8BVr2EfXKFbC-1B5+SkqYmr5+Vc1Em1k0f9A@mail.gmail.com>
To: Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-arm] [PATCH 2/5] hw/arm/boot: Factor out "direct kernel
 boot" code into its own function
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
Cc: Hongbo Zhang <hongbo.zhang@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xn39gkdlDCEB

On Tue, 5 Feb 2019 at 15:16, Igor Mammedov <imammedo@redhat.com> wrote:
>
> On Thu, 31 Jan 2019 11:22:37 +0000
> Peter Maydell <peter.maydell@linaro.org> wrote:
>
> > +void arm_load_kernel(ARMCPU *cpu, struct arm_boot_info *info)
> > +{
> > +    CPUState *cs;
> > +    AddressSpace *as = arm_boot_address_space(cpu, info);
> > +
> > +    /*
> > +     * CPU objects (unlike devices) are not automatically reset on system
> > +     * reset, so we must always register a handler to do so. If we're
> > +     * actually loading a kernel, the handler is also responsible for
> > +     * arranging that we start it correctly.
> > +     */
> > +    for (cs = first_cpu; cs; cs = CPU_NEXT(cs)) {
> > +        qemu_register_reset(do_cpu_reset, ARM_CPU(cs));
> > +    }
> Should we move this hunk to cpu code instead, like it's done for x86?

I don't know how x86 does it, but CPU reset is a mess, so if
we can clean it up that would be nice. Most of what do_cpu_reset()
is doing here is handling image load though, which doesn't seem
to me to fit very well in the CPU code: it's pretty much what
hw/arm/boot.c's job is.

I'd rather do that in a different patchset, though: this is just
a code movement refactoring.

thanks
-- PMM
