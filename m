Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp4299236wrq;
        Tue, 10 Jul 2018 21:22:17 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdBJEihGl8VsyM9waB9Osb4Ud+bx7z8vgUXvPwtS6IcAfaCh6uVEQjBrlTZ7GQO3XooxC5V
X-Received: by 2002:a37:9702:: with SMTP id z2-v6mr2474230qkd.183.1531282937688;
        Tue, 10 Jul 2018 21:22:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531282937; cv=none;
        d=google.com; s=arc-20160816;
        b=tDOYzKMfEzKXgtwgXWl5KV4Ocl6dYAYUrFOJWuRFCUhhDSPAaRPpQ371eXg5MVd3wh
         ehZcBiMurweqk1iRhMTvUfPUUaA24l6NXKyr4GJzYMNmCCziVJZTtEZ/tI1jMEVMBdgi
         5RgK6BORaT+XKY9c0sBIoFmyMMfjioBoS+1E30xNRrpRVNhHQDaMfLo4Pr8036KSopBt
         y2oePmvR3Oxx9fIbeqj2p98YNdmX0eDHeFlbBHJwaoKI2xHdFVHeqQJcIp3kvxKSd+6V
         CbSoIcyEqixGOx6ZpZ8kFLhY5BbWGACRxdxUBOpxMLPdBkIr6mSqHeKGH/2WbBdlAf5i
         BN/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :mime-version:user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=jKrB59FdwuqLHIMcKmyRzXnQ5Tgqyh1Y+I5nXdHpuWM=;
        b=wVRrt/ZRKoRTAiCruCPuavUgPPAjVg3hMuSK/aNvtwH4645MGXXCsjIfAmjt/kvoqs
         iScrPHYAupkr5UsdiH0gqDlOIVcaHvYZG50b0CDmOCCglVvXgbLrlXgatWAERcUPvjrS
         L7t8GS412cF9Q14xJoFrcY69q+mY8mQih/DRUIchY1arkzAJE42S2NBQu5ACoxET63aw
         Iq182TcMiL/nT+5t0xDaFi2+UsjjnGXz6OorPN37YQqCYgKc2ZRmRVTznai4gi8eEazx
         cuMEhsVdZq9b9CVCrqI3UojaqGa48APgPiFC6s7HrldODjk3lgCjxyOPoiMQXqJKNxcM
         NsTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="WoBOxib/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p84-v6si2089667qkp.268.2018.07.10.21.22.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 10 Jul 2018 21:22:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="WoBOxib/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51579 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fd6dt-00035u-66
	for alex.bennee@linaro.org; Wed, 11 Jul 2018 00:22:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46962)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fd6dc-000343-Bi
	for qemu-arm@nongnu.org; Wed, 11 Jul 2018 00:22:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fd6db-0005dn-1b
	for qemu-arm@nongnu.org; Wed, 11 Jul 2018 00:22:00 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:43615)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fd6dV-0005ZL-SZ; Wed, 11 Jul 2018 00:21:54 -0400
Received: by mail-qt0-x242.google.com with SMTP id f18-v6so20311326qtp.10;
	Tue, 10 Jul 2018 21:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=jKrB59FdwuqLHIMcKmyRzXnQ5Tgqyh1Y+I5nXdHpuWM=;
	b=WoBOxib/npffOb2gIQ1JdQ5Ls4gBPE+Hzk1qJK1aj5F2Pw2HqX6p7rMi+MQR7bc9pr
	NWNqup1Ku9tL5q+zDKhhxZYF/1uoZUvKYaFD8iERsx1Gs9DZw//mhMhk6SMchu854xDg
	mkn+GAZgeC6VhnYpBQozeqZHJS19YO+bl3v8p5Kk/2rHhwKKIEHk/jzNP6z8HtWVBvVS
	khQ4uSG1XIUk0yim1AZQTNjLH8bwea2gdHKNo1TRmRn0Doh7hz4tVfK7UizOi0BstjUT
	1fTJPvIvqp/fXWrbceiDRH8aRIDfoX29velyWoN/AI0Aw3HUNHCddfdxJaTcL6tcB4XO
	6/zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=jKrB59FdwuqLHIMcKmyRzXnQ5Tgqyh1Y+I5nXdHpuWM=;
	b=YXsJ3ZK4z44gp5ef/hzeWfTaC1gNfLNqMnPqCjHq0n0EF2Ui2ANIO5XWuWBkUN/wba
	DV/Z1cenuDGc2atfxY125Iv214jYWFHVfyInMyuF6WU6yobWz8sauvE+Rhrh1zUNqyEC
	cS0OjM9VlVXv4clhjsjs+iU6ng6yXn0yAHQBcfag567sKp3rJfzI0a0QRVeWL5rNlkG8
	g6BwjqLCInwB277T5ztvaHqTg8hgimA4a0Ne/c2xaRlAH4WfbnbbPplVAXxCYQXwv4P7
	r7dDXtK/6vHdce/S5TAMpeAVtzIGIZ3JH7CDLm62ooHJGgVCR5KMZMVc2f7MVb1gDsEJ
	Y6ng==
X-Gm-Message-State: APt69E3VTKVj179MkHvmrHR48TnqzcCvcj9TZT+qScbsDzod/JewoHXg
	Inq9UYOiDrrfcU8bwkiShZY=
X-Received: by 2002:ac8:1987:: with SMTP id
	u7-v6mr25829744qtj.296.1531282913256; 
	Tue, 10 Jul 2018 21:21:53 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	u21-v6sm5698687qka.88.2018.07.10.21.21.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Jul 2018 21:21:52 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180710160013.26559-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <66872d46-25b1-aa14-407d-359bae14815b@amsat.org>
Date: Wed, 11 Jul 2018 01:21:42 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.0
MIME-Version: 1.0
In-Reply-To: <20180710160013.26559-1-peter.maydell@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="7iXd5OUCR8EljSz8HAUISLZPLVDjWCakp"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: Re: [Qemu-arm] [PATCH 0/6] accel/tcg: Support execution from MMIO
 and small MMU regions
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
Cc: patches@linaro.org, Aleksandar Markovic <aleksandar.markovic@rt-rk.com>,
	KONRAD Frederic <frederic.konrad@adacore.com>,
	"Emilio G . Cota" <cota@braap.org>,
	=?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: y1R49azyrATM

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--7iXd5OUCR8EljSz8HAUISLZPLVDjWCakp
Content-Type: multipart/mixed; boundary="ZdiIbwFSxT2IzfIuMRxGsXZrybRMejtGH";
 protected-headers="v1"
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: patches@linaro.org, KONRAD Frederic <frederic.konrad@adacore.com>,
 "Emilio G . Cota" <cota@braap.org>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>,
 Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
Message-ID: <66872d46-25b1-aa14-407d-359bae14815b@amsat.org>
Subject: Re: [Qemu-arm] [PATCH 0/6] accel/tcg: Support execution from MMIO and
 small MMU regions
References: <20180710160013.26559-1-peter.maydell@linaro.org>
In-Reply-To: <20180710160013.26559-1-peter.maydell@linaro.org>

--ZdiIbwFSxT2IzfIuMRxGsXZrybRMejtGH
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Peter,

On 07/10/2018 01:00 PM, Peter Maydell wrote:
> This series adds support to TCG for executing from MMIO regions
> and small MMU regions. The basic principle is that if get_page_addr_cod=
e()
> finds that the region is not backed by a full page of RAM then it
> returns -1, and tb_gen_code() then generates a non-cached TB
> containing a single instruction. Execution from these regions
> thus performs the instruction fetch every time, ensuring that we
> get the read-from-MMIO and check-small-MMU-region permissions
> checks right.
>=20
> This means that the code path for "generate bus fault for failing
> to load an instruction" no longer goes through get_page_addr_code(),
> but instead via each target's translate code and its calls to
> the cpu_ld*_code() or similar functions. Patch 1 makes sure we
> can distinguish insn fetches from data loads when generating the
> bus fault exceptions. (Aside: I have assumed that all cpu_ld*_code()
> loads should trigger iside faults rather than dside. Hopefully this
> is true...)
>=20
> Patches 2 and 3 make trivial fixes to various callers of
> get_page_addr_code(); patch 4 does the work of generating our
> single-insn TBs. Patch 5 can then remove all the code that
> (mis)handles MMIO regions from get_page_addr_code(). Finally
> patch 6 drops the target/arm workarounds for not having support
> for executing from small MPU regions.
>=20
> Note for the Xilinx folks: this patchset makes the mmio-exec
> testcase for running from the SPI flash pass. Cedric: you might
> like to test the aspeed image you had that relies on execution
> from an MMIO region too.

I applied and quickly tested your series on a MIPS SoC I'm working on
which has a tiny SRAM:

(qemu) info mtree
address-space: memory
  0000000000000000-ffffffffffffffff (prio 0, i/o): system
    0000000000000000-00000000000007ff (prio 0, ram): sram
    0000000010000000-00000000107fffff (prio 0, i/o): pflash
    0000000014000000-0000000014ffffff (prio 0, ram): dram
    000000001fc00000-000000001fc0ffff (prio 0, rom): srom

The firmware copies the ISR in this SRAM area, sadly it didn't work as
expected:

qemu-system-mips: Bad ram pointer 0x4a4
Aborted (core dumped)
(gdb) bt
#0  0x00007f5f34d84e7b in __GI_raise (sig=3Dsig@entry=3D6) at
=2E./sysdeps/unix/sysv/linux/raise.c:51
#1  0x00007f5f34d86231 in __GI_abort () at abort.c:79
#2  0x000055f4527a2074 in qemu_ram_addr_from_host_nofail (ptr=3D0x4a4) at=

accel/tcg/cputlb.c:751
#3  0x000055f4527a2887 in get_page_addr_code (env=3D0x55f454d06728,
addr=3D2415932580) at accel/tcg/cputlb.c:966
#4  0x000055f4527bd206 in tb_htable_lookup (cpu=3D0x55f454cfe478,
pc=3D2415932580, cs_base=3D0, flags=3D268435472, cf_mask=3D0) at
accel/tcg/cpu-exec.c:334
#5  0x000055f4527b7b31 in tb_lookup__cpu_state (cpu=3D0x55f454cfe478,
pc=3D0x7f5f17cf7f98, cs_base=3D0x7f5f17cf7f9c, flags=3D0x7f5f17cf7f94,
cf_mask=3D0) at include/exec/tb-lookup.h:39
#6  0x000055f4527b7e29 in helper_lookup_tb_ptr (env=3D0x55f454d06728) at
accel/tcg/tcg-runtime.c:154
#7  0x00007f5f2494da2d in code_gen_buffer ()
#8  0x000055f4527bcd33 in cpu_tb_exec (cpu=3D0x55f454cfe478,
itb=3D0x7f5f2494d880 <code_gen_buffer+129107>) at accel/tcg/cpu-exec.c:17=
1
#9  0x000055f4527bda6a in cpu_loop_exec_tb (cpu=3D0x55f454cfe478,
tb=3D0x7f5f2494d880 <code_gen_buffer+129107>, last_tb=3D0x7f5f17cf8538,
tb_exit=3D0x7f5f17cf8534) at accel/tcg/cpu-exec.c:615
#10 0x000055f4527bdd57 in cpu_exec (cpu=3D0x55f454cfe478) at
accel/tcg/cpu-exec.c:725
#11 0x000055f452770575 in tcg_cpu_exec (cpu=3D0x55f454cfe478) at cpus.c:1=
363
#12 0x000055f4527707cb in qemu_tcg_rr_cpu_thread_fn (arg=3D0x55f454cfe478=
)
at cpus.c:1463
#13 0x000055f452c58a4b in qemu_thread_start (args=3D0x55f454d2afc0) at
util/qemu-thread-posix.c:504
#14 0x00007f5f351115aa in start_thread (arg=3D0x7f5f17cfb700) at
pthread_create.c:463
#15 0x00007f5f34e46cbf in clone () at
=2E./sysdeps/unix/sysv/linux/x86_64/clone.S:95

This firmware works using the "avoid subpages" trick, allocating 4K for
the SRAM (TARGET_PAGE_SIZE).

I didn't look further, maybe I need to figure out how to add a
"target/mips: Allow execution from small regions" too.

Regards,

Phil.

> The diffstat is pretty satisfying for a patchset that adds
> a feature, but it actually undersells it: this code renders the
> hw/misc/mmio_interface.c and the mmio_ptr related code in memory.c
> and the xilinx-spips device all obsolete, so there are another
> couple of hundred lines of code to be deleted there. I opted not
> to include that in this patchset, for ease of review.
>=20
> NB: I tested this with icount, but there are potentially
> some weird things that could happen with interactions between
> icount's io-recompile and execution from an MMIO device
> that returns different instructions each time it's read.


--ZdiIbwFSxT2IzfIuMRxGsXZrybRMejtGH--

--7iXd5OUCR8EljSz8HAUISLZPLVDjWCakp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE+qvnXhKRciHc/Wuy4+MsLN6twN4FAltFhdYACgkQ4+MsLN6t
wN5ONhAAk5ZiI69ZoC6eB5OEoRR2A02+w00ZpQ8ZlwvDv8GcMoPq8Kr9WQP6tGit
smt3jwVf1F4tzAgqK8z4Nrmvi+zyxV3Drwls0vVgStfPaCzeQLwMNhxEZJoyOQsB
pIEU2i82ULjIQvZGfRqYBwBTzTsluDAdeoUH4z9k9cNBKgbDCXJ90O8xZZ7X5EMH
iKmjyUG3e8bg8ua+gj7IGpmRGgv6VitLEgsFGgmw6nh7ShDnjoeBeZj97g0Dwq3l
u7c3timszy8QHNeFaJroPxfYwXWNoZeewYGmYbsYJly+fhxqN9D+1JEebm5Yaju5
uYpeSr59O6ql4/Fzgw1IO7QqkD4Ohkz9nYoz2DTnyjcNAhkjCAXM0cQ06uT9LQ0n
DV6pPri25BQKoDJQjqLJaVoHbw8b/oNtVOnR6YwfigsBNIVdNOwg9iX6k46+44Uh
RmPj3/It2F36E9OOrPoslkSquHw3qmE6L/qFSN5EhoNP9p2DjJUUxtRVUB9x1BDX
Lv4YMHLgbmF/X5fNwiFss/yB2snj7VHaMx4Lqb6TV7zteQmeO+XktqPNAp9F0FtO
gWGUdVxhnZLoFjOgSgbOKheObDDqOMz0jnsEWbG3KjR+mJpLmsDYPYke/0R5g0av
iQ+K0iUoq0kmkPilQR9q66353GgWxN/zKb9mi5XQMzVrNjvce/s=
=F60/
-----END PGP SIGNATURE-----

--7iXd5OUCR8EljSz8HAUISLZPLVDjWCakp--
