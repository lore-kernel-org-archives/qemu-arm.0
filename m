Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp2949222lfh;
        Mon, 30 May 2022 11:19:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxRQe3LBLwYWVjrfA6KHcCjsIH4ct6yEqn81+i8kek+0/cihDQC1UuTEZtiwB0AZjNzOdt6
X-Received: by 2002:a05:620a:20cf:b0:6a5:cdb:f6f3 with SMTP id f15-20020a05620a20cf00b006a50cdbf6f3mr24362571qka.657.1653934785636;
        Mon, 30 May 2022 11:19:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653934785; cv=none;
        d=google.com; s=arc-20160816;
        b=NWEJrJRdfQ3IBKrvcDIuV/o0kEQ2awJmOPdqmUBw0+e18FzZGpVJEPWH3Xf4X3XqZI
         wbH8Csy2/TdO+Hid2HoutQo4DjHIZYXAwEI3wSolSinwg/bdiv2oV//xq51jRdy/5Nuq
         AId3A2I7uSbXt9aBcYhbmwPKrtfo33Tkx9b+UkprTaVBJLmfuhWi/V5kYGksWerfzoyw
         P/RUL7RgmyennDWAFi1Zj4pkKLxVD1OaMeBJtDC8dV5sBnDtYMZn44xtM66iY0pBZkl1
         ZRYKmZTUAKADcvl4hKk/BO7r9/Im/2jyVNTWVF4G775zDpGGqIvFLthn6m0OpN5k2K2f
         5Dkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=HmtuxGx7mqYv0Ioj39xFAShbJOx1uoULmbVduHV5L2w=;
        b=IZWRNHX8bcHzv9jvOm1JLgKU5dR3hcNxWLgFsUqzszRcvOy0Tuld1Dq5di8H+1aWxM
         Jd+CYxpH6BuwEI1BqqyDf054O1n92FxfACywTBLkZc0cRqsZvPDUMu4j/mn2OC3TEOMM
         zX9IAUwIl/qvamCd7aXVlmmRAA+TsfIzyBkjFeuKuRcvJseAf9LgTsL6LYbu3KdT59Ot
         J6uV1DT4uSSzvHdT59D+mcUZ4pBW9VKpnw2vmMZu0J5RF2X3nCTuXa3TXEObJbiqjpkT
         gIYxbbWmLjUghzj2tWBxFeEYFtA4J2+QQQFsP1PBlqo9PrsaRa/Qfxvl2B0Ay60E+zY3
         82hQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gg12-20020a056214252c00b004626acc9f73si8209170qvb.61.2022.05.30.11.19.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 May 2022 11:19:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nvjzV-0002IV-5X
	for alex.bennee@linaro.org; Mon, 30 May 2022 14:19:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nvjvk-0006mM-Sd
 for qemu-arm@nongnu.org; Mon, 30 May 2022 14:15:53 -0400
Received: from 7.mo552.mail-out.ovh.net ([188.165.59.253]:59311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nvjvb-0002Nn-IM
 for qemu-arm@nongnu.org; Mon, 30 May 2022 14:15:52 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.139])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id AEB8026213;
 Mon, 30 May 2022 18:15:40 +0000 (UTC)
Received: from kaod.org (37.59.142.102) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Mon, 30 May
 2022 20:15:40 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R004ede8b802-f60b-423c-aaf3-169721ff9860,
 F546FDD43062DFA02F07D69E2A3A1257FC48A684) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <55bdb22a-18bd-03c8-1854-72db55da79b5@kaod.org>
Date: Mon, 30 May 2022 20:15:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: Help: How do I make a machine with 2 separate ARM SoC's?
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, Peter Delevoryas <pdel@fb.com>
CC: Cameron Esfahani via <qemu-devel@nongnu.org>, qemu-arm
 <qemu-arm@nongnu.org>
References: <8C1AB09A-AFB3-469A-8333-C3D1802D14AE@fb.com>
 <CAFEAcA8LnnAnTqSw5Mm_01KAORn9qVnNsWbouXpJ6X_B=sZ0hw@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CAFEAcA8LnnAnTqSw5Mm_01KAORn9qVnNsWbouXpJ6X_B=sZ0hw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: dd74bc4c-71a3-4918-a61f-fae6bbd7591b
X-Ovh-Tracer-Id: 705939242077490144
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrkeeigdduudelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=188.165.59.253; envelope-from=clg@kaod.org;
 helo=7.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: R6PiUpoUk2u5

On 5/30/22 18:53, Peter Maydell wrote:
> On Thu, 26 May 2022 at 23:14, Peter Delevoryas <pdel@fb.com> wrote:
>> Hey QEMU developers,
>>
>> Cedric mentioned here[1] that QEMU can support emulating a
>> more complete board, e.g. a machine with an AST2600 *and* an AST1030.
> 
> This is true, as long as all the CPUs are the same
> architecture family, e.g. all Arm CPUs. (Mixing A- and
> R- or A- and M-profile is OK, they just all have to be
> available in the same qemu-system-whatever binary.)
> 
>> I read through the memory API docs[2] and it mostly makes sense to me,
>> but what I don’t understand is, what does system_memory represent?
> 
> So, system_memory is something of a legacy from when QEMU was
> much older. Before the MemoryRegion and AddressSpace APIs were
> added to QEMU, everything that could initiate a memory transaction
> (CPUs, DMA-capable devices, etc) always saw the same view of
> memory. The functions to do memory accesses just operated on
> that view implicitly. (We still have some of them, for instance
> cpu_physical_memory_read() and cpu_physical_memory_write().) The
> MemoryRegion/AddressSpace APIs are much more flexible and allow
> different memory transaction initiators to see different views, as
> real hardware does. But for backwards compatibility we still have
> the old assumes-one-view APIs. The view those APIs use is the
> "system memory". We also have some device models which have been
> converted to use an AddressSpace to do their DMA operations, but
> which assume they want to use address_space_memory (which is the AS
> corresponding to the system_memory MR) instead of taking a
> MemoryRegion as a QOM pointer and creating an AddressSpace for it.
> 
> In the modern view of the world, you can build up a system with
> a set of MemoryRegions. Typically you can start with an empty
> container, and the board code fills it with board-level devices,
> then passes it to the SoC code, which fills it with SoC devices,
> and passes it again to the CPU object, which creates an AddressSpace
> so it can initiate transactions into it. By making that initial
> "empty container" be the global system_memory MemoryRegion, this
> makes the legacy APIs and devices that still use it basically work.
> 
>> Or, what should the layout be for a situation like I’m interested in,
>> where you have an AST2600 and an AST1030 (and actually, maybe even
>> an x86 CPU too? idk if that would be possible).
> 
> Cross-architecture heterogenous board models can't be done today:
> the qemu-system-foo binaries compile-time build in some assumptions
> about specifics of the guest architecture. (This is something it would
> be nice to fix, but the amount of work is pretty big and hairy, and
> thus far nobody's had a pressing enough need for it to try to tackle it.)
> 
>> I need to make sure each SoC runs in a different address space, right?
>> But, how do I actually do that? Do I model it as two containers inside
>> the large system_memory container, or as two different containers
>> that get swapped in for system_memory when executing their associated
>> CPU?
> 
> The best way to think about QEMU's AddressSpace type is that it is
> the interface you use to initiate memory transactions. You create
> one from a MemoryRegion. When SoC and board code is building up its
> view of the world, what it is really creating and passing around is
> a hierarchy of MemoryRegions. It's only when the SoC code hands a
> MemoryRegion to a CPU or a DMA-capable device that that device says
> "I will need to make transactions to this, let me create the
> corresponding AddressSpace".
> 
>> I was having trouble figuring out what the Xilinx boards are actually
>> doing in this case. Does each CPU share peripherals, or are the
>> A + R cpu’s actually in separate address spaces? I’m very confused lol.
> 
> xlnx-versal-virt is a virtual board, so ignore that one: it's
> probably more confusing than helpful. The xlnx-zcu102 board
> uses the xlnx-zynqmp SoC, and that SoC has both R and A profile
> CPUs in it, but they both see basically the same view of the
> world because they're in the same SoC.
> 
> Another device that does some moderately complicated things with
> MemoryRegions is the hw/arm/armsse.c SoC, which has several CPUs
> and has some per-CPU devices.
>
> I think we have not thus far had a model of a board where different
> CPUs see radically different things (only ones where they can see
> minor differences), so you'll probably run into places where the
> APIs are a bit clunky (and we can perhaps have a go at making
> them a bit less so). What I would do is make the system_memory
> container be used by whatever is the "main" application processor
> SoC in your board. 

I think Peter D. wants to emulate a machine with a  BMC board (ast2600)
and a SCP-like SoC (ast1030) running zephir. Correct me if I am wrong.
That's a first step.

> If the two SoCs really see absolutely different
> worlds with no shared devices at all, then you'll want to create
> a new empty container for the second SoC. 

yes.

> If they do have some
> board-level shared devices, then you'll want to do something a little
> more complicated with aliases.

The first device would be a shared I2C bus to communicate. I haven't
looked deeply how complex it would we to plug a slave model of the
first SoC on a bus of the second SoC.

> If you find the SoC device models you're using hardcode use of
> system_memory or address_space_memory you should treat those as
> bugs to be fixed. 

There are a few get_system_memory() left in aspeed SoC (UART, SRAM)
that could be fixed easily and upstream. The rest should be clean
enough.

> Other loose ends (like monitor commands that
> assume the system address space) can be ignored: having those
> operate on the 'application processor' SoC is fine, I think.
> 
> Overall, this is definitely doable but will involve a fair
> about of slogging through territory where nobody has yet
> broken a trail for you :-)


I am around. We can start building the machine on a GH branch and
feed mainline with updates while it's getting ready.


Thanks for the feedback.

C.

