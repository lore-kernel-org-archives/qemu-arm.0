Received: by 2002:a17:906:5293:b0:9ae:5796:d6c1 with SMTP id c19csp116885ejm;
        Wed, 20 Sep 2023 13:02:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0y7C1DDX4razdx2kg8qWb5U37N1farq3cdDjtPycZYwYE/v949B7rWyZpuDBasFcUazl0
X-Received: by 2002:a0c:c252:0:b0:655:f15c:ff47 with SMTP id w18-20020a0cc252000000b00655f15cff47mr3237647qvh.34.1695240159465;
        Wed, 20 Sep 2023 13:02:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695240159; cv=none;
        d=google.com; s=arc-20160816;
        b=SZBPrlvzJ16NNTPsmvcczpKL77OsvcSYbot8erAztW1WbDmyNhdoRzzUcNKhI+U2LL
         4whxSZ2wSbBygAUgioQgzNj68IQGfaQ/MRO7l0Zulymg1ta6Kdnr6KPCfkXdbhcB6qLu
         rLJyuTWVaGnsGDMV9f0mRna08fl86yCJzLQZNmF2839mnD8mf+xyKCjBEDHJDfP0daol
         mYT+0mW/tA79i+fkyVArjaD18ipWzTIZU8UT+HFE58YaJ4VJrDEyjOll2uvKIzkCytM8
         aGb0n6rA/9XZdr7tkPimTu7sPBPATUVnJTUWyZdSGKSppX0slA6l/6SIRl43JEWkWfmG
         /H2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=HdkPKDMQnIDj/BimLpBdN6Wa9HtIgeClHrRjuXDYx6s=;
        fh=Itbbu/PWL12vfUV9pSMfONMQCKVHOxT0l/2dhHgmw7U=;
        b=SQ8T/sgdq+uCbt/YjLNL7ndbQd/ipeTcP62gHE3yoBlQ+MgowShF7VllZicsryyP2Q
         ZXOToz65g8m0Y/ucIBFGqjxdtaA83TXNdYKmibGF/BQikExsj+SvSJqFBUHdIhKqqrqa
         c1oFQ7vyKZKIj9kx9SenfdEFqFtfAj3xckVdih7c+MubwQe8nKkrJR14Q1lxr1Td3IkO
         WwS3FeAK2AYHmSi7uWrdCW41R+9EaIx6y6gNNTGZPv70oenF0qmVR3GugCPehqHZEKuQ
         mH51mP9g+hHXhiWLZxLbmTI96lYa0LUT0pH6wJU+CCEK7McVHmvNhIluvDB3h3OaFO3s
         prgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IWcADbWH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id sk1-20020a05620a3a4100b0076d91fbfaebsi9270245qkn.212.2023.09.20.13.02.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Sep 2023 13:02:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IWcADbWH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qj3Ou-0002fY-0T; Wed, 20 Sep 2023 16:02:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1qj3Os-0002ey-27
 for qemu-arm@nongnu.org; Wed, 20 Sep 2023 16:02:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1qj3Oq-0002PI-2k
 for qemu-arm@nongnu.org; Wed, 20 Sep 2023 16:02:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695240132;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HdkPKDMQnIDj/BimLpBdN6Wa9HtIgeClHrRjuXDYx6s=;
 b=IWcADbWH+idlZCO1gBTJ0SRK5x3F8aSZ/+yhaJ34L9Xbtsc2mxKjaWvSBF8VcYzSNPo9IJ
 HLWhjwq/FvZjxXxkzkaRxQnbyp69cHgTsggeVtjwy3SWhrWW+OgN1/LNdU57XFo/A7cQ20
 itFf9A1/VeOKvNxf4qK/62u0lX0JaSw=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-527-NsGpbRtvPquWZSZBZvhubg-1; Wed, 20 Sep 2023 16:02:11 -0400
X-MC-Unique: NsGpbRtvPquWZSZBZvhubg-1
Received: by mail-io1-f69.google.com with SMTP id
 ca18e2360f4ac-7907f181babso16444139f.2
 for <qemu-arm@nongnu.org>; Wed, 20 Sep 2023 13:02:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695240129; x=1695844929;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HdkPKDMQnIDj/BimLpBdN6Wa9HtIgeClHrRjuXDYx6s=;
 b=wFs3D5G1c3Z/Tl6qrnuFd5qHs+feKmgli5up8kNPHW7dz6xvxousnVyS85AGFwPPyj
 xqeLiRzES74F63SXEaNt0+sEiS1B20RENOq93nB9XyxJa5vWc2Vcf9qSQYY2z96eNZ4N
 P9B+nil4LKbC3YpGJPpV/2vs2KHRB7KMqP9trpYoYVsjLJ/cg1cKTfmeIxWgQOqhM9mk
 kgVKHLR5FMUoUWOo8VOxNnO9dL24IGLGIm4ukd/7gVqP57FnJNU0lTomRczOWKtB92MB
 Q2rFDCAy84ZsFDJ2ZC6uh8CcTa23OfMcA7DYlYLudQn+sphF2e355eI848+Uxqk9R5iQ
 2SAg==
X-Gm-Message-State: AOJu0YzWISorifOHdfFrTuTjkNTEM2gnYueFyo3D0rYcqbc8lxXp+pcL
 jexig7ps1B67FTlqFv7D7teuNtVhftCODKjLs89UhjRXKqtlwb7lon7gdSJYs5Ar2VrEYuWNrST
 r320HZH60fU/j
X-Received: by 2002:a5e:d510:0:b0:794:d7e8:d239 with SMTP id
 e16-20020a5ed510000000b00794d7e8d239mr4184640iom.17.1695240129298; 
 Wed, 20 Sep 2023 13:02:09 -0700 (PDT)
X-Received: by 2002:a5e:d510:0:b0:794:d7e8:d239 with SMTP id
 e16-20020a5ed510000000b00794d7e8d239mr4184617iom.17.1695240129037; 
 Wed, 20 Sep 2023 13:02:09 -0700 (PDT)
Received: from redhat.com ([38.15.60.12]) by smtp.gmail.com with ESMTPSA id
 c22-20020a02c9d6000000b0042b255d46c1sm4342563jap.11.2023.09.20.13.02.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Sep 2023 13:02:08 -0700 (PDT)
Date: Wed, 20 Sep 2023 14:02:06 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 clg@redhat.com, jean-philippe@linaro.org, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, peterx@redhat.com,
 david@redhat.com, philmd@linaro.org
Subject: Re: [PATCH v2 12/12] vfio: Remove 64-bit IOVA address space assumption
Message-ID: <20230920140206.6de4964c.alex.williamson@redhat.com>
In-Reply-To: <20230913080423.523953-13-eric.auger@redhat.com>
References: <20230913080423.523953-1-eric.auger@redhat.com>
 <20230913080423.523953-13-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ivwplHAi8Djx

On Wed, 13 Sep 2023 10:01:47 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> Now we retrieve the usable IOVA ranges from the host,
> we now the physical IOMMU aperture and we can remove
> the assumption of 64b IOVA space when calling
> vfio_host_win_add().
> 
> This works fine in general but in case of an IOMMU memory
> region this becomes more tricky. For instance the virtio-iommu
> MR has a 64b aperture by default. If the physical IOMMU has a
> smaller aperture (typically the case for VTD), this means we
> would need to resize the IOMMU MR when this latter is linked
> to a container. However this happens on vfio_listener_region_add()
> when calling the IOMMU MR set_iova_ranges() callback and this
> would mean we would have a recursive call the
> vfio_listener_region_add(). This looks like a wrong usage of
> the memory API causing duplicate IOMMU MR notifier registration
> for instance.
> 
> Until we find a better solution, make sure the vfio_find_hostwin()
> is not called anymore for IOMMU region.

Thanks for your encouragement to double check this, it does seem like
there are some gaps in the host window support.  First I guess I don't
understand why the last chunk here assumes a contiguous range.
Shouldn't we call vfio_host_win_add() for each IOVA range?

But then we have a problem that we don't necessarily get positive
feedback from memory_region_iommu_set_iova_ranges().  Did the vIOMMU
accept the ranges or not?  Only one vIOMMU implements the callback.
Should we only call memory_region_iommu_set_iova_ranges() if the range
doesn't align to a host window and should the wrapper return -ENOTSUP
if there is no vIOMMU support to poke holes in the range?  Thanks,

Alex

 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
> ---
> 
> I have not found any working solution to the IOMMU MR resizing.
> So I can remove this patch or remove the check for IOMMU MR. Maybe
> this is an issue which can be handled separately?
> ---
>  hw/vfio/common.c | 25 ++++++++++++-------------
>  1 file changed, 12 insertions(+), 13 deletions(-)
> 
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 26da38de05..40cac1ca91 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -1112,13 +1112,6 @@ static void vfio_listener_region_add(MemoryListener *listener,
>  #endif
>      }
>  
> -    hostwin = vfio_find_hostwin(container, iova, end);
> -    if (!hostwin) {
> -        error_setg(&err, "Container %p can't map guest IOVA region"
> -                   " 0x%"HWADDR_PRIx"..0x%"HWADDR_PRIx, container, iova, end);
> -        goto fail;
> -    }
> -
>      memory_region_ref(section->mr);
>  
>      if (memory_region_is_iommu(section->mr)) {
> @@ -1177,6 +1170,14 @@ static void vfio_listener_region_add(MemoryListener *listener,
>          return;
>      }
>  
> +    hostwin = vfio_find_hostwin(container, iova, end);
> +    if (!hostwin) {
> +        error_setg(&err, "Container %p can't map guest IOVA region"
> +                   " 0x%"HWADDR_PRIx"..0x%"HWADDR_PRIx, container, iova, end);
> +        goto fail;
> +    }
> +
> +
>      /* Here we assume that memory_region_is_ram(section->mr)==true */
>  
>      /*
> @@ -2594,12 +2595,10 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
>          vfio_get_iommu_info_migration(container, info);
>          g_free(info);
>  
> -        /*
> -         * FIXME: We should parse VFIO_IOMMU_TYPE1_INFO_CAP_IOVA_RANGE
> -         * information to get the actual window extent rather than assume
> -         * a 64-bit IOVA address space.
> -         */
> -        vfio_host_win_add(container, 0, (hwaddr)-1, container->pgsizes);
> +        g_assert(container->nr_iovas);
> +        vfio_host_win_add(container, 0,
> +                          container->iova_ranges[container->nr_iovas - 1].end,
> +                          container->pgsizes);
>  
>          break;
>      }

