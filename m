Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp1381452wme;
        Tue, 22 May 2018 04:40:56 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZoPlI/9N3UHnqZ1tqa2hr6aJMEE8OMveyKNxN9a/XzkE/hsJ3d9ROrOcSG4+/kLC7Jnqha+
X-Received: by 2002:a0c:d88f:: with SMTP id q15-v6mr21107443qvj.83.1526989256735;
        Tue, 22 May 2018 04:40:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526989256; cv=none;
        d=google.com; s=arc-20160816;
        b=FAWep0UVHqJRY4Sn/ZLKeIMgFwBpoLYzpc9NxtcIEavllc5RCK9Oha6HYrIxkVpJij
         +niOL9Eka1n9ozP9HhwhFZ9/MgwdKm2fQjJIsT+NlKlupQv0L3Iav+KrjZMElnPCqpop
         zqvzFwvblvWwmh3O0B76N+D8K0auhVauXE1/NO7gUtL+BWJ8BIjtFr0ZBkHMpzCZGexw
         u/BDZBFNTQ6U4BThzifkNml436g0LQ1KLaVatetEHIfYsmv4CwdERyL38zzgpV0izOUh
         kmiuxYFv2Uydmrh62+rMifVt6hW2jJ1tLSwZqtLp5wnfRRoFZt6blC5yM8Vv1Y4tnQsH
         NKYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:cc:references:to:subject:arc-authentication-results;
        bh=36VM4gRhMoiru2j8NB24PTUJnLFx5DcB5v6xesFc3vU=;
        b=E0RABgSTT0pobmfEjkNxOW9HgjIaV2jyqlHxMAbMy7mHoYqXrTIHlNz9yQAgTp+ei6
         wxlv0qPo1C5FFq4g6RhkXMvbe9LcgkRI3egRIdZc1jFzK3YgZmpInG2fy49obdk1oeWe
         NvgkMcuQtkPeavDwB1rffJAL+xaiyMTnMXeNg7UaEmUN4VlFImc7E81Q9N8mT8v2y0zj
         YikqbkGb6iCCPbxs2zgML3o5l3+7cIZwshtmn1OMdpX1g+kiFuwsz5mgudp5S8B8cBjz
         iZWmj4H5005HBHMfFgFWk+6vRtJG73t8nK0SU2JsGaxYHSVpasGzT8Yl/mynPLyz5b0o
         jx6g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from mx1.redhat.com (mx3-rdu2.redhat.com. [66.187.233.73])
        by mx.google.com with ESMTPS id j27-v6si1642708qkh.366.2018.05.22.04.40.56
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 May 2018 04:40:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 66.187.233.73 as permitted sender) client-ip=66.187.233.73;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 397F17D83A;
	Tue, 22 May 2018 11:40:56 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-69.ams2.redhat.com [10.36.116.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C641A215CDA7;
	Tue, 22 May 2018 11:40:54 +0000 (UTC)
Subject: Re: [Qemu-devel] [PATCH 01/27] memory.h: Improve IOMMU related
 documentation
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20180521140402.23318-1-peter.maydell@linaro.org>
 <20180521140402.23318-2-peter.maydell@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, patches@linaro.org
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <50b9fbd0-5571-a83f-1ae5-b44b1f7828a9@redhat.com>
Date: Tue, 22 May 2018 13:40:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20180521140402.23318-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]); Tue, 22 May 2018 11:40:56 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]); Tue, 22 May 2018 11:40:56 +0000 (UTC) for IP:'10.11.54.6' DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-TUID: Dv5QLYLIIOAw

Hi Peter,

On 05/21/2018 04:03 PM, Peter Maydell wrote:
> Add more detail to the documentation for memory_region_init_iommu()
> and other IOMMU-related functions and data structures.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
> ---
> v2->v3 changes:
>  * minor wording tweaks per Eric's review
>  * moved the bit about requirements to notify out from the translate
>    method docs to the top level class doc comment
>  * added description of flags argument and in particular that it's
>    just an optimization and callers can pass IOMMU_NONE to get the
>    full permissions
> v1 -> v2 changes:
>  * documented replay method
>  * added note about wanting RCU or big qemu lock while calling
>    translate
> ---
>  include/exec/memory.h | 105 ++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 95 insertions(+), 10 deletions(-)
> 
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index 4fa1227f13..cce355d2d8 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -194,29 +194,100 @@ enum IOMMUMemoryRegionAttr {
>      IOMMU_ATTR_SPAPR_TCE_FD
>  };
>  
> +/**
> + * IOMMUMemoryRegionClass:
> + *
> + * All IOMMU implementations need to subclass TYPE_IOMMU_MEMORY_REGION
> + * and provide an implementation of at least the @translate method here
> + * to handle requests to the memory region. Other methods are optional.
> + *
> + * The IOMMU implementation must use the IOMMU notifier infrastructure
> + * to report whenever mappings are changed, by calling
> + * memory_region_notify_iommu() (or, if necessary, by calling
> + * memory_region_notify_one() for each registered notifier).
> + */
>  typedef struct IOMMUMemoryRegionClass {
>      /* private */
>      struct DeviceClass parent_class;
>  
>      /*
> -     * Return a TLB entry that contains a given address. Flag should
> -     * be the access permission of this translation operation. We can
> -     * set flag to IOMMU_NONE to mean that we don't need any
> -     * read/write permission checks, like, when for region replay.
> +     * Return a TLB entry that contains a given address.
> +     *
> +     * The IOMMUAccessFlags indicated via @flag are optional and may
> +     * be specified as IOMMU_NONE to indicate that the caller needs
> +     * the full translation information for both reads and writes. If
> +     * the access flags are specified then the IOMMU implementation
> +     * may use this as an optimization, to stop doing a page table
> +     * walk as soon as it knows that the requested permissions are not
> +     * allowed. If IOMMU_NONE is passed then the IOMMU must do the
> +     * full page table walk and report the permissions in the returned
> +     * IOMMUTLBEntry. (Note that this implies that an IOMMU may not
> +     * return different mappings for reads and writes.)
> +     *
> +     * The returned information remains valid while the caller is
> +     * holding the big QEMU lock or is inside an RCU critical section;
> +     * if the caller wishes to cache the mapping beyond that it must
> +     * register an IOMMU notifier so it can invalidate its cached
> +     * information when the IOMMU mapping changes.
> +     *
> +     * @iommu: the IOMMUMemoryRegion
> +     * @hwaddr: address to be translated within the memory region
> +     * @flag: requested access permissions
>       */
>      IOMMUTLBEntry (*translate)(IOMMUMemoryRegion *iommu, hwaddr addr,
>                                 IOMMUAccessFlags flag);
> -    /* Returns minimum supported page size */
> +    /* Returns minimum supported page size in bytes.
> +     * If this method is not provided then the minimum is assumed to
> +     * be TARGET_PAGE_SIZE.
> +     *
> +     * @iommu: the IOMMUMemoryRegion
> +     */
>      uint64_t (*get_min_page_size)(IOMMUMemoryRegion *iommu);
> -    /* Called when IOMMU Notifier flag changed */
> +    /* Called when IOMMU Notifier flag changes (ie when the set of
> +     * events which IOMMU users are requesting notification for changes).
> +     * Optional method -- need not be provided if the IOMMU does not
> +     * need to know exactly which events must be notified.
> +     *
> +     * @iommu: the IOMMUMemoryRegion
> +     * @old_flags: events which previously needed to be notified
> +     * @new_flags: events which now need to be notified
> +     */
>      void (*notify_flag_changed)(IOMMUMemoryRegion *iommu,
>                                  IOMMUNotifierFlag old_flags,
>                                  IOMMUNotifierFlag new_flags);
> -    /* Set this up to provide customized IOMMU replay function */
> +    /* Called to handle memory_region_iommu_replay().
> +     *
> +     * The default implementation of memory_region_iommu_replay() is to
> +     * call the IOMMU translate method for every page in the address space
> +     * with flag == IOMMU_NONE and then call the notifier if translate
> +     * returns a valid mapping. If this method is implemented then it
> +     * overrides the default behaviour, and must provide the full semantics
> +     * of memory_region_iommu_replay(), by calling @notifier for every
> +     * translation present in the IOMMU.
> +     *
> +     * Optional method -- an IOMMU only needs to provide this method
> +     * if the default is inefficient or produces undesirable side effects.
> +     *
> +     * Note: this is not related to record-and-replay functionality.
> +     */
>      void (*replay)(IOMMUMemoryRegion *iommu, IOMMUNotifier *notifier);
>  
> -    /* Get IOMMU misc attributes */
> -    int (*get_attr)(IOMMUMemoryRegion *iommu, enum IOMMUMemoryRegionAttr,
> +    /* Get IOMMU misc attributes. This is an optional method that
> +     * can be used to allow users of the IOMMU to get implementation-specific
> +     * information. The IOMMU implements this method to handle calls
> +     * by IOMMU users to memory_region_iommu_get_attr() by filling in
> +     * the arbitrary data pointer for any IOMMUMemoryRegionAttr values that
> +     * the IOMMU supports. If the method is unimplemented then
> +     * memory_region_iommu_get_attr() will always return -EINVAL.
> +     *
> +     * @iommu: the IOMMUMemoryRegion
> +     * @attr: attribute being queried
> +     * @data: memory to fill in with the attribute data
> +     *
> +     * Returns 0 on success, or a negative errno; in particular
> +     * returns -EINVAL for unrecognized or unimplemented attribute types.
> +     */
> +    int (*get_attr)(IOMMUMemoryRegion *iommu, enum IOMMUMemoryRegionAttr attr,
>                      void *data);
>  } IOMMUMemoryRegionClass;
>  
> @@ -705,6 +776,14 @@ static inline void memory_region_init_reservation(MemoryRegion *mr,
>   * An IOMMU region translates addresses and forwards accesses to a target
>   * memory region.
>   *
> + * The IOMMU implementation must define a subclass of TYPE_IOMMU_MEMORY_REGION.
> + * @_iommu_mr should be a pointer to enough memory for an instance of
> + * that subclass, @instance_size is the size of that subclass, and
> + * @mrtypename is its name. This function will initialize @_iommu_mr as an
> + * instance of the subclass, and its methods will then be called to handle
> + * accesses to the memory region. See the documentation of
> + * #IOMMUMemoryRegionClass for further details.
> + *
>   * @_iommu_mr: the #IOMMUMemoryRegion to be initialized
>   * @instance_size: the IOMMUMemoryRegion subclass instance size
>   * @mrtypename: the type name of the #IOMMUMemoryRegion
> @@ -953,6 +1032,8 @@ void memory_region_register_iommu_notifier(MemoryRegion *mr,
>   * a notifier with the minimum page granularity returned by
>   * mr->iommu_ops->get_page_size().
>   *
> + * Note: this is not related to record-and-replay functionality.
> + *
>   * @iommu_mr: the memory region to observe
>   * @n: the notifier to which to replay iommu mappings
>   */
> @@ -962,6 +1043,8 @@ void memory_region_iommu_replay(IOMMUMemoryRegion *iommu_mr, IOMMUNotifier *n);
>   * memory_region_iommu_replay_all: replay existing IOMMU translations
>   * to all the notifiers registered.
>   *
> + * Note: this is not related to record-and-replay functionality.
> + *
>   * @iommu_mr: the memory region to observe
>   */
>  void memory_region_iommu_replay_all(IOMMUMemoryRegion *iommu_mr);
> @@ -981,7 +1064,9 @@ void memory_region_unregister_iommu_notifier(MemoryRegion *mr,
>   * memory_region_iommu_get_attr: return an IOMMU attr if get_attr() is
>   * defined on the IOMMU.
>   *
> - * Returns 0 if succeded, error code otherwise.
> + * Returns 0 on success, or a negative errno otherwise. In particular,
> + * -EINVAL indicates that the IOMMU does not support the requested
> + * attribute.
>   *
>   * @iommu_mr: the memory region
>   * @attr: the requested attribute
> 
