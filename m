Received: by 10.25.77.65 with SMTP id a62csp312557lfb;
        Fri, 17 Feb 2017 11:06:47 -0800 (PST)
X-Received: by 10.200.34.81 with SMTP id p17mr8520785qtp.264.1487358407393;
        Fri, 17 Feb 2017 11:06:47 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 33si8075563qth.307.2017.02.17.11.06.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 17 Feb 2017 11:06:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55332 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cenri-0002at-SS
	for alex.bennee@linaro.org; Fri, 17 Feb 2017 14:06:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60797)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cenqi-0002ZS-1c
	for qemu-devel@nongnu.org; Fri, 17 Feb 2017 14:05:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cenqg-00055Z-Vt
	for qemu-devel@nongnu.org; Fri, 17 Feb 2017 14:05:43 -0500
Received: from mail-wr0-x234.google.com ([2a00:1450:400c:c0c::234]:33188)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cenqg-00054b-In
	for qemu-devel@nongnu.org; Fri, 17 Feb 2017 14:05:42 -0500
Received: by mail-wr0-x234.google.com with SMTP id i10so35112385wrb.0
	for <qemu-devel@nongnu.org>; Fri, 17 Feb 2017 11:05:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nuTw+XGzJOiRh+i6yOGjuI1f3k2P6dGjz2SUa+8SM8A=;
	b=dfPvqTedOOPGWBtET7Ak4YJPF4rfHeGqERnBjzB0iqkmRkD3ycimG4JiYMQcr258Iu
	btfufflBukNfmtcokVMSznQR9L9uKcel2hoz0rZQHbCCKOpsXgN/qbuXNz9m0WQ9viKq
	TAm5ZR8+f2zs8LddtO6GE4afKfhKNiaTSLrb4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nuTw+XGzJOiRh+i6yOGjuI1f3k2P6dGjz2SUa+8SM8A=;
	b=sfpPBgO1/5hed8IULJOysAtYN6G6ZKXHu9fC4lycpRbkaiqOEleAacwrMWn7OxW4Aq
	ls/9wXM3OPSiykiX2OHGm4GBjtL+wXVx7VPvv73rVGZBCnWkXYdZq3UhbIRhyUr/jBKw
	JyXImI5qS2KL0BGGaYJ4SwIQO/guvArJEgYYOwhKzA4VQUriFRQ2iVVd1l8Ag+hAjnC7
	Zw3yhKCB56E1MDmdoroYnK/9TWUHV7PVYFaTLT6/M7sYobK8X3zECqXtia3e2V6Ctxtu
	GIGkS2fcyDWGl8szIUkh8eRJnmpxmUlp0v0Wpyfmd1eQzGz4kMsIPr1zVq3ltDiQHJv/
	oruw==
X-Gm-Message-State: AMke39m3Vi7jRGNejhUx/x33nxxK7yM9OSwhy+2jhNX7YipdrpptYaLOkb0gjvEf7EMsxSKBGvWsUK1X+ytwqt4S
X-Received: by 10.223.152.175 with SMTP id w44mr8507523wrb.151.1487358341319; 
	Fri, 17 Feb 2017 11:05:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Fri, 17 Feb 2017 11:05:20 -0800 (PST)
In-Reply-To: <1487357795-52614-1-git-send-email-imammedo@redhat.com>
References: <1487357795-52614-1-git-send-email-imammedo@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Feb 2017 19:05:20 +0000
Message-ID: <CAFEAcA9JWzUEmGa2Wxd5xPE4dVknOKBkt=wMda7CAgxzrgOc+w@mail.gmail.com>
To: Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c0c::234
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
	"patches@linaro.org" <patches@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	Marcel Apfelbaum <marcel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EODA0Z9bT1TA

On 17 February 2017 at 18:56, Igor Mammedov <imammedo@redhat.com> wrote:
> Some callers call CPUClass->parse_features manually to convert
> '-cpu cpufoo,featurestr' string to cpu type and featurestr
> into a set of global properties. And theni do controlled
> cpu creation with setting properties and completing it with realize.
> That's a lot of code duplication as they are practically
> reimplement the same parsing logic.
>
> Some don't and use cpu_generic_init() instead which does
> the same parsing along with creation/realizing cpu within one
> wrapper.
>
> And some trying to switch to controlled cpu creation,
> implement object_new()/set properties/realize steps
> but forget feature parsing logic witch lieads to 'bugs'
> commit 00909b585 (hw/arm/integratorcp: Support specifying features via -cpu)
>
>
> This series moves -cpu option parsing to generic machine code
> that removes a little of code duplication and makes cpus creation
> process more unified.

This API seems a little awkward for the SoC case, where
the board model doesn't actually know what the default
CPU model or the valid CPU models are, because it just
wants to say "create me a BCM2836 SoC" and let the SoC
object deal with determining whether it's always a cortex-a15
or if it might allow some user configurability either in
cpu choices or in optional flags.
Any thoughts about that use case?

(The stm32f205 SoC object has a "cpu-model" QOM property
that the board sets, but I think that's as much because
we somewhat awkwardly need to pass it into armv7m_init()
as a deliberate design choice.)

thanks
-- PMM
