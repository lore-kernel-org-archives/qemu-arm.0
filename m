Received: by 10.28.91.67 with SMTP id p64csp2868693wmb;
        Mon, 19 Mar 2018 10:36:45 -0700 (PDT)
X-Google-Smtp-Source: AG47ELslLAGMyAcu2L5gHdkcsAnfKkM4XkFSQwXMENirkqIqw3Z//DgPuFYAhyHm4x/PGHFYYu/K
X-Received: by 10.55.5.129 with SMTP id 123mr19282770qkf.115.1521481005745;
        Mon, 19 Mar 2018 10:36:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521481005; cv=none;
        d=google.com; s=arc-20160816;
        b=HZbJiqEvGbP5fHIJmcCOOOU8oW6W4IQTIdvWxcMdYroPzt1NkSnSAYIgrQPgFTQDw0
         Rsm/zefo3WczwsOVsQchKor1BFC1Wc1ZWsccFCMkD+48Q8SzzjrlB5iNprGfIw1qPxh0
         4GwJd+pOeMn4UU30yYhrCVmyvxEMuJh20snw/RKv+B8kpafgMT1PxOY5NCsVz4XgnHpk
         l+kCWcFc+SVhp7I3iYOILHA9J96ZjL2aT3rVL+CUYwB88RvXG2jsgGT/n2wSec8xU5dQ
         wu7Dz7aIhKALNY1C9wNpmQQouqlbEnLnBWPwhcW9X737odJ7lMhQIWKL9ySPJ2+Uw8y4
         XjpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=iTicK0XHo9QBmBqS+P24DA+t/+sj6glZ0g9TymKvlPY=;
        b=CTlWfq1EACWrMHZgOdvAt+DfRgzK316eZKYwAyCRe1lMmlRRIrl2i/Y5kb55iA8tAS
         BOskoe6XcrrjkuDOHoEluJvOxtxQyRrtbhL7kOG6hnMhdgUTp/BU+GEVKjjstEiymLS7
         GZRfQqPhM8xviaGGhER6mcz8asvMpvJwzpvXmhTIwPFOWU8Y1xZHE8pjkFiZSSGRYQ1s
         X2wefRau9GwjqMzwT4WroEFr9fnsn22J3SK13oHcxyMjoNLGWpkP7jhWCC15n6d3mcMy
         6T2ueEr8mEwvKv8R+HPo8e5bT3/8gMlHVKDbsJFzE8a9ofd6SIOYfVNga9kNGWZEEaaM
         Z8xA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@codeaurora.org header.s=default header.b=CPajkRPY;
       dkim=neutral (body hash did not verify) header.i=@codeaurora.org header.s=default header.b=did2lFqm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o14si512360qta.484.2018.03.19.10.36.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 19 Mar 2018 10:36:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@codeaurora.org header.s=default header.b=CPajkRPY;
       dkim=neutral (body hash did not verify) header.i=@codeaurora.org header.s=default header.b=did2lFqm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43153 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1exyiD-0002ti-6E
	for alex.bennee@linaro.org; Mon, 19 Mar 2018 13:36:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37175)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1exyi5-0002tN-2y
	for qemu-arm@nongnu.org; Mon, 19 Mar 2018 13:36:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1exyi1-0004ja-58
	for qemu-arm@nongnu.org; Mon, 19 Mar 2018 13:36:37 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:36184)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1exyi0-0004jH-Rq; Mon, 19 Mar 2018 13:36:33 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 9B48560C66; Mon, 19 Mar 2018 17:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1521480991;
	bh=2+9A4vso4bwfZs3EMmge0aXkCn+Ra2aIzzc2fX+MVlE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CPajkRPY3h2rspAic+G0wfE3FVk/+GIG6QE/yTYFuSEeCGjOubA0FUwlOFdSbEpHQ
	wAXL5S8Dxn5KoM3Z8y08XDr3LIo7P4znJPecRP34ILZESPcalnTlpjdBEQznfowh+u
	Fc3qhvDUc1IWupqgu/qtcR1FFk3TlXlfuGwEDgbM=
Received: from codeaurora.org (global_nat1_iad_fw.qualcomm.com [129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 9F7E9602FC;
	Mon, 19 Mar 2018 17:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1521480987;
	bh=2+9A4vso4bwfZs3EMmge0aXkCn+Ra2aIzzc2fX+MVlE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=did2lFqmLeqizSWQu2lPGeRBtUgA8ZAl3WpRijyTeST0OHREdmXzXPnvgRxfvVS0s
	9uk3Nkn9PgX5wIUbBH4yn3OxyYK9/CJx25aGCLTOC9DSQhkszdrD4QerdhKpfhwk7i
	HtUO2dDGZIceOybL90OvwpuoGcDSHKlVevADSc1Q=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9F7E9602FC
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
Date: Mon, 19 Mar 2018 13:36:24 -0400
From: Aaron Lindsay <alindsay@codeaurora.org>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Message-ID: <20180319173624.GC24561@codeaurora.org>
References: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
	<1521232280-13089-21-git-send-email-alindsay@codeaurora.org>
	<b8b7a898-b714-3563-7f7a-84374db2b283@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <b8b7a898-b714-3563-7f7a-84374db2b283@amsat.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: Re: [Qemu-arm] [PATCH v3 20/22] target/arm: PMU: Add instruction
 and cycle events
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>, qemu-devel@nongnu.org,
	Alistair Francis <alistair.francis@xilinx.com>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9py1+b8NrT/K

On Mar 18 23:48, Philippe Mathieu-Daud=E9 wrote:
> On 03/16/2018 09:31 PM, Aaron Lindsay wrote:
> > The instruction event is only enabled when icount is used, cycles are
> > always supported. Always defining get_cycle_count (but altering its
> > behavior depending on CONFIG_USER_ONLY) allows us to remove some
> > CONFIG_USER_ONLY #defines throughout the rest of the code.
> >=20
> > Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
> > ---
> [...]>  #define SUPPORTED_EVENT_SENTINEL UINT16_MAX
> >  static const pm_event pm_events[] =3D {
> > +#ifndef CONFIG_USER_ONLY
> > +    { .number =3D 0x008, /* INST_RETIRED */
>=20
> "Instruction architecturally executed" seems more explicit to me.

I've updated v4 to include this wording as well.

> > +      .supported =3D instructions_supported,
> > +      .get_count =3D instructions_get_count
> > +    },
> > +    { .number =3D 0x011, /* CPU_CYCLES */
> > +      .supported =3D event_always_supported,
> > +      .get_count =3D cycles_get_count
> > +    },
> > +#endif
> [...]

-Aaron

--=20
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies=
, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
