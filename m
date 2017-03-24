Received: by 10.25.15.230 with SMTP id 99csp1157977lfp;
        Fri, 24 Mar 2017 03:06:51 -0700 (PDT)
X-Received: by 10.200.37.81 with SMTP id 17mr6549817qtn.165.1490350011503;
        Fri, 24 Mar 2017 03:06:51 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c7si1387568qta.231.2017.03.24.03.06.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 24 Mar 2017 03:06:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60539 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1crM7O-0001je-TX
	for alex.bennee@linaro.org; Fri, 24 Mar 2017 06:06:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50775)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1crM7I-0001ij-I8
	for qemu-arm@nongnu.org; Fri, 24 Mar 2017 06:06:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1crM7H-0000pw-AR
	for qemu-arm@nongnu.org; Fri, 24 Mar 2017 06:06:44 -0400
Received: from mail-wr0-x22e.google.com ([2a00:1450:400c:c0c::22e]:33207)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1crM7H-0000pj-4D
	for qemu-arm@nongnu.org; Fri, 24 Mar 2017 06:06:43 -0400
Received: by mail-wr0-x22e.google.com with SMTP id y90so6077730wrb.0
	for <qemu-arm@nongnu.org>; Fri, 24 Mar 2017 03:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=G0eKo+rzAofwwwCh/9LLNUJMcEzpb2JeiTd4FOKcL9g=;
	b=D3tK6YcFz7Za3oM9To57G9DNrufG8O8qh4Lbq9lF2dCYTHBBguU9MzSZWyT5xxiJbs
	AC7aZY1/jj0ur8WI7FPTSTdwK/FETH+G8A4Zy1tacgNwPaBDXnOwD0ddw3Ye//yDDYAr
	EKxs9maDxiLwoaNGhydYZs0dfF354a0ZN1WBE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=G0eKo+rzAofwwwCh/9LLNUJMcEzpb2JeiTd4FOKcL9g=;
	b=Oo2XBmJY1lphk8BtwRQNENE2Lv4q7TwHQINzX8McJNMobs2UYIfpLakjY88NV99Mz1
	NoR+7It7/uOfg0c0d150ptWTJpv4WjO72Ro9m0CkH5b5bCe9dUbFkluIOJy86T6+h25t
	xWTaSzYeS7d7mdK0tYEUatqqCTHf4FQCi6OvD74uaq+z9Ul+ZIwiQ9lgcFgrvtvqWD6a
	fkJP1QKiaqX2pB2vg05iFJkAhwV4PLvDTKMu8HvvhMBjurXyi5P+G+ZaJJpH4CsmuMyq
	s3qS+soxNTEfjg3Q+Xw87Vjz+gaQzG842NfCmK1He1BbTZ1/djxsgbdnN8LKf/jenKZc
	WUMw==
X-Gm-Message-State: AFeK/H3ws9TF8QZFnaYZyukv3Qf+HUI9d8bhkiD+cQ6i2GbQmQGZKfIRp1CJqDJcUO4umZx70nmS5V4KbhNPd6lH
X-Received: by 10.223.169.70 with SMTP id u64mr2124838wrc.187.1490350001946;
	Fri, 24 Mar 2017 03:06:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.145.33 with HTTP; Fri, 24 Mar 2017 03:06:21 -0700 (PDT)
In-Reply-To: <C94A741879221447B4FC9B607EB4FFCD79EA7BA3@DGGEMA504-MBX.china.huawei.com>
References: <1459777195-7907-1-git-send-email-vijayak@caviumnetworks.com>
	<1459777195-7907-3-git-send-email-vijayak@caviumnetworks.com>
	<CAFEAcA_755uEOZoGj0SCtmT-5PyLMntkK3wZeuHvZ_kPG9A1aQ@mail.gmail.com>
	<5703D7EE.2000005@redhat.com>
	<CAFEAcA8G_-jQOtnVag2Ef++RbfbEJ-XzNnyYM=o9Sh8c6ohecA@mail.gmail.com>
	<C94A741879221447B4FC9B607EB4FFCD79EA34F4@DGGEMA504-MBX.china.huawei.com>
	<CAJhHMCDDu_kEJichH=60N=np+ZKbU1e9bWK-pP9Z-9=Fn4w1_w@mail.gmail.com>
	<C94A741879221447B4FC9B607EB4FFCD79EA7BA3@DGGEMA504-MBX.china.huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Mar 2017 10:06:21 +0000
Message-ID: <CAFEAcA_0UA1hnP9XVBn8w0B66eyR12GnnUoCOxjirPSDgHcHvQ@mail.gmail.com>
To: Wangjintang <wangjintang@huawei.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22e
Subject: Re: [Qemu-arm] [patch 1/1]about armv8's prefetch decode
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
Cc: "Shlomo Pongratz \(A\)" <shlomo.pongratz@huawei.com>,
	"Ori Chalak \(A\)" <Ori.Chalak@huawei.com>,
	qemu-devel <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Pranith Kumar <bobby.prani@gmail.com>,
	"Wanghaibin \(Benjamin\)" <benjamin.wanghaibin@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5uoUCWwb/n0l

On 24 March 2017 at 06:14, Wangjintang <wangjintang@huawei.com> wrote:
> Hi Pranith,
>
>         Thanks for your reply. patch as below, new added code default is off, please review.
> The major thinking is about translate Armv8's prefetch instruction into intermediate code, at the same time don't effect the rm/rn register.
>
>
> diff --git a/translate-a64.c b/translate-a64.c
> index 814f30f..86da8ee 100644
> --- a/translate-a64.c
> +++ b/translate-a64.c
> @@ -2061,7 +2061,11 @@ static void disas_ld_lit(DisasContext *s, uint32_t insn)
>      } else {
>          if (opc == 3) {
>              /* PRFM (literal) : prefetch */
> +            #ifdef TCG_AARCH64_PREFETCH_TRANSLATE
> +            ;
> +            #else
>              return;
> +            #endif
>          }

No, these changes look wrong. PRFM instructions do not need to
do anything and should definitely not be emitting any intermediate
code. In particular if you let execution fall through and try
do_gpr_ld() then it will really do a load, which might cause
an exception -- this is specifically forbidden for PRFM.
Architecturally the ARM ARM says "it is valid for the PE to
treat any or all prefetch instructions as a NOP", which is
what QEMU does.

The existing code is correct. In general you should not
expect to be able to deduce the guest instructions from
the intermediate code representation.

thanks
-- PMM
