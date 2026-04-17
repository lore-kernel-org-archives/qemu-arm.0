Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B090F43683
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Apr 2026 10:30:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wDgSC-0004Oz-8y; Fri, 17 Apr 2026 06:29:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wDgSA-0004Oi-K9
 for qemu-arm@nongnu.org; Fri, 17 Apr 2026 06:29:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wDgS8-0004CS-Ik
 for qemu-arm@nongnu.org; Fri, 17 Apr 2026 06:29:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1776421775;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nTjPnaM97m42lJaj3yQlXSuIfIKHNWR2PVtUqcIMvP0=;
 b=R20YmAIkUVLHkQ9X5Cd0brVtDzEqSaaL27/OdPd415vPIg9ihslQFcn4UWGfh0mlx2kxkF
 xI7Pwe0fhRsYUW3aB1keOzKB9k3RW3KhLAAsukDla7pwdTC9f+MhdrXgzDxPNAz6xbF6l8
 wbs7VCBVBBEP1sbHejfaYiGk8vPQnT8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-606-Md3i2U-WOrung_-GhG01sA-1; Fri, 17 Apr 2026 06:29:34 -0400
X-MC-Unique: Md3i2U-WOrung_-GhG01sA-1
X-Mimecast-MFC-AGG-ID: Md3i2U-WOrung_-GhG01sA_1776421773
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-488d64eba6eso5735735e9.2
 for <qemu-arm@nongnu.org>; Fri, 17 Apr 2026 03:29:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776421773; x=1777026573;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nTjPnaM97m42lJaj3yQlXSuIfIKHNWR2PVtUqcIMvP0=;
 b=fSKMEWkYsNPU8dMQTbY7uYNDmrLN1ubPaY9dCWwTDuuHfy1C3geaOaqvA5WFuSlHNE
 bm4v81IPEvGVdlF54D/XNwU5Pr5OyGAGrF3nELViKsrTNUffQ3mXPazXwgGXiPzBmRc1
 um4ogZiPQlAyA/yRpcDPS554dbnOJoiDOMcR1huoxPj26YjoNnnJ9ZwnBuEHQf/EqNwG
 W7/jQtC9bN1z45NO9BPT9KB/HKeNz0Sls3czQLNmXfLgtMELYUP4a4Vzy3ukYuPGqC1s
 XBFp3zUIOtcuaUHjRnXl65GprMAvKBXPYrnufOnbsMKz3tERBTyYazpFltIljRkLcwQy
 SU6A==
X-Forwarded-Encrypted: i=1;
 AFNElJ/oSl8nN9FNDjHty60omqrXmsiOmivUFx4mLWeRcewAhGlKXBEcfE9Bb4idKuZ5fQ0svare6XCm4w==@nongnu.org
X-Gm-Message-State: AOJu0Yw2OMCNm37zv4hp2gF+ARuQgufdTJ87KSjvayIz4M7jwOAK1wtj
 XJAjiKMVAy/Sg5HohpwHi1hD/6Xz3uKxpN2aKXMaZfPJDxPLjSqnxe7vCPZusgwmT6IXCrs66oL
 3OCkIF5GyeP3yGbcLhUidlWtl1Ag9/sSpkozl6ASboyQ/irQQmnBKtw==
X-Gm-Gg: AeBDiesrcbU225nsEI6WWuQOnbVJkMM4wFwnNLxq+C1JETZ9yBLXvmXvXZemYXxT47S
 HNiTTKLCbudL0AMUD5cwg4GeC9xoM3mKlruSX7aXoEtKXDFa0mJAUsNX5Q3yElkotDoS4AzDu1J
 FB/+RdYwJnC+VPawrtLDynD6noshs1/ztlIUhL8SaHG38lF63idTcpz0/oVLVin7J0uq+6AOr1e
 S0h+Y1T6IiHfh1HJmmbdf3nloQz1aSOKIkTPcXGhQEfEKUm2CLoex6sGdRCjzEiQCyDOjswCb/A
 NOTt01HG+q89VA3P7aa5nxT4O/VXls1nud01aobY7y+YurYkongNEdKr2d+/K0pti58MHnS983V
 isIaN9LyCg1v0gOJoUxysPdwd+jgRNj8XMwWC5dJOkWwuaTKp+Nb/A11nL75cVMnNEBKetb7ob3
 DE2Jpe
X-Received: by 2002:a05:600c:8901:b0:488:f9cb:f6c4 with SMTP id
 5b1f17b1804b1-488fb7786cemr23837865e9.18.1776421773272; 
 Fri, 17 Apr 2026 03:29:33 -0700 (PDT)
X-Received: by 2002:a05:600c:8901:b0:488:f9cb:f6c4 with SMTP id
 5b1f17b1804b1-488fb7786cemr23837415e9.18.1776421772782; 
 Fri, 17 Apr 2026 03:29:32 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fc189f2esm55230855e9.7.2026.04.17.03.29.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Apr 2026 03:29:31 -0700 (PDT)
Message-ID: <3447633a-6a75-4f18-903e-0094ef82b7bd@redhat.com>
Date: Fri, 17 Apr 2026 12:29:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/6] target/arm/cpu: Introduce the infrastructure for
 cpreg migration tolerances
To: Peter Maydell <peter.maydell@linaro.org>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 cohuck@redhat.com, sebott@redhat.com, peterx@redhat.com, philmd@linaro.org,
 alex.bennee@linaro.org
References: <20260306150302.203112-1-eric.auger@redhat.com>
 <20260306150302.203112-2-eric.auger@redhat.com>
 <CAFEAcA8_m567opty6USJz4zXyLKW28ufQ+JZPQBp-X7HjZRYpg@mail.gmail.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <CAFEAcA8_m567opty6USJz4zXyLKW28ufQ+JZPQBp-X7HjZRYpg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oRcNK61aILAoRkSOhTzF4nVFkL3jAprkMuxCrySXRJ8_1776421773
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.54,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi Peter,

On 4/10/26 1:54 PM, Peter Maydell wrote:
> On Fri, 6 Mar 2026 at 15:03, Eric Auger <eric.auger@redhat.com> wrote:
>> We introduce a datatype for a tolerance with respect to a given
>> cpreg migration issue. The tolerance applies to a given cpreg kvm index,
>> and can be of different types:
>> - ToleranceNotOnBothEnds (cpreg index is allowed to be only present
>>   on one end)
>> - ToleranceDiffInMask (value differences are allowed only within a mask)
>> - ToleranceFieldLT (incoming field value must be less than a given value)
>> - ToleranceFieldGT (incoming field value must be greater than a given value)
>>
>> A QLIST of such tolerances can be populated using a new helper:
>> arm_register_cpreg_mig_tolerance() and arm_cpu_match_cpreg_mig_tolerance()
>> allows to check whether a tolerance exists for a given kvm index and its
>> criterion is matched.
>>
>> callers for those helpers will be introduced in subsequent patches.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Reviewed-by: Sebastian Ott <sebott@redhat.com>
> Thanks for reworking the approach to this. I like this overall,
> so my review comments are all minor stuff.
>
>> ---
>> v8 -> v9
>> - fix the tolerance type checking
>> - rename arm_cpu_cpreg_has_mig_tolerance into arm_cpu_match_cpreg_mig_tolerance
>> ---
>>  target/arm/cpu.h | 33 +++++++++++++++++++++
> Could we put the new types, function prototypes, etc into internals.h
> or cpregs.h ? Generally we try to keep things needed only in other
> target/arm code in some other header than cpu.h, because cpu.h is pulled
> in by a lot of other files outside target/arm.
>
>>  target/arm/cpu.c | 75 ++++++++++++++++++++++++++++++++++++++++++++++++
>>  2 files changed, 108 insertions(+)
>>
>> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
>> index 657ff4ab20b..2b1d3af34f0 100644
>> --- a/target/arm/cpu.h
>> +++ b/target/arm/cpu.h
>> @@ -843,6 +843,21 @@ struct ARMELChangeHook {
>>      QLIST_ENTRY(ARMELChangeHook) node;
>>  };
>>
>> +typedef enum {
>> +    ToleranceNotOnBothEnds,
>> +    ToleranceDiffInMask,
>> +    ToleranceFieldLT,
>> +    ToleranceFieldGT,
>> +} ARMCPUCPREGMigToleranceType;
>> +
>> +typedef struct ARMCPUCPREGMigTolerance {
>> +    uint64_t kvmidx;
>> +    uint64_t mask;
>> +    uint64_t value;
>> +    ARMCPUCPREGMigToleranceType type;
>> +    QLIST_ENTRY(ARMCPUCPREGMigTolerance) node;
>> +} ARMCPUCPREGMigTolerance;
> I don't think we need the "CPU" part of these type names. How about
>
> ARMCPRegMigToleranceType
> ARMCPRegMigTolerance
>
> ? That would match the prefix of the existing ARMCPRegInfo,
> ARMCPRegUserSpaceInfo types.
>
>> +
>>  /* These values map onto the return values for
>>   * QEMU_PSCI_0_2_FN_AFFINITY_INFO */
>>  typedef enum ARMPSCIState {
>> @@ -1139,6 +1154,7 @@ struct ArchCPU {
>>
>>      QLIST_HEAD(, ARMELChangeHook) pre_el_change_hooks;
>>      QLIST_HEAD(, ARMELChangeHook) el_change_hooks;
>> +    QLIST_HEAD(, ARMCPUCPREGMigTolerance) cpreg_mig_tolerances;
>>
>>      int32_t node_id; /* NUMA node this CPU belongs to */
>>
>> @@ -2632,6 +2648,23 @@ void arm_register_pre_el_change_hook(ARMCPU *cpu, ARMELChangeHookFn *hook,
>>  void arm_register_el_change_hook(ARMCPU *cpu, ARMELChangeHookFn *hook, void
>>          *opaque);
>>
>> +/**
>> + * arm_register_cpreg_mig_tolerance:
>> + * Register a migration tolerance wrt one given cpreg identified by its
>> + * @kvmidx. Only one tolerance can be registered by kvm reg idx.
> We should say "Calling this function twice for the same @kvmidx
> is a programming error and will cause an assertion failure."
>
>> + */
> Could we expand this doc comment to describe what the different kinds of
> tolerance we can register are? We mention them briefly in the commit
> message but I think that ought to be described here, including what the
> "mask" and "value" arguments to this function are for.
>
>> +void arm_register_cpreg_mig_tolerance(ARMCPU *cpu, uint64_t kvmidx,
>> +                                      uint64_t mask, uint64_t value,
>> +                                      ARMCPUCPREGMigToleranceType type);
>> +
>> +/**
>> + * arm_cpu_match_cpreg_mig_tolerance:
>> + * Check whether a tolerance of type @type exists for a given @kvmidx
>> + * and the tolerance criterion is satified
> "satisfied"
>
>> + */
>> +bool arm_cpu_match_cpreg_mig_tolerance(ARMCPU *cpu, uint64_t kvmidx,
>> +                                       uint64_t vmstate_value, uint64_t local_value,
>> +                                       ARMCPUCPREGMigToleranceType type);
>>  /**
>>   * arm_rebuild_hflags:
>>   * Rebuild the cached TBFLAGS for arbitrary changed processor state.
>> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
>> index 7e3e84b4bbb..79e328c2888 100644
>> --- a/target/arm/cpu.c
>> +++ b/target/arm/cpu.c
>> @@ -181,6 +181,75 @@ void arm_register_el_change_hook(ARMCPU *cpu, ARMELChangeHookFn *hook,
>>      QLIST_INSERT_HEAD(&cpu->el_change_hooks, entry, node);
>>  }
>>
>> +void arm_register_cpreg_mig_tolerance(ARMCPU *cpu, uint64_t kvmidx,
>> +                                      uint64_t mask, uint64_t value,
>> +                                      ARMCPUCPREGMigToleranceType type)
>> +{
>> +    ARMCPUCPREGMigTolerance *t, *entry;
>> +
>> +    /* make sure the kvmidx has not tolerance already registered */
>> +    QLIST_FOREACH(t, &cpu->cpreg_mig_tolerances, node) {
>> +        if (t->kvmidx == kvmidx) {
>> +            g_assert_not_reached();
>> +        }
>     assert(kvmidx != t->kvm_idx);
>
> is simpler (but see below).
>
>> +    }
>> +    entry = g_new0(ARMCPUCPREGMigTolerance, 1);
>> +
>> +    entry->kvmidx = kvmidx;
>> +    entry->mask = mask;
>> +    entry->value = value;
>> +    entry->type = type;
>> +
>> +    QLIST_INSERT_HEAD(&cpu->cpreg_mig_tolerances, entry, node);
>> +}
>> +
>> +bool arm_cpu_match_cpreg_mig_tolerance(ARMCPU *cpu, uint64_t kvmidx,
>> +                                       uint64_t vmstate_value, uint64_t local_value,
>> +                                       ARMCPUCPREGMigToleranceType type)
>> +{
>> +    ARMCPUCPREGMigTolerance *t;
>> +    uint64_t diff, diff_outside_mask, field;
>> +    bool found = false;
>> +
>> +    QLIST_FOREACH(t, &cpu->cpreg_mig_tolerances, node) {
>> +        if (t->kvmidx == kvmidx && t->type == type)  {
>> +            found = true;
>> +            break;
>> +        }
>> +    }
>> +    if (!found) {
>> +        return false;
>> +    }
> How about we have a function
>
> static ARMCPUCPRegMigTolerance *find_mig_tolerance(ARMCPU *cpu, uint64_t kvmidx)
> {
>     ARMCPUCPREGMigTolerance *t;
>     QLIST_FOREACH(t, &cpu->cpreg_mig_tolerances, node) {
>         if (t->kvmidx == kvmidx)  {
>             return t;
>         }
>     }
>     return NULL;
> }
>
> Then in arm_register_cpreg_mig_tolerance() we can write
>    assert(!find_mig_tolerance(cpu, kvmidx);
>
> and in arm_cpu_match_cpreg_mig_tolerance() we can write
>    ARMCPUCPREGMigTolerance *t = find_mig_tolerance(cpu, kvmidx);
>
>    if (!t || t->type != type) {
>        return false;
>    }
>
>
>
>> +
>> +    /* we found one tolerance woth @type associated to the @kvmidx */
> "with" (but you might consider that with the naming of the function
> above, that makes this comment redundant)

Took into account all your comments. Thanks!

Eric
>
>> +
>> +    if (type == ToleranceNotOnBothEnds) {
>> +        return true;
>> +    }
>> +
>> +    /* Need to check the mask */
>> +    diff = vmstate_value ^ local_value;
>> +    diff_outside_mask = diff & ~t->mask;
>> +
>> +    if (diff_outside_mask) {
>> +        /* there are differences outside of the mask */
>> +        return false;
>> +    }
>> +    if (type == ToleranceDiffInMask) {
>> +        /* differences only in the field, tolerance matched */
>> +        return true;
>> +    }
>> +    /* need to compare field value against authorized ones */
>> +    field = vmstate_value & t->mask;
>> +    if (type == ToleranceFieldLT && (field < t->value)) {
>> +        return true;
>> +    }
>> +    if (type == ToleranceFieldGT && (field > t->value)) {
>> +        return true;
>> +    }
>> +    return false;
>> +}
>> +
>>  static void cp_reg_reset(gpointer key, gpointer value, gpointer opaque)
>>  {
>>      /* Reset a single ARMCPRegInfo register */
>> @@ -1106,6 +1175,7 @@ static void arm_cpu_initfn(Object *obj)
>>
>>      QLIST_INIT(&cpu->pre_el_change_hooks);
>>      QLIST_INIT(&cpu->el_change_hooks);
>> +    QLIST_INIT(&cpu->cpreg_mig_tolerances);
>>
>>  #ifdef CONFIG_USER_ONLY
>>  # ifdef TARGET_AARCH64
>> @@ -1550,6 +1620,7 @@ static void arm_cpu_finalizefn(Object *obj)
>>  {
>>      ARMCPU *cpu = ARM_CPU(obj);
>>      ARMELChangeHook *hook, *next;
>> +    ARMCPUCPREGMigTolerance *t, *n;
>>
>>      g_hash_table_destroy(cpu->cp_regs);
>>
>> @@ -1561,6 +1632,10 @@ static void arm_cpu_finalizefn(Object *obj)
>>          QLIST_REMOVE(hook, node);
>>          g_free(hook);
>>      }
>> +    QLIST_FOREACH_SAFE(t, &cpu->cpreg_mig_tolerances, node, n) {
>> +        QLIST_REMOVE(t, node);
>> +        g_free(t);
>> +    }
>>  #ifndef CONFIG_USER_ONLY
>>      if (cpu->pmu_timer) {
>>          timer_free(cpu->pmu_timer);
>> --
>> 2.53.0
> thanks
> -- PMM
>


