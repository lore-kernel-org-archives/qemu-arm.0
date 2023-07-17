Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp5806596eje;
        Mon, 17 Jul 2023 09:16:25 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGR1263OoXARB3QpVOuqaNrXsdCeEKvJgTouxAxV4oJH57MPOIP/gdYRIRySMlarGXJtFiT
X-Received: by 2002:adf:d852:0:b0:314:13e2:2f78 with SMTP id k18-20020adfd852000000b0031413e22f78mr10262876wrl.44.1689610585589;
        Mon, 17 Jul 2023 09:16:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689610585; cv=none;
        d=google.com; s=arc-20160816;
        b=GdpywgkJRpPabyToTJbbRyWXqY0lH/Tr5Y0pkLKDafkNEza1n4/ZITMgKmaBv0eGBv
         UfbhWmeUmo1M6/umkMCohRbjEsVG3nU0zokSXghZ15/lQl/HIbRAnoGaVXPEL+FQHU/+
         dhSLkF6g8m0HqLqxCPHtynJV2n9uqmyKQeXPGWAclRwAiZFqcoJQkulkq95O+45hWxsD
         AJDTTPsE47CGfyZiYFCo1L5xAgjOFV/dFav/wCtHTJvjD4xJIihOXpPiKNlZNq6sUz8X
         hcclRqc9VM4Ki1+uF3Uw/cecl8ocmqKQ9vhPTC6ByZ6jGtP8L9d/nB87pxGbw6oAOVCM
         0bxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=5o2DsqY4HYqcz+dnGbRVOQ99jJpjBPU/TtdtDBcJeMI=;
        fh=Tv240FQwP2S/SYa+KtiXrM5RGeUpzYRDA10r4uHhSQY=;
        b=YTtx7mVkflMD5D7cmuVgKrk/zWAXmQ1uqO4gHvXmIpB9BLMt4PJSwdFXc0jtz1Wq2i
         p6F+Erwgod5s1u2EUF7LiWB8nDjInV+NlL0zTqk3KUmIr9yyvtYCSmeAi9rCLPCyXrPd
         dxu+oThZ3MQ3u1td4lRXQ/VCFDR7U8kFwu0fwpyg5+r0GQ2m9SVRR2YpumUtiT9K0rn4
         Imka6KrRcg//xLlKYaEYy2E8xWB+RK4vaA2zUTE9VA8y2ulS8/KR+50IGFuIyJFKiFsq
         ZR5hTbcfRZpQRh7ljD1+qjy41YPmxTODmMeGffPvzfiz+T7lYnK1gCiQI3LeHPCWVCPj
         abtQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="hvS6DAa/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l16-20020adfe9d0000000b00316ee7695e7si4158866wrn.1056.2023.07.17.09.16.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Jul 2023 09:16:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="hvS6DAa/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qLQtC-0007xj-Gn; Mon, 17 Jul 2023 12:16:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qLQsq-0007tp-2d
 for qemu-arm@nongnu.org; Mon, 17 Jul 2023 12:15:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qLQsn-0006aM-M9
 for qemu-arm@nongnu.org; Mon, 17 Jul 2023 12:15:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689610531;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5o2DsqY4HYqcz+dnGbRVOQ99jJpjBPU/TtdtDBcJeMI=;
 b=hvS6DAa/I8tmJsdif+gRRsxRAlqbbmvdpKopTmZoRTIWpnr+zAsi4tupGlSzjVOT10L0az
 sZyIYuPiiorIhUl0CEqRYPTFQ+a5XuMhheAqeigQZEiyt0r94VzR1AUMlimBghTACzl7Dx
 RKEJLtfj7A/UJ2mHoGryd+smBQnuE74=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-78-776PHq4qPnm6PyKfV1i3LA-1; Mon, 17 Jul 2023 12:15:30 -0400
X-MC-Unique: 776PHq4qPnm6PyKfV1i3LA-1
Received: by mail-vs1-f70.google.com with SMTP id
 ada2fe7eead31-44364b726c2so606214137.3
 for <qemu-arm@nongnu.org>; Mon, 17 Jul 2023 09:15:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689610530; x=1690215330;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5o2DsqY4HYqcz+dnGbRVOQ99jJpjBPU/TtdtDBcJeMI=;
 b=UGiToVrW7FAiCM3v/8xOa9b6PTXoKaVu+FjJ/NFnUFMUCQsJ0p9sMRVYbC5ZpDxSyI
 Aqslp09hBbTIr2yjy1gWMe2TCgxuBiyklWnDLHjsXnS/92ECkzELcHD/ulqhz6L5oCTr
 7+s0n0RqzW3JpTrHtHO2ZX7aRKs32520C7N/l0F7TauRPPGfeZo4kfeieWeZW+8Kr5uA
 qdC8IuDRUFzKl682UDmd5Fz6ydYc71w992MPh+DSVe/86k5lHVDo9+yTEazhL01JAqdH
 g0K7Tup7k/N1fYAVKBzstgfxUms6MZNGAUexZ/p5On14gAFkGD4YncpwvqYiXGfgA0fS
 LCwA==
X-Gm-Message-State: ABy/qLYBoFNLW9+IKkDuFw6hYXfOQkjIVcO/eT6cVr1TYtw6RXeF32oV
 FPjy0DndwBfC96QegZvXCplYxmGxQfX2XO98UvH+mGPAqXIjrEzAokwWl/DdX5m/kg2ZWxV6uAm
 JVe4rRvcodYF0
X-Received: by 2002:a67:e20b:0:b0:445:175d:680e with SMTP id
 g11-20020a67e20b000000b00445175d680emr5437103vsa.33.1689610529881; 
 Mon, 17 Jul 2023 09:15:29 -0700 (PDT)
X-Received: by 2002:a67:e20b:0:b0:445:175d:680e with SMTP id
 g11-20020a67e20b000000b00445175d680emr5437078vsa.33.1689610529605; 
 Mon, 17 Jul 2023 09:15:29 -0700 (PDT)
Received: from [192.168.43.95] ([37.168.249.127])
 by smtp.gmail.com with ESMTPSA id
 m6-20020a0cdb86000000b006300e1db3ecsm6396536qvk.141.2023.07.17.09.15.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jul 2023 09:15:28 -0700 (PDT)
Message-ID: <be9d45dd-1b51-4ded-cb56-307cd1b241ad@redhat.com>
Date: Mon, 17 Jul 2023 18:15:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH for-8.1] hw/arm/smmu: Handle big-endian hosts correctly
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org
References: <20230717132641.764660-1-peter.maydell@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20230717132641.764660-1-peter.maydell@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.097, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: QxQ/BCJ79yGE

Hi Peter,

On 7/17/23 15:26, Peter Maydell wrote:
> The implementation of the SMMUv3 has multiple places where it reads a
> data structure from the guest and directly operates on it without
> doing a guest-to-host endianness conversion.  Since all SMMU data
> structures are little-endian, this means that the SMMU doesn't work
> on a big-endian host.  In particular, this causes the Avocado test
>   machine_aarch64_virt.py:Aarch64VirtMachine.test_alpine_virt_tcg_gic_max
> to fail on an s390x host.
>
> Add appropriate byte-swapping on reads and writes of guest in-memory
> data structures so that the device works correctly on big-endian
> hosts.
>
> As part of this we constrain queue_read() to operate only on Cmd
> structs and queue_write() on Evt structs, because in practice these
> are the only data structures the two functions are used with, and we
> need to know what the data structure is to be able to byte-swap its
> parts correctly.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-stable@nongnu.org
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
> ---
>  hw/arm/smmu-common.c |  3 +--
>  hw/arm/smmuv3.c      | 39 +++++++++++++++++++++++++++++++--------
>  2 files changed, 32 insertions(+), 10 deletions(-)
>
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index 5ab9d45d58a..f35ae9aa22c 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -216,8 +216,7 @@ static int get_pte(dma_addr_t baseaddr, uint32_t index, uint64_t *pte,
>      dma_addr_t addr = baseaddr + index * sizeof(*pte);
>  
>      /* TODO: guarantee 64-bit single-copy atomicity */
> -    ret = dma_memory_read(&address_space_memory, addr, pte, sizeof(*pte),
> -                          MEMTXATTRS_UNSPECIFIED);
> +    ret = ldq_le_dma(&address_space_memory, addr, pte, MEMTXATTRS_UNSPECIFIED);
>  
>      if (ret != MEMTX_OK) {
>          info->type = SMMU_PTW_ERR_WALK_EABT;
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 932f0096974..1e9be8e89af 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -102,20 +102,34 @@ static void smmuv3_write_gerrorn(SMMUv3State *s, uint32_t new_gerrorn)
>      trace_smmuv3_write_gerrorn(toggled & pending, s->gerrorn);
>  }
>  
> -static inline MemTxResult queue_read(SMMUQueue *q, void *data)
> +static inline MemTxResult queue_read(SMMUQueue *q, Cmd *cmd)
>  {
>      dma_addr_t addr = Q_CONS_ENTRY(q);
> +    MemTxResult ret;
> +    int i;
>  
> -    return dma_memory_read(&address_space_memory, addr, data, q->entry_size,
> -                           MEMTXATTRS_UNSPECIFIED);
> +    ret = dma_memory_read(&address_space_memory, addr, cmd, sizeof(Cmd),
> +                          MEMTXATTRS_UNSPECIFIED);
> +    if (ret != MEMTX_OK) {
> +        return ret;
> +    }
> +    for (i = 0; i < ARRAY_SIZE(cmd->word); i++) {
> +        le32_to_cpus(&cmd->word[i]);
> +    }
> +    return ret;
>  }
>  
> -static MemTxResult queue_write(SMMUQueue *q, void *data)
> +static MemTxResult queue_write(SMMUQueue *q, Evt *evt_in)
>  {
>      dma_addr_t addr = Q_PROD_ENTRY(q);
>      MemTxResult ret;
> +    Evt evt = *evt_in;
> +    int i;
>  
> -    ret = dma_memory_write(&address_space_memory, addr, data, q->entry_size,
> +    for (i = 0; i < ARRAY_SIZE(evt.word); i++) {
> +        cpu_to_le32s(&evt.word[i]);
> +    }
> +    ret = dma_memory_write(&address_space_memory, addr, &evt, sizeof(Evt),
>                             MEMTXATTRS_UNSPECIFIED);
>      if (ret != MEMTX_OK) {
>          return ret;
> @@ -298,7 +312,7 @@ static void smmuv3_init_regs(SMMUv3State *s)
>  static int smmu_get_ste(SMMUv3State *s, dma_addr_t addr, STE *buf,
>                          SMMUEventInfo *event)
>  {
> -    int ret;
> +    int ret, i;
>  
>      trace_smmuv3_get_ste(addr);
>      /* TODO: guarantee 64-bit single-copy atomicity */
> @@ -311,6 +325,9 @@ static int smmu_get_ste(SMMUv3State *s, dma_addr_t addr, STE *buf,
>          event->u.f_ste_fetch.addr = addr;
>          return -EINVAL;
>      }
> +    for (i = 0; i < ARRAY_SIZE(buf->word); i++) {
> +        le32_to_cpus(&buf->word[i]);
> +    }
>      return 0;
>  
>  }
> @@ -320,7 +337,7 @@ static int smmu_get_cd(SMMUv3State *s, STE *ste, uint32_t ssid,
>                         CD *buf, SMMUEventInfo *event)
>  {
>      dma_addr_t addr = STE_CTXPTR(ste);
> -    int ret;
> +    int ret, i;
>  
>      trace_smmuv3_get_cd(addr);
>      /* TODO: guarantee 64-bit single-copy atomicity */
> @@ -333,6 +350,9 @@ static int smmu_get_cd(SMMUv3State *s, STE *ste, uint32_t ssid,
>          event->u.f_ste_fetch.addr = addr;
>          return -EINVAL;
>      }
> +    for (i = 0; i < ARRAY_SIZE(buf->word); i++) {
> +        le32_to_cpus(&buf->word[i]);
> +    }
>      return 0;
>  }
>  
> @@ -569,7 +589,7 @@ static int smmu_find_ste(SMMUv3State *s, uint32_t sid, STE *ste,
>          return -EINVAL;
>      }
>      if (s->features & SMMU_FEATURE_2LVL_STE) {
> -        int l1_ste_offset, l2_ste_offset, max_l2_ste, span;
> +        int l1_ste_offset, l2_ste_offset, max_l2_ste, span, i;
>          dma_addr_t l1ptr, l2ptr;
>          STEDesc l1std;
>  
> @@ -593,6 +613,9 @@ static int smmu_find_ste(SMMUv3State *s, uint32_t sid, STE *ste,
>              event->u.f_ste_fetch.addr = l1ptr;
>              return -EINVAL;
>          }
> +        for (i = 0; i < ARRAY_SIZE(l1std.word); i++) {
> +            le32_to_cpus(&l1std.word[i]);
> +        }
>  
>          span = L1STD_SPAN(&l1std);
>  

