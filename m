Received: by 10.25.221.202 with SMTP id w71csp518281lfi;
        Sat, 5 Aug 2017 03:29:40 -0700 (PDT)
X-Received: by 10.200.57.36 with SMTP id s33mr6662420qtb.302.1501928980094;
        Sat, 05 Aug 2017 03:29:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501928980; cv=none;
        d=google.com; s=arc-20160816;
        b=t+OIZbujtREM/dYtq81p5TkWwfo+DKGRVniurVtJH4CikCB0xZpS8KRnmYzt2Zebot
         WcYvvebAsJD+mjDDQpQkvzu7lcC7WW41AyWtIDU2uqNUvHf6orPLmdT042vPnnrEHlp2
         5meJWGsLmTeWteOAkmt4wL+4557TpYHvaFJAnLdglsX2qduJZwjErh1wNtddqK8KNiui
         QRRNKXYH8W6t13CDrXpYJUkt0nzt2Ye1gCMkvHWUHER4j6Etg0hmyw4kDmqdZMa10cxH
         kkY+4WN0yk2l9MNiL20yecSqj01SaJS5xMUnW/Ny4F1jNVUwCmHKhQAWrnm7Va3CG7om
         mRLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=avR7gStxVzM3aNjxGPfhPrybJwCaqKC3HZhz5UHZYfs=;
        b=B7Z/PfOw0QOcGEaeajaeRJMppCtzSVtfo3GTN7VxvUN9GBgfaXH33QjDUPDiiPO0+3
         hwxnovzSzj1Kh6CaFOAtml12SD7nu8QlPrM5SY/mKOOU7FbCvnwgaaAzwNFG0OAj6Zvg
         THn1bTiO4u8uBGio1XCBoZn/l9S/5yBJs+j4c/SO3IREp7DD1BYI/fiFShokLDzayhVp
         S65GU4nvlbGLBeJsVuZy3sjc9C2UnBfuOKJM7CKD7mHHAUawazVV8NXT9h+ojzOk0iCk
         sndzHb2tBbX5vOLDWQSE76IFKho3tz0VAlnIo93rHSAKFrRKudbEoc9gaIJxR21T9xI0
         N8qQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.b=OztqT1Km;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s29si3308938qts.355.2017.08.05.03.29.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 05 Aug 2017 03:29:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.b=OztqT1Km;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56135 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ddwKv-0003t3-EN
	for alex.bennee@linaro.org; Sat, 05 Aug 2017 06:29:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44825)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ddwKn-0003s9-W4
	for qemu-arm@nongnu.org; Sat, 05 Aug 2017 06:29:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ddwKm-0000Ab-QR
	for qemu-arm@nongnu.org; Sat, 05 Aug 2017 06:29:30 -0400
Received: from mail-wr0-x235.google.com ([2a00:1450:400c:c0c::235]:36033)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ddwKm-00009a-JM
	for qemu-arm@nongnu.org; Sat, 05 Aug 2017 06:29:28 -0400
Received: by mail-wr0-x235.google.com with SMTP id y43so24243581wrd.3
	for <qemu-arm@nongnu.org>; Sat, 05 Aug 2017 03:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=avR7gStxVzM3aNjxGPfhPrybJwCaqKC3HZhz5UHZYfs=;
	b=OztqT1KmzDCSattoo6bWLJxtF4oIekSaJhd6nlOVerdovHhloj6pdQ8ymw9SqeQ+pd
	JIuVHnxX1c23VE3Vm57syQEdnuufJK7U4WgOEKBFdg+ONyHVEMg5w7wcTqeMFYNkOBsQ
	AxuZ3imz5k1a9q1zN+XgLrSh6Ea33I3qMAyns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=avR7gStxVzM3aNjxGPfhPrybJwCaqKC3HZhz5UHZYfs=;
	b=cgZ0uUy0JyGgns0+c69sjwAtD3x7LAFPVnLFPmq2yGUPqJjEcdBK9TeC/jdq8ku15B
	dkttwxkpax7dgTtJnDlF6PKCcUpZxfennooWaR0SQ47Qt/U8oqzBggvjNP+a/5fUeVr7
	6nsuP+I+cRDDMDbPwQwBdKHu2Wys6bUyKW+EQ2IcOs0fpqPL2GEsePIYivwOWM/TtCuv
	IpiJBQDaisfpEArcHByhExiB4WdkirvK/6G6qLiqmsRL3r5UsC9WUb5Bm7CwVtI6I91V
	TejBGA2lgmc+a6/6JeqGzYFFv0+OdlKepHc/a3udl/RCQK1HIE1TWk3fBGnu3BFAahPD
	3r6w==
X-Gm-Message-State: AIVw113cuMI7i1xg1ScAQcfe8PvFp5puoCgkfkTXWnW6nU4S5artm1/y
	N98kTJLJ3ue5A1CfiMDgcKXVylMcHbLO
X-Received: by 10.223.160.229 with SMTP id n34mr4274831wrn.117.1501928967478; 
	Sat, 05 Aug 2017 03:29:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.54 with HTTP; Sat, 5 Aug 2017 03:29:06 -0700 (PDT)
In-Reply-To: <50d6ba4d-cfa3-5b5f-5da1-dca2326d4f5d@amsat.org>
References: <1501867249-1924-1-git-send-email-peter.maydell@linaro.org>
	<1501867249-1924-5-git-send-email-peter.maydell@linaro.org>
	<50d6ba4d-cfa3-5b5f-5da1-dca2326d4f5d@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 5 Aug 2017 11:29:06 +0100
Message-ID: <CAFEAcA9bHrS5QrT5dSeB_Eco8MdRbjuyHaqCNYfVfb+W3a==Hw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::235
Subject: Re: [Qemu-arm] [PATCH 4/8] boards.h: Define new flag
 ignore_memory_transaction_failures
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gPu01NB/Ox3B

On 4 August 2017 at 19:09, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wr=
ote:
> On 08/04/2017 02:20 PM, Peter Maydell wrote:
>> We need this for ARM boards, where we're about to implement support for
>> generating external aborts on memory transaction failures. Too many
>> of our legacy board models rely on the RAZ/WI behaviour and we
>> would break currently working guests when their "probe for device"
>> code provoked an external abort rather than a RAZ.

> I think some firmware will give some surprises, those probing device is n=
ot
> here and expect RAZ/WI. I remember some fw probing PCI space, or enumerat=
ing
> CS this way for ex.

PCI space is funny anyway because IIRC the PCI spec mandates
RAZ/WI (which is handled by QEMU's PCI implementation I think,
it doesn't fall out to the memory system's unmapped-address
handling).

That said: yes, possibly some guest code really wants the fault
(indeed the motivation for this patchset was having some test
guest code which wanted to see the faults), but that guest code
won't work on QEMU today, so if it doesn't boot on QEMU with
this patchsets that's not a regression. We can then (as the
issue arises) look at fixing whatever particular board model
it is to properly model or stub out all its devices so we
can boot that guest code without breaking existing working
guest code.

> RAZ/WI is a bus-feature, this is also bus-dependent to reply with abort o=
r
> behave RAZ/WI. Maybe the effort should be done on how model/use buses in
> QEMU? Bus device would be an alias of unimplemented_device, which current
> purpose is more debugging than avoiding unassigned physical access aborts=
.

You can model this kind of bus-dependent behaviour by having
the bus register a background region which implements the
default behaviour that is desired. (That way accesses to
that part of the address space don't ever respond with
a transaction error, which is what's happening on hardware
where the bus doesn't report errors.)

thanks
-- PMM
