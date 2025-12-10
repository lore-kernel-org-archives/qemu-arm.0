Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E67DCD2CE17
	for <qemu-arm@archiver.kernel.org>; Wed, 10 Dec 2025 07:53:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vTF0b-00084h-5S; Wed, 10 Dec 2025 02:53:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vTF0a-00084Q-C0
 for qemu-arm@nongnu.org; Wed, 10 Dec 2025 02:53:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vTF0Y-0000JC-Ir
 for qemu-arm@nongnu.org; Wed, 10 Dec 2025 02:53:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765353187;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vIvlPr0gNRKga0fhUXLJ1XMvKXR9W/McYYjFeFmLxhI=;
 b=Qj5RLZZwSyI+jsmjAv0y6VBhD0XZn67HWLWUqb7ME0kdQlRwA5rYKBSWf61ZXACKIok8yr
 V7mGHYOSC/+cPCwp9doq6iZwDzS3rhqJ+P6fBONlV9spP8zj3aCi61sn4Twv5iJfy6osMQ
 dlGbaHQJM6q8CY542NVu3Yzh6gwu0T8=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-1-GWOFd8flOTuFH_2-MYkjjQ-1; Wed, 10 Dec 2025 02:53:06 -0500
X-MC-Unique: GWOFd8flOTuFH_2-MYkjjQ-1
X-Mimecast-MFC-AGG-ID: GWOFd8flOTuFH_2-MYkjjQ_1765353185
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-b471737e673so7922409a12.1
 for <qemu-arm@nongnu.org>; Tue, 09 Dec 2025 23:53:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765353184; x=1765957984;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vIvlPr0gNRKga0fhUXLJ1XMvKXR9W/McYYjFeFmLxhI=;
 b=CIugWdAvFKyZv+/bhlCH7rd3nrZ6QZAAB0GtEwSwxTNSnSORrgzBogTPF/TZy32mKo
 4Xbp9CfCWhogKRvIbwn36G0AVggGfK1xKajrnyQrUXnY13Y/jMJywILLhqgNRcRPAEF+
 SVPj20W7HsYl+kySlAH5JqfhgPJ9pGLAeKQbtZ2GN+MzU1g1LMJaK5kLvUYrH/GKE4ug
 57lbIuzxUTYzdJwAgc6JjQOVNDYzp3VqXggPxBofR1+ZvwuEJJtgPM1CWvfNyuvpGxET
 B5Gd6sLF0i41XYDyCthywZ6E3IgCvL4tt+Cr2LsbL43t40b5vPuDcOFGMlZb4Ihj503+
 qBkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfCa9mr0ZuSEY6VAf+dTLIhMtbciLXxQvr63ySXCdcDVqGKII9RwAggRuEDtd+PLMYRFIJVh1Kag==@nongnu.org
X-Gm-Message-State: AOJu0YwZjQaaUjOzCdGzU/e7w52sEEK1Nb8mQe90dwnUrWZn8ClN8eZf
 aeviYWx9fZ+uNEP27FG2Yj1kcEYBQ9COWVK0XjQZ2p6qRywX4tS/N/OHonEh0VVDfbJvX4BKUqe
 s/FPdoWOdNt3aBp144TCY9hFRfqoZqEio+6QHDzC3rbYhaShdd4mXgw==
X-Gm-Gg: ASbGncs/haFD7Nngrep4eT4cXq690ZEtB1xmE8IqoJHekLD6KOdfwhNJ6CqbXXxWjAi
 6eHyL6JW9tVzlPHP7t/HP+VNDd0fXWlilqfpL6e1d2cOO6Vh5wLWxCVNHwhygoUN4FERRxEr3cE
 YO9D38exi1QyyUrD1l69C5JukADtC4wBIA7oi7k7bz6KjFDiWitRxjG/mTiQ6ZolJ8lLBSXTm4G
 3/2uBIjoiEUoWvRQnZPHq3s13ZJGoEYAGkVCqwqtw7q+y6CtjQ5jmxyBCKcO0qeASNqkiOrw2Fy
 NVyiDCHJMPspd1lQZ5WJx0tHcXSJEn6CVAY+RPbcvHDKsN0FaXfQtLZEeDaWZZYxTmWLQwzVLqr
 EMjas3LoOp/5OpXPZsC+eSUDE7DcpsPJcJ5/Rz9n5/78Gx66+FYKdCcgvLg==
X-Received: by 2002:a05:7022:f902:10b0:11b:a892:80b4 with SMTP id
 a92af1059eb24-11f29627850mr1012686c88.5.1765353184134; 
 Tue, 09 Dec 2025 23:53:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFWIUVlSoBg85IcgSptiHyKSFhmuiaMBaq2ErVR8m82ym0Vev3adInCmTWhRXEe+tbH9owR1w==
X-Received: by 2002:a05:7022:f902:10b0:11b:a892:80b4 with SMTP id
 a92af1059eb24-11f29627850mr1012664c88.5.1765353183541; 
 Tue, 09 Dec 2025 23:53:03 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-11df7573508sm56629809c88.3.2025.12.09.23.52.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Dec 2025 23:53:02 -0800 (PST)
Message-ID: <3f38243c-41d8-4251-b3a6-483335e69124@redhat.com>
Date: Wed, 10 Dec 2025 08:52:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] hw/arm/smmuv3: Introduce a helper function for
 event propagation
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, nicolinc@nvidia.com, nathanc@nvidia.com,
 mochs@nvidia.com, jgg@nvidia.com, jonathan.cameron@huawei.com,
 zhangfei.gao@linaro.org, zhenzhong.duan@intel.com, kjaju@nvidia.com
References: <20251204092245.5157-1-skolothumtho@nvidia.com>
 <20251204092245.5157-4-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20251204092245.5157-4-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qx1JxgbXhEkEPOJB9H8yAGmcGmg8ITFP0Kz-V9jwi3E_1765353185
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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



On 12/4/25 10:22 AM, Shameer Kolothum wrote:
> Factor out the code that propagates event records to the guest into a
> helper function. The accelerated SMMUv3 path can use this to propagate
> host events in a subsequent patch.
>
> Since this helper may be called from outside the SMMUv3 core, take the
> mutex before accessing the Event Queue.
>
> No functional change intended.
>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>  hw/arm/smmuv3-internal.h |  4 ++++
>  hw/arm/smmuv3.c          | 21 +++++++++++++++------
>  hw/arm/trace-events      |  2 +-
>  3 files changed, 20 insertions(+), 7 deletions(-)
>
> diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
> index e45aad27f7..ad7f5e6640 100644
> --- a/hw/arm/smmuv3-internal.h
> +++ b/hw/arm/smmuv3-internal.h
> @@ -525,7 +525,11 @@ typedef struct SMMUEventInfo {
>              (x)->word[6] = (uint32_t)(addr & 0xffffffff); \
>      } while (0)
>  
> +#define EVT_GET_TYPE(x)  extract32((x)->word[0], 0, 8)
> +#define EVT_GET_SID(x)   ((x)->word[1])
> +
>  void smmuv3_record_event(SMMUv3State *s, SMMUEventInfo *event);
> +void smmuv3_propagate_event(SMMUv3State *s, Evt *evt);
>  
>  /* Configuration Data */
>  
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index ac60ca0ce7..9b7b85fb49 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -168,10 +168,23 @@ static MemTxResult smmuv3_write_eventq(SMMUv3State *s, Evt *evt)
>      return MEMTX_OK;
>  }
>  
> +void smmuv3_propagate_event(SMMUv3State *s, Evt *evt)
> +{
> +    MemTxResult r;
> +
> +    trace_smmuv3_propagate_event(smmu_event_string(EVT_GET_TYPE(evt)),
> +                                 EVT_GET_SID(evt));
> +    qemu_mutex_lock(&s->mutex);
> +    r = smmuv3_write_eventq(s, evt);
> +    if (r != MEMTX_OK) {
> +        smmuv3_trigger_irq(s, SMMU_IRQ_GERROR, R_GERROR_EVENTQ_ABT_ERR_MASK);
> +    }
> +    qemu_mutex_unlock(&s->mutex);
> +}
> +
>  void smmuv3_record_event(SMMUv3State *s, SMMUEventInfo *info)
>  {
>      Evt evt = {};
> -    MemTxResult r;
>  
>      if (!smmuv3_eventq_enabled(s)) {
>          return;
> @@ -251,11 +264,7 @@ void smmuv3_record_event(SMMUv3State *s, SMMUEventInfo *info)
>          g_assert_not_reached();
>      }
>  
> -    trace_smmuv3_record_event(smmu_event_string(info->type), info->sid);
> -    r = smmuv3_write_eventq(s, &evt);
> -    if (r != MEMTX_OK) {
> -        smmuv3_trigger_irq(s, SMMU_IRQ_GERROR, R_GERROR_EVENTQ_ABT_ERR_MASK);
> -    }
> +    smmuv3_propagate_event(s, &evt);
>      info->recorded = true;
>  }
>  
> diff --git a/hw/arm/trace-events b/hw/arm/trace-events
> index 8135c0c734..3457536fb0 100644
> --- a/hw/arm/trace-events
> +++ b/hw/arm/trace-events
> @@ -40,7 +40,7 @@ smmuv3_cmdq_opcode(const char *opcode) "<--- %s"
>  smmuv3_cmdq_consume_out(uint32_t prod, uint32_t cons, uint8_t prod_wrap, uint8_t cons_wrap) "prod:%d, cons:%d, prod_wrap:%d, cons_wrap:%d "
>  smmuv3_cmdq_consume_error(const char *cmd_name, uint8_t cmd_error) "Error on %s command execution: %d"
>  smmuv3_write_mmio(uint64_t addr, uint64_t val, unsigned size, uint32_t r) "addr: 0x%"PRIx64" val:0x%"PRIx64" size: 0x%x(%d)"
> -smmuv3_record_event(const char *type, uint32_t sid) "%s sid=0x%x"
> +smmuv3_propagate_event(const char *type, uint32_t sid) "%s sid=0x%x"
>  smmuv3_find_ste(uint16_t sid, uint32_t features, uint16_t sid_split) "sid=0x%x features:0x%x, sid_split:0x%x"
>  smmuv3_find_ste_2lvl(uint64_t strtab_base, uint64_t l1ptr, int l1_ste_offset, uint64_t l2ptr, int l2_ste_offset, int max_l2_ste) "strtab_base:0x%"PRIx64" l1ptr:0x%"PRIx64" l1_off:0x%x, l2ptr:0x%"PRIx64" l2_off:0x%x max_l2_ste:%d"
>  smmuv3_get_ste(uint64_t addr) "STE addr: 0x%"PRIx64
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric


