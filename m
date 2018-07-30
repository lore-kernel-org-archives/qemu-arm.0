Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp4033530wru;
        Mon, 30 Jul 2018 10:36:40 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfb6Olm8EYbqv0jflS81CiV5dkc/DiPmxIvspw6RsgxQFDgdPlViJGHQcIHwEfnrWgjnJ3l
X-Received: by 2002:a37:b684:: with SMTP id g126-v6mr17233424qkf.208.1532972200671;
        Mon, 30 Jul 2018 10:36:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532972200; cv=none;
        d=google.com; s=arc-20160816;
        b=fBa0LMdskKdodqddF59rA7eQ5A6ZDW9JTAl3PjiuBqNtkgL61HrkBhxaaLBru2b5Yd
         oFVz4qJten9Coen4wVRYype0NPa32gbKH7RYci+1l0o9wk5JXICmgy+OxJd5YgNAWtAb
         M4iVi1QrLltd1P/EhbVbQq3IF/RDoMJUzqnZMYODqxpy/oXg3l46jL69Dtc5oWtYwJtq
         d0Plq+i++/HIXMuYDbvLrE6IT/5lCYkDAxFkr51I3wDw2w9Z/Dpw9UD4JkFo+Gi7/H/9
         j0KcaZnJC0S+nReEyl5PZVhUTNSKtpPj1bu2Ujtz5FDKiVgE+Ty6fyxICsnKkg+YAEF1
         lWww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=DO4st3bsstTJqLZ66cPj+yo5GWnwal2VV835QhDLWcA=;
        b=BP7lOcR7ZBai+UQ3O3aGr4NeQB8MDz0M7hKgkeCQuRYRKqDuGzhr9RyYAbvRd6Zls9
         Zn0UtPA+RQ7ov0bHfwvskf9jJZ/Io3r35IhsZ4dGsQ0mfD9Tib13jUKJ3jo+MLxzBJqi
         WhOwIxhw5wHWCUPzW3LMjvcNuyrcwKQmIMVYrTMiL/ZK54Np3V/vGCfpVNQxbC9NfEnm
         gBT8L+IHv6fj7IEzX8qW1HWC80X48M+lLhd9PJh5eGjrmmN5tQl46AbmeIXZ71SqC0T2
         NkDJmjQzUSdYV9nFTbQYDVjXcNa/258g9rI66LQDibySXtmGIS2FAlH61cAjb9b0GJO4
         ucnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NOzCdDOg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g36-v6si3073665qte.134.2018.07.30.10.36.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 30 Jul 2018 10:36:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NOzCdDOg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54177 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fkC64-0003xL-4e
	for alex.bennee@linaro.org; Mon, 30 Jul 2018 13:36:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50880)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fkBl0-0002jm-NR
	for qemu-arm@nongnu.org; Mon, 30 Jul 2018 13:14:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fkBkz-000690-PU
	for qemu-arm@nongnu.org; Mon, 30 Jul 2018 13:14:54 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:42348)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fkBkz-00068O-J7
	for qemu-arm@nongnu.org; Mon, 30 Jul 2018 13:14:53 -0400
Received: by mail-oi0-x244.google.com with SMTP id n84-v6so22629004oib.9
	for <qemu-arm@nongnu.org>; Mon, 30 Jul 2018 10:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DO4st3bsstTJqLZ66cPj+yo5GWnwal2VV835QhDLWcA=;
	b=NOzCdDOgpWnBrHNuMe7Cq2ovPAh32/TiR326UatgACxCN76qH6ymCi5nN0XBI5ZLeS
	o4/Uim8qGBv5H0sTr9wGixAff/vemxy9qjuR24A0r0r3RZaBdqD/qAWIMWLYUyWYB6hu
	gwq5N10sK4sD/EbXh3vlBOI/d6ygkxPm/nQy0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DO4st3bsstTJqLZ66cPj+yo5GWnwal2VV835QhDLWcA=;
	b=o1534H54PUCsTkw7wntkMlNhwijAUcHvKOpPJokF3uwcGjtIbzSZ+ZuDSW1x/bfo2a
	CkaBiGvcqg1+6BhzgnDPb94smXIa2zKXcM4Pt+/A6MIsk8T515ZJ0oWyU7k5/FSX2MsM
	Fgi6X/H7Hf/U0tqdNhQXH6m6hY8M2r+heh6mjwVyNh77n8F+scf+QIaf6kmG8YLlYGyC
	8vYsQQDjE7mJFxKTnhCpcOQaASs3e7D8M5xFvYoTlgQrX850X4oofiBmSHyJqH+Y4xD2
	fYkvBsIvfFixmjAKMcIY23IftuqddsZD6xSJWrxlZ8lzM6IS7uJn4qsc0Yv/Sdr8T6cW
	m/2A==
X-Gm-Message-State: AOUpUlHRmScZms13jwsw+9rFoqYAt9UDY6sWLZEr/jBAlg3YjqZs4rHF
	MN7OhSBA381BxLi/fSjLjLWA7mMXA6PV4gJCiCcKNg==
X-Received: by 2002:aca:a982:: with SMTP id
	s124-v6mr19719298oie.80.1532970892900; 
	Mon, 30 Jul 2018 10:14:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Mon, 30 Jul 2018 10:14:32
	-0700 (PDT)
In-Reply-To: <20180727095421.386-1-luc.michel@greensocs.com>
References: <20180727095421.386-1-luc.michel@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 Jul 2018 18:14:32 +0100
Message-ID: <CAFEAcA8-79oCm5YfxPJ0r2UDaGXp7ox7e2cZ_cmpy9xuZvoDag@mail.gmail.com>
To: Luc Michel <luc.michel@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-arm] [PATCH v5 00/20] arm_gic: add virtualization
 extensions support
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
X-TUID: 9k5Zmtq1GTDi

On 27 July 2018 at 10:54, Luc Michel <luc.michel@greensocs.com> wrote:
> v5:
>   - Patch 7: dropped unreachable 'return NULL' [Peter]
>   - Patch 12: reworked the way invalid vIRQ are handled. The
>     specification being uncleared, I used real hardware to check our
>     previous hypothesises. See commit message for the adopted behaviour.
>     The main difference is that when EOIMode is true (EOI split is
>     enabled), a write to V_EOIR never increments H_HCR.EOICount. [Peter]
>   - Patch 14-15: fixed commit message regarding mirrored regions. [Peter

Thanks (and especially for taking the time to check the hardware
behaviour where the spec was unclear).

I've applied this series to my target-arm.for-3.1 branch ready
for when we reopen master after the 3.0 release.

thanks
-- PMM
