Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp3853571wrd;
        Sat, 25 Aug 2018 18:14:40 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdYviKg26xrZlhHp4Q5/IIzfyuWZcDLDLoWd/WbJTY+zFd3qnTJpfoeL+oF6fd/wIZuQCSU0
X-Received: by 2002:ac8:302b:: with SMTP id f40-v6mr8300234qte.217.1535246080036;
        Sat, 25 Aug 2018 18:14:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535246080; cv=none;
        d=google.com; s=arc-20160816;
        b=xcbWlAPZZTfJLTqfB6bN2ucxixb9FI+DYF8lATHRWsAhP6YjEx7+LQxe08quSqvC3b
         F+pIjS2ZPSVuOG6ex5PSq3T/H+XO9gsAdvNTMDvdy1BbMRXn2Sgh4I+cvSIIT9mTgoed
         FAcIaPDa8uIf6X18FNDFlvBJkTypNOwgMTkLFeP5YXZAF1FIJyT68/FHNcf7KMKptQZ/
         JSYmJ/agMt29WlgQJYncL/Rb8uRVTNfaIDfLx4wddtlT7Tq4+KO1soyP0YDPMy/Tanlx
         xh9Cvz9ehxDqIOcQB16DawV9Sj4EgSMYXjct/EtUJPSVZ+RarfaWBubY+aPmQzupjlGj
         +CXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature
         :arc-authentication-results;
        bh=Qq8x4HOHEKvmCJapOZCScTecoDGAbgBVYegXrzdttWY=;
        b=PHxHhoXs4CuHVld6gY9CRHuAucmxgVGQAAinSw4P8pDKBuRyB2NL1Gzz7NRLrxgBsX
         1YiMX3QUDoEAfik18i4v+qDUHMpU01iT678vTy8Y0ibfm5oFDEUPsUplKndddTa+brPL
         t/XP8x37XiSuEVunADuty2yAcZLa6yofYBAUkDar8nZXCtQQwucaf6mnnJjA3W+j4Y/2
         pLjz3u92BkXe3NeSqWgZWg5QWCMv2qnHg9M66jfEVR0O/tnsto+nrt+SRyCXJhVkPihX
         4N83jaz9l/ahWYQEO6P4UTiKFGfvgfT88slIcO0Q+M7C12hAfz+brXRE+uBcV852IBbx
         HWJA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=RTn5N4ax;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o9-v6si4689821qvn.224.2018.08.25.18.14.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 25 Aug 2018 18:14:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=RTn5N4ax;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47564 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ftjdW-0003ez-RV
	for alex.bennee@linaro.org; Sat, 25 Aug 2018 21:14:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55139)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1ftjdF-0003e3-Ow
	for qemu-arm@nongnu.org; Sat, 25 Aug 2018 21:14:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1ftjdF-0000Le-2A
	for qemu-arm@nongnu.org; Sat, 25 Aug 2018 21:14:21 -0400
Received: from mail-qt0-x22e.google.com ([2607:f8b0:400d:c0d::22e]:42093)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <joel.stan@gmail.com>)
	id 1ftjdC-0000Is-EB; Sat, 25 Aug 2018 21:14:18 -0400
Received: by mail-qt0-x22e.google.com with SMTP id z8-v6so14290815qto.9;
	Sat, 25 Aug 2018 18:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Qq8x4HOHEKvmCJapOZCScTecoDGAbgBVYegXrzdttWY=;
	b=RTn5N4axQYQO9TWYnjffQSz/KUycc4zAz40MR3cuPjHaAkQtsGY2FxuwLjUvemus/e
	8DlWedkWKSXMtoP2O4410kcWIWuGwUfYtGllnvVIZLijoy4iBSsy1GoC4VK5hR/FXgXW
	FYt09bIHpTXLrsyObbql1kweSGqH/w5J9LOxo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Qq8x4HOHEKvmCJapOZCScTecoDGAbgBVYegXrzdttWY=;
	b=MzkEDB4rCUsP8BizBdJ/liUYuPgo7vOJZctfS6T+YZft5X9HmP55a5UyaN657o1tH7
	Q91VBizgRBViEyT/yJx/ZHld1vo3RD3iK10t3s6LK3UjnRT9ns5XnhGrngZHcT67y0Lc
	unKC9qmZX2uNy6NOK+YSPfvs3I7kXOM6/vAZzvLEIV/hBGySxJDU6iqqekGXW09f+ddF
	gO6FwjdQ9W9m/ap0Qy+HEc95IR0DYXufFTH2thlkpTMp3t4KBiE/TbBQ/KkFCGGCF/B6
	if1OsTaWj0Ble7eS5Kkm0MYUE3ne7Hb/5p1zmW8uZcIKFQ+WutTMrJeW/FxzfJSPsk92
	vt/A==
X-Gm-Message-State: APzg51D5PPTi/o0m8nnmyy7u/mbi0VGg6U/MjFBD2hfZB0F+R2hwTeKe
	3lc1kRFAIF3iaKGTse119AFU9RTqOVZk0/roxEg=
X-Received: by 2002:a0c:d7c3:: with SMTP id g3-v6mr7978979qvj.85.1535246057633;
	Sat, 25 Aug 2018 18:14:17 -0700 (PDT)
MIME-Version: 1.0
References: <20180803052137.10602-1-joel@jms.id.au>
	<20180803052137.10602-4-joel@jms.id.au>
	<CAFEAcA9o8JE-ZE3SLBTFrrNCgtJ85L6T7opPZnd0pJaZVkRdVA@mail.gmail.com>
In-Reply-To: <CAFEAcA9o8JE-ZE3SLBTFrrNCgtJ85L6T7opPZnd0pJaZVkRdVA@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Sat, 25 Aug 2018 18:14:06 -0700
Message-ID: <CACPK8XdaT4tHDqFe92hfKjKWaTtnXxA1MW-=noLVkTM+G1EZYA@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::22e
Subject: Re: [Qemu-arm] [PATCH v4 3/3] arm: Add BBC micro:bit machine
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
Cc: Stefan Hajnoczi <stefanha@gmail.com>,
	=?UTF-8?Q?Steffen_G=C3=B6rtz?= <contrib@steffen-goertz.de>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Jim Mussared <jim.mussared@gmail.com>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zS5tzTE+34xO

On Thu, 16 Aug 2018 at 07:12, Peter Maydell <peter.maydell@linaro.org> wrote:

> > +static void microbit_machine_init(MachineClass *mc)
> > +{
> > +    mc->desc = "BBC micro:bit";
> > +    mc->init = microbit_init;
> > +    mc->max_cpus = 1;
> > +}
> > +DEFINE_MACHINE("microbit", microbit_machine_init);
>
> Your subclass of TYPE_MACHINE has extra state, so it can't
> use DEFINE_MACHINE (which creates a subclass whose instance_size
> is the same as the parent TYPE_MACHINE). You need to do this
> longhand:
>
> static void machine_class_init(ObjectClass *oc, void *data)
> {
>     MachineClass *mc = MACHINE_CLASS(oc);
>
>     mc->desc = "BBC micro:bit";
>     mc->init = microbit_init;
>     mc->max_cpus = 1;
> }
>
> static const TypeInfo microbit_info = {
>     .name = TYPE_MICROBIT_MACHINE,
>     .parent = TYPE_MACHINE,
>     .instance_size = sizeof(MICROBITMachineState),
>     .class_init = microbit_class_init,
> };
>
> static void microbit_machine_init(void)
> {
>     type_register_static(&microbit_info);
> }
>
> type_init(microbit_machine_init);
>
>
> (code untested but should be correct; compare against other boards.)

Thanks for spelling it out. I spent a decent chunk of time looking at
other boards, and this aspect of Qemu still baffles me.
