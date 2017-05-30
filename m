Received: by 10.25.0.6 with SMTP id 6csp1805316lfa;
        Tue, 30 May 2017 06:00:35 -0700 (PDT)
X-Received: by 10.55.174.130 with SMTP id x124mr21447408qke.113.1496149235872;
        Tue, 30 May 2017 06:00:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496149235; cv=none;
        d=google.com; s=arc-20160816;
        b=swq9/edgo1WJkYmklA8Sp/2R8nRPClDZibWPDJIbwyqHSjc/a96E2HDR4A/jxV+lJb
         1aqx+Q9oD8au/BaZum6tpgC1584ATviJao0FGOXvF6QFjvJqJ+CdCpKZm6RxSqb2/YTv
         ZAaLNU5/UkKBrizIX/y8483G+CAtu7DM72uI6bRXN3m1aswj+J6csktJ5mXrZc3Omr0Q
         eIkGnO0NuSh5kBf5sr0o34mC82B58YwuRSwjqutWSzImEZzvGe9DSpSzsfITYmI8SpXI
         2DhdZgLrRJeiRxEqZgbnVYQxEvOM8hqQ3sil6OXOujHim+XL/Fr9SMrcB+k/q6nUu6LC
         IbIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=jQtdpVoTJPnHsJzVmVVVHO+TySIV5usAXsznNHBXKoA=;
        b=VBNHzR+DSSkwIJCa6aUdvk9VCdNTl+qIr3uLYI0SyRKasDMgI/7Py+iiDnfM0WNfZw
         xYDvyUaTEo9b2SrEaAE53u6FgJTeRiFFgbtim5SpE1HNyjElvSbFgMvw8hXD3g9JOA/E
         6d/iqUGcZdVcA2iN7tuUQJj9qS6Z3yl9RK363lb7mm8ygVB5mQxaEocz/Ixydu4l2LFH
         F4oE6TrQyL0A7k5HNzjhoP5a5C2G7bKzaTle51DzbtjMPZob7mlUh3nNBuEklfHAg7JN
         uv8W8P3BvcqjfaAEADTt7G2VEY5ghz0dNupUhDyx8NRPDpQr4pkV8bPUsdRtJ6zAuYEE
         Zbuw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e185si12911198qkc.116.2017.05.30.06.00.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 May 2017 06:00:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53656 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dFglH-00045O-CH
	for alex.bennee@linaro.org; Tue, 30 May 2017 09:00:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32985)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dFgl9-00044c-KF
	for qemu-arm@nongnu.org; Tue, 30 May 2017 09:00:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dFgl8-0007xF-Ip
	for qemu-arm@nongnu.org; Tue, 30 May 2017 09:00:27 -0400
Received: from mail-wm0-x22b.google.com ([2a00:1450:400c:c09::22b]:35137)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dFgl8-0007ww-9w
	for qemu-arm@nongnu.org; Tue, 30 May 2017 09:00:26 -0400
Received: by mail-wm0-x22b.google.com with SMTP id b84so91514635wmh.0
	for <qemu-arm@nongnu.org>; Tue, 30 May 2017 06:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jQtdpVoTJPnHsJzVmVVVHO+TySIV5usAXsznNHBXKoA=;
	b=Cd18aKeuTDoUfQYxi5gYhK1xSOkK4Bv+pUDBGPCVG5T2YxonKSGTCvXKT8pLv4jCep
	+Mn5wV9kMMlQt3q93tLJOZRdYeLPiOoTt+FINpMC7G/AOWsgoNkMG26+5wF0dHulyHR7
	l+DqyH87YzLERcV2yeYWZLrIymJFvxt8JqH64=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jQtdpVoTJPnHsJzVmVVVHO+TySIV5usAXsznNHBXKoA=;
	b=oX2V+t96sl5UZcP1bYVrd2X1KHJV0Fs9V04C2swSPU1VFkxJdiOq3phz0RRTOSjkff
	GG3Rs5FR4DJ9JLpqsrGFRxoSVBfMwk9RFc9RNm3pVDaCkKZn9FR19N0RuF3jbdUGUE1A
	/nSMt8Ua8hO6vvePbDHPI7P6LR2WrAgdI4fNRjtZAoIzNiIBj6cXBaHrOWabcOVj+Amf
	UCGxZC0JCWZlo72A3Jw5Vlie13wGedcxOUXqJ5zEhUez+drOETl1m9U9JWGLb8EBlT5w
	RS2FLqFgkhlDLjF4oGd5I484ElJRHJ8Rxx8slGmiv6qL+y/lSHyq7K0WUa27gs5bYD6l
	jgfQ==
X-Gm-Message-State: AODbwcAIL605KiA4pCaCoxg9Uc3pnUUmagIPaEQSfEdlpCVToOdjE1oo
	ajhEA8g2NjxL9wQDfifFtZFqBdHs5kll
X-Received: by 10.28.66.23 with SMTP id p23mr1566649wma.38.1496149225009; Tue,
	30 May 2017 06:00:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.135.82 with HTTP; Tue, 30 May 2017 06:00:04 -0700 (PDT)
In-Reply-To: <CAFEAcA9QY253FP9mj6CfyHoxLJ8F-NrxGJOMKiM_yFN-RE2Syw@mail.gmail.com>
References: <20170507181940.25882-1-krzk@kernel.org>
	<CAFEAcA9QY253FP9mj6CfyHoxLJ8F-NrxGJOMKiM_yFN-RE2Syw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 May 2017 14:00:04 +0100
Message-ID: <CAFEAcA-OQyy-puuGb=tJTA6a4CQgTo3Bj5PB=bUGOcHmk9neJw@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22b
Subject: Re: [Qemu-arm] [PATCH v2 0/3] hw/arm/exynos: QOM-ify the SoC
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zPvZGM7cGD3m

On 30 May 2017 at 13:07, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 7 May 2017 at 19:19, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>> Hi,
>>
>> Changes since v1:
>> =================
>> 1. s/RAM/DRAM/ in commit msg of first patch (as suggested by Philippe).
>> 2. Add Philippe's reviewed-by.
>>
>>
>> Convert the Exynos4210 SoC driver into QOM model.
>>
>> No external dependencies, rebased on v2.9.0-363-g0de9191deb14.
>>
>> Best regards,
>> Krzysztof
>>
>>
>> Krzysztof Kozlowski (3):
>>   hw/arm/exynos: Move DRAM initialization next boards
>>   hw/arm/exynos: Declare local variables in some order
>>   hw/arm/exynos: QOM-ify the SoC
>
>
>
> Applied to target-arm.next, thanks

...unfortunately I've just found that patch 3 breaks "make check":
tests/device-introspect-test subtest /arm/device/introspect/concrete
segfaults due to memory corruption. Running it under valgrind:

(cd build/x86 && QTEST_QEMU_BINARY="valgrind --vgdb-error=1
arm-softmmu/qemu-system-arm" QTEST_QEMU_IMG=qemu-img
MALLOC_PERTURB_=${MALLOC_PERTURB_:-$((RANDOM % 255 + 1))} gtester -k
--verbose -m=quick tests/device-introspect-test -p
/arm/device/introspect/concrete)
TEST: tests/device-introspect-test... (pid=8506)
  /arm/device/introspect/concrete:
==8508== Memcheck, a memory error detector
==8508== Copyright (C) 2002-2015, and GNU GPL'd, by Julian Seward et al.
==8508== Using Valgrind-3.11.0 and LibVEX; rerun with -h for copyright info
[etc etc]
==8508== Thread 2:
==8508== Invalid read of size 8
==8508==    at 0x394333: memory_region_unref (memory.c:1540)
==8508==    by 0x3908D9: flatview_destroy (memory.c:288)
==8508==    by 0x390951: flatview_unref (memory.c:302)
==8508==    by 0x8F9F9A: call_rcu_thread (rcu.c:272)
==8508==    by 0x1DF6E6B9: start_thread (pthread_create.c:333)
==8508==    by 0x1E28A82C: clone (clone.S:109)
==8508==  Address 0x2d400668 is 10,952 bytes inside a block of size
12,512 free'd
==8508==    at 0x4C2EDEB: free (in
/usr/lib/valgrind/vgpreload_memcheck-amd64-linux.so)
==8508==    by 0x7D7EDE: object_finalize (object.c:472)
==8508==    by 0x7D8DD5: object_unref (object.c:903)
==8508==    by 0x53A71B: qmp_device_list_properties (qmp.c:580)
==8508==    by 0x52B42E: qmp_marshal_device_list_properties (qmp-marshal.c:1355)
==8508==    by 0x8CE2B5: do_qmp_dispatch (qmp-dispatch.c:104)
==8508==    by 0x8CE3ED: qmp_dispatch (qmp-dispatch.c:131)
==8508==    by 0x3847E9: handle_qmp_command (monitor.c:3824)
==8508==    by 0x8D5812: json_message_process_token (json-streamer.c:105)
==8508==    by 0x90100C: json_lexer_feed_char (json-lexer.c:319)
==8508==    by 0x901154: json_lexer_feed (json-lexer.c:369)
==8508==    by 0x8D58B9: json_message_parser_feed (json-streamer.c:124)
==8508==  Block was alloc'd at
==8508==    at 0x4C2DB8F: malloc (in
/usr/lib/valgrind/vgpreload_memcheck-amd64-linux.so)
==8508==    by 0x1B7A5718: g_malloc (in
/lib/x86_64-linux-gnu/libglib-2.0.so.0.4800.2)
==8508==    by 0x7D7F34: object_new_with_type (object.c:483)
==8508==    by 0x7D7F90: object_new (object.c:494)
==8508==    by 0x53A5C6: qmp_device_list_properties (qmp.c:545)
==8508==    by 0x52B42E: qmp_marshal_device_list_properties (qmp-marshal.c:1355)
==8508==    by 0x8CE2B5: do_qmp_dispatch (qmp-dispatch.c:104)
==8508==    by 0x8CE3ED: qmp_dispatch (qmp-dispatch.c:131)
==8508==    by 0x3847E9: handle_qmp_command (monitor.c:3824)
==8508==    by 0x8D5812: json_message_process_token (json-streamer.c:105)
==8508==    by 0x90100C: json_lexer_feed_char (json-lexer.c:319)
==8508==    by 0x901154: json_lexer_feed (json-lexer.c:369)
==8508==

This is because the TYPE_EXYNOS4310 device now creates and maps
the exynos4220.chipid MemoryRegion into the system memory space
in its instance_init method, but it doesn't have any code for
unmapping it when the device is deleted. This test does a
"create but don't realize; then delete it" for each device, so
what happens is that the memory for the device is allocated on
create, freed on object deletion, and then referenced because
the MR is still in the system memory's flatview.

For devices like this exynos one which are never going to really
need to be deleted, the only requirement is that we can at least
do a create-delete so we can introspect them for information
about properties. This means that they shouldn't do things
like adding MRs to the system memory space until the realize
method. I think that should fix this problem.

I'm dropping this patchset from my queue.

thanks
-- PMM
