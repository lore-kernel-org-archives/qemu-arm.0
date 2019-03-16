Received: by 2002:a5d:4d11:0:0:0:0:0 with SMTP id z17csp286973wrt;
        Sat, 16 Mar 2019 03:34:19 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwbu0icPr7U9socOBUXx6lEyqNZ4hdRBdzIQ3nQ2rATQOFwFqMFoYMocD2VSZkGng+rGe3v
X-Received: by 2002:a1c:4d:: with SMTP id 74mr4729802wma.129.1552732459733;
        Sat, 16 Mar 2019 03:34:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552732459; cv=none;
        d=google.com; s=arc-20160816;
        b=o9GVAPm6rur2quvqVynfqHd1h5A7iST76Mie+hZ9DHFsl/XSZyEcd2eWOlnlCa/ThZ
         FqPEH/60fq8g3IFRL7BSkXxms+zAYOapAR1dVDHVCnu/N3ft1hqipgmVJbB/XjJnaTu6
         8vnJ9sivToliejRengHc8128lIFdoLytB55wgBadI2nE/UN/gNJ7HUvXJ8uwtare5Xkp
         GHhJvYD23Md5Ho9k/oo+Ar3qy/mSzAxMDVmoOhf6M5l2AJM89oRviRRdExgITbgTyoRO
         RX2JmBPUdWibSqbjx2kKhNrqxOTOy+g4JjjGfuhFVLC25yivjbs/8itTgmclrPNVXmkB
         l59w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject:user-agent
         :in-reply-to:content-disposition:mime-version:references:message-id
         :to:from:date:dkim-signature;
        bh=Liafo5zMUZ8lkJj3jikSjBJ+azJHuviiLCH257GdK/w=;
        b=Jk+CPPP4up5SmgcJT6wure8dVt5pzNxrSaZRbDl3tVxva4H8rzi5V6D8tOImvbw3x7
         RFGK8/kZbtkzZB2MMmBg09RDuXa3oP1fRT6Zyx91wBDJ72srt1ZqT2LoRnxlcKRzA7Pz
         NLD0o4sycGP0k50SV5WDUOGgsD0zEzSele34gal87l3E1LDPgLZC6401EFoHOWF5Uy1z
         5tuFQKskKQp8S98dD0CP07v+lx9r5t/PR3Xariu8Q2YlW4ZZoOpOxq8wCw78985gyKDm
         EDIV3zsBGFzC8hQCUbO4THQqLjhgJxtKCY+rJsxZsD6bKEQtxNJeT88U88RL+LGuhsCU
         gODg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=cRDn2L4G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i14si255737wru.352.2019.03.16.03.34.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 16 Mar 2019 03:34:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=cRDn2L4G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:39932 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h56du-0003WR-MC
	for alex.bennee@linaro.org; Sat, 16 Mar 2019 06:34:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52165)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>) id 1h56da-0003Rt-BM
	for qemu-arm@nongnu.org; Sat, 16 Mar 2019 06:33:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>) id 1h56bA-0001rU-OL
	for qemu-arm@nongnu.org; Sat, 16 Mar 2019 06:31:29 -0400
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:45740)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.weiyang@gmail.com>)
	id 1h56b9-0001qD-Bc; Sat, 16 Mar 2019 06:31:27 -0400
Received: by mail-ed1-x543.google.com with SMTP id m16so3089564edd.12;
	Sat, 16 Mar 2019 03:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=Liafo5zMUZ8lkJj3jikSjBJ+azJHuviiLCH257GdK/w=;
	b=cRDn2L4GItci0suRFkJiWL8rW8PptcsD+O2kJl4lC9mO3oZkRspN1z4+EizI1ONkoV
	Xj1lwaDM7TpByxVkPsfCCY/rMnO5+s8DUmY3lKXf2M6dIToPmIU1tStlbY7kXW1AYioh
	tabjW2o7bP67Cm1z5RG33L/WH5G695viwEMpURPggIOFTBdE2LNb2Puuv8eyYGV8hx5u
	OtYClBGcegujbwCTVsr8h30CWexdwOe4dvWYDqE6DO3t2DEqTVq2FTmVsvH2wFT0x2EX
	939geyksJVlVDZBEX1MmOMA4wMrW+I9NfkY5Il/IYsfAx8sORiu8JNnhi4mMFX78UZyM
	ogWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
	:references:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Liafo5zMUZ8lkJj3jikSjBJ+azJHuviiLCH257GdK/w=;
	b=XwaohQf9t+yFXonEHkcDVp3KvHeuO0QMXFOWPETYwze62yl1SQiaUg7datD+8Pd9Yy
	XcwEc1+cF43VyvG/Z2lePDuRzNxyNAEybPhNVi+sMWe4uUyTxqdDaH+YKvUFA2MpZmq4
	BRhBzG+MM8HEmeYHjQ1+BnWXDRqcGq+OT/9/QD7kNr4zJK0hbsfJZCnZYibL/4AIPN3t
	RhwjbCuRUyvHV9n6QDX3WgEiAM7zLFsrFXflTQagAmhrl+c78KZTgA8rJNTGPB8NuznO
	rm1MDcrggaYZZ65xeuaXJSQGZWol6WTpmLFvTM0tpXb44UZ2/O+5g0ZiPwLmMS7Rs7es
	Lrzw==
X-Gm-Message-State: APjAAAUkYJLBoyZxjiEFr1t9HSSzPToQSJ5RTAu22/o/zT6EfmfnOtsf
	Np3NaVTajK2bpGLgDokfRT4=
X-Received: by 2002:a50:97d5:: with SMTP id f21mr5860378edb.293.1552732285704; 
	Sat, 16 Mar 2019 03:31:25 -0700 (PDT)
Received: from localhost ([185.92.221.13])
	by smtp.gmail.com with ESMTPSA id i9sm992893ejc.67.2019.03.16.03.31.24
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 16 Mar 2019 03:31:24 -0700 (PDT)
Date: Sat, 16 Mar 2019 10:31:24 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20190316103124.qeu4dz67adezijtn@master>
References: <20190313044253.31988-1-richardw.yang@linux.intel.com>
	<20190313044253.31988-4-richardw.yang@linux.intel.com>
	<20190313132300.3f56a5ca@redhat.com>
	<20190313133359.h2njohyijgvkcbtv@master>
	<20190313170943.5384f5cf@redhat.com>
	<20190313213137.acncaz7duosjybnf@master>
	<20190314101830.6e10d4d5@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190314101830.6e10d4d5@redhat.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::543
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC PATCH 3/3] hw/acpi: Extract
 build_mcfg
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
Reply-To: Wei Yang <richard.weiyang@gmail.com>
Cc: peter.maydell@linaro.org, mst@redhat.com, qemu-devel@nongnu.org,
	Wei Yang <richard.weiyang@gmail.com>, shannon.zhaosl@gmail.com,
	qemu-arm@nongnu.org, Wei Yang <richardw.yang@linux.intel.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3sDhM27M5PVT

On Thu, Mar 14, 2019 at 10:18:30AM +0100, Igor Mammedov wrote:
>On Wed, 13 Mar 2019 21:31:37 +0000
>Wei Yang <richard.weiyang@gmail.com> wrote:
>
>> On Wed, Mar 13, 2019 at 05:09:43PM +0100, Igor Mammedov wrote:
>> >On Wed, 13 Mar 2019 13:33:59 +0000
>> >Wei Yang <richard.weiyang@gmail.com> wrote:
>> >  
>> >> On Wed, Mar 13, 2019 at 01:23:00PM +0100, Igor Mammedov wrote:  
>> >> >On Wed, 13 Mar 2019 12:42:53 +0800
>> >> >Wei Yang <richardw.yang@linux.intel.com> wrote:
>> >> >    
>> >> >> Now we have two identical build_mcfg function.
>> >> >> 
>> >> >> Extract them to aml-build.c.
>> >> >> 
>> >> >> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
>> >> >> ---
>> >> >>  hw/acpi/aml-build.c         | 30 ++++++++++++++++++++++++++++++
>> >> >>  hw/arm/virt-acpi-build.c    | 16 ----------------
>> >> >>  hw/i386/acpi-build.c        | 31 +------------------------------
>> >> >>  include/hw/acpi/aml-build.h |  1 +
>> >> >>  4 files changed, 32 insertions(+), 46 deletions(-)
>> >> >> 
>> >> >> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
>> >> >> index 555c24f21d..58d3b8f31d 100644
>> >> >> --- a/hw/acpi/aml-build.c
>> >> >> +++ b/hw/acpi/aml-build.c    
>> >> >

[...]

>> >I mean do not call build_mcfg() at all when you don't have to.
>> >
>> >And when you need to keep table_blob the same size (for old machines)
>> >using acpi_data_push() to reserve space instead of build_mcfg(sig="QEMU")
>> >might just work as well. it's still hack but it can live in x86 specific
>> >acpi_build() keeping build_mcfg() generic.
>> >  
>> 
>> Seems got your idea.
>> 
>> >As for defining what to use as criteria to decide when we need to keep
>> >table_blob size the same, I don't remember history of it, so I'd suggest
>> >to look at commit a1666142, study history of acpi_ram_update() and
>> >legacy_acpi_table_size to figure out since which machine type one doesn't
>> >have to keep table_blob size the same.
>> >  
>> 
>> OK, let me study the history first.
>> 
>> BTW, the legacy here is hardware specification level or qemu software
>> design level?
>it's QEMU only, you need to find a version of QEMU (machine type)
>which didn't have re-sizable MemoryRegion and the next version most likely
>would have a knob somewhere in machine class definition saying that we don't
>care about sizes anymore or care about sizes only for previous machine types.

I have got something, but not sure this is correct. So I'd like to
summarize them here first.

The following commits are ordered in timeline.

1. First we introduced resizable MR.

    a1666142db 2015-01-08 acpi-build: make ROMs RAM blocks resizeable
    60786ef339 2015-01-08 memory: API to allocate resizeable RAM MR

2. Then acpi_ram_update in introduced

    339240b5cd 2015-04-27 acpi-build: remove dependency from ram_addr.h
    42d859001d 2015-02-26 acpi-build: fix ACPI RAM management

3. After that we introduce 2.4 machine type

    5cb50e0acc 2015-04-27 pc: add 2.4 machine types

But I don't find a comment stating we don't care about sizes anymore.

Below is my understanding of the dummy table history. 

Before resizable MR was introduced, the dummy table is used to be a
place holder so that we could add real table in acpi_build_update().
Othersize the new ACPI table is bigger to be placed into
build_state->table_mr.

If this is correct, after commit a1666142db ACPI table has the
capability to expand itself and not necessary to pre-allocate the dummy
table. Can I say after commit a1666142db, we don't need to put a fake
table in ACPI?

Another confusion is in the comment of build_mcfg(). In which aspect, it
relates to migration? Is this before resizable MR introduced?

-- 
Wei Yang
Help you, Help me
