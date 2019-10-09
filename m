Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1220190wrm;
        Wed, 9 Oct 2019 10:39:28 -0700 (PDT)
X-Google-Smtp-Source: APXvYqySZk9S0y626T9OEpgU20Ix0RZI3dxiUR6D/Pq+U6xtZlligQcOhaeyPpvxkLbijP2q5p49
X-Received: by 2002:a37:8d05:: with SMTP id p5mr4686907qkd.271.1570642768277;
        Wed, 09 Oct 2019 10:39:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570642768; cv=none;
        d=google.com; s=arc-20160816;
        b=LQl9YSLB7Uqqbjak2MLOfEucxKL/T2aSVTK2jk6Nmn0nMMbo86BZC/t6/6mfkUvwld
         E+I7c3RDSizHd9oinPJgFDV7CfGevE4VkVtA4irQ7gwCZMlX5FZqFYw30g10YDVE0hVc
         10gOAczZLokSAv0Ohu6wSaY5z9N5LadwaRdk4r9evyvC7W6K5EhkxMYcOqeL6xLlRYeB
         Lc040z7EJRXKC2ondVR3b5G6SxWnFh9aq+yyAREzfsnKlEw0PKGVBstif2srxKmV7pFp
         hWrRvqWGcaQdbmITRhiXtnVy2y2UwPQAu82K0oxLrEFvbuUDsCwxLaTahIpimn3REpoM
         c60A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=03YwMWE0Ew/a3SON8Z+vIAmBp2VAb4Ga2ZUj8kxeh4Q=;
        b=0M9f32aPNkD2NRzQ3Oty0rIRslEyI+xZD0/p+QhFt0y9DbBMkAveIoGudOXgRcNlBe
         UEwwW2pqQmN1wQAeODkEps1T6ituwGHocX6iZ7vUCZ6zypKV+MdNe7U9t3bHjq34MA3j
         1BOoAZnxOqlVhcxswhM7cHiMmFdmocu7rq3hyF7rsiRr7T0scXcLcpe7jVJnhflOCi2T
         CfdJgL3l2JA6jCIQrdis3Z1zFptBFIH+zQHd9vAcy1rkAlfhjZEaHawCfaYXPscTo4b5
         GOtStd+4J5Wm3L5pW379eNfDs8CetEBniKl484+1OrjdiN4kcr8XSRzaSGAS357HYmeS
         k24g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Q7kF9KM1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x25si2975231qtm.32.2019.10.09.10.39.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Oct 2019 10:39:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Q7kF9KM1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iIFvr-0005bE-Ev
	for alex.bennee@linaro.org; Wed, 09 Oct 2019 13:39:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37013)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <beata.michalska@linaro.org>) id 1iIAWt-00024w-5E
 for qemu-arm@nongnu.org; Wed, 09 Oct 2019 07:53:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <beata.michalska@linaro.org>) id 1iIAWr-0006xl-MW
 for qemu-arm@nongnu.org; Wed, 09 Oct 2019 07:53:19 -0400
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41]:33394)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <beata.michalska@linaro.org>)
 id 1iIAWr-0006xQ-Fm
 for qemu-arm@nongnu.org; Wed, 09 Oct 2019 07:53:17 -0400
Received: by mail-io1-xd41.google.com with SMTP id z19so4365537ior.0
 for <qemu-arm@nongnu.org>; Wed, 09 Oct 2019 04:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=03YwMWE0Ew/a3SON8Z+vIAmBp2VAb4Ga2ZUj8kxeh4Q=;
 b=Q7kF9KM1Z9NHtYGsm9C0EmU7QO47cx65aGyxX8xoPzG4dTcin/ZsCMgSyU4W1oCzQQ
 GwG8gOl8M4fjlsV/5kVBu0z1DOISiTWm5KbKgKkDH7pncxCb7dTrnsybk3az+1You8I6
 v1YG9kDvjwYb7hx6nw+daueTLsb/Yc5SUtIt9BXiOt9j3OHTAwObV1xGxgkbKdvuNwDQ
 zleIy2QcuPYObi1WwOfdEjBowsD/JYFpb96bsmHSI4j/qZOE70XFBfgCakDa4xRF57+s
 tFNn+aV4jhWyJnbifzxRXvUo2BM0RRhc/3SL6+PlV8+DFZ8WW8aB/KbZieoQKfy04g8s
 5gBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=03YwMWE0Ew/a3SON8Z+vIAmBp2VAb4Ga2ZUj8kxeh4Q=;
 b=U0ehrd/v6LZDs0vLYndNgwahKG/VhJOl0993Dm6WogEPELryAa+UIg9tmS/alGAEaY
 S9cQdPIDeHJY5sAo11kO8w3AXv4BIl5Kcygdph1WAKQr4xU/04Azp2BfM/e451V5i9dr
 kXvexHsgrhBi+zgyy2H+nVaf7tfCGqRKspckFUinAZESvwex14GZJxLjWn5C4rvbpyPZ
 CYnSa1qlbjG8e7JHBx3MDEL+vKr32HTmNiyJ0aKvgd7H9VCF9kqI1pSqn0i95WT73qLd
 twdIxKMNjSbtEr3pZCEot+Qrk2lJHCzH4D83jW2IlVcLnMxMnABYR4pUNUG5L5hJ04Ze
 Y1Rw==
X-Gm-Message-State: APjAAAUecbdtysP6zhqhP3VIJ0hYAhwuFxm6+hdXkwl6E5LPi58De2dw
 EQrvanTYcw2QNoSVj3EvKEGAJYfJTG4dXVyWA2n9Zg==
X-Received: by 2002:a92:360b:: with SMTP id d11mr2745579ila.143.1570621996706; 
 Wed, 09 Oct 2019 04:53:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190910095610.4546-1-beata.michalska@linaro.org>
 <20190910095610.4546-5-beata.michalska@linaro.org>
 <c70f7562-c988-5eab-fa1e-fc8b5897e171@linaro.org>
In-Reply-To: <c70f7562-c988-5eab-fa1e-fc8b5897e171@linaro.org>
From: Beata Michalska <beata.michalska@linaro.org>
Date: Wed, 9 Oct 2019 12:53:05 +0100
Message-ID: <CADSWDzs=kSveEbLdAwoCNSRYJS=NxXGSEGWHMXM+xxUJ215taQ@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH 4/4] target/arm: Add support for DC CVAP & DC
 CVADP ins
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::d41
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, quintela@redhat.com,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 shameerali.kolothum.thodi@huawei.com, qemu-devel@nongnu.org,
 eric.auger@redhat.com, qemu-arm@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ska0hpHSdYa9

On Tue, 24 Sep 2019 at 18:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 9/10/19 2:56 AM, Beata Michalska wrote:
> > @@ -2229,7 +2229,8 @@ static inline uint64_t cpreg_to_kvm_id(uint32_t cpregid)
> >  #define ARM_CP_NZCV              (ARM_CP_SPECIAL | 0x0300)
> >  #define ARM_CP_CURRENTEL         (ARM_CP_SPECIAL | 0x0400)
> >  #define ARM_CP_DC_ZVA            (ARM_CP_SPECIAL | 0x0500)
> > -#define ARM_LAST_SPECIAL         ARM_CP_DC_ZVA
> > +#define ARM_CP_DC_CVAP           (ARM_CP_SPECIAL | 0x0600)
> > +#define ARM_LAST_SPECIAL         ARM_CP_DC_CVAP
>
> I don't see that this operation needs to be handled via "special".  It's a
> function call upon write, as for many other system registers.
>

Too inspired by ZVA I guess. Will make the appropriate changes in the
next version.

> > +static inline bool isar_feature_aa64_dcpop(const ARMISARegisters *id)
> > +{
> > +    return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, DPB) != 0;
> > +}
> > +
> > +static inline bool isar_feature_aa64_dcpodp(const ARMISARegisters *id)
> > +{
> > +    return (FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, DPB) >> 1) != 0;
> > +}
>
> The correct check is FIELD_EX(...) >= 2.  This is a 4-bit field, as with all of
> the others.
>
Noted.
> > +static CPAccessResult aa64_cacheop_persist_access(CPUARMState *env,
> > +                                                  const ARMCPRegInfo *ri,
> > +                                                  bool isread)
> > +{
> > +    ARMCPU *cpu = env_archcpu(env);
> > +    /*
> > +     * Access is UNDEF if lacking implementation for either DC CVAP or DC CVADP
> > +     * DC CVAP ->  CRm: 0xc
> > +     * DC CVADP -> CRm: 0xd
> > +     */
> > +    return (ri->crm == 0xc && !cpu_isar_feature(aa64_dcpop, cpu)) ||
> > +           (ri->crm == 0xd && !cpu_isar_feature(aa64_dcpodp, cpu))
> > +           ? CP_ACCESS_TRAP_UNCATEGORIZED
> > +           : aa64_cacheop_access(env, ri, isread);
> > +}
> ...
> > +    { .name = "DC_CVAP", .state = ARM_CP_STATE_AA64,
> > +      .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 12, .opc2 = 1,
> > +      .access = PL0_W, .type = ARM_CP_DC_CVAP,
> > +      .accessfn = aa64_cacheop_persist_access },
> > +    { .name = "DC_CVADP", .state = ARM_CP_STATE_AA64,
> > +      .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 13, .opc2 = 1,
> > +      .access = PL0_W, .type = ARM_CP_DC_CVAP,
> > +      .accessfn = aa64_cacheop_persist_access },
>
> While this access function works, it's better to simply not register these at
> all when they're not supported.  Compare the registration of rndr_reginfo.
>
> As I described above, I think this can use a normal write function.  In which
> case this would use .type = ARM_CP_NO_RAW | ARM_CP_SUPPRESS_TB_END.
>
> (I believe that ARM_CP_IO is not required, but I'm not 100% sure.  Certainly
> there does not seem to be anything in dc_cvap() that affects state which can
> queried from another virtual cpu, so there does not appear to be any reason to
> grab the global i/o lock.  The host kernel should be just fine with concurrent
> msync syscalls, or whatever it is that libpmem uses.)
>
>
OK, will move that to conditional registration and double check the type.
Thanks for the suggestion.

> > +void HELPER(dc_cvap)(CPUARMState *env, uint64_t vaddr_in)
> > +{
> > +#ifndef CONFIG_USER_ONLY
> > +    ARMCPU *cpu = env_archcpu(env);
> > +    /* CTR_EL0 System register -> DminLine, bits [19:16] */
> > +    uint64_t dline_size = 4 << ((cpu->ctr >> 16) & 0xF);
> > +    uint64_t vaddr = vaddr_in & ~(dline_size - 1);
> > +    void *haddr;
> > +    int mem_idx = cpu_mmu_index(env, false);
> > +
> > +    /* This won't be crossing page boundaries */
> > +    haddr = probe_read(env, vaddr, dline_size, mem_idx, GETPC());
> > +    if (haddr) {
> > +
> > +        ram_addr_t offset;
> > +        MemoryRegion *mr;
> > +
> > +        /*
> > +         * RCU critical section + ref counting,
> > +         * so that MR won't disappear behind the scene
> > +         */
> > +        rcu_read_lock();
> > +        mr = memory_region_from_host(haddr, &offset);
> > +        if (mr) {
> > +            memory_region_ref(mr);
> > +        }
> > +        rcu_read_unlock();
> > +
> > +        if (mr) {
> > +            memory_region_do_writeback(mr, offset, dline_size);
> > +            memory_region_unref(mr);
> > +        }
> > +    }
> > +#endif
>
>
> We hold the rcu lock whenever a TB is executing.  I don't believe there's any
> point in increasing the lock count here.  Similarly with memory_region
> refcounts -- they cannot vanish while we're executing a TB.
>
> Thus I believe that about half of this function can fold away.
>
>
So I was chasing the wrong locking herre...
Indeed if the RCU lock is being already held I can safely drop the locking here.

> r~

Thank you for the review,

BR
Beata
