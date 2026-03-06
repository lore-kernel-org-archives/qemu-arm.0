Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2200FF01825
	for <qemu-arm@archiver.kernel.org>; Fri,  6 Mar 2026 10:28:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vySQ9-00081e-H8; Fri, 06 Mar 2026 05:28:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1vySQ7-00081N-Nt
 for qemu-arm@nongnu.org; Fri, 06 Mar 2026 05:28:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1vySQ5-0004Jb-HB
 for qemu-arm@nongnu.org; Fri, 06 Mar 2026 05:28:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772792911;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+ZOAga/LDDIH+qaVcp9DA4WZsSjg1Eeh9+rML1m1WBc=;
 b=aaWuTZjyjVR95rcWKcWgj8MusjIYssxpJ7J5F1Gb8FuJjr3O4MMRq+d0yGXn/3Jj2igFUo
 n19tLHzFabcoifO+TUXkb3LWCk05NT9c46NJCHQZxTUAdOZumTVVde28q1816CN27hURWF
 /MMLjK75asL62v8FGQM88R9RcO36qsw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-193-JQHj545UNz-R6_mueLFx3w-1; Fri, 06 Mar 2026 05:28:30 -0500
X-MC-Unique: JQHj545UNz-R6_mueLFx3w-1
X-Mimecast-MFC-AGG-ID: JQHj545UNz-R6_mueLFx3w_1772792909
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4837cee2e9bso72193585e9.3
 for <qemu-arm@nongnu.org>; Fri, 06 Mar 2026 02:28:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772792909; x=1773397709;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
 :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+ZOAga/LDDIH+qaVcp9DA4WZsSjg1Eeh9+rML1m1WBc=;
 b=hhaw+qx2DvVhY5oqS4exk/CkOLcDk7QzFCZKYio3Pgr8T7e1wjtn4zYPYbG7p97K74
 qVA99ja/bg0NLp96zo3EdNKHZQr238mCDOH6nQZ21DKTksigKtRKDjXrU0/jZpOPfxmb
 tlVQEJLWAtseRaAFgr9kFIJgC5z6GTK2DL1sncfOD8iY+PXZrTg8bS+WnnGGgkqnevkH
 AageVJDC2hgJJ/4jC+QZfhuGQfZuu61D6WmK8RI+kHSmWPtN9X17EtAPQS3yOTAp5Osx
 HPXZwtreNVKrG2omIdWPc5SGm7G6ZyEOMMbT2H9CISVsScPhUuU+sZ61dO08USktPIEs
 kgcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIqS6BRQ0Ov7CZzA+T2zhR7uIZdBikNwrkeuKrC0ge4JfpOIKPDW4k4J+ugj8+YaNvl+C/2SgNmA==@nongnu.org
X-Gm-Message-State: AOJu0YwUmK9Uk7SF4vi6pK5dIn1K/WTfUGIZ+iy40eaublzC+VWLSMAv
 NzeoTqRrQc7fF6RiuDfKv05z6GbeeEj4JY7BT2YFo+fChhbjN72Fmzt6sPL3PiyH0lePE8Cjrbr
 nyYywJ4mhljwKWm87B55QK3PfBQQm8bS714cU3z7tEf5YzOUHaMqXNA==
X-Gm-Gg: ATEYQzwhNRE9W7nd4vYUObALeAX0ZOCTxrX4BDP20mRlUbHpj/ewZygGCTGGx/0EL2V
 /MwJ+s2fqxVdiOvlOjldPdEhE0U2emCkSjeB/jsECkWdPNFt+ji72PngclVhBeUn1LBE0pxdAHE
 caAE5YLv03iZGWE3GK5NjAOsX0AwHtMngySyeN4IlcKhw+ASTQ3NX9CjGmcl3EhgsqVQKHDF4ON
 stWjAbPaPeZF8G0eDXrT1i8yZnm44jMFDTAB/BWm7HutS8eOIIfYpeMl3zz3Di5D174dqZFPX+H
 tAtXGrTe3JtFIRwSxqwRwr23srZyjB4J7CbQuOFi3UAfCZGoTpcbaQFd8NXPcn9FHGSv+d6Z0IK
 1iQC0QnfKFBgLP2RDVheR8EGRs/ta8TCPvElDIchtdOdgJrNFlXLPWw+bY44wATZ6qzC7
X-Received: by 2002:a05:600c:1e88:b0:47e:e952:86c9 with SMTP id
 5b1f17b1804b1-485268bd528mr29056695e9.0.1772792909201; 
 Fri, 06 Mar 2026 02:28:29 -0800 (PST)
X-Received: by 2002:a05:600c:1e88:b0:47e:e952:86c9 with SMTP id
 5b1f17b1804b1-485268bd528mr29056235e9.0.1772792908707; 
 Fri, 06 Mar 2026 02:28:28 -0800 (PST)
Received: from rh (p200300f6af4a490003d6f56739ca055c.dip0.t-ipconnect.de.
 [2003:f6:af4a:4900:3d6:f567:39ca:55c])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485276b09casm38314515e9.11.2026.03.06.02.28.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 02:28:28 -0800 (PST)
Date: Fri, 6 Mar 2026 11:28:27 +0100 (CET)
From: Sebastian Ott <sebott@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 peter.maydell@linaro.org, cohuck@redhat.com, peterx@redhat.com, 
 philmd@linaro.org, alex.bennee@linaro.org
Subject: Re: [PATCH v8 1/6] target/arm/cpu: Introduce the infrastructure for
 cpreg migration tolerances
In-Reply-To: <20260304102249.1963784-2-eric.auger@redhat.com>
Message-ID: <a1dc92c5-2f13-8951-adf7-48d46992bf83@redhat.com>
References: <20260304102249.1963784-1-eric.auger@redhat.com>
 <20260304102249.1963784-2-eric.auger@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DjGlnlQc3IGZa3yyclqeQv3H3NWltPjg-6i0nB4AyAk_1772792909
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; format=flowed; charset=US-ASCII
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sebott@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Wed, 4 Mar 2026, Eric Auger wrote:
> We introduce a datatype for a tolerance with respect to a given
> cpreg migration issue. The tolerance applies to a given cpreg kvm index,
> and can be of different types:
> - ToleranceNotOnBothEnds (cpreg index is allowed to be only on one end)
                                                              ^
                                                        available/present?

> - ToleranceDiffInMask (value differences are allowed only within a mask)
> - ToleranceFieldLT (incoming field value must be less than a given value)
> - ToleranceFieldGT (incoming field value must be greater than a given value)
>
> A QLIST of such tolerances can be populated using a new helper:
> arm_register_cpreg_mig_tolerance() and arm_cpu_cpreg_has_mig_tolerance()
> allows to check whether a tolerance exists for a given kvm index.
>
> callers for those helpers will be introduced in subsequent patches.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
> target/arm/cpu.h | 32 +++++++++++++++++++++
> target/arm/cpu.c | 75 ++++++++++++++++++++++++++++++++++++++++++++++++
> 2 files changed, 107 insertions(+)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 657ff4ab20b..9dcc838f611 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -843,6 +843,21 @@ struct ARMELChangeHook {
>     QLIST_ENTRY(ARMELChangeHook) node;
> };
>
> +typedef enum {
> +    ToleranceNotOnBothEnds,
> +    ToleranceDiffInMask,
> +    ToleranceFieldLT,
> +    ToleranceFieldGT,
> +} ARMCPUCPREGMigToleranceType;
> +
> +typedef struct ARMCPUCPREGMigTolerance {
> +    uint64_t kvmidx;
> +    uint64_t mask;
> +    uint64_t value;
> +    ARMCPUCPREGMigToleranceType type;
> +    QLIST_ENTRY(ARMCPUCPREGMigTolerance) node;
> +} ARMCPUCPREGMigTolerance;
> +
> /* These values map onto the return values for
>  * QEMU_PSCI_0_2_FN_AFFINITY_INFO */
> typedef enum ARMPSCIState {
> @@ -1139,6 +1154,7 @@ struct ArchCPU {
>
>     QLIST_HEAD(, ARMELChangeHook) pre_el_change_hooks;
>     QLIST_HEAD(, ARMELChangeHook) el_change_hooks;
> +    QLIST_HEAD(, ARMCPUCPREGMigTolerance) cpreg_mig_tolerances;
>
>     int32_t node_id; /* NUMA node this CPU belongs to */
>
> @@ -2632,6 +2648,22 @@ void arm_register_pre_el_change_hook(ARMCPU *cpu, ARMELChangeHookFn *hook,
> void arm_register_el_change_hook(ARMCPU *cpu, ARMELChangeHookFn *hook, void
>         *opaque);
>
> +/**
> + * arm_register_cpreg_mig_tolerance:
> + * Register a migration tolerance wrt one given cpreg identified by its
> + * @kvmidx. Only one tolerance can be registered by kvm reg idx.
> + */
> +void arm_register_cpreg_mig_tolerance(ARMCPU *cpu, uint64_t kvmidx,
> +                                      uint64_t mask, uint64_t value,
> +                                      ARMCPUCPREGMigToleranceType type);
> +
> +/**
> + * arm_cpu_cpreg_has_mig_tolerance:
> + * Check whether a tolerance of type @type exists for a given @kvmidx
> + */

This function does more than the name and description suggests - it not
only checks if the tolerance exists but also if it applies..

arm_cpu_cpreg_mig_tolerated ?

> +bool arm_cpu_cpreg_has_mig_tolerance(ARMCPU *cpu, uint64_t kvmidx,
> +                                     uint64_t vmstate_value, uint64_t local_value,
> +                                     ARMCPUCPREGMigToleranceType type);
> /**
>  * arm_rebuild_hflags:
>  * Rebuild the cached TBFLAGS for arbitrary changed processor state.
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 7e3e84b4bbb..1c499d1b15c 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -181,6 +181,75 @@ void arm_register_el_change_hook(ARMCPU *cpu, ARMELChangeHookFn *hook,
>     QLIST_INSERT_HEAD(&cpu->el_change_hooks, entry, node);
> }
>
> +void arm_register_cpreg_mig_tolerance(ARMCPU *cpu, uint64_t kvmidx,
> +                                      uint64_t mask, uint64_t value,
> +                                      ARMCPUCPREGMigToleranceType type)
> +{
> +    ARMCPUCPREGMigTolerance *t, *entry;
> +
> +    /* make sure the kvmidx has not tolerance already registered */
> +    QLIST_FOREACH(t, &cpu->cpreg_mig_tolerances, node) {
> +        if (t->kvmidx == kvmidx) {
> +            g_assert_not_reached();
> +        }
> +    }
> +    entry = g_new0(ARMCPUCPREGMigTolerance, 1);
> +
> +    entry->kvmidx = kvmidx;
> +    entry->mask = mask;
> +    entry->value = value;
> +    entry->type = type;
> +
> +    QLIST_INSERT_HEAD(&cpu->cpreg_mig_tolerances, entry, node);
> +}
> +
> +bool arm_cpu_cpreg_has_mig_tolerance(ARMCPU *cpu, uint64_t kvmidx,
> +                                     uint64_t vmstate_value, uint64_t local_value,
> +                                     ARMCPUCPREGMigToleranceType type)
> +{
> +    ARMCPUCPREGMigTolerance *t;
> +    uint64_t diff, diff_outside_mask, field;
> +    bool found = false;
> +
> +    QLIST_FOREACH(t, &cpu->cpreg_mig_tolerances, node) {
> +        if (t->kvmidx == kvmidx)  {
> +            found = true;
> +            break;
> +        }
> +    }
> +    if (!found) {
> +        return false;
> +    }
> +
> +    /* we found one tolerance associated to the @kvmidx */
> +
> +    if (type == ToleranceNotOnBothEnds) {

This should use t->type and type can be removed as an argument.

> +        return true;
> +    }
> +
> +    /* Need to check mask */
> +    diff = vmstate_value ^ local_value;
> +    diff_outside_mask = diff & ~t->mask;
> +
> +    if (diff_outside_mask) {
> +        /* there are differences outside of the mask */
> +        return false;
> +    }
> +    if (type == ToleranceDiffInMask) {
> +        /* differences only in the field, tolerance granted */
> +        return true;
> +    }
> +    /* need to compare field value against authorized ones */
> +    field = vmstate_value & t->mask;
> +    if (type == ToleranceFieldLT && (field < t->value)) {
> +        return true;
> +    }
> +    if (type == ToleranceFieldGT && (field > t->value)) {
> +        return true;
> +    }

Ah, so this is only compared with a static value not with the local_value.
Would there be a need for a more sophisticated check than
ToleranceDiffInMask?

We could instead of having the type per ARMCPUCPREGMigTolerance register a
callback that makes the decision. The 4 types would be 4 pre-defined
callbacks and if a user needs something more sophisticated it can create
a custom callback.

But yea, that's just an idea - not sure if we'll ever need something like
this..

> +    return false;
> +}
> +
> static void cp_reg_reset(gpointer key, gpointer value, gpointer opaque)
> {
>     /* Reset a single ARMCPRegInfo register */
> @@ -1106,6 +1175,7 @@ static void arm_cpu_initfn(Object *obj)
>
>     QLIST_INIT(&cpu->pre_el_change_hooks);
>     QLIST_INIT(&cpu->el_change_hooks);
> +    QLIST_INIT(&cpu->cpreg_mig_tolerances);
>
> #ifdef CONFIG_USER_ONLY
> # ifdef TARGET_AARCH64
> @@ -1550,6 +1620,7 @@ static void arm_cpu_finalizefn(Object *obj)
> {
>     ARMCPU *cpu = ARM_CPU(obj);
>     ARMELChangeHook *hook, *next;
> +    ARMCPUCPREGMigTolerance *t, *n;
>
>     g_hash_table_destroy(cpu->cp_regs);
>
> @@ -1561,6 +1632,10 @@ static void arm_cpu_finalizefn(Object *obj)
>         QLIST_REMOVE(hook, node);
>         g_free(hook);
>     }
> +    QLIST_FOREACH_SAFE(t, &cpu->cpreg_mig_tolerances, node, n) {
> +        QLIST_REMOVE(t, node);
> +        g_free(t);
> +    }
> #ifndef CONFIG_USER_ONLY
>     if (cpu->pmu_timer) {
>         timer_free(cpu->pmu_timer);
> -- 
> 2.53.0
>
>

Reviewed-by: Sebastian Ott <sebott@redhat.com>


