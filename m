Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp7264737wru;
        Tue, 24 Jul 2018 14:24:53 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfgLsf87LINszxdbtpPmtL10oonQRLJCTqg6Dur/OT/OyjkaGtju6gS7V15BrGWIA6+06c/
X-Received: by 2002:a37:284a:: with SMTP id o71-v6mr16432921qkh.176.1532467493321;
        Tue, 24 Jul 2018 14:24:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532467493; cv=none;
        d=google.com; s=arc-20160816;
        b=Zm0Wn9raTzt03zYBxXWGGrPwgiyDPrRgAyeBef/qT5cRLkPfJavCAqluK3S03jkN6+
         j+eiXhEEMXcyfm3yGbx6+/RKDLKJEkRkruLr9qLDPUTxTKHO78PrgsXTgwJXuauzUaAK
         gp0ckLA/pCV1BoJOeys13JnfpnjLI9F6EUYEaChB6piouV164dlnVZjFxF/9yUvdY9qW
         6wKQTmESyhfNk9hjKvsyYVN2D4kbMFS7ChZG7zTh0ez31BOE1l+EoTdpy7a/wc7GnP4o
         PbOFhcS3gb/vhv1vLKjS261jRtigLXH0/hOEqXLYp/hrgy+SfzmI0vHV5aeRoZL39t+h
         33TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature
         :arc-authentication-results;
        bh=R2bczVv2bHXmGKMBvT6cSBjjGZyR6ojWSWYwpT2RTIs=;
        b=XN1wZapNsbsmcx+mEGTn7Be6hvuQWZYiBu/o2WagRJcp4T4UG6W5ihCakcu+iyepI9
         PKerjlVVjy0n9JgYeuG9pgPJVnYAvV8zjj3jCzOBQqc4QW3iQRiuSP/Nwi+BNoDh17zv
         pv7SqOJqJQTDPlxvzCoxK5e+oAROfXvwA2swMSS8ipTuPFYRcwLQ6ed6oqTfpgAaAPuX
         RgCt3NGvBTjLHdZ1MkeQJzR/vnEvO0cAeBGIaWLsrGdfXRI6veiUFo5w4iTkVTckuoFp
         XwCeJPSexw9JvaIrtq+Ook6BC3qd04HFfAgBPc4hEme6yRRGJ/eVU+vrzzgwsZW10Mxm
         Fpyw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@umich.edu header.s=relay-2016-05-12 header.b=TPf4SlPz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=umich.edu
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x45-v6si8865535qtk.32.2018.07.24.14.24.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 24 Jul 2018 14:24:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@umich.edu header.s=relay-2016-05-12 header.b=TPf4SlPz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=umich.edu
Received: from localhost ([::1]:42652 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fi4nc-0000Z9-Kf
	for alex.bennee@linaro.org; Tue, 24 Jul 2018 17:24:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39344)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kevlough@umich.edu>) id 1fi4mA-0008Ha-9w
	for qemu-devel@nongnu.org; Tue, 24 Jul 2018 17:23:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kevlough@umich.edu>) id 1fi4m7-0002W4-02
	for qemu-devel@nongnu.org; Tue, 24 Jul 2018 17:23:22 -0400
Received: from smtp.mail.umich.edu ([141.211.12.86]:40619
	helo=tombraider.mr.itd.umich.edu)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <kevlough@umich.edu>)
	id 1fi4m6-0002U4-KS; Tue, 24 Jul 2018 17:23:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umich.edu;
	s=relay-2016-05-12; t=1532467395;
	bh=CzkMLICegYrwHXt11d05PHYZYTnjY8uCkMTZU/0eUCY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=TPf4SlPzFvICV4A+lQUC41gRXaRBWCfjosm0hh52Uleg9kyHjc7If5R25XaFwZLT6
	5M8UszGaPsUWje8s6HXhLxHzVMBdlB+pOj7Uhf5cNa7ypxrIxV+MRpskp4ei7qqYcZ
	7Ee83nrxJ3dL9dInFDlgEeXL++WmVkeMCFZA+pPSfcUUCPgHfqO3cxmD9sHqphBNNM
	9qZM+awh0kPeDEZkkkNQwUH8OBdbz4wD0Tvknxxef0SI03lrGPr54ldVukrUGL28th
	cQtusAfqVXB74BLAA7oCLJ+EREyU1J/CQ/mmTZQGOSmRj9I9sMUgl9Ge3qApYhXp14
	QHJWcDOQ04hUQ==
Authentication-Results: tombraider.mr.itd.umich.edu;
	iprev=pass policy.iprev=74.125.82.51 (mail-wm0-f51.google.com);
	auth=pass smtp.auth=kevlough
Received: FROM mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	By tombraider.mr.itd.umich.edu ID 5B5798C2.988CA.24411;
	Authuser kevlough; Tue, 24 Jul 2018 17:23:15 -0400
Received: by mail-wm0-f51.google.com with SMTP id f21-v6so3928501wmc.5;
	Tue, 24 Jul 2018 14:23:14 -0700 (PDT)
X-Gm-Message-State: AOUpUlHuCwI6Eg0BMyeDRwDFUAKHawgNFkwMLOyR3cYSikYVOyoykTDp
	DqTzoUbtsaby9KzegJMr5yAPMiSdL+Le3ymDnxw=
X-Received: by 2002:a1c:91c7:: with SMTP id
	t190-v6mr3048758wmd.2.1532467393106; 
	Tue, 24 Jul 2018 14:23:13 -0700 (PDT)
MIME-Version: 1.0
References: <CAB30WPccergMTSWWrwj-WhTCcaMvvW7vnAMO3qvy9b9B53N=zA@mail.gmail.com>
	<CAFEAcA8v762p3JSQ=9Vu68-evYS5MMH467pAo8=XZWsw+x6s7Q@mail.gmail.com>
	<CAB30WPfKKesSfvyEx9ZpSUQShnXJnH1YCXgZgp0OoY888r0K4w@mail.gmail.com>
	<CAFEAcA-_ZiPNz7tyQy2otZ6z9rT8wszhRxBZrmNXTr9AFaBzqg@mail.gmail.com>
In-Reply-To: <CAFEAcA-_ZiPNz7tyQy2otZ6z9rT8wszhRxBZrmNXTr9AFaBzqg@mail.gmail.com>
From: Kevin Loughlin <kevlough@umich.edu>
Date: Tue, 24 Jul 2018 17:23:01 -0400
X-Gmail-Original-Message-ID: <CAB30WPeBwR2EK_pNssyH0od0UQb9sj-jgx4rs5pR7UQ=pGM6VA@mail.gmail.com>
Message-ID: <CAB30WPeBwR2EK_pNssyH0od0UQb9sj-jgx4rs5pR7UQ=pGM6VA@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x [fuzzy]
X-Received-From: 141.211.12.86
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] Native Memory Virtualization in qemu-system-aarch64
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, "Mickens,
	James" <mickens@g.harvard.edu>, qemu-discuss@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5mqsWSw7/dk1

Thanks! That was super helpful.

To confirm, support for IOMMU regions in the CPU's memory access path did
NOT exist prior to recent releases, correct? My QEMU version is 2.11, and I
believe you're up to 3.0 now. If that's the case, I may stick with the
"changing priorities" approach, since I know you've also updated the virt
board and refactored the system bus code since I branched. Additionally,
you correctly pointed out that I simply want to map a huge chunk of memory
in and out at once. However, the IOMMU solution does have the benefit of a
more realistic approach than changing the priorities.

On Wed, Jul 18, 2018 at 1:58 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On 18 July 2018 at 02:34, Kevin Loughlin <kevlough@umich.edu> wrote:
> > Under my setup, the CPU's MMU translates from VAs to IPAs, and an
> external
> > memory controller then intercepts all memory transactions and translates
> > these IPAs to true PAs. This allows the memory controller to enforce
> > physical isolation of environments, and does not expose true PAs to the
> > CPU/system software.
>
> Ah, right, "external custom memory controller" makes sense.
>
> > My question is how best to emulate the memory controller given this
> desired
> > setup. I have three primary ideas, and I would love to get feedback on
> their
> > feasibility.
> >
> > Implement the controller as an IOMMU region. I would be responsible for
> > writing the controller's operations to shift and forward the target
> address
> > to the appropriate subregion. Would it be possible to trigger the IOMMU
> > region on every access to system_memory? For example, even during QEMU's
> > loading process? Or would I only be able to trigger the IOMMU operations
> on
> > access to the subregions that represent my environments? My
> understanding of
> > the IOMMU regions is shaky. Nonetheless, this sounds like the most
> promising
> > approach, assuming I can provide the shifting and forwarding operations
> and
> > hide the PAs from the CPU's TLB as desired.
>
> I would probably go with implementing it as an IOMMU region. We recently
> added code to QEMU that allows you to put IOMMUs in the CPU's
> memory-access path, so this works now. The example we have of
> that at the moment is hw/misc/tz-mpc.c (which is a simple device
> which configurably controls access to the thing "downstream" of it
> based on a lookup table and whether the access is S or NS).
>
> As you've guessed, the way the IOMMU stuff works is that it gates
> access to the things sat behind it: the device has a MemoryRegion
> "upstream" which it exposes to the code which creates it, and a
> MemoryRegion property "downstream". The creating code (ie the board)
> passes in whatever the "downstream" is (likely a container MemoryRegion
> with RAM and so on), and maps the "upstream" end into the address
> space that the CPU sees. (You would probably have one downstream
> for each separate subregion). You could either have the IOMMU
> only "in front" of one part of the overall address space, or
> in front of the whole of the address space, as you liked.
> (Assuming you have some kind of "control register" memory mapped
> interface for programming it, it can't be behind itself; that
> would be "an interesting topological exercise", to quote nethack.)
>
> What the CPU sees is whatever is in the MemoryRegion passed to it
> via
>         object_property_set_link(cpuobj, ..., "memory",
>                                  &error_abort);
>
> The virt board happens to currently use get_system_memory()
> for that, but you can use a custom container MemoryRegion if you
> like.
>
> > Go into the target/arm code, find every instance of accesses to address
> > spaces, and shift the target physical address accordingly. This seems
> ugly
> > and unlikely to work.
>
> That's very fragile, and I don't recommend it.
>
> > Use overlapping subregions with differing priorities, as in done in
> QEMU's
> > TrustZone implementation. However, these priorities would have to change
> on
> > an environment context switch, and I don't know if that would lead to
> chaos.
>
> You can model things this way too, yes (both by changing priorities, and by
> simply enabling/disabling/mapping/unmapping memory regions). The main
> advantage that using IOMMU regions gets you are:
>  * you can do things at a finer granularity, say changing
>    permissions at a page-by-page level, without creating a
>    ton of MemoryRegion objects. Swapping MRs in and out would
>    work if you only wanted to do it for big chunks of space at once
>  * you can make the choice of what to do based on the memory
>    transaction attributes (eg secure/nonsecure, user/privileged)
>    rather than having to provide a single mapping only
> If you really do only want to map 4G of RAM in and out at once,
> this might be simpler.
>
> Note that for both the IOMMU approach and the MemoryRegion map/unmap
> approach, changing the mapping will blow away the emulated CPU's
> cached TLB entirely. So if you do it very often you'll see a
> performance hit. (In the IOMMU case it might in theory be possible
> to get some of that performance back by being cleverer in the core
> memory subsystem code so as to only drop the bits of the TLB that
> are affected; but if you're remapping all-of-RAM then that probably
> covers all the interesting cached TLB entries anyhow.)
>
> thanks
> -- PMM
>
