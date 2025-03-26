Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp3346434njc;
        Wed, 26 Mar 2025 07:18:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX01OUkgxT23qtI9s1N3kLEAykLg04RJU5xncwkrq55WBIHW0BEYMwOmjrCABlfuvJ1RJqJ5SLPOifoRw==@linaro.org
X-Google-Smtp-Source: AGHT+IH9t6wjcIC/y4p2Q516sT+4FPUh07KG1uLnqsfp1p793kLJwR2O5MuS475pBfKdqRM41iAe
X-Received: by 2002:a05:620a:27c2:b0:7c5:ae70:b081 with SMTP id af79cd13be357-7c5e491272bmr547038085a.20.1742998710143;
        Wed, 26 Mar 2025 07:18:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742998710; cv=none;
        d=google.com; s=arc-20240605;
        b=PfWO92XX4vl2XwLS6uU9fSYVU4K7BrqtpEOMA0DedAZZgRh+y+JB33eBS7HcxCgAwI
         +LUEPygDXeuONeWBs6c2G+3O2h2MIkoZBhSexy4PwIWYLn/Wygta4fJMPED9DtsR7UG9
         d4mBZ3gKOmBiTVbN2UnKQU0+CM06DQoJnQS1ASDmrRVAr3sAOa9+XNcA3siXGDbJO2Ik
         LOSLpcrJFpYxpNfH0fYr9hnBX6MMcohG51jTQiAd9LphVgHs1ZbcLV1DmRq3gJ3zSnI+
         Cn8OB6OyUExi1mZjZ8grzFlXLrQujUptDElZCY0EtqM6+58gJKLzGRlaf28i+BCo+51w
         Powg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=bhahwpgcLXH65nyIi3P5pcPRCcUPovIfGC7Er/9p7/Y=;
        fh=JFsBDM/S0fl8jlmmuEo91WoOT7fXVTELEQ9awC7qTSI=;
        b=i/0MOrYTPQJ+akTVexl7xwPQyAN4hM4oUx9e77pRHBv5IQPSkJn3BDX5AyJP+Qwfn2
         INH/HstH/+pSAgSXI4lSz3ZtiAtHvmxLRfnsx285knAjElGO65qxIXEJYkA3Ij2wJSZz
         apaHu8mhNSzOcvw0hYtK0IQuWe21hamE8bR/pKT1tJ0iLkc5ek1yIBMMPf3VCbqplJf8
         z6Z4Kkg4TNoX+9DmfmlWf1M5wkMTKUAOTlMyj6hKOq5VjBMpQ4nDrZGBfrpb84ILZ2E4
         Cgg/2xJFjAeRq8Wxm7ydzmxe8Ft5IOolRJRMiWcPHVJopJYfQXacE9dF+5htlyOEzlyb
         PKuQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MfZE4l+D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c5b93575cesi1147526385a.415.2025.03.26.07.18.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Mar 2025 07:18:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MfZE4l+D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1txRaO-0003nF-2w; Wed, 26 Mar 2025 10:18:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1txRaD-0003j5-Fe
 for qemu-arm@nongnu.org; Wed, 26 Mar 2025 10:18:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1txRaB-0005Ui-Gd
 for qemu-arm@nongnu.org; Wed, 26 Mar 2025 10:18:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742998694;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bhahwpgcLXH65nyIi3P5pcPRCcUPovIfGC7Er/9p7/Y=;
 b=MfZE4l+DcuJ12Fs+L8wonGbcBt94OEUhHSL/A/Vv673I7Sk2EAh2Iio2x5vAMQoKTPkVl5
 Gx88Jw8VvILn+Z9yMRLvBaYWv5bM+2+/XzxmshzS/f/f9000eybh3m5hh5WBJuYjNGImDF
 F9TZMuCrza2cKrVbdwIMNiiX3Q6HYYs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-347-TRDDjA6zMvazQp3LXVH8JQ-1; Wed, 26 Mar 2025 10:18:13 -0400
X-MC-Unique: TRDDjA6zMvazQp3LXVH8JQ-1
X-Mimecast-MFC-AGG-ID: TRDDjA6zMvazQp3LXVH8JQ_1742998692
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-438e180821aso32396625e9.1
 for <qemu-arm@nongnu.org>; Wed, 26 Mar 2025 07:18:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742998692; x=1743603492;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bhahwpgcLXH65nyIi3P5pcPRCcUPovIfGC7Er/9p7/Y=;
 b=n+425lWuvGaXBOpcf6omK28eEN4Jk76OKxAK86bldD+Bw9srsvv8oLj3Sx0Eu4mvKm
 Y6d7SrvWwwXJw1OSSo6aW1WsdG3nIrtBZLCUOe+BDCGdzKD/QipsIof+5MjqRurMuaSz
 KP0SQsAh7e5pO49yzXX04RU5fRB9eJ5dNsKrzWy1H6e15qJudTfqrra3JYO94UVnfc8q
 joGYBsDqanX60JPAuRZ/oxBb6M6EsEMIdAngFEsQIslFTuMfJdH7UfqdWwGpgcQ6PrG+
 ShKXMF66vV2qqZVR7pXomYis/BXKaWEwqL8uP8vMmTjE0wPNs3ZdZ48+XTNqev/dov7V
 2RKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVz7+CeFo1E4ILLrkkS6AhqrTGb+LCYFRzo/IY9ipcDTrZQT2bfCEsqDMxHTVh4d1ge8JgsKFZniw==@nongnu.org
X-Gm-Message-State: AOJu0YwrW3BDtMib/TeRjn/1GVrTn+i3xYoLs5jRjJ8nVneGi8ftpdiR
 nOfw3GSQMC9HcWDFbTp1kNFV+CcD7HPlxiq7JtKlc07E5oc/BFv0sBJHAuaRBeNz4ySlBUp49FU
 a1lOv1H3ow064W49T3+NCWDMK5ZpvimajJWOEoXBGZKFnaElMyQ==
X-Gm-Gg: ASbGncu6Wzf1z20L8EZI1uZi8zIa2HExFh4QpauIWHJbhagXTs5scZyqhMDvu5O6cJx
 HDh83b4sFACdWS0DCC7ThakJGx3GdfSpW/3YmqG/z0DXDq7LdEgaJwERfBL3e9zQM02e0RJrueg
 siDmjeOOMIlk2OrB7itzkWZOEXGeiu4q8R7jhsh6uwmZK/S8Ml5tA4Nn/Ap29uWrXDxBWtS2tWX
 1K3oWr7qp8ju4oGDXBnHHd8A8f43fVPV2wOMHHVLknGnaN3Gpwv/n+MxWfhuZmL9P821zvJ08TZ
 ekWL81y9q2h7a/CfBsXVGIVP3avE72ETJCW1RqZXtbGt12rCYW3MV2NHyDSUYqY=
X-Received: by 2002:a05:600c:3547:b0:439:91dd:cf9c with SMTP id
 5b1f17b1804b1-43d7894c000mr35043275e9.10.1742998689909; 
 Wed, 26 Mar 2025 07:18:09 -0700 (PDT)
X-Received: by 2002:a05:600c:3547:b0:439:91dd:cf9c with SMTP id
 5b1f17b1804b1-43d7894c000mr35042625e9.10.1742998689417; 
 Wed, 26 Mar 2025 07:18:09 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9a3b83sm17192486f8f.33.2025.03.26.07.18.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Mar 2025 07:18:08 -0700 (PDT)
Message-ID: <6b943f66-6a2d-4db7-9524-c4c1fa2fbaec@redhat.com>
Date: Wed, 26 Mar 2025 15:18:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 15/20] hw/arm/smmuv3: Forward invalidation commands
 to hw
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, jgg@nvidia.com, nicolinc@nvidia.com,
 ddutile@redhat.com, berrange@redhat.com, nathanc@nvidia.com,
 mochs@nvidia.com, smostafa@google.com, linuxarm@huawei.com,
 wangzhou1@hisilicon.com, jiangkunkun@huawei.com,
 jonathan.cameron@huawei.com, zhangfei.gao@linaro.org
References: <20250311141045.66620-1-shameerali.kolothum.thodi@huawei.com>
 <20250311141045.66620-16-shameerali.kolothum.thodi@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250311141045.66620-16-shameerali.kolothum.thodi@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZMyRW_WgmVekSB3VSbTsFq4Al8XRfHyHPpeo-3NmLmE_1742998692
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
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: 4Ws1k145a6zy



On 3/11/25 3:10 PM, Shameer Kolothum wrote:
> From: Nicolin Chen <nicolinc@nvidia.com>
>
> Use the provided smmuv3-accel helper functions to issue the
> command to physical SMMUv3.
>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
>  hw/arm/smmuv3-internal.h | 11 ++++++++
>  hw/arm/smmuv3.c          | 58 +++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 68 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
> index 4602ae6728..546f8faac0 100644
> --- a/hw/arm/smmuv3-internal.h
> +++ b/hw/arm/smmuv3-internal.h
> @@ -235,6 +235,17 @@ static inline bool smmuv3_gerror_irq_enabled(SMMUv3State *s)
>  #define Q_CONS_WRAP(q) (((q)->cons & WRAP_MASK(q)) >> (q)->log2size)
>  #define Q_PROD_WRAP(q) (((q)->prod & WRAP_MASK(q)) >> (q)->log2size)
>  
> +static inline int smmuv3_q_ncmds(SMMUQueue *q)
> +{
> +        uint32_t prod = Q_PROD(q);
> +        uint32_t cons = Q_CONS(q);
> +
> +        if (Q_PROD_WRAP(q) == Q_CONS_WRAP(q))
> +                return prod - cons;
> +        else
> +                return WRAP_MASK(q) - cons + prod;
> +}
> +
>  static inline bool smmuv3_q_full(SMMUQueue *q)
>  {
>      return ((q->cons ^ q->prod) & WRAP_INDEX_MASK(q)) == WRAP_MASK(q);
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 83159db1d4..e0f225d0df 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -1297,10 +1297,18 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
>      SMMUCmdError cmd_error = SMMU_CERROR_NONE;
>      SMMUQueue *q = &s->cmdq;
>      SMMUCommandType type = 0;
> +    SMMUCommandBatch batch = {};
> +    uint32_t ncmds = 0;
> +
>  
>      if (!smmuv3_cmdq_enabled(s)) {
>          return 0;
>      }
> +
> +    ncmds = smmuv3_q_ncmds(q);
> +    batch.cmds = g_new0(Cmd, ncmds);
> +    batch.cons = g_new0(uint32_t, ncmds);
> +
>      /*
>       * some commands depend on register values, typically CR0. In case those
>       * register values change while handling the command, spec says it
> @@ -1395,6 +1403,13 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
>  
>              trace_smmuv3_cmdq_cfgi_cd(sid);
>              smmuv3_flush_config(sdev);
> +
> +            if (smmuv3_accel_batch_cmds(sdev->smmu, sdev, &batch, &cmd,
> +                                        &q->cons, true)) {
> +                cmd_error = SMMU_CERROR_ILL;
OK so now I see you record the error. You can ignore the previous comment.
> +                break;
> +            }
> +
>              break;
>          }
>          case SMMU_CMD_TLBI_NH_ASID:
> @@ -1418,6 +1433,13 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
>              trace_smmuv3_cmdq_tlbi_nh_asid(asid);
>              smmu_inv_notifiers_all(&s->smmu_state);
>              smmu_iotlb_inv_asid_vmid(bs, asid, vmid);
> +
> +            if (smmuv3_accel_batch_cmds(bs, NULL, &batch, &cmd, &q->cons,
> +                                        false)) {
> +                cmd_error = SMMU_CERROR_ILL;
> +                break;
> +            }
> +
>              break;
>          }
>          case SMMU_CMD_TLBI_NH_ALL:
> @@ -1445,6 +1467,12 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
>              trace_smmuv3_cmdq_tlbi_nsnh();
>              smmu_inv_notifiers_all(&s->smmu_state);
>              smmu_iotlb_inv_all(bs);
> +
> +            if (smmuv3_accel_batch_cmds(bs, NULL, &batch, &cmd, &q->cons,
> +                                        false)) {
> +                cmd_error = SMMU_CERROR_ILL;
> +                break;
> +            }
>              break;
>          case SMMU_CMD_TLBI_NH_VAA:
>          case SMMU_CMD_TLBI_NH_VA:
> @@ -1453,7 +1481,24 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
>                  break;
>              }
>              smmuv3_range_inval(bs, &cmd, SMMU_STAGE_1);
> +
> +            if (smmuv3_accel_batch_cmds(bs, NULL, &batch, &cmd, &q->cons,
> +                                        false)) {
> +                cmd_error = SMMU_CERROR_ILL;
> +                break;
> +            }
> +            break;
> +        case SMMU_CMD_ATC_INV:
To me the code below shall be put in a separate patch as it introduces
the suport for a new cmd. Also it shall be properly documented in the
commit msg
> +        {
> +            SMMUDevice *sdev = smmu_find_sdev(bs, CMD_SID(&cmd));
> +
> +            if (smmuv3_accel_batch_cmds(sdev->smmu, sdev, &batch, &cmd,
> +                                        &q->cons, true)) {
> +                cmd_error = SMMU_CERROR_ILL;
> +                break;
> +            }
>              break;
> +        }
>          case SMMU_CMD_TLBI_S12_VMALL:
>          {
>              int vmid = CMD_VMID(&cmd);
> @@ -1485,7 +1530,6 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
>          case SMMU_CMD_TLBI_EL2_ASID:
>          case SMMU_CMD_TLBI_EL2_VA:
>          case SMMU_CMD_TLBI_EL2_VAA:
> -        case SMMU_CMD_ATC_INV:
>          case SMMU_CMD_PRI_RESP:
>          case SMMU_CMD_RESUME:
>          case SMMU_CMD_STALL_TERM:
> @@ -1511,12 +1555,24 @@ static int smmuv3_cmdq_consume(SMMUv3State *s)
>          queue_cons_incr(q);
>      }
>  
> +    qemu_mutex_lock(&s->mutex);
> +    if (!cmd_error && batch.ncmds) {
> +        if (smmuv3_accel_issue_cmd_batch(bs, &batch)) {
> +            q->cons = batch.cons[batch.ncmds];
> +            cmd_error = SMMU_CERROR_ILL;
> +        }
> +    }
> +    qemu_mutex_unlock(&s->mutex);
> +
>      if (cmd_error) {
>          trace_smmuv3_cmdq_consume_error(smmu_cmd_string(type), cmd_error);
>          smmu_write_cmdq_err(s, cmd_error);
>          smmuv3_trigger_irq(s, SMMU_IRQ_GERROR, R_GERROR_CMDQ_ERR_MASK);
>      }
>  
> +    g_free(batch.cmds);
> +    g_free(batch.cons);
> +
>      trace_smmuv3_cmdq_consume_out(Q_PROD(q), Q_CONS(q),
>                                    Q_PROD_WRAP(q), Q_CONS_WRAP(q));
>  
Eric

