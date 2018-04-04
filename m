Received: by 10.28.71.155 with SMTP id m27csp4886122wmi;
        Wed, 4 Apr 2018 06:44:37 -0700 (PDT)
X-Google-Smtp-Source: AIpwx48Lab2W2K/bnJI1B2S30xtx+gfoAP0+gOofk5Q8CyjWopiMk1+rfuQLm4avW7GZyOvYNlMy
X-Received: by 10.55.49.19 with SMTP id x19mr25219281qkx.167.1522849477586;
        Wed, 04 Apr 2018 06:44:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1522849477; cv=none;
        d=google.com; s=arc-20160816;
        b=JS1AafpJn5RmOegdlbZKQtCEvL1Gh4OONs8YcWk1l5R06WEiChK1gtTsBuiT7P2Hfo
         auVztqXGWYXvr21Rh/fMtKRQYGkZJUnS9g2AZfZH8FsMTRaeP2Sk+MG34HdUCf9ivGiv
         VqaCsckeSRGrvXHJ3sC6UJl9lMZdVD38J6SM3nKnulTms/+EHCMeEk3HvaZ8JsutDerW
         B0k202s36W0u3q3tLbuSGE4asj6k61ONrFhZP+LFuAsCutUfZIoQPtDLAQUzZW/thL/y
         cPiRgVrCkx6SCW7QfTMJmNa5fhHFmngMssG4+ujcFmKP+LGSXrU356qip4fWMN6O7JKq
         ICbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=UMXrN8rNbRYiW/3HxA+Geb/Bnirkvpi/NehUbL1VQio=;
        b=qLi/My0yYnpQAEbjQgziS+Dgc2F9q0wKJR9pN3lN1SppZrQpoEZJmVUFEqvFkIrkZb
         xhp910V6TP6C7a01C+BU2PT3y2+uPv/zgDaNbdbLb6EFSD+qDzfSolnV9RXH1+i301cu
         XwBVpTw9/ivRvQveZHB/bMn8VfUP2/H+Wxyv0ewcZWielBIEfEobkpLhGjXVFVBPr0kv
         Ae2sDPBrXmsFtGArs59QhGJI+Jh73n+ze44HmxLM+f192dVgaSzWQCJWuMf9iwcGR5M2
         JxuxFikqiAaZTKnp2Gmln7nNzIPmx+dEdlnt1kERioyWQR5MJLQjHi2vszale+q5E5nv
         +5Uw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=RqIPZKNE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o17si6040173qki.152.2018.04.04.06.44.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 04 Apr 2018 06:44:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=RqIPZKNE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59539 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f3iiL-0000lG-3W
	for alex.bennee@linaro.org; Wed, 04 Apr 2018 09:44:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40760)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f3ii9-0000k1-EI
	for qemu-arm@nongnu.org; Wed, 04 Apr 2018 09:44:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f3ii4-00051Q-IN
	for qemu-arm@nongnu.org; Wed, 04 Apr 2018 09:44:25 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:44566)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f3ii4-00051M-DQ; Wed, 04 Apr 2018 09:44:20 -0400
Received: by mail-qt0-x242.google.com with SMTP id j26so23090673qtl.11;
	Wed, 04 Apr 2018 06:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=UMXrN8rNbRYiW/3HxA+Geb/Bnirkvpi/NehUbL1VQio=;
	b=RqIPZKNEabqaD0ulFACqEzHR1g0KvCGPciAcpo+qDh/i45UO7acdaDLycl8PQOjN3W
	v7gRe4m0IpbbGR5rIgTTrXeGf5lnPSJaBC4lYYZqIWLcbgY6eKcpP4pN4rjdhhmZpT8a
	x0WfBsTj5tdMREAogNs9YOuhTNEc4Xuc6wbBxeWM+5GR7tizLA14blOrm/V4hx93PMSy
	mnT0WQhEhJX49llJuwhvp+t+tVH8DyKKQdb0ZkozFnUVUptIRLJo9ujCcjswYTshWoAJ
	QU1QinQ4gRrfLVgtm4JSTcB4AWSSAubEpaiUX90tc0ru24BQ9qaS2XxJUKUnNzJsHS+i
	Retw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=UMXrN8rNbRYiW/3HxA+Geb/Bnirkvpi/NehUbL1VQio=;
	b=Q5E464KB5wbudD957o4ua6KTlYoQ+2zFggD07Yd3M/6EFgV5a2Y5F+uEKSsGYTdauH
	iH/fTJpHPYy1oVxC4N5L4in0kf+sgWemOTi201SvYPuS84Pe21wG5igOe6Thos8k4dV2
	EzWeUdD819XJ/wrW6Uy6LYL/iciQ4zHlLcJUhb7vBrhFI8sE1Qd/CcexAkODYaoDRXla
	/d8rhqDdXkBXC1NjGkBYcK7TQzgaw+RX8+kzBQcM/kgy+xC28yk5n+iP182KeWGkjmdm
	st50n6PGbnb4SMhRwvWIw7iUvg0VzS+Zg63K7A7yF8rGfBSIeLQo7UHn55TvX/CSvApC
	i6bQ==
X-Gm-Message-State: ALQs6tCXgTNJniwpmxaE4xdv8KTCUdqaHKHCVC+TzgVxEylFY7usD24Y
	Mw35RUm0NlQErOgmK6d2q+w=
X-Received: by 10.237.42.229 with SMTP id t92mr26964331qtd.275.1522849459759; 
	Wed, 04 Apr 2018 06:44:19 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.212])
	by smtp.gmail.com with ESMTPSA id
	f197sm2579513qka.80.2018.04.04.06.44.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Apr 2018 06:44:19 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180319161556.16446-1-peter.maydell@linaro.org>
	<20180319161556.16446-2-peter.maydell@linaro.org>
	<6431180d-fcaa-6a9c-de22-5ded33433be8@amsat.org>
	<CAFEAcA9sAsrcw-AwZU3QW5BQJfi2td3pi8zOS2iVK09D9qAH2g@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <388842e2-fe60-d034-0c43-3a967aa02688@amsat.org>
Date: Wed, 4 Apr 2018 10:44:15 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9sAsrcw-AwZU3QW5BQJfi2td3pi8zOS2iVK09D9qAH2g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: Re: [Qemu-arm] [PATCH for-2.12 1/2] hw/sd/bcm2835_sdhost: Add
 tracepoints
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
Cc: "patches@linaro.org" <patches@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Gerd Hoffmann <kraxel@redhat.com>, Pekka Enberg <penberg@iki.fi>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xEydh5Ea9wTP

On 04/04/2018 08:54 AM, Peter Maydell wrote:
> On 4 April 2018 at 12:42, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>> Hi Peter,
>>
>> On 03/19/2018 01:15 PM, Peter Maydell wrote:
>>> Add some tracepoints to the bcm2835_sdhost driver, to assist
>>> debugging.
> 
>>> +# hw/sd/bcm2835_sdhost.c
>>> +bcm2835_sdhost_read(uint64_t offset, uint64_t data, unsigned size) "offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
>>> +bcm2835_sdhost_write(uint64_t offset, uint64_t data, unsigned size) "offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
>>
>> Can you use the more explicit "size_t" and "%zu" please?
> 
> The argument to the read/write functions which we're tracing
> here isn't a size_t, though (and since it's only ever 1/2/4/8
> it makes sense that it isn't a size_t). What would be the
> point in casting it to an size_t here?>
> A quick grep through hw/*/trace-events suggests we don't
> use size_t for tracing of mmio read/write functions
> in other devices.

Oh... I find using 'unsigned' confusing, but that's fine this way.

Regards,

Phil.
