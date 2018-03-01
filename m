Received: by 10.28.91.67 with SMTP id p64csp2051950wmb;
        Thu, 1 Mar 2018 08:52:54 -0800 (PST)
X-Google-Smtp-Source: AG47ELsbWdXAQDq4dS2aLK0o219IEg/MY6iN0CAqpt1WE86jKUNOr9wdODRkqCm2yBW8uMa8xBLR
X-Received: by 2002:a25:b804:: with SMTP id v4-v6mr1562313ybj.259.1519923174606;
        Thu, 01 Mar 2018 08:52:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519923174; cv=none;
        d=google.com; s=arc-20160816;
        b=dYNn9R1/jZ+ezPMWWay6G/3+T+GsioI3PvP6XJ4W1vXi6SMRu9LdM3u4vr39sDZLHV
         dGTvqoAl4lfOpSBLIGzsQPriZG2e28aBTnzOqO7jURNd3DXSLCmmyeGv3XYvjuBW3yQJ
         dwzy7WYU+WrGgscC1yyVU+qSon2Ph8rKPRU93lRniRRactDJHMmgy4lerGCD3rxS9kFH
         YTE41hVnx9idjhKewKAGx4O1lbvgoZy5NtN5FPxLLA6tOa5uwgBhDpe/aXaHdf4X/lPL
         G4LSsP8fKsZz2U6r+rcqfMbFBOLS5KVH0FXZSe75YY+VN+bKp0qcB30RhtK4b5w7v2Je
         Vcrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=72UHY1sRBjn/juCfwAu9m9xPlmZJ6lswmuglbiC5j8Q=;
        b=MdNouAHWqQ9nluQqQE+nifvRoYpDSNYzo6s7Vm+T/kS9lG1HH5rnybhHseG+N07LVk
         OVIiAWxv/K7meKJFwO9fUqZqBs70IiLFbCZQx2e6lz0M1OeDRRphfBdUJd/OKL1MzPCL
         F8mktebH8jx4LPDoGNWTHTwmKM2wCsDjLHIzAK0XslT2f7aVQ7IkepFVMB83SlRIDJsu
         Tl6zgOOjbkp5+hRPmjepsqTUlzRhbD5vDYkuT6oQGPM8qe6Sji2SHEqdy1MN2E7QiGNS
         wxG/AG1RJtoQKz1Go2JZXpwhQFsEV0KdB36cqVu+jKAa0c2AW03Svj3+EqqqinOU+qhA
         Bk+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=e9xjHezk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y4-v6si704281ybg.473.2018.03.01.08.52.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 01 Mar 2018 08:52:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=e9xjHezk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58106 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1erRRu-0003MR-0K
	for alex.bennee@linaro.org; Thu, 01 Mar 2018 11:52:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48862)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1erRKW-0005VJ-Dh
	for qemu-arm@nongnu.org; Thu, 01 Mar 2018 11:45:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1erRKU-0008N9-Ns
	for qemu-arm@nongnu.org; Thu, 01 Mar 2018 11:45:16 -0500
Received: from mail-ot0-x242.google.com ([2607:f8b0:4003:c0f::242]:40037)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1erRKU-0008MF-FF
	for qemu-arm@nongnu.org; Thu, 01 Mar 2018 11:45:14 -0500
Received: by mail-ot0-x242.google.com with SMTP id l12so6144013otj.7
	for <qemu-arm@nongnu.org>; Thu, 01 Mar 2018 08:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=72UHY1sRBjn/juCfwAu9m9xPlmZJ6lswmuglbiC5j8Q=;
	b=e9xjHezkvxR+mYIhG4P1jlcY8512+lPUHV5O9lOn0w89hS7j0MhesHvygMOuTTfGSD
	o4pH47+adhkf3aeDAKYewDt7IUqojog6Gg8o8NGl9HGrPFNBm1Z0SPnjDEp7vilh0vHm
	fWde2nktnXITzxxjxxEm4G471X2or57UZsEQY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=72UHY1sRBjn/juCfwAu9m9xPlmZJ6lswmuglbiC5j8Q=;
	b=TiQ2FK7us6huZHL0WfAPSu0JP5K19Ao3MVTIJw0SXInT7JHuNqw9Jg7srs9lm9msNB
	hsqipPECNTI/wNX+/NbHPgfbw3mzAllO2V71msvKTDZdMGqY7Q7fy5yI5kZ9IJIE1kzH
	yow45rMqPsR9SFnQQB85DZqby49GTKzJHBHROJJphkv/qeHEV40kj236ZN3PbQCRDkIy
	RGrrbB98rq6puPgPC0dsQxx9rhWqX39v4ZAuj/Izzw0CCH9B3OyNeJRrEZfvTm0Vlh3n
	D2qqoUZNidytuTECdM/NHMg8eWtZDIK4HKz1DcG9BroFRIJjGF5mFWQg6Bo9rPKwWypV
	ATng==
X-Gm-Message-State: AElRT7F5d0JExd0nAzeQLGdbY29l0g1lkeqOsy+HzX0mrck/Jk9gJkWB
	aYNcMUhiRqC4OULJLiSoH3IaqruZ9H/aaqdgHa42uw==
X-Received: by 10.157.69.152 with SMTP id x24mr1728084ote.126.1519922713427;
	Thu, 01 Mar 2018 08:45:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Thu, 1 Mar 2018 08:44:53 -0800 (PST)
In-Reply-To: <1519815685-29200-4-git-send-email-abdallah.bouassida@lauterbach.com>
References: <1519815685-29200-1-git-send-email-abdallah.bouassida@lauterbach.com>
	<1519815685-29200-4-git-send-email-abdallah.bouassida@lauterbach.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 1 Mar 2018 16:44:53 +0000
Message-ID: <CAFEAcA88s2X9qkFVYG6kmeeZj6-bp0uskXb8TJF0HMfUVVSf8A@mail.gmail.com>
To: Abdallah Bouassida <abdallah.bouassida@lauterbach.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::242
Subject: Re: [Qemu-arm] [PATCH v3 3/4] target/arm: Add the XML dynamic
 generation
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
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ssWyfJUM6Aa0

On 28 February 2018 at 11:01, Abdallah Bouassida
<abdallah.bouassida@lauterbach.com> wrote:
> Generate an XML description for the cp-regs.
> Register these regs with the gdb_register_coprocessor().
> Add arm_gdb_get_sysreg() to use it as a callback to read those regs.
>
> Signed-off-by: Abdallah Bouassida <abdallah.bouassida@lauterbach.com>
> ---
>  gdbstub.c            |  7 ++++
>  include/qom/cpu.h    |  9 ++++-
>  target/arm/cpu.c     |  3 ++
>  target/arm/cpu.h     | 17 +++++++++
>  target/arm/gdbstub.c | 97 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>  5 files changed, 132 insertions(+), 1 deletion(-)
>
> diff --git a/gdbstub.c b/gdbstub.c
> index f1d5148..ffab30b 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -665,6 +665,9 @@ static const char *get_feature_xml(const char *p, const char **newp,
>              pstrcat(target_xml, sizeof(target_xml), "<xi:include href=\"");
>              pstrcat(target_xml, sizeof(target_xml), cc->gdb_core_xml_file);
>              pstrcat(target_xml, sizeof(target_xml), "\"/>");
> +            if (cc->gdb_has_dynamic_xml) {
> +                cc->register_gdb_regs_for_features(cpu);
> +            }

I don't think we need a callback hook for this. You could just assume
the target code has already done whatever it needs. Specifically for
arm you can just make arm_cpu_register_gdb_regs_for_features() in helper.c
call gdb_register_coprocessor(..., "system-registers.xml",...) the
same way it already does for other xml files.

>              for (r = cpu->gdb_regs; r; r = r->next) {
>                  pstrcat(target_xml, sizeof(target_xml), "<xi:include href=\"");
>                  pstrcat(target_xml, sizeof(target_xml), r->xml);
> @@ -674,6 +677,10 @@ static const char *get_feature_xml(const char *p, const char **newp,
>          }
>          return target_xml;
>      }
> +    if (strncmp(p, "system-registers.xml", len) == 0) {
> +        CPUState *cpu = first_cpu;
> +        return cc->gdb_get_dynamic_xml(cpu);
> +    }

Rather than hardcoding that "system-registers.xml" is special, just
have the hook pass the xml filename to the CPU hook, and let it
decide whether it wants to handle the filename or not.

Also you must check whether the hook function is NULL before calling it,
or this will crash on CPUs that haven't implemented it.

>      for (i = 0; ; i++) {
>          name = xml_builtin[i][0];
>          if (!name || (strncmp(name, p, len) == 0 && strlen(name) == len))
> diff --git a/include/qom/cpu.h b/include/qom/cpu.h
> index aff88fa..04771b3 100644
> --- a/include/qom/cpu.h
> +++ b/include/qom/cpu.h
> @@ -131,6 +131,11 @@ struct TranslationBlock;
>   *           before the insn which triggers a watchpoint rather than after it.
>   * @gdb_arch_name: Optional callback that returns the architecture name known
>   * to GDB. The caller must free the returned string with g_free.
> + * @gdb_has_dynamic_xml: Indicates if GDB supports generating a dynamic XML
> + *                   description for the sysregs of this CPU.
> + * @register_gdb_regs_for_features: Callback for letting GDB create a dynamic
> + *       XML description for the sysregs and register those sysregs afterwards.
> + * @gdb_get_dynamic_xml: Callback for letting GDB get the dynamic XML.
>   * @cpu_exec_enter: Callback for cpu_exec preparation.
>   * @cpu_exec_exit: Callback for cpu_exec cleanup.
>   * @cpu_exec_interrupt: Callback for processing interrupts in cpu_exec.
> @@ -197,7 +202,9 @@ typedef struct CPUClass {
>      const struct VMStateDescription *vmsd;
>      const char *gdb_core_xml_file;
>      gchar * (*gdb_arch_name)(CPUState *cpu);
> -
> +    bool gdb_has_dynamic_xml;
> +    void (*register_gdb_regs_for_features)(CPUState *cpu);
> +    char *(*gdb_get_dynamic_xml)(CPUState *cpu);

You should only need one new field, something like
       char *(*gdb_get_dynamic_xml)(CPUState *cpu, const char *xmlname);
doc comment something like
    * gdb_get_dynamic_xml: Callback to return dynamically generated XML
      for the gdb stub. Returns a pointer to the XML contents for the
      specified XML file, or NULL if the CPU doesn't have dynamically
      generated contents for it.

>      void (*cpu_exec_enter)(CPUState *cpu);
>      void (*cpu_exec_exit)(CPUState *cpu);
>      bool (*cpu_exec_interrupt)(CPUState *cpu, int interrupt_request);
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 1b3ae62..04c4d04 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1781,6 +1781,9 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
>      cc->gdb_num_core_regs = 26;
>      cc->gdb_core_xml_file = "arm-core.xml";
>      cc->gdb_arch_name = arm_gdb_arch_name;
> +    cc->gdb_has_dynamic_xml = true;
> +    cc->register_gdb_regs_for_features = arm_register_gdb_regs_for_features;
> +    cc->gdb_get_dynamic_xml = arm_gdb_get_dynamic_xml;
>      cc->gdb_stop_before_watchpoint = true;
>      cc->debug_excp_handler = arm_debug_excp_handler;
>      cc->debug_check_watchpoint = arm_debug_check_watchpoint;
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 92cfe4c..0e35f64 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -133,6 +133,19 @@ enum {
>     s<2n+1> maps to the most significant half of d<n>
>   */
>
> +/**
> + * DynamicGDBXMLInfo:
> + * @desc: Contains the XML descriptions.
> + * @num_cpregs: Number of the Coprocessor registers seen by GDB.
> + * @cpregs_keys: Array that contains the corresponding Key of
> + * a given cpreg with the same order of the cpreg in the XML description.
> + */
> +typedef struct DynamicGDBXMLInfo {
> +    char *desc;
> +    int num_cpregs;
> +    uint32_t *cpregs_keys;
> +} DynamicGDBXMLInfo;
> +
>  /* CPU state for each instance of a generic timer (in cp15 c14) */
>  typedef struct ARMGenericTimer {
>      uint64_t cval; /* Timer CompareValue register */
> @@ -671,6 +684,8 @@ struct ARMCPU {
>      uint64_t *cpreg_vmstate_values;
>      int32_t cpreg_vmstate_array_len;
>
> +    DynamicGDBXMLInfo dyn_xml;
> +
>      /* Timers used by the generic (architected) timer */
>      QEMUTimer *gt_timer[NUM_GTIMERS];
>      /* GPIO outputs for generic timer */
> @@ -835,6 +850,8 @@ hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
>
>  int arm_cpu_gdb_read_register(CPUState *cpu, uint8_t *buf, int reg);
>  int arm_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
> +void arm_register_gdb_regs_for_features(CPUState *cpu);
> +char *arm_gdb_get_dynamic_xml(CPUState *cpu);
>
>  int arm_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
>                               int cpuid, void *opaque);
> diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
> index 04c1208..e08ad79 100644
> --- a/target/arm/gdbstub.c
> +++ b/target/arm/gdbstub.c
> @@ -101,3 +101,100 @@ int arm_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
>      /* Unknown register.  */
>      return 0;
>  }
> +
> +static void arm_gen_one_xml_reg_tag(DynamicGDBXMLInfo *dyn_xml,
> +                                    ARMCPRegInfo *ri, uint32_t ri_key,
> +                                    bool is64)
> +{
> +    GString *s = g_string_new(dyn_xml->desc);

Rather than creating a new GString here, use the one you
already had in arm_gen_dynamic_xml() to do all the appending,
and only convert it to an actual C string at the very end.

> +
> +    g_string_append_printf(s, "<reg name=\"%s\"", ri->name);
> +    g_string_append_printf(s, " bitsize=\"%s\"", is64 ? "64" : "32");
> +    g_string_append_printf(s, " group=\"cp_regs\"/>");
> +    dyn_xml->desc = g_string_free(s, false);
> +    dyn_xml->num_cpregs++;
> +    dyn_xml->cpregs_keys = g_renew(uint32_t,
> +                                       dyn_xml->cpregs_keys,
> +                                       dyn_xml->num_cpregs);
> +    dyn_xml->cpregs_keys[dyn_xml->num_cpregs - 1] = ri_key;
> +}
> +
> +static void arm_register_sysreg_for_xml(gpointer key, gpointer value,
> +                                        gpointer cs)
> +{
> +    ARMCPU *cpu = ARM_CPU(cs);
> +    CPUARMState *env = &cpu->env;
> +    ARMCPRegInfo *ri = value;
> +    uint32_t ri_key = *(uint32_t *)key;
> +
> +    if (!(ri->type & (ARM_CP_NO_RAW | ARM_CP_NO_GDB))) {
> +        if (env->aarch64) {
> +            if (ri->state == ARM_CP_STATE_AA64) {
> +                arm_gen_one_xml_reg_tag(&cpu->dyn_xml, ri, ri_key, 1);
> +            }
> +        } else {
> +            if (ri->state == ARM_CP_STATE_AA32) {
> +                if (!arm_feature(env, ARM_FEATURE_EL3) &&
> +                    (ri->secure & ARM_CP_SECSTATE_S)) {
> +                    return;
> +                }
> +                if (ri->type & ARM_CP_64BIT) {
> +                    arm_gen_one_xml_reg_tag(&cpu->dyn_xml, ri, ri_key, 1);
> +                } else {
> +                    arm_gen_one_xml_reg_tag(&cpu->dyn_xml, ri, ri_key, 0);
> +                }
> +            }
> +        }
> +    }
> +}
> +
> +static int arm_gen_dynamic_xml(CPUState *cs)
> +{
> +    ARMCPU *cpu = ARM_CPU(cs);
> +    GString *s = g_string_new(NULL);
> +
> +    cpu->dyn_xml.num_cpregs = 0;
> +    g_string_printf(s, "<?xml version=\"1.0\"?>");
> +    g_string_append_printf(s, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">");
> +    g_string_append_printf(s, "<feature name=\"org.gnu.gdb.sys.regs\">");
> +    cpu->dyn_xml.desc = g_string_free(s, false);
> +    g_hash_table_foreach(cpu->cp_regs, arm_register_sysreg_for_xml, cs);
> +    s = g_string_new(cpu->dyn_xml.desc);
> +    g_string_append_printf(s, "</feature>");
> +    cpu->dyn_xml.desc = g_string_free(s, false);
> +    return  cpu->dyn_xml.num_cpregs;
> +}
> +
> +static int arm_gdb_get_sysreg(CPUARMState *env, uint8_t *buf, int reg)
> +{
> +    ARMCPU *cpu = arm_env_get_cpu(env);
> +    const ARMCPRegInfo *ri;
> +    uint32_t key;
> +
> +    key = cpu->dyn_xml.cpregs_keys[reg];
> +    ri = get_arm_cp_reginfo(cpu->cp_regs, key);
> +    if (ri) {
> +        if (cpreg_field_is_64bit(ri)) {
> +            return gdb_get_reg64(buf, (uint64_t)read_raw_cp_reg(env, ri));
> +        } else {
> +            return gdb_get_reg32(buf, (uint32_t)read_raw_cp_reg(env, ri));
> +        }
> +    }
> +    return 0;
> +}
> +
> +void arm_register_gdb_regs_for_features(CPUState *cs)
> +{
> +    int n;
> +
> +    n = arm_gen_dynamic_xml(cs);
> +    gdb_register_coprocessor(cs, arm_gdb_get_sysreg, NULL,
> +                             n, "system-registers.xml", 0);
> +
> +}
> +
> +char *arm_gdb_get_dynamic_xml(CPUState *cs)
> +{
> +    ARMCPU *cpu = ARM_CPU(cs);
> +    return cpu->dyn_xml.desc;
> +}
> --

thanks
-- PMM
