Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp1584241wrq;
        Thu, 12 Jul 2018 09:49:34 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpc1ukmtBNtvnZDlgMP9RTNgfJXywWMKdnTaAPvlqe2Mr9BSb3l2rhDnswvPuilro/fqwx61
X-Received: by 2002:a0c:83c4:: with SMTP id k62-v6mr3286107qva.88.1531414174798;
        Thu, 12 Jul 2018 09:49:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531414174; cv=none;
        d=google.com; s=arc-20160816;
        b=gzL5QKkYq6QzwNxA9WGJrVDeZNorN0xV335JlzHhtfnhY8w84UmcRkWo5Kj+/zpQDm
         c02yzG4nGvhiPO9LCjVaUFHapu5TUlVzUs3qPB3D3zMcURwBslqrjFrmhWCz92tOnH1Y
         itwPszV9WAFgmzJumP+HA23HkFb8uO0uduGteoisp8BjIUEIIJy98u3umdu6oF+8xTQn
         xCXlqSBn7e/a/H4Z8armYFXziMLqFNWVyjiaKxNwrm05K0LbR/WOm1ZeVmeM9LoTXKSB
         0fhRzu5jvDMmz9dX4CrokVAvEbKx60YLFq4ePzWzoBwZUL5Wjwg5xIkcQL/JvfuMmCxD
         dA0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :mime-version:dkim-signature:arc-authentication-results;
        bh=6cHMDmmW9Y9pgiW0SA4d02ZU3XaL2ZzZLlpTRy0fGpk=;
        b=I4+9m8UDgm+7m8w79W18oKKFQeIhjcgxOnoeqQ2zYuCoSNl/W8KRWMuW40cfxBEGYs
         1hVMJxqmtcPlHILKmrz5i3OoNMzxxMPxSG0V8qg5Cd//o/yh2C3mepsl1F2e0uuiP3jt
         hNFP/73gOGHB2g96OiKkm7OrcP7gbUDuSGfGEDi6LYXVkMVYue7rokpiICsKkPorCrLq
         l5BVSvSxwVsKIcB7rkaaDxjLNfgciLe6RM/GLQ3RdIuQaQAxTUjZ6cM5qRPM/fHLrjYl
         fkouqfMrCHj2tBfDQA7fILZEFm/GJLTr09OQawF5GBRjsAQmjEliBEdoxEZ3Oy+jclkW
         SsSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@umich.edu header.s=relay-2016-05-12 header.b=PFkHRKdj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=umich.edu
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y68-v6si4683397qka.32.2018.07.12.09.49.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Jul 2018 09:49:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@umich.edu header.s=relay-2016-05-12 header.b=PFkHRKdj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=umich.edu
Received: from localhost ([::1]:33087 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fdemc-0006ID-D3
	for alex.bennee@linaro.org; Thu, 12 Jul 2018 12:49:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34211)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kevlough@umich.edu>) id 1fdem9-0006GK-EL
	for qemu-devel@nongnu.org; Thu, 12 Jul 2018 12:49:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kevlough@umich.edu>) id 1fdem4-0000n7-IY
	for qemu-devel@nongnu.org; Thu, 12 Jul 2018 12:49:05 -0400
Received: from smtp.mail.umich.edu ([141.211.12.86]:52080
	helo=tombraider.mr.itd.umich.edu)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <kevlough@umich.edu>)
	id 1fdem4-0000j8-8D; Thu, 12 Jul 2018 12:49:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umich.edu;
	s=relay-2016-05-12; t=1531414135;
	bh=TsVlA63d/rcOjNpULfN/kV9Sqx5h4ntm2rDfC1Zo/zg=;
	h=From:Date:Subject:To;
	b=PFkHRKdjab9QjuamIC+JvpDeg9EjCtayM4p5+0cQ01UVqBAenT7WdHHXxf0z+0qzE
	Vvcs0AzuE3JHSInf4BAIzzX84otIvImYfooLIYEzYsuSMAJy+EZpl+X5YjSMJMZj6w
	84W9nZeO4lbjqq8pKNNqQ/tsoyb8bUqVPP/9xmQODLhxQdiX9rdETz43MpHPpscL19
	xXQ7zYEuxNcXDSJAljaKRGL8e3P+huO57VNSNrPCkBryFDPNS95b9fAeK+qiajcny3
	ey1m9s7Q/KmxLVYgAecYsEtb/eQ7vJ89cdctmtxM+l29NtEoSK8GCiZQ12GC0QBtIa
	sIIfXcUHUkJRA==
Authentication-Results: tombraider.mr.itd.umich.edu;
	iprev=pass policy.iprev=209.85.221.47 (mail-wr1-f47.google.com);
	auth=pass smtp.auth=kevlough
Received: FROM mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	By tombraider.mr.itd.umich.edu ID 5B478676.E77EB.21566;
	Authuser kevlough; Thu, 12 Jul 2018 12:48:55 -0400
Received: by mail-wr1-f47.google.com with SMTP id b15-v6so22424587wrv.10;
	Thu, 12 Jul 2018 09:48:54 -0700 (PDT)
X-Gm-Message-State: AOUpUlGkZgxL53nm1vyRhd82+v5c4LtNJIxqKskgUCk7iAqAB+P36oUe
	B6y8nM0IqFVP/4taN3F/GfakS7TJARdamTkWj3M=
X-Received: by 2002:adf:9c12:: with SMTP id
	f18-v6mr2406489wrc.93.1531414133523; 
	Thu, 12 Jul 2018 09:48:53 -0700 (PDT)
MIME-Version: 1.0
From: Kevin Loughlin <kevlough@umich.edu>
Date: Thu, 12 Jul 2018 12:48:42 -0400
X-Gmail-Original-Message-ID: <CAB30WPccergMTSWWrwj-WhTCcaMvvW7vnAMO3qvy9b9B53N=zA@mail.gmail.com>
Message-ID: <CAB30WPccergMTSWWrwj-WhTCcaMvvW7vnAMO3qvy9b9B53N=zA@mail.gmail.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-discuss@nongnu.org
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x [fuzzy]
X-Received-From: 141.211.12.86
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: [Qemu-devel] Native Memory Virtualization in qemu-system-aarch64
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Hu88lmEy5n/0

I know TrustZone has support for memory virtualization in AArch64, but I'm
looking to create a different model. Namely, I'd like to fully virtualize
the memory map for the "virt" board.

As a basic example of what I want, assuming an execution environment that
runs in a 1GB physical address space (0x0 - 0x3FFFFFFF), I'd like to be
able to switch to a second execution environment with a distinct SW stack
that runs in the second GB of a board memory (0x40000000 - 0x7FFFFFFF). The
key points for my desired memory virtualization are the following...

   1. Both of these environments should have distinct virtual address spaces
   2. The OS in each environment should believe it is running on physical
   addresses 0x0 - 0x3FFFFFFF in both cases.
   3. Neither environment should have access to the physical memory state
   of the other

I initialize distinct AddressSpace and MemoryRegion structures for each of
these GB blocks. Because all I want is a simple shift of physical address
for one environment, I hesitate to mirror the (relatively) complex address
translation process for TrustZone. Does anyone know if it would be better
to either (a) provide custom read/write functions for the shifted
MemoryRegion object, or (b) modify the target/arm code, such as adding a
shift to get_phys_addr() in target/arm/helper.c?

Thanks in advance,

Kevin
