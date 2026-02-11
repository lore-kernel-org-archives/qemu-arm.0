Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5430E9E30D
	for <qemu-arm@archiver.kernel.org>; Wed, 11 Feb 2026 14:26:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vqBAJ-0004dJ-1x; Wed, 11 Feb 2026 09:26:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vqBAH-0004cr-3t
 for qemu-arm@nongnu.org; Wed, 11 Feb 2026 09:26:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vqBAE-0001bk-Mw
 for qemu-arm@nongnu.org; Wed, 11 Feb 2026 09:26:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1770819957;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9ivKRfshYaGNArPaVvPxFLk0igg1j/lqR7lhmpY9gbQ=;
 b=RW20gzr+aH7+HQ2cTMMP03K5vOVlL9AvvTGrz9WnHgf6f8kDRjnn6hzDHPzIyJrdjp4lWf
 nlhga5ERwzcD442KCi49JKYZUOvXtanvv/+0OR4U7RzjxI9eN0RMFU7boDeD576bjFglyo
 FC0h6mXE566A5Cxf+U3L4JUjugwR/bk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-669-pjnQXPTNPqaWsXPdbI-cZg-1; Wed, 11 Feb 2026 09:25:55 -0500
X-MC-Unique: pjnQXPTNPqaWsXPdbI-cZg-1
X-Mimecast-MFC-AGG-ID: pjnQXPTNPqaWsXPdbI-cZg_1770819954
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-4376ecafb7fso1146978f8f.2
 for <qemu-arm@nongnu.org>; Wed, 11 Feb 2026 06:25:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770819954; x=1771424754;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9ivKRfshYaGNArPaVvPxFLk0igg1j/lqR7lhmpY9gbQ=;
 b=c2jpqym70GngCN7JuDCe5aO+sGObYCEVEwJK4zB/m1DCOYW9d8DHCbqsd8lAuZXB1j
 +gFotBMm7L8NkijBdMszmcOxsTAswAvIL2PQMM4mFomrQpyGq1OxQ5eA3SCQkbW0qX3/
 pKYhlO5hEHFt1yZgIe/YBOSobXOoj2yN1IxqHdjSvuycmsRft86+7P0jFxJMmKwZVyZ5
 4hYfiZSty0bTJhYnTZW+81954Pm9RgKwjqtY98qYImyG+HWVRWfSH34i3Dpk50iQaLzd
 Dsu8xlH8NKtCr2okgbk8dNI9mX3zl8aDe0Ai8kPv6KQFaFhRxcM5wdhGDem74zaYLRXU
 Ke6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQqBFMh2eni7oPrsdfqmaS6SLK1epw2oD8SO4jnAVH0xj2IUVpUSCf10BSAEPuR1pWbqflByL+Eg==@nongnu.org
X-Gm-Message-State: AOJu0YyeKLlD6M4yESlcEK9TPSCl0ZhsE0Py+HzKLkPP2VpR/Lg2Kjh1
 s4KRyWoX6N070vizQxQuvNUt6S99L6dgbe2CR5AaHFzFoKSORap70vrNi10AZhXrW8rkakyBkDW
 HSPX+dBiXo4E08njTIyvlMW8o8sj13RiKdRdD2YL3ptf27wpbGO92rw==
X-Gm-Gg: AZuq6aLejg/BvCU5ym7XpfSmm5+ZqjYvzQ70C9qL8jTGL7974JqfQA8NRRsHWm9p+Me
 0tbiwtbVVaZSWzzayIKCYtJEk/Mg9tzlQ09v5AeVlMkudPqlsBBA/JL/spUuxd8S/wRPMvoqMnf
 CtfbteiF5ucij7LLoUyHF5R4phL9UW3Q+grBUz/niv+jO3Gsg0434SDWPODgoh8Ro/dgO/t9hMF
 XSXoSTdf3+UVgx02tQZmxzZ4TZ9JBq3L95AB0yuzu7b8A9+OuUt+QZ/7si9sYuw1XFPPDhCymjt
 WHKktSrQRZeYD3+t9DhL8fly/DU1guYkRd1xMVWuLoEc111KEi9NgsH+LY1pTWHiKOTUtApDCZF
 tMhKfzQnSUVlUAO969Qh7jKGlCHwRzga2R9QtmBGrz8/KdLuGJcYo6W0Y+yNX/LCFCXDFFA==
X-Received: by 2002:a05:6000:2c02:b0:436:14d2:5414 with SMTP id
 ffacd0b85a97d-43629385637mr26431038f8f.55.1770819954431; 
 Wed, 11 Feb 2026 06:25:54 -0800 (PST)
X-Received: by 2002:a05:6000:2c02:b0:436:14d2:5414 with SMTP id
 ffacd0b85a97d-43629385637mr26430981f8f.55.1770819953945; 
 Wed, 11 Feb 2026 06:25:53 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43783e38e26sm4930169f8f.26.2026.02.11.06.25.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Feb 2026 06:25:53 -0800 (PST)
Message-ID: <275ab451-4c37-4a78-bf5b-a76329bbf873@redhat.com>
Date: Wed, 11 Feb 2026 15:25:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] hw/arm/smmuv3-accel: Read and propagate host
 vIOMMU events
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, nicolinc@nvidia.com, nathanc@nvidia.com,
 mochs@nvidia.com, jan@nvidia.com, jgg@nvidia.com,
 jonathan.cameron@huawei.com, zhangfei.gao@linaro.org,
 zhenzhong.duan@intel.com, kjaju@nvidia.com
References: <20260211083415.133534-1-skolothumtho@nvidia.com>
 <20260211083415.133534-6-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260211083415.133534-6-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: y8_2sOby7WvDwNtlT0Ygg8eSZlQ9r_SuqcXKh-HEKnw_1770819954
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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

On 2/11/26 9:34 AM, Shameer Kolothum wrote:
> Install an event handler on the vEVENTQ fd to read and propagate host
> generated vIOMMU events to the guest.
>
> The handler runs in QEMU's main loop, using a non-blocking fd registered
> via qemu_set_fd_handler().
>
> Tested-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>  hw/arm/smmuv3-accel.c | 62 +++++++++++++++++++++++++++++++++++++++++++
>  hw/arm/smmuv3-accel.h |  2 ++
>  2 files changed, 64 insertions(+)
>
> diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
> index d92fcb1a89..0d5dcef941 100644
> --- a/hw/arm/smmuv3-accel.c
> +++ b/hw/arm/smmuv3-accel.c
> @@ -390,6 +390,48 @@ bool smmuv3_accel_issue_inv_cmd(SMMUv3State *bs, void *cmd, SMMUDevice *sdev,
>                     sizeof(Cmd), &entry_num, cmd, errp);
>  }
>  
> +static void smmuv3_accel_event_read(void *opaque)
> +{
> +    SMMUv3State *s = opaque;
> +    SMMUv3AccelState *accel = s->s_accel;
> +    struct {
> +        struct iommufd_vevent_header hdr;
> +        struct iommu_vevent_arm_smmuv3 vevent;
> +    } buf;
> +    uint32_t last_seq = accel->last_event_seq;
> +    ssize_t bytes;
> +
> +    bytes = read(accel->veventq->veventq_fd, &buf, sizeof(buf));
> +    if (bytes <= 0) {
> +        if (errno == EAGAIN || errno == EINTR) {
> +            return;
> +        }
> +        error_report_once("vEVENTQ: read failed (%m)");
> +        return;
> +    }
> +
> +    if (bytes == sizeof(buf.hdr) &&
> +        (buf.hdr.flags & IOMMU_VEVENTQ_FLAG_LOST_EVENTS)) {
> +        error_report_once("vEVENTQ has lost events");
in case in the future we end up with several vEVENTQs, it may be
relevant to log the queue id/type

After reading the linux uapi again, this seems to record a queue
overflow. I would replace the 

"vEVENTQ has lost events" trace by "queue <type> <id> has overflowed". This would allow differentiation with the case below.

> +        accel->event_start = false;
> +        return;
> +    }
> +    if (bytes < sizeof(buf)) {
> +        error_report_once("vEVENTQ: incomplete read (%zd/%zd bytes)",
> +                          bytes, sizeof(buf));
> +        return;
> +    }
> +
> +    /* Check sequence in hdr for lost events if any */
> +    if (accel->event_start && (buf.hdr.sequence - last_seq != 1)) {
wonder if we need to handle any hypothetical wrap-up situation?
> +        error_report_once("vEVENTQ: detected lost %u event(s)",
> +                          buf.hdr.sequence - last_seq - 1);
> +    }
> +    accel->last_event_seq = buf.hdr.sequence;
> +    accel->event_start = true;
> +    smmuv3_propagate_event(s, (Evt *)&buf.vevent);
> +}
> +
>  static void smmuv3_accel_free_veventq(SMMUv3AccelState *accel)
>  {
>      IOMMUFDVeventq *veventq = accel->veventq;
> @@ -397,6 +439,7 @@ static void smmuv3_accel_free_veventq(SMMUv3AccelState *accel)
>      if (!veventq) {
>          return;
>      }
> +    qemu_set_fd_handler(veventq->veventq_fd, NULL, NULL, NULL);
>      close(veventq->veventq_fd);
>      iommufd_backend_free_id(accel->viommu->iommufd, veventq->veventq_id);
>      g_free(veventq);
> @@ -424,6 +467,7 @@ bool smmuv3_accel_alloc_veventq(SMMUv3State *s, Error **errp)
>      IOMMUFDVeventq *veventq;
>      uint32_t veventq_id;
>      uint32_t veventq_fd;
> +    int flags;
>  
>      if (!accel || !accel->viommu) {
>          return true;
> @@ -445,12 +489,30 @@ bool smmuv3_accel_alloc_veventq(SMMUv3State *s, Error **errp)
>          return false;
>      }
>  
> +    flags = fcntl(veventq_fd, F_GETFL);
> +    if (flags < 0) {
> +        error_setg_errno(errp, errno, "Failed to get flags for vEVENTQ fd");
> +        goto free_veventq;
> +    }
> +    if (fcntl(veventq_fd, F_SETFL, flags | O_NONBLOCK) < 0) {
> +        error_setg_errno(errp, errno, "Failed to set O_NONBLOCK on vEVENTQ fd");
> +        goto free_veventq;
> +    }
> +
>      veventq = g_new(IOMMUFDVeventq, 1);
>      veventq->veventq_id = veventq_id;
>      veventq->veventq_fd = veventq_fd;
>      veventq->viommu = accel->viommu;
>      accel->veventq = veventq;
> +
> +    /* Set up event handler for veventq fd */
> +    qemu_set_fd_handler(veventq_fd, smmuv3_accel_event_read, NULL, s);
>      return true;
> +
> +free_veventq:
> +    close(veventq_fd);
> +    iommufd_backend_free_id(accel->viommu->iommufd, veventq_id);
> +    return false;
>  }
>  
>  static bool
> diff --git a/hw/arm/smmuv3-accel.h b/hw/arm/smmuv3-accel.h
> index dba6c71de5..c9c10e55c3 100644
> --- a/hw/arm/smmuv3-accel.h
> +++ b/hw/arm/smmuv3-accel.h
> @@ -23,6 +23,8 @@
>  typedef struct SMMUv3AccelState {
>      IOMMUFDViommu *viommu;
>      IOMMUFDVeventq *veventq;
> +    uint32_t last_event_seq;
> +    bool event_start;
>      uint32_t bypass_hwpt_id;
>      uint32_t abort_hwpt_id;
>      QLIST_HEAD(, SMMUv3AccelDevice) device_list;
Thanks

Eric


