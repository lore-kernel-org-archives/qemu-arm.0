Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp313876lfo;
        Thu, 28 Jan 2021 07:24:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw0BnaKzyaFwJl6HhzfWDr+hSsSvw1gtlkAGnnQU5VU3yMffu5+dIFMveT/oknxaVdSW6IH
X-Received: by 2002:a25:5a04:: with SMTP id o4mr24931951ybb.269.1611847460539;
        Thu, 28 Jan 2021 07:24:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611847460; cv=none;
        d=google.com; s=arc-20160816;
        b=YlnhNLmAsf3NuFEZ8C09FwDmbgU6iNeNQugzpoDrmkwPO1IORlTQl0+bc+kznwHfE5
         O6qcrJ8DbVvDNn+B9VwT+8yplgHcTnM5ZVw4Bou/bV0Lral5MX+m7tB3buDBWpPjeXnb
         eZ6YQ/etKSdgkOGTJpMaJmfFCFRXXoRg+d3ghOjODEeaOachISPLINROcNYR2wTVI0MJ
         /ltwTcKNRl1MK725jpPd6Pu/kVVrnToTFMLN2bxGVVeng54sNGyOdedgLjcAaUA1dxi9
         kbg8F8Qge09ZE9/ABk5MhNioDqPRx7odxltazLunwt+yDKr1djCqTDPBieJRbqocGCPf
         fysA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5C784LBgBqv2S0P5V2jlWW5dGwtZ4K4baKv/vb7rCMA=;
        b=tQ/i6vL106ulZoJC9+f4xMRWPvBA7vL/LmLJBpKAXU6pulSp97N3lPDnxHrgGym+oQ
         EcDR0Gh6K7ERlhRQLEtl53OUr1fEyuMaBLN4vFcUSMYBepyjHoCsrs1CAatlchCtl7HW
         zgSkI06fINtnAwV9x9XGmgAUw8I7twF4QhJgFsQTWBBcxn8hIeSFJ3UKvhKc16qd+Nwh
         +9Eo9a86UwSA8qfKofkJGjbG4Y6I41Xitk5y7YvCT8ryezXjaTpZg1VVwtQRXpVjQncd
         u9G6d7SezNeDAazsE621f0hMF4p1mo6IlONLFPUXrb6UAufg8a16jW4WT79G8xZzxoP+
         GmeQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Uubg8lZ+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d186si5764620ybc.401.2021.01.28.07.24.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Jan 2021 07:24:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Uubg8lZ+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l599f-0008GH-UK
	for alex.bennee@linaro.org; Thu, 28 Jan 2021 10:24:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l599W-0008F6-VG
 for qemu-arm@nongnu.org; Thu, 28 Jan 2021 10:24:10 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:45857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l599V-0005qA-Ds
 for qemu-arm@nongnu.org; Thu, 28 Jan 2021 10:24:10 -0500
Received: by mail-ej1-x631.google.com with SMTP id ke15so8295392ejc.12
 for <qemu-arm@nongnu.org>; Thu, 28 Jan 2021 07:24:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5C784LBgBqv2S0P5V2jlWW5dGwtZ4K4baKv/vb7rCMA=;
 b=Uubg8lZ+2DEEJ/wRzLMUq02jgTGZuFuNf9+YueUZlaGqYys1pHiUe5h9VDsVh/0gB/
 vli/yla7zaouh8KXYyKBgL/nxTjT4lr1RqMtvJQukXzeRfcFdnP2PYW5nE6O87UM5i2f
 NL8opuZddYwumAEtFGRvJOgRwKgKikCPG2cfWhxJI5sRlEBfBTM8h7VTvd5dnsP9s+3F
 oeZ5wkVIcW64p3Txw2etYzd83miC4qZFBVInr9z8hJN73/QUfM7w+rdi8NX+us+wLHhA
 KqpoaEvPQqvjpkCsmu57hczOVeLZ48tiqS3RxP/68Vh02GZGgxuZaO414k1VYp2s62IN
 YKkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5C784LBgBqv2S0P5V2jlWW5dGwtZ4K4baKv/vb7rCMA=;
 b=X5EjHRHvRqFQL8BXc+f6rp8HDW1sVrzMd8GYi4D+AFyzrRcoLGTNAZubFTvN7OjzmA
 Fj8sHTE72ol5z7U/EleoVgQFSEqFPKl9h7aszmzJTLrQUum2BdLuQk837QsQ8bQRNcnt
 2b7gVfSRZEyQJhCVqbmIn3CvZkVEcc0LAfG3YBfC6Rnr7XI2JcYxOhrngdzHRRbI011A
 qvj4m1dHiHxgxXjyLuDBfet8j+fdnUK6RPiJK7gwzCWwNJOUdycLb6Q/G+zgpLE8m9rY
 KoRizIJFVr3umBwrHN967LTg3lDVMMvBJybZcc/gcJFzH9t4XUUGrYuX1EZeuKbAh+ny
 zUSQ==
X-Gm-Message-State: AOAM531qqrABscr2xwf3vIR0QCdKzPAoymu0KxHaKcnqV1h+wSyMglpT
 IaSFKdqgALITZzf0tUmLvTTBNbyykGcB8Mi+4Wtvxg==
X-Received: by 2002:a17:906:3603:: with SMTP id
 q3mr11247368ejb.382.1611847447230; 
 Thu, 28 Jan 2021 07:24:07 -0800 (PST)
MIME-Version: 1.0
References: <20210120224444.71840-1-agraf@csgraf.de>
 <20210120224444.71840-4-agraf@csgraf.de>
In-Reply-To: <20210120224444.71840-4-agraf@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jan 2021 15:23:56 +0000
Message-ID: <CAFEAcA8a7R9_H_aG2Pd9n4iic989+QFeOhVArbz1tsQJ2JPtVg@mail.gmail.com>
Subject: Re: [PATCH v6 03/11] hvf: Move common code out
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Collingbourne <pcc@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vQHS7Vx0MH0m

On Wed, 20 Jan 2021 at 22:44, Alexander Graf <agraf@csgraf.de> wrote:
>
> Until now, Hypervisor.framework has only been available on x86_64 systems.
> With Apple Silicon shipping now, it extends its reach to aarch64. To
> prepare for support for multiple architectures, let's move common code out
> into its own accel directory.
>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> Reviewed-by: Roman Bolshakov <r.bolshakov@yadro.com>
> Tested-by: Roman Bolshakov <r.bolshakov@yadro.com>

I was expecting this all to be pretty much pure code-motion,
but it isn't. Examples:

> +static int do_hvf_set_memory(hvf_slot *slot, hv_memory_flags_t flags)
> +{
> +    struct mac_slot *macslot;
> +    hv_return_t ret;
> +
> +    macslot = &mac_slots[slot->slot_id];
> +
> +    if (macslot->present) {
> +        if (macslot->size != slot->size) {
> +            macslot->present = 0;
> +            ret = hv_vm_unmap(macslot->gpa_start, macslot->size);
> +            assert_hvf_ok(ret);
> +        }
> +    }
> +
> +    if (!slot->size) {
> +        return 0;
> +    }
> +
> +    macslot->present = 1;
> +    macslot->gpa_start = slot->start;
> +    macslot->size = slot->size;
> +    ret = hv_vm_map(slot->mem, slot->start, slot->size, flags);

In the old code this line is

-    ret = hv_vm_map((hv_uvaddr_t)slot->mem, slot->start, slot->size, flags);


> +    assert_hvf_ok(ret);
> +    return 0;
> +}


> +static void hvf_set_dirty_tracking(MemoryRegionSection *section, bool on)
> +{
> +    hvf_slot *slot;
> +
> +    slot = hvf_find_overlap_slot(
> +            section->offset_within_address_space,
> +            int128_get64(section->size));
> +
> +    /* protect region against writes; begin tracking it */
> +    if (on) {
> +        slot->flags |= HVF_SLOT_LOG;
> +        hv_vm_protect((uintptr_t)slot->start, (size_t)slot->size,
> +                      HV_MEMORY_READ);

The casts here were different in the old code:

-        hv_vm_protect((hv_gpaddr_t)slot->start, (size_t)slot->size,
-                      HV_MEMORY_READ);

And these changes look like they ought to be in a different patch:

>  void hvf_set_segment(struct CPUState *cpu, struct vmx_segment *vmx_seg,
>                       SegmentCache *qseg, bool is_tr)
>  {
> @@ -437,7 +438,7 @@ int hvf_process_events(CPUState *cpu_state)
>      env->eflags = rreg(cpu_state->hvf_fd, HV_X86_RFLAGS);
>
>      if (cpu_state->interrupt_request & CPU_INTERRUPT_INIT) {
> -        hvf_cpu_synchronize_state(cpu_state);
> +        cpu_synchronize_state(cpu_state);
>          do_cpu_init(cpu);
>      }
>
> @@ -451,12 +452,12 @@ int hvf_process_events(CPUState *cpu_state)
>          cpu_state->halted = 0;
>      }
>      if (cpu_state->interrupt_request & CPU_INTERRUPT_SIPI) {
> -        hvf_cpu_synchronize_state(cpu_state);
> +        cpu_synchronize_state(cpu_state);
>          do_cpu_sipi(cpu);
>      }
>      if (cpu_state->interrupt_request & CPU_INTERRUPT_TPR) {
>          cpu_state->interrupt_request &= ~CPU_INTERRUPT_TPR;
> -        hvf_cpu_synchronize_state(cpu_state);
> +        cpu_synchronize_state(cpu_state);
>          apic_handle_tpr_access_report(cpu->apic_state, env->eip,
>                                        env->tpr_access_type);
>      }

Could you go through and make sure that as much of possible
of this patch is pure "cut from file A and paste into file B",
please? The git diff --color-moved option is really helpful for
this: the aim should be for the patch as much as possible to be
the blues, yellows and purples of "this code just moved" and
as few as possible lines of green/red "this code is deleted
or added". (In some places it might be helpful to split parts
of this change into separate patches, eg if you want to make
a function 'static' when it was unnecessarily global before.)

thanks
-- PMM
