Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9152FE7315F
	for <qemu-arm@archiver.kernel.org>; Mon,  2 Feb 2026 12:59:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vmtW8-0003kC-C4; Mon, 02 Feb 2026 07:59:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vmtW6-0003js-Sy
 for qemu-arm@nongnu.org; Mon, 02 Feb 2026 07:58:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vmtW5-0002nD-AJ
 for qemu-arm@nongnu.org; Mon, 02 Feb 2026 07:58:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1770037136;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gwCsOvDlmTGVfzqpVT8tRcjAi3G+o/i1LC0DD+x7has=;
 b=E/V+CLXhWSC5bZ41c/CXYIs2HH/r7XkwrfAu/2Q+tXa8wyOpo01UzzIAGeeeyApFu0GGjs
 619kzLg8FtU6t7lVH2jC2UFShto2yKmvIEs6HRaBxbMftN7X1/oZWU3ATM6Unc2MbL7RTJ
 Ipstjp5GV1VrBBdbbGaHGBtYzvPBuwk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-507-TBifTWe2MSK5mzYmMw4WAQ-1; Mon, 02 Feb 2026 07:58:53 -0500
X-MC-Unique: TBifTWe2MSK5mzYmMw4WAQ-1
X-Mimecast-MFC-AGG-ID: TBifTWe2MSK5mzYmMw4WAQ_1770037132
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-42fd46385c0so2562516f8f.0
 for <qemu-arm@nongnu.org>; Mon, 02 Feb 2026 04:58:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770037132; x=1770641932;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gwCsOvDlmTGVfzqpVT8tRcjAi3G+o/i1LC0DD+x7has=;
 b=uaOg25NM6gfs64eqd1pDEGO1xt7tsSu5JE0I6keGmNFRskc439vfQ4C5I1Ukw4blBa
 tEGkMEH2eveZowXF3XnL7iQnalGtnal1Mc7JTMGN+dUkzaRvJAFAh6Totf0HuQcWfgvi
 33DZq3azCq4X8j8+LRTZ1fhQ8siZ6SzwK9BIJ36n+xoSPPTFDWH3ieCqz+BKpI6Gp8j+
 2OPchLQMB+Ukyr//TLg9Yw93K9Y2fDkYphubQ+u4uZwjE6loI89xN90+JZjYMz31vOwp
 tYhQFJ4lYqFMohTPdaf3psWtMcdUinPAjHGytzr+2mHfeWACnD+VnK1FjnEpiJS7imkh
 yM6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW55EiCwDcrMI6C7xOT5mrjuV3dUSr2aYgaUQVCK+0G8bIVQf/UjNdMbZVn5Zy59JHDfWIj6lvwKQ==@nongnu.org
X-Gm-Message-State: AOJu0YyNnxsqqrD6g6RIwb72ZOTHG8/+Qs0AIKRImruBhQ/dlX6u9uWL
 q1EmjfnP0sSBTaO13fNKvt7oQ9hGIMNIby0Ibb2pp/GjQpTodmr/z8jCnIxQVj42HnU5A9ud5Qt
 7AjjUjpG+m+cXOUNd37Av7iZcdIX0amZtP1lJIMM5T5ZdUgDGLGRtCg==
X-Gm-Gg: AZuq6aIqBCmVamKrW5LmpwEcxsbmQ2Obpg3pgP3PX4PDQm442tgXFtKR85bEwHLME+A
 iKkUkEmnYdkU3R55KCG2NWsUKCHjgzK90hVQzrNYfqC0JaZ0SHheZw7j/IyMIb/pyhfH/Vi9beF
 doJoDLio8wgWBkmqjOk3uzVHDZMIiWm8roZAXmA8B9nB7rOvaV/y/3M7k8UVo7ivcxtpU+wVMZ+
 G/QCsN/CSKymeZh+W5Yw/WxxlfBcehZocHbWFkF7+rkHChpTHDpJzyndD4WipSLGuLJzvMob8bR
 ScWm4C26qe6dsbem00z1p2jFYYHonIO4FMNI5nNKaNWxB8HTmXBGljxzKID8uR/FOpTta7mJiO5
 1wsuPmIAVfyRxKpsGyzt0BkMMs+hALJJt3Nz0IEP2xrzgsdrTri9G4rPKxw==
X-Received: by 2002:a05:6000:2505:b0:435:a370:2d7a with SMTP id
 ffacd0b85a97d-435f3aafcd5mr15580017f8f.36.1770037132337; 
 Mon, 02 Feb 2026 04:58:52 -0800 (PST)
X-Received: by 2002:a05:6000:2505:b0:435:a370:2d7a with SMTP id
 ffacd0b85a97d-435f3aafcd5mr15579984f8f.36.1770037131927; 
 Mon, 02 Feb 2026 04:58:51 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e10edfccsm42139863f8f.17.2026.02.02.04.58.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Feb 2026 04:58:51 -0800 (PST)
Message-ID: <0bbdecdc-f997-4a3e-8023-f50ed629128f@redhat.com>
Date: Mon, 2 Feb 2026 13:58:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] hw/arm/smmuv3-accel: Read and propagate host
 vIOMMU events
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, nicolinc@nvidia.com, nathanc@nvidia.com,
 mochs@nvidia.com, jgg@nvidia.com, jonathan.cameron@huawei.com,
 zhangfei.gao@linaro.org, zhenzhong.duan@intel.com, kjaju@nvidia.com
References: <20260127103328.255382-1-skolothumtho@nvidia.com>
 <20260127103328.255382-5-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20260127103328.255382-5-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nFKF9Th-fJ1u8vHu4yFssLl3yZCahLunvFwXDFu4ZI0_1770037132
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

On 1/27/26 11:33 AM, Shameer Kolothum wrote:
> Install an event handler on the vEVENTQ fd to read and propagate host
> generated vIOMMU events to the guest.
>
> The handler runs in QEMU’s main loop, using a non-blocking fd registered
> via qemu_set_fd_handler().
>
> Tested-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>  hw/arm/smmuv3-accel.c | 60 +++++++++++++++++++++++++++++++++++++++++++
>  hw/arm/smmuv3-accel.h |  2 ++
>  2 files changed, 62 insertions(+)
>
> diff --git a/hw/arm/smmuv3-accel.c b/hw/arm/smmuv3-accel.c
> index e8028d4be5..ab57eae575 100644
> --- a/hw/arm/smmuv3-accel.c
> +++ b/hw/arm/smmuv3-accel.c
> @@ -390,6 +390,60 @@ bool smmuv3_accel_issue_inv_cmd(SMMUv3State *bs, void *cmd, SMMUDevice *sdev,
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
> +    ssize_t readsz = sizeof(buf);
> +    uint32_t last_seq = accel->last_event_seq;
> +    ssize_t bytes;
> +
> +    bytes = read(accel->veventq->veventq_fd, &buf, readsz);
in case we receive a header with LOST_EVENTS at the end of tail, no data
is expected. So I am not sure you will be able to handle that case. 
> +    if (bytes <= 0) {
> +        if (errno == EAGAIN || errno == EINTR) {
> +            return;
> +        }
> +        error_report("vEVENTQ: read failed (%m)");
_once?
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
> +        accel->event_start = false;
> +        accel->last_event_seq = 0;
actually I read again the include/uapi/linux/iommufd.h and nothing tells
sequence == 0 after a LOST_EVENTS. 
> +        return;
> +    }
> +
> +    /* Check sequence in hdr for lost events if any */
> +    if (accel->event_start) {
> +        uint32_t expected = (last_seq == INT_MAX) ? 0 : last_seq + 1;
> +
> +        if (buf.hdr.sequence != expected) {
But can this happen? Normally you should have a LOST_EVENTS reported by
the kernel, no?
> +            uint32_t delta;
> +
> +            if (buf.hdr.sequence >= last_seq) {
> +                delta = buf.hdr.sequence - last_seq;
> +            } else {
> +                /* Handle wraparound from INT_MAX */
> +                delta = (INT_MAX - last_seq) + buf.hdr.sequence + 1;
> +            }
> +            error_report_once("vEVENTQ: detected lost %u event(s)", delta - 1);
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
> @@ -397,6 +451,8 @@ static void smmuv3_accel_free_veventq(SMMUv3AccelState *accel)
>      if (!veventq) {
>          return;
>      }
> +    qemu_set_fd_handler(veventq->veventq_fd, NULL, NULL, NULL);
> +    close(veventq->veventq_fd);
>      iommufd_backend_free_id(accel->viommu->iommufd, veventq->veventq_id);
>      g_free(veventq);
>      accel->veventq = NULL;
> @@ -439,6 +495,10 @@ bool smmuv3_accel_alloc_veventq(SMMUv3State *s, Error **errp)
>      veventq->veventq_fd = veventq_fd;
>      veventq->viommu = accel->viommu;
>      accel->veventq = veventq;
> +
> +    /* Set up event handler for veventq fd */
> +    fcntl(veventq_fd, F_SETFL, O_NONBLOCK);
Looks this can fail.

Thanks

Eric
> +    qemu_set_fd_handler(veventq_fd, smmuv3_accel_event_read, NULL, s);
>      return true;
>  }
>  
> diff --git a/hw/arm/smmuv3-accel.h b/hw/arm/smmuv3-accel.h
> index 92048bb674..ba0f40a565 100644
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


