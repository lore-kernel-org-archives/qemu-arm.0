Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp2370401wrp;
        Mon, 23 Sep 2019 00:52:23 -0700 (PDT)
X-Google-Smtp-Source: APXvYqziWO8yoiLYVQxZu9X7OCXhAAUohWWgNu0XvfV/K71NQiYnx03RGoGzLiYTyj9ZZMpwdVAE
X-Received: by 2002:a50:d949:: with SMTP id u9mr35334501edj.142.1569225143934;
        Mon, 23 Sep 2019 00:52:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569225143; cv=none;
        d=google.com; s=arc-20160816;
        b=vvm8eozs1ptJQAeDeyeZ5xNnoBlRYG1d/weMmZbLvbDR+lpzIQAowkTZmLu3RX/VJs
         8mQsJ6LSGvl7ZeAa5FGX3Mb9bB7lG4tJuB+9easir8J2ROgfmF0j1fKgoxYY3Jknzgnw
         2prdXOD63GEqp8wz2oZlttwbUgjDveVJr1POUaV05ytmP1dIB6/mHpFAzqr9my5b5qUt
         td7+kg9X3+X/fayRwbPvt0kf6vdlOb33tzIbqtqBolSUMneLTgzz+mkjwCKOxhHsvvWh
         2cOYVOUl6iFQSqkVouoxNdvXptcgxdVIAq9WTAnllthrDSoTgnTlppdU5ykPsB/1Bdn6
         8j7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:to
         :from:date;
        bh=2KHR6grQZPL+uRIV+RciTzr2SmWByfcvlOMO4fzlyeE=;
        b=xhT3oWGyzjWsOoZetp6OdCqEWOzrisYNgbyLVHW0O+U53O0ZA/eT7PY6GAnJcs7w7k
         s1fp/74zAmwzAKb6wZANk7R7A/PUCV9mp0p2bTq8xeIrMayEOggNQNPcAUMw/RzIz9vO
         W+533Uf/jgQfky0wyxzc2Unh+FBfQbpWCCaq9sBabnrVb3BmfWMy3X4ft8k2JGxM619W
         rGnlDU1ZUj9OrA6IVfwF69Mpp8kJvOBkZFDI5eocCjQu6ejt/KfebmsVVGys/IGqkfNM
         iL7yMENHUF0viA1rikDHeYIyNagMuk9z9cf+y8Z362pPfDv7/ejyZIlQTSV2llbiXx32
         kGJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ci21si4593739ejb.320.2019.09.23.00.52.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Sep 2019 00:52:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iCJ8w-0005g9-VD
	for alex.bennee@linaro.org; Mon, 23 Sep 2019 03:52:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40353)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peterx@redhat.com>) id 1iCJ8f-0005fv-5j
 for qemu-arm@nongnu.org; Mon, 23 Sep 2019 03:52:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peterx@redhat.com>) id 1iCJ8b-0004b4-UB
 for qemu-arm@nongnu.org; Mon, 23 Sep 2019 03:52:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53670)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <peterx@redhat.com>) id 1iCJ8b-0004a6-Jr
 for qemu-arm@nongnu.org; Mon, 23 Sep 2019 03:52:01 -0400
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 46A022A09DD
 for <qemu-arm@nongnu.org>; Mon, 23 Sep 2019 07:51:59 +0000 (UTC)
Received: by mail-pg1-f197.google.com with SMTP id b18so8840815pgg.8
 for <qemu-arm@nongnu.org>; Mon, 23 Sep 2019 00:51:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=2KHR6grQZPL+uRIV+RciTzr2SmWByfcvlOMO4fzlyeE=;
 b=G4Uop/A+ww+mBL5DdZDK/isurzApgy48i//I5XKboYixWS4TZRCobuxm4vexGC62Is
 lfVGk0Hirw8dpeFIGbiyZdrbTf6eGe6uxcHThL9jrQNclUMZnlK0CXEDlq/ZvIehZZEp
 tF3I8DQuECwnbVmZ5d0ZFONKb8jMxURLEVb46YN9Ng4ZSVOa3dpivsTKzG8GnT21BLJk
 RTNUrBfJd0XMXsRIPzh7R3wDYwriAUfv5mHTj1Zx7loVnV81PV73EK/oZEKwCqGc+vPn
 ATH4VTycCdTy5szLFLckezMbMvFCuIHoG22OPrsyViDJlBO2gNs8nDb4zOfBBmkjmRyp
 EG2w==
X-Gm-Message-State: APjAAAUi6lHcp83zw1WetpL76uGGTef0mVZvcdrFsOspVFx041xELxt6
 tKjB1w8PjGklNJXf6/PZK7wSDYEHk19d+oNZNydwnqsqe3WbDbuMh4JaP/TUc6FnL3pf2yzwnY9
 mG6mflyl0tARQ
X-Received: by 2002:a17:902:ab90:: with SMTP id
 f16mr14983926plr.191.1569225118825; 
 Mon, 23 Sep 2019 00:51:58 -0700 (PDT)
X-Received: by 2002:a17:902:ab90:: with SMTP id
 f16mr14983902plr.191.1569225118478; 
 Mon, 23 Sep 2019 00:51:58 -0700 (PDT)
Received: from xz-x1 ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id s18sm6157170pji.30.2019.09.23.00.51.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2019 00:51:57 -0700 (PDT)
Date: Mon, 23 Sep 2019 15:51:45 +0800
From: Peter Xu <peterx@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v3 1/2] vfio: Turn the container error into an Error handle
Message-ID: <20190923075145.GA12806@xz-x1>
References: <20190923065552.10602-1-eric.auger@redhat.com>
 <20190923065552.10602-2-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190923065552.10602-2-eric.auger@redhat.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
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
Cc: peter.maydell@linaro.org, mst@redhat.com, aik@ozlabs.ru,
 qemu-devel@nongnu.org, alex.williamson@redhat.com, qemu-arm@nongnu.org,
 pbonzini@redhat.com, david@gibson.dropbear.id.au, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: w+OCwR5L/FTe

On Mon, Sep 23, 2019 at 08:55:51AM +0200, Eric Auger wrote:
> The container error integer field is currently used to store
> the first error potentially encountered during any
> vfio_listener_region_add() call. However this fails to propagate
> detailed error messages up to the vfio_connect_container caller.
> Instead of using an integer, let's use an Error handle.
> 
> Messages are slightly reworded to accomodate the propagation.

Thanks for working on this.  Mostly good at least to me, though I
still have a few nitpickings below.

> @@ -543,6 +545,9 @@ static void vfio_listener_region_add(MemoryListener *listener,
>                                 hostwin->max_iova - hostwin->min_iova + 1,
>                                 section->offset_within_address_space,
>                                 int128_get64(section->size))) {
> +                error_setg(&err, "Overlap with existing IOMMU range "
> +                                 "[0x%"PRIx64",0x%"PRIx64"]", hostwin->min_iova,
> +                                 hostwin->max_iova - hostwin->min_iova + 1);
>                  ret = -1;

This line seems to be useless now after we dropped the integer version
of container->error and start to use Error*.

>                  goto fail;
>              }
> @@ -550,6 +555,7 @@ static void vfio_listener_region_add(MemoryListener *listener,
>  
>          ret = vfio_spapr_create_window(container, section, &pgsize);
>          if (ret) {
> +            error_setg_errno(&err, -ret, "Failed to create SPAPR window");
>              goto fail;
>          }
>  
> @@ -559,7 +565,7 @@ static void vfio_listener_region_add(MemoryListener *listener,
>  #ifdef CONFIG_KVM
>          if (kvm_enabled()) {
>              VFIOGroup *group;
> -            IOMMUMemoryRegion *iommu_mr = IOMMU_MEMORY_REGION(section->mr);
> +            IOMMUMemoryRegion *iommu_mr = IOMMU_MEMORY_REGION(mr);
>              struct kvm_vfio_spapr_tce param;
>              struct kvm_device_attr attr = {
>                  .group = KVM_DEV_VFIO_GROUP,
> @@ -594,18 +600,17 @@ static void vfio_listener_region_add(MemoryListener *listener,
>      }
>  
>      if (!hostwin_found) {
> -        error_report("vfio: IOMMU container %p can't map guest IOVA region"
> -                     " 0x%"HWADDR_PRIx"..0x%"HWADDR_PRIx,
> -                     container, iova, end);
> +        error_setg(&err, "Container %p can't map guest IOVA region"
> +                   " 0x%"HWADDR_PRIx"..0x%"HWADDR_PRIx, container, iova, end);
>          ret = -EFAULT;

Same here.

>          goto fail;
>      }

[...]

> @@ -688,10 +694,14 @@ fail:
>       */
>      if (!container->initialized) {
>          if (!container->error) {
> -            container->error = ret;
> +            error_propagate_prepend(&container->error, err,
> +                                    "Region %s: ", memory_region_name(mr));
> +        } else {
> +            error_free(err);
>          }
>      } else {
> -        hw_error("vfio: DMA mapping failed, unable to continue");
> +        error_reportf_err(err,
> +                          "vfio: DMA mapping failed, unable to continue: ");

Probably need to keep hw_error() because it asserts inside.  Maybe an
error_report_err() before hw_error()?

>      }
>  }
>  
> @@ -1251,6 +1261,7 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
>      container = g_malloc0(sizeof(*container));
>      container->space = space;
>      container->fd = fd;
> +    container->error = NULL;
>      QLIST_INIT(&container->giommu_list);
>      QLIST_INIT(&container->hostwin_list);
>  
> @@ -1308,9 +1319,9 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
>                                       &address_space_memory);
>              if (container->error) {
>                  memory_listener_unregister(&container->prereg_listener);
> -                ret = container->error;
> -                error_setg(errp,
> -                    "RAM memory listener initialization failed for container");
> +                ret = -1;
> +                error_propagate_prepend(errp, container->error,
> +                    "RAM memory listener initialization failed: ");

(I saw that we've got plenty of prepended prefixes for an error
 messages.  For me I'll disgard quite a few of them because the errors
 will directly be delivered to the top level user, but this might be
 too personal as a comment)

Thanks,

>                  goto free_container_exit;
>              }
>          }

-- 
Peter Xu
