Received: by 10.25.0.6 with SMTP id 6csp219567lfa;
        Wed, 31 May 2017 01:50:02 -0700 (PDT)
X-Received: by 10.237.61.35 with SMTP id g32mr27638172qtf.60.1496220602634;
        Wed, 31 May 2017 01:50:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496220602; cv=none;
        d=google.com; s=arc-20160816;
        b=FB1bEQNFJmB8iHztaL39f1Wz2Ot8UY1FhYqiAtfyBuEThAtcsxK02AHHNyvXqOvVJh
         H6ZvUZaKLcL53uWNbvm7zUGgdTbPxYdkbsVH59SG02HbGomk0+oCatwhiTEs/22V/vLp
         pbtSVojAS4vZUKGcCg2SNMvtsA+21DGjm5hxVLjn4/+anyEC3O9HwJ0qiboYcQDwQnCD
         dOtWjl0XQm5E7IZ3ZeLDo9dHgn8HMtwpmbPYWYFyZJaioM2DhCbeg2LZ4g/hSj/LElB8
         pVw4ximePc/U6k+wX54b/5a9IWNHI2DBX/sbrtuUu36NfvoQba2n/dTqhNeaUH9ZFUrL
         XrlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dmarc-filter
         :arc-authentication-results;
        bh=N3K4YceSrpcmXEaty0A9RtvRr415jv5GSfjBO199CAc=;
        b=Pv/923YEPxTh56NJ+cpWAqdJG9waHVgEnib0tpc54jMKAr5ITVTDN7AszHmsr10DQb
         sRu+IUAIrMndzy89BaPIwZaKLzg4SakXzL8Rvtxn0pYhYfQs2Hie6mtfJQ68a5qP8nHC
         izrERza/Ne4dioQEmfeJauoFceHPROds7Ai5rmIZ0Y01N8Q0KtOPXoigSeg4fsP7q3k6
         jxltHxASVFCMsz74VUhLMs5BRtLtJmVRyqtEuJZNId12Jx2TBUmK6iAYhGehGMYBokH4
         Q4ICbHYNH0OhlCtiWmEc1KGFWXF6IZLHISNROMIcOSVYx9ETvoIqfTD7G599S0EZQTos
         Erbw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n5si15715205qta.123.2017.05.31.01.50.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 31 May 2017 01:50:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57932 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dFzKK-0006nw-13
	for alex.bennee@linaro.org; Wed, 31 May 2017 04:50:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55694)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1dFzK8-0006mE-KK
	for qemu-arm@nongnu.org; Wed, 31 May 2017 04:49:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1dFzK5-0003QK-Fk
	for qemu-arm@nongnu.org; Wed, 31 May 2017 04:49:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:37198)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <krzk@kernel.org>)
	id 1dFzK5-0003PO-62; Wed, 31 May 2017 04:49:45 -0400
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 85531238FD;
	Wed, 31 May 2017 08:49:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 85531238FD
Authentication-Results: mail.kernel.org;
	dmarc=none (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=krzk@kernel.org
Received: by mail-io0-f181.google.com with SMTP id f102so12113369ioi.2;
	Wed, 31 May 2017 01:49:42 -0700 (PDT)
X-Gm-Message-State: AODbwcDb4bI0CMFX5sSwI/eIifSKEM2/A6y7t0APmSnuUHNzw2wcH7Nc
	8jpRctPNan1NPsQO3hMrAm0Pp8TVkA==
X-Received: by 10.107.52.200 with SMTP id b191mr21348344ioa.150.1496220581950; 
	Wed, 31 May 2017 01:49:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.50.81 with HTTP; Wed, 31 May 2017 01:49:41 -0700 (PDT)
In-Reply-To: <CAFEAcA-OQyy-puuGb=tJTA6a4CQgTo3Bj5PB=bUGOcHmk9neJw@mail.gmail.com>
References: <20170507181940.25882-1-krzk@kernel.org>
	<CAFEAcA9QY253FP9mj6CfyHoxLJ8F-NrxGJOMKiM_yFN-RE2Syw@mail.gmail.com>
	<CAFEAcA-OQyy-puuGb=tJTA6a4CQgTo3Bj5PB=bUGOcHmk9neJw@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Wed, 31 May 2017 10:49:41 +0200
X-Gmail-Original-Message-ID: <CAJKOXPd5fuEx7tteH2vv8Tqae+xvuNikTMwLPsMVaP6fM93MGQ@mail.gmail.com>
Message-ID: <CAJKOXPd5fuEx7tteH2vv8Tqae+xvuNikTMwLPsMVaP6fM93MGQ@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.99
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
X-TUID: 0i7diV+n420y

On Tue, May 30, 2017 at 3:00 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 30 May 2017 at 13:07, Peter Maydell <peter.maydell@linaro.org> wrote:
>> On 7 May 2017 at 19:19, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>> Hi,
>>>
>>> Changes since v1:
>>> =================
>>> 1. s/RAM/DRAM/ in commit msg of first patch (as suggested by Philippe).
>>> 2. Add Philippe's reviewed-by.
>>>
>>>
>>> Convert the Exynos4210 SoC driver into QOM model.
>>>
>>> No external dependencies, rebased on v2.9.0-363-g0de9191deb14.
>>>
>>> Best regards,
>>> Krzysztof
>>>
>>>
>>> Krzysztof Kozlowski (3):
>>>   hw/arm/exynos: Move DRAM initialization next boards
>>>   hw/arm/exynos: Declare local variables in some order
>>>   hw/arm/exynos: QOM-ify the SoC
>>
>>
>>
>> Applied to target-arm.next, thanks
>
> ...unfortunately I've just found that patch 3 breaks "make check":
> tests/device-introspect-test subtest /arm/device/introspect/concrete
> segfaults due to memory corruption. Running it under valgrind:
>
> (cd build/x86 && QTEST_QEMU_BINARY="valgrind --vgdb-error=1
> arm-softmmu/qemu-system-arm" QTEST_QEMU_IMG=qemu-img
> MALLOC_PERTURB_=${MALLOC_PERTURB_:-$((RANDOM % 255 + 1))} gtester -k
> --verbose -m=quick tests/device-introspect-test -p
> /arm/device/introspect/concrete)
> TEST: tests/device-introspect-test... (pid=8506)
>   /arm/device/introspect/concrete:
> ==8508== Memcheck, a memory error detector
> ==8508== Copyright (C) 2002-2015, and GNU GPL'd, by Julian Seward et al.
> ==8508== Using Valgrind-3.11.0 and LibVEX; rerun with -h for copyright info
> [etc etc]
> ==8508== Thread 2:
> ==8508== Invalid read of size 8
> ==8508==    at 0x394333: memory_region_unref (memory.c:1540)
> ==8508==    by 0x3908D9: flatview_destroy (memory.c:288)
> ==8508==    by 0x390951: flatview_unref (memory.c:302)
> ==8508==    by 0x8F9F9A: call_rcu_thread (rcu.c:272)
> ==8508==    by 0x1DF6E6B9: start_thread (pthread_create.c:333)
> ==8508==    by 0x1E28A82C: clone (clone.S:109)
> ==8508==  Address 0x2d400668 is 10,952 bytes inside a block of size
> 12,512 free'd
> ==8508==    at 0x4C2EDEB: free (in
> /usr/lib/valgrind/vgpreload_memcheck-amd64-linux.so)
> ==8508==    by 0x7D7EDE: object_finalize (object.c:472)
> ==8508==    by 0x7D8DD5: object_unref (object.c:903)
> ==8508==    by 0x53A71B: qmp_device_list_properties (qmp.c:580)
> ==8508==    by 0x52B42E: qmp_marshal_device_list_properties (qmp-marshal.c:1355)
> ==8508==    by 0x8CE2B5: do_qmp_dispatch (qmp-dispatch.c:104)
> ==8508==    by 0x8CE3ED: qmp_dispatch (qmp-dispatch.c:131)
> ==8508==    by 0x3847E9: handle_qmp_command (monitor.c:3824)
> ==8508==    by 0x8D5812: json_message_process_token (json-streamer.c:105)
> ==8508==    by 0x90100C: json_lexer_feed_char (json-lexer.c:319)
> ==8508==    by 0x901154: json_lexer_feed (json-lexer.c:369)
> ==8508==    by 0x8D58B9: json_message_parser_feed (json-streamer.c:124)
> ==8508==  Block was alloc'd at
> ==8508==    at 0x4C2DB8F: malloc (in
> /usr/lib/valgrind/vgpreload_memcheck-amd64-linux.so)
> ==8508==    by 0x1B7A5718: g_malloc (in
> /lib/x86_64-linux-gnu/libglib-2.0.so.0.4800.2)
> ==8508==    by 0x7D7F34: object_new_with_type (object.c:483)
> ==8508==    by 0x7D7F90: object_new (object.c:494)
> ==8508==    by 0x53A5C6: qmp_device_list_properties (qmp.c:545)
> ==8508==    by 0x52B42E: qmp_marshal_device_list_properties (qmp-marshal.c:1355)
> ==8508==    by 0x8CE2B5: do_qmp_dispatch (qmp-dispatch.c:104)
> ==8508==    by 0x8CE3ED: qmp_dispatch (qmp-dispatch.c:131)
> ==8508==    by 0x3847E9: handle_qmp_command (monitor.c:3824)
> ==8508==    by 0x8D5812: json_message_process_token (json-streamer.c:105)
> ==8508==    by 0x90100C: json_lexer_feed_char (json-lexer.c:319)
> ==8508==    by 0x901154: json_lexer_feed (json-lexer.c:369)
> ==8508==
>
> This is because the TYPE_EXYNOS4310 device now creates and maps
> the exynos4220.chipid MemoryRegion into the system memory space
> in its instance_init method, but it doesn't have any code for
> unmapping it when the device is deleted. This test does a
> "create but don't realize; then delete it" for each device, so
> what happens is that the memory for the device is allocated on
> create, freed on object deletion, and then referenced because
> the MR is still in the system memory's flatview.
>
> For devices like this exynos one which are never going to really
> need to be deleted, the only requirement is that we can at least
> do a create-delete so we can introspect them for information
> about properties. This means that they shouldn't do things
> like adding MRs to the system memory space until the realize
> method. I think that should fix this problem.
>
> I'm dropping this patchset from my queue.

Thanks for hints, I'll fix it up and resend.

Best regards,
Krzysztof
