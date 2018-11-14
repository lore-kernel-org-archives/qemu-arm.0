Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp5985143wrw;
        Wed, 14 Nov 2018 09:19:27 -0800 (PST)
X-Google-Smtp-Source: AJdET5eIrx8PHSQ9sR9uEsUJMyxQTtMvJ9ZjapEbsvFjuDWk1+sLX1r6aWKRtXWd2ZPzNxNzOKwt
X-Received: by 2002:a0c:9659:: with SMTP id 25mr2703037qvy.3.1542215966920;
        Wed, 14 Nov 2018 09:19:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542215966; cv=none;
        d=google.com; s=arc-20160816;
        b=D9jQNgKZu3qTgqwNvRVM9qCGDbXPBwFvwRV/6L+vaNAEyt8HBJK3TIkdtZEQXNdFuq
         PFvIP3nR2kCQ+sJo7CPw9PGiMkdQ9mZR/zgFzKSTGlAw+DWDw2Hcs+Qor7SlQ0uO03l1
         T9L9/XwQ6FWnrRD7qQr9f826U7+nNj3S9WYJMmQd2exdRZC/NGxy6ay0HAQHVa23wkA4
         C0k3PybRHpAWBAsukptlFGX6+iHI6NRaxqYIcHE+ve81v5zG2jeJbBhpTGIog5INjsHh
         JROHHie/M3YsUcDCgXtyHEYwTV0yRyci/pDSpeqq1gyXcAdMtpLooWPgntewFlMR2NX5
         LjSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:organization:autocrypt:openpgp:from
         :references:to;
        bh=+fD8okDIE4KwYuJiyPMvuxRwcsDpQ5hxsSJ7gHr8sqk=;
        b=mC72to5boKzvITS0Hy6En7wQxeTtUiUTmz4xcmjHUKXKhzBIoid6LLoF7OVSxVSZuL
         WbDhEflF0RVjrGx+wgb6oGYj67xANXqJTy8r7BiIRDaZmw7jiKAlDyW9+v1wIIC604Of
         sg2MlDUyQKjDBl0wmSynP3VmMR3Mh18MXJnwey4p6omIlLixN6rEkwWisH66VGFJYYqX
         ganJgG8WdgRDB7vDmGjDR3Eu0L9YhN2xLN9rt0wEbjvAJDgLzPsBjanwI+CSeas+YU17
         SL6QbPEonHTDysdo020/XMtlcSb7iNMfAvKEVh5c/mH+VQMgAxuWhNtUJ+nbNmM/Csea
         3rLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d2si1514253qtl.198.2018.11.14.09.19.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 14 Nov 2018 09:19:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33462 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gMyp3-0001w6-V8
	for alex.bennee@linaro.org; Wed, 14 Nov 2018 12:19:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60710)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gMyon-0001t8-8Y
	for qemu-arm@nongnu.org; Wed, 14 Nov 2018 12:19:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gMyok-0002y3-3A
	for qemu-arm@nongnu.org; Wed, 14 Nov 2018 12:19:09 -0500
Received: from mx1.redhat.com ([209.132.183.28]:34376)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gMyoj-0002xB-RQ; Wed, 14 Nov 2018 12:19:06 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 108463002F84;
	Wed, 14 Nov 2018 17:19:04 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-163.ams2.redhat.com [10.36.116.163])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3D9756013F;
	Wed, 14 Nov 2018 17:19:01 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180710160013.26559-1-peter.maydell@linaro.org>
	<20180710160013.26559-6-peter.maydell@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=thuth@redhat.com; keydata=
	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
Organization: Red Hat
Message-ID: <3ac12d41-2095-f0ad-db1b-0e3ceea8f44e@redhat.com>
Date: Wed, 14 Nov 2018 18:19:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180710160013.26559-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Wed, 14 Nov 2018 17:19:04 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 5/6] accel/tcg: Return -1 for
 execution from MMIO regions in get_page_addr_code()
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
Cc: patches@linaro.org, KONRAD Frederic <frederic.konrad@adacore.com>,
	"Emilio G . Cota" <cota@braap.org>,
	=?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +Ehf3iWQyt6X

On 2018-07-10 18:00, Peter Maydell wrote:
> Now that all the callers can handle get_page_addr_code() returning -1,
> remove all the code which tries to handle execution from MMIO regions
> or small-MMU-region RAM areas. This will mean that we can correctly
> execute from these areas, rather than ending up either aborting QEMU
> or delivering an incorrect guest exception.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  accel/tcg/cputlb.c | 95 +++++-----------------------------------------
>  1 file changed, 10 insertions(+), 85 deletions(-)
>=20
> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
> index c491703f15f..abb0225dc79 100644
> --- a/accel/tcg/cputlb.c
> +++ b/accel/tcg/cputlb.c
> @@ -741,39 +741,6 @@ void tlb_set_page(CPUState *cpu, target_ulong vadd=
r,
>                              prot, mmu_idx, size);
>  }
> =20
> -static void report_bad_exec(CPUState *cpu, target_ulong addr)
> -{
> -    /* Accidentally executing outside RAM or ROM is quite common for
> -     * several user-error situations, so report it in a way that
> -     * makes it clear that this isn't a QEMU bug and provide suggestio=
ns
> -     * about what a user could do to fix things.
> -     */
> -    error_report("Trying to execute code outside RAM or ROM at 0x"
> -                 TARGET_FMT_lx, addr);
> -    error_printf("This usually means one of the following happened:\n\=
n"
> -                 "(1) You told QEMU to execute a kernel for the wrong =
machine "
> -                 "type, and it crashed on startup (eg trying to run a =
"
> -                 "raspberry pi kernel on a versatilepb QEMU machine)\n=
"
> -                 "(2) You didn't give QEMU a kernel or BIOS filename a=
t all, "
> -                 "and QEMU executed a ROM full of no-op instructions u=
ntil "
> -                 "it fell off the end\n"
> -                 "(3) Your guest kernel has a bug and crashed by jumpi=
ng "
> -                 "off into nowhere\n\n"
> -                 "This is almost always one of the first two, so check=
 your "
> -                 "command line and that you are using the right type o=
f kernel "
> -                 "for this machine.\n"
> -                 "If you think option (3) is likely then you can try d=
ebugging "
> -                 "your guest with the -d debug options; in particular =
"
> -                 "-d guest_errors will cause the log to include a dump=
 of the "
> -                 "guest register state at this point.\n\n"
> -                 "Execution cannot continue; stopping here.\n\n");

 Hi Peter!

Looks like this patch now causes QEMU to segfault instead of printing the
above error message in certain cases, e.g.:

$ gdb --args aarch64-softmmu/qemu-system-aarch64 -M n800
[...]
(gdb) r
Starting program: aarch64-softmmu/qemu-system-aarch64 -M n800
[...]
Program received signal SIGSEGV, Segmentation fault.
[...]
(gdb) bt
#0  0x0000555555addc68 in onenand_read (opaque=3D0x555557600600, addr=3D9=
8304, size=3D4) at hw/block/onenand.c:612
#1  0x00005555558b175c in memory_region_read_accessor (mr=3D0x555557600b8=
0, addr=3D98304, value=3D0x7fffdbffe360, size=3D4, shift=3D0, mask=3D4294=
967295, attrs=3D...)
    at memory.c:440
#2  0x00005555558ae669 in access_with_adjusted_size (addr=3Daddr@entry=3D=
98304, value=3Dvalue@entry=3D0x7fffdbffe360, size=3Dsize@entry=3D4, acces=
s_size_min=3D<optimized out>, access_size_max=3D<optimized out>, access_f=
n=3Daccess_fn@entry=3D0x5555558b1720 <memory_region_read_accessor>, mr=3D=
mr@entry=3D0x555557600b80, attrs=3Dattrs@entry=3D...) at memory.c:570
#3  0x00005555558b3016 in memory_region_dispatch_read (attrs=3D..., size=3D=
4, pval=3D0x7fffdbffe360, addr=3D98304, mr=3D0x555557600b80) at memory.c:=
1375
#4  0x00005555558b3016 in memory_region_dispatch_read (mr=3D0x555557600b8=
0, addr=3Daddr@entry=3D98304, pval=3Dpval@entry=3D0x7fffdbffe360, size=3D=
size@entry=3D4, attrs=3D...)
    at memory.c:1402
#5  0x000055555583cb23 in io_readx (env=3Denv@entry=3D0x555556b58a30, iot=
lbentry=3Diotlbentry@entry=3D0x555556b6d6b0, mmu_idx=3Dmmu_idx@entry=3D1,=
 addr=3Daddr@entry=3D98304, retaddr=3Dretaddr@entry=3D0, recheck=3D<optim=
ized out>, access_type=3Daccess_type@entry=3DMMU_INST_FETCH, size=3Dsize@=
entry=3D4) at accel/tcg/cputlb.c:729
#6  0x00005555558d79cd in helper_le_ldl_cmmu (access_type=3DMMU_INST_FETC=
H, recheck=3D<optimized out>, retaddr=3D0, addr=3D98304, index=3D96, mmu_=
idx=3D1, env=3D0x555556b58a30)
    at accel/tcg/softmmu_template.h:106
#7  0x00005555558d79cd in helper_le_ldl_cmmu (env=3Denv@entry=3D0x555556b=
58a30, addr=3Daddr@entry=3D98304, oi=3D33, retaddr=3Dretaddr@entry=3D0)
    at accel/tcg/softmmu_template.h:144
#8  0x00005555559d2595 in arm_tr_translate_insn (retaddr=3D0, ptr=3D98304=
, env=3D0x555556b58a30) at include/exec/cpu_ldst_template.h:102

Any clue what's going on here?

 Thomas
