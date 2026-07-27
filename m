Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B1BEC531D0
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Jul 2026 14:03:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1woLvA-00071N-F6; Mon, 27 Jul 2026 10:03:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1woLv8-00070M-7Y
 for qemu-arm@nongnu.org; Mon, 27 Jul 2026 10:03:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1woLv6-00074K-Rj
 for qemu-arm@nongnu.org; Mon, 27 Jul 2026 10:03:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1785160983;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KGyk8CRhVzlr+ku+3OiAImhDiNhAIav+Px3QBkWJoKc=;
 b=Rw0rXjrV1eTYYeObFkaQZHraekbQvUgoTA9vfFlgiHUyqI5GgFQCgEroUuCr5LQu11M6e2
 q6K3l+q1yVgRQXtzZ4IfWRrxLZzZnA4KkMCM4FmzN1gBxqh3d/HMgoiK+Rq6rxV+zv3EDr
 H4CKv3G+14ZrTI3jXMtIA48+LX+dqr4=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-219-7dwdCm2ONkCpwSUi5qWV6A-1; Mon, 27 Jul 2026 10:03:01 -0400
X-MC-Unique: 7dwdCm2ONkCpwSUi5qWV6A-1
X-Mimecast-MFC-AGG-ID: 7dwdCm2ONkCpwSUi5qWV6A_1785160981
Received: by mail-vk1-f197.google.com with SMTP id
 71dfb90a1353d-5c0f8eedc0cso280180e0c.1
 for <qemu-arm@nongnu.org>; Mon, 27 Jul 2026 07:03:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785160981; x=1785765781;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=KGyk8CRhVzlr+ku+3OiAImhDiNhAIav+Px3QBkWJoKc=;
 b=i8JPGiGmpzqpMkrt24YL7+E8ENo6cjwOC1u3Bx3ohVHjkqr4fhL7olcsYysfHZAjb5
 Xc68KnNl73RQoQUZEPDOPxOLcShF38vXKr6UE1kaNusgR4WwTCYf12iL+EXZRsGU4bCC
 A3+ord14dM+LvV0/8edfmkQLAejfvAeVKnWm/Nvd0WwXgepi/rlRZQwnsC92D/g+2POv
 I1VgibY0PdsywEy8uCAVum1tDxaegKlzaBg0z3kdaVISJElJVB/ZSLjP81yIDUYQoUUu
 9RcFtnZj8Wua/T4fGTzmMOvQEDF0i0qdMAWjQYE0Jfw3Mfp33ghec6b85CxuSzMRj38R
 QyWw==
X-Forwarded-Encrypted: i=1;
 AHgh+RokuK16G+UverDbn+J6Y1hm2f0G55hl9Qx2364tpK9q5PrWjqfC4t6psJqa/wFLc/QMgFvUKwRP1A==@nongnu.org
X-Gm-Message-State: AOJu0YwNzSVsILgn1d+zX1gkXOvvezDCBo6H3PCmCkES8oBtvduERrRi
 qzbx2hOONqZPPzxasiunzp68GCBmXmsvbcNe/t1cEF6WvbDFO3J03kyCwSc8Geycz6DpDcl6Sje
 RdhK23oAa3gxCX4BmTWZBy14l79DZS9OGXe/OjopKCmxMs/9jOK8gsA==
X-Gm-Gg: AR+sD12wUBfmC+GRpzjsAT1fXueMU0gzKc9c425nQCL9W7MxGElqZUExUcZiw0tRMS0
 M3P2Z56PDzsskSsgMSZHDPoqZ8ingFltAPlUMmhnFEh6MfRmJp2VM7wHPvhyX8HTerdex4CTYq3
 PX6y+/UFc+8zzOE7jH5G4m4+4hJ5eXPtb2eKxvWEPuLwqEMPhq6oGTVceuHFYqB/PhbmX1VF1Th
 MOZMcxMMWSxuWHBAWHwxJTZTR+nR+aQlxEgbXI8TpVziuCSXJIq/iHiMBzknbnp1sXGK2ro+1dQ
 iSFzaiQT3jUNNkh/87iYZFYSnNSuJITdTSMtj0sZO/qVvjs/+6dtn8e5CI5PKhfgWVBr8Otk
X-Received: by 2002:a05:6122:3d11:b0:5c0:fb8d:9993 with SMTP id
 71dfb90a1353d-5c3349f9d8dmr364901e0c.0.1785160980633; 
 Mon, 27 Jul 2026 07:03:00 -0700 (PDT)
X-Received: by 2002:a05:6122:3d11:b0:5c0:fb8d:9993 with SMTP id
 71dfb90a1353d-5c3349f9d8dmr364827e0c.0.1785160979880; 
 Mon, 27 Jul 2026 07:02:59 -0700 (PDT)
Received: from x1.local ([2605:8d80:6c21:6818:c87e:c65f:8297:5636])
 by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-5c305745fcesm6313816e0c.17.2026.07.27.07.02.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2026 07:02:59 -0700 (PDT)
Date: Mon, 27 Jul 2026 10:02:55 -0400
From: Peter Xu <peterx@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, mst@redhat.com, philmd@oss.qualcomm.com,
 richard.henderson@linaro.org, alex@shazbot.org, berrange@redhat.com,
 philmd@mailo.com, david@kernel.org, clg@redhat.com,
 pbonzini@redhat.com, phrdina@redhat.com, jugraham@redhat.com,
 liugang24219@sangfor.com.cn, dinghui@sangfor.com.cn, shan.gavin@gmail.com
Subject: Re: [PATCH v4 2/3] system/memory: Use qemu_ram_move() for directly
 accessible regions
Message-ID: <amdlD1kjhPPMLic3@x1.local>
References: <20260727032649.145381-1-gshan@redhat.com>
 <20260727032649.145381-3-gshan@redhat.com>
 <CAFEAcA9_tDRAd97z4UtNhFPK+fMbq37LJhWTSmD5cueo61hvvg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9_tDRAd97z4UtNhFPK+fMbq37LJhWTSmD5cueo61hvvg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Es962zNQvMX_gUUcC3dhB5O4WY8CvJHOHBweowp4X1M_1785160981
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.58,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Mon, Jul 27, 2026 at 01:51:45PM +0100, Peter Maydell wrote:
> I think we could usefully expand this comment, because the reasons
> we need it are not immediately obvious. How about:
> 
> ===begin===
> Move @n bytes from @src to @dst; the memory areas may overlap.
> This provides the same semantics as memmove(), plus an additional
> stronger guarantee: if @n is 1, 2 or 4 or 8 bytes, and @src
> and @dst are both naturally aligned for that access size, and
> the memory areas do not overlap, then both the load and the store
> will be done as a single atomic access (with the semantics of
> qatomic_read() and qatomic_set()).
> 
> This is the underlying function that we use to implement accesses
> by a guest vCPU or a device DMA operation to a ram block. The
> atomic guarantee is needed for two major cases:
>  - when the ram block is backed by a PCI BAR passed through
>    from a host device (and so it might be hardware registers
>    that must be accessed exactly once at the right width)
>  - when an emulated device updates a data structure shared in
>    guest memory with guest software (e.g. a network device's
>    set of tx and rx descriptor blocks), if a write to memory
>    is accidentally performed multiple times then it can break
>    the guest code.

Maybe also append it with "the guest code when it busy polls the guest
memory"; I just found that the polling model isn't something obvious too
when reading it first.

> 
> We don't attempt to perform the exact access when it would
> be unaligned, because this can't necessarily be done on
> all host architectures; although this is strictly speaking
> not doing what would happen on real hardware, we don't think
> there are going to be situations where that matters in practice.

Oh yes, mentioning the unaligned part of discussion would also be nice, I
forgot it when replying.

Thanks,

> ===endit===

-- 
Peter Xu


