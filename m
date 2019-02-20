Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp4890683wrx;
        Wed, 20 Feb 2019 11:14:14 -0800 (PST)
X-Google-Smtp-Source: AHgI3Iairh+xihNo5RrAD0ot4F35Rk4GAwfaIVR5DMJaG8ys3sGycWNyKNRqg8KQRywc61d+ZY93
X-Received: by 2002:a0d:d705:: with SMTP id z5mr29543580ywd.400.1550690054269;
        Wed, 20 Feb 2019 11:14:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550690054; cv=none;
        d=google.com; s=arc-20160816;
        b=x+Y34ZnLBJNZPDqsjAKDfsLf1UwHitlzb7Z3Ju7so//Fj09Z+TDGJt4LPk+m6NAVRd
         CIiDGnOIy9rHlH6anIzK6QCGnCGDpCSPY7GcfVqVqh7V9pIpvg1gnnRtuz9VJOPS8IWJ
         vS3C6ZCZnZddRtAxURHk+Enc3lpJd2YpACyhvn7aGX5gWoYm8h6rjAUO1t91n3N3W7I/
         Jv1PUGWX2xfqaeDk8eGVfVZ/VGRtFPKvCN5xpASsQ/lAtN/1M1kDwf1MqPMIVLSsGzuf
         7Cvz/s+Szu9UIGJpsNNf9/IroqwzdnuOEk4A5PQqd5m331G4FP6VMDOLb6P1ufiwPCFt
         i8/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zenwgYJLN4s2VIfnPSUqWoEbUeKyvDB1h+hHxC0VvO4=;
        b=ZioJsXVmba1Mib842aX2XXwLxLg//5EAIj9S/mdN0H+mLEBmkiZMnsKstQz3XzRIMs
         xFe4fkb31TtVAVj7z/Er/vPGaRiNvYbdpkj9LEp/0VFkFk7pF4vTeWM9tcrP+9N0sRvm
         ogwI4qWL5BlpzTAszbQ+2ShVRBqDiI8f5aSSHEgVnrwq118A7XnhxXEi4u05yobMEOG6
         nms9QIvGS8+lepaQZ74r/fs5I1rEFx4kKOtlA3gsaYJooZDw2k7cQ9CfhHWKYsVwkRu7
         h5MQwtrnwE7yRL7sJXe1y5A7PAQdcl/zrFodDU5murSsZJE367jXkMleT3TvxoObwVu2
         AX6A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=sKaWDips;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c3si10162672ywb.237.2019.02.20.11.14.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Feb 2019 11:14:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=sKaWDips;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:46586 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gwXJt-0006Q6-MO
	for alex.bennee@linaro.org; Wed, 20 Feb 2019 14:14:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48122)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gwXJj-0006Ov-Or
	for qemu-arm@nongnu.org; Wed, 20 Feb 2019 14:14:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gwXJi-0001Jr-LL
	for qemu-arm@nongnu.org; Wed, 20 Feb 2019 14:14:03 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:34958)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gwXJg-0001DO-Gf
	for qemu-arm@nongnu.org; Wed, 20 Feb 2019 14:14:02 -0500
Received: by mail-ot1-x341.google.com with SMTP id z19so42143987otm.2
	for <qemu-arm@nongnu.org>; Wed, 20 Feb 2019 11:13:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=zenwgYJLN4s2VIfnPSUqWoEbUeKyvDB1h+hHxC0VvO4=;
	b=sKaWDipsrGD34n7dtLDx5FzYUF4SwpvzL5lRSNX1Um5oGdYOpxMYeS1wCAKk4opC5b
	1O7rWZpLXQrrlV0SdzPPmeswoVlRDTBQW/cjpxDTf7Vty9riMquDpH4AGPut0xdh8+4w
	VELA7ibIzGYe0C1ONgVe6qNRQfcSBr80Hl2WUz5BvSEOJ4wnR6Zn1fmVXgDLX0YWff4B
	ybdaRqHjub3IEI8Mzr8Lu7Qz89RULijPu3aAxmRz5EuZkieRf3t+gquqnExQwg6bKXJ1
	cT2BIVdfZTQlug0KCgWuL4aJFGs8jQFIFE2d4TZSgXj1r1oRXINmyrhA7fXBfeqiLWie
	867A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=zenwgYJLN4s2VIfnPSUqWoEbUeKyvDB1h+hHxC0VvO4=;
	b=tx+Lyhm7hEdw41OkIZErzRojZ6JytEPPu1VJUiw8UDgGJ+7hUeyEVWTi6+E+Wk4qJG
	99YcsQivhvOw6+shTC7576iZi0Pd11lxdWoEC+eHwhl3HBiFkF0xEvP7+la1k96QV5bW
	R/Fyn3IvOiMjPx9jCej2Mz3HqkHbCLMd20H+mjVk50iXgeSMYLsQPodCcac3/IF17Wu+
	siMAi08YGZXJhgbei0dnzRQmdp0UnZBn/tpfPr0qSkDC26OAxsIlVbE5u7zU6MvEa777
	VZsX0fxpRXNUbr1KDF49jmOeclfnnJcizMLzJrCliO5V46KVe8DtJzF8KFq/zAxnAmbJ
	BoiQ==
X-Gm-Message-State: AHQUAubpoYVeYkGAYNOdfOE0UOEzXm0rvP1MtGc4B4f9+8/JUuEj8F88
	stUmFNKoEl1JZRNxYb0rd7QlWyJM21VlBcJSBkLogA==
X-Received: by 2002:a05:6830:d8:: with SMTP id
	x24mr6221484oto.352.1550690034302; 
	Wed, 20 Feb 2019 11:13:54 -0800 (PST)
MIME-Version: 1.0
References: <20190219125808.25174-1-peter.maydell@linaro.org>
	<20190219125808.25174-4-peter.maydell@linaro.org>
	<a2bc1e0a-b3d1-1f5a-d82c-7a3e1f06522f@linaro.org>
In-Reply-To: <a2bc1e0a-b3d1-1f5a-d82c-7a3e1f06522f@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 20 Feb 2019 19:13:42 +0000
Message-ID: <CAFEAcA_mnA36ZcJ9WJh=tA=ZDncD9b==09B_ub3Zfyu-zKpZ+g@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 3/8] target/arm/cpu: Allow
 init-svtor property to be set after realize
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
X-TUID: aiA9RzzMUmxy

On Wed, 20 Feb 2019 at 18:16, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 2/19/19 4:58 AM, Peter Maydell wrote:
> > +static void arm_set_init_svtor(Object *obj, Visitor *v, const char *name,
> > +                               void *opaque, Error **errp)
> > +{
> > +    ARMCPU *cpu = ARM_CPU(obj);
> > +
> > +    visit_type_uint32(v, name, &cpu->init_svtor, errp);
> > +}
>
> Since there's no validation needed, can this use object_property_add_uint32_ptr?

I tried that first, but it doesn't let you set the property,
only read it...

thanks
-- PMM
