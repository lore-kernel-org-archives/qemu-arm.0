Received: by 10.25.208.211 with SMTP id h202csp505309lfg;
        Tue, 5 Apr 2016 09:01:47 -0700 (PDT)
X-Received: by 10.55.82.6 with SMTP id g6mr16338217qkb.40.1459872107854;
        Tue, 05 Apr 2016 09:01:47 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w107si26757624qge.8.2016.04.05.09.01.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Apr 2016 09:01:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38155 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1anTQJ-0004Dx-Da
	for alex.bennee@linaro.org; Tue, 05 Apr 2016 12:01:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35148)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1anTQG-0004B1-99
	for qemu-arm@nongnu.org; Tue, 05 Apr 2016 12:01:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1anTQA-0006h1-Ij
	for qemu-arm@nongnu.org; Tue, 05 Apr 2016 12:01:44 -0400
Received: from mail-vk0-x22a.google.com ([2607:f8b0:400c:c05::22a]:34700)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1anTQA-0006gD-EJ
	for qemu-arm@nongnu.org; Tue, 05 Apr 2016 12:01:38 -0400
Received: by mail-vk0-x22a.google.com with SMTP id e185so23625182vkb.1
	for <qemu-arm@nongnu.org>; Tue, 05 Apr 2016 09:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZnDUz0kggc6Osk1BueR41SybWdLsVxEvLcFaVcRvuk4=;
	b=YXPY7oAbyogn8cQ/qDlMvAqgisHTywbpqy7Sqcg+j55jgpGg1ltDdezYPMUeJb7fnm
	5wvyhqqMKgBLKN1K4YYjV2m9PjYz/C+Xd/bVjvaGsYLK7P9xVdvEu8DE6r2NIYcqcexN
	4gmjbC8Yc+2EKTyW52W5XgL86WrtzxFeIXv0g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZnDUz0kggc6Osk1BueR41SybWdLsVxEvLcFaVcRvuk4=;
	b=OsCPTjvIFmlvnABUL18vw0r9SeR9bUVQxqlYisNEGyvGf200U49l3BdAsI7x3xQeva
	WNb8Sma1DSL/hkLplcAR6ohGM7DGRIo17402/mHFgSABXmzUbbam3T050D6qvtZwUHxW
	PvW7DqhgtuWKuGBeb0PF5BmTXGU8/gzWAsrzYMwi83q00WwDsfe6Hkw97FwwaLUpC6j3
	hIQuzAriAmp46icKL6EC9viJQopweFAc72uDD0KwvZIUDh2PG29jUf/U0+cexeX39hMI
	JwrN/1jcRr08DZB83VdgfoLAIBCua//jh6pVanO1E1iXy+mYVrjlJVPVSBsO0KpyV+/B
	mqrA==
X-Gm-Message-State: AD7BkJL8AvzyxtW+PdqFPuYKgwilnWJXBkRvmi//OEU7K0qcvCZ1/uryuPc6UI5QPQt6QD+Y1rIuIfr1NUpEj53q
X-Received: by 10.159.35.109 with SMTP id 100mr8297313uae.119.1459872096795;
	Tue, 05 Apr 2016 09:01:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Tue, 5 Apr 2016 09:01:17 -0700 (PDT)
In-Reply-To: <5703D7EE.2000005@redhat.com>
References: <1459777195-7907-1-git-send-email-vijayak@caviumnetworks.com>
	<1459777195-7907-3-git-send-email-vijayak@caviumnetworks.com>
	<CAFEAcA_755uEOZoGj0SCtmT-5PyLMntkK3wZeuHvZ_kPG9A1aQ@mail.gmail.com>
	<5703D7EE.2000005@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 5 Apr 2016 17:01:17 +0100
Message-ID: <CAFEAcA8G_-jQOtnVag2Ef++RbfbEJ-XzNnyYM=o9Sh8c6ohecA@mail.gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22a
Cc: Vijay Kilari <vijay.kilari@gmail.com>,
	Vijaya Kumar K <vijayak@caviumnetworks.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Prasun Kapoor <Prasun.Kapoor@caviumnetworks.com>,
	qemu-arm <qemu-arm@nongnu.org>, Vijay <vijayak@cavium.com>
Subject: Re: [Qemu-arm] [RFC PATCH v1 2/2] target-arm: Use Neon for zero
	checking
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 7ti12UOJj/H/

On 5 April 2016 at 16:21, Paolo Bonzini <pbonzini@redhat.com> wrote:
> But in theory it should be enough to add a new #elif branch like this:
>
> #include "arm_neon.h"
> #define VECTYPE   uint64x2_t
> #define VEC_OR(a, b) ((a) | (b))
> #define ALL_EQ(a, b) /* ??? :) */

#define ALL_EQ(a, b) (vgetq_lane_u64(a, 0) == vgetq_lane_u64(b, 0) && \
                      vgetq_lane_u64(a, 1) == vgetq_lane_u64(b, 1))

will do I think (probably suboptimal for a true vector compare but
works OK here as we're actually only interested in comparing against
constant zero; the compiler generates "load 64bit value from vector
register to integer; cbnz" for each half of the vector).

Worth benchmarking that (and the variant where we use the C code
but move the loop unrolling out to 16) against the handwritten
intrinsics version.

thanks
-- PMM
