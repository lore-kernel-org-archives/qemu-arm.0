Received: by 10.103.98.197 with SMTP id w188csp387962vsb;
        Tue, 21 Feb 2017 05:34:48 -0800 (PST)
X-Received: by 10.200.38.247 with SMTP id 52mr15964407qtp.55.1487684088446;
        Tue, 21 Feb 2017 05:34:48 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 31si15111732qtz.162.2017.02.21.05.34.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Feb 2017 05:34:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44730 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cgAad-0003ym-Rx
	for alex.bennee@linaro.org; Tue, 21 Feb 2017 08:34:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53463)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cg9yq-0001Xf-6C
	for qemu-devel@nongnu.org; Tue, 21 Feb 2017 07:55:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cg9yo-0005CG-SQ
	for qemu-devel@nongnu.org; Tue, 21 Feb 2017 07:55:44 -0500
Received: from mail-wr0-x230.google.com ([2a00:1450:400c:c0c::230]:34438)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cg9yo-0005Bw-IV
	for qemu-devel@nongnu.org; Tue, 21 Feb 2017 07:55:42 -0500
Received: by mail-wr0-x230.google.com with SMTP id z61so81304112wrc.1
	for <qemu-devel@nongnu.org>; Tue, 21 Feb 2017 04:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=olAY4t4ZTWYYhtnBat6/dqaRF+qPRMTgocX6UIrLe4w=;
	b=fTy4aeBXagekJNq5TWxdlZtNdMwLhaczS7x1rd4Tp02PowwKnCPXpi8XX4nInfvh39
	koQpGIPsgdJXWTuLaKpDzWrLzdT+u6aCxoVXs+cMt3jYAsuzSDZmMUlb2aGcrgbAUZD4
	2DegtOGpEkLGOa3t+XOjmFQ9jwgoMeH6qPgLE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=olAY4t4ZTWYYhtnBat6/dqaRF+qPRMTgocX6UIrLe4w=;
	b=Lpub+uWmSuw8fRRmFFVfpcBzJW/sT0wrMZkv1hygn5GdLErWm6GN3Z2/4y9uTWy95K
	UhAIo+hbTY5YzqJ0BN9yLjg6cNM1Cd7jfdwWMMIgbAnq1SDcVkOJOunbUfDvNlqsFPwp
	eLW1AmAYgpLaoQ1e3g6ipkDlLH+L5pipWy6W+MuBzXwcuN3183w5s9W0zGX3kIa3PMpV
	8wxtfpk9UzhYcgSfCD74R0LxSTmq3Mab29oz9SJFUy5oTchKcqARaBZ8eiAeRYmjVbpn
	RNf3GpvhfFoQyxGL+l+oqNwOxhiWS+iK7NEaL9Lk0q9g9dehC1FfXu9IxIdGt69Qk+NT
	18pQ==
X-Gm-Message-State: AMke39nGiv/EWeaMvRtIK9zrElczARtTpgMU/+68XkqQilvLGQ6yzVK46zhN46K/9BiphQJ72aCCjHLBrJg9XL+A
X-Received: by 10.223.150.209 with SMTP id u75mr2791241wrb.195.1487681741298; 
	Tue, 21 Feb 2017 04:55:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Tue, 21 Feb 2017 04:55:20 -0800 (PST)
In-Reply-To: <20170221134416.5803b3e5@nial.brq.redhat.com>
References: <1487357795-52614-1-git-send-email-imammedo@redhat.com>
	<CAFEAcA9JWzUEmGa2Wxd5xPE4dVknOKBkt=wMda7CAgxzrgOc+w@mail.gmail.com>
	<20170220195500.332a4844@nial.brq.redhat.com>
	<CAFEAcA-VAY8LM+8jE4B-L=0QdcY5FLvwmwGVbUhcXjnC9-AW+w@mail.gmail.com>
	<20170221134416.5803b3e5@nial.brq.redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Feb 2017 12:55:20 +0000
Message-ID: <CAFEAcA-MggU5T1fO8GonkSpLF0SNe0jtygEHtEBkpWC8hyShSw@mail.gmail.com>
To: Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c0c::230
Subject: Re: [Qemu-devel] [RFC 0/3] generalize parsing of cpu_model
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Stefan Hajnoczi <stefanha@gmail.com>,
	"patches@linaro.org" <patches@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	Marcel Apfelbaum <marcel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: khBIi5n0d0Kt

On 21 February 2017 at 12:44, Igor Mammedov <imammedo@redhat.com> wrote:
> If we are to ditch legacy approach,
> It would be cleaner for SoC to have fixed/unconfigurable
> CPU type and each SoC being modeled as a separate
> QOM object/type that would instantiate CPU directly
> with QOM style, using type name, like:
>
>     cpu = object_new(TYPE_FOO_CPU)
>     set props if necessary
>     object_property_set_bool(cpu, true, "realized", &err)
>     object_unref(cpu)
>
> or similar with extra check/logic on top of plain object_new()
>
>     prepare cpu_opts for cpu type TYPE_FOO_CPU
>     cpu = qdev_device_add(cpu_opts)
>     object_unref(cpu)
>
> instead of using cpu_init/cpu_foo_init/cpu_generic_init()
> with cpu_model parsing logic which is not really needed
> there as concrete SoC model knows exact CPU type.

Mmm, I think that's probably best. Would the end-user
still be able to set CPU properties if necessary via
a -global command line switch (since -cpu type,foo=on
wouldn't work)?

(I just worry slightly that we might have users doing
weird things which we'd break.)

thanks
-- PMM
