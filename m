Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp765864lfb;
        Fri, 4 Dec 2020 08:07:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwhUfHj1Fh9Ml5ikdWS13ZyRVelv//24i9sDxtm9zj1nkk6hkVhPntS51uf4Rf3wsJE2GCB
X-Received: by 2002:ab0:3043:: with SMTP id x3mr4073440ual.32.1607098068840;
        Fri, 04 Dec 2020 08:07:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607098068; cv=none;
        d=google.com; s=arc-20160816;
        b=IdSgyNQYiL/4pcigJTTsXVX9RqRMinz6srx2K/xFSb1Amur4w9i3XR9YAXhjUmK76s
         t4K2xPY7nsXiquY7bLTts/yRQC1cv8D8UPfgHAVNMIJ2ow0GnpKNipN9Ao73Org5ss6U
         MCVaOMfd9+25tHIj/tI2V9B5Tzwi+a+l+zqZqGBFA38g1mHK8ZB5VFHrSSKjAKf7REWM
         Ioyx4OiohyfDsZO+FV9Ogo9fhZTQMWuMFaz+G7f6wXo8/I8Cjjm8xQP6s2XCtNd7TXw1
         f2mb4iON0dyk2bGryhuTuVCxFL3bQbe0hV6Tdna2nD1fbTsyFyGdJref/Z8ij9aa7SaQ
         QV4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=ju5nM8GWY1eyhg1mGrdvroWm2HmMb1rEWOkGJoFWUvg=;
        b=mHudyigc/kUlkX5riVhZ+ZtibsustVuQTVsPg4m9yy25MRlPzmDl4CdVoipMStnS9K
         WHGY8GzQx0aKoRvlhVpur5MU8vwJmgorJ/1q6twy7cqKEU90zUgoLkns4aRPhfpsjO9t
         SsNLTPiiIrnrfv2qkxMbWKorIZw2eFzs3enBQqWporuCOXaJJJH0fMr7jguTp1qdRfnd
         Z3rmZUx79S2D/VgGe2XYGQnxKHQF29MhXQ3jNksrE6x+ETbOG1qlE3mocfCUA93JtMDd
         x1PpWo6ktMIjuwFU7TYrvXUCPVyDeUTQ+2jV0HTZLZSgUPDIiEl0KrN7cwCmuPu+06Lv
         X2iw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@yadro.com header.s=mta-01 header.b=rszOmrOT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=yadro.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k13si671551vkr.68.2020.12.04.08.07.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Dec 2020 08:07:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@yadro.com header.s=mta-01 header.b=rszOmrOT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=yadro.com
Received: from localhost ([::1]:45244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1klDca-000130-5h
	for alex.bennee@linaro.org; Fri, 04 Dec 2020 11:07:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1klDcS-00012S-KN; Fri, 04 Dec 2020 11:07:40 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:43712 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1klDcQ-0006li-Gn; Fri, 04 Dec 2020 11:07:40 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 1DB3741376;
 Fri,  4 Dec 2020 16:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1607098054;
 x=1608912455; bh=W74STiFCjAmSTJzqp4xH6gkrzXSm5cRBgnk8L2X+gn8=; b=
 rszOmrOTLwub8ASR7xjIepcXNM2uPggSZVgPiicDy1FqmMeHosNanV1CWFyKlCls
 D+XnxcVOsKy1o0FH6U1k76HEIw346Jt7fnTfd63JZUgl3JxCjM5WZ9qKH4B5+foa
 iF3Vz1MxRNaA9lihsJqMks5lIdaXhNZIEAFFGqeVzIE=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UNLvofmkHaoX; Fri,  4 Dec 2020 19:07:34 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id E40CA41257;
 Fri,  4 Dec 2020 19:07:33 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Fri, 4 Dec
 2020 19:07:33 +0300
Date: Fri, 4 Dec 2020 19:07:56 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Alexander Graf <agraf@csgraf.de>
Subject: Re: [PATCH v4 06/11] hvf: Simplify post reset/init/loadvm hooks
Message-ID: <20201204160756.GE86904@SPB-NB-133.local>
References: <20201203234857.21051-1-agraf@csgraf.de>
 <20201203234857.21051-7-agraf@csgraf.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20201203234857.21051-7-agraf@csgraf.de>
X-Originating-IP: [172.17.204.212]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-03.corp.yadro.com (172.17.100.103)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=r.bolshakov@yadro.com;
 helo=mta-01.yadro.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Cameron Esfahani <dirty@apple.com>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Collingbourne <pcc@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VG8uT4B72NCu

On Fri, Dec 04, 2020 at 12:48:52AM +0100, Alexander Graf wrote:
> The hooks we have that call us after reset, init and loadvm really all
> just want to say "The reference of all register state is in the QEMU
> vcpu struct, please push it".
> 
> We already have a working pushing mechanism though called cpu->vcpu_dirty,
> so we can just reuse that for all of the above, syncing state properly the
> next time we actually execute a vCPU.
> 
> This fixes PSCI resets on ARM, as they modify CPU state even after the
> post init call has completed, but before we execute the vCPU again.
> 
> To also make the scheme work for x86, we have to make sure we don't
> move stale eflags into our env when the vcpu state is dirty.
> 
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> ---
>  accel/hvf/hvf-cpus.c     | 27 +++++++--------------------
>  target/i386/hvf/x86hvf.c |  5 ++++-
>  2 files changed, 11 insertions(+), 21 deletions(-)
> 
> diff --git a/accel/hvf/hvf-cpus.c b/accel/hvf/hvf-cpus.c
> index 1b0c868944..71721e17de 100644
> --- a/accel/hvf/hvf-cpus.c
> +++ b/accel/hvf/hvf-cpus.c
> @@ -275,39 +275,26 @@ static void hvf_cpu_synchronize_state(CPUState *cpu)
>      }
>  }
>  
> -static void do_hvf_cpu_synchronize_post_reset(CPUState *cpu,
> -                                              run_on_cpu_data arg)
> +static void do_hvf_cpu_synchronize_set_dirty(CPUState *cpu,
> +                                             run_on_cpu_data arg)
>  {
> -    hvf_put_registers(cpu);
> -    cpu->vcpu_dirty = false;
> +    /* QEMU state is the reference, push it to HVF now and on next entry */

It's only signalling now. The actual push is delayed until the next
entry.

It'd be good if Paolo or Eduardo would also peek at this change because
it makes HVF a bit different from other accels.

HVF's post_reset, post_init and pre_loadvm no longer result into QEMU
state being pushed to HVF. I'm not sure I can fully grasp if there're
undesired side-effects of this so it's something worth broader review.

If nobody raises objections:

Reviewed-by: Roman Bolshakov <r.bolshakov@yadro.com>
Tested-by: Roman Bolshakov <r.bolshakov@yadro.com>

Thanks,
Roman

> +    cpu->vcpu_dirty = true;
>  }
>  
>  static void hvf_cpu_synchronize_post_reset(CPUState *cpu)
>  {
> -    run_on_cpu(cpu, do_hvf_cpu_synchronize_post_reset, RUN_ON_CPU_NULL);
> -}
> -
> -static void do_hvf_cpu_synchronize_post_init(CPUState *cpu,
> -                                             run_on_cpu_data arg)
> -{
> -    hvf_put_registers(cpu);
> -    cpu->vcpu_dirty = false;
> +    run_on_cpu(cpu, do_hvf_cpu_synchronize_set_dirty, RUN_ON_CPU_NULL);
>  }
>  
>  static void hvf_cpu_synchronize_post_init(CPUState *cpu)
>  {
> -    run_on_cpu(cpu, do_hvf_cpu_synchronize_post_init, RUN_ON_CPU_NULL);
> -}
> -
> -static void do_hvf_cpu_synchronize_pre_loadvm(CPUState *cpu,
> -                                              run_on_cpu_data arg)
> -{
> -    cpu->vcpu_dirty = true;
> +    run_on_cpu(cpu, do_hvf_cpu_synchronize_set_dirty, RUN_ON_CPU_NULL);
>  }
>  
>  static void hvf_cpu_synchronize_pre_loadvm(CPUState *cpu)
>  {
> -    run_on_cpu(cpu, do_hvf_cpu_synchronize_pre_loadvm, RUN_ON_CPU_NULL);
> +    run_on_cpu(cpu, do_hvf_cpu_synchronize_set_dirty, RUN_ON_CPU_NULL);
>  }
>  
>  static void hvf_vcpu_destroy(CPUState *cpu)
> diff --git a/target/i386/hvf/x86hvf.c b/target/i386/hvf/x86hvf.c
> index 0f2aeb1cf8..3111c0be4c 100644
> --- a/target/i386/hvf/x86hvf.c
> +++ b/target/i386/hvf/x86hvf.c
> @@ -435,7 +435,10 @@ int hvf_process_events(CPUState *cpu_state)
>      X86CPU *cpu = X86_CPU(cpu_state);
>      CPUX86State *env = &cpu->env;
>  
> -    env->eflags = rreg(cpu_state->hvf->fd, HV_X86_RFLAGS);
> +    if (!cpu_state->vcpu_dirty) {
> +        /* light weight sync for CPU_INTERRUPT_HARD and IF_MASK */
> +        env->eflags = rreg(cpu_state->hvf->fd, HV_X86_RFLAGS);
> +    }
>  
>      if (cpu_state->interrupt_request & CPU_INTERRUPT_INIT) {
>          cpu_synchronize_state(cpu_state);
> -- 
> 2.24.3 (Apple Git-128)
> 
