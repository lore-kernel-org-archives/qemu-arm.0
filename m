Received: by 10.25.0.147 with SMTP id 141csp1600084lfa;
        Tue, 28 Feb 2017 14:52:36 -0800 (PST)
X-Received: by 10.55.113.129 with SMTP id m123mr6066333qkc.47.1488322356275;
        Tue, 28 Feb 2017 14:52:36 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y36si2673378qty.52.2017.02.28.14.52.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 28 Feb 2017 14:52:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37523 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ciqdF-0007Ih-HC
	for alex.bennee@linaro.org; Tue, 28 Feb 2017 17:52:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41104)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ciqdA-0007H1-FG
	for qemu-arm@nongnu.org; Tue, 28 Feb 2017 17:52:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ciqd9-0002IO-Np
	for qemu-arm@nongnu.org; Tue, 28 Feb 2017 17:52:28 -0500
Received: from mail-wm0-x233.google.com ([2a00:1450:400c:c09::233]:36185)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ciqd9-0002IA-Gl
	for qemu-arm@nongnu.org; Tue, 28 Feb 2017 17:52:27 -0500
Received: by mail-wm0-x233.google.com with SMTP id v77so96515881wmv.1
	for <qemu-arm@nongnu.org>; Tue, 28 Feb 2017 14:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/GygC4SdtDW8fP6aT3CGCaGkr8ufG5htgxL3pdmqke0=;
	b=Q6xjGR+SS63y+Hevaxs8nPAsYb9CkDhvX5rJtzcllnO6wkvZcazYeiJ0aBodvfrnwg
	2OK3ZqITMvg7Apf4zO/+noojW+mKfLzDRz/BzDo+dYm1ngEFFmje2/jUQwiFr0s0k6WJ
	Wz71UJ6tB08ezBrKkT7JE4NRnt7LEKN9pGZew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/GygC4SdtDW8fP6aT3CGCaGkr8ufG5htgxL3pdmqke0=;
	b=P8VbEOc4AM7AjsIQ4jbZ4eRq+dOJauYAoPUOzinhNREAJTLoEsQIcu56gx+YlivPCE
	y0k6aAn/tYo325Y1dd37rTSGFT/ij8hCeOInzNO+MHPk7MorS8pv5WbbywDbimj5nTMM
	Hh1SXt9eZtjx5toUhWHPiWWvVTGljt4AzWT0hk5R2Zo9wQqUOq1fi1NsA54+OvH3cnru
	P3wGMV+Ag2XRyqwu+VjXsHhOwIqG9wCAkRCg43e33e2vxtFtEsjUQS5jEmt4aXfEgbO+
	0JfEiQpdmlZd9rnQgd9zkXe0S/kD8D4b3JimkFrZpVC1CQ+vsdQykKE1N4IseMUxWw4o
	VAjA==
X-Gm-Message-State: AMke39n0Y6uj/IrjJ/G/f7O1VY7Cr4+M71nYeCwVCMhJDFmdwr97Bpxhwf9K1g/57EEc8hsTKLOdvdy5/F2xzCeE
X-Received: by 10.28.4.10 with SMTP id 10mr739991wme.142.1488322346386; Tue,
	28 Feb 2017 14:52:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Tue, 28 Feb 2017 14:52:05 -0800 (PST)
In-Reply-To: <20170228215801.10472-3-Andrew.Baumann@microsoft.com>
References: <20170228215801.10472-1-Andrew.Baumann@microsoft.com>
	<20170228215801.10472-3-Andrew.Baumann@microsoft.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Feb 2017 22:52:05 +0000
Message-ID: <CAFEAcA_hNXrQ4rihj4-ha+m25pkaf7GqMEa=WL93hF+27hPE1A@mail.gmail.com>
To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::233
Subject: Re: [Qemu-arm] [PATCH 2/2] target/arm: lie more convincingly about
 memory attributes in PAR_EL1
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: X2/E0CSW/UzK

On 28 February 2017 at 21:58, Andrew Baumann
<Andrew.Baumann@microsoft.com> wrote:
> On a successful long-descriptor translation, PAR_EL1 bits 56:63 are
> expected to report the memory attributes of the page. However, the
> page table walker (get_phys_addr()) does not currently retrieve these
> attributes. Rather than leaving these bits clear (which implies
> uncacheable device memory), this change sets them to 0xff, which
> corresponds to write-back cached normal memory.
>
> Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
> ---
> In my (biased!) opinion, this is a better lie to tell for an emulated
> environment. It also happens to un-break the Windows boot process, and
> enable an NT kernel optimisation (DC ZVA for page zeroing).

It's not clear to me that misreporting Device memory as
Normal is any better than misreporting Normal memory as
Device -- at least, it seems like it might break currently
working guests.

I think it would be safer to implement the PAR as "honour the
attribute index bits in page table descriptors and return
the corresponding bits from the MAIR registers".

thanks
-- PMM
