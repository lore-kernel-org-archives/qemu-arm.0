Received: by 2002:a17:906:18aa:b0:a6f:6ed6:9beb with SMTP id c10csp253865ejf;
        Fri, 14 Jun 2024 15:01:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1LT/pOT3VPaU1A34u66mWMgua54hLMhSEayP2eppqnnFeLpegm0AsduXXIpjVTDO3ukN1
X-Received: by 2002:a17:90a:67c5:b0:2bd:8aca:f1e0 with SMTP id 98e67ed59e1d1-2c4db24c533mr4105836a91.19.1718402462506;
        Fri, 14 Jun 2024 15:01:02 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1718402462; cv=pass;
        d=google.com; s=arc-20160816;
        b=hkI+RPLxFHCVHIgwwk/MEcBL09GnXsPBn1PIP/1P1yw9O1yna4xTn0Aa4F7d7CnzHs
         viJIHSM92g/DpQaXBh7pjOPzpMfmQQ1FSc3pgJY9EAZoygZ7eLwPsj3G/0q0cZaDxALf
         Pq8THDCBpt0R7q7VMqzTLXHL26sMnnNlFgno0QzSYceUiovasMsUgQgGePWiWBO6hvc3
         KLHCGJxCJbNxOruEtLJA21NBzgh/y8+fW7k63W7m1p+xG2J26JLrQp8X4EB6SKxxyIah
         Z8CnRQZxj4/JZ2bDXMIdeT1w88B9CFnwDEk2tQoZ1aja6iIjV5LloGNDB4LPunRGh0yV
         pkoA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:list-unsubscribe:list-subscribe
         :list-id:precedence:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=gvkzE80Zx1aHM1GM+SHSE0nbTlEwUCR4IoOEEsugEgA=;
        fh=SaL3oBmRuANBhwgCBVd++11MK0z+Zf7V6sGSeOVr3ko=;
        b=nLXI+Z7e0Rw4iPpqSLPtwRhcPsbIxWd1dM1JpgIpEKYrhYfO1hulQfZqLGPAezBRLT
         fOrbc/P5fnE/PVUHwNjvD+6d0L5LSNeXePOaytxJfmk4fMDu4zfejUXEzE+RFWi2LoGp
         iImgrkb8II2MUuaTjWWQQ0JA4E8/2Y54q/2UuM+0j0H2z99kUTMl7guo6tcpI6saISoE
         +3QBP6MQpH9l0W4CBGf4FSdHtAnklU+PL5ju1TeQvI4Tvld0mx56xHy/8jnS5bVXxM0s
         sY3qe9/90w5ZDsqufKbjQLDmuzGrqRiLeLkVoZGEfP0HOW058NbDq04sM3iqaesx1TOx
         ezdg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@treblig.org header.s=bytemarkmx header.b=Hz+C7lLI;
       arc=pass (i=1 spf=pass spfdomain=treblig.org dkim=pass dkdomain=treblig.org dmarc=pass fromdomain=treblig.org);
       spf=pass (google.com: domain of kvm+bounces-19723-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="kvm+bounces-19723-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=treblig.org
Return-Path: <kvm+bounces-19723-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [2604:1380:45e3:2400::1])
        by mx.google.com with ESMTPS id d9443c01a7336-1f855e3abddsi42917305ad.110.2024.06.14.15.01.01
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 15:01:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-19723-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) client-ip=2604:1380:45e3:2400::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@treblig.org header.s=bytemarkmx header.b=Hz+C7lLI;
       arc=pass (i=1 spf=pass spfdomain=treblig.org dkim=pass dkdomain=treblig.org dmarc=pass fromdomain=treblig.org);
       spf=pass (google.com: domain of kvm+bounces-19723-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="kvm+bounces-19723-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=treblig.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9BE0B285674
	for <alex.bennee@linaro.org>; Fri, 14 Jun 2024 22:01:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 066FC18413E;
	Fri, 14 Jun 2024 22:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="Hz+C7lLI"
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6789184126
	for <kvm@vger.kernel.org>; Fri, 14 Jun 2024 22:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718402447; cv=none; b=Li4xd+Z4FCQqTbBXZg/fligaPOA8O68uv8q68qKQ8PJc8fZZOE7IJ3Wdv+0OxiI63h8VB/F68oPYhrUiKqzBnT42v+N6R4QvXqFJBoGGXjaMJxvt5eFCekoid46TM44O21nRjfPkfvwfiMitMTI6AE3njGsLIMRf84ioNZoInVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718402447; c=relaxed/simple;
	bh=yaVkvuEhQePrjuOoUNvSpBxxjHjgzxzh4Lf9OmY2FYs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jC1023WOCyCVzCLXfTToTsOgBEerkHch1MPfCU7QaJNjHP+O7ozf4XeUg8s9lb0p7PqesiKs0vBlj3SiN64SoDo0r6ZPoVDM2y5Hz7xVWqE44+8zUmESp2Nj2X/iE/MAgLcsx6Utiq65bf82C2EqFLrJvHIJCRdLcbR0bKyMyfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=Hz+C7lLI; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=gvkzE80Zx1aHM1GM+SHSE0nbTlEwUCR4IoOEEsugEgA=; b=Hz+C7lLIw1mUgWdS
	blI/UuhUPxrfhFZEl6eH3BIxRdwl3hntBxoMHNlCc/ZtJ2yNqlrdGYsDm/4Vlbqo0Jtl0AaDoZRkR
	nY0oLejtrrIE8Y9V+lwWdITLq9Kmr1KK7MZiCrlcS3EgxqRpBdnO72bAePcTZ8aXgegupgtjxzPGJ
	BgQkddXImomxqWUF3O1pszjp+Z9vwzsyUmO3dE9S2yRr2KilDhnCvVGkGFZNqbUriRhpg169ecIdg
	KpTd+xHzQiiWns/q97VAgBAUQptVeSFWIOVlgnly/b6O76KmBxqiNDMbYrTZUoWUr50eO0NcTH/Fu
	SbH/+/OSU0tzx9SMkg==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1sIEyJ-006LYG-2n;
	Fri, 14 Jun 2024 22:00:35 +0000
Date: Fri, 14 Jun 2024 22:00:35 +0000
From: "Dr. David Alan Gilbert" <dave@treblig.org>
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Mark Burton <mburton@qti.qualcomm.com>, qemu-s390x@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
	Laurent Vivier <lvivier@redhat.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Alexandre Iooss <erdnaxe@crans.org>, qemu-arm@nongnu.org,
	Alexander Graf <agraf@csgraf.de>,
	Nicholas Piggin <npiggin@gmail.com>,
	Marco Liebel <mliebel@qti.qualcomm.com>,
	Thomas Huth <thuth@redhat.com>,
	Roman Bolshakov <rbolshakov@ddn.com>, qemu-ppc@nongnu.org,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Cameron Esfahani <dirty@apple.com>,
	Jamie Iles <quic_jiles@quicinc.com>,
	Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 9/9] contrib/plugins: add ips plugin example for cost
 modeling
Message-ID: <Zmy9g1U1uP1Vhx9N@gallifrey>
References: <20240612153508.1532940-1-alex.bennee@linaro.org>
 <20240612153508.1532940-10-alex.bennee@linaro.org>
 <ZmoM2Sac97PdXWcC@gallifrey>
 <777e1b13-9a4f-4c32-9ff7-9cedf7417695@linaro.org>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <777e1b13-9a4f-4c32-9ff7-9cedf7417695@linaro.org>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-21-amd64 (x86_64)
X-Uptime: 21:54:02 up 37 days,  9:08,  1 user,  load average: 0.00, 0.00, 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)
X-TUID: EvRrGl9Ehbrr

* Pierrick Bouvier (pierrick.bouvier@linaro.org) wrote:
> Hi Dave,
> 
> On 6/12/24 14:02, Dr. David Alan Gilbert wrote:
> > * Alex Bennée (alex.bennee@linaro.org) wrote:
> > > From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> > > 
> > > This plugin uses the new time control interface to make decisions
> > > about the state of time during the emulation. The algorithm is
> > > currently very simple. The user specifies an ips rate which applies
> > > per core. If the core runs ahead of its allocated execution time the
> > > plugin sleeps for a bit to let real time catch up. Either way time is
> > > updated for the emulation as a function of total executed instructions
> > > with some adjustments for cores that idle.
> > 
> > A few random thoughts:
> >    a) Are there any definitions of what a plugin that controls time
> >       should do with a live migration?
> 
> It's not something that was considered as part of this work.

That's OK, the only thing is we need to stop anyone from hitting problems
when they don't realise it's not been addressed.
One way might be to add a migration blocker; see include/migration/blocker.h
then you might print something like 'Migration not available due to plugin ....'

> >    b) The sleep in migration/dirtyrate.c points out g_usleep might
> >       sleep for longer, so reads the actual wall clock time to
> >       figure out a new 'now'.
> 
> The current API mentions time starts at 0 from qemu startup. Maybe we could
> consider in the future to change this behavior to retrieve time from an
> existing migrated machine.

Ah, I meant for (b) to be independent of (a) - not related to migration; just
down to the fact you used g_usleep in the plugin and a g_usleep might sleep
for a different amount of time than you asked.

> >    c) A fun thing to do with this would be to follow an external simulation
> >       or 2nd qemu, trying to keep the two from running too far past
> >       each other.
> > 
> 
> Basically, to slow the first one, waiting for the replicated one to catch
> up?

Yes, something like that.

Dave

> > Dave >
> > > Examples
> > > --------
> > > 
> > > Slow down execution of /bin/true:
> > > $ num_insn=$(./build/qemu-x86_64 -plugin ./build/tests/plugin/libinsn.so -d plugin /bin/true |& grep total | sed -e 's/.*: //')
> > > $ time ./build/qemu-x86_64 -plugin ./build/contrib/plugins/libips.so,ips=$(($num_insn/4)) /bin/true
> > > real 4.000s
> > > 
> > > Boot a Linux kernel simulating a 250MHz cpu:
> > > $ /build/qemu-system-x86_64 -kernel /boot/vmlinuz-6.1.0-21-amd64 -append "console=ttyS0" -plugin ./build/contrib/plugins/libips.so,ips=$((250*1000*1000)) -smp 1 -m 512
> > > check time until kernel panic on serial0
> > > 
> > > Tested in system mode by booting a full debian system, and using:
> > > $ sysbench cpu run
> > > Performance decrease linearly with the given number of ips.
> > > 
> > > Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> > > Message-Id: <20240530220610.1245424-7-pierrick.bouvier@linaro.org>
> > > ---
> > >   contrib/plugins/ips.c    | 164 +++++++++++++++++++++++++++++++++++++++
> > >   contrib/plugins/Makefile |   1 +
> > >   2 files changed, 165 insertions(+)
> > >   create mode 100644 contrib/plugins/ips.c
> > > 
> > > diff --git a/contrib/plugins/ips.c b/contrib/plugins/ips.c
> > > new file mode 100644
> > > index 0000000000..db77729264
> > > --- /dev/null
> > > +++ b/contrib/plugins/ips.c
> > > @@ -0,0 +1,164 @@
> > > +/*
> > > + * ips rate limiting plugin.
> > > + *
> > > + * This plugin can be used to restrict the execution of a system to a
> > > + * particular number of Instructions Per Second (ips). This controls
> > > + * time as seen by the guest so while wall-clock time may be longer
> > > + * from the guests point of view time will pass at the normal rate.
> > > + *
> > > + * This uses the new plugin API which allows the plugin to control
> > > + * system time.
> > > + *
> > > + * Copyright (c) 2023 Linaro Ltd
> > > + *
> > > + * SPDX-License-Identifier: GPL-2.0-or-later
> > > + */
> > > +
> > > +#include <stdio.h>
> > > +#include <glib.h>
> > > +#include <qemu-plugin.h>
> > > +
> > > +QEMU_PLUGIN_EXPORT int qemu_plugin_version = QEMU_PLUGIN_VERSION;
> > > +
> > > +/* how many times do we update time per sec */
> > > +#define NUM_TIME_UPDATE_PER_SEC 10
> > > +#define NSEC_IN_ONE_SEC (1000 * 1000 * 1000)
> > > +
> > > +static GMutex global_state_lock;
> > > +
> > > +static uint64_t max_insn_per_second = 1000 * 1000 * 1000; /* ips per core, per second */
> > > +static uint64_t max_insn_per_quantum; /* trap every N instructions */
> > > +static int64_t virtual_time_ns; /* last set virtual time */
> > > +
> > > +static const void *time_handle;
> > > +
> > > +typedef struct {
> > > +    uint64_t total_insn;
> > > +    uint64_t quantum_insn; /* insn in last quantum */
> > > +    int64_t last_quantum_time; /* time when last quantum started */
> > > +} vCPUTime;
> > > +
> > > +struct qemu_plugin_scoreboard *vcpus;
> > > +
> > > +/* return epoch time in ns */
> > > +static int64_t now_ns(void)
> > > +{
> > > +    return g_get_real_time() * 1000;
> > > +}
> > > +
> > > +static uint64_t num_insn_during(int64_t elapsed_ns)
> > > +{
> > > +    double num_secs = elapsed_ns / (double) NSEC_IN_ONE_SEC;
> > > +    return num_secs * (double) max_insn_per_second;
> > > +}
> > > +
> > > +static int64_t time_for_insn(uint64_t num_insn)
> > > +{
> > > +    double num_secs = (double) num_insn / (double) max_insn_per_second;
> > > +    return num_secs * (double) NSEC_IN_ONE_SEC;
> > > +}
> > > +
> > > +static void update_system_time(vCPUTime *vcpu)
> > > +{
> > > +    int64_t elapsed_ns = now_ns() - vcpu->last_quantum_time;
> > > +    uint64_t max_insn = num_insn_during(elapsed_ns);
> > > +
> > > +    if (vcpu->quantum_insn >= max_insn) {
> > > +        /* this vcpu ran faster than expected, so it has to sleep */
> > > +        uint64_t insn_advance = vcpu->quantum_insn - max_insn;
> > > +        uint64_t time_advance_ns = time_for_insn(insn_advance);
> > > +        int64_t sleep_us = time_advance_ns / 1000;
> > > +        g_usleep(sleep_us);
> > > +    }
> > > +
> > > +    vcpu->total_insn += vcpu->quantum_insn;
> > > +    vcpu->quantum_insn = 0;
> > > +    vcpu->last_quantum_time = now_ns();
> > > +
> > > +    /* based on total number of instructions, what should be the new time? */
> > > +    int64_t new_virtual_time = time_for_insn(vcpu->total_insn);
> > > +
> > > +    g_mutex_lock(&global_state_lock);
> > > +
> > > +    /* Time only moves forward. Another vcpu might have updated it already. */
> > > +    if (new_virtual_time > virtual_time_ns) {
> > > +        qemu_plugin_update_ns(time_handle, new_virtual_time);
> > > +        virtual_time_ns = new_virtual_time;
> > > +    }
> > > +
> > > +    g_mutex_unlock(&global_state_lock);
> > > +}
> > > +
> > > +static void vcpu_init(qemu_plugin_id_t id, unsigned int cpu_index)
> > > +{
> > > +    vCPUTime *vcpu = qemu_plugin_scoreboard_find(vcpus, cpu_index);
> > > +    vcpu->total_insn = 0;
> > > +    vcpu->quantum_insn = 0;
> > > +    vcpu->last_quantum_time = now_ns();
> > > +}
> > > +
> > > +static void vcpu_exit(qemu_plugin_id_t id, unsigned int cpu_index)
> > > +{
> > > +    vCPUTime *vcpu = qemu_plugin_scoreboard_find(vcpus, cpu_index);
> > > +    update_system_time(vcpu);
> > > +}
> > > +
> > > +static void every_quantum_insn(unsigned int cpu_index, void *udata)
> > > +{
> > > +    vCPUTime *vcpu = qemu_plugin_scoreboard_find(vcpus, cpu_index);
> > > +    g_assert(vcpu->quantum_insn >= max_insn_per_quantum);
> > > +    update_system_time(vcpu);
> > > +}
> > > +
> > > +static void vcpu_tb_trans(qemu_plugin_id_t id, struct qemu_plugin_tb *tb)
> > > +{
> > > +    size_t n_insns = qemu_plugin_tb_n_insns(tb);
> > > +    qemu_plugin_u64 quantum_insn =
> > > +        qemu_plugin_scoreboard_u64_in_struct(vcpus, vCPUTime, quantum_insn);
> > > +    /* count (and eventually trap) once per tb */
> > > +    qemu_plugin_register_vcpu_tb_exec_inline_per_vcpu(
> > > +        tb, QEMU_PLUGIN_INLINE_ADD_U64, quantum_insn, n_insns);
> > > +    qemu_plugin_register_vcpu_tb_exec_cond_cb(
> > > +        tb, every_quantum_insn,
> > > +        QEMU_PLUGIN_CB_NO_REGS, QEMU_PLUGIN_COND_GE,
> > > +        quantum_insn, max_insn_per_quantum, NULL);
> > > +}
> > > +
> > > +static void plugin_exit(qemu_plugin_id_t id, void *udata)
> > > +{
> > > +    qemu_plugin_scoreboard_free(vcpus);
> > > +}
> > > +
> > > +QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
> > > +                                           const qemu_info_t *info, int argc,
> > > +                                           char **argv)
> > > +{
> > > +    for (int i = 0; i < argc; i++) {
> > > +        char *opt = argv[i];
> > > +        g_auto(GStrv) tokens = g_strsplit(opt, "=", 2);
> > > +        if (g_strcmp0(tokens[0], "ips") == 0) {
> > > +            max_insn_per_second = g_ascii_strtoull(tokens[1], NULL, 10);
> > > +            if (!max_insn_per_second && errno) {
> > > +                fprintf(stderr, "%s: couldn't parse %s (%s)\n",
> > > +                        __func__, tokens[1], g_strerror(errno));
> > > +                return -1;
> > > +            }
> > > +        } else {
> > > +            fprintf(stderr, "option parsing failed: %s\n", opt);
> > > +            return -1;
> > > +        }
> > > +    }
> > > +
> > > +    vcpus = qemu_plugin_scoreboard_new(sizeof(vCPUTime));
> > > +    max_insn_per_quantum = max_insn_per_second / NUM_TIME_UPDATE_PER_SEC;
> > > +
> > > +    time_handle = qemu_plugin_request_time_control();
> > > +    g_assert(time_handle);
> > > +
> > > +    qemu_plugin_register_vcpu_tb_trans_cb(id, vcpu_tb_trans);
> > > +    qemu_plugin_register_vcpu_init_cb(id, vcpu_init);
> > > +    qemu_plugin_register_vcpu_exit_cb(id, vcpu_exit);
> > > +    qemu_plugin_register_atexit_cb(id, plugin_exit, NULL);
> > > +
> > > +    return 0;
> > > +}
> > > diff --git a/contrib/plugins/Makefile b/contrib/plugins/Makefile
> > > index 0b64d2c1e3..449ead1130 100644
> > > --- a/contrib/plugins/Makefile
> > > +++ b/contrib/plugins/Makefile
> > > @@ -27,6 +27,7 @@ endif
> > >   NAMES += hwprofile
> > >   NAMES += cache
> > >   NAMES += drcov
> > > +NAMES += ips
> > >   ifeq ($(CONFIG_WIN32),y)
> > >   SO_SUFFIX := .dll
> > > -- 
> > > 2.39.2
> > > 
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
