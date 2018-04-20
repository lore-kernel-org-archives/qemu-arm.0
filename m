Received: by 10.28.4.212 with SMTP id 203csp584298wme;
        Fri, 20 Apr 2018 03:19:06 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZoj/lQdL5AJwOI2KANDD94E+eEAbGsqq/AdYnrbBN0lN1BjgAEe2mcSxLAb7eOpTDEAtz/Z
X-Received: by 10.55.75.205 with SMTP id y196mr9958780qka.44.1524219546206;
        Fri, 20 Apr 2018 03:19:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524219546; cv=none;
        d=google.com; s=arc-20160816;
        b=F97v/x9OZtyqIHNPXZwkc9Iw2To6485JDFrb5N7Il6scNLX9TSkf4wPyfiQpQ8/hoG
         LLkAjv7Rfk5oiQ/mPfiF7jUG2K1IKsxIMM9VF8XLBY8M61GPjXGTQIQ3httZ2YzvaVMD
         9mZavpu8WOfwBFx9d6OvVkgbzs2KcSLmU37WE3ELsgYC53IqKFBsERL6W0k/ERbhNZYv
         gqQ0L2UQqaJUE2TPdZFuKuJ/ZcecN4WRxP5NEg9hlXe0R9iecSZFs/Oploe5KwVQ0qmd
         KLNedgJ7KPqJq1H9n3ZR3DvATnJTSBYJ3boC55BdMxyILJCA0krDtSbyaYssg55uidLN
         c5yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=vQGGPulMQ+6X2PQThvxL033ObHmdXmbe7jchsSGJcr4=;
        b=kiPBhEiSK8fYay6WuhFOuOA0c3ze75E3QRcW0s/j3ebhlKUfyOFN9fZ0xuWYdCkjCU
         B/dPhSZoY/KCkZQfDNU7vsPTLr566gAAVIlGsYNINP4MwqU5nw/Bl76Ank7wxQWRMAvt
         s8xJhPcqizW/F3sctyBdj2yZT6J6vBjeHZoxQNKgzrDpUGIz59yKt7vLEj8OkmYkFY+G
         Egn1KAg5Mvm3fPqwF4uCKaRv1qNmssc7Npy5Yy6lsJ42ybXPCwd8Vs+hiYzOMWRG8p1r
         Z0fjDjeyrFmBcsAPS0X0NxSF9RxftoP1JCcIH3dGTwWP1kmcVnYnibzYAuQm+zAW7ct6
         GJog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=T0tX7wnr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n62si589995qki.287.2018.04.20.03.19.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 20 Apr 2018 03:19:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=T0tX7wnr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44828 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f9T8D-0006uB-PX
	for alex.bennee@linaro.org; Fri, 20 Apr 2018 06:19:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43104)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f9T79-0006Xs-Fv
	for qemu-devel@nongnu.org; Fri, 20 Apr 2018 06:18:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f9T78-0008Eb-Hu
	for qemu-devel@nongnu.org; Fri, 20 Apr 2018 06:17:59 -0400
Received: from mail-ot0-x244.google.com ([2607:f8b0:4003:c0f::244]:34284)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1f9T78-0008E4-C2
	for qemu-devel@nongnu.org; Fri, 20 Apr 2018 06:17:58 -0400
Received: by mail-ot0-x244.google.com with SMTP id i5-v6so9067899oth.1
	for <qemu-devel@nongnu.org>; Fri, 20 Apr 2018 03:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vQGGPulMQ+6X2PQThvxL033ObHmdXmbe7jchsSGJcr4=;
	b=T0tX7wnreu7C1qyqITc3M8NKTbdw3F9MVZWG7YZhee9mO92evlSRlzqi0hz6Ifpf2H
	OEwxPcoeU7UYwcQBznXpGf4WlIcGHDTsXGBhL5F5PkoZ9WeD7uzpJlw9pOH23unc0aOk
	uhnQ5AKMxErdugAfWDArgh9ebArN00y6XGzw0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vQGGPulMQ+6X2PQThvxL033ObHmdXmbe7jchsSGJcr4=;
	b=g+/C63fy0j9X8zw3XBaCwpdXm3eTKZry8J246j0Tt/393GazkB/n5xRy32BMe+SJC8
	5EeUJfaPJph2i5sMn8DV6FXecnQptb/rtKS36II7kt7wmS4IA+jWeYj/d4V7HIb/r+fv
	KrLt+wWsx12uJFjaveBI0hv03eZ1ljKeJSDkVnRpNUWPzQfgxg3truHEJLMX9+WRLAbG
	kWfGE6BwIgDKT8XYtiY9tIPfKrm8oNyrvzHpg4x+YjpPGO1FC6OchSmt5bWISvySBvh5
	rxMBXUKnGQVzRgzQrEnoJHOje+cAnQ+4+d39XNFhzp9MRw/x7xU6E7vmkLORMvb9y3HV
	KgkQ==
X-Gm-Message-State: ALQs6tBgu6DiYJ7zLmg6O/AQPaB5TV9Jq3U3R+znZ1BzhHjF672my2O0
	PwzVFzfF8sjD2uSDVNutVGuvCsJb6/rLmTb5Pnya0g==
X-Received: by 2002:a9d:5cc1:: with SMTP id
	r1-v6mr5844913oti.258.1524219477349; 
	Fri, 20 Apr 2018 03:17:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Fri, 20 Apr 2018 03:17:36
	-0700 (PDT)
In-Reply-To: <1523997485-1905-4-git-send-email-alindsay@codeaurora.org>
References: <1523997485-1905-1-git-send-email-alindsay@codeaurora.org>
	<1523997485-1905-4-git-send-email-alindsay@codeaurora.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Apr 2018 11:17:36 +0100
Message-ID: <CAFEAcA_g1Bb=-cj+QToHDypZPiqw_U5YioRWfDSs0Ano3PqDTQ@mail.gmail.com>
To: Aaron Lindsay <alindsay@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::244
Subject: Re: [Qemu-devel] [PATCH v4 03/21] target/arm: Reorganize PMCCNTR
 accesses
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Wei Huang <wei@redhat.com>, Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: x0mu6YDi2ogu

On 17 April 2018 at 21:37, Aaron Lindsay <alindsay@codeaurora.org> wrote:
> pmccntr_read and pmccntr_write contained duplicate code that was already
> being handled by pmccntr_sync. Consolidate the duplicated code into two
> functions: pmccntr_op_start and pmccntr_op_finish. Add a companion to
> c15_ccnt in CPUARMState so that we can simultaneously save both the
> architectural register value and the last underlying cycle count - this
> ensure time isn't lost and will also allow us to access the 'old'
> architectural register value in order to detect overflows in later
> patches.
>
> Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
> ---
>  target/arm/cpu.h    |  28 ++++++++++-----
>  target/arm/helper.c | 100 ++++++++++++++++++++++++++++------------------------
>  2 files changed, 73 insertions(+), 55 deletions(-)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 19a0c03..04041db 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -454,10 +454,20 @@ typedef struct CPUARMState {
>          uint64_t oslsr_el1; /* OS Lock Status */
>          uint64_t mdcr_el2;
>          uint64_t mdcr_el3;
> -        /* If the counter is enabled, this stores the last time the counter
> -         * was reset. Otherwise it stores the counter value
> +        /* Stores the architectural value of the counter *the last time it was
> +         * updated* by pmccntr_op_start. Accesses should always be surrounded
> +         * by pmccntr_op_start/pmccntr_op_finish to guarantee the latest
> +         * architecturally-corect value is being read/set.
>           */
>          uint64_t c15_ccnt;
> +        /* Stores the delta between the architectural value and the underlying
> +         * cycle count during normal operation. It is used to update c15_ccnt
> +         * to be the correct architectural value before accesses. During
> +         * accesses, c15_ccnt_delta contains the underlying count being used
> +         * for the access, after which it reverts to the delta value in
> +         * pmccntr_op_finish.
> +         */
> +        uint64_t c15_ccnt_delta;

So the key question here is: how does this work for VM migration?

thanks
-- PMM
