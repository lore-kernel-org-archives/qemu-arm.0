Received: by 10.28.4.212 with SMTP id 203csp2634947wme;
        Mon, 16 Apr 2018 06:11:29 -0700 (PDT)
X-Google-Smtp-Source: AIpwx49pM/rV8oOVcr/UwuzC3pr75eIOS13f7/Cl1/Fmc2q6ooQPqBFawxyo5xJ2/mAUHY656F/X
X-Received: by 10.13.194.194 with SMTP id e185mr10278220ywd.316.1523884289491;
        Mon, 16 Apr 2018 06:11:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523884289; cv=none;
        d=google.com; s=arc-20160816;
        b=QV+wbRfQqDHP9tC8sCe/ipMFmIcA/aUtn+z3YCa2ftwRB3HI2BW/ngOpIp5oa7C0mf
         s/+tflDAujeQ3GEO2BWBsbZaZCYgFbdRYDmY6SXWN3YAGi9HqLwbbmwbg0s0PT3mQOY8
         EYFN6n5nz0ny56bUR7lCAKosOEOglr5wW8hL2iysoBD7AtlYJaNk4HzffkOcL82FMGRq
         GO0BjCkDOHltcmdMs41Tinzg1XwTMf0zJoGLOjIhYliaARoBNfnlozagJlUM09X6RNKu
         3cB7IBZRNnE6lfkZQS0XQpxQcFBY7GDFyvU2ssNZHTrzEVd0pw0HpUNNsZ3UyLLIyqpP
         8WQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=3vYrExzs8iJymk07i1SBNbLy7q7Ik54JYBtsvLgmZXQ=;
        b=QG/Q30E48vMGpmu7zjVvJTZ/w7Q/+by7JTTVRbYvZsCrDzXaDIEZqMYlWrIkocRBcd
         PWgEV8URYFQJjjp2trK9S2B5UjmZLSlmximOrIx/5m8mS0MiNvBZfxFCXznlBOMbo9tJ
         RRAGanCCGa1bdg85nmWvmElvvhxvw7vIyjO/GGmv8UNLMMv6ZNMvL2HZNb7Nb73LxijP
         HhKYEMBjygGN1k3QXlqEzjy6BmH+A6AbM9dlkODWpL/pqu3pBQhKTnMdY/9zDENMqajv
         Okn1DmvoE113B+03h+H42pIcpD9CBgIzTmxapSfnzTNgZ81CNxaOwlmMPqHuFnhHIX0K
         EODQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BiYsb1OM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h7si8706782qkf.327.2018.04.16.06.11.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 Apr 2018 06:11:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BiYsb1OM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45404 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f83uq-0000Yy-Or
	for alex.bennee@linaro.org; Mon, 16 Apr 2018 09:11:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40098)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f83uj-0000Ym-0a
	for qemu-arm@nongnu.org; Mon, 16 Apr 2018 09:11:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f83ui-0005Qz-1b
	for qemu-arm@nongnu.org; Mon, 16 Apr 2018 09:11:20 -0400
Received: from mail-ot0-x242.google.com ([2607:f8b0:4003:c0f::242]:36865)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1f83uh-0005Qf-RF
	for qemu-arm@nongnu.org; Mon, 16 Apr 2018 09:11:19 -0400
Received: by mail-ot0-x242.google.com with SMTP id y46-v6so17276993otd.4
	for <qemu-arm@nongnu.org>; Mon, 16 Apr 2018 06:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3vYrExzs8iJymk07i1SBNbLy7q7Ik54JYBtsvLgmZXQ=;
	b=BiYsb1OMyMBO79vK71eY0MLWO4Sg+/b1NQcjlcpqsS4VfKwBIGlSHnBpOGCNPnprSO
	DojlEgP2iBYDWFw3vDDUw2pNvkN7Xh8fOCGo+mZZSUkO7boDzmzMb21YPW9yJRLdMIyu
	7Y66ig9G6Q+1raWjVzE7wQpLQHaS08neuEcms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3vYrExzs8iJymk07i1SBNbLy7q7Ik54JYBtsvLgmZXQ=;
	b=HVZvoageFoPoT+HTUwPgWeuiLgHMp0IBhsBZMG0X4qCfhZ8P5Pp76wlol6H1HJAs2l
	o5DRQKxcEcBvp/0SHtRqrlhtfPJn+K7+Z1zKtUZRFQwfmNIldz0tEFqm50EmaYvZEPQw
	BkTOrvksIa51Pfyu3VBVSyfH4FU1gE7/Xuf56sjqgmHTodOxb02cFmDo5b8y4ngiSmTv
	7K5+EIMpcF5hBwal/ljz/8p+M6rNU5g2rTSYJ0xgo4nKHIn8yH05n5DnN96EgHTmUy0Q
	y9XMAldCg4h+1kjNjRfWvZWVFmbdPFXUitP+T+vpVJIt9JyEGNyVElDLLh4r6ddcM4GU
	mLgw==
X-Gm-Message-State: ALQs6tD1YSPXs1Dh2ylpmQEko8NeXDLbOZWxtlrtoSxVHZLl4HZCqr/c
	kdysIyNwMUg+/FDpPX6fA9/kqezV+Oy0Op+DGphsvA==
X-Received: by 2002:a9d:4a90:: with SMTP id
	i16-v6mr4296798otf.294.1523884279150; 
	Mon, 16 Apr 2018 06:11:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP; Mon, 16 Apr 2018 06:10:58
	-0700 (PDT)
In-Reply-To: <1523518688-26674-6-git-send-email-eric.auger@redhat.com>
References: <1523518688-26674-1-git-send-email-eric.auger@redhat.com>
	<1523518688-26674-6-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Apr 2018 14:10:58 +0100
Message-ID: <CAFEAcA-8xH7Tmr7mz9Gjk6jX=RgjVWX9cqVnpNr2kCAs0pb5xg@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::242
Subject: Re: [Qemu-arm] [PATCH v11 05/17] hw/arm/smmuv3: Wired IRQ and
 GERROR helpers
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
Cc: Christoffer Dall <cdall@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
	Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
	Tomasz Nowicki <tn@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Peter Xu <peterx@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, linuc.decode@gmail.com,
	Bharat Bhushan <bharat.bhushan@nxp.com>,
	Jintack Lim <jintack@cs.columbia.edu>,
	Prem Mallappa <prem.mallappa@gmail.com>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5GQ2PCcJdL9e

On 12 April 2018 at 08:37, Eric Auger <eric.auger@redhat.com> wrote:
> We introduce some helpers to handle wired IRQs and especially
> GERROR interrupt. SMMU writes GERROR register on GERROR event
> and SW acks GERROR interrupts by setting GERRORn.
>
> The Wired interrupts are edge sensitive hence the pulse usage.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Prem Mallappa <prem.mallappa@broadcom.com>
>
> ---
> v9 - v10:
> - s/hwaddr/uint64_t in trace-events
> - use qemu_log_mask LOG_UNIMP on PRI IRQ
> - add a comment saying smmuv3_trigger_irq and smmuv3_write_gerrorn
>   will become static later on
> - write gerrorn without filtering (ie. even if the guest toggles non
>   active IRQs)
> - pulse if at least one new IRQ type
> - smmuv3_eventq_irq_enabled and smmuv3_gerror_irq_enabled become
>   static inline
>
> v7 -> v8:
> - remove SMMU_PENDING_GERRORS macro
> - properly toggle gerror
> - properly sanitize gerrorn write
> ---
>  hw/arm/smmuv3-internal.h | 36 +++++++++++----------------
>  hw/arm/smmuv3.c          | 64 ++++++++++++++++++++++++++++++++++++++++++++++++
>  hw/arm/trace-events      |  3 +++
>  3 files changed, 81 insertions(+), 22 deletions(-)
>
> diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
> index a6461fe..32f81d4 100644
> --- a/hw/arm/smmuv3-internal.h
> +++ b/hw/arm/smmuv3-internal.h
> @@ -129,28 +129,6 @@ typedef struct Evt  {
>      uint32_t word[8];
>  } Evt;
>
> -/**
> - * smmu_read64 - 64-bit register read utility function supporting
> - * aligned 32-bit word access to both 32-bit halves and aligned 64-bit
> - * access.
> - *
> - * @r: register address
> - * @offset: byte offset if 32-bit access
> - * @size: read byte size
> - */
> -static inline uint64_t smmu_read64(uint64_t r, unsigned offset,
> -                                   unsigned size)
> -{
> -    if (size == 8) {
> -        return r;
> -    }
> -
> -    /* 32 bit access */
> -    assert(!offset || offset == 4);
> -
> -    return extract64(r, offset << 3, 32);
> -}
> -

Ah, this change should be squashed into the previous patch,
which addresses one of my review comments there.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
