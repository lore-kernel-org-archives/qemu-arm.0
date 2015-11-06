Received: by 10.182.105.169 with SMTP id gn9csp1098841obb;
        Fri, 6 Nov 2015 06:30:02 -0800 (PST)
X-Received: by 10.107.134.198 with SMTP id q67mr15680385ioi.90.1446820201980;
        Fri, 06 Nov 2015 06:30:01 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-pa0-x231.google.com (mail-pa0-x231.google.com. [2607:f8b0:400e:c03::231])
        by mx.google.com with ESMTPS id p19si3140143igs.16.2015.11.06.06.30.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Nov 2015 06:30:01 -0800 (PST)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c03::231 as permitted sender) client-ip=2607:f8b0:400e:c03::231;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c03::231 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by pasz6 with SMTP id z6so128725328pas.2;
        Fri, 06 Nov 2015 06:30:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=d4zF/DzbLRUS7/5uSj0tcrnrssHZ9QypFRHWrBu8+Qg=;
        b=mnAbeQ/xIaVbyEoV20gibtu/j2Eb3p6QvQv11pkJLs33Ke2PW/QaH1FXJsGq/i2uXv
         90j8pgw4QjF1xckdQLQhrf5mukp+v2JJBUu+1zV1BiM+N1Bm0XOPYYYaC67r81ZtY2MN
         swFzKm8cf/rH76UrJRwmbl8YXQidc4qNl/gVjxyXl5PTjvDxWB9ISuOpUBoOL+ImreNj
         epb1nH/xR43S3eGPVzIk3uJqMLkJkTaScRhaBEL0UTahlcVd0E8cMrv6SA4U++DIITuo
         xF1Y292hP/1BqTISzCDiU0YFH+Ws9YwGGr7ySYWMmJlEEY/sJ8RRn+N5SPSB3rwv/VoN
         XFjQ==
X-Received: by 10.68.200.103 with SMTP id jr7mr18343391pbc.77.1446820200082;
        Fri, 06 Nov 2015 06:30:00 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com. [52.8.89.49])
        by smtp.gmail.com with ESMTPSA id hi4sm509666pbc.7.2015.11.06.06.29.57
        (version=TLSv1.2 cipher=RC4-SHA bits=128/128);
        Fri, 06 Nov 2015 06:29:58 -0800 (PST)
Date: Fri, 6 Nov 2015 15:29:55 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, patches@linaro.org,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	qemu-arm@nongnu.org
Subject: Re: [PATCH 11/16] memory: Add address_space_init_shareable()
Message-ID: <20151106142955.GN13308@toto>
References: <1446747358-18214-1-git-send-email-peter.maydell@linaro.org>
 <1446747358-18214-12-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1446747358-18214-12-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TUID: npZvDhtXOAhO

On Thu, Nov 05, 2015 at 06:15:53PM +0000, Peter Maydell wrote:
> From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
> 
> This will either create a new AS or return a pointer to an
> already existing equivalent one, if we have already created
> an AS for the specified root memory region.
> 
> The motivation is to reuse address spaces as much as possible.
> It's going to be quite common that bus masters out in device land
> have pointers to the same memory region for their mastering yet
> each will need to create its own address space. Let the memory
> API implement sharing for them.
> 
> Aside from the perf optimisations, this should reduce the amount
> of redundant output on info mtree as well.
> 
> Thee returned value will be malloced, but the malloc will be
> automatically freed when the AS runs out of refs.
> 
> Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
> [PMM: dropped check for NULL root as unused; added doc-comment;
>  squashed Peter C's reference-counting patch into this one;
>  don't compare name string when deciding if we can share ASes;
>  read as->malloced before the unref of as->root to avoid possible
>  read-after-free if as->root was the owner of as]
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/exec/memory.h | 18 ++++++++++++++++++
>  memory.c              | 27 +++++++++++++++++++++++++++
>  2 files changed, 45 insertions(+)
> 
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index e5d98f8..1d1740a 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -236,6 +236,8 @@ struct AddressSpace {
>      struct rcu_head rcu;
>      char *name;
>      MemoryRegion *root;
> +    int ref_count;
> +    bool malloced;
>  
>      /* Accessed via RCU.  */
>      struct FlatView *current_map;
> @@ -1167,6 +1169,22 @@ MemTxResult memory_region_dispatch_write(MemoryRegion *mr,
>   */
>  void address_space_init(AddressSpace *as, MemoryRegion *root, const char *name);
>  
> +/**
> + * address_space_init_shareable: return an address space for a memory region,
> + *                               creating it if it does not already exist
> + *
> + * @root: a #MemoryRegion that routes addresses for the address space
> + * @name: an address space name.  The name is only used for debugging
> + *        output.
> + *
> + * This function will return a pointer to an existing AddressSpace
> + * which was initialized with the specified MemoryRegion, or it will
> + * create and initialize one if it does not already exist. The ASes
> + * are reference-counted, so the memory will be freed automatically
> + * when the AddressSpace is destroyed via address_space_destroy.
> + */
> +AddressSpace *address_space_init_shareable(MemoryRegion *root,
> +                                           const char *name);
>  
>  /**
>   * address_space_destroy: destroy an address space
> diff --git a/memory.c b/memory.c
> index c435c88..6c98a71 100644
> --- a/memory.c
> +++ b/memory.c
> @@ -2101,7 +2101,9 @@ void address_space_init(AddressSpace *as, MemoryRegion *root, const char *name)
>  {
>      memory_region_ref(root);
>      memory_region_transaction_begin();
> +    as->ref_count = 1;
>      as->root = root;
> +    as->malloced = false;
>      as->current_map = g_new(FlatView, 1);
>      flatview_init(as->current_map);
>      as->ioeventfd_nb = 0;
> @@ -2116,6 +2118,7 @@ void address_space_init(AddressSpace *as, MemoryRegion *root, const char *name)
>  static void do_address_space_destroy(AddressSpace *as)
>  {
>      MemoryListener *listener;
> +    bool do_free = as->malloced;
>  
>      address_space_destroy_dispatch(as);
>  
> @@ -2127,12 +2130,36 @@ static void do_address_space_destroy(AddressSpace *as)
>      g_free(as->name);
>      g_free(as->ioeventfds);
>      memory_region_unref(as->root);
> +    if (do_free) {
> +        g_free(as);
> +    }
> +}
> +
> +AddressSpace *address_space_init_shareable(MemoryRegion *root, const char *name)
> +{
> +    AddressSpace *as;
> +
> +    QTAILQ_FOREACH(as, &address_spaces, address_spaces_link) {
> +        if (root == as->root) {
> +            as->ref_count++;
> +            return as;
> +        }
> +    }
> +
> +    as = g_malloc0(sizeof *as);
> +    address_space_init(as, root, name);

Nit-pick but IIUC, address_space_init does not need AS to be zeroed
so this could be changed to a g_malloc().

either-way:

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>



> +    as->malloced = true;
> +    return as;
>  }
>  
>  void address_space_destroy(AddressSpace *as)
>  {
>      MemoryRegion *root = as->root;
>  
> +    as->ref_count--;
> +    if (as->ref_count) {
> +        return;
> +    }
>      /* Flush out anything from MemoryListeners listening in on this */
>      memory_region_transaction_begin();
>      as->root = NULL;
> -- 
> 1.9.1
> 
