Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp563700wrq;
        Mon, 4 Jun 2018 05:44:54 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKfnS66pQhhwtU/VZ0fhQM6UyFinJsgEtMJ1eVhOhDK1IBRJoGIbOYHoL19J6YCVRgZcJbs
X-Received: by 2002:a37:10c4:: with SMTP id 65-v6mr18836389qkq.31.1528116294439;
        Mon, 04 Jun 2018 05:44:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528116294; cv=none;
        d=google.com; s=arc-20160816;
        b=TYVdwbvSouCs8xQnFa50drhf7SAl3KisIIMWa+vqRTmQwfpcDVUHwI0BYbMoPY5lij
         P7JmmfInvFQ1aUDNm6j+uKLv2M+muvDUyBuz6SXFjaZ1/zPQHMeOXuD1IOFc3bGqUbnI
         3kttKzG1IYf9Fz4GjTwhyBFAMlCVepBqpRiJmZDWdmMfjUnqhG8VAt+hk7N/cJoWtcp7
         KgN9Z/WZE2pcIAUvNrDUQh6I3C1nQIRBYlHRn++slSe3YZKvro3auzJ+5fHhmAZuHLry
         JRFS22E9cIzRD0+x+gvSOHzZqJjV4FGbdt5zJoXbTJZiL7EYZmEifJnnP7R6X73X6sBH
         EKLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=3SJWVQkilxAKuHnt4eKkLwfnpLMVZPLmzEJkH5Y8ELQ=;
        b=XI0UeDDpQ24uFnDVpTJfafDr4Va6YEBv7b3JP5Yx20Pp//RX1D0yD7m4v+TxUgBWYx
         yuClES0LFmYMCKZFeU+5x1ODcJI4woNGadAOTX0vP1lh0eURr2dnLWMhqofSdXlzrdhR
         ZhY15g7l+voo20FHBHNcsmYlcBB2NrARb1jARq92xZCkz5WuyuvvX7i0ddKI+BC/+/6V
         +qMhBagYF/iVGXLOTcQyqzRbwujbvCvJmDgk0re5F+JWm7/eEm3/cMLeBLEz0NSsf8ko
         /oNU4LXyjhDH2cU0eiplQKMx0HWGCM8876nd1EyCyDggvfqpuadHur8Hj0u5GHGmEQ2z
         /kgA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WjbH7Dd2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g25-v6si4863245qtf.30.2018.06.04.05.44.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Jun 2018 05:44:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WjbH7Dd2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39592 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fPoqz-0007vi-Vf
	for alex.bennee@linaro.org; Mon, 04 Jun 2018 08:44:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55963)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fPoqr-0007uv-6g
	for qemu-arm@nongnu.org; Mon, 04 Jun 2018 08:44:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fPoqq-0005SC-7g
	for qemu-arm@nongnu.org; Mon, 04 Jun 2018 08:44:45 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:40337)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fPoqo-0005P3-Md
	for qemu-arm@nongnu.org; Mon, 04 Jun 2018 08:44:44 -0400
Received: by mail-oi0-x244.google.com with SMTP id f79-v6so14317978oib.7
	for <qemu-arm@nongnu.org>; Mon, 04 Jun 2018 05:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3SJWVQkilxAKuHnt4eKkLwfnpLMVZPLmzEJkH5Y8ELQ=;
	b=WjbH7Dd29Vpgqcotzhz7Iz8DMJf7KM51mbL9aRr4jzvgVVxm55OPrD7aFXJFP5nG8f
	tSB7VbpNrMWx3KwpmdMctKbXtVSQ2hqGwk/gtAwsrS0uM+eCXvDarsucZty3Bmmzz/gt
	+O2qAtD796HR5S6yGulofzPoTJH8T7cxJEZPc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3SJWVQkilxAKuHnt4eKkLwfnpLMVZPLmzEJkH5Y8ELQ=;
	b=oSzK68AKKx2/L9i9GafmPR7RDgPL1LXEybUVWvzry2V49PNUXDpPkYZpjvNP52VsPM
	2NxR5VMV2OK/OVWag8xaGDJaXA85ext3AkRdd9HuCY5rc6iq3AkIvqNOX/iVCpRM1oZk
	/yBtYfZg/FwHiu6DMKtCO6U+9tT1yvDgFjiaZZVS6nBpeLXXzuY3xGySgZnRnEUKzMx7
	BULCWu0y7qYbomKlDitWkUm4/y2C/s6p4lExcOBRP2ipPabb66A8Dsvgc3dkdUH85AO4
	LRTQL9CduDkREGUQu39IOiBrgBTS+C0vWY2QHCW72mC6XaYuBaC+Pze3XUijwYL2vtGG
	uwCA==
X-Gm-Message-State: APt69E1hBHU9drAbfrx32r0PkGGut1vVGkE23PQ/hDlSMXuqDxvKTKxP
	9DU05x1+yAy1zLoGOkmEa6WbeA9uheuW18jpU7QTHA==
X-Received: by 2002:aca:bd84:: with SMTP id
	n126-v6mr2095090oif.337.1528116281984; 
	Mon, 04 Jun 2018 05:44:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP;
	Mon, 4 Jun 2018 05:44:21 -0700 (PDT)
In-Reply-To: <0184EA26B2509940AA629AE1405DD7F201CAF085@DGGEMA503-MBX.china.huawei.com>
References: <0184EA26B2509940AA629AE1405DD7F201CAF085@DGGEMA503-MBX.china.huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jun 2018 13:44:21 +0100
Message-ID: <CAFEAcA_Su0SuR9Q_ao_9G9_VQ5MtoaK1ZLJstL=yWfe0N9Pg5A@mail.gmail.com>
To: gengdongjiu <gengdongjiu@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH RESEND v1 0/3] add support for
 VCPU event states
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
Cc: "famz@redhat.com" <famz@redhat.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Linuxarm <linuxarm@huawei.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"james.morse@arm.com" <james.morse@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JtCcKG9NWGGI

On 1 June 2018 at 15:16, gengdongjiu <gengdongjiu@huawei.com> wrote:
> Hi Peter,

>> You should wait for that to get into master (it is in Paolo's most
>> recent patchset but that has an issue with a different patch, so
>> is waiting on Paolo to do a respin). Then you can base on that. At
>> that point a simple script update should work fine (if you need
>> anything in rc7 that wasn't in rc6).
>
> Ok, got it. Thanks a lot for the explanation, I will wait for your
> patch[1] merge into master and based on it.

The rc6 header update is now in QEMU git master.

thanks
-- PMM
