Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp1310403wrq;
        Thu, 12 Jul 2018 05:31:00 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpf+3Lx/hdBy11pQDOPIX1L7nBYgKfeRT0nQ+OGQ56bklinrOrZHbpgMxR3SMlm7J3iR9pbE
X-Received: by 2002:a37:338d:: with SMTP id z135-v6mr1525315qkz.358.1531398660385;
        Thu, 12 Jul 2018 05:31:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531398660; cv=none;
        d=google.com; s=arc-20160816;
        b=OuN8H2STUbJnkVA4y/3cMQRHWVXqKY/BSgiaynyFvQfMzAnhILI6qAJKyWx+yoPXZf
         YASVGSBzjJLZUCewe8UxNOM3NKlG5o0uwfhshZgzvOg6tu6lfA2a0L7lfUZpZdNbd9cC
         ks0ZVF3cF48HbNYuaspsfL49sh+wmctghtX0eG73X4BhJfLth5diF3li09S7cPRuL6i6
         QvnMs3Ibu43jbKUjFcoZ7bdIMsg73nmoBSq5GY0xkv08uLce9mhv28rXLmTjX5neNBDn
         A5xfwSlbAv0i9N+g1zEfqOfMA351UfVdvVBiB6m1X7voxPyUsWsZgoiaHMag+COAKqg+
         slRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=OeS9LHoXc7R39KgeYhoRh1G9KmtQfrrgpxgH3kbaY2Y=;
        b=fOlrA0UwnpuK0jFCnug5nES0MEZlamNNO8YOcDG8FhrizPqWumhoLVV+zkfGu9QHmM
         GXC/tkfAj+cYJDjMx1LHz1el9rrnHpNqjm+aJp0+aNv0WK5UL4q7TrtUFtTvCcBSTouJ
         6PRnq52BKDvt2zVPrIx4ejzqD+SUYwyynNcuNdjedRacX7RkkhYX2BUyaoLOxXi+LUcH
         fIvB9MpimGno+6HojpJARuTVtur9w7mTeQEAPyfpZhRUjdZ5qPI8AnRE6raHzWwzLJgb
         fqOuNypv8fJ+VsJI30yt8lOg6pHhoMMNZyFtHCFSL3V8wf/CRxdSsnYQVSsIBuuMlOZ0
         zQRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NORiL5vI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l9-v6si6705197qtj.324.2018.07.12.05.31.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Jul 2018 05:31:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NORiL5vI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59233 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fdakN-0000vb-SP
	for alex.bennee@linaro.org; Thu, 12 Jul 2018 08:30:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38073)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fdak7-0000tS-Sz
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 08:30:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fdak6-00045Q-MW
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 08:30:43 -0400
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:43435)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fdak6-00044x-HA
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 08:30:42 -0400
Received: by mail-oi0-x242.google.com with SMTP id b15-v6so55368796oib.10
	for <qemu-arm@nongnu.org>; Thu, 12 Jul 2018 05:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OeS9LHoXc7R39KgeYhoRh1G9KmtQfrrgpxgH3kbaY2Y=;
	b=NORiL5vIvwZfdllKKzvxCCbQ9P9z27T/+2hoV2eNo6VrqhiVmDpLcKrvaxo8Aw4gVW
	N/ONOxS6eC2HsDNVl9BNzXAhtmZSjHV31g8JMbJJwb4oqqjbDmi5jXGaAfqh4jAt3CDs
	+eM+jTPuydoTLoMTWcZx6TElhHHV8RZEvB9W4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OeS9LHoXc7R39KgeYhoRh1G9KmtQfrrgpxgH3kbaY2Y=;
	b=OoqJsviaLEhPjgAKIWJZPzQ4LQsu7tsnR78E8n5U7uA2fk3yzGfOINlccNfLRvOQPQ
	SqTnK8fjQssoZwWLFdlZX0dFAGrweI712e0SqGQHBnPQonGdHUSqvCezPPjqthPY08a/
	SjpogKE/Zs2Me+bh7F7Hhe7+pjr92bc02mtoWFacNIi8MP51mJG5tth2m5GfyF8E4wkm
	PWOdQP4A6vQ3xRribmODY8QQi5ELx8nhI+1lC60AyUE0m4WYfRBAhkrZpKC4o9echBEq
	0UM6o45EBsg28t5vrvICLg9pk+LkDwvCTuB58boK5aYyvOhrh9oAIeO95TlB1mVqqj98
	D0Ig==
X-Gm-Message-State: AOUpUlE0K77ZQCJdN1VJ4qjlmO4t7nzwD0uTMHqq2BBQWqdG6KOdWCmT
	lbobPhtTS+AO0foPWMaqBHAqAjD32JY8xOf7HQOxmQ==
X-Received: by 2002:aca:f5d1:: with SMTP id
	t200-v6mr2205930oih.12.1531398641947; 
	Thu, 12 Jul 2018 05:30:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Thu, 12 Jul 2018 05:30:21
	-0700 (PDT)
In-Reply-To: <20180629132954.24269-9-luc.michel@greensocs.com>
References: <20180629132954.24269-1-luc.michel@greensocs.com>
	<20180629132954.24269-9-luc.michel@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Jul 2018 13:30:21 +0100
Message-ID: <CAFEAcA-_=94PcEsaGmQBjN2HXgCB5QyvS53MdnAcfcWSKeApSA@mail.gmail.com>
To: Luc Michel <luc.michel@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-arm] [PATCH v3 08/20] intc/arm_gic: Refactor secure/ns
 access check in the CPU interface
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
Cc: Mark Burton <mark.burton@greensocs.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Sai Pavan Boddu <saipava@xilinx.com>, Edgar Iglesias <edgari@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Jan Kiszka <jan.kiszka@web.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EF2g4xjNGcg1

On 29 June 2018 at 14:29, Luc Michel <luc.michel@greensocs.com> wrote:
> An access to the CPU interface is non-secure if the current GIC instance
> implements the security extensions, and the memory access is actually
> non-secure. Until then, it was checked with tests such as
>   if (s->security_extn && !attrs.secure) { ... }
> in various places of the CPU interface code.
>
> With the implementation of the virtualization extensions, those tests
> must be updated to take into account whether we are in a vCPU interface
> or not. This is because the exposed vCPU interface does not implement
> security extensions.
>
> This commits replaces all those tests with a call to the
> gic_cpu_ns_access() function to check if the current access to the CPU
> interface is non-secure. This function takes into account whether the
> current CPU is a vCPU or not.

Thanks -- this approach looks much cleaner.

> Note that this function is used only in the (v)CPU interface code path.
> The distributor code path is leaved unchanged, as the distributor is not

"left"

> exposed to vCPUs at all.
>
> Signed-off-by: Luc Michel <luc.michel@greensocs.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
