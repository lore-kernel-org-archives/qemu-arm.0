Received: by 10.25.27.66 with SMTP id b63csp2643812lfb;
        Wed, 8 Jun 2016 10:26:06 -0700 (PDT)
X-Received: by 10.237.34.156 with SMTP id p28mr5939500qtc.45.1465406766539;
        Wed, 08 Jun 2016 10:26:06 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s67si1243342qkh.110.2016.06.08.10.26.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 08 Jun 2016 10:26:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58631 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bAhEz-00031t-VO
	for alex.bennee@linaro.org; Wed, 08 Jun 2016 13:26:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52262)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bAhEr-0002zD-QE
	for qemu-arm@nongnu.org; Wed, 08 Jun 2016 13:26:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bAhEq-0002ib-Qs
	for qemu-arm@nongnu.org; Wed, 08 Jun 2016 13:25:57 -0400
Received: from mail-vk0-x22c.google.com ([2607:f8b0:400c:c05::22c]:34121)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bAhEq-0002iV-MR
	for qemu-arm@nongnu.org; Wed, 08 Jun 2016 13:25:56 -0400
Received: by mail-vk0-x22c.google.com with SMTP id e4so20944837vkb.1
	for <qemu-arm@nongnu.org>; Wed, 08 Jun 2016 10:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=aI49dzjC7Uiy1MozncNyltAYolZKe1D+4A1IxsYVeM0=;
	b=Xoqkie/766qxfdxGs2MER7OQxM21psO1keERPcjRHNlV+5WwOesscqYvcl4Y/umcB3
	GTvIA16sfNB9CVCW11krQD0xJEklklViIeYwFK6NHW+DuTlCN9ko3AGxRY8dQxvBRcnS
	7GhRZdVhpwVN/fsWlU2GfjAluBV36QX3NMrz8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=aI49dzjC7Uiy1MozncNyltAYolZKe1D+4A1IxsYVeM0=;
	b=U7mkbXp4ajq37Auwt8pLEH3oEPRRwBXaLcMlA3A1df93hxFAccZXWBk2XLgMjgSx6m
	DBUqeQZIcNsWfBMMqA2WL/UrPv5W5Vx5L2KJaZPb4+Z/67YnKIDn9GmBrXgXvoTVTYIX
	wr0EX2VC//M8U6NC4ZniIPv2GvfJeLLSokWUEaMIA7MCxGOEPr9UOuswvehHcvK6vEBr
	MvQdeBJ3fRRTD7OZFstIEFfqqry48oA9N3R5QoGSSMYq8H6wJ7N8bU04KzzjAlflzpx6
	F3E7WYk1kAAOlHisPzF3wdLyxGoYRqBxvW88OJFQFm1GZZBc5B7uTYwD/B4jgR+G47a5
	jPDw==
X-Gm-Message-State: ALyK8tIzvGvzr+oSs6GnuFHv2GXhVBGIRPf6W3HiWBQSWKCjOSupvhbhoc74FYGQzrgA4peZ6/PzVhnDiEGlA/RS
X-Received: by 10.31.228.133 with SMTP id b127mr2812497vkh.90.1465406756064;
	Wed, 08 Jun 2016 10:25:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.97.68 with HTTP; Wed, 8 Jun 2016 10:25:36 -0700 (PDT)
In-Reply-To: <20160608165500.GN18662@thinpad.lan.raisama.net>
References: <1465226212-254093-1-git-send-email-imammedo@redhat.com>
	<1465226212-254093-10-git-send-email-imammedo@redhat.com>
	<20160608165500.GN18662@thinpad.lan.raisama.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 8 Jun 2016 18:25:36 +0100
Message-ID: <CAFEAcA_p_1wfG18U-zttQG4fXXJy6nbFcUL0s6piyLtwn1MB-g@mail.gmail.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22c
Subject: Re: [Qemu-arm] [PATCH 09/10] arm: virt: parse cpu_model only once
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	QEMU Developers <qemu-devel@nongnu.org>, Blue Swirl <blauwirbel@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2j1D2J//yaak

On 8 June 2016 at 17:55, Eduardo Habkost <ehabkost@redhat.com> wrote:
> On Mon, Jun 06, 2016 at 05:16:51PM +0200, Igor Mammedov wrote:
>> considering that features are converted to
>> global properties and global properties are
>> automatically applied to every new instance
>> of created CPU (at object_new() time), there
>> is no point in parsing cpu_model string every
>> time a CPU created.
>> So move parsing outside CPU creation loop and
>> do it only once.
>> Parsing also should be done before any CPU is
>> created so that features would affect the first
>> CPU a well.
>>
>> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
>
> Peter, do you prefer to get this included through my tree with
> the rest of the series, or wait to included it in your tree after
> the other patches get merged to master?

Seems easiest for you to take it.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
