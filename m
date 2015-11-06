Received: by 10.182.105.169 with SMTP id gn9csp1061832obb;
        Fri, 6 Nov 2015 05:21:20 -0800 (PST)
X-Received: by 10.66.192.164 with SMTP id hh4mr17400757pac.150.1446816080809;
        Fri, 06 Nov 2015 05:21:20 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-pa0-x22f.google.com (mail-pa0-x22f.google.com. [2607:f8b0:400e:c03::22f])
        by mx.google.com with ESMTPS id po4si122443pbb.230.2015.11.06.05.21.20
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Nov 2015 05:21:20 -0800 (PST)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c03::22f as permitted sender) client-ip=2607:f8b0:400e:c03::22f;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c03::22f as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by pabfh17 with SMTP id fh17so123121419pab.0;
        Fri, 06 Nov 2015 05:21:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=q1cOvfIz/bAWsHCHru9QDrQKeo+oKYMZ5BQv2A3dfuU=;
        b=tMmojrFVC8l6ZwC36jZoBZ84667li0YkNjHuMV4rEfKggweL8VPKNYB9atXSQA+ljr
         kkoDHSePexGkCMKqCbMhbdxinuy6GlnaHa8cDHTR6t29/PveVXNJ1GO+4In49UH5m5Hj
         fX35SrQIVHhLWZn8ODkajSzu86cscPJKYDfBe1o1c7qHQYGrMNHicSXlq3nSiu0gZ2Mt
         Q3VApbEN/n22U9L0LaBQgyAGaXymSrL3TwF+FUlBWKhKC8R3Engih6SO5NPhG3F81/cn
         0DoHUQChH7egas6S3wi2OQ69YKzRrFNK+QnjeQyDiPoyVsMzatk6EmYNc/Oh49Oo/T6J
         ILWg==
X-Received: by 10.68.143.5 with SMTP id sa5mr17802829pbb.14.1446816080367;
        Fri, 06 Nov 2015 05:21:20 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com. [52.8.89.49])
        by smtp.gmail.com with ESMTPSA id kh9sm174439pad.11.2015.11.06.05.21.17
        (version=TLSv1.2 cipher=RC4-SHA bits=128/128);
        Fri, 06 Nov 2015 05:21:18 -0800 (PST)
Date: Fri, 6 Nov 2015 14:21:15 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, patches@linaro.org,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	qemu-arm@nongnu.org
Subject: Re: [PATCH 02/16] exec.c: Allow target CPUs to define multiple
 AddressSpaces
Message-ID: <20151106132115.GB13308@toto>
References: <1446747358-18214-1-git-send-email-peter.maydell@linaro.org>
 <1446747358-18214-3-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1446747358-18214-3-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TUID: gt6lZywoIpSh

On Thu, Nov 05, 2015 at 06:15:44PM +0000, Peter Maydell wrote:
> Allow multiple calls to cpu_address_space_init(); each
> call adds an entry to the cpu->ases array at the specified
> index. It is up to the target-specific CPU code to actually use
> these extra address spaces.
> 
> Since this multiple AddressSpace support won't work with
> KVM, add an assertion to avoid confusing failures.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  exec.c            | 28 ++++++++++++++++++----------
>  include/qom/cpu.h |  2 ++
>  2 files changed, 20 insertions(+), 10 deletions(-)
> 
> diff --git a/exec.c b/exec.c
> index b5490c8..6a2a694 100644
> --- a/exec.c
> +++ b/exec.c
> @@ -552,25 +552,32 @@ CPUState *qemu_get_cpu(int index)
>  #if !defined(CONFIG_USER_ONLY)
>  void cpu_address_space_init(CPUState *cpu, AddressSpace *as, int asidx)
>  {
> +    CPUAddressSpace *newas;
> +
>      if (asidx == 0) {
>          /* address space 0 gets the convenience alias */
>          cpu->as = as;
>      }
>  
> -    /* We only support one address space per cpu at the moment.  */
> -    assert(cpu->as == as);
> +    /* KVM cannot currently support multiple address spaces. */
> +    assert(asidx == 0 || !kvm_enabled());
>  
> -    if (cpu->cpu_ases) {
> -        /* We've already registered the listener for our only AS */
> -        return;
> +    if (asidx >= cpu->num_ases) {
> +        if (cpu->num_ases == 0) {
> +            cpu->cpu_ases = g_new(CPUAddressSpace, asidx + 1);
> +        } else {
> +            cpu->cpu_ases = g_renew(CPUAddressSpace, cpu->cpu_ases, asidx + 1);

IIUC, g_renew may move the entire cpu_ases area. The internals of
memory_listener_register (called below) seem to put away the pointers to listeners
so a renew+move would leave invalid pointers to listeners in memory.c wouldn't it?

There are various ways of solving this, (e.g dynamic allocation of the listener,
static allocation of the cpu_ases, invalidate all listeners and restore them after
each as init and more). I'm sure you'll figure something out.



> +        }
> +        cpu->num_ases = asidx + 1;
>      }
>  
> -    cpu->cpu_ases = g_new0(CPUAddressSpace, 1);
> -    cpu->cpu_ases[0].cpu = cpu;
> -    cpu->cpu_ases[0].as = as;
> +    newas = &cpu->cpu_ases[asidx];
> +    memset(newas, 0, sizeof(*newas));
> +    newas->cpu = cpu;
> +    newas->as = as;
>      if (tcg_enabled()) {
> -        cpu->cpu_ases[0].tcg_as_listener.commit = tcg_commit;
> -        memory_listener_register(&cpu->cpu_ases[0].tcg_as_listener, as);
> +        newas->tcg_as_listener.commit = tcg_commit;
> +        memory_listener_register(&newas->tcg_as_listener, as);
>      }
>  }
>  #endif
> @@ -627,6 +634,7 @@ void cpu_exec_init(CPUState *cpu, Error **errp)
>      Error *local_err = NULL;
>  
>      cpu->as = NULL;
> +    cpu->num_ases = 0;
>  
>  #ifndef CONFIG_USER_ONLY
>      cpu->thread_id = qemu_get_thread_id();
> diff --git a/include/qom/cpu.h b/include/qom/cpu.h
> index 51a1323..ae17932 100644
> --- a/include/qom/cpu.h
> +++ b/include/qom/cpu.h
> @@ -236,6 +236,7 @@ struct kvm_run;
>   * so that interrupts take effect immediately.
>   * @cpu_ases: Pointer to array of CPUAddressSpaces (which define the
>   *            AddressSpaces this CPU has)
> + * @num_ases: number of CPUAddressSpaces in @cpu_ases
>   * @as: Pointer to the first AddressSpace, for the convenience of targets which
>   *      only have a single AddressSpace
>   * @env_ptr: Pointer to subclass-specific CPUArchState field.
> @@ -285,6 +286,7 @@ struct CPUState {
>      struct qemu_work_item *queued_work_first, *queued_work_last;
>  
>      CPUAddressSpace *cpu_ases;
> +    int num_ases;
>      AddressSpace *as;
>  
>      void *env_ptr; /* CPUArchState */
> -- 
> 1.9.1
> 
