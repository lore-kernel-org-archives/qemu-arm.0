Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31CDFD3B9A9
	for <qemu-arm@archiver.kernel.org>; Wed, 10 Dec 2025 08:19:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vTFPv-0004z2-Lq; Wed, 10 Dec 2025 03:19:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vTFPu-0004yd-0v
 for qemu-arm@nongnu.org; Wed, 10 Dec 2025 03:19:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vTFPs-0006ZA-Ef
 for qemu-arm@nongnu.org; Wed, 10 Dec 2025 03:19:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1765354755;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y7c4O1CFz6Da9sMbw+OuGreQFXF89EzxMwuXqC8efuQ=;
 b=UQYJAcSRHJ7UzRZ3CtLe0T4JHJ1SnoxO/1N4/0rCiSJ7kpUo05KZhssdnN7dyzY2zajEmG
 mAnAF9Yac/6YAQ11BYCdhDPzKMwPTH2dXHt/2AEiSvfMKSLNa/L6dOBzcIqQwMUA7VFnBf
 EYFVdjJmj81eCBkFBSXrOLij0+1JvfA=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-45-WuUU3bnVMt-l0uhZKChKJw-1; Wed, 10 Dec 2025 03:19:14 -0500
X-MC-Unique: WuUU3bnVMt-l0uhZKChKJw-1
X-Mimecast-MFC-AGG-ID: WuUU3bnVMt-l0uhZKChKJw_1765354752
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-29845b18d1aso120839375ad.1
 for <qemu-arm@nongnu.org>; Wed, 10 Dec 2025 00:19:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765354752; x=1765959552;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y7c4O1CFz6Da9sMbw+OuGreQFXF89EzxMwuXqC8efuQ=;
 b=UppAclGVNCUjpHd+9aK+8LqepGwxpss1FvbjMNtbbRAa7LQTzj6MjZudL2eBrnJwUU
 2iSsegaWoWMjAjLS9zbhwApZXaHqplZz/1/jZ6E3zVCnnNJb6pukZ2p2zInFnlSxJByt
 7B8j09o8unKxdafq6dmKo3ZQaAZklpjojEg+spk8D9h4Zd6PM0vLJpOBWnhz42D/57Wh
 zjuSschuqdeowMlrDIb+6v6ac9GpuBzP6y+en57g3yMeKkysYZZSJI70RIfDoONiroeI
 HNdKluimtLwoQOEZKZ1ELSfFbOPHGt/5bmVPHcdtohDz0wRXPszJbtadvNquWD7Gf4yq
 KfjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4lWorbrtwEr/QBIhGV5AFFrKYVTgfR5/UWPr4cd8t/bQipjczFBynPyze93r1pmNeRGUFgyAYow==@nongnu.org
X-Gm-Message-State: AOJu0YxP+kM9/99tkvjsbRY3aCLmrUUM5EQACQqAb4/u50vjegCa351L
 y3O/nK2T3Ngc5AV09+qv/YdAweBN+KfXTXhnb7wm6te/dsp8UU21jepGfoG5Q843ilMW3Xr9UZR
 5x+g/y+tpbLfOZyupcVKqsPTAJfloX3wDdHpWa9Doar2RVtt7oapWVg==
X-Gm-Gg: ASbGnct+oRdKBBM005DnSUOe+dRokwjA/lEOrQYynZAEsqlFGymtvLU3e2Wtkd0QdO/
 yB2pOHn+Szu3dsaWKcInhmBB2Ecdi3wcV/o6rNORF5VO6N8fcCqM2f68SEN1XcCGB2E3q/kijCk
 r++O1IfJyWBFrl++P+zL4mt4RyFjO2gbGzoy1rjxhNwzeowlAOWgCBwbVKO2mCd2WWgaaTpYkvf
 BeAv5X6I5J4Hdpfjb9C6sPyK0Jr5QyHwCYXxHmLs87D6Zf5Hr98wVbsN6uyp3hGNaFTnSbwmug2
 OrL5fTdecKJpJFFypluEvpu0FUV4KIWkB6/wDlgVA9w8IIy0j2/T8W2Nc6FO7/j40CVnH4ka5uE
 jfHiAq+hcpUsu4t2QaSCvxWOfeDS1u09+fTsrGK8yahPu0ct7LvfqdWEYaA==
X-Received: by 2002:a05:7022:327:b0:119:e569:f262 with SMTP id
 a92af1059eb24-11f2967ddc2mr1369284c88.11.1765354751729; 
 Wed, 10 Dec 2025 00:19:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG3fDm+erqLghjvkd9uLSUvTgrGwTLac/g1o9r7eQslpRr4k+VELFU7XpRXt6SDhU+WkRxtzA==
X-Received: by 2002:a05:7022:327:b0:119:e569:f262 with SMTP id
 a92af1059eb24-11f2967ddc2mr1369264c88.11.1765354751176; 
 Wed, 10 Dec 2025 00:19:11 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-11df76e2f3csm73807930c88.5.2025.12.10.00.19.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Dec 2025 00:19:10 -0800 (PST)
Message-ID: <0bdf282e-97b7-4942-966e-c8d8a394012b@redhat.com>
Date: Wed, 10 Dec 2025 09:19:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] hw/arm/smmuv3-accel: Read and propagate host
 vIOMMU events
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, nicolinc@nvidia.com, nathanc@nvidia.com,
 mochs@nvidia.com, jgg@nvidia.com, jonathan.cameron@huawei.com,
 zhangfei.gao@linaro.org, zhenzhong.duan@intel.com, kjaju@nvidia.com
References: <20251204092245.5157-1-skolothumtho@nvidia.com>
 <20251204092245.5157-5-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20251204092245.5157-5-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tJG6f6DnmqpZldw5DeHVHpdDkbnGZ7a9uUboHlogI1U_1765354752
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Hi Shameer,

On 12/4/25 10:22 AM, Shameer Kolothum wrote:
> Install an event handler on the vEVENTQ fd to read and propagate host
> generated vIOMMU events to the guest.
>
> The handler runs in QEMU’s main loop, using a non-blocking fd registered
> via qemu_set_fd_handler().
is it future proof to do that in the main loop?
>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>  hw/arm/smmuv3-accel.c | 58 +++++++++++++++++++++++++++++++++++++++++++
>  hw/arm/smmuv3-accel.h |  2 ++
>  2 files changed, 60 insertions(+)
>
> diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
> index 74f0be3731..d320c62b04 100644
> --- a/hw/arm/smmuv3-accel.c
> +++ b/hw/arm/smmuv3-accel.c
> @@ -378,6 +378,58 @@ bool smmuv3_accel_issue_inv_cmd(SMMUv3State *bs, void *cmd, SMMUDevice *sdev,
>                     sizeof(Cmd), &entry_num, cmd, errp);
>  }
>  
> +static void smmuv3_accel_event_read(void *opaque)
So if I understand correctly this handler is called for every
header/data. There cannot be several of them to be consumed in the queue?
> +{
> +    SMMUv3State *s = opaque;
> +    SMMUv3AccelState *accel = s->s_accel;
> +    struct {
> +        struct iommufd_vevent_header hdr;
> +        struct iommu_vevent_arm_smmuv3 vevent;
> +    } buf;
> +    ssize_t readsz = sizeof(buf);
> +    uint32_t last_seq = accel->last_event_seq;
> +    ssize_t bytes;
> +
> +    bytes = read(accel->veventq->veventq_fd, &buf, readsz);
> +    if (bytes <= 0) {
> +        if (errno == EAGAIN || errno == EINTR) {
> +            return;
> +        }
> +        error_report("vEVENTQ: read failed (%s)", strerror(errno));
nit you can use %m directly
> +        return;
> +    }
> +
> +    if (bytes < readsz) {
> +        error_report("vEVENTQ: incomplete read (%zd/%zd bytes)", bytes, readsz);
> +        return;
> +    }
> +
> +    if (buf.hdr.flags & IOMMU_VEVENTQ_FLAG_LOST_EVENTS) {
> +        error_report("vEVENTQ has lost events");
once you get a lost_event, don't you need to reset the last_event_seq,
event_start to be able to consume again? 
> +        return;
> +    }
> +
> +    /* Check sequence in hdr for lost events if any */
> +    if (accel->event_start) {
> +        uint32_t expected = (last_seq == INT_MAX) ? 0 : last_seq + 1;
> +
> +        if (buf.hdr.sequence != expected) {
> +            uint32_t delta;
> +
> +            if (buf.hdr.sequence >= last_seq) {
> +                delta = buf.hdr.sequence - last_seq;
> +            } else {
> +                /* Handle wraparound from INT_MAX */
> +                delta = (INT_MAX - last_seq) + buf.hdr.sequence + 1;
> +            }
> +            error_report("vEVENTQ: detected lost %u event(s)", delta - 1);
do we want to report all losses or just warn once?
> +        }
> +    }
> +    accel->last_event_seq = buf.hdr.sequence;
> +    accel->event_start = true;
> +    smmuv3_propagate_event(s, (Evt *)&buf.vevent);
> +}
> +
>  static void smmuv3_accel_free_veventq(SMMUv3AccelState *accel)
>  {
>      IOMMUFDVeventq *veventq = accel->veventq;
> @@ -385,6 +437,8 @@ static void smmuv3_accel_free_veventq(SMMUv3AccelState *accel)
>      if (!veventq) {
>          return;
>      }
> +    qemu_set_fd_handler(veventq->veventq_fd, NULL, NULL, NULL);
> +    close(veventq->veventq_fd);
>      iommufd_backend_free_id(accel->viommu.iommufd, veventq->veventq_id);
>      g_free(veventq);
>      accel->veventq = NULL;
> @@ -427,6 +481,10 @@ bool smmuv3_accel_alloc_veventq(SMMUv3State *s, Error **errp)
>      veventq->veventq_fd = veventq_fd;
>      veventq->viommu = &accel->viommu;
>      accel->veventq = veventq;
> +
> +    /* Set up event handler for veventq fd */
> +    fcntl(veventq_fd, F_SETFL, O_NONBLOCK);
> +    qemu_set_fd_handler(veventq_fd, smmuv3_accel_event_read, NULL, s);
>      return true;
>  }
>  
> diff --git a/hw/arm/smmuv3-accel.h b/hw/arm/smmuv3-accel.h
> index 7b0f585769..2c7c30d6a0 100644
> --- a/hw/arm/smmuv3-accel.h
> +++ b/hw/arm/smmuv3-accel.h
> @@ -21,6 +21,8 @@
>  typedef struct SMMUv3AccelState {
>      IOMMUFDViommu viommu;
>      IOMMUFDVeventq *veventq;
> +    uint32_t last_event_seq;
> +    bool event_start;
>      uint32_t bypass_hwpt_id;
>      uint32_t abort_hwpt_id;
>      QLIST_HEAD(, SMMUv3AccelDevice) device_list;
Thanks

Eric


