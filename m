Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5644AF01829
	for <qemu-arm@archiver.kernel.org>; Fri,  6 Mar 2026 11:22:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vyTGc-00057b-2M; Fri, 06 Mar 2026 06:22:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vyTGa-00057E-H1
 for qemu-arm@nongnu.org; Fri, 06 Mar 2026 06:22:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vyTGY-0007rZ-KM
 for qemu-arm@nongnu.org; Fri, 06 Mar 2026 06:22:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772796164;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K5AdUkg3LCkbOmcqvxqODsNWKpYTyk9eDnjuhRRoOwc=;
 b=iQA38iNmdTkQ8757Wj5ERQZdGLX2+foOtNF14RhPst86KGiIHdQytbnMQB0yjIz2mLsEcI
 pI3kYMCf2l5PA07K3QYQHOw/Zo0+PS7efFdISTmcZS5SgcxRmMOHKCRN7u3k2JZ3tA2TIX
 VPTkDjhd/iJxldotR6rADVpU7swjQ7c=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-642-hTbN2p1wOMGIISwkECnzIA-1; Fri, 06 Mar 2026 06:22:43 -0500
X-MC-Unique: hTbN2p1wOMGIISwkECnzIA-1
X-Mimecast-MFC-AGG-ID: hTbN2p1wOMGIISwkECnzIA_1772796162
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-483786a09b1so92389475e9.3
 for <qemu-arm@nongnu.org>; Fri, 06 Mar 2026 03:22:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772796162; x=1773400962;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K5AdUkg3LCkbOmcqvxqODsNWKpYTyk9eDnjuhRRoOwc=;
 b=siuzNYQFrr+X6OQMxpMk4UwowHNYWp9RJfoJZdKAByV/XJmkK/Qivs6gpD62jt/6G4
 JJIurA+xsN80cCsHZnd1dv/ikdiNY+OTEt8oeIDfmmi6MwWSGEDU7j6l52ltCF8sYaeJ
 cPdpSyaMOmsOYENjywTQeRsX/QgfptSSEMRbEWm7vXf/ZerQvBmHXkPDqEHGzbiExmbP
 8swAsqaoMw+BHt/DO1RDmM5kx5VRDpjorBQe+vuyc7oxAOqES5Pni6wOmrmLyz/jRLlI
 wXbcvKxEt6dhwI6wxU8ssmy4pDk4XDW+g0+5eGa1CVE5t1NmZ5Y2Y3/7eqxV9Hd9vRrJ
 HzYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6OsGHVOujvqWuKfIc4PQyhVy/5CmBz0g+krsPo4Cvv69JL5zLPoWHrY0ls6dqQadGwbzo4b8kag==@nongnu.org
X-Gm-Message-State: AOJu0YzY1c0TWtMfE4AcO7O+0p+epf1Zcd5BIaQ8yNzad51qE6qu4dlA
 pMOvHJNkpmiRr3GwMyKa7noudLbAh8+F4WfLYnqYxTMkKymrAeS6b5zmO72tSPJlBGQg9z7TFPB
 lrLn6n2oWUDX3uZvmLixIn4yee2bCWM9V6AGnYiurV82Ikg2C/2J5Eg==
X-Gm-Gg: ATEYQzyiQR+bJpR37RuJZ1ZnsTH5JqnmyzL5TwaNGaRq2dy3a1qMUckj58c5dVSVjHO
 v9n+9LQRHGeGPOYxPueNVeUpb2GdGQ0yQbkCe4NfXcUw1OGezlVa59wvLEb8JyfTbOZ8Xpr3Pi3
 8QBsgD62meido5aIQioCNooTeCzu2YR9ZrOuwrYpgXmSO5AN8jUQZ+q2SlpvDnsW/EiZoZ66pyV
 4hpJotHF/Y+PF0egHoaJr4+Cy1tiaJtfvlUiBZvdHFTS+zyNWUwvVVhE9Bz8aYjjGOKSfcXlOap
 Qv3E2gPOEP6G4vacgo6W2CeR/lctTfqwt/SuBBpnMTrIRyp2A4bMKJtx877yl17+k25brKf/nFj
 aNBzgfsHTrKHnnFjUmcusuEdvQ3GSjkZ4L8BZ8UCPoq33L2UzomEnZpkN7ZO3ODorgu1Mog==
X-Received: by 2002:a05:600c:45d1:b0:480:4a90:1b06 with SMTP id
 5b1f17b1804b1-48526978962mr26933795e9.34.1772796162349; 
 Fri, 06 Mar 2026 03:22:42 -0800 (PST)
X-Received: by 2002:a05:600c:45d1:b0:480:4a90:1b06 with SMTP id
 5b1f17b1804b1-48526978962mr26933085e9.34.1772796161685; 
 Fri, 06 Mar 2026 03:22:41 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485237ec557sm25393575e9.2.2026.03.06.03.22.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Mar 2026 03:22:40 -0800 (PST)
Message-ID: <36cd0b42-adb8-4aed-8c91-afe4a37ce0ac@redhat.com>
Date: Fri, 6 Mar 2026 12:22:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/6] target/arm/cpu: Introduce the infrastructure for
 cpreg migration tolerances
To: Sebastian Ott <sebott@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, cohuck@redhat.com, peterx@redhat.com,
 philmd@linaro.org, alex.bennee@linaro.org
References: <20260304102249.1963784-1-eric.auger@redhat.com>
 <20260304102249.1963784-2-eric.auger@redhat.com>
 <a1dc92c5-2f13-8951-adf7-48d46992bf83@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <a1dc92c5-2f13-8951-adf7-48d46992bf83@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5CFUc2I_21_W7ESptGhb_LdhXt2wtkGgVhpdcDjDPyI_1772796162
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.892, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.622,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Hi Sebastian,

On 3/6/26 11:28 AM, Sebastian Ott wrote:
> On Wed, 4 Mar 2026, Eric Auger wrote:
>> We introduce a datatype for a tolerance with respect to a given
>> cpreg migration issue. The tolerance applies to a given cpreg kvm index,
>> and can be of different types:
>> - ToleranceNotOnBothEnds (cpreg index is allowed to be only on one end)
>                                                              ^
>                                                        available/present?
>
>> - ToleranceDiffInMask (value differences are allowed only within a mask)
>> - ToleranceFieldLT (incoming field value must be less than a given
>> value)
>> - ToleranceFieldGT (incoming field value must be greater than a given
>> value)
>>
>> A QLIST of such tolerances can be populated using a new helper:
>> arm_register_cpreg_mig_tolerance() and arm_cpu_cpreg_has_mig_tolerance()
>> allows to check whether a tolerance exists for a given kvm index.
>>
>> callers for those helpers will be introduced in subsequent patches.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> ---
>> target/arm/cpu.h | 32 +++++++++++++++++++++
>> target/arm/cpu.c | 75 ++++++++++++++++++++++++++++++++++++++++++++++++
>> 2 files changed, 107 insertions(+)
>>
>> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
>> index 657ff4ab20b..9dcc838f611 100644
>> --- a/target/arm/cpu.h
>> +++ b/target/arm/cpu.h
>> @@ -843,6 +843,21 @@ struct ARMELChangeHook {
>>     QLIST_ENTRY(ARMELChangeHook) node;
>> };
>>
>> +typedef enum {
>> +    ToleranceNotOnBothEnds,
>> +    ToleranceDiffInMask,
>> +    ToleranceFieldLT,
>> +    ToleranceFieldGT,
>> +} ARMCPUCPREGMigToleranceType;
>> +
>> +typedef struct ARMCPUCPREGMigTolerance {
>> +    uint64_t kvmidx;
>> +    uint64_t mask;
>> +    uint64_t value;
>> +    ARMCPUCPREGMigToleranceType type;
>> +    QLIST_ENTRY(ARMCPUCPREGMigTolerance) node;
>> +} ARMCPUCPREGMigTolerance;
>> +
>> /* These values map onto the return values for
>>  * QEMU_PSCI_0_2_FN_AFFINITY_INFO */
>> typedef enum ARMPSCIState {
>> @@ -1139,6 +1154,7 @@ struct ArchCPU {
>>
>>     QLIST_HEAD(, ARMELChangeHook) pre_el_change_hooks;
>>     QLIST_HEAD(, ARMELChangeHook) el_change_hooks;
>> +    QLIST_HEAD(, ARMCPUCPREGMigTolerance) cpreg_mig_tolerances;
>>
>>     int32_t node_id; /* NUMA node this CPU belongs to */
>>
>> @@ -2632,6 +2648,22 @@ void arm_register_pre_el_change_hook(ARMCPU
>> *cpu, ARMELChangeHookFn *hook,
>> void arm_register_el_change_hook(ARMCPU *cpu, ARMELChangeHookFn
>> *hook, void
>>         *opaque);
>>
>> +/**
>> + * arm_register_cpreg_mig_tolerance:
>> + * Register a migration tolerance wrt one given cpreg identified by its
>> + * @kvmidx. Only one tolerance can be registered by kvm reg idx.
>> + */
>> +void arm_register_cpreg_mig_tolerance(ARMCPU *cpu, uint64_t kvmidx,
>> +                                      uint64_t mask, uint64_t value,
>> +                                      ARMCPUCPREGMigToleranceType
>> type);
>> +
>> +/**
>> + * arm_cpu_cpreg_has_mig_tolerance:
>> + * Check whether a tolerance of type @type exists for a given @kvmidx
>> + */
>
> This function does more than the name and description suggests - it not
> only checks if the tolerance exists but also if it applies..
>
> arm_cpu_cpreg_mig_tolerated ? 
Well it is supposed to really check a tolerance exists (and thus
applies), of a given type, for a given kvmidx.
But I admit the check of ->type versus type is missing below. 
>
>> +bool arm_cpu_cpreg_has_mig_tolerance(ARMCPU *cpu, uint64_t kvmidx,
>> +                                     uint64_t vmstate_value,
>> uint64_t local_value,
>> +                                     ARMCPUCPREGMigToleranceType type);
>> /**
>>  * arm_rebuild_hflags:
>>  * Rebuild the cached TBFLAGS for arbitrary changed processor state.
>> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
>> index 7e3e84b4bbb..1c499d1b15c 100644
>> --- a/target/arm/cpu.c
>> +++ b/target/arm/cpu.c
>> @@ -181,6 +181,75 @@ void arm_register_el_change_hook(ARMCPU *cpu,
>> ARMELChangeHookFn *hook,
>>     QLIST_INSERT_HEAD(&cpu->el_change_hooks, entry, node);
>> }
>>
>> +void arm_register_cpreg_mig_tolerance(ARMCPU *cpu, uint64_t kvmidx,
>> +                                      uint64_t mask, uint64_t value,
>> +                                      ARMCPUCPREGMigToleranceType type)
>> +{
>> +    ARMCPUCPREGMigTolerance *t, *entry;
>> +
>> +    /* make sure the kvmidx has not tolerance already registered */
>> +    QLIST_FOREACH(t, &cpu->cpreg_mig_tolerances, node) {
>> +        if (t->kvmidx == kvmidx) {
>> +            g_assert_not_reached();
>> +        }
>> +    }
>> +    entry = g_new0(ARMCPUCPREGMigTolerance, 1);
>> +
>> +    entry->kvmidx = kvmidx;
>> +    entry->mask = mask;
>> +    entry->value = value;
>> +    entry->type = type;
>> +
>> +    QLIST_INSERT_HEAD(&cpu->cpreg_mig_tolerances, entry, node);
>> +}
>> +
>> +bool arm_cpu_cpreg_has_mig_tolerance(ARMCPU *cpu, uint64_t kvmidx,
>> +                                     uint64_t vmstate_value,
>> uint64_t local_value,
>> +                                     ARMCPUCPREGMigToleranceType type)
>> +{
>> +    ARMCPUCPREGMigTolerance *t;
>> +    uint64_t diff, diff_outside_mask, field;
>> +    bool found = false;
>> +
>> +    QLIST_FOREACH(t, &cpu->cpreg_mig_tolerances, node) {
>> +        if (t->kvmidx == kvmidx)  {
>> +            found = true;
>> +            break;
>> +        }
>> +    }
>> +    if (!found) {
>> +        return false;
>> +    }
>> +
>> +    /* we found one tolerance associated to the @kvmidx */
>> +
>> +    if (type == ToleranceNotOnBothEnds) {
>
> This should use t->type and type can be removed as an argument. 
Actually if we found a tolerance registered for this regidx, I should
test the @type matches the registered tolerance once. This is missing.
>
>> +        return true;
>> +    }
>> +
>> +    /* Need to check mask */
>> +    diff = vmstate_value ^ local_value;
>> +    diff_outside_mask = diff & ~t->mask;
>> +
>> +    if (diff_outside_mask) {
>> +        /* there are differences outside of the mask */
>> +        return false;
>> +    }
>> +    if (type == ToleranceDiffInMask) {
>> +        /* differences only in the field, tolerance granted */
>> +        return true;
>> +    }
>> +    /* need to compare field value against authorized ones */
>> +    field = vmstate_value & t->mask;
>> +    if (type == ToleranceFieldLT && (field < t->value)) {
>> +        return true;
>> +    }
>> +    if (type == ToleranceFieldGT && (field > t->value)) {
>> +        return true;
>> +    }
>
> Ah, so this is only compared with a static value not with the
> local_value.
> Would there be a need for a more sophisticated check than
> ToleranceDiffInMask?
>
> We could instead of having the type per ARMCPUCPREGMigTolerance
> register a
> callback that makes the decision. The 4 types would be 4 pre-defined
> callbacks and if a user needs something more sophisticated it can create
> a custom callback. 
The goal is to tolerate some differences in a fields versus a given
static value. For instance if we know a field value was corrected in the
kernel.
This we have no example of such usage, it is a bit difficult to provide
a comprehensive infra. Maybe I should even remove that code until we get
the need.
>
> But yea, that's just an idea - not sure if we'll ever need something like
> this..
>
>> +    return false;
>> +}
>> +
>> static void cp_reg_reset(gpointer key, gpointer value, gpointer opaque)
>> {
>>     /* Reset a single ARMCPRegInfo register */
>> @@ -1106,6 +1175,7 @@ static void arm_cpu_initfn(Object *obj)
>>
>>     QLIST_INIT(&cpu->pre_el_change_hooks);
>>     QLIST_INIT(&cpu->el_change_hooks);
>> +    QLIST_INIT(&cpu->cpreg_mig_tolerances);
>>
>> #ifdef CONFIG_USER_ONLY
>> # ifdef TARGET_AARCH64
>> @@ -1550,6 +1620,7 @@ static void arm_cpu_finalizefn(Object *obj)
>> {
>>     ARMCPU *cpu = ARM_CPU(obj);
>>     ARMELChangeHook *hook, *next;
>> +    ARMCPUCPREGMigTolerance *t, *n;
>>
>>     g_hash_table_destroy(cpu->cp_regs);
>>
>> @@ -1561,6 +1632,10 @@ static void arm_cpu_finalizefn(Object *obj)
>>         QLIST_REMOVE(hook, node);
>>         g_free(hook);
>>     }
>> +    QLIST_FOREACH_SAFE(t, &cpu->cpreg_mig_tolerances, node, n) {
>> +        QLIST_REMOVE(t, node);
>> +        g_free(t);
>> +    }
>> #ifndef CONFIG_USER_ONLY
>>     if (cpu->pmu_timer) {
>>         timer_free(cpu->pmu_timer);
>> -- 
>> 2.53.0
>>
>>
>
> Reviewed-by: Sebastian Ott <sebott@redhat.com>
>
Thank you for the review

Eric


