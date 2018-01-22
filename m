Received: by 10.28.71.27 with SMTP id u27csp3082022wma;
        Mon, 22 Jan 2018 09:49:17 -0800 (PST)
X-Google-Smtp-Source: AH8x224yiM91/GWGbIhDwXKuqkKL6G9U5KH7RQPNiT8OJIv+vYOSByZ7IzpTXJuvht56Qqq/7hMM
X-Received: by 10.129.53.194 with SMTP id c185mr8237221ywa.78.1516643357417;
        Mon, 22 Jan 2018 09:49:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516643357; cv=none;
        d=google.com; s=arc-20160816;
        b=HsVvcDIT0VAnikGeT/7vdxmG1IVxMNmKp5N94r8o7ZcQkfsmSrM6aUGGuEN8dF7Yod
         vH6eekCvmGree0XMUCOMXHvcrOPZhucM7ewNNkYu6FAe/lOdn1qsvzqA5W/c169tqZ0L
         +tTDE9bZknkzLajN/BewJY8DshQMBZjx9ZSd4ftECYFunb+6WMgxGSAzS/66nssJjvek
         Yb27+7jFcE59qyMnl3bW+GmySyuDPaWDzxF95Y+UMTRfmnSkiVF+E+leo0D/jxSGn4Ba
         inY0uLBDTcJUCU9/1W04/tbdz3f7NeQl3MLIc4r6LirSXTxMfQryZySK/OueDGqOvTBk
         o8SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=VNxOD5wDAkwh32dYkZWHYctAfRlvIbRdZgKrsEqcVVs=;
        b=iJSiGOpe47y3jjvkZJDqutxfeaOFA2G2OF5+Ek5jifFFik/HmwD3sXMc/TaDndrFEa
         lz17RPIAbGx0BbFc9vJgNSNwSuGiUNbfoQ8Z4KVGOftYGeoc2RU3riYgRlLCjtaPhkbk
         XjyZrAcEhvUf2CmaVneniCvp+hVieazJnbqLsHFapovMFhZ9yxTF69zYuiRcCXBNPk3W
         QEE6w8KlIXZG7VmApZcMgizMTtmLmsTIJLL3SWK7AAO6fV1SHAbQuUh3MYsxNkdtTGQI
         TIu3X7MaQTw7K4E42R0bPVy16+FNJWyKklvHyi8Cjw0eqplgPNI3TN8qaloIStmzd4Md
         VZ8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QWcNo2Sx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 67si2066289ybh.375.2018.01.22.09.49.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 22 Jan 2018 09:49:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QWcNo2Sx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55787 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1edgDb-0001RA-Uq
	for alex.bennee@linaro.org; Mon, 22 Jan 2018 12:49:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55502)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1edgD4-0001OK-Ji
	for qemu-devel@nongnu.org; Mon, 22 Jan 2018 12:48:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1edgD2-0004Il-0p
	for qemu-devel@nongnu.org; Mon, 22 Jan 2018 12:48:42 -0500
Received: from mail-ot0-x236.google.com ([2607:f8b0:4003:c0f::236]:41202)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1edgD1-0004Hk-Pl
	for qemu-devel@nongnu.org; Mon, 22 Jan 2018 12:48:39 -0500
Received: by mail-ot0-x236.google.com with SMTP id 44so8212010otk.8
	for <qemu-devel@nongnu.org>; Mon, 22 Jan 2018 09:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=VNxOD5wDAkwh32dYkZWHYctAfRlvIbRdZgKrsEqcVVs=;
	b=QWcNo2SxCjbbECKSqErxhsoJzGgJ8i0asQTnUUmchoN0jKQpHNAioPyPGKWL6fOwFl
	CKGliLMNB3nG0SaNAlHOLUaigrq5w7j6lPTXj9qaV6c4y76rt6BL6Fyw5ANfnb5dOCFu
	5zW82o5gWUNqCJamq2lQ+a3Sqx0UP+OeTVC1A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=VNxOD5wDAkwh32dYkZWHYctAfRlvIbRdZgKrsEqcVVs=;
	b=jHEsmVS++wux9DxXtLj7Qjwi4vhsgCyU0pMHNjYMZdubV54TDOghY7czUYGFXAmhvu
	AdcWb4lCriuWwR4pL2gzEiuNqZvt80ypW7YZZTzbpqb909Erj/XgU67xEyzRVS2cyOaC
	lapT2UwtLNuJgHnzT5igV12014tO5olVuK+pY5CBTjHNaWahT6B5PIvH6xbdiW5Ax9JW
	+7RcEru4a7Ijci+ZX5uQfCIGHsQLbRsykyLDRT6kTCZCo6DYKqHH2gB7j3mVD1FqfnYe
	CgtmuSyF0SSDtimT6X4WWxvYqmtvTr9tfSzVM0t44xUrbmQ+K27H2JM2BxUg5clY+RUU
	7sqA==
X-Gm-Message-State: AKwxyteOo1Qhgx980JiZjN/sg5V7L1f2A0ylD1gIY9+U0Tg17uIkeqzX
	/2jQ7xJAaPXrxoUrsFO07fDuwkpqA/1B8edeML4cfw==
X-Received: by 10.157.52.215 with SMTP id t23mr4893372otd.54.1516643318428;
	Mon, 22 Jan 2018 09:48:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.61.133 with HTTP; Mon, 22 Jan 2018 09:48:17 -0800 (PST)
In-Reply-To: <c2d2d787-8e45-f26a-54cf-9670a27dc836@lauterbach.com>
References: <c2d2d787-8e45-f26a-54cf-9670a27dc836@lauterbach.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 22 Jan 2018 17:48:17 +0000
Message-ID: <CAFEAcA_LZYfsOKuq9e-uCQPRBsi5XGNyCWw4E_YhyebNJeyRLQ@mail.gmail.com>
To: Abdallah Bouassida <abdallah.bouassida@lauterbach.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::236
Subject: Re: [Qemu-devel] [PATCH RFC] target-arm:Add a dynamic
 XML-description of the cp-registers to GDB
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
Cc: Khaled Jmal <khaled.jmal@lauterbach.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NfvyVNTf4zDw

On 16 January 2018 at 09:40, Abdallah Bouassida
<abdallah.bouassida@lauterbach.com> wrote:
> [PATCH RFC] target-arm:Add a dynamic XML-description of the cp-registers to
> GDB
>
> This patch offers to GDB the ability to read/write all the coprocessor
> registers for ARM and ARM64 by generating dynamically an XML-description for
> these registers.

Thanks for this patch. This is definitely a feature we've been asked
for in the past (eg https://bugs.launchpad.net/qemu/+bug/741115).

> - gdbstub.c :
>         *Extend the get_feature_xml() to handle the dynamic XML generation
> for
>            architectures that support this (gdb_coprocessor_dynnamic_xml ==
> true)
>         *Extend the gdb_write_register() and gdb_read_register() to handle
> the
>           write and the read of these registers.
> - include/qom/cpu.h:
>         *Add a new structure "XMLDynamicDescription".
>         *Declare the new variables and function pointers.
> - target/arm/cpu.c:
>         *Initialize the new variables and function pointers for ARM.
> - target/arm/cpu.h:
>         *Declare the new read, write and XML dynamic generation functions.
>         *Declare the write_raw_cp_reg() as I have changed it to non static.
> - target/arm/gdbstub.c:
>         *Define the new functions for ARM:
>             arm_generate_xml(): is called for each register of the hashtable
> cp_regs
>                          to generate the right XML "<reg />" line for it.
>             arm_get_feature_xml_dynamically(): generate the XML dynamically.
>             arm_cpu_gdb_read_cpregister(): To read the coprocessor
> registers.
>             arm_cpu_gdb_write_cpregister(): To write the coprocessor
> registers.

You don't need to put this kind of gcc-style "what got changed at a very
fine level of detail" into the commit message -- people can look at the patch or
the diffstat for that. The commit message is for overview of what is being
changed and why.

> This patch is tagged as [RFC] because I need help to review the following
> points:
> *I only take the registers that (!(ri->type & (ARM_CP_NO_RAW|ARM_CP_ALIAS)))
> So, am I covering all the Coprocessor registers with that?

More the other way around -- you may be including some things you
should not...

> *For the ARM64, should I differentiate the registers that have two views (32
> and 64)
> Maybe by adding in the XML description a "32" tag for the registers name for
> the
> 32bit view and a "64" for the 64bit view.
> *How to properly handle the secure and the non secure views?

I think it might be useful to approach it from the other end -- what
are we trying to achieve?

For 32 vs 64 bit, it depends on what interface we're showing to the
debugger. If we're saying "this is a 64 bit CPU" then we should just
present the 64-bit sysregs, in the same way we only present the 64-bit
GPRs. If a 32-bit CPU, present the coprocessor regs only. (It's not
currently possible to have gdb switch between 32 and 64 bit views
as a 64-bit CPU changes from aarch32 to aarch64, though upstream gdb
are working on it.)

For secure vs non-secure, follow how the architecture does it:
 * for a 64-bit CPU, there are no banked sysregs like this, so you
   just expose 1 register
 * for a 32-bit CPU, maybe banked registers should be exposed as 2 registers

...but this depends on what you're trying to do, and whether there's
existing practice in for instance how JTAG debugging presents these
sysregs to gdb.

I'm pretty hesitant about allowing the user to modify system registers
in the debugger, that is unlikely to work in quite a lot of cases.
I'd rather we just made these registers all readonly.

What does the UI in gdb look like? What gdb commands display
the list of and values of system registers now? (Are there any
commands that used to be useful and are now swamped by lists of
hundreds of system registers?)

I've made some more comments on the code below.

> Signed-off-by: Abdallah Bouassida <abdallah.bouassida@lauterbach.com>
> ---
>  gdbstub.c            | 18 +++++++++++
>  include/qom/cpu.h    | 19 +++++++++++
>  target/arm/cpu.c     |  5 +++
>  target/arm/cpu.h     |  6 +++-
>  target/arm/gdbstub.c | 90
> ++++++++++++++++++++++++++++++++++++++++++++++++++++
>  target/arm/helper.c  |  3 +-
>  6 files changed, 138 insertions(+), 3 deletions(-)
>
> diff --git a/gdbstub.c b/gdbstub.c
> index f1d5148..b0124c8 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -670,10 +670,20 @@ static const char *get_feature_xml(const char *p,
> const char **newp,
>                  pstrcat(target_xml, sizeof(target_xml), r->xml);
>                  pstrcat(target_xml, sizeof(target_xml), "\"/>");
>              }
> +            if (cc->gdb_coprocessor_dynamic_xml) {
> +                pstrcat(target_xml, sizeof(target_xml), "<xi:include
> href=\"");
> +                pstrcat(target_xml, sizeof(target_xml), \
> +                        "coprocessor_dynamic.xml");
> +                pstrcat(target_xml, sizeof(target_xml), "\"/>");
> +            }
>              pstrcat(target_xml, sizeof(target_xml), "</target>");
>          }
>          return target_xml;
>      }
> +    if (strncmp(p, "coprocessor_dynamic.xml", len) == 0) {
> +        CPUState *cpu = first_cpu;
> +        return cc->get_feature_xml_dynamically(cpu);
> +    }

Don't we run into problems where this XML exceeds our gdbstub
MAX_PACKET_LENGTH (which is only 4K) ?

This is a pre-existing bug (https://bugs.launchpad.net/qemu/+bug/1703147)
but I would expect that if we start autogenerating xml for all the
coprocessor registers we're going to hit the packet limit pretty
quickly.

>      for (i = 0; ; i++) {
>          name = xml_builtin[i][0];
>          if (!name || (strncmp(name, p, len) == 0 && strlen(name) == len))
> @@ -697,6 +707,10 @@ static int gdb_read_register(CPUState *cpu, uint8_t
> *mem_buf, int reg)
>              return r->get_reg(env, mem_buf, reg - r->base_reg);
>          }
>      }
> +
> +    if (reg < cpu->gdb_num_regs + cc->gdb_num_cpregs) {
> +        return cc->gdb_read_cpregister(cpu, mem_buf, reg -
> cpu->gdb_num_regs);
> +    }
>      return 0;
>  }
>
> @@ -715,6 +729,10 @@ static int gdb_write_register(CPUState *cpu, uint8_t
> *mem_buf, int reg)
>              return r->set_reg(env, mem_buf, reg - r->base_reg);
>          }
>      }
> +
> +    if (reg < cpu->gdb_num_regs + cc->gdb_num_cpregs) {
> +        return cc->gdb_write_cpregister(cpu, mem_buf, reg -
> cpu->gdb_num_regs);
> +    }
>      return 0;
>  }
>
> diff --git a/include/qom/cpu.h b/include/qom/cpu.h
> index 93bd546..f40ee59 100644
> --- a/include/qom/cpu.h
> +++ b/include/qom/cpu.h
> @@ -76,6 +76,19 @@ typedef void (*CPUUnassignedAccess)(CPUState *cpu, hwaddr
> addr,
>  struct TranslationBlock;
>
>  /**
> + * XMLDynamicDescription:
> + * @desc: Contains the XML descriptions.
> + * @num_cpregs: Number of the Coprocessor registers seen by GDB.
> + * @xml_cpregs_ordred_keys: Array that contains the corresponding Key of
> + * a given cpreg with the same order of the cpreg in the XML description.
> + */
> +typedef struct XMLDynamicDescription {
> +    char * desc;
> +    int num_cpregs;
> +    uint32_t *xml_cpregs_ordred_keys;
> +} XMLDynamicDescription;

cpregs are an arm-specific concept so this data structure doesn't
belong in the for-all-cpus header.

> +
> +/**
>   * CPUClass:
>   * @class_by_name: Callback to map -cpu command line model name to an
>   * instantiatable CPU type.
> @@ -196,6 +209,12 @@ typedef struct CPUClass {
>
>      const struct VMStateDescription *vmsd;
>      const char *gdb_core_xml_file;
> +    bool gdb_coprocessor_dynamic_xml;
> +    XMLDynamicDescription dyn_xml;
> +    int gdb_num_cpregs;
> +    char * (*get_feature_xml_dynamically)(CPUState *cpu);
> +    int (*gdb_read_cpregister)(CPUState *cpu, uint8_t *buf, int reg);
> +    int (*gdb_write_cpregister)(CPUState *cpu, uint8_t *buf, int reg);

Do we really need a new set of functions rather than just being
able to use the existing gdb_read_register/gdb_write_register ?
The API seems to be the same, so I was expecting to just have
the same functions be called, with the register number distinguishing
the existing regs from the new coprocessor ones.

>      gchar * (*gdb_arch_name)(CPUState *cpu);
>
>      void (*cpu_exec_enter)(CPUState *cpu);
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index cc1856c..00efae4 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1751,6 +1751,11 @@ static void arm_cpu_class_init(ObjectClass *oc, void
> *data)
>  #endif
>      cc->gdb_num_core_regs = 26;
>      cc->gdb_core_xml_file = "arm-core.xml";
> +    cc->gdb_coprocessor_dynamic_xml=true;
> +    cc->gdb_num_cpregs = 0;
> +    cc->get_feature_xml_dynamically = arm_get_feature_xml_dynamically;
> +    cc->gdb_read_cpregister = arm_cpu_gdb_read_cpregister;
> +    cc->gdb_write_cpregister = arm_cpu_gdb_write_cpregister;
>      cc->gdb_arch_name = arm_gdb_arch_name;
>      cc->gdb_stop_before_watchpoint = true;
>      cc->debug_excp_handler = arm_debug_excp_handler;
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 9631670..16f84e3 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -797,6 +797,9 @@ hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cpu,
> vaddr addr,
>
>  int arm_cpu_gdb_read_register(CPUState *cpu, uint8_t *buf, int reg);
>  int arm_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
> +char *arm_get_feature_xml_dynamically(CPUState *cpu);
> +int arm_cpu_gdb_read_cpregister(CPUState *cpu, uint8_t *buf, int reg);
> +int arm_cpu_gdb_write_cpregister(CPUState *cpu, uint8_t *buf, int reg);
>
>  int arm_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
>                               int cpuid, void *opaque);
> @@ -2005,7 +2008,8 @@ static inline bool cp_access_ok(int current_el,
>
>  /* Raw read of a coprocessor register (as needed for migration, etc) */
>  uint64_t read_raw_cp_reg(CPUARMState *env, const ARMCPRegInfo *ri);
> -
> +void write_raw_cp_reg(CPUARMState *env, const ARMCPRegInfo *ri,
> +                             uint64_t v);
>  /**
>   * write_list_to_cpustate
>   * @cpu: ARMCPU
> diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
> index 04c1208..123da12 100644
> --- a/target/arm/gdbstub.c
> +++ b/target/arm/gdbstub.c
> @@ -101,3 +101,93 @@ int arm_cpu_gdb_write_register(CPUState *cs, uint8_t
> *mem_buf, int n)
>      /* Unknown register.  */
>      return 0;
>  }
> +
> +static void arm_generate_xml(gpointer key, gpointer value, gpointer cs)
> +{
> +    ARMCPU *cpu = ARM_CPU(cs);
> +    CPUClass *cc = CPU_GET_CLASS(cpu);
> +    XMLDynamicDescription *dyn_xml = &cc->dyn_xml;
> +    ARMCPRegInfo *ri = value;
> +    uint32_t ri_key= *(uint32_t *)key;
> +    CPUARMState *env = &cpu->env;
> +    char **target_xml=(char **)&(dyn_xml->desc);
> +    char *tmp_xml=*target_xml;

If you run your patch through scripts/checkpatch.pl it will
hopefully point out the places where your code doesn't match our
coding style (whitespace, etc).


thanks
-- PMM
