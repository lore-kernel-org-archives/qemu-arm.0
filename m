Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4FF1C88E6A
	for <qemu-arm@archiver.kernel.org>; Mon, 14 Sep 2026 09:41:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x63BK-0006LA-Cd; Mon, 14 Sep 2026 05:40:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1x63BJ-0006KJ-Hq
 for qemu-arm@nongnu.org; Mon, 14 Sep 2026 05:40:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1x63BH-0001qK-6N
 for qemu-arm@nongnu.org; Mon, 14 Sep 2026 05:40:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1789378853;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KuTD4uLou3S6P+YVvK2ph7DlkjkW8DiH31MVPYP/58s=;
 b=iq6qg/hFp8DoyR4/5bXQe+Uea80Paga6G8p2c2vnIJDFDb5NZee++tY67NUs1CSRuEW9Y0
 jzhaTFZ3eZ/N8KMkSH5laHUBPsKS8q98BF/d46OinWlvQKVu8LAfSo/AUQ49z+vLvrePp5
 MlII8Z5PnYafgneMwb4N8W+k5RBZeis=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-202-hDFG1gy_PiGfQUCrB_Ioxg-1; Mon, 14 Sep 2026 05:40:52 -0400
X-MC-Unique: hDFG1gy_PiGfQUCrB_Ioxg-1
X-Mimecast-MFC-AGG-ID: hDFG1gy_PiGfQUCrB_Ioxg_1789378851
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-c2945f5e851so242621366b.1
 for <qemu-arm@nongnu.org>; Mon, 14 Sep 2026 02:40:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789378851; x=1789983651;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=KuTD4uLou3S6P+YVvK2ph7DlkjkW8DiH31MVPYP/58s=;
 b=JKe+XJVolsi0+TqyxMQrpQYy0xqzc9STC5mNVxOZRvYDZGyrL1+EYIDUF0Hae8O/kA
 5dVX4LVcXh2bz8kmkl48PgfG5R4aKR90nlMZDjNomaR/N7G/Kk+Tmx3O+1VmS+naPAqf
 zH6mJ9nVe6PoL5+8mP1MOgtqruY6DgGjkCDyaiqK//XrNLhPKMwGwNH1Dddhl6vv1TWt
 B53ntsuOedH8nleN+fLevcoHBq0awhxIHqcjYUJvzw/mZZlSnoXlJXxIp+LFntLIFlMM
 sZK86A+x8NcgQviFfH5X4nbSzI4q2aWPTNfuoHBKu1bXyTGQixxbE4i4Ji40MzywSL5T
 CCyQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzkCbpNS0AaCMA+z42hlLBIx6g5OpvLzjN4uDKM+JY9ITeKDHYSailDB9LJ2XbRT2E6nRNXjowJTA==@nongnu.org
X-Gm-Message-State: AFuF++lUp7m6MdUspW0kQwyCogx3BeRkOgQJetC6EGBZTE8De0Jo62Bs
 puVWdIQZBQfwrAclg/xUPTPlWaYraXYfgHQzazi2vKFCkdtwjvUNxJy56FF86wMlKKQNoYkTgzJ
 4PVfGzDwbUyGRgYV9eS5ZIInhojnCrbY1aoCM85lfbvC8AZJkLTDDzw==
X-Gm-Gg: AYBFou3qvLZn+1HFQ/dNzadq/oAy/fuY+dwSslk8qxz75auw8vwtqOT1leV70RGBWC+
 PP8WNmGO5YlXzu5CQ1RsjbWEF6VYOC/o/5KMG2AJVa/7OaXNT6mB+NymD4YqE93oS5GbgC8A9dO
 /xLdgv0KX+Kn+h7jkVS/I8DZen9IRuWD3c76b7neELbpzzTufYbg0cSPNUng/DT9eiHey0qmkDp
 eLs+w1aAlkofP4yy/H8bPvoZE86Pxrd0pOm2t5FDpdG6Irf1NRW4Vs4MIFYnDcF0AG2bNggN/Z7
 cYxxicHuTufTaY0NWHQkMODuUbyUC+a0eBYXaFBRDesTwKdxn/OGmBThLrykQdhDw7snBAs7LGw
 RK+PAfL9nUU4RoihyEIQi1U2d7Fw1eOJCGCZUEAV8FU3SdXDt
X-Received: by 2002:a17:907:6d15:b0:c26:19de:9ad3 with SMTP id
 a640c23a62f3a-c29b874789cmr110764266b.43.1789378850996; 
 Mon, 14 Sep 2026 02:40:50 -0700 (PDT)
X-Received: by 2002:a17:907:6d15:b0:c26:19de:9ad3 with SMTP id
 a640c23a62f3a-c29b874789cmr110761866b.43.1789378850624; 
 Mon, 14 Sep 2026 02:40:50 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c2966066b6asm387939566b.34.2026.09.14.02.40.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Sep 2026 02:40:49 -0700 (PDT)
Message-ID: <b4077c0f-61bc-4619-bf20-ce4992c6bf29@redhat.com>
Date: Mon, 14 Sep 2026 11:40:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/7] hw/arm/smmuv3-accel: Factor out the single vEVENT
 read
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, nicolinc@nvidia.com, nathanc@nvidia.com,
 mochs@nvidia.com, jan@nvidia.com, jgg@ziepe.ca, ankita@nvidia.com,
 aniketa@nvidia.com, wangzhou1@hisilicon.com, jiangkunkun@huawei.com
References: <20260904180513.248396-1-skolothumtho@nvidia.com>
 <20260904180513.248396-2-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260904180513.248396-2-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Pd1L6h346nb3jyXJP395t9cDCcajzanWa7KVCShVSdU_1789378851
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
> Move the body of smmuv3_accel_event_read() into a new helper,
> smmuv3_accel_event_read_one(), that reads one vEVENT and tells the caller
> whether it propagated an event, found the queue empty, or failed.
it is not totally obvious that "queue empty" reason matches EAGAIN/EINTR.
>
> Subsequent patch will make use of the helper to drain the queue.
>
> No functional change intended.
>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>  hw/arm/smmuv3-accel.c | 30 ++++++++++++++++++++----------
>  1 file changed, 20 insertions(+), 10 deletions(-)
>
> diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
> index 91aca1aa14..fc503578f5 100644
> --- a/hw/arm/smmuv3-accel.c
> +++ b/hw/arm/smmuv3-accel.c
> @@ -484,28 +484,38 @@ int smmuv3_accel_event_read_validate(IOMMUFDVeventq *veventq, uint32_t type,
>      return 0;
>  }
>  
> -static void smmuv3_accel_event_read(void *opaque)
> +/*
> + * Read one pending vEVENT and propagate it to the guest event queue.
> + * Returns 0 if an event was propagated, 1 if the queue is drained, -1 on
> + * error with @errp set.
> + */
> +static int smmuv3_accel_event_read_one(SMMUv3State *s, Error **errp)
>  {
> -    SMMUv3State *s = opaque;
>      IOMMUFDVeventq *veventq = s->s_accel->veventq;
>      struct {
>          struct iommufd_vevent_header hdr;
>          struct iommu_vevent_arm_smmuv3 vevent;
>      } buf;
> -    Error *local_err = NULL;
>      int ret;
>  
>      ret = smmuv3_accel_event_read_validate(veventq,
>                                             IOMMU_VEVENTQ_TYPE_ARM_SMMUV3, &buf,
> -                                           sizeof(buf), &local_err);
> -    if (ret < 0) {
> -        warn_report_err_once(local_err);
> -        return;
> -    }
> -    if (ret > 0) {
> -        return; /* EAGAIN/EINTR */
> +                                           sizeof(buf), errp);
> +    if (ret) {
> +        return ret;
>      }
>      smmuv3_propagate_event(s, (Evt *)&buf.vevent);
> +    return 0;
> +}
> +
> +static void smmuv3_accel_event_read(void *opaque)
> +{
> +    SMMUv3State *s = opaque;
> +    Error *local_err = NULL;
> +
> +    if (smmuv3_accel_event_read_one(s, &local_err) < 0) {
> +        warn_report_err_once(local_err);
> +    }
>  }
>  
>  static void smmuv3_accel_free_veventq(SMMUv3AccelState *accel)
Otherwise looks good to me

Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric




