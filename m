Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp7033109wrw;
        Thu, 15 Nov 2018 05:55:16 -0800 (PST)
X-Google-Smtp-Source: AJdET5cqRsPhRvbuo9yrDAdnQEV581FD/zOTDbeE62EToti79/sposffEErVHfvAtaSNxR4PNssV
X-Received: by 2002:aed:24c2:: with SMTP id u2mr5851646qtc.230.1542290116855;
        Thu, 15 Nov 2018 05:55:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542290116; cv=none;
        d=google.com; s=arc-20160816;
        b=hkumxbK/77jyCKWne/+HIkMtQ8ZjWfVSMgjhx1ec+7/VyWLgY+Feepm+j1xpnVK+27
         I96B075xpZ/cKd+jhkBrT/Gs1xjNQjIaGlg+hywRBGsfMSYTAj7M4eKTEIIRaI82tSnJ
         ZdQ/cjhgupQQMr1Nbg2h4ZUjw4hf5p4L2Cs5UfStsrBgpB8T27SGa7jCq/Tk2AlJs8BM
         GwIF8dL/UZ1RxhfiULn/1ntIL6vkAgeKu0qX167sbF2Bp01ZzQSooNZ9avylkkW+Qej8
         1RHJZKrMLaNWKyVfqrm4zRtRLwPfG4xAaGWEmbXv9SIEePc3sCmiHzLkk23ISyYf5A/O
         V/gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=2StxqoXpgFycCXCjPXaT/HWsSqWymVOLdBPMnALdbhE=;
        b=Fkdz2UIF5CmgyPbASOR6JK5kOGkI41D/s9s5oTquKwQn4CPCoTsDBwiwuOo1ZVhduw
         T9FanaTgUj2DprKB2ggrI6Hd4LWJPfOaTcgbnFzxIu4Bv7zBCPqsJPjDAOqPRgG6mug5
         uZXy13ey9TwUd4UV584CTa4BCLOBcHt0jDRgVv+obXlasexRiEvd0emrS1CqQUWE9Ixx
         H4opeDTgY2OOYY6NVVzKOAZVOHFPaNnKRTrtUXpMGXolDfoXDCVQ7qhWXjinyPim5Ymg
         AI1a3abeMenm7FW1xWGzMfoYrouq/Sq00gPXlMNTwdQCoQpAS91cg6pkU6QqfPCyCUAV
         gKuw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jNd3+4jm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 4si2846292qtw.283.2018.11.15.05.55.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Nov 2018 05:55:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jNd3+4jm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38918 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNI72-0002WO-8e
	for alex.bennee@linaro.org; Thu, 15 Nov 2018 08:55:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49863)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gNI5l-000251-0a
	for qemu-devel@nongnu.org; Thu, 15 Nov 2018 08:53:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gNI5k-0006E3-6u
	for qemu-devel@nongnu.org; Thu, 15 Nov 2018 08:53:56 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:40215)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gNI5j-0006Dj-LU
	for qemu-devel@nongnu.org; Thu, 15 Nov 2018 08:53:56 -0500
Received: by mail-oi1-x242.google.com with SMTP id u130-v6so16763236oie.7
	for <qemu-devel@nongnu.org>; Thu, 15 Nov 2018 05:53:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2StxqoXpgFycCXCjPXaT/HWsSqWymVOLdBPMnALdbhE=;
	b=jNd3+4jmA0PianQ6kb1wl/l0a//iecaYGlHCIr3Mj4CV+md5VvfaI1mid+yrZUxgJj
	0U8OZumEoz7QqB2Bae2RphRReW5loBlMIcZlFyJs+k/Hg5cOglogEKIwaP7ERr8KFfhS
	B5XXgLzXFZb+CT9kK0nVCGOvB5UQ8mavxw03c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2StxqoXpgFycCXCjPXaT/HWsSqWymVOLdBPMnALdbhE=;
	b=kaGH7PJAdLOmNn011tgzelAxiqlb2tJw3tou4JTJOEAwOhm9IkNon7/SGmycC1B4xS
	0/EephIaKT25o9z6ryitaSGHh0B7F8b9h/7kQvbu2NnMhbI1NrUm2saGzc2f8ESwmNbA
	mHvgJUNWdcfuIoUvncunow8nZmJKmwMmCLx7caPFs9oG/ZgHf05SfXtHXTMlHSpR+KUy
	JV/cfKZBsH1bK9zHZKhId4WY8gbskWQvpMjt/D0MQOy1jB4ajFopnHAnH+WE9OIcnS8L
	U4RiBGfXV1k+sHkxwpJHoIKxqce+4sq1tW8dXvx/3lUuagYbPlrdxxsBSp6EdLItuYmG
	y3HQ==
X-Gm-Message-State: AGRZ1gL5vsrto1m60Otw6r/NxC5ZVSDyXq+ECignI/eSV4mpNkUPW+Dx
	zXwSpSHJRaQBNyu3c9SfkqiAtNOvt/YAzwP1yXLkqQ==
X-Received: by 2002:aca:ed92:: with SMTP id l140mr326802oih.112.1542290035003; 
	Thu, 15 Nov 2018 05:53:55 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:4b0e:0:0:0:0:0 with HTTP; Thu, 15 Nov 2018 05:53:34
	-0800 (PST)
In-Reply-To: <7e05e89a-6eec-257d-03af-78a2d2b60628@twiddle.net>
References: <20180710160013.26559-1-peter.maydell@linaro.org>
	<20180710160013.26559-6-peter.maydell@linaro.org>
	<3ac12d41-2095-f0ad-db1b-0e3ceea8f44e@redhat.com>
	<7e05e89a-6eec-257d-03af-78a2d2b60628@twiddle.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Nov 2018 13:53:34 +0000
Message-ID: <CAFEAcA-cE1cBe3BAxMRbdNjtHde3XGf842rqdc8gV8bN7WHNHQ@mail.gmail.com>
To: Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-devel] [PATCH 5/6] accel/tcg: Return -1 for execution
 from MMIO regions in get_page_addr_code()
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
Cc: Thomas Huth <thuth@redhat.com>, "patches@linaro.org" <patches@linaro.org>,
	"Emilio G . Cota" <cota@braap.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	KONRAD Frederic <frederic.konrad@adacore.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3T5n2aK248TA

On 15 November 2018 at 07:32, Richard Henderson <rth@twiddle.net> wrote:
> On 11/14/18 6:19 PM, Thomas Huth wrote:
>> Program received signal SIGSEGV, Segmentation fault.
>> [...]
>> (gdb) bt
>> #0  0x0000555555addc68 in onenand_read (opaque=0x555557600600, addr=98304, size=4) at hw/block/onenand.c:612
>
> So the crash is an off-by-one on the line above:
>
> --- a/hw/block/onenand.c
> +++ b/hw/block/onenand.c
> @@ -608,7 +608,7 @@ static uint64_t onenand_read(void *opaque, hwaddr addr,
>      int offset = addr >> s->shift;
>
>      switch (offset) {
> -    case 0x0000 ... 0xc000:
> +    case 0x0000 ... 0xbfff:
>          return lduw_le_p(s->boot[0] + addr);
>
>      case 0xf000:       /* Manufacturer ID */
>
> as the memory segment has size 0xc000.

Presumably it should be ... 0xbffe, since we are
doing a 16-bit load ?

> The guest will now eventually crash with
>
> onenand_read: unknown OneNAND register c000
> ...
> onenand_read: unknown OneNAND register fefe
> qemu: hardware error: onenand_read: implement ECC
>
> CPU #0:
> R00=00000000 R01=00000000 R02=00000000 R03=00000000
> R04=00000000 R05=00000000 R06=00000000 R07=00000000
> R08=00000000 R09=00000000 R10=00000000 R11=00000000
> R12=00000000 R13=00000000 R14=00000000 R15=0001fe04
> PSR=400001d3 -Z-- A svc32
> s00=00000000 s01=00000000 d00=0000000000000000
> s02=00000000 s03=00000000 d01=0000000000000000
> s04=00000000 s05=00000000 d02=0000000000000000
> s06=00000000 s07=00000000 d03=0000000000000000
> s08=00000000 s09=00000000 d04=0000000000000000
> s10=00000000 s11=00000000 d05=0000000000000000
> s12=00000000 s13=00000000 d06=0000000000000000
> s14=00000000 s15=00000000 d07=0000000000000000
> s16=00000000 s17=00000000 d08=0000000000000000
> s18=00000000 s19=00000000 d09=0000000000000000
> s20=00000000 s21=00000000 d10=0000000000000000
> s22=00000000 s23=00000000 d11=0000000000000000
> s24=00000000 s25=00000000 d12=0000000000000000
> s26=00000000 s27=00000000 d13=0000000000000000
> s28=00000000 s29=00000000 d14=0000000000000000
> s30=00000000 s31=00000000 d15=0000000000000000
> FPSCR: 00000000
> Aborted (core dumped)
>
> I'll note that fprintf at the end of onenand_read should be
> qemu_log(LOG_GUEST_ERROR) instead.

Yeah, I'll put together a patch which makes it use the qemu_log
facilities rather than fprintf() and hw_error(). With that
plus the case statement fix then QEMU correctly just sits there
as the guest execution races through memory...

thanks
-- PMM
