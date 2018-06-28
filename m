Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp7625187wrq;
        Thu, 28 Jun 2018 09:31:52 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpePoZWi/kOYVnjvD2AXLruNG2SCKrMdlM/4lNiG+jfLMx+C4snUYmUy+AMKCYH5RzACp9+N
X-Received: by 2002:a37:1a69:: with SMTP id a102-v6mr9847866qka.43.1530203512094;
        Thu, 28 Jun 2018 09:31:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530203512; cv=none;
        d=google.com; s=arc-20160816;
        b=uDe9kiwZdDPoU99l1+MiIVNUpoyE5UwaDkC1e4uNCVe4zGTSkNsxXFpp4JyjIBzhOv
         trp01xYyteP7/V5cfCbAAZFdJEDcgzgGJ5NJh84UdM3Im/ykvxge7VdbSV9gAKc6tmf9
         t5FmvSdXPUWNg8vLkIzVq+EzPtrVzVwh2cAsHtKzmZzdxvEsrlFFA4jebZ9sS5cJc97m
         xn69H3ghSR7J7mXzC/QENhuNQrk/d8bJ+2BXFUnhRi4PKo7hY2HdW3EwLgDj03R37bmb
         2s+HreUEGvH4MuKK62EVk85lfiI1GVNLw+fMg8T6ZqLImYmrs5+6jI5KIMicj/26Se0C
         9w1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=Qxr4jYEJsVfOaPBYX3q/zAsi4KpYQEjBpmLU2yk8LYk=;
        b=tys0puLUF+Rd9IDOjibMz/MlJG76CDZUuUF0JxsUyWJZcTwN0pmitaBIsJkiQy5BWA
         QxJ//Y56tNN+4IqroHfw4XTJvmrujF17h2xIZ4aQTrAJIJMrHrRAA0MIWD2v6STd0Grw
         aDi0tRHY7SAxLQduY7I9HHj6s2moUYBeMZsdZthR9cElor4K9mdMfrwWFbYnr/wjp94E
         4a4vC7t29GyzUC8Rr/J+7ylZe2iMUnOLnkF11YS9wzXM6/TwjuMF1m23qUGAiUjqhUIB
         iCXnOc5WOhLngyvuM3rN6fxxH1X/kSnpSBxGqjG1d6F8hH1sut0yvJCINtU9rr1xFHv+
         e9ZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="E0a4M/ii";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z35-v6si6984782qtb.115.2018.06.28.09.31.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Jun 2018 09:31:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="E0a4M/ii";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37541 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fYZpn-0001i0-Jw
	for alex.bennee@linaro.org; Thu, 28 Jun 2018 12:31:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49373)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fYZpE-0001SP-RK
	for qemu-arm@nongnu.org; Thu, 28 Jun 2018 12:31:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fYZpD-0003OO-VQ
	for qemu-arm@nongnu.org; Thu, 28 Jun 2018 12:31:16 -0400
Received: from mail-oi0-x22d.google.com ([2607:f8b0:4003:c06::22d]:46752)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fYZpD-0003NY-Q4
	for qemu-arm@nongnu.org; Thu, 28 Jun 2018 12:31:15 -0400
Received: by mail-oi0-x22d.google.com with SMTP id y207-v6so5746622oie.13
	for <qemu-arm@nongnu.org>; Thu, 28 Jun 2018 09:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Qxr4jYEJsVfOaPBYX3q/zAsi4KpYQEjBpmLU2yk8LYk=;
	b=E0a4M/iiP0n0KqElTKn3ccHM2+9rnN5ioxV3x//Yqw151mL7jXjwbCdkjSkhB0ll8/
	tFqabMxSnHbNLnfswuPJmWQzaq4QwPMgWtBHAriraC0wOmBrZCVnneLLrTgAAzzaGsbk
	oIizBNqsjIe7Nb0+jw/pieiYvWwwhAI280vx4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Qxr4jYEJsVfOaPBYX3q/zAsi4KpYQEjBpmLU2yk8LYk=;
	b=ngvBswZpQ0blEU9qMQhBlldMyqXZJ7sDcR4CfgSKlihmdGe6sf5/I0VBvtMk5K2WTP
	lFc5TJMqn7TVsDzRmNC5zEkTZgEhRJopIY74D0HHamAcmqDrxnNqgucKduaUSEmK6ZCv
	z1v+IobcwyUb8W4oBc/N1xgW3W0+WYBRxnQIx3Nfrp2LFkWh3ubQKQYyJ4OVm4zqbo+R
	5WFvHtzLpULIsUuyxhnYTvV28LaY5RihIarBbSkTEPkpse9nl7j0k4Rx8x6gAgMdh+3C
	O3uZsEDgCnpG2R6YnRa9Lw7jXF65FpK16WMkZDXjSGstwoS/R1VkEcM4DdgVIdtxqQj8
	k/9w==
X-Gm-Message-State: APt69E26vbQmWrf+BkT5PDA9twQOKEE9DNbCig7W5+M4bmfCBq0rRF6O
	+GW8+gob0MSJifhudKOIssfott2bOoDEuecery4aFg==
X-Received: by 2002:aca:4ad2:: with SMTP id
	x201-v6mr5600531oia.11.1530203475136; 
	Thu, 28 Jun 2018 09:31:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:902:0:0:0:0:0 with HTTP;
	Thu, 28 Jun 2018 09:30:54 -0700 (PDT)
In-Reply-To: <1529699547-17044-4-git-send-email-alindsay@codeaurora.org>
References: <1529699547-17044-1-git-send-email-alindsay@codeaurora.org>
	<1529699547-17044-4-git-send-email-alindsay@codeaurora.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jun 2018 17:30:54 +0100
Message-ID: <CAFEAcA83OivvQFe1+Qc0adSx87j5hvHFVhmoRUGcoVu3UmKZyg@mail.gmail.com>
To: Aaron Lindsay <alindsay@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::22d
Subject: Re: [Qemu-arm] [PATCH v5 03/13] target/arm: Allow AArch32 access
 for PMCCFILTR
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
Cc: Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Aaron Lindsay <aclindsa@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5WP97TowKmFZ

On 22 June 2018 at 21:32, Aaron Lindsay <alindsay@codeaurora.org> wrote:
> Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
> ---
>  target/arm/helper.c | 27 ++++++++++++++++++++++++++-
>  1 file changed, 26 insertions(+), 1 deletion(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
