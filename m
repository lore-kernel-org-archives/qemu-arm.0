Received: by 10.80.166.35 with SMTP id d32csp184839edc;
        Tue, 11 Oct 2016 13:18:38 -0700 (PDT)
X-Received: by 10.200.39.29 with SMTP id g29mr4874536qtg.31.1476217118783;
        Tue, 11 Oct 2016 13:18:38 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h51si2260981qth.83.2016.10.11.13.18.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 11 Oct 2016 13:18:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57820 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bu3VW-0008HP-63
	for alex.bennee@linaro.org; Tue, 11 Oct 2016 16:18:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45147)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bu3VO-0008FM-BM
	for qemu-arm@nongnu.org; Tue, 11 Oct 2016 16:18:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bu3VN-0000UD-77
	for qemu-arm@nongnu.org; Tue, 11 Oct 2016 16:18:30 -0400
Received: from mail-vk0-x232.google.com ([2607:f8b0:400c:c05::232]:33872)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bu3VM-0000U7-Po
	for qemu-arm@nongnu.org; Tue, 11 Oct 2016 16:18:29 -0400
Received: by mail-vk0-x232.google.com with SMTP id b186so31972010vkb.1
	for <qemu-arm@nongnu.org>; Tue, 11 Oct 2016 13:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=NOK/WBklKbaT3Bx7zKy8WGafhvHamxEw9wELu2TYxQ0=;
	b=il7UEEtjU1+z3Qbo0o9zRNye4n6chZxnLoVSnL8Mgyx8xIoxUIDnJjtx9iwkb4bXM+
	XuCleuSTFfvWwRfH+YFy04XMZN+QDrTHi10Drmg2HIqZRNLEk6TkJ+SwztGAwEBYXr1c
	QQpHx6/IFvSNpF4+uD7Y/IGeY+zxWP3MucrgU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=NOK/WBklKbaT3Bx7zKy8WGafhvHamxEw9wELu2TYxQ0=;
	b=Jyl/qWK4ESQSzZkN1p5H2zTcDHilgj8ynrm32qXxwjDhBeTafIPSa9L5rLZEnMw8gM
	gnP1ogxPUMMc19+XLtXWucsSnHq2/lMXUFzkpPdWmLYsUg83uWMFZmNifTT9H/XgvJvw
	R2sDf9b7TTcemD9fhnxUj+gqXIsyrmHNcaKLr2w4j0DOskjxIkrx5piaFAYnhyVcmsGB
	DE8yoQLlMr/MwJ+zhYpdbgUzTHXOd9dren12pCbT8FfNOw21/RTviFyKfmCunlxlQSGL
	z2Mi7wVmG61Ywh8Cvyl0iHxY0Sg+r6mTt9RTqf7iqq1tauWI0b+6RhCmOiB2CPNGI/Id
	C9rg==
X-Gm-Message-State: AA6/9RmmHOomLOOYN5q4pmTIxrwvZHlvXj0R3RPojPM9z3AqFO2y0X4gZkCWSobyeoAVWQjcbhgR1v2MHHhdWHKz
X-Received: by 10.31.64.75 with SMTP id n72mr3997588vka.170.1476217108208;
	Tue, 11 Oct 2016 13:18:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Tue, 11 Oct 2016 13:18:07 -0700 (PDT)
In-Reply-To: <20039503-ebed-fe18-be17-78d39643c9af@twiddle.net>
References: <1476205699-28857-1-git-send-email-peter.maydell@linaro.org>
	<20039503-ebed-fe18-be17-78d39643c9af@twiddle.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Oct 2016 13:18:07 -0700
Message-ID: <CAFEAcA9s-mWFzqFdo81YOEJ=eU3oRtw8SA4QbkZ3kOKuNPcfhQ@mail.gmail.com>
To: Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::232
Subject: Re: [Qemu-arm] [PATCH v3 0/7] Runtime pagesize computation
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
Cc: Patch Tracking <patches@linaro.org>,
	Vijaya Kumar K <Vijaya.Kumar@caviumnetworks.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, paolo@archaic.org.uk,
	Laurent Desnogues <laurent.desnogues@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ERnG3qXbNVD1

On 11 October 2016 at 12:20, Richard Henderson <rth@twiddle.net> wrote:
> On 10/11/2016 12:08 PM, Peter Maydell wrote:
>> I would ideally have liked to finalize things much later, but
>> this is in practice hugely difficult because so many things
>> (in particular all the address space/memory system code)
>> assume the target page size is known.

> Unfortunate.  I suppose that 4k is still better than 1k, but
> I was hoping to get 16k or 64k (or higher) when the OS is
> configured to use such.  I.e. totally dynamically configurable
> upon write to the appropriate cpu register.

I think that would run into problems with migration:
the migration stream all works in guest-pages of ram and
a mismatch means migration doesn't work.

> Given how the memory subsystem already dynamically reconfigures
> itself for changes in address_space topology, I assumed page size
> changes would be trivial and fall out naturally.

The trouble is that all the data structures work in terms
of page sizes (even though we support sub-page allocations
those are still done by carving up a page-size chunk).
It could probably be done but it looked like a gargantuan
task so I decided this was a better compromise.

thanks
-- PMM
