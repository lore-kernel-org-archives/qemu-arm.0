Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05AB4CA5FD6
	for <qemu-arm@archiver.kernel.org>; Thu,  1 Oct 2026 16:38:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xCJnh-0005Bk-Rr; Thu, 01 Oct 2026 12:38:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1xCJnf-0005As-TM
 for qemu-arm@nongnu.org; Thu, 01 Oct 2026 12:38:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1xCJnd-00020Z-LL
 for qemu-arm@nongnu.org; Thu, 01 Oct 2026 12:38:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1790872704;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u6M9UKb1fxNfsLXR0PSjA271oDVBL/V4De3OzMxeH9Q=;
 b=HaVyZc5u9TUvHgzYvV+gQ9Gcls7KobJyhsm3UifhIVeNRZ0X8QXgopshl7OHA6kCwyPOWC
 vVHl+0rCIdtpdTECUlgz3KkvJ684dTHh8aSZulXYTV+7jxc/DLzxzz/SK6C0DJ4u9tvbPW
 uotjo+6lN19EKYYXTUaSSomb1evhImA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-694-a4SxhrdsN_Sy-gqV8yrzag-1; Thu, 01 Oct 2026 12:38:23 -0400
X-MC-Unique: a4SxhrdsN_Sy-gqV8yrzag-1
X-Mimecast-MFC-AGG-ID: a4SxhrdsN_Sy-gqV8yrzag_1790872702
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4a024bce773so9157395e9.0
 for <qemu-arm@nongnu.org>; Thu, 01 Oct 2026 09:38:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790872702; x=1791477502;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=u6M9UKb1fxNfsLXR0PSjA271oDVBL/V4De3OzMxeH9Q=;
 b=pZX8ZxzFvxNym5LsJStlvDXopOLgJ0lI/zGrdZVKqQQOtrvn5De1gR37ZqEesmXDt1
 xdIauf9pVUSrMW9ssFbmTjNkA9UJcTaSA9vDzbQv3RVgcuCP0gQBczO4HoXYG7N8x3G1
 1raA4gHhMaL8U0Y9QDNSc3h1OiDyn8q0O570LdHHGcsKjHNCUYoaXbuzezkjksfy5tAX
 62hShPZBwwQOLrlf/WEOVbTx+UW3gx3ifxgr7luZxggaiQPwRx1WbXOGuVPVEMHBmXsN
 VrvejTqhvbK5JsxCo0P0knfpRsePJsMABMVK+3pfPpS9YFnPFe1lYdF7hKqLPG4xPLXX
 b3dw==
X-Forwarded-Encrypted: i=1;
 AKwUvByuEvaiqNt2BwcxoHnUWqvkzYTqDqErQPGCjv2kj4KvxtPgIqAdo/yt/y+jPPdoIIEmzarG0EdV3w==@nongnu.org
X-Gm-Message-State: AFuF++lrANswRRS7YBk4Ul63pmKZZeytf6hNDe1WvFMffl/ib5QC9HEu
 x3Ag+NVBw/Fa5vGLSLTvbz8QY3JN3Y6wCF+vOptYlHwvT64HcP6Jb5qyk8TvkOrD81AWY7GzynQ
 ubDZX0GxVB38g/NIBuwa1SpnEDSYsI0/Ax1JtqvYQ2YnZX5WUg7W5TA==
X-Gm-Gg: AYBFou2mkQNBKjXxv09sjm5I5m2tgI4QUcJ8YQ4OPCPLXCFutUyoaGbHbinzjk5UEtb
 nYy9AOVj6nYZCwBluQrwi9qmc9sxD8JO+CiahgqPwamacfFAPhIOT++npHxtiBJ4rUYfSsSCMoa
 UUJz0JilC3z1Ca6RmZyTc7IJXZoBt+gMoltkkee5A3/Tn+5/jlj4hFklu7B1bYtq6BVVYmOm1jb
 oc8MAvY9mnNo48Y/wcEP2lMtrCUucihyuMrz/g4JQzQbVqVk6P1O10lAJeXdUz58F6uKZCoAMxB
 ZZBNERG+6Xx2R15226TXdfV3rYUOXMsRrgfHhPmhgvp8j6ecIFytUsujPOCzd/HxPxSlUml4NFa
 ta6o3VJKmy5H+QBFp7NPSXeYDyG3KMSbAoldOSYEr5f30qGL+
X-Received: by 2002:a05:600c:3e05:b0:4a0:dca:b78 with SMTP id
 5b1f17b1804b1-4a027578502mr3522595e9.27.1790872701831; 
 Thu, 01 Oct 2026 09:38:21 -0700 (PDT)
X-Received: by 2002:a05:600c:3e05:b0:4a0:dca:b78 with SMTP id
 5b1f17b1804b1-4a027578502mr3522295e9.27.1790872701432; 
 Thu, 01 Oct 2026 09:38:21 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48b0690c47dsm7173820f8f.15.2026.10.01.09.38.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Oct 2026 09:38:20 -0700 (PDT)
Message-ID: <9b1fdb01-aa08-4cb3-a476-e644dfb15223@redhat.com>
Date: Thu, 1 Oct 2026 18:38:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 5/7] hw/arm/smmuv3-accel: Restore accelerator state on
 incoming migration
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, nicolinc@nvidia.com, nathanc@nvidia.com,
 mochs@nvidia.com, jan@nvidia.com, jgg@ziepe.ca, ankita@nvidia.com,
 aniketa@nvidia.com, wangzhou1@hisilicon.com, jiangkunkun@huawei.com
References: <20260904180513.248396-1-skolothumtho@nvidia.com>
 <20260904180513.248396-6-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260904180513.248396-6-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XwB8ho8XgFVTL1GzOuPv1i_zYkFFnUnkVH9hgQ3X7KA_1790872702
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.331,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi Shameer,

On 9/4/26 8:05 PM, Shameer Kolothum wrote:
> Extend the accel subsection post_load, after the IDR check, to bring the
> host side back in line. It allocates the vEVENTQ, which the A_CR0 write
> handler normally does, using the restored s->eventq.log2size. It attaches
> the HWPT for the restored GBPA to every device. Then it replays the STEs,
> which overrides that HWPT wherever the guest has a usable entry.
>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>  hw/arm/smmuv3-accel.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
> index 6678e49f6e..b653f3f4ce 100644
> --- a/hw/arm/smmuv3-accel.c
> +++ b/hw/arm/smmuv3-accel.c
> @@ -1165,6 +1165,28 @@ static bool smmuv3_accel_vmstate_post_load(void *opaque, int version_id,
>          return false;
>      }
>  
> +    if (!s->s_accel->viommu) {
> +        return true;
> +    }
> +
> +    /* Normally done by the A_CR0 write handler, which is not replayed. */
> +    if (!smmuv3_accel_alloc_veventq(s, errp)) {
> +        error_prepend(errp, "Failed to restore the vEVENTQ: ");
> +        return false;
> +    }
> +
> +    /* smmuv3/gbpa is listed before this subsection, so it is in place */
> +    if (!smmuv3_accel_attach_gbpa_hwpt(s, errp)) {
> +        error_prepend(errp, "Failed to restore the GBPA HWPT: ");
> +        return false;
> +    }
I would recommend to document the order of operations somewhere, ie.
registers first, data structures in guest RAM and also list all the host
resources that need to be reconstructed

Looks almost too simple :-)

Eric
> +
> +    /* Everything else comes from guest memory, which is already restored. */
> +    if (!smmuv3_accel_replay_stes(s, errp)) {
> +        error_prepend(errp, "Failed to replay the stream table: ");
> +        return false;
> +    }
> +
>      return true;
>  }
>  
Eric


