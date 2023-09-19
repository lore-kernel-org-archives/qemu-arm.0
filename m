Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp3726934ejb;
        Tue, 19 Sep 2023 09:30:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhNUleovjpAH45PNo0oso2OaTCP5Cdu7xKWW892EDj0COERPfa1md5wTy4JPH20jF3u/UL
X-Received: by 2002:a05:6808:613:b0:3a8:5997:21e3 with SMTP id y19-20020a056808061300b003a8599721e3mr13141161oih.33.1695141043534;
        Tue, 19 Sep 2023 09:30:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695141043; cv=none;
        d=google.com; s=arc-20160816;
        b=QUpg8glodW3NDczE9PEMTJ6+mz6FdPOSZGmu5+h4KMuncxNveCaNzaGa0OYKxY7kGX
         4zsLh4HEN1t7P1YXt/uFUyhIjpFK/PtF4oeo9VaxmcaeJ45uxCw9WbaOeqzzJjoGnTKV
         rZE+P8GcCFPVj1U6Jn7UUzIOJkA2v56ff+rwbWAVvr6uWMQI2eTGglRAXkqfOt8v24Qz
         FRp+zkVY9ZeJJI1ABxz6sgEi96M7dXuyuUgMhFy8JZUT5LcZsDh/e3bGI3Is0bNQfKLE
         WfRkqvy/Elkknv1awOZtFlNrYnGB+TCeWEwuRrOSTQ8OT7L47UC6XyfTUoweFIBSG1/4
         I/2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=KSpyt9yaHxXmhZl+ScKvKwZjGb7cAU2iZGF6XKcSbrY=;
        fh=Itbbu/PWL12vfUV9pSMfONMQCKVHOxT0l/2dhHgmw7U=;
        b=ZbpddQM/KI5dt4g71nrsrxdvs2vXQNV2HU9YgBvinWM533NQ6sOevQLTqvtJd/5Cmg
         Mz2JpEWul8VvJPInNlM5MElKLg6j2w/c3H1723uGOp5CEgbNK46O9VQQ9ua2xYjDITu+
         pGtCCXJSFLXqhSJqjzC7mBM6UWQIQaUNUJnsd/YBhRd0ccNnRzTOp/UCa3ki/hA1vBQU
         G4rYsb20Ubi8ru+9HItTuwc0jIzBD7cD3yuSBOcNxmakyqdmL9UsO3DVrw7WHWeeWtMH
         ZSzYeGUe+bQKM3rlw98eM69JXorA2+gVVmZEOZsQ/Cv4MklHNbf75ygQMq8ypUAFnlEI
         WRXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VapaYdQU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j9-20020ac85c49000000b00403ae750884si7876920qtj.186.2023.09.19.09.30.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Sep 2023 09:30:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VapaYdQU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qidbT-0003Xz-7E; Tue, 19 Sep 2023 12:29:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1qidbR-0003XO-Fd
 for qemu-arm@nongnu.org; Tue, 19 Sep 2023 12:29:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1qidbP-00024z-DB
 for qemu-arm@nongnu.org; Tue, 19 Sep 2023 12:29:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695140970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KSpyt9yaHxXmhZl+ScKvKwZjGb7cAU2iZGF6XKcSbrY=;
 b=VapaYdQUIw7ihfEtheermw6yeaPk76NSF/OlUKMzBWRlnPIs36muCpHa7w5f9XTkjgjhIE
 Hyj0vNGIT69T0M/FvqSIJxRynx3yA4+nokYn/cObNkJJ/0/NubWwPQCmeLsfPRb27AYCOW
 i/ZAUnvVCfyeg4VSqHRpWp+QCLRGcTc=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-68-6WQShHnpMzKo1mFTgBS3ZA-1; Tue, 19 Sep 2023 12:29:29 -0400
X-MC-Unique: 6WQShHnpMzKo1mFTgBS3ZA-1
Received: by mail-io1-f69.google.com with SMTP id
 ca18e2360f4ac-7983537d6c1so493476439f.3
 for <qemu-arm@nongnu.org>; Tue, 19 Sep 2023 09:29:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695140968; x=1695745768;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KSpyt9yaHxXmhZl+ScKvKwZjGb7cAU2iZGF6XKcSbrY=;
 b=BAhKDg4mC3/OpwzlpSVHaet6G52yDYhjQwSPM6iIcf5snW4I3NikP2Xkndrn0+iDZY
 iSdH8fMKjRZgoLvQyVjqB99NiqwE06ZLhlrNGKau2f/4SyTH9D+rfzBlpg6QrudCVZQ0
 a5PgO/l7PpbkMf1VzUnUU5QccVu/5tABdhbc+gWxga6gGzFNcJNfOFdQCylJH0GcSh5E
 AoQpYKIzsT/smM7GHEIld03JdtEhG37spWY+eXUJe+08pX1aBBaLoSTbmcP40OpgMQFO
 RCvpS4cgW1s3qgQNuGgEtODE7WZY8b+Sn3LLoD3J/0xiw7lnRZq8+B1HU3cWSwwKg/ht
 ONvw==
X-Gm-Message-State: AOJu0Yxt3Ky0mH+KOPs518MM/ZRmy4p9kCVoaI0AAfzgoB9UxixQiPZP
 uWT9ui+Zucv+snwtOKJDFxlgwBWY94msZ58cWZ1KKr2SBo/65Ocur7eiPcDRTZ9YbCCyar90hvN
 vhjWxhadmtcLt
X-Received: by 2002:a5d:87c6:0:b0:790:c3d0:8f87 with SMTP id
 q6-20020a5d87c6000000b00790c3d08f87mr356257ios.19.1695140968384; 
 Tue, 19 Sep 2023 09:29:28 -0700 (PDT)
X-Received: by 2002:a5d:87c6:0:b0:790:c3d0:8f87 with SMTP id
 q6-20020a5d87c6000000b00790c3d08f87mr356226ios.19.1695140968053; 
 Tue, 19 Sep 2023 09:29:28 -0700 (PDT)
Received: from redhat.com ([38.15.60.12]) by smtp.gmail.com with ESMTPSA id
 l4-20020a6b7f04000000b007835a305f61sm3301527ioq.36.2023.09.19.09.29.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Sep 2023 09:29:27 -0700 (PDT)
Date: Tue, 19 Sep 2023 10:29:26 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 clg@redhat.com, jean-philippe@linaro.org, mst@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, peterx@redhat.com,
 david@redhat.com, philmd@linaro.org
Subject: Re: [PATCH v2 06/12] range: Introduce range_inverse_array()
Message-ID: <20230919102926.54f92f47.alex.williamson@redhat.com>
In-Reply-To: <20230913080423.523953-7-eric.auger@redhat.com>
References: <20230913080423.523953-1-eric.auger@redhat.com>
 <20230913080423.523953-7-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: KCUls0vzrZjz

On Wed, 13 Sep 2023 10:01:41 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> This helper reverses an array of regions, turning original
> regions into holes and original holes into actual regions,
> covering the whole UINT64_MAX span.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
> ---
> 
> v1 -> v2:
> - Move range_inverse_array description comment in the header
> - Take low/high params
> ---
>  include/qemu/range.h |  8 ++++++++
>  util/range.c         | 45 ++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 53 insertions(+)
> 
> diff --git a/include/qemu/range.h b/include/qemu/range.h
> index 7e2b1cc447..2b59e3bf0c 100644
> --- a/include/qemu/range.h
> +++ b/include/qemu/range.h
> @@ -219,4 +219,12 @@ static inline int ranges_overlap(uint64_t first1, uint64_t len1,
>  
>  GList *range_list_insert(GList *list, Range *data);
>  
> +/*
> + * Inverse an array of sorted ranges over the [low, high] span, ie.
> + * original ranges becomes holes in the newly allocated inv_ranges
> + */
> +void range_inverse_array(uint32_t nr_ranges, Range *ranges,
> +                         uint32_t *nr_inv_ranges, Range **inv_ranges,
> +                         uint64_t low, uint64_t high);
> +
>  #endif
> diff --git a/util/range.c b/util/range.c
> index 098d9d2dc0..4baeb588cc 100644
> --- a/util/range.c
> +++ b/util/range.c
> @@ -70,3 +70,48 @@ GList *range_list_insert(GList *list, Range *data)
>  
>      return list;
>  }
> +
> +void range_inverse_array(uint32_t nr_ranges, Range *ranges,
> +                         uint32_t *nr_inv_ranges, Range **inv_ranges,
> +                         uint64_t low, uint64_t high)

Rare be it for me to suggest GLib, but we already appear to have
range_list_insert() making use of GList for an ordered list of Ranges.
Doesn't this function become a lot easier if we take a sorted GList,
walk it to create the inverse, and return a new GList of the inverted
Ranges?  Seems the initial sorted GList would be created by making use
of the existing range_list_insert() function.  Thanks,

Alex

> +{
> +    Range *resv;
> +    int i = 0, j = 0;
> +
> +    resv = g_malloc0_n(nr_ranges + 1, sizeof(Range));
> +
> +    for (; j < nr_ranges  && (range_upb(&ranges[j]) < low); j++) {
> +        continue; /* skip all ranges below mon */
> +    }
> +
> +    if (j == nr_ranges) {
> +        range_set_bounds(&resv[i++], low, high);
> +        goto realloc;
> +    }
> +
> +    /* first range lob is greater than min, insert a first range */
> +    if (range_lob(&ranges[j]) > low) {
> +        range_set_bounds(&resv[i++], low,
> +                         MIN(range_lob(&ranges[j]) - 1, high));
> +    }
> +
> +    /* insert a range inbetween each original range until we reach max */
> +    for (; j < nr_ranges - 1; j++) {
> +        if (range_lob(&ranges[j]) >= high) {
> +            goto realloc;
> +        }
> +        if (range_compare(&ranges[j], &ranges[j + 1])) {
> +            range_set_bounds(&resv[i++], range_upb(&ranges[j]) + 1,
> +                             MIN(range_lob(&ranges[j + 1]) - 1, high));
> +        }
> +    }
> +    /* last range upb is less than max, insert a last range */
> +    if (range_upb(&ranges[j]) <  high) {
> +        range_set_bounds(&resv[i++],
> +                          range_upb(&ranges[j]) + 1, high);
> +    }
> +realloc:
> +    *nr_inv_ranges = i;
> +    resv = g_realloc(resv, i * sizeof(Range));
> +    *inv_ranges = resv;
> +}

