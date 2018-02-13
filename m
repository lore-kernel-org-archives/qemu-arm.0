Received: by 10.28.71.27 with SMTP id u27csp1680088wma;
        Tue, 13 Feb 2018 11:08:43 -0800 (PST)
X-Google-Smtp-Source: AH8x226SxZpyf4sXE8Nap8NFpWK7BMGVbdZcGbxuk1I5RWZjLtCo/yvqer2uhgrwlPpOIM5z8Q4v
X-Received: by 10.37.70.67 with SMTP id t64mr1570480yba.100.1518548923150;
        Tue, 13 Feb 2018 11:08:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518548923; cv=none;
        d=google.com; s=arc-20160816;
        b=yfTVSeZio95oSkVkrLDOt7ir5EtdcqbbUrbFg5a7zlACIAKiJlfB8eH60XerRx+14O
         P4gTx+Pu2ez0y7N4W72VmRUvAXBRHbr84wOKYwg5rjZFxIkk1gHR+rKS6VTYZqKVG0kY
         RSVXw/RcwySlX+7VNSsTtN0c3X4BfWUGmZ46uEMBzdzexSSR2zAqVmQpCDYWTK6MSF7B
         bLw3ogXkirA2KpYcC+4Ija9RkhqS5fQF4nJKK3eJoibHz21xc8ihwYncAMgmZ0ta8Jqh
         6lsT/uYEt5aSkAMsQ7S1JN8wvJsFVGTvTxx/9UMCmec4kJ+L1h18XNWvAC2cSpLKfZlF
         BNXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=Nvw8hx0hryeDUQKfePvedUUcDIIG8RD3sGS3xUw5G24=;
        b=r62EcXEJGHUwgf9Bu9m1Hn63l5Hz03zwqE38/nlYBzFWTMiXQXtLTObiaPLHZxzvzf
         otgcBsBbiDwhYJRtWUKYmsjVtx4ljhAdcH+oTShywYGUwjj7UtKmXBn5ilkaiA4mbgsk
         BvUSbLqXVEJgshVDUFHOFNC10IgWnIthcQMw0rENudzI9eC9/9n3Ym90UwehB0YxCxbD
         vx9pg6fmevGLGfZcpH05mPUD9S4gf5j8xFff1kp7nhQORMRybl+038D1BHPigjYzee/Y
         wedjmvFzu70zFaTNd6gIGZ/e3eFAnqbH/9hi49t9Vim9Btd4SMCBh04sum25qxhXcI+5
         sXbg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fHGV2AMk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 4si98867ybk.605.2018.02.13.11.08.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Feb 2018 11:08:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fHGV2AMk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39745 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1elfwY-0002qo-Ip
	for alex.bennee@linaro.org; Tue, 13 Feb 2018 14:08:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35059)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1elfwM-0002pp-E7
	for qemu-arm@nongnu.org; Tue, 13 Feb 2018 14:08:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1elfwJ-00036M-Gf
	for qemu-arm@nongnu.org; Tue, 13 Feb 2018 14:08:30 -0500
Received: from mail-oi0-x22f.google.com ([2607:f8b0:4003:c06::22f]:36488)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1elfwJ-000352-6L
	for qemu-arm@nongnu.org; Tue, 13 Feb 2018 14:08:27 -0500
Received: by mail-oi0-x22f.google.com with SMTP id 24so14677165oij.3
	for <qemu-arm@nongnu.org>; Tue, 13 Feb 2018 11:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Nvw8hx0hryeDUQKfePvedUUcDIIG8RD3sGS3xUw5G24=;
	b=fHGV2AMk9x11tEIGPIZqr4o2Ep+48IF7VbWMyl+CZdUjIOVghxp+xU1ztR4hpm1p6j
	XKWv/ZO2cvFBs2a5ihrVc4YdKxFJIprAuLxQ4RDaIj2v1qLZTGM/rRO+uk6QG44uzlHN
	pO0eqmnD2Zbl18bzYwlGqsd4bBR2ej+eUUAIQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Nvw8hx0hryeDUQKfePvedUUcDIIG8RD3sGS3xUw5G24=;
	b=NgYtNGSXZ48aiTecru5Yy7IkiX1H7ATqjhgBeTj/WHJLkN9yZEURezmWgHY39fxlu7
	lPd0IqWiFUT6e1AVO5P98Y8o1DeukczVY6u8tiiIFdyp2ruv4jrBPETr/9mdUAEES09C
	T7Jfk2Zr6O9fFY7YpSs7X6QV0hz+drw4oMjrvUN0I41T+ZVVxtkOJta7fbxS5Y2mLs8I
	2nYrFBhYXPHq06KUyZ9GJD01Dj3wB0ksD/dl36ZGiFVSgSVS6sUiKx1L3XO2fa71WeTn
	FBPv1zyCZinbxC1mUg8SWK8KobbbgvQT7nEQF1UQ6mXA/qSNL7Xc8BWHDK2uYOTDQKr/
	SJvQ==
X-Gm-Message-State: APf1xPCwRpimjtyqkmnFxc3sUqsi5nTZ4+3EAZJYIUPgcuwmku5QJs7l
	UhGrtsTAtCtqqRqO6fACZm1Ge7dnTMehhuFHSbfK7Q==
X-Received: by 10.202.180.136 with SMTP id d130mr1601703oif.328.1518548906120; 
	Tue, 13 Feb 2018 11:08:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.18.136 with HTTP; Tue, 13 Feb 2018 11:08:05 -0800 (PST)
In-Reply-To: <1518542209-23286-1-git-send-email-abdallah.bouassida@gmail.com>
References: <1518542209-23286-1-git-send-email-abdallah.bouassida@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Feb 2018 19:08:05 +0000
Message-ID: <CAFEAcA9pU=Cxc8Ufo-t0CFK_yR80qv4YuJXsW_GFf-QJMstUDw@mail.gmail.com>
To: Abdallah Bouassida <abdallah.bouassida@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::22f
Subject: Re: [Qemu-arm] [PATCH V2] target-arm:Add a dynamic XML-description
 of the cp-registers to GDB
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
Cc: Khaled Jmal <khaled.jmal@lauterbach.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Abdallah Bouassida <abdallah.bouassida@lauterbach.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HBGuPP0DOYN8

On 13 February 2018 at 17:16, Abdallah Bouassida
<abdallah.bouassida@gmail.com> wrote:
> This patch offers to GDB the ability to read/write all the coprocessor
> registers for ARM and ARM64 by generating dynamically an XML-description for
> these registers.
>
> Signed-off-by: Abdallah Bouassida <abdallah.bouassida@lauterbach.com>
> ---
> Hi Peter,
>
> http://patchwork.ozlabs.org/patch/867467/
> My last patch was also mangled by Thunderbird even after changing the
> settings to send a plain text..!
> Anyway, here it is the patch using the git send-mail command.

Thanks for the resend. I've had a look through and have some
review comments below.

> Best regards,
> Abdallah
>
>  gdbstub.c              | 18 +++++++++++
>  include/qom/cpu.h      |  3 ++
>  target/arm/cpu.c       |  3 ++
>  target/arm/cpu.h       | 18 +++++++++++
>  target/arm/gdbstub.c   | 87 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  target/arm/gdbstub64.c | 25 +++++++++++++++
>  target/arm/helper.c    |  3 +-
>  7 files changed, 155 insertions(+), 2 deletions(-)
>
> diff --git a/gdbstub.c b/gdbstub.c
> index f1d5148..f54053f 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -670,10 +670,20 @@ static const char *get_feature_xml(const char *p, const char **newp,
>                  pstrcat(target_xml, sizeof(target_xml), r->xml);
>                  pstrcat(target_xml, sizeof(target_xml), "\"/>");
>              }
> +            if (cc->has_dynamic_xml) {
> +                cc->gen_dynamic_xml(cpu);
> +                pstrcat(target_xml, sizeof(target_xml), "<xi:include href=\"");
> +                pstrcat(target_xml, sizeof(target_xml), "dynamic_desc.xml");
> +                pstrcat(target_xml, sizeof(target_xml), "\"/>");
> +            }
>              pstrcat(target_xml, sizeof(target_xml), "</target>");
>          }
>          return target_xml;
>      }
> +    if (strncmp(p, "dynamic_desc.xml", len) == 0) {
> +        CPUState *cpu = first_cpu;
> +        return cc->get_dynamic_xml(cpu);
> +    }

Looking more closely at the gdbstub code I realized it already has
a mechanism for the target cpu code to register extra registers: the
gdb_register_coprocessor() function. If we use that for the system
registers we can avoid most of the changes to gdbstub.c. All you need
is a single change to get_feature_xml() so that it calls a CPU
object method passing it the name of the xml file being looked for,
something like:

    /* The target CPU object has an opportunity to generate XML dynamically */
    if (cc->gdb_get_xml) {
        const char *xmlname = g_strndup(p, len);
        const char *xml = cc->gdb_get_xml(xmlname);
        g_free(xmlname);
        if (xml) {
            return xml;
        }
    }

Then the arm code should call
   gdb_register_coprocessor(cs, sysreg_gdb_get_reg, sysreg_gdb_set_reg,
                                 n, "system-registers.xml", 0);
   in arm_cpu_register_gdb_regs_for_features().
You might as well generate the xml here too, I guess.

The gdb_get_xml hook implementation can then just check for
"is the filename system-registers.xml, if so return our cached xml".


>      for (i = 0; ; i++) {
>          name = xml_builtin[i][0];
>          if (!name || (strncmp(name, p, len) == 0 && strlen(name) == len))
> @@ -697,6 +707,10 @@ static int gdb_read_register(CPUState *cpu, uint8_t *mem_buf, int reg)
>              return r->get_reg(env, mem_buf, reg - r->base_reg);
>          }
>      }
> +
> +    if (cc->has_dynamic_xml) {
> +        return cc->gdb_read_register(cpu, mem_buf, reg);
> +    }
>      return 0;
>  }
>
> @@ -715,6 +729,10 @@ static int gdb_write_register(CPUState *cpu, uint8_t *mem_buf, int reg)
>              return r->set_reg(env, mem_buf, reg - r->base_reg);
>          }
>      }
> +
> +    if (cc->has_dynamic_xml) {
> +        return cc->gdb_write_register(cpu, mem_buf, reg);
> +    }
>      return 0;
>  }

These changes won't be needed because the code for handling registers
registered by gdb_register_coprocessor() can deal with them.

>
> diff --git a/include/qom/cpu.h b/include/qom/cpu.h
> index aff88fa..907d4dc 100644
> --- a/include/qom/cpu.h
> +++ b/include/qom/cpu.h
> @@ -197,6 +197,9 @@ typedef struct CPUClass {
>      const struct VMStateDescription *vmsd;
>      const char *gdb_core_xml_file;
>      gchar * (*gdb_arch_name)(CPUState *cpu);
> +    bool has_dynamic_xml;
> +    void (*gen_dynamic_xml)(CPUState *cpu);
> +    char *(*get_dynamic_xml)(CPUState *cpu);

New members in this struct should have entries added to the
documentation comment for the struct.

>      void (*cpu_exec_enter)(CPUState *cpu);
>      void (*cpu_exec_exit)(CPUState *cpu);
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 9da6ea5..9e060a6 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1752,6 +1752,9 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
>      cc->gdb_num_core_regs = 26;
>      cc->gdb_core_xml_file = "arm-core.xml";
>      cc->gdb_arch_name = arm_gdb_arch_name;
> +    cc->has_dynamic_xml = true;
> +    cc->gen_dynamic_xml = arm_gen_dynamic_xml;
> +    cc->get_dynamic_xml = arm_get_dynamic_xml;
>      cc->gdb_stop_before_watchpoint = true;
>      cc->debug_excp_handler = arm_debug_excp_handler;
>      cc->debug_check_watchpoint = arm_debug_check_watchpoint;
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index d2bb59e..707e2c3 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -135,6 +135,19 @@ enum {
>     s<2n+1> maps to the most significant half of d<n>
>   */
>
> +/**
> + * XMLDynamicDescription:
> + * @desc: Contains the XML descriptions.
> + * @num_cpregs: Number of the Coprocessor registers seen by GDB.
> + * @cpregs_keys: Array that contains the corresponding Key of
> + * a given cpreg with the same order of the cpreg in the XML description.
> + */
> +typedef struct XMLDynamicDescription {
> +    char *desc;
> +    int num_cpregs;
> +    uint32_t *cpregs_keys;
> +} XMLDynamicDescription;

Let's call this DynamicGDBXMLInfo.

> +
>  /* CPU state for each instance of a generic timer (in cp15 c14) */
>  typedef struct ARMGenericTimer {
>      uint64_t cval; /* Timer CompareValue register */
> @@ -633,6 +646,8 @@ struct ARMCPU {
>      uint64_t *cpreg_vmstate_values;
>      int32_t cpreg_vmstate_array_len;
>
> +    XMLDynamicDescription dyn_xml;
> +
>      /* Timers used by the generic (architected) timer */
>      QEMUTimer *gt_timer[NUM_GTIMERS];
>      /* GPIO outputs for generic timer */
> @@ -797,6 +812,8 @@ hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
>
>  int arm_cpu_gdb_read_register(CPUState *cpu, uint8_t *buf, int reg);
>  int arm_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
> +void arm_gen_dynamic_xml(CPUState *cpu);
> +char *arm_get_dynamic_xml(CPUState *cpu);
>
>  int arm_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
>                               int cpuid, void *opaque);
> @@ -2006,6 +2023,7 @@ static inline bool cp_access_ok(int current_el,
>
>  /* Raw read of a coprocessor register (as needed for migration, etc) */
>  uint64_t read_raw_cp_reg(CPUARMState *env, const ARMCPRegInfo *ri);
> +void write_raw_cp_reg(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t v);
>
>  /**
>   * write_list_to_cpustate
> diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
> index 04c1208..7cffe87 100644
> --- a/target/arm/gdbstub.c
> +++ b/target/arm/gdbstub.c
> @@ -56,6 +56,17 @@ int arm_cpu_gdb_read_register(CPUState *cs, uint8_t *mem_buf, int n)
>          /* CPSR */
>          return gdb_get_reg32(mem_buf, cpsr_read(env));
>      }
> +    if (n >= cs->gdb_num_regs &&
> +        n < cs->gdb_num_regs + cpu->dyn_xml.num_cpregs) {
> +        const ARMCPRegInfo *ri;
> +        uint32_t key;
> +
> +        key = cpu->dyn_xml.cpregs_keys[n - cs->gdb_num_regs];
> +        ri = get_arm_cp_reginfo(arm_env_get_cpu(env)->cp_regs, key);
> +        if (ri) {
> +            return gdb_get_reg32(mem_buf, (uint32_t)read_raw_cp_reg(env, ri));
> +        }
> +    }

This code can go in the new sysreg_gdb_get_reg, sysreg_gdb_set_reg
functions which we pass to gdb_register_coprocessor(). (You should
no longer need the checks on "is the register number in range"
or the "- cs->gdb_num_regs" adjustment.)

>      /* Unknown register.  */
>      return 0;
>  }
> @@ -98,6 +109,82 @@ int arm_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
>          cpsr_write(env, tmp, 0xffffffff, CPSRWriteByGDBStub);
>          return 4;
>      }
> +    if (n >= cs->gdb_num_regs &&
> +        n < cs->gdb_num_regs + cpu->dyn_xml.num_cpregs) {
> +        const ARMCPRegInfo *ri;
> +        uint32_t key;
> +
> +        key = cpu->dyn_xml.cpregs_keys[n - cs->gdb_num_regs];
> +        ri = get_arm_cp_reginfo(arm_env_get_cpu(env)->cp_regs, key);
> +        if (ri) {
> +            if (!(ri->type & ARM_CP_CONST)) {
> +                write_raw_cp_reg(env, ri, tmp);
> +                return 4;

Not all coprocessor registers are 32 bit for a 32-bit CPU -- you need
to handle the case where the ARMCPRegInfo type has ARM_CP_64BIT set,
for instance TTBR0 on an LPAE CPU.


I also still don't really like using write_raw_cp_reg() here --
it will bypass some behaviour you want and in some cases will
just break the emulation because invariants we assume will
hold no longer hold. It would be a lot lot safer to not
provide write access at all, only read access.

> +            }
> +        }
> +    }
>      /* Unknown register.  */
>      return 0;
>  }
> +
> +static void arm_gen_xml_reg(gpointer key, gpointer value, gpointer cs)
> +{
> +    ARMCPU *cpu = ARM_CPU(cs);
> +    XMLDynamicDescription *dyn_xml = &cpu->dyn_xml;
> +    ARMCPRegInfo *ri = value;
> +    uint32_t ri_key = *(uint32_t *)key;
> +    CPUARMState *env = &cpu->env;
> +    char **target_xml = (char **)&(dyn_xml->desc);

I think this code will be clearer if you work with a local
char * variable, and just assign to cpu->dyn_xml.desc at the end,
rather than trying to do everything via *target_xml.

> +    char *tmp_xml = *target_xml;
> +
> +    if (!(ri->type & (ARM_CP_NO_RAW | ARM_CP_ALIAS))) {

I've realised that not registering info for alias registers is
awkward for the aarch32 case, because a common pattern is
that we create an ARMCPRegInfo for the AArch64 register which
has the 'master copy' of the state, and then an ARMCPRegInfo
for the AArch32 register which is architecturally banked with
the AArch64 register, and mark the AArch32 register as ARM_CP_ALIAS.
So a lot of registers that ought to be visible won't be
(example: CNTFRQ).

But some things marked 'ALIAS' we definitely don't want
to report to gdb (for instance the "DACR" register in
not_v8_cp_reginfo[] is CP_ANY wildcarded and if you let
the aliases appear in gdb there are a huge number of them...

My suggestion would be that we do permit ARM_CP_ALIAS
registers to appear, but that we define a new ARM_CP_NO_GDB
which suppresses registration of the register with gdb, and
then have add_cpreg_to_hashtable() set ARM_CP_NO_GDB
as well as ARM_CP_ALIAS for r2->type when it's creating the
CP_ANY wildcard aliases. We can also then use ARM_CP_NO_GDB
to manually suppress registers in future if that seems necessary.


> +        if (env->aarch64) {
> +            if (cpreg_field_is_64bit(ri)) {
> +                *target_xml = g_strconcat(*target_xml,
> +                                        "<reg name=\"", ri->name, "\" ",
> +                                        "bitsize=\"64\" group=\"cp_regs\"/>",
> +                                        NULL);

This is going to get quite expensive, because every time we
add another thing to the end of the string we will allocate
new memory and copy all the existing data across.

I would suggest using the glib GString APIs here:
https://developer.gnome.org/glib/stable/glib-Strings.html

It's pretty simple, you start with
  GString *s = g_string_new(NULL);

then each addition is
  g_string_append_printf(s, "<reg name=\"%s\" bitsize=\"64\"/>", ri->name);

and finally at the end when you've appended everything
you need you do
  cpu->dyn_xml.desc = g_string_free(s, false);

which gets rid of the GString and hands you back the char*
for the final data.

(There is also a g_string_append() for a plain string append,
but I think using the format-string function may be clearer.)

> +            } else {
> +                return;
> +            }
> +        } else {
> +            if (ri->secure & ARM_CP_SECSTATE_S) {
> +                *target_xml = g_strconcat(*target_xml,
> +                                          "<reg name=\"", ri->name, "_S\" ",
> +                                          "bitsize=\"32\" group=\"cp_regs\"/>",
> +                                          NULL);

This has some odd effects in places, for instance:

FCSEIDR(S)_S   0x0      0
CONTEXTIDR(S)_S0x0      0

now have S in their name twice.

We also seem to expose secure-bank registers even when the
CPU doesn't implement EL3, eg:
TPIDRURW_S     0x0      0
TPIDRURO_S     0x0      0
TPIDRPRW_S     0x0      0

as well as

TPIDRURW       0x0      0
TPIDRURO       0x76ff26d0       1996433104
TPIDRPRW       0x3f334000       1060323328

I think the fix for this would be:
 * where define_one_arm_cp_reg_with_opaque() auto-creates both
   secure and non-secure registers from one regdef, arrange for
   it to add "_S" to the secure version
 * fix up places where we have manual secure and non-secure
   regdef structs to follow this convention
 * when we loop through registers to create the xml for gdb,
   don't include entries for the secure bank if the CPU doesn't
   implement EL3

Incidentally, gdb info all-registers mangles its display a bit
for register names longer than 14 characters, but there's not
much we can do about that.

> +            } else {
> +                *target_xml = g_strconcat(*target_xml,
> +                                          "<reg name=\"", ri->name, "\" ",
> +                                          "bitsize=\"32\" group=\"cp_regs\"/>",
> +                                          NULL);
> +            }

This code needs to handle 64-bit AArch32 sysregs as well.

> +        }
> +        g_free(tmp_xml);
> +        dyn_xml->num_cpregs++;
> +        dyn_xml->cpregs_keys = g_renew(uint32_t,
> +                                       dyn_xml->cpregs_keys,
> +                                       dyn_xml->num_cpregs);
> +        dyn_xml->cpregs_keys[dyn_xml->num_cpregs - 1] = ri_key;
> +    }
> +}
> +
> +void arm_gen_dynamic_xml(CPUState *cs)
> +{
> +    ARMCPU *cpu = ARM_CPU(cs);
> +
> +    cpu->dyn_xml.num_cpregs = 0;
> +    cpu->dyn_xml.desc = g_strconcat("<?xml version=\"1.0\"?>",
> +                                 "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">",
> +                                   "<feature name=\"org.gnu.gdb.dynamic.cp\">",
> +                                   NULL);
> +    g_hash_table_foreach(cpu->cp_regs, arm_gen_xml_reg, cs);
> +    cpu->dyn_xml.desc = g_strconcat(cpu->dyn_xml.desc, "</feature>", NULL);

This would be the place to do the g_string_new() and g_string_free().

(I note that here you've forgotten to do a g_free, demonstrating
the awkwardness of the g_strconcat approach.)

> +}
> +
> +char *arm_get_dynamic_xml(CPUState *cs)
> +{
> +    ARMCPU *cpu = ARM_CPU(cs);
> +
> +    return cpu->dyn_xml.desc;
> +}
> diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
> index 49bc3fc..6cf302f 100644
> --- a/target/arm/gdbstub64.c
> +++ b/target/arm/gdbstub64.c
> @@ -38,6 +38,17 @@ int aarch64_cpu_gdb_read_register(CPUState *cs, uint8_t *mem_buf, int n)
>      case 33:
>          return gdb_get_reg32(mem_buf, pstate_read(env));
>      }
> +    if (n >= cs->gdb_num_regs &&
> +        n < cs->gdb_num_regs + cpu->dyn_xml.num_cpregs) {
> +        const ARMCPRegInfo *ri;
> +        uint32_t key;
> +
> +        key = cpu->dyn_xml.cpregs_keys[n - cs->gdb_num_regs];
> +        ri = get_arm_cp_reginfo(arm_env_get_cpu(env)->cp_regs, key);
> +        if (ri) {
> +            return gdb_get_reg64(mem_buf, (uint64_t)read_raw_cp_reg(env, ri));
> +        }
> +    }
>      /* Unknown register.  */
>      return 0;
>  }
> @@ -67,6 +78,20 @@ int aarch64_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
>          pstate_write(env, tmp);
>          return 4;
>      }
> +    if (n >= cs->gdb_num_regs &&
> +        n < cs->gdb_num_regs + cpu->dyn_xml.num_cpregs) {
> +        const ARMCPRegInfo *ri;
> +        uint32_t key;
> +
> +        key = cpu->dyn_xml.cpregs_keys[n - cs->gdb_num_regs];
> +        ri = get_arm_cp_reginfo(arm_env_get_cpu(env)->cp_regs, key);
> +        if (ri) {
> +            if (!(ri->type & ARM_CP_CONST)) {
> +                write_raw_cp_reg(env, ri, tmp);
> +                return 8;
> +            }
> +        }

I think you should be able to handle both aarch64 and aarch32
with one set of sysreg_gdb_get_reg, sysreg_gdb_set_reg functions.

> +    }
>      /* Unknown register.  */
>      return 0;
>  }
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index bfce096..e0e8339 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -199,8 +199,7 @@ uint64_t read_raw_cp_reg(CPUARMState *env, const ARMCPRegInfo *ri)
>      }
>  }
>
> -static void write_raw_cp_reg(CPUARMState *env, const ARMCPRegInfo *ri,
> -                             uint64_t v)
> +void write_raw_cp_reg(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t v)
>  {
>      /* Raw write of a coprocessor register (as needed for migration, etc).
>       * Note that constant registers are treated as write-ignored; the
> --
> 1.9.1

thanks
-- PMM
