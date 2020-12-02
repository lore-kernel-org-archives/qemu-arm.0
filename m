Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp660991lfb;
        Tue, 1 Dec 2020 16:14:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzK9bdbfp0SyZUAZWVP74W5sFemoaolNKhok0tUFvk0z4jyEV1QKayaOvAcYKIWWeRh5hW3
X-Received: by 2002:a25:3b03:: with SMTP id i3mr8438325yba.276.1606868066419;
        Tue, 01 Dec 2020 16:14:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606868066; cv=none;
        d=google.com; s=arc-20160816;
        b=o+AkgSSAKII7CpkaLoN/N+1GFXitrRgbYpmJ+AO6iM39LOQZSd8kLNCDOoCT8Wr6QQ
         isKbFh+r/piGdY9GMyv/JZPd8/wdI6lfDsjKTqoN738sXq56nSqab7VYGP54C8t25YOq
         u89gFPK/5pJmgEBkvqGotJHlpwcHcrCuIqJunY8AcYAcYA5i0HKyaOTYqNFjSXwbMVLu
         lMUKE1cYdo88U6nUQaHPpV1fZC9F+2IGnQaIz9++em9dWbsCy/Q55qWnjfyTQB4+uT7f
         IPY86hPrcUvaiR5+uZR2l7ATbg9WlABMAgmQHyayyu0vEN0DEancMhI7P+gmS/vhG9Re
         AxrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Ms2y6LB7pV+xBjtjWRR0tZJprFfybZJkirPgYxQNBFA=;
        b=axw6wQt7TdAgF5y0zynu3QAntT1sYygmEpPJixDCSMhix0CA2F+GxN3ulGeRqYUuEc
         DjrUpijGSDSCzWTYHhuQ/f1eO8fMLwCJxQcYf3S2AvFZ6n/1WL+4bKwE2nANl1zesEsX
         yEmgKtPGtVaBlvelHeTZ8uyGKesBJdhrdNIbDtwGx6qENKyJNOWq0zmZWQv4DsUFDJYL
         OGCt8b6Q2ewcprwBmXC1P3T2xxaRu+MFMN9B2Y8/+nuTFeWbyqv0zeQkEkWBsMo+k+bX
         tkS6VZTWIsgfSAe9diYS5YgU4BpKlDFZ19WUDHxdEnGPVCOnxFOqXYg2mYg5u5tK8q8l
         gB3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=S6P7AUgD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p4si103866yba.101.2020.12.01.16.14.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Dec 2020 16:14:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=S6P7AUgD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:53848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kkFmr-0004yM-Qb
	for alex.bennee@linaro.org; Tue, 01 Dec 2020 19:14:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pcc@google.com>) id 1kkFmP-0004y4-RI
 for qemu-arm@nongnu.org; Tue, 01 Dec 2020 19:13:58 -0500
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142]:37312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pcc@google.com>) id 1kkFmL-0002cR-5X
 for qemu-arm@nongnu.org; Tue, 01 Dec 2020 19:13:57 -0500
Received: by mail-il1-x142.google.com with SMTP id k8so3507667ilr.4
 for <qemu-arm@nongnu.org>; Tue, 01 Dec 2020 16:13:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ms2y6LB7pV+xBjtjWRR0tZJprFfybZJkirPgYxQNBFA=;
 b=S6P7AUgDHbwFarSRMd676g0p36P0LHqZF84Qm5XQnr8a+d++J2GF8Y5UzAhTKHYfKq
 /3+7GV+qIRle/BPj/TUrVBNZlOVjIyWRCi6p5/8lgJwnmUskGB+wn48vFgFe6WNOMN4W
 QhhIhgqDwGshoiydmQzcEWnQFMumfYqt2t9QnP/7fN2L3yzIMwDXaNT/jOmgeVZd5wYC
 +OhRUuioa8pI7now2DKxbt3Jw6wB5cV1uFW2eR7j6Y5Nfi+d9rVR2E9A6/XT5TDRUWk1
 MEeXlg3slhmR+122Z8AZAA69cHklG0vJvSmLN+xAdx1T7GWaCQR3nblCAkvu0GgPypX8
 bF+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ms2y6LB7pV+xBjtjWRR0tZJprFfybZJkirPgYxQNBFA=;
 b=lnROZi3SsOAlMdBxTlVqTKEl8TxK13sqeZfSqrneuNOLAYIjY37v1+bYOlrEcBwiRo
 e2DXyeYvl/ncAM7oLwA1Bn84QQaOGa1mM8XomhJTnYRvHf4AihiwEc+2z8i8TXO4TXjE
 HOWBWxFah4nBvgFx4ifz2sC7ag+TTzJje4BYuNB25D3OngoBDZKAWOcXosXp8gutG+MG
 pL4ilfuxqCkCY8nVlmrs2u+JGJjW+fsulAr8ByWaf3XULNzPydEz3VrahMf7zoHzs2l9
 b6IL7IFzmP9JYu8aySJCaq7svDL+rqwFqWSuJJFMzy0f1YgYchm/Dm2ZvElIlyvuB9sT
 Mb4g==
X-Gm-Message-State: AOAM533yxqdDYtl66+Od3D3p8GRVL5J7HKU8ysWcgm3g/H+Yw1YcvUb0
 jiiaApwkdCGfp1Xv/LEMfiNoGoTK6hWc2nURSAB7mQ==
X-Received: by 2002:a92:990e:: with SMTP id p14mr190484ili.28.1606868029464;
 Tue, 01 Dec 2020 16:13:49 -0800 (PST)
MIME-Version: 1.0
References: <4a2d15d01087207e2fba1f55ad312727dbfc782e.1606856104.git.pcc@google.com>
 <d91deec6e2c68a9cf0e911251992b4d845be14ab.1606856104.git.pcc@google.com>
 <bd199d49-91a6-e14a-41c3-4a4325c8eff2@csgraf.de>
In-Reply-To: <bd199d49-91a6-e14a-41c3-4a4325c8eff2@csgraf.de>
From: Peter Collingbourne <pcc@google.com>
Date: Tue, 1 Dec 2020 16:13:38 -0800
Message-ID: <CAMn1gO73SfYxEeHf5xyp0=R3UCKnjfLEACV1JpoEHEzz4yUBtg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm/hvf: Stop setting current_cpu
To: Alexander Graf <agraf@csgraf.de>
Cc: Frank Yang <lfy@google.com>, Roman Bolshakov <r.bolshakov@yadro.com>, 
 Peter Maydell <peter.maydell@linaro.org>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, 
 Cameron Esfahani <dirty@apple.com>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::142;
 envelope-from=pcc@google.com; helo=mail-il1-x142.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6AKDllksqvyK

On Tue, Dec 1, 2020 at 2:11 PM Alexander Graf <agraf@csgraf.de> wrote:
>
>
> On 01.12.20 22:00, Peter Collingbourne wrote:
> > This variable is already being set by the generic HVF code and it's a
> > thread-local variable so I don't see how it can be overwritten.
> >
> > Signed-off-by: Peter Collingbourne <pcc@google.com>
>
>
> Yikes :). Yes, absolutely!
>
> Would you mind if I squash this straight into my patch?

Sure, please go ahead.

Peter

>
>
> Thanks,
>
> Alex
>
>
> > ---
> >   target/arm/hvf/hvf.c | 8 --------
> >   1 file changed, 8 deletions(-)
> >
> > diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> > index 3321d48aa2..40984fcf4d 100644
> > --- a/target/arm/hvf/hvf.c
> > +++ b/target/arm/hvf/hvf.c
> > @@ -364,7 +364,6 @@ int hvf_vcpu_exec(CPUState *cpu)
> >       do {
> >           bool advance_pc = false;
> >
> > -        current_cpu = cpu;
> >           qemu_wait_io_event_common(cpu);
> >
> >           flush_cpu_state(cpu);
> > @@ -391,7 +390,6 @@ int hvf_vcpu_exec(CPUState *cpu)
> >               /* This is the main one, handle below. */
> >               break;
> >           case HV_EXIT_REASON_VTIMER_ACTIVATED:
> > -            current_cpu = cpu;
> >               qemu_set_irq(arm_cpu->gt_timer_outputs[GTIMER_VIRT], 1);
> >               continue;
> >           case HV_EXIT_REASON_CANCELED:
> > @@ -412,8 +410,6 @@ int hvf_vcpu_exec(CPUState *cpu)
> >               uint32_t srt = (syndrome >> 16) & 0x1f;
> >               uint64_t val = 0;
> >
> > -            current_cpu = cpu;
> > -
> >               DPRINTF("data abort: [pc=0x%llx va=0x%016llx pa=0x%016llx isv=%x "
> >                       "iswrite=%x s1ptw=%x len=%d srt=%d]\n",
> >                       env->pc, hvf_exit->exception.virtual_address,
> > @@ -523,7 +519,6 @@ int hvf_vcpu_exec(CPUState *cpu)
> >               break;
> >           case EC_AA64_HVC:
> >               cpu_synchronize_state(cpu);
> > -            current_cpu = cpu;
> >               if (arm_is_psci_call(arm_cpu, EXCP_HVC)) {
> >                   arm_handle_psci_call(arm_cpu);
> >               } else {
> > @@ -533,7 +528,6 @@ int hvf_vcpu_exec(CPUState *cpu)
> >               break;
> >           case EC_AA64_SMC:
> >               cpu_synchronize_state(cpu);
> > -            current_cpu = cpu;
> >               if (arm_is_psci_call(arm_cpu, EXCP_SMC)) {
> >                   arm_handle_psci_call(arm_cpu);
> >               } else {
> > @@ -561,7 +555,5 @@ int hvf_vcpu_exec(CPUState *cpu)
> >           }
> >       } while (ret == 0);
> >
> > -    current_cpu = cpu;
> > -
> >       return ret;
> >   }
