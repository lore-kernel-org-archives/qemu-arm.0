Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp938990njm;
        Wed, 5 Mar 2025 08:56:45 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWKsPetayN2OESDhgYdiGeX8zxxjTpTo1jpraJ3jYFiV+LJUmNZ/xjM4oonPZN4848wgnlXdiVfyxbygg==@linaro.org
X-Google-Smtp-Source: AGHT+IEeDlkd0Fsayls1DEZ1M8kr0H0TIroXrXSy/THNqpajegIl3qvGk9xy6szakkUeVoO/mgT7
X-Received: by 2002:a05:620a:688f:b0:7c3:d677:dcd2 with SMTP id af79cd13be357-7c3d8e67848mr615608585a.51.1741193805369;
        Wed, 05 Mar 2025 08:56:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741193805; cv=none;
        d=google.com; s=arc-20240605;
        b=bFVQP7g927FNaU8CA0GP0+r36iwSg763h8E2kLlO6bMJtrsXIZUrJBJ2/WiM2rO/yu
         FPH6lAv9D1RmeRPEk67EVRp+nJ3p4qELB5hzm+3tv0nLqLDCZHIAUmU70OtcMY/uRzTz
         39BU/3w6kBw6z2IMWXt3Oi4vcFodxndykPpqCkPtDFhKM43mKyiwwAbB5eeihqflVt1B
         dY8pqWAHgId9UbS1VwNegaT4YlToqJiKJ11qAefJw+LWTNYE+d94u1xpjEVWZ7utX/2W
         BCDTeFTWc8PMNJqHs3/ycwEe7hAoYL+AeO39kvh2xrrjlxJ3l4hymBcYShrFuVYYyZm5
         vVmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Ro/uAiz8KrtRiLEIDDBY59Jsc1UsZOMUjifs8ibsjpo=;
        fh=uJsycak+s1p+kNOdmKS4SKBZ4mqTITuD6RZi4KhioMc=;
        b=YQkKzGV/vLy2F3+KeGias8FavvjrQ79JWVD0q+9VU5ZPPqEkPqHuF5MOvOieP05cqW
         jirawaSh5T8qrh5lEyfPMiXY7XGbbj74v+BDAodWmz82lpBAE0oPMZMDzQbUgqhL75QI
         tfk8e1xSXKrxEtYw9bWvVMbrRD+rdg1vqSfKqnO2LJ8MAqkl0E5h32kD9PFOaQ16bR53
         XHDyKaQ6oFEZyBgurSOnHgkWblO1S0eo2RZ0Gz+oZP64mZ8vggLFwoEvJbFJzcp56xKx
         SJzxvbtUdy1jGtUV+tjx2mf2l/QHVt729tLVxQSZRVguZ7ZuQvJe53ViyOymVORt7HP+
         IMMw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QfiqfETg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c3b68d2de3si676448485a.248.2025.03.05.08.56.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Mar 2025 08:56:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QfiqfETg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tps2p-00039g-HG; Wed, 05 Mar 2025 11:56:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tps2n-00039D-JE
 for qemu-arm@nongnu.org; Wed, 05 Mar 2025 11:56:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1tps2l-0006kc-JK
 for qemu-arm@nongnu.org; Wed, 05 Mar 2025 11:56:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741193786;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ro/uAiz8KrtRiLEIDDBY59Jsc1UsZOMUjifs8ibsjpo=;
 b=QfiqfETgH/mTJw+g2CXq8dDL18vUw4aE1o1EUpTL6A9PubaQHBsU2dyqVyK1v1+cbbET+H
 xy2CtknvfE+EFxu4Z+V2d4SzwLwXDzIzozs8dxUD/rXbBO4ZCyo7qkPg/0OQTqgyXfw8tz
 KRt3bpYGYQ+cSYkCFP9mJuBeB2nmJZg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-218-G3HXrOleNkmbEFgRpwM3Hw-1; Wed, 05 Mar 2025 11:56:20 -0500
X-MC-Unique: G3HXrOleNkmbEFgRpwM3Hw-1
X-Mimecast-MFC-AGG-ID: G3HXrOleNkmbEFgRpwM3Hw_1741193779
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-390fc428a45so1834577f8f.0
 for <qemu-arm@nongnu.org>; Wed, 05 Mar 2025 08:56:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741193779; x=1741798579;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ro/uAiz8KrtRiLEIDDBY59Jsc1UsZOMUjifs8ibsjpo=;
 b=fUZQnsS1f0bonbldYl7ysW4ZjMxaP/WXOYVq+LyWyKr53pF+U7X+05S4hI35WqutFW
 lkVhcDtdQTAVASWgi52L2Nk7v+Lt5LB7fIa7Ahp9nfNrDV7o64oWJ8JZugtFgPnzLpP5
 cQM2XeSohvp1FedlS/hW+iafrWAv+4Nv6i8DvzQ/ALuIvi7GAs9jS/qc3X6DNMwy7NwT
 YKhgoMWZ3+a7FdeZ/N8+UK6c3iieB6fKiunJeE+m8VRenWX5eLRtvtQYnVa25jLNcjc3
 Tlp2pKu44e17JeoBPrv0Kwh19+B75PzlYxDJpn+nDpSSaTJa3LfFTBZlUhL9V/D0+l4/
 csbg==
X-Gm-Message-State: AOJu0Ywvm7g1hrjl9d1kQQikA5cpzT5v8vYaxRNMP6pKzZUotAZqIfyw
 ckaSIfRGsgIOU4Oh9hh48aBUscA82J+OmrRNDjKTVUlfxJqextuax6qCYeMNX3jI7xvPpzLKgMu
 MY+eagA9HI6l/6Ru/fYrNwTXvEiky1eJmjprYLWC5Ka7jF3xOvg==
X-Gm-Gg: ASbGnctmeOYIRPjouzprYbeMvLtigs/DL7P8+186l1og82bymfLfZ8WP51JPVM3b19f
 lsMuOUxQNn9VNf/wx7mn2vo6Ka0+W2YuM39nyPO0rEXZ1BmSvC86lHHYZ3mEmZqC4oM+gPd2hvY
 ODmB57njbsMZkr9kaXHH6NakwMafcEt4h6qrf1Rw0eEj04Kq6JGUpeqC9STGqKgJwSET2LA6EAl
 5uE1v/Qtvt7oaa9N6sWZUV7DhrML8abBpubNrt6rxK5llIDuzryb5M8p7/f28JfwWXxhN/X8kkb
 MSa+DRrpH73gldmtZsGxdfGv3vaVbKSwFUZTk92+9yUQr0AJV0sUTvDj3iLq/Ps=
X-Received: by 2002:a5d:6d8a:0:b0:391:1f9:c599 with SMTP id
 ffacd0b85a97d-3911f726350mr2699721f8f.4.1741193778912; 
 Wed, 05 Mar 2025 08:56:18 -0800 (PST)
X-Received: by 2002:a5d:6d8a:0:b0:391:1f9:c599 with SMTP id
 ffacd0b85a97d-3911f726350mr2699704f8f.4.1741193778536; 
 Wed, 05 Mar 2025 08:56:18 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bd4292eeasm22539525e9.16.2025.03.05.08.56.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Mar 2025 08:56:17 -0800 (PST)
Message-ID: <a55764ff-5e44-4057-af0f-3beb9ae1c0c1@redhat.com>
Date: Wed, 5 Mar 2025 17:56:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] hw/arm/smmu: Introduce smmu_configs_inv_sid_range()
 helper
To: JianChunfu <jansef.jian@hj-micro.com>, peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20250228031438.3916-1-jansef.jian@hj-micro.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250228031438.3916-1-jansef.jian@hj-micro.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DG0lGDhQ0abt_go6lbHvTsF4fGGD7h9wARrlBLB4zoI_1741193779
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: lOEzU2/wSI/f


Hi,

On 2/28/25 4:14 AM, JianChunfu wrote:
> Use a similar terminology smmu_hash_remove_by_sid_range() as the one
> being used for other hash table matching functions since
> smmuv3_invalidate_ste() name is not self explanatory, and introduce a
> helper that invokes the g_hash_table_foreach_remove.
>
> No functional change intended.
>
> Signed-off-by: JianChunfu <jansef.jian@hj-micro.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
> ---
> v3: - Modify the commit msg
>     - Rename the trace funtion
> v2: - move smmuv3_invalidate_ste() to smmu_hash_remove_by_sid_range()
>     - add function smmu_configs_inv_sid_range()
> v1: - Rename smmuv3_invalidate_ste to smmuv3_hash_remove_by_sid_range
> ---
>  hw/arm/smmu-common.c         | 21 +++++++++++++++++++++
>  hw/arm/smmu-internal.h       |  5 -----
>  hw/arm/smmuv3.c              | 19 ++-----------------
>  hw/arm/trace-events          |  3 ++-
>  include/hw/arm/smmu-common.h |  6 ++++++
>  5 files changed, 31 insertions(+), 23 deletions(-)
>
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index 3f8272875..bad3b3b0b 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -225,6 +225,27 @@ static gboolean smmu_hash_remove_by_vmid_ipa(gpointer key, gpointer value,
>             ((entry->iova & ~info->mask) == info->iova);
>  }
>  
> +static gboolean
> +smmu_hash_remove_by_sid_range(gpointer key, gpointer value, gpointer user_data)
> +{
> +    SMMUDevice *sdev = (SMMUDevice *)key;
> +    uint32_t sid = smmu_get_sid(sdev);
> +    SMMUSIDRange *sid_range = (SMMUSIDRange *)user_data;
> +
> +    if (sid < sid_range->start || sid > sid_range->end) {
> +        return false;
> +    }
> +    trace_smmu_config_cache_inv(sid);
> +    return true;
> +}
> +
> +void smmu_configs_inv_sid_range(SMMUState *s, SMMUSIDRange sid_range)
> +{
> +    trace_smmu_configs_inv_sid_range(sid_range.start, sid_range.end);
> +    g_hash_table_foreach_remove(s->configs, smmu_hash_remove_by_sid_range,
> +                                &sid_range);
> +}
> +
>  void smmu_iotlb_inv_iova(SMMUState *s, int asid, int vmid, dma_addr_t iova,
>                           uint8_t tg, uint64_t num_pages, uint8_t ttl)
>  {
> diff --git a/hw/arm/smmu-internal.h b/hw/arm/smmu-internal.h
> index 843bebb18..d143d296f 100644
> --- a/hw/arm/smmu-internal.h
> +++ b/hw/arm/smmu-internal.h
> @@ -141,9 +141,4 @@ typedef struct SMMUIOTLBPageInvInfo {
>      uint64_t mask;
>  } SMMUIOTLBPageInvInfo;
>  
> -typedef struct SMMUSIDRange {
> -    uint32_t start;
> -    uint32_t end;
> -} SMMUSIDRange;
> -
>  #endif
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 4c49b5a88..1c55bc56d 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -903,7 +903,7 @@ static void smmuv3_flush_config(SMMUDevice *sdev)
>      SMMUv3State *s = sdev->smmu;
>      SMMUState *bc = &s->smmu_state;
>  
> -    trace_smmuv3_config_cache_inv(smmu_get_sid(sdev));
> +    trace_smmu_config_cache_inv(smmu_get_sid(sdev));
>      g_hash_table_remove(bc->configs, sdev);
>  }
>  
> @@ -1277,20 +1277,6 @@ static void smmuv3_range_inval(SMMUState *s, Cmd *cmd, SMMUStage stage)
>      }
>  }
>  
> -static gboolean
> -smmuv3_invalidate_ste(gpointer key, gpointer value, gpointer user_data)
> -{
> -    SMMUDevice *sdev = (SMMUDevice *)key;
> -    uint32_t sid = smmu_get_sid(sdev);
> -    SMMUSIDRange *sid_range = (SMMUSIDRange *)user_data;
> -
> -    if (sid < sid_range->start || sid > sid_range->end) {
> -        return false;
> -    }
> -    trace_smmuv3_config_cache_inv(sid);
> -    return true;
> -}
> -
>  static int smmuv3_cmdq_consume(SMMUv3State *s)
>  {
>      SMMUState *bs = ARM_SMMU(s);
> @@ -1373,8 +1359,7 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
>              sid_range.end = sid_range.start + mask;
>  
>              trace_smmuv3_cmdq_cfgi_ste_range(sid_range.start, sid_range.end);
> -            g_hash_table_foreach_remove(bs->configs, smmuv3_invalidate_ste,
> -                                        &sid_range);
> +            smmu_configs_inv_sid_range(bs, sid_range);
>              break;
>          }
>          case SMMU_CMD_CFGI_CD:
> diff --git a/hw/arm/trace-events b/hw/arm/trace-events
> index c64ad344b..e96f9ae47 100644
> --- a/hw/arm/trace-events
> +++ b/hw/arm/trace-events
> @@ -15,6 +15,8 @@ smmu_iotlb_inv_asid_vmid(int asid, int vmid) "IOTLB invalidate asid=%d vmid=%d"
>  smmu_iotlb_inv_vmid(int vmid) "IOTLB invalidate vmid=%d"
>  smmu_iotlb_inv_vmid_s1(int vmid) "IOTLB invalidate vmid=%d"
>  smmu_iotlb_inv_iova(int asid, uint64_t addr) "IOTLB invalidate asid=%d addr=0x%"PRIx64
> +smmu_configs_inv_sid_range(uint32_t start, uint32_t end) "Config cache INV SID range from 0x%x to 0x%x"
> +smmu_config_cache_inv(uint32_t sid) "Config cache INV for sid=0x%x"
>  smmu_inv_notifiers_mr(const char *name) "iommu mr=%s"
>  smmu_iotlb_lookup_hit(int asid, int vmid, uint64_t addr, uint32_t hit, uint32_t miss, uint32_t p) "IOTLB cache HIT asid=%d vmid=%d addr=0x%"PRIx64" hit=%d miss=%d hit rate=%d"
>  smmu_iotlb_lookup_miss(int asid, int vmid, uint64_t addr, uint32_t hit, uint32_t miss, uint32_t p) "IOTLB cache MISS asid=%d vmid=%d addr=0x%"PRIx64" hit=%d miss=%d hit rate=%d"
> @@ -52,7 +54,6 @@ smmuv3_cmdq_tlbi_nh(int vmid) "vmid=%d"
>  smmuv3_cmdq_tlbi_nsnh(void) ""
>  smmuv3_cmdq_tlbi_nh_asid(int asid) "asid=%d"
>  smmuv3_cmdq_tlbi_s12_vmid(int vmid) "vmid=%d"
> -smmuv3_config_cache_inv(uint32_t sid) "Config cache INV for sid=0x%x"
>  smmuv3_notify_flag_add(const char *iommu) "ADD SMMUNotifier node for iommu mr=%s"
>  smmuv3_notify_flag_del(const char *iommu) "DEL SMMUNotifier node for iommu mr=%s"
>  smmuv3_inv_notifiers_iova(const char *name, int asid, int vmid, uint64_t iova, uint8_t tg, uint64_t num_pages, int stage) "iommu mr=%s asid=%d vmid=%d iova=0x%"PRIx64" tg=%d num_pages=0x%"PRIx64" stage=%d"
> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
> index e5ad55bba..e5e2d0929 100644
> --- a/include/hw/arm/smmu-common.h
> +++ b/include/hw/arm/smmu-common.h
> @@ -142,6 +142,11 @@ typedef struct SMMUIOTLBKey {
>      uint8_t level;
>  } SMMUIOTLBKey;
>  
> +typedef struct SMMUSIDRange {
> +    uint32_t start;
> +    uint32_t end;
> +} SMMUSIDRange;
> +
>  struct SMMUState {
>      /* <private> */
>      SysBusDevice  dev;
> @@ -219,6 +224,7 @@ void smmu_iotlb_inv_iova(SMMUState *s, int asid, int vmid, dma_addr_t iova,
>                           uint8_t tg, uint64_t num_pages, uint8_t ttl);
>  void smmu_iotlb_inv_ipa(SMMUState *s, int vmid, dma_addr_t ipa, uint8_t tg,
>                          uint64_t num_pages, uint8_t ttl);
> +void smmu_configs_inv_sid_range(SMMUState *s, SMMUSIDRange sid_range);
>  /* Unmap the range of all the notifiers registered to any IOMMU mr */
>  void smmu_inv_notifiers_all(SMMUState *s);
>  

